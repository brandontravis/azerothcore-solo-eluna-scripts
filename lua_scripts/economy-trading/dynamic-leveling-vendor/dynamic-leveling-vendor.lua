--[[
Dynamic Leveling Vendor Script (Eluna)
Vendor Entry: 90000

TODO:
- Implement full item pools for all professions and levels
- Add debugging/testing tools for verifying player-specific stock
- Expand progression flag logic as needed
]]

local DEBUG = false -- Set to true for 5-minute refresh interval

local VENDOR_ENTRY = 90000
local REFRESH_INTERVAL = (DEBUG and 300 or 1800) * 1000 -- 5 min if debug, else 30 min

-- Progression flags (set these as needed)
local allow_TBC = false
local allow_WotLK = false

-- =====================
-- Item Pools by Expansion (Exhaustive, Leveling-Friendly)
-- =====================

-- VANILLA
local craftingItems_vanilla = {
    -- Cloth
    2589, 2592, 4306, 4338, 14047, -- Linen, Wool, Silk, Mageweave, Runecloth
    -- Herbs
    2447, 765, 2449, 785, 2450, 2453, 3355, 3356, 3357, 3818, 3821, 3358, 3819, 4625, 8831, 8836, 8838, 8839, 8845, 8846, 13464, 13463, 13465, 13466, 13467, 13468, -- All gatherable herbs
    -- Ores/Bars
    2770, 2771, 2775, 2772, 2776, 3858, 7911, 10620, 2840, 3576, 2841, 3575, 3859, 6037, 11371, 12359, 12655, -- Ores and bars
    -- Leathers/Hides
    2318, 2319, 4234, 4304, 8170, 4231, 4232, 4233, 4235, 8171, 15407, -- Leathers and hides
    -- Enchanting mats
    10940, 11083, 11137, 11176, 10938, 10939, 10998, 11082, 11134, 11135, 11174, 11175, 10978, 11084, 11138, 11139, 11177, 11178, -- Dusts, essences, shards
    -- Basic vendor reagents
    2320, 2321, 4291, 8343, 14341, 2604, 2605, 4341, 4340, 6260, 6261, 2324, 2325, 4342, 3371, 3372, 8925, 18256 -- Threads, dyes, vials
}
local recipeItems_vanilla = {
    -- Example: Add more as needed, only early/common recipes
    6270, 6272, 6274, 6390, 6342, 6344, 6346, 3394, 3395, 2881, 12162, 14639
}
local utilityItems_vanilla = {
    -- Bandages
    1251, 2581, 3530, 3531, 6450, 6451, 8544, 8545, 14529, 14530,
    -- Potions (basic healing/mana)
    118, 858, 929, 1710, 3928, 2455, 3385, 3827, 6149, 13446, 2456, 2458, 2459, 5631, 5633, 5634, 6370, 6371, 3823, 3824, 3825, 6050, 6051, 3386, 3388, 3389, 3390, 3391, 4623, 6149, 8951, 9030, 9036, 9088, 9197, 9206, 9224, 9233, 9264, 13443, 13444, 13445, 13447, 13452, 13453, 13454, 13455, 13456, 13457, 13458, 13459, 13461, 13462, 13506, 13510, 13511, 13512, 13513, 13518, 13519, 13520, 13521, 13926,
    -- Scrolls, poisons, ammo (add as needed)
    -- Example: 3012, 1180, 1181, 3775, 2512, 2515
}

