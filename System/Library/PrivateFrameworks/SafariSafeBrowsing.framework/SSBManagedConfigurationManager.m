@implementation SSBManagedConfigurationManager

+ (BOOL)isSafeBrowsingEnabledStateLockedDownByRestrictions
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D47130]);

  return v3;
}

+ (BOOL)restrictedBoolValueForSafeBrowsing
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLRestrictionForFeature:", *MEMORY[0x1E0D47130]) != 2;

  return v3;
}

@end
