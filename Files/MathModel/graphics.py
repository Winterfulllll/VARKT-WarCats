import matplotlib.pyplot as plt

file = open("../data/data.txt")

parameters = file.readline().rstrip("\n").split(", ")
parameters_count = len(parameters)
data = {parameter: [] for parameter in parameters}

# Чтение параметров и их значений из указанного файла
for line in file:
    values = line.rstrip("\n").split(", ")
    for i in range(parameters_count):
        data[parameters[i]].append(float(values[i]))
file.close()

# Параметры указаваются в формате: "Построить зависимость ПЕРВОГО от ВТОРОГО"
parameter1, parameter2 = "Вертикальная скорость", "Время"

# Построение графика
plt.plot(data[parameter2], data[parameter1])

plt.title(f'График математической модели')
plt.xlabel(parameter2)
plt.ylabel(parameter1)

plt.savefig('../pictures/MathModel_Graphic.png')