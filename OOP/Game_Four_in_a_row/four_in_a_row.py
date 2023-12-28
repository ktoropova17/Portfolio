import tkinter as tk
import time
from random import randint
import numpy
import math


class Menu_start:
    """класс для стартового меню"""

    def __init__(self, root):
        self.root = root
        self.size = root.geometry("800x500")
        self.bg = root.configure(background="DodgerBlue")
        self.ttl = tk.Label(self.root, text="Добро пожаловать в игру Четыре в ряд!", bg="PowderBlue",
                            fg="MidnightBlue", font="Roboto 24",
                            width=100).pack(padx=60, pady=60)
        self.button_start = tk.Button(self.root, text="СТАРТ",
                                 command=self.button_start, bg="Lime", fg="Green",
                                 font="Roboto 20 bold").pack(padx=100, pady=30)
        self.exitbutton = tk.Button(self.root, text="Выход",
                                    command=self.break_window, fg="Red",
                                    font="Roboto 20").pack(padx=100, pady=20)

    def button_start(self):
        root_2 = tk.Tk()
        g = Menu_game(root_2)
        g.draw_board()
        self.root.destroy()
        g.game_board.bind("<Button-1>", g.controlling)

    def break_window(self):
        """сворачивание окна"""
        self.root.destroy()


class Menu_end:
    """класс для создания конечного окна"""

    def __init__(self, root):
        self.root = root
        self.size = root.geometry("800x500")
        self.bg = root.configure(background="DodgerBlue")
        self.ttl = tk.Label(self.root, text="Игра окончена!", bg="PowderBlue",
                            fg="MidnightBlue", font="Roboto 24",
                            width=100).pack(padx=60, pady=40)
        self.play_again_button = tk.Button(
            self.root, text="Сыграть снова", command=self.play_again,
            bg="Lime", fg="Green", font="Roboto 15 bold").pack(padx=100, pady=30)
        self.quit_button = tk.Button(
            self.root, text="Выйти", command=self.quit_game,
            fg="Red", font="Roboto 15").pack(padx=100, pady=20)

    def play_again(self):
        """сворачивает поле и отправляет нас в стартовое меню"""
        self.root.destroy()
        root_7 = tk.Tk()
        play_again = Menu_start(root_7)

    def quit_game(self):
        """сворачивает поле"""
        self.root.destroy()


class Menu_game:
    """создание графики и логики игры"""
    WIDTH = 600
    HEIGHT = 700
    SQUARE = 100

    def __init__(self, root):
        self.root = root
        self.destroyed = False
        self.game = Game()
        self.game_board = tk.Canvas(root, width=self.WIDTH,
                                    height=self.HEIGHT, bg="DodgerBlue")
        self.game_board.pack()
        self.ai1 = AI(self.game, 1)
        self.mouse = True
        self.result = 0
        self.game_message = self.game_board.create_text(
            80, 50, fill="Snow",
            font="Roboto 20 italic bold", text="Ходите...")

    def break_game(self):
        """конец игры"""
        self.destroyed = True
        self.root.destroy()

    def draw_board(self):
        """создание игрового поля"""
        for r in range(Game.ROWS):
            for c in range(Game.COLUMNS):
                self.game_board.create_rectangle((c * 90, r * 90 + 90), ((c + 1) * 90, (r + 1) * 90 + 90),
                                                 fill='Yellow')
                self.game_board.create_oval(
                    (c * 90, r * 90 + 90), ((c + 1) * 90, (r + 1) * 90 + 90),
                    fill='Black')

    def create_circles(self):
        """создание фишек"""
        for r in range(Game.ROWS):
            for c in range(Game.COLUMNS):
                if self.destroyed:
                    return
                if self.game.board[r][c] == Game.PLAYER_1:
                    self.game_board.create_oval(
                        (c * 90, 720 - (r * 90 + 90)),
                        ((c + 1) * 90, 720 - ((r + 1) * 90 + 90)),
                        fill='Yellow')
                elif self.game.board[r][c] == Game.PLAYER_2:
                    self.game_board.create_oval(
                        (c * 90, 720 - (r * 90 + 90)),
                        ((c + 1) * 90, 720 - ((r + 1) * 90 + 90)),
                        fill='Red')

    def check_win(self):
        """проверяет кто победил и выводит победителя на экран"""
        if self.result == 1 or self.result == 2:
            for r in range(Game.ROWS):
                for c in range(Game.COLUMNS):
                    if self.game.board[r][c] == Game.PLAYER_1 and \
                            self.result == 1 and \
                            (r, c) in self.game.win_index:
                        self.game_board.create_oval(
                            (c * 90, 720 - (r * 90 + 90)), ((c + 1) * 90, 720 - (
                                    (r + 1) * 90 + 90)), outline='Blue', width=6)
                        self.game_board.delete(self.game_message)
                        self.game_board.create_text(
                            250, 50, fill="Yellow", font="Roboto 30",
                            text="Первый игрок победил!!!")
                        self.root.update()
                        time.sleep(0.20)
                    elif self.game.board[r][c] == Game.PLAYER_2 and \
                            self.result == 2 and \
                            (r, c) in self.game.win_index:
                        self.game_board.create_oval(
                            (c * 90, 720 - (r * 90 + 90)), ((c + 1) * 90, 720 - (
                                    (r + 1) * 90 + 90)), outline='Blue', width=6)
                        self.game_board.delete(self.game_message)
                        self.game_board.create_text(
                            250, 50, fill="Red", font="Roboto 30",
                            text="Второй игрок победил!!!")
                        self.root.update()
                        time.sleep(0.20)

    def controlling(self, event):
        """управление игрой"""
        column = event.x
        if not self.game.game:
            self.result = self.game.make_move(math.floor(column / 100))
            self.create_circles()
            self.root.update()
            self.check_win()
        if self.result == 1 or self.result == 2:
            self.check_win()
            self.break_game()
            root_6 = tk.Tk()
            final_screen = Menu_end(root_6)
            root_6.update()

    def connect(self):
        """связь между действиями игрока и игровым полем"""
        self.game.create_board()


