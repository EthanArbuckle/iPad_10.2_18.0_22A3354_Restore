@implementation SMFeatureFlags

+ (BOOL)zelkovaOnWatchEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)zelkovaScheduledSendEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)zelkovaHandoffEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)zelkovaRemoteControlEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)zelkovaWorkoutEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)zelkovaBlastDoorEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)zelkovaGroupEnabled
{
  return _os_feature_enabled_impl();
}

@end
