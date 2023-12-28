import turtle
t = turtle.Pen()
colors = ["grey","pink"]
t.speed(0)
for x in range(450):
    t.pencolor(colors[x%2])
    t.forward(x)
    t.left(91)

