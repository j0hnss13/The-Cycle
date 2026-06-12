#define BORDER_CONTROL_PATH "data/border_control/bordercontrol_whitelist.txt"
#define BORDER_CONTROL_MODE_DISABLED 0
#define BORDER_CONTROL_MODE_LEARNING 1
#define BORDER_CONTROL_MODE_ENFORCED 2

#define BORDER_CONTROL_STYLE_NO_SERVER_CONNECT  0
#define BORDER_CONTROL_STYLE_NO_ROUND_JOIN		1

#define BORDER_CONTROL_VERBOSE 0

GLOBAL_LIST_EMPTY(whitelistedCkeys)
GLOBAL_VAR_INIT(whitelistLoaded, FALSE)

GLOBAL_PROTECT(whitelistedCkeys)
GLOBAL_PROTECT(whitelistLoaded)

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_ModeToText(mode)
	switch(mode)
		if(BORDER_CONTROL_MODE_DISABLED)
			return "Disabled"
		if(BORDER_CONTROL_MODE_LEARNING)
			return "Learning"
		if(BORDER_CONTROL_MODE_ENFORCED)
			return "Enforced"

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_StyleToText(style)
	switch(style)
		if(BORDER_CONTROL_STYLE_NO_SERVER_CONNECT)
			return "Clients are not permitted to connect"
		if(BORDER_CONTROL_STYLE_NO_ROUND_JOIN)
			return "Clients are permitted to connect to the lobby, but not join a round"

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_IsKeyAllowedToConnect(key)
	key = ckey(key)

	var/borderControlMode = CONFIG_GET(number/border_control)

	if(borderControlMode == BORDER_CONTROL_MODE_DISABLED)

		#if (BORDER_CONTROL_VERBOSE)
			log_and_message_admins("[key] has bypassed border control due to border control being disabled.")
		#endif

		return 1
	else if (borderControlMode == BORDER_CONTROL_MODE_LEARNING)

		#if(BORDER_CONTROL_VERBOSE)
			log_and_message_admins("[key] has bypassed border control due to border control being in learning mode.")
		#endif

		if(!BC_IsKeyWhitelisted(key))
			log_and_message_admins("[key] has joined and was added to the border whitelist.")
		BC_WhitelistKey(key)
		return 1
	else if (key in GLOB.admin_datums)
		#if(BORDER_CONTROL_VERBOSE)
			log_and_message_admins("[key] has bypassed border control due to being an admin.")
		#endif

		return 1
	else if (BC_IsKeyWhitelisted(key))
		#if(BORDER_CONTROL_VERBOSE)
			log_and_message_admins("[key] has bypassed border control due to being in the whitelist.")
		#endif

		return 1
	else
		#if(BORDER_CONTROL_VERBOSE)
			log_and_message_admins("[key] has failed to bypass border control.")
		#endif

		return 0

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_IsKeyWhitelisted(key)
	if(!key)
		return

	if(!GLOB.whitelistLoaded)
		BC_LoadWhitelist()

	key = ckey(key)

	return key in GLOB.whitelistedCkeys

//////////////////////////////////////////////////////////////////////////////////
/datum/admins/proc/BC_WhitelistKeyVerb()
	set name = "Add Ckey"
	set category = "Admin.Border Control"

	var/key = input("Ckey to add to border control whitelist", "Whitelist Ckey") as null|text

	if(!key)
		return

	var/confirm = alert("Add [key] to the border control whitelist?", "", "Yes", "No")

	if(confirm == "Yes")
		log_and_message_admins("added [key] to the border control whitelist.")
		BC_WhitelistKey(key)

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_WhitelistKey(key)
	if(!key)
		return

	if(!GLOB.whitelistLoaded)
		BC_LoadWhitelist()

	key = ckey(key)

	if(key in GLOB.whitelistedCkeys)
		return

	GLOB.whitelistedCkeys += key
	BC_SaveWhitelist()

