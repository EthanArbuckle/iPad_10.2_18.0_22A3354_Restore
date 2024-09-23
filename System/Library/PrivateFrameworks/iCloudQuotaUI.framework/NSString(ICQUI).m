@implementation NSString(ICQUI)

- (uint64_t)icqui_isChangeStoragePlanPath
{
  return objc_msgSend(a1, "containsString:", CFSTR("CHANGE_STORAGE_PLAN"));
}

- (uint64_t)icqui_isDeviceOffersPath
{
  return objc_msgSend(a1, "containsString:", CFSTR("DEVICE_OFFERS"));
}

- (uint64_t)icqui_isStorageUpgradePath
{
  return objc_msgSend(a1, "containsString:", CFSTR("STORAGE_UPGRADE"));
}

- (uint64_t)icqui_isPhotosPath
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PHOTOS"));

  return v2;
}

- (uint64_t)icqui_isCurrentDeviceBackupPath
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("CURRENT_DEVICE_BACKUP"));

  return v2;
}

- (uint64_t)icqui_isLocalDeviceBackupPath
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("LOCAL_BACKUP"));

  return v2;
}

- (uint64_t)icqui_isReviewLargeFilesPath
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("REVIEW_LARGE_FILES"));

  return v2;
}

- (uint64_t)icqui_isCFUSkipPath
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEC71E0]);

  return v2;
}

@end
