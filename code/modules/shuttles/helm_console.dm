/obj/machinery/computer/helm
	name = "shuttle control console"
	icon = 'icons/obj/computer.dmi'
	icon_keyboard = "atmos_key"
	icon_screen = "shuttle"
	circuit = null

/obj/machinery/computer/helm/attack_hand(user as mob)
	tgui_interact(user)

/obj/machinery/mecha_part_fabricator/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)

	if(!ui)
		ui = new(user, src, "Helm")
		ui.open()


/obj/machinery/computer/helm/bullet_act(obj/item/projectile/Proj)
	visible_message("\The [Proj] ricochets off \the [src]!")

/obj/machinery/computer/helm/ex_act()
	return

/obj/machinery/computer/helm/emp_act()
	return
