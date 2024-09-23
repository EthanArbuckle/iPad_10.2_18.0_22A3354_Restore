@implementation VIFeatureFlags

+ (BOOL)isVisualLookUpDawnDomainsEnabled
{
  return 1;
}

+ (BOOL)isVisualLookUpDawnDomainsCPEnabled
{
  return _os_feature_enabled_impl();
}

@end
