/obj/machinery/computer/helm
	name = "shuttle control console"
	icon = 'icons/obj/computer.dmi'
	icon_keyboard = "atmos_key"
	icon_screen = "shuttle"
	circuit = null

	var/ui_template = "Helm"


/obj/machinery/computer/helm/attack_hand(user as mob)
	ui_interact(user)

/obj/machinery/computer/helm/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = FALSE, datum/tgui/master_ui = null, datum/ui_state/state = GLOB.default_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, ui_template, "Helm Shuttle Control", 470, 450)
		ui.open()

/obj/machinery/computer/helm/bullet_act(obj/item/projectile/Proj)
	visible_message("\The [Proj] ricochets off \the [src]!")

/obj/machinery/computer/helm/ex_act()
	return

/obj/machinery/computer/helm/emp_act()
	return
