/datum/sprite_accessory/frills
	icon = 'modular_citadel/icons/mob/mam_frills.dmi'
	relevant_layers = list(BODY_ADJ_LAYER)
	mutant_part_string = "frills"

/datum/sprite_accessory/frills/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["frills"] || H.dna.features["frills"] == "None" || H.head && (H.head.flags_inv & HIDEEARS) || !HD || HD.status == BODYPART_ROBOTIC)

/datum/sprite_accessory/frills/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/frills/aquatic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/frills/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/frills/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/frills/divinity
	name = "Divinity"
	icon_state = "divinity"

/datum/sprite_accessory/frills/drake
	name = "Drake"
	icon_state = "drake"

/datum/sprite_accessory/frills/axolotl
	name = "Axolotl"
	icon_state = "axolotl"

/datum/sprite_accessory/frills/marauder
	name = "Marauder"
	icon_state = "murauder"

/datum/sprite_accessory/frills/faceguard
	name = "Faceguard"
	icon_state = "faceguard"

/datum/sprite_accessory/frills/horns
	name = "Horns"
	icon_state = "horns"

/datum/sprite_accessory/frills/hornsdouble
	name = "Horns (Double)"
	icon_state = "hornsdouble"

/datum/sprite_accessory/frills/big
	name = "Big"
	icon_state = "big"

/datum/sprite_accessory/frills/neck
	name = "Neck"
	icon_state = "neck"

/datum/sprite_accessory/frills/neckfull
	name = "Neck (Full)"
	icon_state = "neckfull"

/datum/sprite_accessory/frills/necknew
	name = "Neck (Alt)"
	icon_state = "necknew"
	color_src = MUTCOLORS
	extra = TRUE

/datum/sprite_accessory/frills/neckbig
	name = "Neck (Full Alt)"
	icon_state = "neckbig"
	color_src = MUTCOLORS
	extra = TRUE

/datum/sprite_accessory/frills/split
	name = "Split"
	icon_state = "split"

/datum/sprite_accessory/frills/droopy
	name = "Droopy"
	icon_state = "droopy"
	color_src = MUTCOLORS
	extra = TRUE

/datum/sprite_accessory/frills/frillhawk
	name = "Frillhawk"
	icon_state = "frillhawk"
	color_src = MUTCOLORS
	extra = TRUE

/datum/sprite_accessory/frills/cobrahoodears
	name = "Cobra Hood with Ears"
	icon_state = "cobraears"
	color_src = MUTCOLORS
	extra = TRUE

/datum/sprite_accessory/frills/cobrahood
	name = "Cobra Hood"
	icon_state = "cobrahood"
	color_src = MUTCOLORS
	extra = TRUE

/datum/sprite_accessory/frills/cobraslim
	name = "Cobra Hood (Slim)"
	icon_state = "cobraslim"
	color_src = MUTCOLORS
	extra = TRUE
