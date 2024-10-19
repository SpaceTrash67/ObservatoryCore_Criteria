-- CUSTOM CRITERIA FOR EVERYONE
-- Compiled and maintained by CMDR Julian Ford
-- v1.3.0
-- SpaceTrash67 additions in section 5 (2024-08-27)
-- v1.3.0.a Added two GGG temp updates from DaftMav from 2024-09-28: Class I: 89.193558 / Class II: 217.840744

--[[Elite Observatory is a phenomenal tool for exploring in Elite Dangerous, and it is all the better
	because we get to write our own custom criteria, which supplement the default criteria in the app
	and further enhance our experience in game. Here I have compiled or written what I felt were the 
	most important and/or convenient criteria missing from the Observatory default options, in an 
	organized and well-notated document that should be relatively easy to understand and, if you wish, 
	alter to your taste. Numerous default criteria from Observatory Explorer have also been reworked 
	to provide more information in the notification	card, such as the radius of a Small object, or 
	the surface gravity of a high gravity world. 
	
	Extra special thanks to:
	-Vithigar: for developing and maintaining Elite Observatory;
	-CMDRs Sirob0911 and Marty--McFly, for creating the SNPX custom criteria file which was the 
		inspiration	for my own;
	-Matt G and fjk: for your variety of extensions and criteria, for many very interesting 
		conversations and thought experiments, and for being just so darn friendly and helpful;
	-Eahlstan, DaftMav, Duvel McMuttons, MariettaGecko,  Andrew Gaspurr, Arcanic, Spacetrash67 
		and many others, for contributing your fabulous custom criteria to the community, and for 
		answering my questions as I figured this out;
	-Griff Rogers, as well as my squadmates in the Astral Survey Project, for early testing and 
		providing valuable critique.


----------------------------------------
----------------------------------------
--READ ME FIRST: HOW TO SET UP AND USE--
----------------------------------------
---------------------------------------- 

	HOW TO INSTALL?
	To get this criteria working with Elite Observatory:
		- Save the file somewhere on your hard drive
		- Open Elite Observatory and go to the Core tab
		- Expand the "Observatory Explorer" section and check "Enable Custom Criteria"
		- In the "Custom Criteria File" box, click "Browse" and point it to this file on your hard drive.

	DUPLICATE CRITERIA
	The following criteria are also included in Observatory Core by default, and should be disabled 
	either here or there, in order to prevent duplicate notifications. The alternate versions in 
	this criteria generally have more details written on the notification card than the default option.

		- Landable & Terraformable
		- Landable High-g
		- Small Object 			
		- Fast Orbit
		- High-Value Body
		- Landable w/ Atmosphere
		- Landable Large
		- Shepherd Moon
		- Close Ring Proximity
		
	CHECK THE CONFIGS!
	Below the table of contents in this file, there is a config option for every criteria in the section 
	called GLOBAL. If you don't want one or more criteria to trigger, you can disable them. All criteria 
	are enabled by default, and that means A LOT of pings - probably more than you want - so you might 
	want to browse through and disable any you don't want. In addition, most criteria have thresholds or 
	other options you can change, so that the notifications happen on your terms as much as possible.
	
	UPDATING FROM AN OLDER VERSION?
	If you are using an older version of CCFE, and are installing this one in its place, you are advised
	to keep the old file until you have redone any custom configurations to the new file, in case you need
	to look back at it for reference. The new file will not inherit anything from the old one - if you made
	changes, disabled criteria etc, you will need to make those same changes to the new file.
	
	FURTHER QUESTIONS?
	Come and ask me! I live in the Discord server for the Independent Explorers Association. Here is a 
	permanent invite link to the server:
	
	https://discord.gg/vmKJ73M7Qj
	
	I am happy to answer questions about this file, or take suggestions for additional criteria to be added.
	I also publish new versions of the criteria file there, as I make changes or add new criteria.
	
	Happy hunting!
	
	-CMDR Julian Ford



---------------------------
---------------------------
-----TABLE OF CONTENTS-----
---------------------------
---------------------------
	Here you will find a list of the criteria included in this file, grouped by category. If you wish
	to configure a criteria, learn more about what it does, or enable or disable it entirely, you can 
	do so in its corresponding entry in the GLOBAL section below.
	
	
STELLAR AND ORBITAL MECHANICS
	1.1: Ancient star
	1.2: Fast orbital period
	1.3: Hot Jupiter
	1.4: Massive Planet
	1.5: Ringed M, Neutron, and White Dwarf stars
	1.6: Small Object
	1.7: Undiscovered system


VALUE AND RARITY

	2.1: Helium gas giant
	2.2: Helium-rich gas giant
	2.3: High value body
	2.4: Potential green gas giant
	2.5: Potential green protostar
	2.6: Potential helium rich boxel
	2.7: Rare body with ring


RINGS
	3.1: Massive Ring
	3.2: Narrow ring gap with high rotational difference
	3.3: Ring proximity / Shepherd moon
	3.4: Ring with fast orbital period
	3.5: Ring with high orbital velocity
	3.6: Taylor’s rings and other narrow rings


LANDABLES, ATMOSPHERES AND SIGNALS
	4.1: Geological signals
	4.2: High orbital inclination, landable, close to body with ring
	4.3: Horizons bios likely
  	4.4: Hot Landable
	4.5: Landable and close to a star
	4.6: Landable moon close to a rare body
	4.7: Landable with atmosphere (and bios)
 	4.8: Landable with high gravity
 	4.9: Large landable body
 	4.10: Ringed atmospheric landable
	
Spacetrash67 additions
	5.1: Complex Orbits
	5.2: Giant Star in system
	5.3: High Surface Pressure
	5.4: Galactic Records

]]--

------------------------
------------------------
-----GLOBAL SECTION-----
------------------------
------------------------
--[[Here you will find a brief description of each criteria, what requirements the criteria needs 
	to meet in order to trigger, any variables that affect the specifics of how it is triggered, 
	and an option to disable each criteria entirely. All criteria are defaulted to "true" and will 
	trigger unless disabled. If you wish to disable a criteria, simply change the appropriate 
	"true" to "false". You should pay attention to the instructions and not make edits anywhere 
	except where you are supposed to. If you are concerned you might break the file, back it up 
	before you make a change.
]]--

::Global::
------------------------------------------------
------------------------------------------------
--- SECTION 1: STELLAR AND ORBITAL MECHANICS ---
------------------------------------------------
------------------------------------------------

--------------------
-- 1.1: ANCIENT STAR
--------------------
--[[Any star older than the number specified in starAgeThreshold (in millions of years)  will 
	trigger the "Ancient star" notification.
]]--
	triggerForAncientStars = true
	starAgeThreshold = 13060
		   -- example: 13000 == 13 billion years

---------------------------
-- 1.2: FAST ORBITAL PERIOD
---------------------------
--[[Any scanned body with an orbital period less than the number specified in fastOrbitThreshold 
	(in seconds) will trigger the "Fast orbital period"	notification.
 ]]--
	triggerForFastOrbitalPeriod = true
	fastOrbitThreshold = 28800
			 -- example: 28800 == 0.3 days

-------------------
-- 1.3: HOT JUPITER
-------------------
--[[This notifies you of gas giants classified as "Hot Jupiters" - specifically, those which possess
	an orbital period of less than ten days.
]]--
	triggerForHotJupiter = true

-----------------------
-- 1.4: MASSIVE PLANET
-----------------------
--[[This triggers for any planet with a total mass (in Earth masses) above the specified threshold.]]--
	triggerForMassivePlanets = true
	massivePlanetThreshold = 3300.00 --Earth masses

-----------------------------------------------
-- 1.5: RINGED M, NEUTRON AND WHITE DWARF STARS
-----------------------------------------------
--[[Triggers if there is a ringed M class, neutron or white dwarf star in the system.]]--
	triggerForRingedStar = true

--------------------
-- 1.6: SMALL OBJECT
--------------------
--[[Any scanned body with a radius under this smallBodyThreshold (in meters) will trigger the 
	"Small object" notification.
]]--
	triggerForSmallObject = true
	smallBodyThreshold = 250000 
			 -- example: 300000 == 300 km

---------------------------
-- 1.7: UNDISCOVERED SYSTEM
---------------------------
--[[Any system with a previously undiscovered primary star will trigger this notification.]]--
	triggerForUndiscoveredSystem = true


-----------------------------------
-----------------------------------
--- SECTION 2: VALUE AND RARITY ---
-----------------------------------
-----------------------------------

------------------------
-- 2.1: HELIUM GAS GIANT
------------------------
--[[This triggers on the very rare occasion that you scan a Helium Gas Giant. Note that this 
	planet class is different from Helium *Rich* Gas Giants, of which many thousands have 
	been found. There are only three known prcedurally generated examples of Helium Gas Giants 
	in the entire galaxy - the others all exist in catalog systems (52 Herculis and HR 6870). 
	If you find an undiscovered example of one of these, you are very lucky indeed.
]]--
	triggerForHeliumGasGiant = true
	
-----------------------------
-- 2.2: HELIUM-RICH GAS GIANT
-----------------------------
--[[This triggers when a Helium-rich gas giant is scanned while exploring in a Helium-rich
	boxel. These gas giants are not found anywhere except in Helium-rich boxels - systems
	which have a Helium content greater than 29.5% - and are more common the higher the 
	Helium content is.
]]--
	triggerForHeliumRichGasGiant = true

-----------------------
-- 2.3: HIGH-VALUE BODY
-----------------------
--[[This notifies you of bodies which will net you a high amount of credits when scanned or mapped.
	You can enable or disable which classes of planet you want to trigger the notification.
]]--
	triggerForHighValueBody = true

--Setting any of these classes to false will entirely exclude that planet class from triggering 
--	the notification.

	highValueClasses = {
	["Sudarsky class II gas giant"] = true,
					 ["Rocky body"] = true,
				["Metal rich body"] = true,
					["Water world"] = true,
				  ["Ammonia world"] = true,
		["High metal content body"] = true,
				 ["Earthlike body"] = true
	}

-- TERRAFORMABLES ONLY? Some planet classes (metal rich bodies, rocky bodies, high metal content worlds, 
--	and water worlds) have non-terraformable versions which are worth substantially less than their
--	terraformable versions. This file ignores these by default. If, however, you wish the criteria to ping
--	for the NON-TERRAFORMABLE version of any of these planet classes, set that planet class to true below.

	pingNonTerraformableClasses = {
				["Metal rich body"] = false,
					 ["Rocky body"] = false,
		["High metal content body"] = false,
					["Water world"] = false
	}

