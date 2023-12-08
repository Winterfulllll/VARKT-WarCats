print "НАЧАЛО ВЫВОДА ПЕРИЦЕНТРА".
lock THROTTLE to 0.
lock STEERING to HEADING(90, 0).
wait until eta:apoapsis < 15.
lock THROTTLE to 1.

// Постановка перицентра на 200км
wait until ship:periapsis > 200000 or ship:apoapsis > 205000.
lock THROTTLE to 0.
print ship:periapsis + " " + ship:apoapsis.