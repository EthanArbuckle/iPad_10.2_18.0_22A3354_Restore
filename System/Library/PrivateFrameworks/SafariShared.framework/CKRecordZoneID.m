@implementation CKRecordZoneID

void __71__CKRecordZoneID_WBSCKRecordZoneIDExtras__safari_bookmarksRecordZoneID__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C950A0]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("Bookmarks"), *MEMORY[0x1E0C94728]);
  v2 = (void *)safari_bookmarksRecordZoneID_zoneID;
  safari_bookmarksRecordZoneID_zoneID = v1;

}

void __71__CKRecordZoneID_WBSCKRecordZoneIDExtras__safari_tabGroupsRecordZoneID__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C950A0]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("TabGroups"), *MEMORY[0x1E0C94728]);
  v2 = (void *)safari_tabGroupsRecordZoneID_zoneID;
  safari_tabGroupsRecordZoneID_zoneID = v1;

}

@end