---------------------------------
-- 2.4: POTENTIAL GREEN GAS GIANT
---------------------------------
--[[This checks the surface temperature of green gas giants against a table of known green gas
	giant temperatures. If the scanned temp matches an entry in the table, or if it is similar
	according to the threshold set below, it will notify of a potential green gas giant.
]]--
	triggerForPotentialGGG = true
	
	-- here you can set how far (in deg. K) the scanned temp. may vary from an entry in the table.
	GGGdelta = 0.001

----------------------------------
-- 2.5: POTENTIAL GREEN PROTO-STAR
----------------------------------
--[[This checks the temperature of TTS and Ae/Be stars against a table of known bugged stars
	which emit green light. The first option enables or disables the criteria. The
	"ProtostarAllTemps" toggle will notify of all TTS/Herbig temps that end in zero, in
	hopes of catching additional bugged stars.
]]--
	triggerForProtostarTemps = true
	ProtostarAllTemps = true 

-----------------------------------
-- 2.6: POTENTIAL HELIUM RICH BOXEL
-----------------------------------
--[[A Helium rich boxel is an area of space in which Helium rich gas giants are generated. They do not 
	generate outside of these areas. This criteria scans gas giants and returns when it finds one with
	a Helium content greater than heliumMinimum (in percent) - the default is 30 percent and should not 
	be set any lower than 29.5.
]]--
	triggerForHRB = true
	heliumMinimum = 30
	
---------------------------
-- 2.7: RARE BODY WITH RING
---------------------------
--[[This triggers for any Earth-like world, Water world, or Ammonia world with a ring around it.]]--
	triggerForRingedRare = true


------------------------
------------------------
--- SECTION 3: RINGS ---
------------------------
------------------------

--------------------
-- 3.1: MASSIVE RING
--------------------
--[[Triggers a notification for any ring larger than ringWidthThreshold (in trillions of megatonnes). 
	Think big. 1 trillion megatonnes will net you thousands of rings. I settled on 10 trillion as the 
	default threshold with all rings active. Rocky rings seem the most commonly massive, followed 
	by metal rich, followed by icy. Turning off rocky rings will likely decrease your results 
	by at least half.
]]--
	triggerForMassiveRing = true
	ringMassThreshold = 10
			-- example: 10 == ten trillion megatonnes, or 10,000,000,000,000
	

--If you only want certain ring types to be called, change the appropriate "true" to "false" to 
--	exclude	a specific ring type from triggering the notification.
	largeRingTypes = {
		    ["eRingClass_Rocky"] = true, --Rocky rings
		      ["eRingClass_Icy"] = true, --Icy rings
		["eRingClass_MetalRich"] = true, --Metal Rich rings
		  ["eRingClass_Metalic"] = true  --Metallic rings
	}

-------------------------------------------------------
-- 3.2: NARROW RING GAP WITH HIGH ROTATIONAL DIFFERENCE
-------------------------------------------------------
--[[A body with two rings, orbiting very close together and having very different rotational speeds, 
	triggers this notification.
]]--
	triggerForRingGapWithSpeedDifferential = true

--------------------------------------
-- 3.3: RING PROXIMITY / SHEPHERD MOON
--------------------------------------
--[[Bodies closer to a ring than closeRingDistance (in kilometers) will trigger	the 
	"Close ring proximity" notification. It will also point out if the body is landable.
]]--
	triggerForRingProximity = true
	closeRingDistance = 5000

--[[A body which orbits inside a parent's ring will trigger the Shepherd Moon notification.]]--
	triggerForShepherdMoon = true

-------------------------------------
-- 3.4: RING WITH FAST ORBITAL PERIOD
-------------------------------------
--[[A ring with an orbital period shorter than ringOrbitalPeriodThreshold (in seconds) will 
	trigger the "Ring has fast orbital period" notification.
]]--
	triggerForRingWithFastOrbitalPeriod = true
	ringOrbitalPeriodThreshold = 5400
					 -- example: 5400 == 90 minutes to execute one full rotation

---------------------------------------
-- 3.5: RING WITH HIGH ORBITAL VELOCITY
---------------------------------------
--[[A ring with an orbital velocity higher than ringVelocityThreshold (in kilometers/sec) will
	trigger this notification.
]]--
	triggerForHighVelocityRing = true
	ringVelocityThreshold = 100 --km/sec

---------------------------------------------
-- 3.6: TAYLOR'S RINGS AND OTHER NARROW RINGS
---------------------------------------------
--[[Bodies orbited by narrow rings can trigger one of two notifications:
	-Taylor's Ring: A single ring with a width less than 1/8th (12.5%) of its parent body's
		diameter.
	-Narrow single ring - A single ring with a width less than narrowRingThreshold of its parent 
		body's diameter. The default for narrowRingThreshold is 25% of the parent body's diameter, 
		written as 0.25. If you only want to be notified of Taylor's Rings, 
		simply set narrowRingThreshold to 0.125.
]]--
	triggerForNarrowRings = true
	narrowRingThreshold = 0.17


-------------------------------------------------
-------------------------------------------------
--- SECTION 4: LANDABLES, ATMOSPHERES AND SIGNALS
-------------------------------------------------
-------------------------------------------------

--------------------------
-- 4.1: GEOLOGICAL SIGNALS
--------------------------
--[[This criteria triggers for any body containing geological signals, returning the number of
	signals, the type of volcanism present on the body, and the average surface temperature.
	There is a better alternative to this criteria these days - the GeoPredictor plugin from
	CMDR Duvel McMuttons (who also wrote this criteria), which will notify you of new 
	geological Codex entries and other fun geo data as you explore, in the same vein as the 
	BioInsights plugin. If this simple criteria is enough for you, then woohoo, but I suggest 
	you try GeoPredictor out instead!
]]--
	triggerForGeoSignals = false

-------------------------------------------------------------------
-- 4.2: HIGH ORBITAL INCLINATION, LANDABLE, CLOSE TO BODY WITH RING
-------------------------------------------------------------------
--[[A body needs to meet three criteria in order to trigger this notification:

	1) it must be in close orbit to a body with a ring
	2) it must have an orbital inclination higher than the threshold set below
	3) it must be landable.
	
	The resulting bodies will have stunning views of a ringed planet in the sky.
]]--
	triggerForHighIncLandableRingProx = true
	inclinationThreshold = 10
			   -- example: 10 == ten degrees of orbital inclination

------------------------------------------
-- 4.3: HORIZONS BIOLOGICAL SIGNALS LIKELY
------------------------------------------
--[[A landable body with biological signals, but no atmosphere, triggers this notification. Since
	landable tenuous atmospheres did not exist in Horizons, but biological signals did, most 
	Horizons-era bios generate on bodies with no atmosphere. This criteria is especially important 
	because currently, BioInsights does not make any effort to predict Horizons-era bios.
]]--
	triggerForHorizonsBios = true

----------------------------------
-- 4.4: HOT LANDABLE
----------------------------------
--[[Triggers for any landable with a surface temperature at or above this threshold. An additional
	warning is given if the body scanned has a surface temperature of 800K or greater, at which 
	point, the commander will burn to death over the course of about two minutes.
]]--
	triggerForHotLandable = true
	hotLandableThreshold = 1000 --degrees Kelvin
	
--[[Lethal heat only: if you ONLY want to be notified if your commander will take damage upon 
	disembarking on foot, set this to true.]]--
	lethalOnly = false

------------------------------------
-- 4.5: LANDABLE AND CLOSE TO A STAR
------------------------------------
--[[These variables are used in the "landable, close proximity to star" ping.

	-smallStarThreshold: This is a static threshold in LS for small stars, 
	which do not play well with the quotient system. Any landable within this
	distance from a small star (mainly a Neutron or a White Dwarf) will trigger
	this notification.
	
	-baseQuotient: This sets a threshold of relative proximity based on the
	radius of the star and its distance from the scanned body. Basically, if
	you want only closer stars to ping, lower this number, and if you want
	further stars to ping, raise this number.
	
	-atmoBump: This is an optional supplement to baseQuotient, added on if the
	scanned body has an atmosphere. If you want the same relative distance to
	trigger the notification whether the scanned body has an atmosphere or not,
	set this number to 0.
]]--
	triggerForLandableAndStarProx = true
			   smallStarThreshold = 200
					 baseQuotient = 150
						 atmoBump = 1000

------------------------------------------
-- 4.6: LANDABLE MOON CLOSE TO A RARE BODY
------------------------------------------
--[[Scanning a landable moon, which orbits an Earth-like, water world, or ammonia world at a 
	distance below the threshold set in terraMoonThreshold (in LS), will trigger this notification.
]]--
	triggerForLandableAndCloseToRare = true
				  terraMoonThreshold = 2

-------------------------------------------------------
-- 4.7: LANDABLE WITH ATMOSPHERE AND BIOLOGICAL SIGNALS
-------------------------------------------------------
--[[Scanning a landable body with a flagged atmosphere as defined by the atmosphere	table below 
	will trigger the "Flagged landable atmosphere" notification. If the planet also contains 
	Biological signals, these will also be pointed out.
]]--
	triggerForLandableAtmosphere = true
	
--[[If you like hearing about atmospheric landables, but do NOT want to be notified when there 
	are biological signals present on those bodies, set this to false.
]]--
	pingLife = true

--[[If you do not want to be notified about a particular atmospheric landable, set its atmosphere
	below to true, in order to EXCLUDE that atmosphere type from the notification. Yes, this seems 
	backwards! Doing it this way made it much easier for this hobbyist programmer to write this 
	criteria. Sorry.
]]--
	Excluded_Atmospheres = {
				  ["Ammonia"] = false,
			  ["AmmoniaRich"] = false,
					["Argon"] = false,
				["ArgonRich"] = false,
			["CarbonDioxide"] = false,
		["CarbonDioxideRich"] = false,
				   ["Helium"] = false,
				  ["Methane"] = false,
			  ["MethaneRich"] = false,
					 ["Neon"] = false,
				 ["NeonRich"] = false,
				 ["Nitrogen"] = false,
				   ["Oxygen"] = false,
		   ["SilicateVapour"] = false,
		   ["SulphurDioxide"] = false,
					["Water"] = false,
				["WaterRich"] = false
		}

----------------------------------
-- 4.8: LANDABLE WITH HIGH GRAVITY
----------------------------------
--[[This triggers for any landable body with surface gravity greater than gravityThreshold (in G).]]--
	triggerForHighG = true
	gravityThreshold = 3

