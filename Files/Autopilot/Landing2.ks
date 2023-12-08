CLEARSCREEN.
PRINT "Запущена программа посадки...".
UNLOCK STEERING.
wait 1.
SAS ON.
SET SASMODE TO "RETROGRADE".
wait 1.
SET SASMODE TO "RETROGRADE".
SET SASMODE TO "RETROGRADE".
SET SASMODE TO "RETROGRADE".
WAIT UNTIL SHIP:OBT:BODY = BODY("Mun").
LEGS ON.
WAIT UNTIL ship:altitude < 2000000.

set H0 to 50000.
set errh to SuicideBurn(H0).
// Ожидаем пока погрешность будет меньше 10
until abs(errh) < 10
{
    set H0 to H0 - errh.
    set errh to SuicideBurn(H0).
}

clearScreen.
print "H: " + H0.
print "errh: " + errh.

wait until SHIP:BOUNDS:BOTTOMALTRADAR < H0.

lock throttle to 1.

wait until abs(ship:verticalspeed) < 50.

// Код сохранения скорости при посадке
LOCK gg TO MUN:MU / (MUN:RADIUS + SHIP:ALTITUDE) ^ 2.
UNTIL FALSE
{
    SET Thr0 TO gg * SHIP:MASS.
    LOCK THROTTLE TO Thr0 / SHIP:MAXTHRUST.
    WAIT 0.001.
    IF SHIP:BOUNDS:BOTTOMALTRADAR < 100
    {
        break.
    }
}

lock throttle to 1.

wait until abs(ship:verticalspeed) < 4.

UNTIL FALSE
{
    SET Thr0 TO gg * SHIP:MASS.
    LOCK THROTTLE TO Thr0 / SHIP:MAXTHRUST.
    WAIT 0.001.
    IF SHIP:BOUNDS:BOTTOMALTRADAR < 2
    {
        break.
    }
}

lock throttle to 0.
wait 20.
SAS OFF.
print "The end!".
// Функция, считающая высоту полного загашения скорости, если включить полную тягу на высоте h
function SuicideBurn {
    parameter h.

    set dt to 0.1.
    set VertSpeed to -sqrt(2 * mun:mu * ((1 / (mun:radius + h)) - (1 / (mun:radius + ship:altitude))) + ship:verticalSpeed ^ 2).  // Скорость на высоте h по выведенной формулке
    set t to 0.1.  // Изменение времени (тик)
    set Thr to maxThrust * 1000.  // Максимальная тяга в Ньютонах
    set M0 to ship:mass * 1000.  // Масса корабля в кг
    set g0 to 9.807.  // Ускорение на поверхности Кербина
    set Isp to 340.  // считается гениально по формуле(Isp нескольких двигателей), тоже записать в отчет
    set Mr to Thr / (g0 * Isp).  // Масса выброшенного топлива
    print "VertSpeed: " + VertSpeed.
    wait 3.
    until VertSpeed > 0
    {
        set t to t + dt.  // Время хуле
        set A to (Thr / (M0 - Mr * t)).  // Ускорение
        set g to -mun:mu / (mun:radius + h) ^ 2.  // Ускорение св падения на нашей высоте
        set VertSpeed to VertSpeed + (A + g) * dt.  // Скорость
        set h to h + VertSpeed * dt.  // Высота
        clearScreen.
        print "t: " + t.
        print "h: " + h.
        print "A: " + A.
        print "M: " + (M0 - Mr * t).
        print "g: " + g.
        print "VertSpeed: " + VertSpeed.
    }
    return h.
}
