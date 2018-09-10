function gut_OnCombat(pUnit, Event)
end 

pUnit:SendChatMessage(14, 0, "Fun Time")
end

function gut_OnTargetDied
pUnit:SendChatMessage(14, 0, "Daddy, I did it!")
end

function gut_OnLeave
pUnit:RemoveEvent()
end

function gut_OnDie
pUnit:SendChatMessage(14, 0, "Da...Daddy...")
pUnit:SendChatMessage(14, 0, "Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!"
end



RegisterUnitEvent(npcid, 1, gut_OnCombat)
RegisterUnitEvent(npcid, 2, gut_OnLeave)
RegisterUnitEvent(npcid, 4, gut_OnDied)
RegisterUnitEvent(npcid, 3, gut_OnTargetDied)