---------------------------
-- 4.9: LARGE LANDABLE BODY
---------------------------
--[[This triggers for any landable body with a radius higher than largeLandableThreshold (in meters).]]--

triggerForLargeLandable = true
largeLandableThreshold = 15000000
			  --example: 18000000 == 18,000 kilometers in radius

-----------------------------------
-- 4.10: RINGED ATMOSPHERIC LANDABLE
-----------------------------------
--[[Any landable body with an atmosphere and a ring triggers this notification.]]--
	triggerForRingedAtmosphericLandable = true



-------------------------------------------
-------------------------------------------
--USERS: DO NOT TOUCH ANYTHING BELOW HERE--
-------------------------------------------
-------------------------------------------
--[[
	The rest of the section contains functions, formulae and variables which should not be changed 
	by hand - they are needed by the criteria below to remain in exactly the state they are in. 
	Following this section is the Criteria Section itself, which should similarly not be altered 
	in any way. If you have a suggestion for a variable you do not see in the options above, 
	contact CMDR Julian Ford on the Independent Explorers Association Discord server (or anywhere 
	else you can find him) and he will see about adding it. Thank you and happy scanning!
--]]

-----------------------------------
-- GGG TEMPERATURES LOOKUP TABLES--
-----------------------------------
--[[
    Surface Temperature data used is from CMDR Arcanic's research on GGGs:
	
	https://www.youtube.com/playlist?list=PLXsRqs-BpM8JDEm9b_ABzJh-nDhAZ1SYJ
	
    Reminder: While this table lists journal-style zero-padded decimal numbers
	(like 158.000000) these will be reduced by Lua to one decimal (158.0) or
	whatever the last non-zero decimal is (90.14109 instead of 90.141090) in any 
	math/comparisons.
--]]
KnownGGGTemperatures = {
		   ['Sudarsky class I gas giant'] = {85.945335, 89.193558, 90.141090, 109.874001, 
											 113.841248, 117.776886, 119.986717, 
											 120.725380, 122.295380, 125.933167, 
											 126.062111, 128.909470, 129.582138, 
											 132.010391, 135.434097, 137.307129},
    								  
		  ['Sudarsky class II gas giant'] = {157.798843, 160.396164, 164.465302, 
    								         174.249985, 204.975662, 206.818893, 
    								         213.91156, 217.840744, 217.87532, 225.990601, 
    								         228.357773, 238.650650},
    								   
		 ['Sudarsky class III gas giant'] = {276.751648, 299.305664, 370.000000, 
                                             400.000000, 430.000000, 460.000000, 
                                             490.000000, 520.000000, 550.000000, 
                                             580.000000, 610.000000, 640.000000, 
                                             678.000000, 700.000000, 730.000000,
                                             760.000000, 790.000000},
    									
		  ['Sudarsky class IV gas giant'] = {1149.999878},
     
	  					  ['Water giant'] = {158.000000},
    
      ['Gas giant with water based life'] = {158.000000, 176.666641, 176.666656, 
    									     176.666672, 176.666687, 217.499985},
    									   
    ['Gas giant with ammonia based life'] = {102.234520, 121.179939, 133.438171, 
											 133.438171, 133.510468},
}

--[[Generate min/max GGG temperature ranges table from 
	KnownGGGTemperatures and +/- GGGdelta offset
]]--
NearGGGTemperatures = {}
for class,tab in pairs(KnownGGGTemperatures) do
    NearGGGTemperatures[class] = {}
    for _, value in pairs(tab) do
        NearGGGTemperatures[class][value] = { min = (value-GGGdelta), max = (value+GGGdelta) }
    end
end

-- Strange protostar surface temperatures lookup table
StrangeProtostarTemperatures = {
    ['TTS'] = {2400.0, 3700.0, 5200.0, 6000.0, 7500.0, 10000.0},
    ['AeBe'] = {5200.0},
}


----------------------
--OPERATOR FUNCTIONS--
----------------------
-- This function returns true if the specified value falls within any min/max ranges inside the specified table, false if not found, 
-- or if the specified table doesn't exist. If true, also returns base/index value for the found range.
function in_ranges(tab, val)
    if type(tab) == 'table' then
        for base, ranges in pairs(tab) do
            if(val >= ranges.min and val <= ranges.max) then
                return true, base
            end
        end
    end
    return false
end


-- This function returns true if the specified value is found in the specified table, false if not found or if the specified table doesn't exist.
function has_value(tab, val)
    if type(tab) == 'table' then
        for _, value in pairs(tab) do
            if value == val then
                return true
            end
        end
    end
    return false
end


--This function inserts commas into very large numbers.
function formatNumber(amount)
  local formatted = amount
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

--This function takes a long decimal rounds it to the specified number of decimal places.
function Round(num, dp)
    local mult = 10^(dp or 0)
    return math.floor(num * mult + 0.5)/mult
end


--These are some basic conversions for use in multiple criteria.
kmInLS		= 299792458				-- how many kilometers per light second
daySec 		= 86400					-- seconds per day
yearSec 	= 31536000				-- seconds per year
solRadius 	= 695500				-- radius of Sol according to Elite Dangerous


-- This function reformats a specified increment of time (in seconds) into its component years, days, hours, minutes and seconds.
-- It is used in the Fast Orbital Period criteria to report the orbital period of the scanned body in a familiar, easy-to-read format.
function formatTime(time)
-- these local variables convert the input number of seconds into all of its larger chunks - from years on down.
	local years = math.floor(time/31536000)
	local days = math.floor(math.fmod(time, 31536000)/86400)
	local hours = math.floor(math.fmod(time, 86400)/3600)
	local minutes = math.floor(math.fmod(time,3600)/60)
	local seconds = math.floor(math.fmod(time,60))
	local timeString = ""
	
-- this simple function adds commas only when needed between the newly spelled out years, months, etc, as timeString is constructed.
local function addComma()
	if timeString ~= "" then
		timeString = timeString .. ", "
	end
end

-- now, we take all the nonzero divisions of time calculated above and turn them into a properly formatted string.
	if years ~= 0 then --in all these denominations, we check to see if the number is nonzero before adding it to the string.
		timeString = years .. " years" --no addComma() needed here, since this is guaranteed to be the beginning of the string if it is nonzero.
	end
	if days ~= 0 then
		addComma()
		timeString = timeString .. days .. " days"
	end
	if hours ~= 0 then
		addComma()
		timeString = timeString .. hours .. " hours"
	end
	if minutes ~= 0 then
		addComma()
		timeString = timeString .. minutes .. " minutes"
	end
	if seconds ~= 0 then
		addComma()
		timeString = timeString .. seconds .. " seconds"
	end

  return timeString --the string properly constructed, the function now returns it.
end


-- This variable stores the last potential helium-rich boxel scanned by the criteria of the same name, to prevent unnecessary repeated notifications.
lastHeliumBoxel = ''


-- This function checks if a string starts with a certain value
function string.startsWith(String,Start)
   if (String == nil) then
     return false
   end
   return string.sub(String,1,string.len(Start))==Start
end

::End::


------------------------
------------------------
----CRITERIA SECTION----
------------------------
------------------------

--------------------
-- 1.1: ANCIENT STAR
--------------------
--Ping for stars over a certain threshold of age. To change the age at which this pings, alter the 'starAgeThreshold' in Global variables.
::Criteria::
if triggerForAncientStars == true then
	if scan.StarType and scan.StarType ~= '' then
		if scan.Age_MY >= starAgeThreshold then
			local luminosityResult = '-'
				if scan.Luminosity then
					luminosityResult = scan.Luminosity
				end
			return true, "Ancient star" .. string.char(10) .. 
						 "Type: " .. scan.StarType .. string.char(10) .. 
						 "Age: " .. (scan.Age_MY/1000) .. ' billion years', 
						 "Type: " .. scan.StarType .. " / Solar radius: " .. Round(((scan.Radius/1000)/solRadius),2) .. string.char(10) .. 
						 "Solar mass: " .. Round(scan.StellarMass,2) ..  " / Subclass: " .. scan.Subclass .. " / Luminosity: " .. luminosityResult
		end
	end
end
::End::



---------------------------
-- 1.2: FAST ORBITAL PERIOD
---------------------------
--Simple ping for a body with a fast orbital period. The orbital period threshold is set by the fastOrbitThreshold variable in Global.
::Criteria::
if triggerForFastOrbitalPeriod == true then
	if scan.PlanetClass and scan.PlanetClass ~= "Barycentre" and scan.OrbitalPeriod <= fastOrbitThreshold and not scan.Rings then
		local fastPlanet = scan.PlanetClass
		return true, "Fast orbital period" .. string.char(10) .. 
					 "(" .. formatTime(scan.OrbitalPeriod) .. ")", 
					 "Body type: " .. fastPlanet .. string.char(10) .. "Specific orbital period: " .. Round((scan.OrbitalPeriod/3600),4) .. " hours"
	end
end
::End::



-------------------
-- 1.3: HOT JUPITER
-------------------
::Criteria::
if triggerForHotJupiter == true then
	if scan.ParentType == 'Star' then
	    if scan.PlanetClass and string.find(string.lower(scan.PlanetClass), 'gas giant') and (scan.OrbitalPeriod <= 864000) then
	        return true,
	            'Hot Jupiter',
	            'Orbital Period: ' .. math.floor(scan.OrbitalPeriod/864)/100 .. ' days'
	    end
	end
end
::End::



-----------------------
-- 1.4: MASSIVE PLANET
-----------------------
--Triggers for planets with a mass (in Earth masses) above the specified threshold.
::Criteria::
if triggerForMassivePlanets == true then
	if scan.PlanetClass and scan.MassEM  > massivePlanetThreshold
		then
			return true, 'Massive planet',"Mass: " .. formatNumber(math.floor(scan.MassEM)) .. ' EM' .. " // Body type: " .. scan.PlanetClass
	end
end
::End::



-----------------------------------------------
-- 1.5: RINGED M, NEUTRON AND WHITE DWARF STARS
-----------------------------------------------
::Criteria::
if triggerForRingedStar == true then
	if (scan.StarType == 'M' or scan.StarType == 'N' or string.startsWith(scan.StarType, "D")) and scan.Rings then
	  for ring in rings(scan.Rings) do
	      if (string.find(ring.name, "Ring")) then
	        local starTypeDesc = 'Neutron'
	        if string.startsWith(scan.StarType, "D") then
	          starTypeDesc = 'White Dwarf ('.. scan.StarType .. ')'
	        elseif scan.StarType == 'M' then
	          starTypeDesc = 'M-class'
	        end
	        return true, 'Ringed '.. starTypeDesc ..' Star', ''
	      end
	  end
	end