//////////////////////////////////////////////////////////////////////////////////
/datum/admins/proc/BC_RemoveKeyVerb()
	set name = "Remove Ckey"
	set category = "Admin.Border Control"

	var/ckey = input("Ckey to remove from border control whitelist", "Remove Key") as null|anything in sortList(GLOB.whitelistedCkeys)

	if(!ckey)
		return

	var/confirm = alert("Remove [ckey] from the border control whitelist?", "", "Yes", "No")

	if(confirm == "Yes")
		log_and_message_admins("removed [ckey] from the border control whitelist.")
		BC_RemoveCkey(ckey)

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_RemoveCkey(ckey)
	if(!ckey)
		return

	GLOB.whitelistedCkeys -= ckey
	BC_SaveWhitelist()

//////////////////////////////////////////////////////////////////////////////////
/datum/admins/proc/BC_ShowWhitelistVerb()
	set name = "Show Whitelist"
	set category = "Admin.Border Control"

	var/msg = "<b>Current Ckeys in Border Control Whitelist:</b>\n"

	var/list/ckeys = list()

	for(var/ckey in GLOB.whitelistedCkeys)
		ckeys += ckey

	ckeys = sortList(ckeys)

	for(var/ckey in ckeys)
		msg += "[ckey]\n"

	to_chat(src, msg)

//////////////////////////////////////////////////////////////////////////////////
/datum/admins/proc/BC_ReloadWhitelistVerb()
	set name = "Reload Whitelist From File"
	set category = "Admin.Border Control"

	var/confirm = alert("Reload the border control whitelist from [BORDER_CONTROL_PATH]? WARNING: This will replace the current whitelist entirely.", "Reload Whitelist From File", "Yes", "No")

	if(confirm == "Yes")
		log_and_message_admins("reloaded the border control whitelist from [BORDER_CONTROL_PATH].")
		BC_LoadWhitelist()

//////////////////////////////////////////////////////////////////////////////////
/datum/admins/proc/BC_ToggleState()
	set name = "Toggle Enforcement Mode"
	set category = "Admin.Border Control"
	set desc = "Enables or disables border control"

	var/borderControlMode = CONFIG_GET(number/border_control)

	var/choice = input("New State (Current state is: [BC_ModeToText(borderControlMode)])", "Border Control State") as null|anything in list("Disabled", "Learning", "Enforced")

	switch(choice)
		if("Disabled")
			if(borderControlMode != BORDER_CONTROL_MODE_DISABLED)
				borderControlMode = BORDER_CONTROL_MODE_DISABLED
				log_and_message_admins("has disabled border control.")
		if("Learning")
			if(borderControlMode != BORDER_CONTROL_MODE_LEARNING)
				borderControlMode = BORDER_CONTROL_MODE_LEARNING
				log_and_message_admins("has set border control to learn new keys on connection!")
			var/confirm = alert("Learn currently connected keys?", , "Yes", "No")
			if(confirm == "Yes")
				for(var/client/C in GLOB.clients)
					if (BC_WhitelistKey(C.key))
						log_and_message_admins("[key_name(usr)] added [C.key] to the border whitelist by adding all current clients.")

		if("Enforced")
			if(borderControlMode != BORDER_CONTROL_MODE_ENFORCED)
				borderControlMode = BORDER_CONTROL_MODE_ENFORCED
				log_and_message_admins("has enforced border controls. New keys can no longer join.")

	CONFIG_SET(number/border_control, borderControlMode)

//////////////////////////////////////////////////////////////////////////////////
/hook/startup/proc/loadBorderControlWhitelistHook()
	BC_LoadWhitelist()
	return GLOB.whitelistLoaded

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_LoadWhitelist()
	GLOB.whitelistedCkeys.Cut()
	var/list/keys = world.file2list(BORDER_CONTROL_PATH)

	for(var/key in keys)
		GLOB.whitelistedCkeys += ckey(key)

	GLOB.whitelistLoaded = TRUE

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_SaveWhitelist()
	fdel(BORDER_CONTROL_PATH)

	for(var/ckey in GLOB.whitelistedCkeys)
		text2file(ckey, BORDER_CONTROL_PATH)
