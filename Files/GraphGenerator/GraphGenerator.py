# GraphGenerator by WarCats (Version 1.0.1) for .csv files

# Параметры, читаемые из файла:

# 1) TimeSinceMark (Время)
# 2) CurrentStage (X)
# 3) AltitudeASL (X)
# 4) DownRange (X)
# 5) SpeedSurface (Скорость относительно Земли)
# 6) SpeedOrbital (Орбитальная скорость)
# 7) Mass (Масса)
# 8) Acceleration (Ускорение) 
# 9) Q (Удельная теплоемкость)
# 10) AoA (X)
# 11) AoS (X)
# 12) AoD (X)
# 13) AltitudeTrue (Высота)
# 14) Pitch (X)
# 15) GravityLosses (Гравитационные потери)
# 16) DragLosses (Потери сопротивления)
# 17) SteeringLosses (Потери управления)
# 18) DeltaVExpended (Delta-V)

# (X) - подразумевает, что данный параметр не будет использован

import matplotlib.pyplot as plt

# Вставить сюда название файла, записанного с помощью MechJeb2 (KSP mod):
file = open("../data/final.csv")

parameters = file.readline().rstrip("\n").split(",")
parameters_count = len(parameters)
data = {parameter: [] for parameter in parameters}

parameters_rus = [ ("Время", 0), 
        ("Вертикальная скорость", 4),
        ("Орбитальная скорость", 5),
        ("Масса", 6),
        ("Ускорение", 7),
        ("Удельная теплоемкость", 8),
        ("Высота", 12),
        ("Гравитационные потери", 14),
        ("Потери сопротивления", 15),
        ("Потери управления", 16),
        ("Delta-V", 17) ]

# Чтение параметров и их значений из указанного файла
for line in file:
    values = line.rstrip("\n").split(",")
    for i in range(parameters_count):
        data[parameters[i]].append(float(values[i]))
file.close()

# Ввод пользователем значений для построения графика
print(f'ВЫБЕРИТЕ 2 ПАРАМЕТРА ИЗ ПРИВЕДЕННЫХ НИЖЕ, ЧТОБЫ ПОСТРОИТЬ ГРАФИК:\n')

parameters_rus_count = len(parameters_rus)
for i in range(parameters_rus_count):
    print(f'{i + 1}) {parameters_rus[i][0]}')
print()

parameter2 = int(input("ВВЕДИТЕ ПОРЯДКОВЫЙ НОМЕР ЗАВИСИМОГО ПАРАМЕТР: ")) - 1
parameter1 = int(input("ВВЕДИТЕ ПОРЯДКОВЫЙ НОМЕР НЕЗАВИСИМОГО ПАРАМЕТР: ")) - 1
if (parameter1 <= -1) or (parameter1 >= parameters_rus_count) or \
    (parameter2 <= -1) or (parameter2 >= parameters_rus_count):
    raise ValueError("Incorrect parameters has been entered")

# Получение значений из файла
values1 = data[parameters[parameters_rus[parameter1][1]]]
values2 = data[parameters[parameters_rus[parameter2][1]]]

# Построение графика
plt.plot(values1, values2)

# Вставить сюда название для графика:
plt.title(f'Название графика')
plt.xlabel(parameters_rus[parameter1][0])
plt.ylabel(parameters_rus[parameter2][0])

# Сохранение графика
plt.savefig('../pictures/KSP_Graphic.png')