@implementation DMDFeatureFlags

+ (BOOL)isAppleInternal
{
  return os_variant_allows_internal_security_policies("com.apple.DeviceManagement", a2);
}

@end
