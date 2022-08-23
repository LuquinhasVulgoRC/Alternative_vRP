-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
craftList = {
	{ -194.47,-1328.07,30.89,5.67,"Mecanic" },
	{ -341.12,-1567.7,25.22,65.2,"lixeiroShop" },
	{ 1110.99,244.22,-45.83,184.26,"Marinhos" },
	{ -824.4,-715.5,23.78,263.63,"Vermelhos" },
	{ 1208.81,-3115.1,5.54,272.13,"ilegalWeapons" },
	{ 3828.98,4441.79,2.8,0.0,"ilegalWeapons" },
	{ -199.31,-1319.88,31.09,357.17,"MechanicS" },
	{ 809.39,-756.17,22.29,0.0,"Brancos" },
	{ 2196.02,5594.1,53.77,246.62,"Drogas"},
	{ 1389.24,3604.94,38.94,297.64,"Drogas"},
	{ 2433.35,4968.82,42.34,56.7,"Drogas"}
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(craftList) do
		exports["target"]:AddCircleZone("crafting:"..k,vector3(v[1],v[2],v[3]),1.0,{
			name = "crafting:"..k,
			heading = v[4]
		},{
			shop = {type = "crafting", id = k},
			distance = 1.0,
			options = {
				{
					event = "inventory:open",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)