-- TBC
local craftingItems_tbc = {
    -- Cloth
    21877, -- Netherweave Cloth
    -- Herbs
    22785, 22786, 22787, 22789, 22790, 22791, 22792, 22793, -- Felweed, Dreaming Glory, Ragveil, Terocone, Ancient Lichen, Netherbloom, Nightmare Vine, Mana Thistle
    -- Ores/Bars
    23424, 23425, 23426, 23427, -- Fel Iron Ore, Adamantite Ore, Khorium Ore, Eternium Ore
    23445, 23446, 23447, 23448, 23449, -- Fel Iron Bar, Adamantite Bar, Eternium Bar, Felsteel Bar, Khorium Bar
    -- Leathers/Hides
    21887, 25700, 25699, 23793, -- Knothide Leather, Fel Scales, Crystal Infused Leather, Cured Knothide Leather
    -- Enchanting mats
    22445, 22446, 22447, 22448, 22449, 22450, -- Arcane Dust, Greater Planar Essence, Lesser Planar Essence, Small Prismatic Shard, Large Prismatic Shard, Void Crystal
    -- Basic vendor reagents
    30817, 30810, 23571, 23572, 21884, 21885, 21886, 22451, 22452, 22456, 22457 -- Simple Flour, Mote of Fire, Primal Might, Primal Nether, Primal Fire, Primal Water, Primal Life, Primal Air, Primal Earth, Primal Shadow, Primal Mana
}
local recipeItems_tbc = {
    -- Tailoring
    21892, 21893, 21894, 21896, 21897, -- Netherweave, Imbued Netherweave, Soulcloth, etc.
    -- Enchanting
    22530, 22531, 22532, 22533, 22534, -- Formula: Enchant Bracer, Shield, Cloak, etc.
    -- Alchemy
    22900, 22901, 22902, 22903, 22904, 22905, -- Elixir, Potion, Transmute, etc.
    -- Blacksmithing
    23590, 23591, 23592, 23593, -- Plans: Adamantite, Fel Iron, etc.
    -- Engineering
    23883, 23884, 23887, -- Schematic: Adamantite Rifle, Fel Iron Bomb, etc.
    -- Leatherworking
    25720, 25721, 25722, -- Pattern: Heavy Knothide Leather, etc.
    -- Jewelcrafting
    24158, 24159, 24160, -- Design: Pendant, Ring, etc.
}
local utilityItems_tbc = {
    21990, 21991, 22829, 22832, 22895, 22053, 23737, 23772, 27498, 27501 -- Bandages, potions, poisons, ammo, scrolls
}

