-- Remove Dynamic Leveling Vendor NPC
-- Entry: 90000

-- Remove any spawned instances of the vendor
DELETE FROM `creature` WHERE `id` = 90000;

-- Remove the creature template
DELETE FROM `creature_template` WHERE `entry` = 90000; 