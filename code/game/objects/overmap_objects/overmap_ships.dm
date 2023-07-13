/obj/item/overmap/ship

	name = "Generic ship"
	icon = 'icons/obj/overmap/overmap_object.dmi'
	randpixel = 0
	r_speed = 1.0

	var/fuel_amount = TRUE
	var/obj/machinery/camera/camera
	var/list/initial_coordinates
	var/id = 1

/obj/item/overmap/ship/Initialize()
	. = ..()
	camera = new /obj/machinery/camera(src)
	initial_coordinates=list(src.x,src.y,src.z)

/obj/item/overmap/ship/Destroy()
	qdel(camera)
	camera = null
	. = ..()

/obj/item/overmap/ship/proc/move(Ref, Dir, Speed)
	. = ..()
	if(fuel_amount == FALSE)
		return
	step(Ref, Dir, Speed)

/obj/item/overmap/ship/proc/camera_vision(user)
	camera.apply_visual(user)