class AI:
    """управление игрой"""
    def __init__(self, game, player):
        self.game = game
        self.player = player
        self.move = randint(0, 6)

    def find_free_cell(self, timeout=None):
        """выбор случайной ячейки на поле и вставка фишки в ячейку"""
        self.move = randint(0, 6)
        return self.move

    def get_last_free_move(self):
        return self.move


class Game:
    ROWS = 6
    COLUMNS = 6
    PLAYER_1 = 1
    PLAYER_2 = 2

    def __init__(self):
        self.player_1 = 1
        self.player_2 = 2
        self.board = self.create_board()
        self.turn = 0
        self.game = False
        self.counter = 0
        self.legal_move = 1
        self.win_index = []

    def create_board(self):
        """создание игрового поля"""
        board = numpy.zeros((self.ROWS, self.COLUMNS))
        return board

    def make_move(self, column):
        """метод, который проверяет выбранный столбец, куда игрок хочет
        поместить фишку, если колонка заполнена, находится за пределами поля
        или игра закончилась, получаемм исключение"""
        try:
            if 6 < column or column < 0 or self.full_column(column):
                raise Exception("Неверный шаг")
            else:
                if self.game is False:
                    player = self.who_starts()
                    row = self.find_free_row(column)
                    self.counter += 1
                    if player == 1 and self.legal_move == 1:
                        self.change_color(row, column, player)
                        result = self.who_winner()
                        self.turn += 1
                        return result
                    elif player == 2 and self.legal_move == 1:
                        row = self.find_free_row(column)
                        self.change_color(row, column, player)
                        result = self.who_winner()
                        self.turn += 1
                        return result
                    else:
                        return -1
        except Exception as e:
            return -1

    def full_column(self, column):
        """метод, который возвращает True, если ячейка в столбце заполнена
        или False, если ячейка пустая"""
        board = self.board
        if self.board[(self.ROWS) - 1][column] == 1 or \
                self.board[(self.ROWS) - 1][column] == 2:
            return True
        else:
            return False

    def find_free_row(self, column):
        """метод, который проверяет, где свободный ряд и куда игрок может поместить фишку"""
        for i in range(self.ROWS):
            if self.board[i][column] == 0:
                return i

    def change_color(self, row, column, color):
        self.board[row][column] = color

    def who_winner(self):
        """метод, который определяет победителя"""
        player = self.who_starts()
        for i in range(self.ROWS):
            for j in range(self.COLUMNS - 3):
                if self.board[i][j] == player and \
                        self.board[i][j + 1] == player and \
                        self.board[i][j + 2] == player and \
                        self.board[i][j + 3] == player:
                    self.legal_move = 0
                    self.game = True
                    for k in range(4):
                        self.win_index.append((i, j + k))
                    return self.who_starts()
        for i in range(self.ROWS - 3):
            for j in range(self.COLUMNS):
                if self.board[i][j] == player and \
                        self.board[i + 1][j] == player and \
                        self.board[i + 2][j] == player and \
                        self.board[i + 3][j] == player:
                    self.legal_move = 0
                    self.game = True
                    for k in range(4):
                        self.win_index.append((i + k, j))
                    return self.who_starts()
        for i in range(self.ROWS - 3):
            for j in range(self.COLUMNS - 3):
                if self.board[i][j] == player and \
                        self.board[i + 1][j + 1] == player and \
                        self.board[i + 2][j + 2] == player and \
                        self.board[i + 3][j + 3] == player:
                    self.legal_move = 0
                    self.game = True
                    for k in range(4):
                        self.win_index.append((i + k, j + k))
                    return self.who_starts()
        for i in range(3, self.ROWS):
            for j in range(self.COLUMNS - 3):
                if self.board[i][j] == player and \
                        self.board[i - 1][j + 1] == player and \
                        self.board[i - 2][j + 2] == player and \
                        self.board[i - 3][j + 3] == player:
                    self.legal_move = 0
                    self.game = True
                    for k in range(4):
                        self.win_index.append((i - k, j + k))
                    return self.who_starts()
        if self.counter == (self.ROWS * self.COLUMNS):
            self.legal_move = 0
            self.game = True
            return 0

    def which_player_at(self, row, col):
        """метод, который проверяет чья фишка находится в ячейке,
        или возвращает None, если ячейка пустая"""
        try:
            if row not in range(6) or col not in range(6):
                raise Exception("Неверное положение")
            else:
                if self.board[row][col] == 1:
                    return 1
                elif self.board[row][col] == 2:
                    return 2
                elif self.board[row][col] == 0:
                    return None
        except Exception as e:
            return -1

    def who_starts(self):
        """метод, который выбирает, кто начинает играть"""
        if self.turn % 2 == 0:
            return 1
        else:
            return 2


if __name__ == '__main__':
    root_1 = tk.Tk()
    a = Menu_start(root_1)
    root_1.mainloop()