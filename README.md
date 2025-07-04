# AzerothCore Solo Server - Eluna Lua Scripts

A comprehensive collection of custom Eluna Lua scripts designed for a solo World of Warcraft WotLK server experience. This project focuses on creating engaging solo gameplay while maintaining the authentic progression and challenge of the original WoW experience.

## 🎯 Project Overview

This repository contains custom Eluna Lua scripts that enhance the solo player experience on an AzerothCore server. The scripts are designed to work with several key mods that create a balanced, challenging, and enjoyable solo experience:

### Core Mods Integration
- **mod-individual-progression**: Gates content to match original WoW release progression
- **mod-autobalance**: Scales encounters for solo play while maintaining challenge
- **mod-playerbots**: Provides AI companions when needed
- **mod-ah-bot**: Maintains a functional auction house economy
- **mod-solo-craft**: Enables solo crafting of items that normally require groups

### Design Philosophy
- **Authentic Experience**: Content is gated to match original WoW release progression
- **Solo-Focused**: All systems are designed for single-player enjoyment
- **Challenging**: Maintains difficulty while being accessible to solo players
- **Progressive**: Systems that scale with player progression and gear

## 📁 Repository Structure

```
azerothcore-solo-eluna-scripts/
├── lua_scripts/          # Eluna Lua script files
├── data/
│   └── sql/
│       └── world/        # SQL files for database modifications
├── README.md             # This file
```

## 🚀 Installation

### Prerequisites
- AzerothCore server with Eluna module installed
- Required mods: mod-individual-progression, mod-autobalance, mod-playerbots, mod-ah-bot, mod-solo-craft

### Installation Steps

1. **Clone or Download** this repository to your AzerothCore server directory

2. **Copy Lua Scripts**:
   ```bash
   # Copy all .lua files from lua_scripts/ to your server's lua_scripts folder
   cp lua_scripts/*.lua /path/to/azerothcore/lua_scripts/
   ```

3. **Import SQL Files** (if required):
   ```bash
   # Import any SQL files from data/sql/world/ to your world database
   mysql -u username -p world < data/sql/world/script_name.sql
   ```

4. **Restart Your Server**:
   ```bash
   # Restart your AzerothCore server to load the new scripts
   ./worldserver
   ```

TODO: Update the above installation instructions to be more accurate.

### Verification
- Check your server logs for any Eluna script loading errors
- Verify that the scripts are loaded by checking the console output
- Test the functionality in-game

## 🎮 Available Systems

This repository includes a comprehensive collection of solo-focused systems. For detailed information about all available scripts, including code quality assessments, installation requirements, and functionality descriptions, see the **[Script Catalog](CATALOG.md)**.

### Quick Overview
- **Solo Scripts**: 6 individual script packages for specific functionality
- **Script Packs**: 3 comprehensive collections from various authors  
- **Custom Scripts**: Design documents and implementation ideas

### Categories Include:
- **Economy & Trading**: Black Market Auction House, Dynamic Trader, Tier Vendors
- **Player Experience**: Account-wide features, Faster Mounts, Extended Holidays
- **Quality of Life**: Speed enhancements, automatic systems, holiday control
- **Multi-System Packs**: Comprehensive script collections from community authors

For complete details, file locations, and installation instructions, see the **[Script Catalog](CATALOG.md)**.

## 🔧 Configuration

### Script Configuration
Most scripts can be configured by editing the variables at the top of each Lua file. Common configuration options include:

- **Reward scaling**: Adjust gold, experience, or item rewards
- **Difficulty settings**: Modify encounter difficulty levels
- **Event timing**: Set cooldowns and event frequencies
- **Location settings**: Customize spawn points and teleport locations

### Database Configuration
Some scripts may require database entries for:
- Custom NPCs and creatures
- Quest data
- Item definitions
- Achievement tracking

## 🐛 Troubleshooting

### Common Issues

1. **Scripts Not Loading**:
   - Verify Eluna module is properly installed
   - Check file permissions on Lua scripts
   - Review server logs for syntax errors

2. **Database Errors**:
   - Ensure SQL files are imported to the correct database
   - Check for conflicting entries
   - Verify database user permissions

3. **Performance Issues**:
   - Monitor server performance with scripts enabled
   - Consider disabling unused systems
   - Check for infinite loops or memory leaks

### Getting Help
- Check the server console for error messages
- Review the Eluna documentation for syntax issues
- Test scripts individually to isolate problems

## 📊 Current Cataloging Status

**Last Updated**: December 2024

### Progress Overview
We are systematically cataloging all Lua scripts in this repository into a comprehensive, searchable database. The catalog has been successfully refactored to use external JSON data loading and standardized category vocabulary.

