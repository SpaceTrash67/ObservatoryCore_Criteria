-- Code by MattG and submitted on Observatory DIscord on 2023-06-21

::Global::
complex_id = ''
complex_b = {}
complex_id64 = 0
::End::


::Criteria::
if(scan.SystemAddress ~= complex_id64) then
    complex_id64 = scan.SystemAddress
    complex_b = {}
end
local c=0
local f=0
local id=''
if (string.match(scan.BodyName," [ABCDEFGHIJ]$") or scan.BodyName == scan.StarSystem) then
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
