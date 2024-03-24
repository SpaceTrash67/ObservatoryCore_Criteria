-- ObsCore CustomCriteria Collection
-- Compilied by Cmdr SpaceTrash67
-- Version: 20240324
--
-- Note: The Custom Criteria will generally be appended at the top (keeping the GGG code together is the exception) - with an entry (+credits) added here in the Change-log Header
--
-- Change-log
--
-- 20240324		Ringed Stars (fjk / reminder from Cmdr Julian Ford)
--			Added (Cmdr / Coder) credits in each changelog entry - in case I forgot in Criteria
-- 20200311		Ringed, Thin-Ammonia Atmosphere Landable (Thanks Cmdr Duval McMuttons)
-- 20240224		Added Version & Changelog Header & Global Declaration Cleanup (Thanks for global help fjk!!)
-- 20240118		Very Old Stars (Thanks Vithigar for Lua code refinement / tutorial  :-)  )
-- 20231225		Complex Orbits (Thanks Matt G / error trap by fjk)
--			GGG Glowing Green Gas Giant / Bugged Protostars (DaftMav)
--			8th Moon of Gas Giant (Matt G)
--			Narrow ring gap with high rotational difference (fjk)
-- 20230926		Hot Landable Body 
-- 20230215		Giant Star in system 
-- 20230210 		Very High Surface Pressure
-- 20220101		Large Angular Diameter of Parent Body (fjk?)
-- 			Narrow rings (Taylors Rings) (Vithigar? / fjk?)
-- 			DIASBLED (Now gives error - starts @ line 419) Possible Guardian Ruins [Graea Hypue Sector / Hen 2-233 Guardian Cluster] (Matt G or fjk?)
--			Massive Planets
--			Inclined landable body to Ringed Parent (fjk)
--			Landable with close star proximity (fjk)				
-- 20210115		Galactic Records Added - taken from EDSM in early 2021...NEVER had one report :-) 


::Global::
function string.startsWith(String,Start)
   if (String == nil) then
     return false
   end
   return string.sub(String,1,string.len(Start))==Start
end

lastSeenId64 = 0

lastRad = 0
lastSys = 'wibble unicorn'
MINIMUM_ANGULAR_DIAMETER = 30
MINIMUM_ANGULAR_DIAMETER_STARS_ONLY = 1
LightSpeed = 299792458
SPEED_OF_LIGHT_mps=299792458

complex_id = ''
complex_b = {}
complex_id64 = 0

class1TempArray = {90.141090, 109.874001, 113.841248, 117.776886, 119.986717, 120.725380, 125.933167, 126.062111, 128.909470, 129.582138, 132.010391, 135.434097, 137.307129}
class2TempArray = {157.798843, 160.396164, 164.465302, 174.249985, 204.975662, 206.818893, 213.91156, 217.87532, 225.990601, 238.650650}
class3TempArray = {276.751648, 299.305664, 370.000000, 550.000000, 580.000000, 610.000000, 640.000000, 700.000000}
class4Temp = 1149.999878
waterGiantTemp = 158.000000
ggwblTempArray = {158.000000, 176.666641, 176.666656, 176.666672, 176.666687, 217.499985}
ggablTempArray = {102.234520, 121.179939, 133.438171, 133.510468}


-- GGG surface temperatures offset delta for finding any that are close to already known GGG temperatures:
GGGdelta = 0.001 -- Adjust this as you like, this will create ranges higher & lower for each known GGG temperature. 
--[[
    You can increase/decrease the precision (and possible matches) by adding or removing a zero to the decimals. Like so:
    (less precise << 0.1 -- 0.01 -- 0.001 -- 0.0001 -- 0.00001 -- 0.000001 >> more precise)
    As absolute minimum I suggest to keep it above 0.000030 which is twice the integer/float offset noticed in the GGG research.
--]]
-- Strange Protostar temperatures setting:
ProtostarAllTemps = true -- When true checks for any temperatures ending in zeroes, set to false to only report stars with known bugged temperatures.


