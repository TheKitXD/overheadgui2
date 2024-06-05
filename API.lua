local module = {}

module.Info = require(script.Parent)

function module.CreateOverheadObject()
	local OverheadGUI = script.Parent:WaitForChild("OverheadGUI"):Clone()
	
	return OverheadGUI
end

function module.AttachOverheadObjectToPlayersCharacter(player:Player)
	local OverheadGUI = module.CreateOverheadObject()
	
	for i,v in pairs(player.Character:GetChildren()) do
		if v.Name == "OverheadGUI" then
			v:Destroy()
		end
	end
	
	OverheadGUI.Parent = player.Character:WaitForChild("Head")
	
	return OverheadGUI
end

function module.SetOverheadObjectUsername(player:Player, overhead:BillboardGui)
	overhead.Main.PlayerName.Text = player.Name
	overhead.Main.PlayerName.Front.Text = player.Name
end

function module.SetOverheadObjectRank(player:Player, overhead:BillboardGui)
	for i,v in pairs(module.Info.Teams) do
		if player.Team == v.Team then
			overhead.Main.Rank.Text = player:GetRoleInGroup(module.Info.GetIDFromTag(v.TAG))
			overhead.Main.Rank.Front.Text = player:GetRoleInGroup(module.Info.GetIDFromTag(v.TAG))
		end
	end
end

function module.SetOverheadObjectDivision(player:Player, overhead:BillboardGui)
	for i,v in pairs(module.Info.Teams) do
		if player.Team == v.Team then
			if v.Division then
				overhead.Main.Division.Division.Text = player:GetRoleInGroup(module.Info.GetIDFromTag(v.DivisionTag))
				overhead.Main.Division.Division.Front.Text = player:GetRoleInGroup(module.Info.GetIDFromTag(v.DivisionTag))
				
				overhead.Main.Division.BackgroundColor = player.TeamColor
				overhead.Main.Division.Visible = true
			end
		end
	end
end

function module.Setup()
	game.Players.PlayerAdded:Connect(function(player:Player)
		player.CharacterAdded:Connect(function(character)
			repeat wait() until character:FindFirstChild("Humanoid")
			
			local Overhead = module.AttachOverheadObjectToPlayersCharacter(player)
			module.SetOverheadObjectUsername(player, Overhead)
			module.SetOverheadObjectRank(player, Overhead)
			module.SetOverheadObjectDivision(player, Overhead)
		end)
	end)
end

return module