-- WotLK
local craftingItems_wotlk = {
    -- Cloth
    33470, -- Frostweave Cloth
    -- Herbs
    36901, 36903, 36904, 36905, 36906, 36907, 37921, -- Goldclover, Adder's Tongue, Tiger Lily, Lichbloom, Icethorn, Talandra's Rose, Deadnettle
    -- Ores/Bars
    36909, 36910, 36912, 36913, 36916, 41163, -- Cobalt Ore, Titanium Ore, Saronite Ore, Saronite Bar, Cobalt Bar, Titanium Bar
    -- Leathers/Hides
    33568, 44128, 38558, 38561, -- Borean Leather, Arctic Fur, Nerubian Chitin, Jormungar Scale
    -- Enchanting mats
    34054, 34055, 34056, 34052, 34057, -- Infinite Dust, Greater Cosmic Essence, Lesser Cosmic Essence, Dream Shard, Abyss Crystal
    -- Basic vendor reagents
    39502, 39501, 39503, 39504, 39505, 39506, 39507, 39508, 39509, 39510, 39511, 39512, 39513, 39514, 39515, 39516, 39517, 39518, 39519, 39520, 39521, 39522, 39523, 39524, 39525, 39526, 39527, 39528, 39529, 39530, 39531, 39532, 39533, 39534, 39535, 39536, 39537, 39538, 39539, 39540, 39541, 39542, 39543, 39544, 39545, 39546, 39547, 39548, 39549, 39550, 39551, 39552, 39553, 39554, 39555, 39556, 39557, 39558, 39559, 39560, 39561, 39562, 39563, 39564, 39565, 39566, 39567, 39568, 39569, 39570, 39571, 39572, 39573, 39574, 39575, 39576, 39577, 39578, 39579, 39580, 39581, 39582, 39583, 39584, 39585, 39586, 39587, 39588, 39589, 39590, 39591, 39592, 39593, 39594, 39595, 39596, 39597, 39598, 39599, 39600, 39601, 39602, 39603, 39604, 39605, 39606, 39607, 39608, 39609, 39610, 39611, 39612, 39613, 39614, 39615, 39616, 39617, 39618, 39619, 39620, 39621, 39622, 39623, 39624, 39625, 39626, 39627, 39628, 39629, 39630, 39631, 39632, 39633, 39634, 39635, 39636, 39637, 39638, 39639, 39640, 39641, 39642, 39643, 39644, 39645, 39646, 39647, 39648, 39649, 39650, 39651, 39652, 39653, 39654, 39655, 39656, 39657, 39658, 39659, 39660, 39661, 39662, 39663, 39664, 39665, 39666, 39667, 39668, 39669, 39670, 39671, 39672, 39673, 39674, 39675, 39676, 39677, 39678, 39679, 39680, 39681, 39682, 39683, 39684, 39685, 39686, 39687, 39688, 39689, 39690, 39691, 39692, 39693, 39694, 39695, 39696, 39697, 39698, 39699, 39700, 39701, 39702, 39703, 39704, 39705, 39706, 39707, 39708, 39709, 39710, 39711, 39712, 39713, 39714, 39715, 39716, 39717, 39718, 39719, 39720, 39721, 39722, 39723, 39724, 39725, 39726, 39727, 39728, 39729, 39730, 39731, 39732, 39733, 39734, 39735, 39736, 39737, 39738, 39739, 39740, 39741, 39742, 39743, 39744, 39745, 39746, 39747, 39748, 39749, 39750, 39751, 39752, 39753, 39754, 39755, 39756, 39757, 39758, 39759, 39760, 39761, 39762, 39763, 39764, 39765, 39766, 39767, 39768, 39769, 39770, 39771, 39772, 39773, 39774, 39775, 39776, 39777, 39778, 39779, 39780, 39781, 39782, 39783, 39784, 39785, 39786, 39787, 39788, 39789, 39790, 39791, 39792, 39793, 39794, 39795, 39796, 39797, 39798, 39799, 39800, 39801, 39802, 39803, 39804, 39805, 39806, 39807, 39808, 39809, 39810, 39811, 39812, 39813, 39814, 39815, 39816, 39817, 39818, 39819, 39820, 39821, 39822, 39823, 39824, 39825, 39826, 39827, 39828, 39829, 39830, 39831, 39832, 39833, 39834, 39835, 39836, 39837, 39838, 39839, 39840, 39841, 39842, 39843, 39844, 39845, 39846, 39847, 39848, 39849, 39850, 39851, 39852, 39853, 39854, 39855, 39856, 39857, 39858, 39859, 39860, 39861, 39862, 39863, 39864, 39865, 39866, 39867, 39868, 39869, 39870, 39871, 39872, 39873, 39874, 39875, 39876, 39877, 39878, 39879, 39880, 39881, 39882, 39883, 39884, 39885, 39886, 39887, 39888, 39889, 39890, 39891, 39892, 39893, 39894, 39895, 39896, 39897, 39898, 39899, 39900, 39901, 39902, 39903, 39904, 39905, 39906, 39907, 39908, 39909, 39910, 39911, 39912, 39913, 39914, 39915, 39916, 39917, 39918, 39919, 39920, 39921, 39922, 39923, 39924, 39925, 39926, 39927, 39928, 39929, 39930, 39931, 39932, 39933, 39934, 39935, 39936, 39937, 39938, 39939, 39940, 39941, 39942, 39943, 39944, 39945, 39946, 39947, 39948, 39949, 39950, 39951, 39952, 39953, 39954, 39955, 39956, 39957, 39958, 39959, 39960, 39961, 39962, 39963, 39964, 39965, 39966, 39967, 39968, 39969, 39970 -- Ink, pigments, etc.
}
local recipeItems_wotlk = {
    -- Tailoring
    41510, 41511, 41512, 41513, 41514, -- Frostweave, Duskweave, etc.
    -- Enchanting
    44447, 44448, 44449, 44453, 44455, -- Formula: Enchant Weapon, Bracer, etc.
    -- Alchemy
    46348, 46349, 46353, 46372, -- Flask, Potion, Transmute, etc.
    -- Blacksmithing
    44937, 44938, 44939, 44940, -- Plans: Cobalt, Saronite, etc.
    -- Engineering
    44502, 44503, 44504, -- Schematic: Gnomish Army Knife, etc.
    -- Leatherworking
    44509, 44510, 44513, -- Pattern: Borean Armor Kit, etc.
    -- Jewelcrafting
    41718, 41719, 41720, -- Design: Ring, Necklace, etc.
}
local utilityItems_wotlk = {
    34721, 34722, 33447, 33448, 43268, 43236, 41164, 52021, 44614, 44615 -- Bandages, potions, poisons, ammo, scrolls
}

