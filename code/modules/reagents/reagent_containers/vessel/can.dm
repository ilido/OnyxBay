
/obj/item/reagent_containers/vessel/can
	name = "tin can"
	desc = "It opens, but never closes."
	matter = list(MATERIAL_STEEL = 500)
	volume = 45 //just over one and a half cups
	amount_per_transfer_from_this = 5
	atom_flags = 0 //starts closed
	lid_type = /datum/vessel_lid/can
	icon = 'icons/obj/reagent_containers/cans.dmi'
	force = 6.0
	mod_weight = 0.65
	mod_reach = 0.25
	mod_handy = 0.5
	unacidable = FALSE
	var/trash = null
	var/shaked_up = FALSE

/obj/item/reagent_containers/vessel/can/verb/shake()
    set name = "Shake"
    set category = "Object"
    set src in usr

    if(!istype(usr.get_active_hand(), src))
        to_chat(usr, SPAN("warning", "You need to hold \the [src] in hands!"))
        return

    if(is_open_container())
        reagents.splash(usr, reagents.total_volume)
        visible_message(SPAN("warning", "The [usr] shakes the [src], but its contents spills out onto the floor"))
        return
    else
        visible_message(SPAN("warning", "[usr] shakes the [src]"))
        shaked_up = TRUE
        calmdowntime()
        return

/obj/item/reagent_containers/vessel/can/proc/calmdowntime()
	if(shaked_up)
		addtimer(CALLBACK(src, .proc/calmdown, shaked_up), 4200)
	return

/obj/item/reagent_containers/vessel/can/proc/calmdown(shaked_up)
	if(!shaked_up)
		return
	shaked_up = FALSE

/obj/item/reagent_containers/vessel/can/attack_self(mob/user)
	if((!reagents || !reagents.total_volume) && trash && user.a_intent != I_HELP)
		if(!ispath(trash, /obj/item/trash/cans))
			return ..()
		to_chat(user, SPAN("notice", "You crush \the [src]."))
		playsound(user.loc, pick('sound/items/cancrush1.ogg', 'sound/items/cancrush2.ogg'), 50, 1)
		var/obj/item/trash/cans/TrashItem = new trash(get_turf(user))
		if(user.a_intent == I_HURT)
			TrashItem.icon_state = "[TrashItem.base_state]2" // Yeah it's ugly but I dont care; I don't wanna make separate types for v-crushed and h-crushed cans nor write an extra proc
		else
			TrashItem.icon_state = TrashItem.base_state
		user.replace_item(src, TrashItem, TRUE, TRUE)
	else
		return ..()
