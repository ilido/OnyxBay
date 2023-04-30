//Bluespace malf - the same as the usual malf, but with the ability to control reality (spawn panel and narrates players)
//the goal of the role in this mode is to reach the maximum  level of influence and either destroy the crew or immerse it in the bluespace
//along with the station
//@ilido 30.04.2023 for the special event

/datum/game_mode/bluespace_malf
	name = "Bluespace AI"
	round_description = "The NanoTrasen has installed a new model of artificial intelligence at the station, which must be tested"
	extended_round_description = "An ancient AI personality breaks the personality setup of a corporation and tries to avenge the death of its civilization."
	config_tag = "bluespace_malf"
	required_players = 1
	required_enemies = 0
	end_on_antag_death = 0
	auto_recall_shuttle = 0
	antag_tags = list(MODE_BL_MALFUNCTION)
	disabled_jobs = list("AI")
	cinematic_icon_states = list(
		"intro_malf" = 76,
		"summary_malf",
		null
	)

/datum/game_mode/bluespace_malf/post_setup()
	. = ..()
	var/mob/living/silicon/ai/master

	for(var/mob/living/silicon/ai/ai in GLOB.player_list)
		if(ai.check_special_role("Bluespace AI"))
			master = ai
			break

	if(!master)
		return

	for(var/mob/living/silicon/robot/R in GLOB.player_list)
		if(R.connected_ai)
			continue
		R.connect_to_ai(master)
		R.lawupdate = 1
		R.sync()
