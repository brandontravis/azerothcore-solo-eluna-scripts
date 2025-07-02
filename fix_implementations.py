#!/usr/bin/env python3
import json
import shutil
from datetime import datetime
from collections import Counter

def create_implementation_fixes():
    """Create mapping rules for clear implementation patterns"""
    
    # Pattern-based auto-fixes - only the obvious ones
    auto_fixes = {
        # Clear Fix patterns → Passive (background fixes)
        '🛠️ Quest Fix': 'Passive',
        '🛠️ Boss Fix': 'Passive', 
        '🛠️ NPC Fix': 'Passive',
        '🛠️ Instance Fix': 'Passive',
        '🛠️ Spell Fix': 'Passive',
        '🛠️ Item Fix': 'Passive',
        '🛠️ Zone Fix': 'Passive',
        '🛠️ Creature Fix': 'Passive',
        '🛠️ Network Fix': 'Passive',
        '🛠️ Mount Fix': 'Passive',
        '🛠️ Equipment Fixes': 'Passive',
        '⚰️ Stormwind Rez Fix': 'Passive',
        
        # Clear NPC patterns
        '🏪 NPC + Interface': 'NPC',
        '🏪 NPCs': 'NPC', 
        '🏪 NPC + UI': 'NPC',
        '🛒 NPC + GM Commands': 'NPC',
        '🙏 Prayer NPCs': 'NPC',
        '💎 Gem Vendor NPC': 'NPC',
        '🧙 Enchanting NPC': 'NPC',
        '👁️ Auto Buff NPC': 'NPC',
        '👥 NPC + Level-Based Buffs': 'NPC',
        '⚔️ NPC + Difficulty Scaling': 'NPC',
        '🛠️ Buff NPC': 'NPC',
        
        # Clear GM Command patterns  
        '💻 GM Command': 'GM Command',
        '💻 GM Interface': 'GM Command',
        '💻 Player GM Menu': 'GM Command',
        '📧 GM Command + Mail System': 'GM Command',
        '👑 VIP Commands': 'GM Command',
        
        # Clear UI patterns
        '🏪 Banking UI': 'UI',
        '⚙️ UI Enhancement': 'UI',
        '🛡️ Belt Menu': 'UI',
        '🏅 Reward Points Level Menu': 'UI',
        '🛒 Store Interface': 'UI',
        '🎭 Race Interface': 'UI',
        '🌟 Talent Interface': 'UI',
        '🎰 Gambling Interface': 'UI',
        '💻 GM Interface': 'UI',
        '🛠️ Stat Point UI & Handler': 'UI',
        
        # Clear Event patterns
        '🎉 Server Events': 'Event',
        '🎭 RP Event': 'Event',
        '🎄 Custom Greench Event': 'Event',
        '⏳ Chromie Event Scripts': 'Event',
        
        # Clear Automation/Passive patterns
        '⚙️ Automatic Systems': 'Passive',
        '🏃 Automatic Systems + Spell Learning': 'Passive',
        '🏹 Automatic Item Management': 'Passive',
        '🌟 Automatic Ability Learning': 'Passive',
        '💾 Automatic Save System': 'Passive',
        '📖 Auto Spell Learning': 'Passive',
        '📖 Auto Spells v1': 'Passive',
        '💀 Auto Rez': 'Passive',
        '🏃 Account-Wide Mounts': 'Passive',
        '🔧 Auto Repair': 'Passive',
        
        # Clear Documentation
        '📚 Documentation': 'Other',
        
        # Clear Discord Bot
        '🤖 Discord Bot': 'Other',
        '💬 Discord Bot': 'Other',
        '🤖 Automation': 'Passive',
    }
    
    return auto_fixes

def fix_implementations():
    # Create backup
    backup_name = f"scriptsData.backup.implementations.{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    shutil.copy('scriptsData.json', backup_name)
    print(f"✅ Backup created: {backup_name}")
    
    # Load data
    with open('scriptsData.json', 'r') as f:
        data = json.load(f)
    
    auto_fixes = create_implementation_fixes()
    
    print(f"Processing {len(data)} scripts...")
    
    # Track changes
    fixed_count = 0
    legacy_count = 0
    unchanged_count = 0
    
    for script in data:
        old_impl = script.get('implementation', 'Unknown')
        
        if old_impl in auto_fixes:
            # Auto-fix this one
            script['implementation'] = auto_fixes[old_impl]
            fixed_count += 1
            if fixed_count <= 5:  # Show first 5 examples
                print(f"FIXED #{fixed_count}: '{old_impl}' → '{auto_fixes[old_impl]}'")
        elif old_impl in ['NPC', 'GM Command', 'UI', 'Passive', 'Event', 'Other', 'Quest', 'Spell', 'System', 'Vendor']:
            # Already clean - don't change
            unchanged_count += 1
        else:
            # Everything else becomes legacy
            script['implementation'] = 'Needs Review (Legacy)'
            legacy_count += 1
            if legacy_count <= 5:  # Show first 5 examples
                print(f"LEGACY #{legacy_count}: '{old_impl}' → 'Needs Review (Legacy)'")
    
    # Save updated data
    with open('scriptsData.json', 'w') as f:
        json.dump(data, f, indent=4)
    
    print("\n" + "="*60)
    print("IMPLEMENTATION FIXES COMPLETE:")
    print("="*60)
    print(f"✅ Auto-fixed: {fixed_count}")
    print(f"📋 Marked as legacy: {legacy_count}") 
    print(f"➡️ Already clean: {unchanged_count}")
    print(f"📁 Backup: {backup_name}")
    
    # Show final distribution
    with open('scriptsData.json', 'r') as f:
        new_data = json.load(f)
    
    impl_counts = Counter(script.get('implementation', 'Unknown') for script in new_data)
    
    print(f"\n🔍 Final implementation distribution:")
    for impl, count in impl_counts.most_common():
        print(f"  {count:3d} - {impl}")
    
    return backup_name

if __name__ == "__main__":
    backup = fix_implementations() 