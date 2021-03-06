---------------------------------------------------
-- Armor Piercer
-- Deals a ranged attack to a single target that ignores Defense
-- Chance of Stunning Varries with TP
-- 100% TP - 40% Stun Chance
-- 200% TP - 60% Stun Chance
-- 300% TP - 80% Stun Chance

-- TP Mods unknown
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_DEFENSE_DOWN;
    local power = 75;
    local duration = 120;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 0, duration);

    target:delHP(dmg);
    return dmg;
end;
