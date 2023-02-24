--Very High Surface Pressure
::Criteria::
if scan.PlanetClass and scan.SurfacePressure > 101325000000 and not string.find(string.lower(scan.PlanetClass), 'gas giant') 
    then
        return true, 'Very High Surface Pressure', math.floor(scan.SurfacePressure / 101325) .. ' Atmospheres'
end
::End::