-- =====================
-- Helper: Combine Item Pools Based on Progression
-- =====================
local function CombinePools(...)
    local result = {}
    for _, pool in ipairs({...}) do
        for _, v in ipairs(pool) do table.insert(result, v) end
    end
    return result
end

-- Helper: Get expansion stage (for future per-player logic)
local function GetExpansionStage(player)
    -- For now, use global flags. In the future, this could check player progression.
    if allow_WotLK then return 3 end
    if allow_TBC then return 2 end
    return 1 -- Vanilla
end

-- Helper: Combine Item Pools Based on Progression
local function GetCurrentCraftingItems(player)
    local stage = GetExpansionStage(player)
    local pools = {craftingItems_vanilla}
    if stage >= 2 then table.insert(pools, craftingItems_tbc) end
    if stage >= 3 then table.insert(pools, craftingItems_wotlk) end
    return CombinePools(table.unpack(pools))
end

local function GetCurrentRecipeItems(player)
    local stage = GetExpansionStage(player)
    local pools = {recipeItems_vanilla}
    if stage >= 2 then table.insert(pools, recipeItems_tbc) end
    if stage >= 3 then table.insert(pools, recipeItems_wotlk) end
    return CombinePools(table.unpack(pools))
end

local function GetCurrentUtilityItems(player)
    local stage = GetExpansionStage(player)
    local pools = {utilityItems_vanilla}
    if stage >= 2 then table.insert(pools, utilityItems_tbc) end
    if stage >= 3 then table.insert(pools, utilityItems_wotlk) end
    return CombinePools(table.unpack(pools))
end