-- GGG Temperatures lookup tables
--[[
    Surface Temperature data used is from CMDR Arcanic's research on GGGs: https://www.youtube.com/playlist?list=PLXsRqs-BpM8JDEm9b_ABzJh-nDhAZ1SYJ
    Reminder: While this table lists journal-style zero-padded decimal numbers (like 158.000000) these will be reduced by Lua to
    one decimal (158.0) or whatever the last non-zero decimal is (90.14109 instead of 90.141090) in any math/comparisons.
--]]
KnownGGGTemperatures = {
    ['Sudarsky class I gas giant'] = {90.141090, 109.874001, 113.841248, 117.776886, 119.986717, 120.725380, 125.933167, 126.062111, 128.909470, 129.582138, 132.010391, 135.434097, 137.307129},
    ['Sudarsky class II gas giant'] = {157.798843, 160.396164, 164.465302, 174.249985, 204.975662, 206.818893, 213.91156, 217.87532, 225.990601, 238.650650},
    ['Sudarsky class III gas giant'] = {276.751648, 299.305664, 370.000000, 550.000000, 580.000000, 610.000000, 640.000000, 700.000000},
    ['Sudarsky class IV gas giant'] = {1149.999878},
    ['Water giant'] = {158.000000},
    ['Gas giant with water based life'] = {158.000000, 176.666641, 176.666656, 176.666672, 176.666687, 217.499985},
    ['Gas giant with ammonia based life'] = {102.234520, 121.179939, 133.438171, 133.510468},
}
-- Generate min/max GGG temperature ranges table from KnownGGGTemperatures and +/- GGGdelta offset
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

-- Function in_ranges() - by DaftMav
--- Returns true if value falls within any min/max ranges inside given table, false if not found or if table doesn't exist
--- If true, also returns base/index value for the found range
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

-- Function has_table() - By DaftMav
--- Returns true if value is found in table, false if not found or if table doesn't exist
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

::End::

::Criteria=Ringed Stars::
local uninterestingRingedStarTypes = {
  ['L'] = true;
  ['T'] = true;
  ['Y'] = true;
}

if scan.StarType and not uninterestingRingedStarTypes[scan.StarType] and hasRings(scan.Rings) then
  for ring in ringsOnly(scan.Rings) do
    local starTypeDesc = scan.StarType:gsub('_', ' ') ..' star'
    if string.startsWith(scan.StarType, 'D') then
      starTypeDesc = 'White Dwarf ('.. scan.StarType .. ') star'
    elseif scan.StarType == 'H' then
      starTypeDesc = 'Black Hole'
    elseif scan.StarType == 'N' then
      starTypeDesc = 'Neutron star'
    elseif scan.StarType == 'X' then
      starTypeDesc = 'Exotic star'
    end
    return true, 'Ringed '.. starTypeDesc, ''
  end
end
::End::

::Criteria::
if scan.StarType ~= nil and scan.Age_MY > 13060
    then
        return true, 'Very old star detected',string.format('Age: %5.3f bn yrs old, Star Type: %s %s / Solar Masses: %5.4f' ,scan.Age_MY / 1000, scan.StarType, scan.Subclass, scan.StellarMass)
end
::End::


::Criteria::
-- Check Gas Giants against known GGG surface temperatures - By DaftMav
--- Keep in mind: Observatory unfortunately gives us inaccurate values with scan.SurfaceTemperature as a float
--- and not the actual journal log values, until it gives us exact values as string this will be somewhat inaccurate.
if scan.PlanetClass and string.find(string.lower(scan.PlanetClass), 'giant') then
    local realTemp = tonumber(string.format('%.6f', scan.SurfaceTemperature)) -- Sadly required to kinda fix Observatory's faulty data...
    if has_value(KnownGGGTemperatures[scan.PlanetClass], realTemp) then
        return true, 'Likely Green Gas Giant', 'Matches known GGG surface temperature of ' .. realTemp .. ' K'
        .. string.char(10) .. scan.PlanetClass
    else
        local result, knowntmp = in_ranges(NearGGGTemperatures[scan.PlanetClass], realTemp)
        if result then
            return true, 'Possible Green Gas Giant', 'Surface temperature ' .. realTemp .. ' K is close to known GGG with ' .. knowntmp .. ' K'
            .. string.char(10) .. scan.PlanetClass
        end
    end
end

