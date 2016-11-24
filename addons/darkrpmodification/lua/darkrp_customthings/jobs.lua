--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------]]
TEAM_CLASSD = DarkRP.createJob("Class-D", {
   color = Color(226, 122, 0, 255),
   model = {
	     	"models/classd/player/prisoners/jumpsuitm01.mdl",
	     	"models/classd/player/prisoners/jumpsuitm02.mdl",
			"models/classd/player/prisoners/jumpsuitm03.mdl",
			"models/classd/player/prisoners/jumpsuitm04.mdl",
			"models/classd/player/prisoners/jumpsuitm05.mdl",
			"models/classd/player/prisoners/jumpsuitm06.mdl",
			"models/classd/player/prisoners/jumpsuitm07.mdl",
			"models/classd/player/prisoners/jumpsuitm08.mdl"
		   },
   description = [[]],
   weapons = {weapon_fists},
   command = "classd",
   max = 100,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = false,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Class-D",
})

TEAM_CIVILIAN = DarkRP.createJob("Zivilist", {
   color = Color(155, 158, 155, 255),
   model = {"models/player/group01/male_01.mdl"},
   description = [[]],
   weapons = {"weapon_physgun","weapon_fists","gmod_tool","gmod_camera","keys","lockpick","pocket"},
   command = "civilian",
   max = 3,
   salary = 150,
   admin = 0,
   vote = false,
   level = 2,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Zivilisten",
})

TEAM_POLICE = DarkRP.createJob("Polizist", {
   color = Color(142, 142, 142, 255),
   model = {"models/player/combine_soldier.mdl"},
   description = [[Die Polizei herrscht außerhalb der Foundation für recht und Ordnung.]],
   weapons = {"cw_mp5","stunstick","arrest_stick","unarrest_stick","weaponchecker","door_ram","weapon_cuff_standard","keys"},
   command = "police",
   max = 3,
   salary = 180,
   admin = 0,
   vote = true,
   level = 3,
   hasLicense = true,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Zivilisten",
})

TEAM_CLEANER = DarkRP.createJob("Reiniger", {
   color = Color(0, 147, 255, 255),
   model = {
	     	"models/player/group02/male_02.mdl",
	     	"models/player/group02/male_04.mdl",
			"models/player/group02/male_06.mdl",
		   },
   description = [[]],
   weapons = {"weapon_keycard","weapon_fists"},
   command = "cleaner",
   max = 3,
   salary = 350,
   admin = 0,
   vote = false,
   level = 2,
   hasLicense = true,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Foundation Personal",
})

TEAM_Medic = DarkRP.createJob("Arzt", {
   color = Color(255, 255, 255, 255),
   model = {"models/player/kleiner.mdl"},
   description = [[]],
   weapons = {"weapon_medkit","weapon_fists","weapon_keycard"},
   command = "medic",
   max = 3,
   salary = 250,
   admin = 0,
   vote = true,
   level = 3,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Foundation Personal",
})

TEAM_SECURITY = DarkRP.createJob("Security", {
   color = Color(5, 0, 255, 255),
   model = {
	     	"models/player/group04/male_01.mdl",
	     	"models/player/group04/male_02.mdl",
			"models/player/group04/male_03.mdl",
			"models/player/group04/male_04.mdl",
			"models/player/group04/male_05.mdl",
			"models/player/group04/male_06.mdl",
			"models/player/group04/male_07.mdl",
			"models/player/group04/male_08.mdl"
		   },
   description = [[]],
   weapons = {"cw_mp5","cw_deagle","weapon_keycard","weapon_cuff_elastic"},
   command = "security",
   max = 6,
   salary = 650,
   admin = 0,
   vote = true,
   level = 7,
   hasLicense = true,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Security Department",
})

