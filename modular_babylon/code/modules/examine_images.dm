// Helper procs to help make sure the discord link is correct and to conver it with/without the url section.
/proc/is_valid_headshot(url)
	if (!length(url))
		return TRUE

	var/find_index = findtext(url, "https://")
	if (find_index != 1)
		to_chat(usr, span_warning("Your link must be https!"))
		return FALSE

	var/sanity_check = findtext(url, ".")
	if (!sanity_check)
		to_chat(usr, span_warning("Your link doesn't appear to be valid!"))
		return FALSE

	var/list/url_split = splittext(url, ".")
	var/extension = url_split[length(url_split)]
	var/list/valid_extensions = list("jpg", "png", "jpeg")

	if (!(extension in valid_extensions))
		to_chat(usr, span_warning("The image must be one of the following extensions: '[english_list(valid_extensions)]'"))
		return FALSE

	var/static/link_regex = regex("i.gyazo.com|files.byondhome.com|images2.imgbox.com|files.catbox.moe")

	find_index = findtext(url, link_regex)
	if(find_index != 9)
		to_chat(usr, span_warning("The image must be hosted on one of the following sites: 'Gyazo (i.gyazo.com), Byond (files.byondhome.com), Imgbox (images2.imgbox.com) or Catbox (files.catbox.moe)'"))
		return FALSE

	return TRUE

// Mob definitions!!!
/mob/living/carbon/human
	var/headshot

/mob/living/carbon/human/verb/set_headshot()
	set name = "Set Headshot"
	set category = "OOC"

	if(!client)
		return

	var/input = stripped_input(usr,"A https URL to a hosted image of your character's headshot. Must be: size 350x350px (larger images will be scaled down), a jpg/png/jpeg file, and hosted on either Gyazo (i.gyazo.com), Byondhome (files.byondhome.com), Imgbox (images2.imgbox.com) or Catbox (files.catbox.moe).")
	if(length(input) && is_valid_headshot(input))
		client.prefs.headshot = input
		client.prefs.save_character()
	else
		if(headshot)
			var/deletePicture = alert(usr, "Do you wish to remove your profile picture?", "Remove PFP", "Yes", "No")
			if(deletePicture == "Yes")
				remove_headshot()


/mob/living/carbon/human/proc/remove_headshot()
	headshot = ""
	if(client)
		client.prefs.headshot = ""
		client.prefs.save_character()

// Preference code + saving! The rest of the code is located in preferences.dm where the UI is.
/datum/preferences
	var/headshot = ""

/datum/preferences/process_link(mob/user, list/href_list)
	switch(href_list["task"])
		if("input")
			switch(href_list["preference"])
				if("Headshot")
					var/input = stripped_input(usr,"A https URL to a hosted image of your character's headshot. Must be: size 350x350px (larger images will be scaled down), a jpg/png/jpeg file, and hosted on either Gyazo (i.gyazo.com), Byondhome (files.byondhome.com), Imgbox (images2.imgbox.com) or Catbox (files.catbox.moe).")
					if(input)
						if(is_valid_headshot(input))
							headshot = input
					else
						var/deletePicture = alert(usr, "Do you wish to remove your headshot?", "Remove Headshot", "Yes", "No")
						if(deletePicture == "Yes")
							headshot = ""

	..()

/datum/preferences/copy_to(mob/living/carbon/human/character, icon_updates = 1, roundstart_checks = TRUE, initial_spawn = FALSE)
	..()
	character.headshot = headshot
