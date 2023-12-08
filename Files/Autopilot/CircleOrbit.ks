//Циркуляризация орбиты с суборбитальной траектории.

lock throttle to 0.
PRINT "Circle started".
lock steering to retrograde.
wait until eta:periapsis < 6.
set periapsis to ship:periapsis.
wait 1.
lock throttle to 1.
wait until ship:apoapsis < periapsis + 1000.
lock throttle to 0.