-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
aRP = {}
Tunnel.bindInterface("bank",aRP)
vSERVER = Tunnel.getInterface("bank")
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANK:OPENSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("bank:openSystem",function()
	if vSERVER.requestWanted() then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "show" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hide" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPOSIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("deposit",function(data)
	if parseInt(data["value"]) > 0 then
		vSERVER.bankDeposit(data["value"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WITHDRAW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("withdraw",function(data)
	if parseInt(data["value"]) > 0 then
		vSERVER.bankWithdraw(data["value"])
	end
end)