-- Check for bugged protostars (Pink/Green lighting) - By DaftMav
--- Checks against known strange star surface temperatures AND temperatures ending perfectly on 000.0 or 00.0
--- This bug may cause the star to be dark and give off bright pink/green lighting nearby the star and on bodies in-system.
if scan.StarType and scan.StarType ~= nil then
    if scan.StarType == 'TTS' or scan.StarType == 'AeBe' then
        local realTemp = tonumber(string.format('%.6f', scan.SurfaceTemperature)) -- Sadly required to kinda fix Observatory's faulty data...
        if has_value(StrangeProtostarTemperatures[scan.StarType], realTemp) then
            return true, 'Likely bugged protostar', 'Check for pink/green lighting, Star has known strange surface temperature of ' .. realTemp .. 'K'
            .. string.char(10) .. 'Spectral Class: ' .. scan.StarType .. scan.Subclass .. ' ' .. scan.Luminosity
        end
        if ProtostarAllTemps then
            if tostring(realTemp):match("(0+0+%.?0?)$") ~= nil then
                -- This matches temperatures ending in 00 or 000 with an optional .0 added (since Lua reduces numbers like 158.000000 to one decimal)
                return true, 'Possible bugged protostar', 'Check for pink/green lighting, surface temperature ends in zeros...'
                .. string.char(10) .. 'Spectral Class: ' .. scan.StarType .. scan.Subclass .. ' ' .. scan.Luminosity .. ', Surface Temperature: ' .. realTemp .. ' K'
            end
        end
    end
end

::End::

-- Code thanks to Duval McMuttons
::Criteria::
if (scan.Landable and scan.Rings and scan.Atmosphere and scan.Atmosphere == 'thin ammonia atmosphere') then
    return true, 'Ringed landable with thin ammonia atmosphere', ''
end
::End::

::Criteria=Narrow ring gap with High rotational difference::
-- By Cmdr Coddiwompler
if hasRings(scan.Rings) and scan.Rings.Count >= 2 then
  -- Only checking 2 innermost rings because 3rd rings are rarely visible.
  local G = 6.674 * (10^(-11))
  local innerRing = scan.Rings[0]
  local outerRing = scan.Rings[1]

  local bodyMass_kg = scan.MassEM * 5.972*(10^24)
  local bodyTypeString = scan.PlanetClass
  if scan.StarType then
    bodyMass_kg = scan.StellarMass * 1.98847*(10^30)
    bodyTypeString = 'Star: ' .. scan.StarType:gsub('_', ' ')
  end

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
    if innerRingWidth_m >= LightSpeed/10 then
      ringWidthText = string.format('%.1f Ls', innerRingWidth_m / LightSpeed)
    else
      ringWidthText = string.format('%.0f km', innerRingWidth_m / 1000)
    end
    
    return true,
        'Narrow ring gap with high rotational difference',
        string.format('Gap: %.0f km; Inner ring width: %s; Ring velocity difference: %.1f km/s (%.1f, %.1f); Host body type: %s', ringGap_km, ringWidthText, ringVelocityDelta_kmps, innerRingOrbitalVelocity_kmps, outerRingOrbitalVelocity_kmps, bodyTypeString)
  end
end
::End::


--8th Moon of GG (added 20231225)
::Criteria::
if scan.PlanetClass and scan.PlanetClass ~= 'Barycentre' then
    if parents and string.sub(scan.BodyName,-2) == ' h' then
        local i=-1
        local c=-1
        for parent in allparents(parents) do
            c = c + 1
            if(parent.parenttype == 'Planet' and i==-1) then
                i = c
            elseif(parent.parenttype ~= 'Null' and i ==-1) then
                i = -2
            end
        end
        if(i >= 0 and parents[i].Scan and parents[i].Scan.PlanetClass and string.find(string.lower(parents[i].Scan.PlanetClass),'gas giant')) then
            return true,'8th moon of a gas giant',parents[i].Scan.BodyName .. ' is a ' .. parents[i].Scan.PlanetClass
        end
    elseif scan.PlanetClass and string.find(string.lower(scan.PlanetClass),'gas giant') then
        for body in bodies(system) do
            if(body.BodyName == (scan.BodyName .. ' h')) then
                return true, 'Gas giant contains an 8th moon',body.BodyName .. ' is an 8th moon'
            end
        
        end
    end
end
::End::

