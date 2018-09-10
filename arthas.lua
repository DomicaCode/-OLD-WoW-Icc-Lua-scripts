function zzOnLeaveCombat(unit, event)
	unit:SetScale(2)
end

function zzOnCombat(unit, event)
	unit:SendChatMessage(14, 0, "Ahahaha... The end is upon you! Enter oblivion!")
	unit:RegisterEvent("zzphase1", 3000, 0)
	unit:RegisterEvent("zzsound", 14000, 1)
	unit:RegisterEvent("zzcasting", 10000, 0)
	unit:SetScale(2.5)
	unit:PlaySoundToSet(17224)
end

function zzOnKillTarget(unit, event)
	unit:SendChatMessage(14, 0, "Die well.... fool!")
	unit:PlaySoundToSet(17256)
end

function zzOnDeath(unit, event)
	unit:CastSpell(63660)
	unit:CastSpell(63660)
	unit:SendChatMessage(42, 0, "The Lich King has been defeated!")
end

RegisterUnitEvent(90050, 4, "zzOnDeath")
RegisterUnitEvent(90050, 3, "zzOnKillTarget")
RegisterUnitEvent(90050, 2, "zzOnLeaveCombat")
RegisterUnitEvent(90050, 1, "zzOnCombat")

function zzsound(unit, event)
	unit:PlaySoundToSet(17230)
	unit:SendChatMessage(14, 0, "You now stand upon the hallowed ground of the scourge... The light won't protect you here Paladin... Nothing will protect you...")
end

function zzcasting(unit, event)
	local JaggedCheck = Unit:GetRandomPlayer(0)
	if (JaggedCheck ~= nil) then
	unit:FullCastSpellOnTarget(22357, JaggedCheck)
	end
end

function zzphase1(unit, event)
if unit:GetHealthPct() <90 then
		unit:RemoveEvents()
		unit:RegisterEvent("zzcasting", 10000, 0)
		x = unit:GetX();
		y = unit:GetY();
		z = unit:GetZ();
		unit:CastSpellAoF(x, y, z, 34017)
		unit:SendChatMessage(14, 0, "So... You wish to commune with the dead? You shall have your wish!")
		unit:PlaySoundToSet(17226)
		unit:RegisterEvent("zzphase2", 8000, 0)
	end
end
	

function zzphase2(unit, event)
	if unit:GetHealthPct() <70 then
		unit:RemoveEvents()
		unit:RegisterEvent("zzcasting", 10000, 0)
		unit:SendChatMessage(14, 0, "In the end... you will all serve me!")
		unit:PlaySoundToSet(17234)
		unit:RegisterEvent("zzphase3", 2000, 0)
	end
end

function zzphase3(unit, event)
	if unit:GetHealthPct() <50 then
	    unit:RemoveEvents()
		unit:RegisterEvent("zzcasting", 10000, 0)
		unit:CastSpell(48582)
		unit:SendChatMessage(42, 0, "The Lich King summons his undead minions!")
		unit:SendChatMessage(14, 0, "The moment is soon at hand mortal, you shall toil for eternity...in a new azeroth!")
		unit:PlaySoundToSet(17245)
        x = unit:GetX();
        y = unit:GetY();
        z = unit:GetZ();
        o = unit:GetO();
        x = x - 2
        y = y - 2
        unit:SpawnCreature(90051, x, y, z, o, 17, 450000);
        x = x + 4
        y = y + 4
        unit:SpawnCreature(90051, x, y, z, o, 17, 450000); 
		unit:SpawnCreature(90051, x, y, z, o, 17, 450000);
		unit:SpawnCreature(90051, x, y, z, o, 17, 450000);
		unit:RegisterEvent("zzphase4", 3000, 0)
	end
end

function zzphase4(unit, event)
	if unit:GetHealthPct() <35 then
	    unit:RemoveEvents()
		unit:RegisterEvent("zzcasting", 10000, 0)
		unit:SendChatMessage(14, 0, "Your heart... its Incessant drumming digusts me... I shall silence it, like I did my own!")
		unit:PlaySoundToSet(17249)
		unit:CastSpell(15716)
		unit:SendChatMessage(42, 0, "The Lich King Berserks!")
		x = unit:GetX();
        y = unit:GetY();
        z = unit:GetZ();
        o = unit:GetO();
        x = x - 2
        y = y - 2
        unit:SpawnCreature(90051, x, y, z, o, 17, 450000);
        x = x + 4
        y = y + 4
        unit:SpawnCreature(90051, x, y, z, o, 17, 450000); 
		unit:SpawnCreature(90051, x, y, z, o, 17, 450000);
		unit:SpawnCreature(90051, x, y, z, o, 17, 450000);
		unit:RegisterEvent("zzphase5", 4000, 0)
	end
end

function zzphase5(unit, event)
	if unit:GetHealthPct() <25 then
	    unit:RemoveEvents()
		unit:RegisterEvent("zzcasting", 10000, 0)
		unit:SendChatMessage(14, 0, "The light will abandon you hero... just as it did me.")
		unit:PlaySoundToSet(17250)
		unit:RegisterEvent("zzphase6", 5000, 0)
	end
end

function zzphase6(unit, event)
	if unit:GetHealthPct() <10 then
		unit:RegisterEvent("zzcasting", 10000, 0)
		unit:RemoveEvents()
		unit:SendChatMessage(42, 0, "The Lich King suffered a critical blow!")
	end
end