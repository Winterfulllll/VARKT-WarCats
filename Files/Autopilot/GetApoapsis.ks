copyPath("0:/Wait.ks", "").

clearscreen.
run Wait.ks.
// Включить ступень, полную тягу и курс вертикально вверх
lock STEERING to HEADING(90, 90).
STAGE.
lock THROTTLE to 1.

// Поворот и управление углом наклона
print "Ожидание достижения высоты 2км".
wait until ship:altitude > 2000.
lock STEERING to HEADING(90, 80).

print "Ожидание достижения высоты 5км, поворот на 80 градусов".
wait until ship:altitude > 5000.
lock STEERING to HEADING(90, 70).

print "Ожидание достижения высоты 10км, поворот на 70 градусов".
wait until ship:altitude > 10000.
lock STEERING to HEADING(90, 60).

print "Ожидание достижения высоты 20км, поворот на 60 градусов".
wait until ship:altitude > 20000.
lock STEERING to HEADING(90, 40).

print "Понижение тяги до 0.75".
lock THROTTLE to 0.75.

print "Ожидание достижения высоты 30км, поворот на 40 градусов".
wait until ship:altitude > 30000.
lock STEERING to HEADING(90, 20).
print "Ожидание высоты в 70км, поворот на 20 градусов".

wait until stage:liquidfuel < 1.
print "1-я ступень отработала!".
WAIT 5.
lock THROTTLE to 0.
STAGE.
WAIT 20.
lock THROTTLE to 1.

print "Отделение 1й ступени прошло в штатном режиме".

wait until ship:altitude > 70000.
STAGE.
lock THROTTLE to 1.
print "Вышли за пределы орбиты Кербина, включена полная тяга двигателей".
print "Сброс обтекателя прошел в штатном режиме".
wait until ship:apoapsis > 199900.
lock THROTTLE to 0.
clearscreen.
print "АПОЦЕНТР УСТАНОВЛЕН НА 200км!".