::Criteria=Green Gas Giants::
if scan.PlanetClass and string.find(string.lower(scan.PlanetClass), 'giant') then
    if scan.PlanetClass == 'Water giant' then
        if tonumber(string.format('%.6f', scan.SurfaceTemperature)) == waterGiantTemp then
            return true,
                'Confirmed GGG Temperature',
                'Water Giant @ ' .. tonumber(string.format('%.6f', scan.SurfaceTemperature)) .. "K"
        end
    elseif scan.PlanetClass == 'Sudarsky class I gas giant' then
        for i = 1, #class1TempArray do
            if tonumber(string.format('%.6f', scan.SurfaceTemperature)) == class1TempArray[i] then
                return true,
                    'Confirmed GGG Temperature',
                    'Class I Gas Giant @ ' .. tonumber(string.format('%.6f', scan.SurfaceTemperature)) .. "K"
            end
        end
    elseif scan.PlanetClass == 'Sudarsky class II gas giant' then
        for i = 1, #class2TempArray do
            if tonumber(string.format('%.6f', scan.SurfaceTemperature)) == class2TempArray[i] then
                return true,
                    'Confirmed GGG Temperature',
                    'Class II Gas Giant @ ' .. tonumber(string.format('%.6f', scan.SurfaceTemperature)) .. "K"
            end
        end
    elseif scan.PlanetClass == 'Sudarsky class III gas giant' then
        for i = 1, #class3TempArray do
            if tonumber(string.format('%.6f', scan.SurfaceTemperature)) == class3TempArray[i] then
                return true,
                    'Confirmed GGG Temperature',
                    'Class III Gas Giant @ ' .. tonumber(string.format('%.6f', scan.SurfaceTemperature)) .. "K"
            end
        end
    elseif scan.PlanetClass == 'Sudarsky class IV gas giant' then
        if tonumber(string.format('%.6f', scan.SurfaceTemperature)) == class4Temp then
            return true,
                'Confirmed GGG Temperature',
                'Class IV Gas Giant @ ' .. tonumber(string.format('%.6f', scan.SurfaceTemperature)) .. "K"
        end
    elseif scan.PlanetClass == 'Gas giant with water based life' then
        for i = 1, #ggwblTempArray do
            if tonumber(string.format('%.6f', scan.SurfaceTemperature)) == ggwblTempArray[i] then
                return true,
                    'Confirmed GGG Temperature',
                    'Gas Giant with Water Based Life @ ' .. tonumber(string.format('%.6f', scan.SurfaceTemperature)) .. "K"
            end
        end
    elseif scan.PlanetClass == 'Gas giant with ammonia based life' then
        for i = 1, #ggablTempArray do
            if tonumber(string.format('%.6f', scan.SurfaceTemperature)) == ggablTempArray[i] then
                return true,
                    'Confirmed GGG Temperature',
                    'Gas Giant with Ammonia Based Life @ ' .. tonumber(string.format('%.6f', scan.SurfaceTemperature)) .. "K"
            end
        end
    end
end
::End::

--Complex Orbits
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

--Giant Star in system
::Criteria::
if scan.StarSystem ~= nil and scan.StarType and string.find(string.lower(scan.StarType), "giant") ~= nil
	then
		return true, "Giant Star Type in system", scan.StarType .. ' , Radius: ' ..  math.floor(scan.Radius / LightSpeed ) .. ' LS'
end
::End::

--Very High Surface Pressure
::Criteria::
if scan.PlanetClass and scan.SurfacePressure > 101325000000 and not string.find(string.lower(scan.PlanetClass), 'gas giant') 
    then
        return true, 'Very High Surface Pressure', math.floor(scan.SurfacePressure / 101325) .. ' Atmospheres'
end
::End::

--High Angular Diameter of Parent Body
::Criteria::
    if(scan.StarSystem ~= nil and scan.StarType and (scan.BodyName == scan.StarSystem or scan.BodyName == (scan.StarSystem .. ' A'))) then
        lastRad = scan.Radius
        lastSys = scan.StarSystem
    end

    if(scan.PlanetClass and scan.Landable and parents and parents[0].Scan and parents.Count > 0) then
        local a=0
        local b=0
        if(parents[0].Scan and (MINIMUM_ANGULAR_DIAMETER == 0 or parents[0].Scan.StarType)) then
            a = math.atan(parents[0].Scan.Radius,scan.SemiMajorAxis) * 114.59155902
        end
        if(scan.StarSystem == lastSys) then
            b = math.atan(lastRad,(scan.DistanceFromArrivalLS * 299792458)) * 114.59155902
        end
        if(a > MINIMUM_ANGULAR_DIAMETER or b > MINIMUM_ANGULAR_DIAMETER) then
            return true, 'Parent has high angular diameter', string.format("%.4f",math.max(a,b)) .. ' degrees'
        end
    end
::End::

