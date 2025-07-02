#!/usr/bin/env python3
import json
import shutil
from datetime import datetime

def remove_quality_field():
    # Create backup
    backup_name = f"scriptsData.backup.remove_quality.{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    shutil.copy('scriptsData.json', backup_name)
    print(f"✅ Backup created: {backup_name}")
    
    # Load data
    with open('scriptsData.json', 'r') as f:
        data = json.load(f)
    
    print(f"Processing {len(data)} scripts...")
    
    # Track changes
    removed_count = 0
    
    for script in data:
        if 'quality' in script:
            del script['quality']
            removed_count += 1
    
    # Save updated data
    with open('scriptsData.json', 'w') as f:
        json.dump(data, f, indent=4)
    
    print("\n" + "="*60)
    print("QUALITY FIELD REMOVAL COMPLETE:")
    print("="*60)
    print(f"✅ Removed quality field from: {removed_count} scripts")
    print(f"📁 Backup: {backup_name}")
    
    # Validation - check no quality fields remain
    with open('scriptsData.json', 'r') as f:
        new_data = json.load(f)
    
    remaining_quality = sum(1 for script in new_data if 'quality' in script)
    print(f"🔍 Validation: {remaining_quality} scripts still have quality field (should be 0)")
    
    # Show sample of remaining fields
    if new_data:
        sample_fields = list(new_data[0].keys())
        print(f"📋 Remaining fields: {', '.join(sample_fields)}")
    
    return backup_name

if __name__ == "__main__":
    backup = remove_quality_field() 