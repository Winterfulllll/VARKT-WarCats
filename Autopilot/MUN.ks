lock Steering to PROGRADE.

print "Calculating munar angle...".
wait 10.

until CheckMunAngle
{
	wait 1.
	clearscreen.

}

set kuniverse:timewarp:warp to 0.

print "Transfer start!".

set Man_point to PROGRADE.

lock Steering to Man_point.
wait 10.
set the_mun to body("Mun").
until ORBIT:Apoapsis > the_mun:Altitude
{
	if (orbit:Apoapsis / the_mun:Altitude < 0.9) {
		lock Throttle to 1.
	} else {
		lock Throttle to 0.1.
	}	
}

set SHIP:CONTROL:PILOTMAINTHROTTLE to 0.
lock Throttle to 0. 
wait 1.

function CalculateMunAngle
{
	set A1 to (2 * body("Kerbin"):radius + body("Mun"):altitude + ship:altitude) / 2.
	set A2 to body("Kerbin"):radius + body("Mun"):altitude.
	return 180 * (1 - (A1/A2) ^ 1.5).
}

function CheckMunAngle
{
	set VecS to Ship:position - body("Kerbin"):position.
	set VecM to body("Mun"):position - body("Kerbin"):position.
	set VecHV to VXCL(ship:up:vector, ship:velocity:orbit).
	set VecSM to body("Mun"):position - Ship:position.
	set m_angle to CalculateMunAngle.
	set cur_angle to VANG(VecM,VecS).

	if (VANG(VecHV,VecSM) > 90) {
		set cur_angle to -cur_angle.
	}
	print "Munar angle: " + m_angle.
	print "Current angle: " + cur_angle.

	return ABS(cur_angle - m_angle) < 3.
}