-- Dynamic Leveling Vendor NPC (entry 90000)
INSERT INTO creature_template (
  entry, name, subname, IconName, faction_A, faction_H, npcflag, unit_class, minlevel, maxlevel, scale, gossip_menu_id, modelid1, modelid2, modelid3, modelid4, Health_mod, Mana_mod, Armor_mod, Damage_mod, BaseAttackTime, RangeAttackTime, unit_flags, dynamicflags
) VALUES (
  90000, 'Crafting Supply Vendor', 'Rotating Stock', 'Buy', 35, 35, 128, 1, 80, 80, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2000, 2000, 0, 0
);
-- Place the vendor in Dalaran (map 571, x: 5807.5, y: 629.8, z: 647.8, o: 2.0)
INSERT INTO creature (
  guid, id, map, position_x, position_y, position_z, orientation
) VALUES (
  90000, 90000, 571, 5807.5, 629.8, 647.8, 2.0
); 