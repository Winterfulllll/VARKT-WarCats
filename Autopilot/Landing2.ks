clearscreen.
print "Запущена программа посадки...".
unlock STEERING.
wait 1.

SAS ON.
wait 1.

set SASMODE to "RETROGRADE".

wait until SHIP:OBT:BODY = BODY("Mun").
wait until ship:altitude < 80000.

set H0 to 50000.
set errh to SuicideBurn(H0).

until abs(errh) < 100
{
    set H0 to H0 - errh.
    set errh to SuicideBurn(H0).
}

clearscreen.
print "H: " + H0.
print "errh: " + errh.

wait until SHIP:BOUNDS:BOTTOMALTRADAR < H0 - errh + 100.

lock throttle to 1.

wait until abs(ship:verticalspeed) < 50.

// код сохранения скорости 
LOCK gg to MUN:MU / (MUN:RADIUS + SHIP:ALTITUDE) ^ 2.
until FALSE
{
    set Thr0 to gg * SHIP:MASS.
    LOCK THROTTLE to Thr0 / SHIP:MAXTHRUST.
    wait 0.001.
    IF SHIP:BOUNDS:BOTTOMALTRADAR < 100
    {
        break.
    }
}

lock throttle to 1.

wait until abs(ship:verticalspeed) < 4.

until FALSE
{
    set Thr0 to gg * SHIP:MASS.
    LOCK THROTTLE to Thr0 / SHIP:MAXTHRUST.
    wait 0.001.
    IF SHIP:BOUNDS:BOTTOMALTRADAR < 2
    {
        break.
    }
}

lock throttle to 0.
wait 20.

SAS OFF.
print "Программа посадки посадки успешно завершила свою работу...".

function SuicideBurn {
    parameter h.

    set dt to 0.1.
    set VertSpeed to -sqrt(2 * mun:mu * ((1 / (mun:radius + h)) - (1 / (mun:radius + ship:altitude))) + ship:verticalSpeed ^ 2).
    set t to 0.1.
    set Thr to maxThrust * 1000.
    set M0 to ship:mass * 1000.
    set g0 to 9.807.
    set Isp to 340.
    set Mr to Thr / (g0 * Isp).
    print "VertSpeed: " + VertSpeed.
    wait 3.
    until VertSpeed > 0
    {
        set t to t + dt.
        set A to (Thr / (M0 - Mr * t)).
        set g to -mun:mu / (mun:radius + h) ^ 2.
        set VertSpeed to VertSpeed + (A + g) * dt.
        set h to h + VertSpeed * dt.

        clearscreen.
        print "t: " + t.
        print "h: " + h.
        print "A: " + A.
        print "M: " + (M0 - Mr * t).
        print "g: " + g.
        print "VertSpeed: " + VertSpeed.
    }
    return h.
}