end
::End::



--------------------
-- 1.6: SMALL OBJECT
--------------------
--Simple ping for small objects. The radius threshold is set by the smallBodyThreshold variable in Global.
::Criteria::
if triggerForSmallObject == true then
	if scan.Radius <= smallBodyThreshold and scan.PlanetClass and scan.PlanetClass ~= "Barycentre" then
		local canLand = ''
		if scan.Landable then --adds "landable" text to the notification if moon is landable
			canLand = 'landable '
		end
		return true, 'Small ' .. canLand .. 'object' .. string.char(10) .. '(' .. math.floor(scan.Radius/1000) .. ' km)', 
		"Body type: " .. scan.PlanetClass .. string.char(10) .. "Specific radius: " .. Round((scan.Radius/1000),4) .. ' km'
	end
end



---------------------------
-- 1.7: UNDISCOVERED SYSTEM
---------------------------
--Simple ping for when you hit an undiscovered system.
::Criteria::
if triggerForUndiscoveredSystem == true then
	if scan.ScanType ~= "NavBeaconDetail" and scan.PlanetClass ~= "Barycentre" and not scan.WasDiscovered and scan.DistanceFromArrivalLS == 0 then
		return true, "Undiscovered system", "Primary Star: " .. scan.StarType
	end
end
::End::



------------------------
-- 2.1: HELIUM GAS GIANT
------------------------
--Simple ping for if you actually find a very rare Helium Gas Giant
::Criteria::
if triggerForHeliumGasGiant == true then
	if scan.PlanetClass and string.match(scan.PlanetClass,'Helium gas giant') then
		return true, "**HELIUM GAS GIANT**", 
		scan.Planetclass
	end
end
::End::



-----------------------------
-- 2.2: HELIUM-RICH GAS GIANT
-----------------------------
--Simple ping when scanning a Helium-rich gas giant
::Criteria::
if triggerForHeliumRichGasGiant == true then
	if scan.PlanetClass and string.match(scan.PlanetClass,'Helium rich gas giant') then
		local ringedHRGG = ""
		if scan.Rings then
			ringedHRGG = " with ring"
		end
		for mat in materials(scan.AtmosphereComposition) do
			if mat.name == 'Helium' then
				percentH = Round(mat.percent,2)
			end
		end
		return true, "Helium-rich gas giant" .. ringedHRGG, "Helium content: " .. percentH .. "%"

	end
end
::End::



