--Original Criteria by Cmdr DaftMav / ObsCore Discord (2033-03-27)

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
