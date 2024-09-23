@implementation CKRecordID(WBSCKRecordIDExtras)

- (uint64_t)safari_isInPrivateDatabase
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "zoneID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ownerName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C94730]);

  return v3;
}

@end
