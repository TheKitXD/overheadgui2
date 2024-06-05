local module = {}

module.DefaultGroupID = 32524073;

module.GroupIDs = {
	CarolinaRoleplayCommunity = {
		Name = "CRC";
		ID = 32524073
	};
	CarolinaArmedForces = {
		Name = "CAF";
		ID = 34157120
	};
	CarolinaAirForce = {
		Name = "AF";
		ID = 34155149
	}
}

module.Teams = {
	Civilian = {
		TAG = "CRC";
		Team = game:GetService("Teams").Civilian;
		Division = false;
	};
	AirForce = {
		TAG = "AF";
		Team = game:GetService("Teams")["Air Force"];
		Division = false
	};
	AFSOC = {
		TAG = "AF";
		Team = game:GetService("Teams")["AFSOC"];
		Division = true;
		DivisionTag = "CAF";
	}
	
}

function module.GetIDFromTag(tag)
	for i,v in pairs(module.GroupIDs) do
		if tag == v.Name then
			return v.ID
		end
	end
end

return module
