-----------------------------------------------------------------------------------------------------------------------------------------
-- FUDEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fudeu",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasGroup(user_id,"Admin") then
			TriggerClientEvent("player:Commands",source,false)
			TriggerClientEvent("inventory:Buttons",source,false)
		end
	end
end)
