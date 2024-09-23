@implementation CKRecordZoneID(WBSCKRecordZoneIDExtras)

+ (id)safari_bookmarksRecordZoneID
{
  if (safari_bookmarksRecordZoneID_onceToken != -1)
    dispatch_once(&safari_bookmarksRecordZoneID_onceToken, &__block_literal_global_12);
  return (id)safari_bookmarksRecordZoneID_zoneID;
}

+ (id)safari_tabGroupsRecordZoneID
{
  if (safari_tabGroupsRecordZoneID_onceToken != -1)
    dispatch_once(&safari_tabGroupsRecordZoneID_onceToken, &__block_literal_global_6);
  return (id)safari_tabGroupsRecordZoneID_zoneID;
}

+ (uint64_t)safari_tabGroupSecondaryRecordZoneNameWithRootRecordName:()WBSCKRecordZoneIDExtras
{
  return objc_msgSend(CFSTR("TabGroup_"), "stringByAppendingString:");
}

+ (id)safari_tabGroupSecondaryRecordZoneIDWithRootRecordName:()WBSCKRecordZoneIDExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C950A0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "safari_tabGroupSecondaryRecordZoneNameWithRootRecordName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v7, *MEMORY[0x1E0C94728]);
  return v8;
}

- (uint64_t)safari_isTabGroupSecondaryRecordZoneID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("TabGroup_"));

  return v2;
}

- (id)safari_tabGroupRootRecordName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_substringFromPrefix:", CFSTR("TabGroup_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)safari_isInPrivateDatabase
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ownerName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C94728]);

  return v2;
}

@end
