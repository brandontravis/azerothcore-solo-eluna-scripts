-- Delete Dynamic Leveling Vendor NPC and spawn
DELETE FROM creature WHERE id = 90000;
DELETE FROM creature_template WHERE entry = 90000; 