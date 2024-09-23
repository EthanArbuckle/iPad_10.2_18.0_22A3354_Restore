@implementation W5FeatureAvailability

+ (id)_featureAvailabilityDefaults
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)_featureAvailabilityDefaults;
  if (!_featureAvailabilityDefaults)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.wifivelocity.features"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_featureAvailabilityDefaults;
    _featureAvailabilityDefaults = v4;

    v2 = (void *)_featureAvailabilityDefaults;
  }
  return v2;
}

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_content();
}

+ (BOOL)diagnosticsModeEnabled
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = +[W5FeatureAvailability isInternalBuild](W5FeatureAvailability, "isInternalBuild");
  +[W5FeatureAvailability _featureAvailabilityDefaults](W5FeatureAvailability, "_featureAvailabilityDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("diagnostics-mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[W5FeatureAvailability _featureAvailabilityDefaults](W5FeatureAvailability, "_featureAvailabilityDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("diagnostics-mode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_msgSend(v6, "BOOLValue");
  }
  return v2;
}

@end
