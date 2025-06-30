# Script Catalog Refactor Requirements & Recommendations

## Overview
This document outlines the requirements and recommendations for refactoring the AzerothCore Solo Eluna Scripts catalog. The goal is to ensure consistency, maintainability, and extensibility, while supporting advanced features like modal previews and robust filtering.

---

## 1. Metadata Schema

All script/system entries should use the following schema:

```json
{
  "name": "Buffer NPC",
  "pack": "Ornfelt",
  "category": "QOL",
  "quality": "Good",
  "sql": "None",
  "implementation": "NPC",
  "description": "An NPC that buffs players with various spells. Useful for solo or small-group servers to reduce downtime.",
  "author": "Dinkledork",
  "location": "Script Packs/Ornfelt Script Pack/azerothcore_lua_scripts/lua/DinklePack_Lua/",
  "files": [
    { "name": "BufferNPC.lua", "size": "3.2KB", "previewable": true }
  ]
}
```

---

## 2. Field Explanations

- **name**: Human-readable name of the system/script.
- **pack**: Script pack or collection it belongs to.
- **category**: Gameplay impact/purpose (see vocabulary below).
- **quality**: Quality rating (see vocabulary below).
- **sql**: "Required", "Optional", "None", "Unknown".
- **implementation**: In-game mechanism/interface (see vocabulary below).
- **description**: A clear, concise, and informative description (combine old description and notes).
- **author**: Script author or maintainer.
- **location**: Path in the repo.
- **files**: Array of file objects (name, size, previewable).

---

## 3. Standardized Vocabularies

### Category (impact/purpose)
- QOL (Quality of Life)
- Overhaul
- Big Fix
- Fun
- Progression
- Economy
- Event
- Challenge
- System Pack
- Cosmetic
- Utility
- Hardcore
- Social
- Customization
- Vendor
- Leveling
- Profession
- PvP
- Raid/Dungeon
- Other (for edge cases)

### Implementation (in-game mechanism)
- NPC
- GM Command
- Item
- Spell
- Zone
- Vendor
- UI
- Passive
- Event
- Script Pack
- Command
- Quest
- System
- Aura
- Object
- Mount
- Achievement
- Other (for edge cases)

### Quality
- Excellent
- Good
- Fair
- Poor
- Experimental

#### Quality Standards
- **Excellent:** Production-ready, well-documented, thoroughly tested, and widely applicable. No known bugs or issues. Safe for all server types.
- **Good:** Stable and reliable, with minor or no known issues. May lack some documentation or advanced features, but works as intended for most use cases.
- **Fair:** Functional but may have some limitations, edge cases, or minor bugs. May require additional testing or adaptation for production use.
- **Poor:** Unstable, incomplete, or known to have significant bugs or missing features. Use with caution and only for testing or inspiration.
- **Experimental:** New, untested, or proof-of-concept. May be unstable or incomplete, and not recommended for production servers without further review.

---

## 4. Refactor Process

1. **Adopt this schema** for all catalog entries.
2. **Audit and update** your catalog to use these vocabularies and combine description/notes.
3. **Automate validation** (script or manual) to ensure all entries conform.
4. **Document the standard** and update as needed for future contributions.

---

## 5. Recommendations

- Always provide a meaningful description for each entry.
- Use the controlled vocabularies for category, quality, and implementation.
- Omit unnecessary fields (e.g., license, readme, reviewed) for simplicity.
- Keep the catalog data in a separate JSON file for maintainability.
- Support modal/preview features by including file paths and previewable flags.
- Regularly audit and update the catalog for consistency and completeness.

---

_Last updated: 2024-06-10_ 