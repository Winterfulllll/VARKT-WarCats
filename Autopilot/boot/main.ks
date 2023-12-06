copyPath("0:/GetApoapsis.ks", "").
copyPath("0:/GetOrbit.ks", "").
copyPath("0:/CircleOrbit.ks", "").
copyPath("0:/MUN.ks", "").
copyPath("0:/Wait.ks", "").
copyPath("0:/Landing.ks", "").
copyPath("0:/Landing2.ks", "").

clearscreen.
run GetApoapsis.ks.
lock THROTTLE to 0.
wait 30.
stage.
lock THROTTLE to 0.

run GetOrbit.ks.
lock THROTTLE to 0.
wait 5.
stage.
lock THROTTLE to 0.

run MUN.ks.
wait 30.
stage.
lock THROTTLE to 0.
wait 5.

run Landing2.ks.