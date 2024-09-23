@implementation MSDHubFeatureFlags

+ (id)supportedFeatureFlags
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("DisableStudioDisplayUpdate"), CFSTR("DisableNightlySnapshotRevert"), CFSTR("DisableNightlyLowPowerMode"), CFSTR("DisableScreenDarkHours"), CFSTR("DisableBackgroundInstall"), 0);
}

+ (BOOL)isSupportedFeatureFlag:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHubFeatureFlags supportedFeatureFlags](MSDHubFeatureFlags, "supportedFeatureFlags"));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (BOOL)disableStudioDisplayUpdate
{
  return +[MSDHubFeatureFlags _readBoolValueForFeatureFlag:](MSDHubFeatureFlags, "_readBoolValueForFeatureFlag:", CFSTR("DisableStudioDisplayUpdate"));
}

+ (BOOL)disableNightlySnapshotRevert
{
  return +[MSDHubFeatureFlags _readBoolValueForFeatureFlag:](MSDHubFeatureFlags, "_readBoolValueForFeatureFlag:", CFSTR("DisableNightlySnapshotRevert"));
}

+ (BOOL)disableNightlyLowPowerMode
{
  return +[MSDHubFeatureFlags _readBoolValueForFeatureFlag:](MSDHubFeatureFlags, "_readBoolValueForFeatureFlag:", CFSTR("DisableNightlyLowPowerMode"));
}

+ (BOOL)disableScreenDarkHours
{
  return +[MSDHubFeatureFlags _readBoolValueForFeatureFlag:](MSDHubFeatureFlags, "_readBoolValueForFeatureFlag:", CFSTR("DisableScreenDarkHours"));
}

+ (BOOL)disableBackgroundInstall
{
  return +[MSDHubFeatureFlags _readBoolValueForFeatureFlag:](MSDHubFeatureFlags, "_readBoolValueForFeatureFlag:", CFSTR("DisableBackgroundInstall"));
}

+ (BOOL)_readBoolValueForFeatureFlag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("HubSuppliedSettings")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("FeatureFlags")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v3));

  LOBYTE(v3) = objc_msgSend(v7, "BOOLValue");
  return (char)v3;
}

@end