-----------------------
-- 2.3: HIGH-VALUE BODY
-----------------------
--Simple ping for high-value bodies - that is, terraformables, ammonia worlds, and earth-like worlds.
::Criteria::
if triggerForHighValueBody == true then 
	local isTerraformable = ""
	local isLandable = ""
	local atmoType = ""
	if highValueClasses[scan.PlanetClass] then
		if (scan.TerraformState and #scan.TerraformState > 0) then
			isTerraformable = " // Terraformable"
		elseif not pingNonTerraformableClasses[scan.PlanetClass] then
			return false
		end
		if scan.Landable then
			isLandable = " // Landable"
		end
		return true, 'High value body', scan.PlanetClass .. isTerraformable .. isLandable -- .. atmoType
	end
end
::End::



--------------------------------------------------------------------------------
-- 2.4: POTENTIAL GREEN GAS GIANT / -- 2.5: POTENTIAL GREEN PROTO-STAR
--------------------------------------------------------------------------------
::Criteria::
--Check Gas Giants against known GGG surface temperatures - By DaftMav
--Keep in mind: Observatory unfortunately gives us inaccurate values with scan.SurfaceTemperature as a float
--and not the actual journal log values, until it gives us exact values as string this will be somewhat inaccurate.
if triggerForPotentialGGG == true then
	if scan.PlanetClass and string.find(string.lower(scan.PlanetClass), 'giant') then
		local realTemp = tonumber(string.format('%.6f', scan.SurfaceTemperature)) -- Sadly required to kinda fix Observatory's faulty data...
		if has_value(KnownGGGTemperatures[scan.PlanetClass], realTemp) then
			return true, 'GREEN GAS GIANT??', 'Matches known GGG surface temperature of ' .. realTemp .. ' K'
			.. string.char(10) .. scan.PlanetClass
		else
			local result, knowntmp = in_ranges(NearGGGTemperatures[scan.PlanetClass], realTemp)
			if result then
				return true, 'Potential green gas giant', 'Surface temperature ' .. realTemp .. ' K is close to known GGG with ' .. knowntmp .. ' K'
				.. string.char(10) .. scan.PlanetClass
			end
		end
	end
end

--Check for bugged protostars (Pink/Green lighting) - By DaftMav
--Checks against known strange star surface temperatures AND temperatures ending perfectly on 000.0 or 00.0
--This bug may cause the star to be dark and give off bright pink/green lighting nearby the star and on bodies in-system.
if triggerForProtostarTemps == true then
	if scan.StarType and scan.StarType ~= nil then
		if scan.StarType == 'TTS' or scan.StarType == 'AeBe' then
			local realTemp = tonumber(string.format('%.6f', scan.SurfaceTemperature)) -- Sadly required to kinda fix Observatory's faulty data...
			if has_value(StrangeProtostarTemperatures[scan.StarType], realTemp) then
				return true, 'Likely bugged protostar', 'Check for pink/green lighting, Star has known strange surface temperature of ' .. realTemp .. 'K'
				.. string.char(10) .. 'Spectral class: ' .. scan.StarType .. scan.Subclass .. ' ' .. scan.Luminosity
			end
			if ProtostarAllTemps then
				if tostring(realTemp):match("(0+0+%.?0?)$") ~= nil then
					-- This matches temperatures ending in 00 or 000 with an optional .0 added (since Lua reduces numbers like 158.000000 to one decimal)
					return true, 'Possible bugged protostar', 'Check for pink/green lighting, surface temperature ends in zeros...' .. string.char(10) .. 
								 'Spectral class: ' .. scan.StarType .. scan.Subclass .. ' ' .. scan.Luminosity .. ', Surface temperature: ' .. realTemp .. ' K'
				end
			end
		end
	end
end
::End::



-----------------------------------
-- 2.6: POTENTIAL HELIUM RICH BOXEL
-----------------------------------
--This pushes a notification when you might have found a Helium-rich boxel.
::Criteria::
if triggerForHRB == true then
	-- the following checks to see if you have scanned a star system and a gas giant  
	if(scan.StarSystem and scan.PlanetClass and (string.match(scan.PlanetClass,'Helium') or string.match(scan.PlanetClass,'Sudarsky'))) then 
		local systemName = scan.StarSystem
		if string.find(systemName,'[%p][%d]-$') then --checks to see if this has a dashed system number after the mass code
			currentBoxel = systemName:gsub('[%p][%d]-$','') --removes the dash and the last half of the system number
		else
			currentBoxel = systemName:gsub('[%d-]+$','') --for systems without a dashed system number, it removes the number and leaves only the mass code.
		end
		if(currentBoxel ~= lastHeliumBoxel) then -- now that we have turned a system name into just its boxel, 
												-- we can see whether we are still in the same boxel as the last helium-rich boxel we visited
			for mat in materials(scan.AtmosphereComposition) do
			-- below is the check to see if the helium content of the gas giant we just scanned is higher than the user-set threshold for an HR boxel.
				if mat.name == 'Helium' and mat.percent >= heliumMinimum then 
				-- this saves our most recently found helium rich boxel into this variable, so we don't get pinged for each system we visit in the same boxel.
					lastHeliumBoxel = currentBoxel 
					return true,'Potential helium rich boxel', "System helium content: " .. string.format("%.2f",mat.percent) .. '%'
				end
			end
		end
	end
end
::End::


-----------------------------------
-- 2.7: RARE BODY WITH RING
-----------------------------------
::Criteria::
if triggerForRingedRare == true then
	if (scan.PlanetClass == 'Earthlike body' or scan.PlanetClass == 'Water world' or scan.PlanetClass == 'Ammonia world') and scan.Rings then
		local planetType = ''
		if scan.PlanetClass == 'Earthlike body' then
			planetType = 'Earth-like world'
		end
		if scan.PlanetClass == 'Water world' then
			planetType = 'water world'
		end
		if scan.PlanetClass == 'Ammonia world' then
			planetType = 'ammonia world'
		end
		return true, "Ringed " .. planetType, "Distance from arrival: " .. formatNumber(math.floor(scan.DistanceFromArrivalLS)) .. ' LS'
	end
end
::End::



------------------
-- 3.1: MASSIVE RING
------------------
::Criteria::
if triggerForMassiveRing == true then
	validRings = 0
	local result = ""
	if hasRings(scan.Rings) then
		for ring in rings(scan.Rings) do
			if not (string.find(ring.name, "Belt")) then
				if math.floor(ring.massmt) >= (ringMassThreshold * 1000000000000) and largeRingTypes[ring.ringclass] then
					local ringType = ""
					local ringDiameter = Round(((ring.outerrad * 2) / kmInLS),2)
					local ringWidth = Round(((ring.outerrad - ring.innerrad) / kmInLS),2)
					local ringMass = math.floor(((ring.massmt / 1000)))
					validRings = validRings + 1
					if ring.ringclass == "eRingClass_Icy" then
						ringType = "icy"
					elseif ring.ringclass == "eRingClass_Rocky" then
						ringType = "rocky"
					elseif ring.ringclass == "eRingClass_MetalRich" then
						ringType = "metal rich"
					elseif ring.ringclass == "eRingClass_Metalic" then
						ringType = "metallic"
					end
					result = result .. ring.name .. string.char(10) .. 
					"Ring type: " .. ringType .. " // Mass: " .. formatNumber(ringMass) .. " Gt" .. string.char(10) .. 
					"Diameter: " .. formatNumber(ringDiameter) .. " LS // Width: " .. formatNumber(ringWidth) .. " LS" .. string.char(10)
				end
			end
		end
		if validRings > 0 then
			return true, "Massive ring", result
		end
	end
end
::End::



-------------------------------------------------------
-- 3.2: NARROW RING GAP WITH HIGH ROTATIONAL DIFFERENCE
-------------------------------------------------------
--[[This checks for a narrow gap between A and B rings, and tests their individual rotational speeds.
	If there is a significant difference in orbital period, triggers the notification.
]]--
::Criteria::
if triggerForRingGapWithSpeedDifferential == true then
	if hasRings(scan.Rings) and scan.Rings.Count >= 2 then
	  -- Only checks 2 innermost rings because 3rd rings are rarely visible.
	  local G = 6.674 * (10^(-11))
	  local bodyMass_kg = scan.MassEM * 5.972*(10^24)
	  local innerRing = scan.Rings[0]
	  local outerRing = scan.Rings[1]
	  -- Radii are specified in meters.
	  local innerRingWidth_m = innerRing.OuterRad - innerRing.InnerRad
	  local ringGap_km = (outerRing.InnerRad - innerRing.OuterRad) / 1000
	  local innerRingAvgRad_m = (innerRing.OuterRad + innerRing.InnerRad) / 2
	  local outerRingAvgRad_m = (outerRing.OuterRad + outerRing.InnerRad) / 2
	  
	  local innerRingOrbitalVelocity_kmps = math.sqrt(G * (bodyMass_kg / innerRingAvgRad_m)) / 1000
	  local outerRingOrbitalVelocity_kmps = math.sqrt(G * (bodyMass_kg / outerRingAvgRad_m)) / 1000
	  local ringVelocityDelta_kmps = math.abs(outerRingOrbitalVelocity_kmps - innerRingOrbitalVelocity_kmps)
	  
	  if ringGap_km <= 99 and ringVelocityDelta_kmps >= 5 then
		local ringWidthText = ''
		if innerRingWidth_m >= 299792458/10 then
		  ringWidthText = Round(innerRingWidth_m / 299792458, 1) ..' ls'
		else
		  ringWidthText = math.floor(innerRingWidth_m / 1000) ..' km'
		end
		
		return true, 'Narrow ring gap with high rotational difference', 'Gap: ' .. math.floor(ringGap_km) ..
					 ' km; Inner ring width: ' ..  ringWidthText .. 
					 '; Ring velocity delta: ' .. Round(ringVelocityDelta_kmps, 1) .. 
					 ' km/s; Inner ring velocity: ' .. Round(innerRingOrbitalVelocity_kmps, 1) .. 
					 ' km/s, Outer ring velocity: ' .. Round(outerRingOrbitalVelocity_kmps, 1) .. ' km/s'
	  end
	end
end
::End::



-------------------------------------------
-- 3.3: RING PROXIMITY / SHEPHERD MOON
-------------------------------------------
--Ping for shepherd moons and bodies close to the outside of a ring.
-- Replacement for the built in 'Close Ring Proximity' and 'Shepherd Moon'
-- Triggers for a Landable (or not) Moon which is very close to a Parent with Ring
-- Triggers also for Shepherd Moons 
::Criteria::
--this cancels the function if the object scanned is a ring.
if triggerForRingProximity == true then
	local scanRing = false
	if string.find(scan.BodyName, "Ring") then
		scanRing = true
	end
	--set up variables for the function
	if parents and scanRing == false then
		local hasBelt = false
		local outerRadius = {}
		local innerRadius = {}
		local canLand = ''
		local shepherd = false
		local moonOrbit = 0
		local ringCount = 0
		
		if parents[0].Scan and parents[0].Scan.Rings then --check for parents with rings
			for ring in rings(parents[0].Scan.Rings) do --ends the function if an asteroid belt is detected?
				if (string.find(ring.name, "Belt")) then
					hasBelt = true
				else 
					ringCount = ringCount + 1 --increments for every valid ring
					innerRadius[ringCount] = ring.innerrad / 1000 --adds the inner radius of each ring to the innerRadius table.
					outerRadius[ringCount] = ring.outerrad / 1000 --adds the outer radius of each ring to the outerRadius table.
				end
			end
			if hasBelt == false then --continues the function if the rings detected are, in fact, rings
				if scan.Landable then --adds "landable" text to the notification if moon is landable
					canLand = 'Landable'  .. string.char(10)
				end
				moonOrbit = math.floor(scan.SemiMajorAxis / 1000) --sets the orbital distance of the body scanned
				-- the following subtracts the outer radius of the outermost ring from the orbital distance of the moon. 
				-- if negative, that means the moon is inside the ring.
				if (moonOrbit - outerRadius[ringCount]) < 0 and triggerForShepherdMoon == true then 
					return true, 'Shepherd moon' .. string.char(10) .. canLand,
					'Distance to inner ring: ' .. formatNumber(math.floor(innerRadius[1])) ..' km // Orbit: ' .. formatNumber(moonOrbit) .. ' km' .. string.char(10) .. 'Distance to outer ring: ' .. formatNumber(math.floor(outerRadius[ringCount])) .. ' km'
				end
				-- the following checks to see if a barycenter is close to a ring
				if scan.PlanetClass == 'Barycentre' and math.abs((moonOrbit - outerRadius[ringCount])) < closeRingDistance then 
					return true, 'Barycenter is close to ring',
								 'Orbit: ' .. moonOrbit .. ' km' .. string.char(10) .. 
								 'Ring radius: ' .. formatNumber(outerRadius[ringCount]) .. string.char(10) .. 
								 'Distance to ring: ' .. formatNumber(moonOrbit - outerRadius[ringCount]) .. ' km'
					
				end
				if math.abs((moonOrbit - outerRadius[ringCount])) < closeRingDistance then -- subtract the outer radius of the outermost ring from the orbit of the moon,
					return true, 'Close ring proximity' .. string.char(10) .. canLand ..
									 'Distance to ring: ' .. math.floor(moonOrbit - outerRadius[ringCount]) .. ' km',
									 'Orbit: ' .. formatNumber(moonOrbit) .. ' km' .. ', Moon radius: ' .. math.floor(scan.Radius/1000) .. ' km' .. string.char(10) .. 
									 'Ring radius: ' .. formatNumber(math.floor(outerRadius[ringCount])) .. ' km' .. ', Distance to ring: ' .. math.abs(math.floor(moonOrbit - outerRadius[ringCount])) .. ' km'
				end
			end
		end
	end
end
::End::



-------------------------------------
-- 3.4: RING WITH FAST ORBITAL PERIOD
-------------------------------------
--A ring with an orbital period shorter than ringOrbitalPeriodThreshold will trigger the "Ring has fast orbital period" notification.
::Criteria::
if triggerForRingWithFastOrbitalPeriod == true then
	if hasRings(scan.Rings) then
		local G = 6.674 * (10^(-11))
		local planetMass = scan.MassEM * 5.972*(10^24)
		local starMass = scan.StellarMass * 1.988*(10^30)
		local velocityResult = ""
		local periodResult = ""
		
		for ring in rings(scan.Rings) do
			if not (string.find(ring.name, "Belt")) then
				local averageRadius = (ring.outerrad + ring.innerrad) / 2 -- get average radius for the ring in meters, Elite uses this for calcs
				local orbitalVelocity = math.sqrt(G * (planetMass / averageRadius)) / 1000 --in km/s
						
				if orbitalVelocity == 0 then --recalc velocity if it is a star rather than a planet
					orbitalVelocity = math.sqrt(G * (starMass / averageRadius)) / 1000 --in km/s
				end
				
				local ringCircumference = 2 * (3.1415926 * (averageRadius / 1000)) --in km
				local ringOrbitalPeriod = (ringCircumference / orbitalVelocity) --in seconds
				
				if ringOrbitalPeriod <= ringOrbitalPeriodThreshold then
					periodResult = periodResult .. "Ring: " .. ring.name .. string.char(10) .. formatTime(ringOrbitalPeriod)
				end
			end
			if periodResult ~= "" then
				return true, "Ring has fast orbital period", periodResult
			end
		end
	end
end
::End::



---------------------------------------
-- 3.5: RING WITH HIGH ORBITAL VELOCITY
---------------------------------------
--A ring with an orbital velocity higher than ringVelocityThreshold will trigger the "Ring has high orbital velocity" notification.
::Criteria::
if triggerForHighVelocityRing == true then
	if hasRings(scan.Rings) then
		local G = 6.674 * (10^(-11))
		local planetMass = scan.MassEM * 5.972*(10^24)
		local starMass = scan.StellarMass * 1.988*(10^30)
		local velocityResult = ""
		
		for ring in rings(scan.Rings) do
			if not (string.find(ring.name, "Belt")) then
				local averageRadius = (ring.outerrad + ring.innerrad) / 2 -- get average radius for the ring in meters
				local orbitalVelocity = math.sqrt(G * (planetMass / averageRadius)) / 1000
						
				if orbitalVelocity == 0 then --recalc velocity if it is a star rather than a planet
					orbitalVelocity = math.sqrt(G * (starMass / averageRadius)) / 1000
				end
				
				if orbitalVelocity >= ringVelocityThreshold then
					velocityResult = velocityResult .. "Ring: " .. ring.name .. string.char(10) .. 
													   "Velocity: " .. Round(orbitalVelocity,2) .. " km/s" .. string.char(10)
				end
				if velocityResult ~= "" then
					return true, "Ring has high orbital velocity", velocityResult
				end
			end
		end
	end
end
::End::



---------------------------------------------
-- 3.6: TAYLOR'S RINGS AND OTHER NARROW RINGS
---------------------------------------------
--Narrow single ring - Single ring with a width less than 1/4th (25%) of its body's diameter (0.5 could be reduced to 0.4 for 20% max)
--Taylor's Ring - Thin single ring with a width less than 1/8th (12.5%) of its body's diameter.
::Criteria::
if triggerForNarrowRings == true then
if (scan.Rings and scan.Rings.Count == 1 and string.find(scan.Rings[0].Name, ' Ring') and 
   ((scan.Rings[0].OuterRad - scan.Rings[0].InnerRad) / (scan.Radius * 2) <= narrowRingThreshold)) then
	local ringwidth = ((scan.Rings[0].OuterRad - scan.Rings[0].InnerRad) / 1000)
	local diameter = scan.Radius / 1000 * 2
	local thinness = Round((ringwidth / diameter * 100),2)
	local found = "Narrow single ring (" .. math.floor(thinness) .. "% of body diameter)"
	if ((scan.Rings[0].OuterRad - scan.Rings[0].InnerRad) / (scan.Radius * 2) <= 0.125) then
		found = "Taylor's ring"
	end
	return true, found, "Ring width: " .. formatNumber(math.floor(ringwidth)) .. " km // Body diameter: " .. formatNumber(math.floor(diameter)) .. " km (" .. thinness .. "%)"
	.. string.char(10) .. scan.PlanetClass .. ', Distance from arrival: ' .. formatNumber(math.floor(scan.DistanceFromArrivalLS)) .. ' LS'
	end
end
::End::



--------------------------
-- 4.1: GEOLOGICAL SIGNALS
--------------------------
--Triggers for any body containing geological signals, returns the number of signals, the type of volcanism present, and the average surface temp.
::Criteria::
if triggerForGeoSignals == true then
    if scan.Landable then
        if geosignals > 0 then
            
            -- remove excess wording in volcanism field for short popup display
            volcanism = string.gsub(scan.Volcanism, "minor ", "")
            volcanism = string.gsub(volcanism, "major ", "")
            volcanism = string.gsub(volcanism, " volcanism", "")

            -- round average temperature down to nearest whole degree
            temp = math.floor(scan.SurfaceTemperature)        

            return true, "Geological signals (" .. geosignals .. ")" .. string.char(10) .. volcanism, "Planet type: " .. scan.PlanetClass .. string.char(10) .. "Surface temp: " .. temp .. " K"
        end
    end
end
::End::



-------------------------------------------------------------------
-- 4.2: HIGH ORBITAL INCLINATION, LANDABLE, CLOSE TO BODY WITH RING
-------------------------------------------------------------------
--Ping for landable bodies with stunning views of their parent's ring(s).
::Criteria::
if triggerForHighIncLandableRingProx == true then
	if (scan.PlanetClass and scan.Landable and math.abs(scan.OrbitalInclination) > inclinationThreshold and 
	   (scan.SemiMajorAxis / 300000000) < 10 and parents ~= nil and parents[0].Scan and parents[0].Scan.Rings) then
	  for parentRing in rings(parents[0].Scan.Rings) do
		if (string.find(parentRing.name, 'Ring')) then
			local withAtmosphere = ""
			if scan.Atmosphere ~= "" then
				withAtmosphere = " // " .. scan.Atmosphere
			end
		  return true, "High orbital inclination (" .. math.floor(scan.OrbitalInclination) .. "°)" .. string.char(10) .. 
		  			   "Close to ringed parent (" .. Round((scan.SemiMajorAxis / 300000000),2) .. " LS)" .. string.char(10) .. 
		  			   "Landable" .. withAtmosphere,
		  			   "Body Type: " .. scan.PlanetClass .. string.char(10) .. 
					   'Surface temperature: '..math.floor(scan.SurfaceTemperature)..' K'
		end
	  end
	end
end
::End::



------------------------------------------
-- 4.3: HORIZONS BIOLOGICAL SIGNALS LIKELY
------------------------------------------
::Criteria::
if triggerForHorizonsBios == true then
	if scan.Landable and scan.Atmosphere == '' and biosignals > 0 then
		return true, "Landable with no atmosphere" .. string.char(10) .. 
		string.format('and %i biological signal%s', biosignals, biosignals > 1 and 's' or ''), ""
	end
end
::End::



----------------------------------
-- 4.4: HOT LANDABLE
----------------------------------
--[[Triggers for any landable with a surface temperature above threshold, and calls out if a landable has a surface temperature
	at 800 K or higher, at which point the commander will slowly burn to death.
]]--
::Criteria::
if triggerForHotLandable == true then

	local tTemp = hotLandableThreshold
	local regularHot = ""
	local extraHot = ""
	
	if lethalOnly == true then
		tTemp = 800
	end
	if scan.PlanetClass and scan.Landable and scan.SurfaceTemperature >= tTemp then
		if scan.SurfaceTemperature >= 800 then
			extraHot = "Lethal surface temperature" .. string.char(10)
		end
		if lethalOnly == false and scan.SurfaceTemperature < 800 then
			regularHot = "Hot landable body" .. string.char(10)
		end
		return true, regularHot .. extraHot .. math.floor(scan.SurfaceTemperature) .. ' K', "Body type: " .. scan.PlanetClass
	end
end
::End::



------------------------------------
-- 4.5: LANDABLE AND CLOSE TO A STAR
------------------------------------
-- NOTE: this criteria only works on bodies with direct parents - bodies with Barycenters for parents will not be detected.
::Criteria::
if triggerForLandableAndStarProx == true then
	if scan.Landable and parents and parents[0].Scan then
	local parentStar 		= ''
	local parentDistance 	= 999999
	local parentRadius		= 0
	local parentStarType	= ''
	local distanceQuotient	= 999999
	local withAtmosphere 	= ' (no atmosphere)'
	local smallStar		 	= false	

		quotientThreshold = baseQuotient
		if scan.Atmosphere ~= "" then
			withAtmosphere = " (" .. scan.Atmosphere .. ")"
			quotientThreshold = baseQuotient + atmoBump
		end
		parentDistance = scan.SemiMajorAxis / kmInLS 				-- this is the distance from the scanned body to its direct parent, 
													 				-- at the furthest point in its orbit, given in LS.

																	-- This function triggers if the scanned body has a star as a direct parent.
		if parents[0].Scan.StarType then 							--checks to see if the scanned body has a star for a direct parent.
			parentStarType = parents[0].Scan.StarType
			parentStar = 'Parent: ' .. parents[0].Scan.BodyName .. ' / Star Type: ' .. parentStarType 
										 							-- if so, we assign labels to the parent star to be used later.
			parentRadius = parents[0].Scan.Radius/1000/solRadius 	-- we get the radius of the star relative to the radius of Sol.
			distanceQuotient = (parentDistance / parentRadius) * 10 -- divide the distance between the star and scanned body (in LS) 
																	-- by the radius of the star. now we have a distance quotient based on the star's size. 
																	-- the smaller the number, the larger the star will loom in the sky.
			if distanceQuotient ~= 0 and distanceQuotient >= quotientThreshold then
				distanceQuotient = 999999 							-- this is just to reset the quotient if it does not apply to this star.
			end
		end

																	-- For small stars, we use this straight distance threshold instead, 
																	-- since their size to brightness ratio is so different from other stars 
																	-- and the quotient system breaks down.
		if distanceQuotient > quotientThreshold then 				-- if the quotient is larger than the compiled threshold 
																	-- (base + atmo), we check to see if it is an especially small star type.
			local checkstars = {"N","H","X","D","DA","DAB","DAO","DAZ","DAV","DB","DBZ","DBV","DO","DOV","DQ","DC","DCV","DX"}
			for _,star in pairs(checkstars) do
				if star == parentStarType and parentDistance <= smallStarThreshold then 
					smallStar = true								-- if the star is small, compare it against a different, static distance threshold (in LS)
																	-- set in Globals. since all small star types are of similar size, no quotient is needed.
					distanceQuotient = 0
				end
			end
		end

		if distanceQuotient ~= 0 and distanceQuotient <= quotientThreshold then
			return true, --if the quotient calculated above is smaller than the threshold set in the Global variables, trigger a notification.
			'Close star proximity (' .. parentStarType .. ')' .. string.char(10) .. 
			'Landable' .. withAtmosphere .. string.char(10) .. 
			'Proximity score: ' .. math.floor(distanceQuotient),

			"Parent star type: " .. parentStarType .. string.char(10) .. 
			'Distance from star: ' .. Round(parentDistance,2) .. ' LS' .. string.char(10) .. 
			'Distance from arrival: ' .. formatNumber(Round(scan.DistanceFromArrivalLS,2)) .. ' LS'
			
		elseif smallStar == true then
			return true,
			'Landable' .. withAtmosphere .. ' is ' .. Round(parentDistance,2) ..' LS away from star of Type ' .. parentStarType,
									'Distance from Arrival: ' .. Round(scan.DistanceFromArrivalLS,2) .. ' LS'
			
		else
			return false
		end
	end
end
::End::



------------------------------------------
-- 4.6: LANDABLE MOON CLOSE TO A RARE BODY
------------------------------------------
--[[This function checks the parent's planet class of landable bodies with close orbits 
	(the distance threshold can be adjusted in Global). If the planet class of the parent is 
	an Earth-like world, a water world, or an ammonia world, it will trigger the notification.
]]--
::Criteria::
if triggerForLandableAndCloseToRare == true then
	local orbitDistance = (scan.SemiMajorAxis / kmInLS)
	if scan.Landable and (orbitDistance <= terraMoonThreshold) and parents then
		local planetType = ""
		local hasRings = ""
		local atmoType = "(no atmosphere)"
		if parents[0].Scan then
			if parents[0].Scan.PlanetClass == "Earthlike body" then
				planetType = "earth-like world"
			elseif parents[0].Scan.PlanetClass == "Water world" then
				planetType = "water world"
			elseif parents[0].Scan.PlanetClass == "Ammonia world" then
				planetType = "ammonia world"
			end
		end
		if scan.Atmosphere ~= "" then
			atmoType = "with " .. scan.Atmosphere
		end
		if parents[0].Scan and parents[0].Scan.Rings then
			for parentRing in rings(parents[0].Scan.Rings) do
				if (string.find(parentRing.name, 'Ring')) then
					hasRings = "ringed "
				end
			end
		end
		if planetType ~= "" then
			return true, "Close orbit to " .. hasRings .. planetType .. string.char(10) .. 
			"Landable " .. atmoType .. string.char(10) ..
			"Orbital distance: " .. Round(orbitDistance,2) .. " LS", "Body Type: " .. scan.PlanetClass
		end
	end
end
::End::



--------------------------------
-- 4.7: LANDABLE WITH ATMOSPHERE
--------------------------------
::Criteria::

--[[This function checks a scanned atmosphere against the table of previously discovered atmospheres.
	If not found, returns that a new atmosphere type has been discovered.
]]--
function testForNewAtmosphere(atmo)
	local newAtmo = true
	for k,v in pairs(Excluded_Atmospheres) do
		if atmo == k then
			newAtmo = false
		end
	end
	if newAtmo == true then
		return true
	else
		return false
	end
end

if triggerForLandableAtmosphere == true then
	local withLife = ""
	local rarity = ""
	if scan.Landable and scan.Atmosphere ~= "" and not Excluded_Atmospheres[scan.AtmosphereType] then
		if biosignals > 0 and pingLife == true then
			withLife = "and " .. string.format('%i biological signal%s', biosignals, biosignals > 1 and 's' or '')
		end
		
		if scan.AtmosphereType == "Water" or scan.AtmosphereType == "WaterRich" or scan.AtmosphereType == "Oxygen" then
			rarity = "(Rare atmosphere)"
		end
		
		if scan.AtmosphereType == "Helium" and scan.PlanetClass ~= "Icy body" then
			rarity = "(Rare body type for this atmosphere)"
		end
		
		if scan.AtmosphereType == "SilicateVapour" or scan.AtmosphereType == "AmmoniaRich" then
			rarity = "(VERY rare atmosphere)"
		end
		if testForNewAtmosphere(scan.AtmosphereType) == true then
			rarity = "NEW LANDABLE ATMOSPHERE"
		end
		return true, "Landable with " .. scan.Atmosphere .. string.char(10) .. withLife, scan.PlanetClass .. string.char(10) .. rarity
	end
end
::End::



----------------------------------
-- 4.8: LANDABLE WITH HIGH GRAVITY
----------------------------------
--This triggers for any landable body with surface gravity greater than gravityThreshold.
::Criteria::
if triggerForHighG == true then
	local onFootProhibited = ""
	local gravityCalc = (scan.SurfaceGravity/9.81)
	if gravityCalc >= 2.7 then
		onFootProhibited = "SRV disembarkment only"
	end
	if scan.Landable and gravityCalc >= gravityThreshold then
		return true, "Landable with high gravity" .. string.char(10) ..	"(" .. Round(gravityCalc,2) .. " G)" .. string.char(10) .. onFootProhibited, "Body type: " .. scan.PlanetClass .. string.char(10) .. "Surface temperature: " .. math.floor(scan.SurfaceTemperature) .. " K"
	end
end
::End::



---------------------------
-- 4.9: LARGE LANDABLE BODY
---------------------------
--This triggers for any landable body larger than largeLandableThreshold.
::Criteria::
if triggerForLargeLandable == true then
	if scan.Landable and scan.Radius >= largeLandableThreshold then
		local gravityCalc = (scan.SurfaceGravity/9.81)
		return true, "Large landable body" .. string.char(10) .. 
		"Radius: " .. formatNumber(math.floor(scan.Radius / 1000)) .. " km // " .. Round(gravityCalc,2) .. " G)", 
		"Body Type: " .. scan.PlanetClass .. string.char(10) .. 
		"Surface temperature: " .. math.floor(scan.SurfaceTemperature) .. " K"
	end
end
::End::



-----------------------------------
-- 4.10: RINGED ATMOSPHERIC LANDABLE
-----------------------------------
--This triggers for a ringed, landable body with an atmosphere.
::Criteria::
if triggerForRingedAtmosphericLandable == true then
	local atmoType = ""
	local planetType = ""
	local parentStarType = ""

	if scan.Landable and scan.Rings and scan.Atmosphere ~= "" then
		atmoType = scan.Atmosphere
		
	-- This area is under construction.
	--	if parents[0] and parents[0].ParentType == "Star" then
	--		parentStarType = " // Parent Star Type: " .. parents[0].Scan.StarType
	--	elseif parents[1] and parents[1].ParentType == "Star" and parents[1].Scan.StarType then --for if the body is a moon
	--		local starString = parents[1].Scan.StarType
	--		parentStarType = " // Parent Star Type: " .. starString
	--	elseif parents[2] and parents[2].ParentType == "Star" then --for if the body is a nested moon
	--		parentStarType = " // Parent Star Type: " .. parents[2].Scan.StarType
	--	end


		return true, "Ringed atmospheric landable" .. string.char(10) .. "(" .. atmoType .. ")",
		"Body type: " .. scan.PlanetClass .. string.char(10) .. "Distance from arrival: " .. formatNumber(math.floor(scan.DistanceFromArrivalLS)) .. ' LS' --.. " // " .. parentStarType
	end
end
::End::


----------------------
-- 5.1: Complex Orbits
----------------------

::Criteria=Complex Orbit::
if (scan.StarSystem == nil) then
  return false
end
if(scan.SystemAddress ~= complex_id64) then
    complex_id64 = scan.SystemAddress
    complex_b = {}
end
local c=0
local f=0
local id=''
if (string.match(scan.BodyName," [ABCDEFGHIJ]$") or (scan.StarSystem and scan.BodyName == scan.StarSystem)) then
    for parent in allparents(parents) do
        complex_b[parent.body] = true
    end
elseif not(string.match(scan.BodyName," Belt Cluster ") or (scan.PlanetClass and scan.PlanetClass=='Barycentre')) then
    for parent in allparents(parents) do
        if(c==0 or f > 0) then
            if(parent.parenttype ~= 'Null' or complex_b[parent.body]) then
                f = -f
            elseif(parent.parenttype=='Null') then
                f = f + 1
                id = scan.StarSystem .. ':' .. parent.body
            end
        end    
        c = c+1
    end
    if(f < -1 and id ~= complex_id) then
        complex_id = id
        return true, 'Complex orbit detected', 'Complex orbit detected'
    end
end
::End::

----------------------------
-- 5.2: Giant Star in system
----------------------------

::Criteria::
if (scan.StarSystem == nil) then
  return false
end
if scan.StarType and string.find(string.lower(scan.StarType), "giant")
	then
		return true, "Giant Star Type in system", scan.StarType .. ' , Radius: ' ..  math.floor(scan.Radius / kmInLS ) .. ' LS'
end
::End::

----------------------------------
-- 5.3: Very High Surface Pressure
----------------------------------

::Criteria::
if scan.PlanetClass and scan.SurfacePressure > 101325000000 and not string.find(string.lower(scan.PlanetClass), 'gas giant') 
    then
        return true, 'Very High Surface Pressure', math.floor(scan.SurfacePressure / 101325) .. ' Atmospheres'
end
::End::

-------------------------------------------------------
-- 5.4: Galactic Records - taken from EDSM @ 2021-01-15
-------------------------------------------------------

--Metal Rich
::Record Breaker - Heaviest Metal Rich Body::
scan.PlanetClass == 'Metal Rich Body' and scan.scan.MassEM  > 715.21

::Record Breaker - Lightest Metal Rich Body::
scan.PlanetClass == 'Metal Rich Body' and scan.scan.MassEM  < 0.000017

::Record Breaker - Largest Metal rich body
scan.PlanetClass == 'Metal rich body' and scan.Radius > 20739000

::Record Breaker - Smallest Metal rich body
scan.PlanetClass == 'Metal rich body' and scan.Radius < 137389

::Record Breaker - Hottest Metal rich body
scan.PlanetClass == 'Metal rich body' and scan.SurfaceTemperature > 47991

::Record Breaker - Coldest Metal rich body
scan.PlanetClass == 'Metal rich body' and scan.SurfaceTemperature < 48


--High Metal Content
::Record Breaker - Heaviest High metal content
scan.PlanetClass == 'High metal content' and scan.MassEM  > 2212.64

::Record Breaker - Lightest High metal content
scan.PlanetClass == 'High metal content' and scan.MassEM  < 0.000031

::Record Breaker - Largest High metal content
scan.PlanetClass == 'High metal content' and scan.Radius > 75302600

::Record Breaker - Smallest High metal content
scan.PlanetClass == 'High metal content' and scan.Radius < 210243

::Record Breaker - Hottest High metal content
scan.PlanetClass == 'High metal content' and scan.SurfaceTemperature > 46101

::Record Breaker - Coldest High metal content
scan.PlanetClass == 'High metal content' and scan.SurfaceTemperature < 20


--Rocky Body
::Record Breaker - Heaviest Rocky body
scan.PlanetClass == 'Rocky body' and scan.MassEM  > 527.84

::Record Breaker - Lightest Rocky body
scan.PlanetClass == 'Rocky body' and scan.MassEM  < 0.000017

::Record Breaker - Largest Rocky body
scan.PlanetClass == 'Rocky body' and scan.Radius > 21765100

::Record Breaker - Smallest Rocky body
scan.PlanetClass == 'Rocky body' and scan.Radius < 181888

::Record Breaker - Hottest Rocky body
scan.PlanetClass == 'Rocky body' and scan.SurfaceTemperature > 51171

::Record Breaker - Coldest Rocky body
scan.PlanetClass == 'Rocky body' and scan.SurfaceTemperature < 20


--Icy Body
::Record Breaker - Heaviest Rocky ice body
scan.PlanetClass == 'Rocky ice body' and scan.MassEM  > 298.624

::Record Breaker - Lightest Rocky ice body
scan.PlanetClass == 'Rocky ice body' and scan.MassEM  < 0.000003

::Record Breaker - Largest Rocky ice body
scan.PlanetClass == 'Rocky ice body' and scan.Radius > 28515800

::Record Breaker - Smallest Rocky ice body
scan.PlanetClass == 'Rocky ice body' and scan.Radius < 276000

::Record Breaker - Hottest Rocky ice body
scan.PlanetClass == 'Rocky ice body' and scan.SurfaceTemperature > 6449

::Record Breaker - Coldest Rocky ice body
scan.PlanetClass == 'Rocky ice body' and scan.SurfaceTemperature < 20

::Record Breaker - Heaviest Icy body
scan.PlanetClass == 'Icy body' and scan.MassEM  > 2214.02

::Record Breaker - Lightest Icy body
scan.PlanetClass == 'Icy body' and scan.MassEM  < 0.000003

::Record Breaker - Largest Icy body
scan.PlanetClass == 'Icy body' and scan.Radius > 31232900

::Record Breaker - Smallest Icy body
scan.PlanetClass == 'Icy body' and scan.Radius < 160000

::Record Breaker - Hottest Icy body
scan.PlanetClass == 'Icy body' and scan.SurfaceTemperature > 4020

::Record Breaker - Coldest Icy body
scan.PlanetClass == 'Icy body' and scan.SurfaceTemperature < 0


--Earth-Like World
::Record Breaker - Heaviest Earth-like world
scan.PlanetClass == 'Earthlike world' and scan.MassEM  > 7.1

::Record Breaker - Lightest Earth-like world
scan.PlanetClass == 'Earthlike world' and scan.MassEM  < 0.026

::Record Breaker - Largest Earth-like world
scan.PlanetClass == 'Earthlike world' and scan.Radius > 11914000

::Record Breaker - Smallest Earth-like world
scan.PlanetClass == 'Earthlike world' and scan.Radius < 1944260

::Record Breaker - Hottest Earth-like world
scan.PlanetClass == 'Earthlike world' and scan.SurfaceTemperature > 497

::Record Breaker - Coldest Earth-like world
scan.PlanetClass == 'Earthlike world' and scan.SurfaceTemperature < 260


--Water World
::Record Breaker - Heaviest Water world
scan.PlanetClass == 'Water world' and scan.MassEM  > 741.438

::Record Breaker - Lightest Water world
scan.PlanetClass == 'Water world' and scan.MassEM  < 0.0687

::Record Breaker - Largest Water world
scan.PlanetClass == 'Water world' and scan.Radius > 29001200

::Record Breaker - Smallest Water world
scan.PlanetClass == 'Water world' and scan.Radius < 2640890

::Record Breaker - Hottest Water world
scan.PlanetClass == 'Water world' and scan.SurfaceTemperature > 902

::Record Breaker - Coldest Water world
scan.PlanetClass == 'Water world' and scan.SurfaceTemperature < 150


--Water Giant
::Record Breaker - Heaviest Water giant
scan.PlanetClass == 'Water giant' and scan.MassEM  > 1961.93

::Record Breaker - Lightest Water giant
scan.PlanetClass == 'Water giant' and scan.MassEM  < 17.2312

::Record Breaker - Largest Water giant
scan.PlanetClass == 'Water giant' and scan.Radius > 30857100

::Record Breaker - Smallest Water giant
scan.PlanetClass == 'Water giant' and scan.Radius < 15893000

::Record Breaker - Hottest Water giant
scan.PlanetClass == 'Water giant' and scan.SurfaceTemperature > 2715

::Record Breaker - Coldest Water giant
scan.PlanetClass == 'Water giant' and scan.SurfaceTemperature < 137


--Ammonia World
::Record Breaker - Heaviest Ammonia world
scan.PlanetClass == 'Ammonia world' and scan.MassEM  > 994.965

::Record Breaker - Lightest Ammonia world
scan.PlanetClass == 'Ammonia world' and scan.MassEM  < 0.07346

::Record Breaker - Largest Ammonia world
scan.PlanetClass == 'Ammonia world' and scan.Radius > 30695900

::Record Breaker - Smallest Ammonia world
scan.PlanetClass == 'Ammonia world' and scan.Radius < 2699670

::Record Breaker - Hottest Ammonia world
scan.PlanetClass == 'Ammonia world' and scan.SurfaceTemperature > 409

::Record Breaker - Coldest Ammonia world
scan.PlanetClass == 'Ammonia world' and scan.SurfaceTemperature < 27


--Gas Giant with water-based life
::Record Breaker - Heaviest Gas giant with water-based life
scan.PlanetClass == 'Gas giant with water based life' and scan.MassEM  > 1367.78

::Record Breaker - Lightest Gas giant with water-based life
scan.PlanetClass == 'Gas giant with water based life' and scan.MassEM  < 2.59026

::Record Breaker - Largest Gas giant with water-based life
scan.PlanetClass == 'Gas giant with water based life' and scan.Radius > 77844100

::Record Breaker - Smallest Gas giant with water-based life
scan.PlanetClass == 'Gas giant with water based life' and scan.Radius < 10265500

::Record Breaker - Hottest Gas giant with water-based life
scan.PlanetClass == 'Gas giant with water based life' and scan.SurfaceTemperature > 250

::Record Breaker - Coldest Gas giant with water-based life
scan.PlanetClass == 'Gas giant with water based life' and scan.SurfaceTemperature < 150


--Gas Giant with Ammonia based life
::Record Breaker - Heaviest Gas giant with ammonia-based life
scan.PlanetClass == 'Gas giant with ammonia based life' and scan.MassEM  > 909.973

::Record Breaker - Lightest Gas giant with ammonia-based life
scan.PlanetClass == 'Gas giant with ammonia based life' and scan.MassEM  < 1.79155

::Record Breaker - Largest Gas giant with ammonia-based life
scan.PlanetClass == 'Gas giant with ammonia based life' and scan.Radius > 77785400

::Record Breaker - Smallest Gas giant with ammonia-based life
scan.PlanetClass == 'Gas giant with ammonia based life' and scan.Radius < 9098770

::Record Breaker - Hottest Gas giant with ammonia-based life
scan.PlanetClass == 'Gas giant with ammonia based life' and scan.SurfaceTemperature > 150

::Record Breaker - Coldest Gas giant with ammonia-based life
scan.PlanetClass == 'Gas giant with ammonia based life' and scan.SurfaceTemperature < 100


--Class I Gas Giant
::Record Breaker - Heaviest Class I gas giant
scan.PlanetClass == 'Sudarsky class I gas giant' and scan.MassEM  > 911.079

::Record Breaker - Lightest Class I gas giant
scan.PlanetClass == 'Sudarsky class I gas giant' and scan.MassEM  < 0.00024

::Record Breaker - Largest Class I gas giant
scan.PlanetClass == 'Sudarsky class I gas giant' and scan.Radius > 77773900

::Record Breaker - Smallest Class I gas giant
scan.PlanetClass == 'Sudarsky class I gas giant' and scan.Radius < 550358

::Record Breaker - Hottest Class I gas giant
scan.PlanetClass == 'Sudarsky class I gas giant' and scan.SurfaceTemperature > 150

::Record Breaker - Coldest Class I gas giant
scan.PlanetClass == 'Sudarsky class I gas giant' and scan.SurfaceTemperature < 1


--Class II Gas Giant
::Record Breaker - Heaviest Class II gas giant
scan.PlanetClass == 'Sudarsky class II gas giant' and scan.MassEM  > 1368.23

::Record Breaker - Lightest Class II gas giant
scan.PlanetClass == 'Sudarsky class II gas giant' and scan.MassEM  < 2.6411

::Record Breaker - Largest Class II gas giant
scan.PlanetClass == 'Sudarsky class II gas giant' and scan.Radius > 90000000

::Record Breaker - Smallest Class II gas giant
scan.PlanetClass == 'Sudarsky class II gas giant' and scan.Radius < 10222800

::Record Breaker - Hottest Class II gas giant
scan.PlanetClass == 'Sudarsky class II gas giant' and scan.SurfaceTemperature > 250

::Record Breaker - Coldest Class II gas giant
scan.PlanetClass == 'Sudarsky class II gas giant' and scan.SurfaceTemperature < 150


--Class III Gas Giant
::Record Breaker - Heaviest Class III gas giant
scan.PlanetClass == 'Sudarsky class III gas giant' and scan.MassEM  > 3457.91

::Record Breaker - Lightest Class III gas giant
scan.PlanetClass == 'Sudarsky class III gas giant' and scan.MassEM  < 0.000245

::Record Breaker - Largest Class III gas giant
scan.PlanetClass == 'Sudarsky class III gas giant' and scan.Radius > 77849900

::Record Breaker - Smallest Class III gas giant
scan.PlanetClass == 'Sudarsky class III gas giant' and scan.Radius < 7955860

::Record Breaker - Hottest Class III gas giant
scan.PlanetClass == 'Sudarsky class III gas giant' and scan.SurfaceTemperature > 800

::Record Breaker - Coldest Class III gas giant
scan.PlanetClass == 'Sudarsky class III gas giant' and scan.SurfaceTemperature < 115


--Class IV Gas Giant
::Record Breaker - Heaviest Class IV gas giant
scan.PlanetClass == 'Sudarsky class IV gas giant' and scan.MassEM  > 5403.11

::Record Breaker - Lightest Class IV gas giant
scan.PlanetClass == 'Sudarsky class IV gas giant' and scan.MassEM  < 16.7548

::Record Breaker - Largest Class IV gas giant
scan.PlanetClass == 'Sudarsky class IV gas giant' and scan.Radius > 78291300

::Record Breaker - Smallest Class IV gas giant
scan.PlanetClass == 'Sudarsky class IV gas giant' and scan.Radius < 981238

::Record Breaker - Hottest Class IV gas giant
scan.PlanetClass == 'Sudarsky class IV gas giant' and scan.SurfaceTemperature > 1450

::Record Breaker - Coldest Class IV gas giant
scan.PlanetClass == 'Sudarsky class IV gas giant' and scan.SurfaceTemperature < 800


--Class V Gas Giant
::Record Breaker - Heaviest Class V gas giant
scan.PlanetClass == 'Sudarsky class V gas giant' and scan.MassEM  > 13063.4

::Record Breaker - Lightest Class V gas giant
scan.PlanetClass == 'Sudarsky class V gas giant' and scan.MassEM  < 32.5048

::Record Breaker - Largest Class V gas giant
scan.PlanetClass == 'Sudarsky class V gas giant' and scan.Radius > 77806100

::Record Breaker - Smallest Class V gas giant
scan.PlanetClass == 'Sudarsky class V gas giant' and scan.Radius < 20016300

::Record Breaker - Hottest Class V gas giant
scan.PlanetClass == 'Sudarsky class V gas giant' and scan.SurfaceTemperature > 13281

::Record Breaker - Coldest Class V gas giant
scan.PlanetClass == 'Sudarsky class V gas giant' and scan.SurfaceTemperature < 1400


--Helium Rich Gas Giant
::Record Breaker - Heaviest Helium-rich gas giant
scan.PlanetClass == 'Helium rich gas giant' and scan.MassEM  > 4764.86

::Record Breaker - Lightest Helium-rich gas giant
scan.PlanetClass == 'Helium rich gas giant' and scan.MassEM  < 1.02859

::Record Breaker - Largest Helium-rich gas giant
scan.PlanetClass == 'Helium rich gas giant' and scan.Radius > 77739000

::Record Breaker - Smallest Helium-rich gas giant
scan.PlanetClass == 'Helium rich gas giant' and scan.Radius < 9557560

::Record Breaker - Hottest Helium-rich gas giant
scan.PlanetClass == 'Helium rich gas giant' and scan.SurfaceTemperature > 7787

::Record Breaker - Coldest Helium-rich gas giant
scan.PlanetClass == 'Helium rich gas giant' and scan.SurfaceTemperature < 4


--Helium Gas Giant
::Record Breaker - Heaviest Helium gas giant
scan.PlanetClass == 'Helium gas giant' and scan.MassEM  > 5781.1

::Record Breaker - Lightest Helium gas giant
scan.PlanetClass == 'Helium gas giant' and scan.MassEM  < 11.9483

::Record Breaker - Largest Helium gas giant
scan.PlanetClass == 'Helium gas giant' and scan.Radius > 75900700

::Record Breaker - Smallest Helium gas giant
scan.PlanetClass == 'Helium gas giant' and scan.Radius < 18022800

::Record Breaker - Hottest Helium gas giant
scan.PlanetClass == 'Helium gas giant' and scan.SurfaceTemperature > 1701

::Record Breaker - Coldest Helium gas giant
scan.PlanetClass == 'Helium gas giant' and scan.SurfaceTemperature < 93