--Narrow rings
--Taylor's Ring - Thin single ring with a width less than 1/8th (12.5%) of its body's diameter
--Narrow single ring - Single ring with a width less than 1/4th (25%) of its body's diameter (0.5 could be reduced to 0.4 for 20% max)
::Criteria::
if (scan.Rings and scan.Rings.Count == 1 and string.find(scan.Rings[0].Name, ' Ring') and ((scan.Rings[0].OuterRad - scan.Rings[0].InnerRad) / scan.Radius <= 0.5)) then
    local ringwidth = ((scan.Rings[0].OuterRad - scan.Rings[0].InnerRad) / 1000)
    local diameter = scan.Radius/1000*2
    local found = string.format('Narrow single ring only %.0f%% of body diameter', ringwidth/diameter*100)
    if ((scan.Rings[0].OuterRad - scan.Rings[0].InnerRad) / scan.Radius <= 0.25) then
        found = "Taylor's Ring"
    end
    return true, found, string.format('Ring width: %.0f km, Body diameter: %.0f km (%.1f%%)', ringwidth, diameter, ringwidth/diameter*100)
    .. string.char(10) .. scan.PlanetClass .. ', Distance from arrival: ' .. math.floor(scan.DistanceFromArrivalLS) .. ' Ls'
end
::End::

-- Favorable for Guardian Ruins (Changed message from 'Possible Guardian Ruins') [DISABLED - Gives error/ Investigatiing]
-- ::Criteria::
-- if scan.PlanetClass and scan.Landable and scan.SurfaceTemperature >=200 and scan.SurfaceTemperature < 320 and scan.StarSystem ~= nil
--    and (scan.PlanetClass == 'Rocky body' or scan.PlanetClass == 'High metal content body')
--    and scan.AtmosphereType == 'None' and scan.Radius >= 1000000 and scan.SurfaceGravity < (0.4 * 9.81)
--    and string.starts(scan.StarSystem,"Graea Hypue ")
--    then
--        return true, 'Favorable for Guardian Ruins', ''
-- end
-- ::End::

--Massive Planets
::Criteria::
if scan.PlanetClass and scan.MassEM  > 3000.00
    then
        return true, 'High Mass Planet Detected', math.floor(scan.MassEM) .. ' Earth Masses'
end
::End::

--Inclined body Ringed Parent: v1 exclude when > 3 Ls
::Criteria::
if (scan.PlanetClass and scan.Landable and math.abs(scan.OrbitalInclination) > 10 and (scan.SemiMajorAxis / 300000000) < 3 and parents ~= nil and parents[0].Scan and hasRings(parents[0].Scan.Rings)) then
  -- Consider a ratio between body distance and ring size. (Maybe also some function of the inclination as well. Closer -- shallower is fine?)
  -- Counter ex: 40 Ls, 40 deg 473,000 km outer rad)
  -- Consider checking barycentres for close binaries as well?
  for parentRing in ringsOnly(parents[0].Scan.Rings) do
    return true, 'Landable High Orbital Inclination body close to ringed parent', math.floor(scan.OrbitalInclination) .. '°, ' .. math.floor(scan.SemiMajorAxis / 300000000) .. ' Ls'
  end
end
::End::

--Landable with close star proximity
::Criteria::
if parents and parents[0].ParentType == 'Star' and scan.Landable and scan.StarSystem ~= nil then
  starTypeString = ''
  if parents[0].Scan and parents[0].Scan.StarType then
    starTypeString = ', Star type: '..parents[0].Scan.StarType
  end
  -- This criteria assumes arrival star -- consider also secondary stars.
  -- Consider barycentres of multiple stars or planets!
  if scan.DistanceFromArrivalLS < 15 then
    return
        true,
        'Landable with close star proximity',
        'Distance: ' .. math.floor(scan.SemiMajorAxis / 300000000) .. ' Ls, Surface temp: '..math.floor(scan.SurfaceTemperature)..' K'..starTypeString
  elseif scan.DistanceFromArrivalLS < 1000 and parents[0].Scan and parents[0].Scan.StarType == 'N' then
    return
        true,
        'Landable with close neutron star proximity',
        'Distance: ' .. math.floor(scan.SemiMajorAxis / 300000000) .. ' Ls, Surface temp: '..math.floor(scan.SurfaceTemperature)..' K'..starTypeString
  end
end
::End::

--Hot Landable
::Criteria::
if scan.PlanetClass and scan.Landable and scan.SurfaceTemperature > 1773 then
	return
		true,
		'Hot landable body',
		'Surface temp: '..math.floor(scan.SurfaceTemperature)..' K'
	end
::End::


--Galactic Records - taken from EDSM @ 2021-01-15

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
