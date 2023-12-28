import turtle

turtle.bgcolor('black')
turtle.pensize(2)
turtle.speed(0)

for i in range(6):
    for color in ('lightgray', 'plum', 'lightblue',
                  'cornflowerblue', 'hotpink', 'white',
                  'lightgreen'):
        turtle.color(color)
        turtle.circle(100)
        turtle.left(10)
turtle.hideturtle()
