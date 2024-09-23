@implementation RMFeatureFlags

+ (BOOL)isAppDistributionPVEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDiskManagementSubscriberEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFileConduitEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHTTPConduitEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isManagedAppsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNetworkEAPConfigurationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNetworkWiFiConfigurationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_ui();
}

+ (BOOL)hasBridgeOS
{
  return 0;
}

@end