### Completed Sections ✅
- **Solo Scripts**: 6 individual script packages cataloged
- **YggdrasilWotlk Script Pack**: 43 scripts cataloged (100% complete)
- **Isidorsson Script Pack**: 49 systems cataloged (100% complete)
- **Ornfelt Script Pack**: Partially complete - lua/ directory cataloged, but eluna-scripts/ mapped as single system
- **Refactor Infrastructure**: External JSON loading, category vocabulary standardization (94 → 15 categories)
- **HTML Interface**: Complete with pagination, filtering, and search functionality

### Current Issues & Required Work 🔧
- **Implementation Field**: Partially fixed (82 clean, 311 legacy needing review) - systematic review required
- **Quality Field**: Completely removed due to inconsistency - no longer an issue  
- **Ornfelt Expansion Completed**: ✅ Successfully broke down "Eluna Scripts Pack" into 21 individual entries
- **Massive Uncatalogued Content**: 29 major directories in Ornfelt lua/ folder remain completely uncatalogued

#### Uncatalogued Ornfelt Directories Analysis 📋


**Template/Tool Systems (4 directories)** - Specialized systems:
- lua-ItemUpgrader-Template/, lua-NotOnly-RandomMorpher/, lua-Super-BufferNPC/, lua-aio-paragon-system/

**Major Script Collections (5+ directories)** - Each contains multiple individual scripts:
- **RandomScriptsforAzerothCore/**: 328+ individual .lua files (completely uncatalogued)
- **WowEmulationScriptPack/**: 368 individual lua files
- **WowLuaStuff/**: 11+ individual scripts  
- **PublicScripts/**: Unknown quantity of scripts
- **Scripts/**: Unknown quantity of scripts

**Complex Systems (3 directories)** - Advanced/specialized systems:
- WardenInject/ (anti-cheat), World-of-Bloxcraft-Main/ (custom world), plus others

#### Expansion Potential Impact 🚀
- **Current Catalog**: 413 scripts
- **Conservative Estimate**: +400-500 additional scripts from uncatalogued directories
- **Full Expansion Potential**: 800-1000+ total scripts if all collections are properly cataloged
- **RandomScriptsforAzerothCore alone**: Would nearly double current catalog size

**Next Priority**: The RandomScriptsforAzerothCore directory represents the largest single expansion opportunity with 328+ individual scripts that are completely invisible to catalog users.

### Data Quality Status
- **Categories**: ✅ Standardized (15 clean categories)
- **Descriptions**: ✅ Consolidated (notes merged)
- **Implementation**: ❌ Broken (362 inconsistent values, needs complete rework)
- **Quality**: ❌ Inconsistent (needs systematic review)
- **Total Scripts**: 393 cataloged with varying data quality

### Catalog Access
- **Interactive HTML Catalog**: `script-catalog.html` - Complete searchable interface with filtering by pack, quality, SQL requirements, and categories
- **Filters Available**: 6 script packs, 4 quality levels, 3 SQL requirements, 15 categories
- **Missing Filter**: Implementation (due to data quality issues)
- **Total Scripts Cataloged**: 393 systems across all packs

#### Viewing the Catalog
To properly view the interactive HTML catalog (required for JSON data loading):

1. **Start a local web server** in the repository directory:
   ```bash
   python3 -m http.server 8000
   ```

2. **Open your browser** and navigate to:
   ```
   http://localhost:8000/script-catalog.html
   ```

3. **Alternative ports** (if 8000 is in use):
   ```bash
   python3 -m http.server 3000    # Use port 3000
   python3 -m http.server 9000    # Use port 9000
   ```

**Note**: The catalog requires a web server to load the external JSON data file. Opening `script-catalog.html` directly in a browser will not work due to CORS restrictions.

### Methodology
- Each directory is evaluated as either a single cohesive system or a collection of standalone scripts
- Quality assessment based on code examination, documentation, and complexity
- Duplicate systems across packs are identified and noted
- Non-Lua content (C++, Python, documentation-only) is appropriately categorized

**Note**: This cataloging effort represents the most comprehensive documentation of AzerothCore Eluna scripts available, with detailed technical assessments and implementation guidance for each system.

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch
3. Add your scripts to the appropriate directory
4. Include any necessary SQL files
5. Update documentation
6. Submit a pull request

### Script Guidelines
- Follow Eluna Lua best practices
- Include error handling and validation
- Add configuration options at the top of files
- Document any database requirements
- Test thoroughly before submitting

## 📄 License

This project is open source. Please respect the original AzerothCore and Eluna licenses.

## 🙏 Acknowledgments

- AzerothCore development team
- Eluna module developers
- The WoW private server community
- All contributors to the solo server experience

---

**Note**: This is a work in progress. New scripts and systems are being added regularly. Check back often for updates!
