clearscreen.
print "Запущена программа посадки...".
unlock STEERING.
SAS ON.
wait 1.
set SASMODE to "RETROGRADE".
wait until SHIP:OBT:BODY = BODY("Mun").
lock THROTTLE to 0.

lock THROTTLE to 0.
wait until SHIP:BOUNDS:BOTTOMALTRADAR < 20000.

lock THROTTLE to 1.

wait until ABS(SHIP:VERTICALSPEED) < 100.

// код сохранения скорости 
lock gg to MUN:MU / (MUN:RADIUS + SHIP:ALTITUDE) ^ 2.
until FALSE
{
    set Thr0 to gg * SHIP:MASS.
    lock THROTTLE to Thr0 / SHIP:MAXTHRUST.
    wait 0.001.

    if SHIP:BOUNDS:BOTTOMALTRADAR < 510.
    {
        break.
    }
}

wait until SHIP:BOUNDS:BOTTOMALTRADAR < 500.
lock THROTTLE to 1.
wait until ABS(SHIP:VERTICALSPEED) < 7.

until FALSE
{
    set Thr0 to gg * SHIP:MASS.
    lock THROTTLE to Thr0 / SHIP:MAXTHRUST.
    wait 0.001.
    if SHIP:BOUNDS:BOTTOMALTRADAR < 7.
    {
        break.
    }
}
wait until SHIP:BOUNDS:BOTTOMALTRADAR < 5.
lock THROTTLE to 0.25.
RCS ON.
wait until ABS(SHIP:VERTICALSPEED) < 2.

until FALSE
{
    set Thr0 to gg * SHIP:MASS.
    lock THROTTLE to Thr0 / SHIP:MAXTHRUST.
    wait 0.001.
    if SHIP:BOUNDS:BOTTOMALTRADAR < 2.
    {
        break.
    }
}
wait until SHIP:BOUNDS:BOTTOMALTRADAR < 1.
lock THROTTLE to 0.
wait 20.
SAS OFF.
RCS OFF.