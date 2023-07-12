/obj/machinery/computer/helm
	name = "shuttle control console"
	icon = 'icons/obj/computer.dmi'
	icon_keyboard = "atmos_key"
	icon_screen = "shuttle"
	circuit = null

	var/ui_template = "Helm"


/obj/machinery/computer/helm/attack_hand(user as mob)
	if(..(user))
		return
	if(!allowed(user))
		to_chat(user, "<span class='warning'>Access Denied.</span>")
		return 1

	ui_interact(user)

/obj/machinery/computer/helm/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = TRUE, datum/tgui/master_ui = null)
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
