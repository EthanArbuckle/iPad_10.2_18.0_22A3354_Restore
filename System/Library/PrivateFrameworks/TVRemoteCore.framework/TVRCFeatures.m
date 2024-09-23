@implementation TVRCFeatures

+ (BOOL)legacyDevicesDisabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("TVRemoteLegacyDevicesDisabled"), CFSTR(".GlobalPreferences"), 0) != 0;
}

+ (BOOL)isWakeToRemoteOnLockScreenDisabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("TVRemoteWakeToRemoteOnLockScreenDisabled"), CFSTR(".GlobalPreferences"), 0) != 0;
}

+ (BOOL)isPersistOnLockScreenEnabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("TVRemotePersistOnLockScreen"), CFSTR(".GlobalPreferences"), 0) != 0;
}

+ (BOOL)tvPushToTalkEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isInternalInstall
{
  return MGGetBoolAnswer();
}

+ (BOOL)capellaEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)greymatterEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)corianderEnabled
{
  return 1;
}

@end
