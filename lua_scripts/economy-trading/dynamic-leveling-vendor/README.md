## 🛒 Dynamic Vendor System (In Development)

A major feature in progress is a **Dynamic Vendor** designed to support solo play by providing a rotating, level-appropriate stock of crafting materials, recipes, and useful consumables. This system is intended to supplement the auction house and smooth out leveling for solo players, without trivializing gameplay or creating a "cheat shop."

### Design Goals
- **Diverse, Level-Appropriate Stock:**
  - Rotates a broad selection of crafting materials and recipes, grouped by profession and level.
  - Always includes level-appropriate items for the player's known professions.
  - Maintains randomness and surprise, but guarantees relevance.
- **Useful Consumables:**
  - Offers low-level bandages, potions, food, scrolls, poisons, and sharpening stones.
  - All stock is useful for leveling and feels authentic to the world.
- **Fair, Balanced Pricing:**
  - Prices items based on vendor sell value, auction value, or item level.
  - Ensures it's always better to gather or craft when possible; the vendor is there to smooth rough edges, not replace gameplay.

### Vendor Architecture
The vendor is modularized into three sections:

1. **Rotating Stock (Randomized):**
   - Every 30 minutes, pulls 18-24 items from profession item pools (cloth, herbs, ores, dusts, dyes, oils, etc.).
   - 10-12 profession recipes from early tiers, filtered by profession and level.
   - Optionally rotates rare items with low probability.
2. **Guaranteed Profession Stock (Player-Tailored):**
   - Each player sees 3-5 relevant crafting materials and 3-5 recipes for each profession they've learned, near their current skill level.
   - Up to at least 12 items per player, not randomized but tailored to their known skills.
3. **General Utility Stock:**
   - Fixed or lightly randomized stock of useful leveling items (bandages, potions, sharpening stones, basic scrolls, light ammo, etc.).

### Additional Features
- **Scaling:** Higher-skill players see more advanced items.
- **Pricing:**
  - Crafting materials: 125% of vendor sell price
  - Recipes: 125-150% of base vendor price
  - Utility items: 100–125% of vendor price
  - Rare items: 2–5x vendor price
  - No free/zero-cost items
- **Implementation:**
  - Uses Eluna timers and table randomization for stock rotation.
  - Filters by player profession using `player:HasSkill()` and `player:GetSkillValue()`.
  - Uses `ClearVendorItems()` and `AddVendorItem()` to manage inventory.
  - Example SQL and Lua scripts are provided in the project for easy setup.
- **Progression:**
  - To support mod-individual-progression, allow flags to allow_TBC and allow_WotLK items. These do not need to hook into an actual progression system, just something that can be changed on each startup if desired, and then the players level plus the flags should determine what items to include in the rotation.

### Example Item Pools
- **Tailoring/Cloth:** Linen, Wool, Silk, Mageweave, Runecloth
- **Alchemy/Herbs:** Peacebloom, Silverleaf, Briarthorn, basic potions
- **Blacksmithing/Mining:** Copper Ore, Tin Ore, Bronze Bar, Rough Stones
- **Enchanting:** Strange Dust, Lesser Magic Essence, Greater Astral Essence
- **Recipes:** Early profession recipes (see Classic Recipes DB/Trainers)

### Files in this Folder
- `dynamic-leveling-vendor.lua`: The Eluna script implementing the dynamic vendor logic.
- `dynamic-leveling-vendor.sql`: SQL to add the vendor NPC and spawn to your world.
- `dynamic-leveling-vendor-delete.sql`: SQL to remove the vendor NPC and spawn from your world.

### Usage
1. Import `dynamic-leveling-vendor.sql` into your world database to add the vendor.
2. Place `dynamic-leveling-vendor.lua` in your server's Lua scripts folder.
3. Restart your server or reload Eluna.
4. To remove the vendor, import `dynamic-leveling-vendor-delete.sql`.

### Next Steps
- [ ] Build a new Eluna script skeleton for the vendor
- [ ] Provide curated item lists per profession for levels 1-60, 60-70, and 70-80
- [ ] Implement dynamic pricing logic
- [ ] Add debugging/testing tools for verifying player-specific stock

For more details, see the `lua_scripts/npc_dynamic_vendor.lua` (coming soon) and the design notes in the project documentation.