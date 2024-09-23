@implementation CKRecord(CloudSettingsExtras)

- (uint64_t)safari_isCloudPerSiteSettingRecord
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PerSiteSetting"));

  return v2;
}

- (uint64_t)safari_isCloudSettingRecord
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Setting"));

  return v2;
}

- (uint64_t)safari_isCloudBackgroundImageRecord
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recordName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("StartPageBackgroundImage"));

  return v3;
}

- (id)safari_encodedRecordData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(a1, "encodeWithCoder:", v2);
  objc_msgSend(v2, "encodedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