TEAM_MTFGUARD = DarkRP.createJob("MTF Guard", {
   color = Color(5, 0, 255, 255),
   model = {"models/mtf/mtf remasteredhd.mdl"},
   description = [[]],
   weapons = {"cw_ar15","cw_deagle","weapon_keycard","weapon_cuff_elastic"},
   command = "mtfguard",
   max = 5,
   salary = 650,
   admin = 0,
   vote = true,
   level = 12,
   hasLicense = true,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Mobile Task Force",
})

TEAM_MTFCHIEF = DarkRP.createJob("MTF Chief", {
   color = Color(5, 0, 255, 255),
   model = {"models/player/pmc_4/pmc__01.mdl"},
   description = [[]],
   weapons = {"cw_g3a3","cw_deagle","weapon_keycard","weapon_cuff_elastic"},
   command = "mtfchief",
   max = 1,
   salary = 750,
   admin = 0,
   vote = true,
   level = 15,
   hasLicense = true,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Mobile Task Force",
})

----------SCPS
TEAM_SCP173 = DarkRP.createJob("SCP-173", {
   color = Color(255, 255, 255, 255),
   model = {"models/vinrax/scp173/scp173.mdl"},
   description = [[]],
   weapons = {"weapon_fists","scp-173-snap-neck"},
   command = "scp173",
   max = 1,
   salary = 180,
   admin = 0,
   vote = true,
   level = 20,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "SCPs",
})

TEAM_SCP035 = DarkRP.createJob("SCP-035", {
   color = Color(255, 255, 255, 255),
   model = {"models/vinrax/player/035_player.mdl"},
   description = [[]],
   weapons = {weapon_fists},
   command = "scp035",
   max = 1,
   salary = 180,
   admin = 0,
   vote = true,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "SCPs",
    customCheck = function(ply) return ply:GetUserGroup() == "VIP" or ply:IsAdmin() end,
    CustomCheckFailMsg = "This job is VIP only!"
})

TEAM_SCP049 = DarkRP.createJob("SCP-049", {
   color = Color(255, 255, 255, 255),
   model = {"models/vinrax/player/scp049_player.mdl"},
   description = [[]],
   weapons = {weapon_fists},
   command = "scp049",
   max = 1,
   salary = 180,
   admin = 0,
   vote = true,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "SCPs",
    customCheck = function(ply) return ply:GetUserGroup() == "VIP" or ply:IsAdmin() end,
    CustomCheckFailMsg = "This job is VIP only!"
})

TEAM_SCP096 = DarkRP.createJob("SCP-096", {
   color = Color(255, 255, 255, 255),
   model = {"models/player/scp096.mdl"},
   description = [[]],
   weapons = {weapon_scp096},
   command = "scp096",
   max = 1,
   salary = 180,
   admin = 0,
   vote = true,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "SCPs",
    customCheck = function(ply) return ply:GetUserGroup() == "VIP" or ply:IsAdmin() end,
    CustomCheckFailMsg = "This job is VIP only!"
})

TEAM_SCP106 = DarkRP.createJob("SCP-106", {
   color = Color(255, 255, 255, 255),
   model = {"models/vinrax/player/scp106_player.mdl"},
   description = [[]],
   weapons = {weapon_fists},
   command = "scp106",
   max = 1,
   salary = 180,
   admin = 0,
   vote = true,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "SCPs",
    customCheck = function(ply) return ply:GetUserGroup() == "VIP" or ply:IsAdmin() end,
    CustomCheckFailMsg = "This job is VIP only!"
})

TEAM_CHOAS = DarkRP.createJob("Chaos Insurgency", {
   color = Color(114, 70, 18, 255),
   model = {"models/player/pmc_4/pmc__12.mdl"},
   description = [[]],
   weapons = {"cw_deagle","keys","lockpick","pocket","weapon_hacking_keycard"},
   command = "choas",
   max = 4,
   salary = 260,
   admin = 0,
   vote = true,
   level = 6,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   category = "Chaos Insurgency",
})

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CLASSD


--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_CHIEF] = true,
	[TEAM_MAYOR] = true,
}

--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_MOB)
