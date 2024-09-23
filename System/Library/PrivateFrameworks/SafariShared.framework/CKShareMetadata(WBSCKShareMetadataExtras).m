@implementation CKShareMetadata(WBSCKShareMetadataExtras)

- (uint64_t)safari_supportsSharedTabGroups
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "share");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_isTabGroupSecondaryRecordZoneID");

  return v4;
}

@end
