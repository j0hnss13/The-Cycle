/datum/sprite_accessory/horns
	icon = 'modular_citadel/icons/mob/mam_horns.dmi'
	color_src = HORNCOLOR
	relevant_layers = list(HORNS_LAYER)

/datum/sprite_accessory/horns/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["horns"] || H.dna.features["horns"] == "None" || H.head && (H.head.flags_inv & HIDEHAIR) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEHAIR)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/horns/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/horns/angler
	name = "Angler"
	icon_state = "angler"
	color_src = MUTCOLORS

/datum/sprite_accessory/horns/antler
	name = "Antlers (Big)"
	icon_state = "antlers"

/datum/sprite_accessory/horns/smallantler
	name = "Antlers (Small)"
	icon_state = "smallantlers"

/datum/sprite_accessory/horns/antlersshort
	name = "Antlers (Short)"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "antlers_short"

/datum/sprite_accessory/horns/wideantler
	name = "Antlers (Wide)"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "antlerswide"

/datum/sprite_accessory/horns/jackalope
	name = "Jackalope"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "jackalope"

/datum/sprite_accessory/horns/antlersmore
	name = "Antlers (More)"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "antlers_more"

/datum/sprite_accessory/horns/antlerslarge
	name = "Antlers (Large)"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "antlers_large"

/datum/sprite_accessory/horns/antlersregal
	name = "Antlers (Regal)"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "antlers_regal"

/datum/sprite_accessory/horns/antlersmonarch
	name = "Antlers (Monarch)"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "antlers_monarch"

/datum/sprite_accessory/horns/cryptid
	name = "Antlers (Cryptid)"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "cryptid"

/datum/sprite_accessory/horns/analyticalantlers
	name = "Analytical Antlers"
	icon_state = "analyticalantlers"

/datum/sprite_accessory/horns/billberry
	name = "Billberry"
	icon_state = "billberry"

/datum/sprite_accessory/horns/curled
	name = "Curled"
	icon_state = "curled"

/datum/sprite_accessory/horns/curledback
	name = "Curled Back"
	icon_state = "bunhorns"

/datum/sprite_accessory/horns/curlyhorns
	name = "Curly"
	icon_state = "curlyhorn"

/datum/sprite_accessory/horns/deathclaw
	name = "Deathclaw"
	icon_state = "deathclaw"

/datum/sprite_accessory/horns/deathclawinverted
	name = "Deathclaw (Inverted)"
	icon_state = "deathclawinverted"

/datum/sprite_accessory/horns/demon
	name = "Demon"
	icon_state = "demon"

/datum/sprite_accessory/horns/dragonhornsalt
	name = "Dragon"
	icon_state = "dragonhorns"

/datum/sprite_accessory/horns/longdragon
	name = "Dragon (Inverted)"
	icon_state = "dragonforward"

/datum/sprite_accessory/horns/faceguard
	name = "Faceguard"
	icon_state = "faceguard"

/datum/sprite_accessory/horns/greathorns
	name = "Greathorns"
	icon_state = "greathorns"

/datum/sprite_accessory/horns/guilmon
	name = "Guilmon"
	icon_state = "guilmon"

/datum/sprite_accessory/horns/halo
	name = "Halo"
	icon_state = "halo"

/datum/sprite_accessory/horns/lifted
	name = "Lifted"
	icon_state = "lifted"

/datum/sprite_accessory/horns/biglizard
	name = "Lizard"
	icon_state = "biglizard"

/datum/sprite_accessory/horns/marauder
	name = "Marauder"
	icon_state = "murauder"

/datum/sprite_accessory/horns/outstretched
	name = "Outstretched"
	icon_state = "outstretched"

/datum/sprite_accessory/horns/ram
	name = "Ram"
	icon_state = "ram"

/datum/sprite_accessory/horns/ram2
	name = "Ram (Alt)"
	icon_state = "ram2"

/datum/sprite_accessory/horns/newram
	name = "Ram (Alt 2)"
	icon_state = "newram"

/datum/sprite_accessory/horns/curledramhorns
	name = "Ram (Curled)"
	icon_state = "shcurled"

/datum/sprite_accessory/horns/curledramhornsalt
	name = "Ram (Curled Alt)"
	icon_state = "shcurleds"

/datum/sprite_accessory/horns/smallramhorns
	name = "Ram (Small)"
	icon_state = "shsmall"

/datum/sprite_accessory/horns/smallramhornsalt
	name  = "Ram (Small Alt)"
	icon_state = "shsmallalt"

/datum/sprite_accessory/horns/smallramhornsthree
	name = "Ram (Small Alt 2)"
	icon_state = "shsmall3"

/datum/sprite_accessory/horns/sheephorns
	name = "Sheep"
	icon_state = "sheephorn"

/datum/sprite_accessory/horns/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/horns/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/horns/simplealt
	name = "Simple (Alt)"
	icon_state = "newsimple"

/datum/sprite_accessory/horns/broken
	name = "Broken"
	icon_state = "newbroken"

/datum/sprite_accessory/horns/stabbers
	name = "Stabbers"
	icon_state = "stabbers"

/datum/sprite_accessory/horns/teppi
	name = "Teppi"
	icon = 'modular_citadel/icons/mob/mam_horns_32x48.dmi'
	icon_state = "teppi"

/datum/sprite_accessory/horns/unihorn
	name = "Unicorn"
	icon_state = "unihorn"

/datum/sprite_accessory/horns/upwardshorns
	name = "Upwards"
	icon_state = "upwardshorns"

/datum/sprite_accessory/horns/hollowpoint
	name = "Hollowpoint"
	icon_state = "hollowpoint"

/datum/sprite_accessory/horns/ticketrack
	name = "Ticket Rack"
	icon_state = "ticketrack"

/datum/sprite_accessory/horns/hopefulhorns
	name = "Hopeful Horns"
	icon_state = "hopefulhorns"

/datum/sprite_accessory/horns/spidersspikes
	name = "Spiders Spikes"
	icon_state = "spidersspikes"

/datum/sprite_accessory/horns/brimstone
	name = "Brimstone"
	icon_state = "brimstone"

/datum/sprite_accessory/horns/lightning
	name = "Lightning"
	icon_state = "lightning"

/datum/sprite_accessory/horns/drake
	name = "Drake"
	icon_state = "drake"

/datum/sprite_accessory/horns/antennaebent
	name = "Antennae (Bent)"
	icon_state = "antennae_bent"

/datum/sprite_accessory/horns/antennaewisteria
	name = "Antennae (Wisteria)"
	icon_state = "antennae_wisteria"

/datum/sprite_accessory/horns/sharpcrest
	name = "Sharp Crest"
	icon_state = "sharp_crest"