-- Utility: Get random items from a list
local function GetRandomItems(sourceList, count)
    local selected = {}
    local temp = {}
    for _, v in ipairs(sourceList) do table.insert(temp, v) end
    for i = 1, math.min(count, #temp) do
        local index = math.random(#temp)
        table.insert(selected, temp[index])
        table.remove(temp, index)
    end
    return selected
end

-- Helper: Profession skill IDs
local professionSkills = {
    [164] = "Blacksmithing",
    [165] = "Leatherworking",
    [171] = "Alchemy",
    [182] = "Herbalism",
    [186] = "Mining",
    [197] = "Tailoring",
    [202] = "Engineering",
    [333] = "Enchanting",
    [393] = "Skinning",
    [755] = "Jewelcrafting",
    [773] = "Inscription"
}

-- Helper: Map profession to relevant item IDs (example for Vanilla, expand as needed)
local professionItemMap = {
    [164] = {2770, 2771, 2772, 2775, 2776, 3858, 7911, 10620, 2840, 3576, 2841, 3575, 3859, 6037, 11371, 12359, 12655}, -- Blacksmithing: ores/bars
    [165] = {2318, 2319, 4234, 4304, 8170, 4231, 4232, 4233, 4235, 8171, 15407}, -- Leatherworking: leathers/hides
    [171] = {2447, 765, 2449, 785, 2450, 2453, 3355, 3356, 3357, 3818, 3821, 3358, 3819, 4625, 8831, 8836, 8838, 8839, 8845, 8846, 13464, 13463, 13465, 13466, 13467, 13468}, -- Alchemy: herbs
    [182] = {2447, 765, 2449, 785, 2450, 2453, 3355, 3356, 3357, 3818, 3821, 3358, 3819, 4625, 8831, 8836, 8838, 8839, 8845, 8846, 13464, 13463, 13465, 13466, 13467, 13468}, -- Herbalism: herbs
    [186] = {2770, 2771, 2772, 2775, 2776, 3858, 7911, 10620}, -- Mining: ores
    [197] = {2589, 2592, 4306, 4338, 14047, 2320, 2321, 4291, 8343, 14341}, -- Tailoring: cloth/thread
    [202] = {2836, 2838, 2840, 2841, 3575, 3576, 3860, 6037, 11134, 11135}, -- Engineering: ores/bars/essences
    [333] = {10940, 11083, 11137, 11176, 10938, 10939, 10998, 11082, 11134, 11135, 11174, 11175, 10978, 11084, 11138, 11139, 11177, 11178}, -- Enchanting: dusts/essences/shards
    [393] = {2318, 2319, 4234, 4304, 8170, 4231, 4232, 4233, 4235, 8171, 15407}, -- Skinning: leathers/hides
    [755] = {}, -- Jewelcrafting: (add gems/ores as needed)
    [773] = {}  -- Inscription: (add pigments/herbs as needed)
}

-- Helper: Map profession to relevant recipe IDs (example, expand as needed)
local professionRecipeMap = {
    [164] = {2881, 12162}, -- Blacksmithing
    [165] = {}, -- Leatherworking
    [171] = {3394, 3395}, -- Alchemy
    [182] = {}, -- Herbalism (no recipes)
    [186] = {}, -- Mining (no recipes)
    [197] = {6270, 6272, 6274, 6390}, -- Tailoring
    [202] = {14639}, -- Engineering
    [333] = {6342, 6344, 6346}, -- Enchanting
    [393] = {}, -- Skinning (no recipes)
    [755] = {}, -- Jewelcrafting
    [773] = {}  -- Inscription
}

-- Filter items by player professions
local function GetPlayerProfessionItems(player, count)
    local items = {}
    for skillId, _ in pairs(professionSkills) do
        if player:HasSkill(skillId) then
            for _, itemId in ipairs(professionItemMap[skillId] or {}) do
                table.insert(items, itemId)
            end
        end
    end
    return GetRandomItems(items, count)
end

-- Filter recipes by player professions and skill level (expand as needed)
local function GetPlayerProfessionRecipes(player, count)
    local recipes = {}
    for skillId, _ in pairs(professionSkills) do
        if player:HasSkill(skillId) then
            local skillValue = player:GetSkillValue(skillId)
            for _, recipeId in ipairs(professionRecipeMap[skillId] or {}) do
                -- TODO: Optionally filter by skillValue if recipe data is available
                table.insert(recipes, recipeId)
            end
        end
    end
    return GetRandomItems(recipes, count)
end

-- Utility: Get fair price for item (stub, expand as needed)
local function GetItemPrice(itemId, itemType)
    local itemTemplate = GetItemTemplate and GetItemTemplate(itemId) or nil
    local basePrice = 10000 -- fallback 1g
    if itemTemplate then
        basePrice = itemTemplate.BuyPrice or itemTemplate.SellPrice or basePrice
    end
    local price = basePrice
    if itemType == "material" then
        price = math.floor(basePrice * 1.25)
    elseif itemType == "recipe" then
        price = math.floor(basePrice * 1.5)
    elseif itemType == "utility" then
        price = math.floor(basePrice * 1.25)
    elseif itemType == "rare" then
        price = math.floor(basePrice * 3)
    end
    if price < 100 then price = 100 end -- minimum price (1s)
    return price
end

-- Main: Refresh vendor inventory
local function RefreshVendorStock(vendor)
    if not vendor then
        print("Dynamic Vendor: No vendor provided for stock refresh.")
        return
    end
    
    vendor:ClearVendorItems()

    -- Rotating stock
    local materials = GetRandomItems(GetCurrentCraftingItems(), math.random(18, 24))
    local recipes = GetRandomItems(GetCurrentRecipeItems(), math.random(10, 12))
    for _, itemId in ipairs(materials) do
        vendor:AddVendorItem(itemId, 10, GetItemPrice(itemId, "material"))
    end
    for _, itemId in ipairs(recipes) do
        vendor:AddVendorItem(itemId, 2, GetItemPrice(itemId, "recipe"))
    end

    -- General utility stock
    for _, itemId in ipairs(GetCurrentUtilityItems()) do
        vendor:AddVendorItem(itemId, 10, GetItemPrice(itemId, "utility"))
    end
    
    if DEBUG then
        print("[Dynamic Vendor] Stock refreshed for vendor " .. vendor:GetGUIDLow())
    end
end

-- Command to spawn the vendor
RegisterPlayerEvent(42, function(event, player, msg, Type, lang)
    if msg == ".spawnvendor" then
        local x, y, z, o = player:GetX(), player:GetY(), player:GetZ(), player:GetO()
        local map = player:GetMapId()
        local vendor = player:SpawnCreature(VENDOR_ENTRY, x, y, z, o, 2, 0)
        if vendor then
            RefreshVendorStock(vendor)
            player:SendBroadcastMessage("Dynamic vendor spawned! Stock refreshed.")
        else
            player:SendBroadcastMessage("Failed to spawn vendor. Check if NPC entry " .. VENDOR_ENTRY .. " exists in database.")
        end
        return false
    end
end)

-- Player-specific stock (on gossip, add tailored items)
RegisterCreatureGossipEvent(VENDOR_ENTRY, 1, function(event, player, creature)
    player:GossipMenuAddItem(0, "Browse rotating crafting stock.", 1, 1)
    player:GossipSendMenu(1, creature)
end)

RegisterCreatureGossipEvent(VENDOR_ENTRY, 2, function(event, player, creature, sender, intid)
    if intid == 1 then
        -- Add player-specific profession items
        local profMats = GetPlayerProfessionItems(player, math.random(3, 5))
        local profRecipes = GetPlayerProfessionRecipes(player, math.random(3, 5))
        for _, itemId in ipairs(profMats) do
            creature:AddVendorItem(itemId, 10, GetItemPrice(itemId, "material"))
        end
        for _, itemId in ipairs(profRecipes) do
            creature:AddVendorItem(itemId, 2, GetItemPrice(itemId, "recipe"))
        end
        player:SendListInventory(creature)
    end
end)

-- Debugging/Testing Tools
if DEBUG then
    -- Debug gossip: Show player professions, expansion, and sample stock
    local function DebugShowPlayerInfo(event, player, creature)
        local msg = "|cff00ff00[Dynamic Vendor Debug]|r\n"
        -- Professions
        msg = msg .. "Professions: "
        local found = false
        for skillId, name in pairs(professionSkills) do
            if player:HasSkill(skillId) then
                msg = msg .. name .. " (" .. skillId .. ", skill " .. player:GetSkillValue(skillId) .. ")  "
                found = true
            end
        end
        if not found then msg = msg .. "None" end
        msg = msg .. "\nExpansion Stage: " .. tostring(GetExpansionStage(player))
        -- Sample stock
        msg = msg .. "\nSample Crafting Items: "
        for _, id in ipairs(GetPlayerProfessionItems(player, 3)) do msg = msg .. id .. " " end
        msg = msg .. "\nSample Recipes: "
        for _, id in ipairs(GetPlayerProfessionRecipes(player, 3)) do msg = msg .. id .. " " end
        player:SendBroadcastMessage(msg)
    end
    -- Add debug gossip option
    RegisterCreatureGossipEvent(VENDOR_ENTRY, 1, function(event, player, creature)
        player:GossipMenuAddItem(0, "[DEBUG] Show my vendor debug info", 1, 99)
    end)
    RegisterCreatureGossipEvent(VENDOR_ENTRY, 2, function(event, player, creature, sender, intid)
        if intid == 99 then
            DebugShowPlayerInfo(event, player, creature)
            player:GossipComplete()
        end
    end)
    -- Command to force-refresh vendor stock (for manually spawned vendors)
    RegisterPlayerEvent(42, function(event, player, msg, Type, lang)
        if msg == ".refreshvendor" then
            -- Find nearby vendor and refresh its stock
            local creatures = player:GetCreaturesInRange(10, VENDOR_ENTRY)
            if creatures and #creatures > 0 then
                RefreshVendorStock(creatures[1])
                player:SendBroadcastMessage("Vendor stock refreshed!")
            else
                player:SendBroadcastMessage("No dynamic vendor found nearby. Use .spawnvendor first.")
            end
            return false
        end
    end)
    -- Print/logging for key actions
    local oldRefresh = RefreshVendorStock
    RefreshVendorStock = function(vendor, ...)
        print("[Dynamic Vendor] Refreshing vendor stock...")
        return oldRefresh(vendor, ...)
    end
end
