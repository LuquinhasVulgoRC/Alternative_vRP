-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
registerRP = {}
Tunnel.bindInterface("works",registerRP)
vSERVER = Tunnel.getInterface("works")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARS
-----------------------------------------------------------------------------------------------------------------------------------------
local registers = {
	{ 24.49,-1344.99,29.49,265.0 },
	{ 24.50,-1347.34,29.49,267.0 },
	{ 2554.90,380.94,108.62,349.0 },
	{ 2557.23,380.83,108.62,354.0 },
	{ 1165.07,-324.50,69.20,127.0 },
	{ 1164.67,-322.76,69.20,94.0 },
	{ -706.10,-915.43,19.21,116.0 },
	{ -706.16,-913.65,19.21,85.0 },
	{ -47.96,-1759.34,29.42,74.0 },
	{ -46.80,-1757.94,29.42,45.0 },
	{ 372.58,326.39,103.56,252.0 },
	{ 373.10,328.64,103.56,255.0 },
	{ -3242.24,1000.01,12.83,352.0 },
	{ -3244.56,1000.20,12.83,354.0 },
	{ 1727.88,6415.21,35.03,239.0 },
	{ 1728.90,6417.25,35.03,240.0 },
	{ 549.03,2671.36,42.15,93.0 },
	{ 549.33,2669.04,42.15,93.0 },
	{ 1958.96,3742.01,32.34,298.0 },
	{ 1960.12,3740.01,32.34,295.0 },
	{ 2678.07,3279.42,55.24,327.0 },
	{ 2676.03,3280.56,55.24,327.0 },
	{ 1696.57,4923.95,42.06,353.0 },
	{ 1698.06,4922.96,42.06,323.0 },
	{ -1818.89,792.94,138.08,161.0 },
	{ -1820.12,794.16,138.08,129.0 },
	{ 1392.87,3606.39,34.98,195.0 },
	{ -2966.44,390.89,15.04,84.0 },
	{ -3038.95,584.55,7.90,16.0 },
	{ -3041.19,583.84,7.90,14.0 },
	{ 1134.25,-982.47,46.41,273.0 },
	{ 1165.93,2710.77,38.15,177.0 },
	{ -1486.29,-378.02,40.16,132.0 },
	{ -1221.99,-908.29,12.32,28.0 },
	{ 73.97,-1392.13,29.37,267.0 },
	{ 74.86,-1387.70,29.37,182.0 },
	{ 78.02,-1387.69,29.37,177.0 },
	{ 426.96,-806.99,29.49,91.0 },
	{ 426.08,-811.44,29.49,358.0 },
	{ 422.91,-811.44,29.49,358.0 },
	{ -816.56,-1073.25,11.32,122.0 },
	{ -818.14,-1070.52,11.32,122.0 },
	{ -822.41,-1071.94,11.32,206.0 },
	{ -1195.24,-768.03,17.31,215.0 },
	{ -1193.86,-767.00,17.31,215.0 },
	{ -1192.44,-765.93,17.31,215.0 },
	{ 5.21,6510.88,31.87,41.0 },
	{ 1.34,6508.52,31.87,309.0 },
	{ -0.80,6510.80,31.87,309.0 },
	{ 1695.38,4822.23,42.06,92.0 },
	{ 1695.10,4817.71,42.06,4.0 },
	{ 1691.98,4817.31,42.06,4.0 },
	{ 127.50,-222.58,54.55,70.0 },
	{ 126.93,-224.18,54.55,70.0 },
	{ 126.30,-225.88,54.55,70.0 },
	{ 613.14,2760.96,42.08,273.0 },
	{ 612.99,2762.69,42.08,273.0 },
	{ 612.85,2764.46,42.08,273.0 },
	{ 1197.42,2711.63,38.22,175.0 },
	{ 1201.88,2710.74,38.22,85.0 },
	{ 1201.87,2707.60,38.22,85.0 },
	{ -3168.76,1044.80,20.86,65.0 },
	{ -3169.46,1043.22,20.86,65.0 },
	{ -3170.17,1041.60,20.86,65.0 },
	{ -1101.80,2712.10,19.10,216.0 },
	{ -1097.90,2714.40,19.10,125.0 },
	{ -1095.82,2712.08,19.10,125.0 },
	{ -821.91,-183.32,37.56,213.0 },
	{ 134.39,-1707.83,29.29,136.0 },
	{ -1284.26,-1115.05,6.99,89.0 },
	{ 1930.56,3727.93,32.84,205.0 },
	{ 1211.52,-470.31,66.20,72.0 },
	{ -30.42,-151.77,57.07,336.0 },
	{ -277.76,6230.73,31.69,38.0 },
	{ 162.21,6643.27,31.72,224.33 },
	{ 160.56,6641.63,31.72,224.33 },
	{ -161.03,6321.4,31.6,314.86 },
	{ -2539.33,2313.86,33.42,92.34 },
	{ -2539.18,2311.55,33.42,92.34 },
	{ -775.71,5604.24,33.73,257.96 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for k,v in pairs(registers) do
		exports["target"]:AddCircleZone("register:"..k,vector3(v[1],v[2],v[3]),1.0,{
			name = "register:"..k,
			heading = v[4]
		},{
			shop = k,
			distance = 1.0,
			options = {
				{
					event = "register:openSystem",
					label = "Roubar",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REGISTER:OPENSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("register:openSystem",function(shopId)
	if vSERVER.applyTimers(shopId) then
		SetEntityHeading(ped,registers[shopId][4])
		SetEntityCoords(ped,registers[shopId][1],registers[shopId][2],registers[shopId][3] - 1,1,0,0,0)

		local safeCracking = exports["creative"]:safeCraking(1)
		if safeCracking then
			vSERVER.paymentMethod()
		end
	end
end)