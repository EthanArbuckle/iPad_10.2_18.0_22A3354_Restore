@implementation PreferencesMgr

+ (id)sharedInstance
{
  if (qword_100069608 != -1)
    dispatch_once(&qword_100069608, &stru_100055B58);
  return (id)qword_100069600;
}

- (id)httpRequestHeaders
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100068D90[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (id)hostportOverride
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100068D98[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (id)protocolSchemeOverride
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100068DA0[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (id)deviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100068DA8[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (id)locationDeviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100068DB0[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (id)overriddenOSVersion
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100068DB8[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (id)overriddenBuildVersion
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100068DC0[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (BOOL)bccOnFenceTrigger
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_100068DD0[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (BOOL)dontUseSLC
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_100068DC8[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (BOOL)userTestApplication
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_100068DE0, CFSTR("com.apple.icloud.fmflocatord"));
}

- (id)errorForUnregister
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100068DD8[0], CFSTR("com.apple.icloud.fmflocatord"));
}

- (void)setWristStatusLaunchEventExpirationDate:(id)a3
{
  +[FMPreferencesUtil setDate:forKey:inDomain:](FMPreferencesUtil, "setDate:forKey:inDomain:", a3, CFSTR("WristStatusLaunchEventExpirationDateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (NSDate)wristStatusLaunchEventExpirationDate
{
  return (NSDate *)+[FMPreferencesUtil dateForKey:inDomain:](FMPreferencesUtil, "dateForKey:inDomain:", CFSTR("WristStatusLaunchEventExpirationDateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (void)setNetworkStatusLaunchEventExpirationDate:(id)a3
{
  +[FMPreferencesUtil setDate:forKey:inDomain:](FMPreferencesUtil, "setDate:forKey:inDomain:", a3, CFSTR("NetworkStatusLaunchEventExpirationDateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (NSDate)networkStatusLaunchEventExpirationDate
{
  return (NSDate *)+[FMPreferencesUtil dateForKey:inDomain:](FMPreferencesUtil, "dateForKey:inDomain:", CFSTR("NetworkStatusLaunchEventExpirationDateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (void)setWristStatusLaunchEventTargetDeviceState:(id)a3
{
  +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", a3, CFSTR("WristStatusLaunchEventTargetDeviceStateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (NSString)wristStatusLaunchEventTargetDeviceState
{
  return (NSString *)+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("WristStatusLaunchEventTargetDeviceStateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (void)setCellularPlanStatusCachedValue:(int64_t)a3
{
  +[FMPreferencesUtil setInteger:forKey:inDomain:](FMPreferencesUtil, "setInteger:forKey:inDomain:", a3, CFSTR("CellularPlanStatusKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (int64_t)cellularPlanStatusCachedValue
{
  id v2;
  int64_t result;

  v2 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("CellularPlanStatusKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  result = (int64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("CellularPlanStatusOverrideKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if (result <= 0)
    return (int64_t)v2;
  return result;
}

- (void)setNetworkStatusLaunchEventTargetDeviceState:(id)a3
{
  +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", a3, CFSTR("NetworkStatusLaunchEventTargetDeviceStateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (NSString)networkStatusLaunchEventTargetDeviceState
{
  return (NSString *)+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("NetworkStatusLaunchEventTargetDeviceStateKey"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (void)setWristRegisterRetryCount:(int64_t)a3
{
  +[FMPreferencesUtil setInteger:forKey:inDomain:](FMPreferencesUtil, "setInteger:forKey:inDomain:", a3, CFSTR("WristRegisterRetryCount"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (int64_t)wristRegisterRetryCount
{
  return (int64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("WristRegisterRetryCount"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (void)setNetworkRegisterRetryCount:(int64_t)a3
{
  +[FMPreferencesUtil setInteger:forKey:inDomain:](FMPreferencesUtil, "setInteger:forKey:inDomain:", a3, CFSTR("NetworkRegisterRetryCount"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (int64_t)networkRegisterRetryCount
{
  return (int64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("NetworkRegisterRetryCount"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

@end
