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
We are systematically cataloging all Lua scripts in this repository into a comprehensive, searchable database. Each script is being evaluated for code quality, functionality, and requirements.

### Completed Sections ✅
- **Solo Scripts**: 6 individual script packages cataloged
- **YggdrasilWotlk Script Pack**: 43 scripts cataloged (100% complete)
- **Isidorsson Script Pack**: 49 systems cataloged (100% complete)
  - Includes breakdown of major AIO systems and individual QoL scripts
  - All grouped collections separated into individual entries
- **HTML Interface**: Complete with pagination, filtering, and search functionality

### In Progress 🔄
- **Ornfelt Script Pack**: 9 systems cataloged out of 65+ directories
  - Recently added: AzerothCore Multi-Vendor, Starting NPC, Global Mail/Banking, Zone Selector, Trivia System, Wowhead Integration, Auto Rez, Boss Timer, CarbonCopy, Event Scripts Collection
  - **Next up**: Continuing alphabetically with Acore_LevelUpReward, Acore_LootStats, Acore_Lua_BuffNPC, Acore_Lua_Mythic_Plus, Acore_Lua_RandomlyAttacked

### Remaining Work 📋
- **Ornfelt Script Pack**: ~56 more directories to catalog
- **Final Review**: Quality assessments and testing
- **Documentation**: Installation guides and usage instructions

### Catalog Access
- **Interactive HTML Catalog**: `script-catalog.html` - Complete searchable interface with filtering by pack, quality, SQL requirements, and categories
- **Filters Available**: 6 script packs, 4 quality levels, 3 SQL requirements, 35+ categories
- **Total Scripts Cataloged**: 107 systems and counting

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
