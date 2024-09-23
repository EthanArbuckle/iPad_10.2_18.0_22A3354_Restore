@implementation W5FeatureAvailability

+ (id)_featureAvailabilityDefaults
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)qword_1000FB770;
  if (!qword_1000FB770)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.wifivelocity.features")));
    v5 = (void *)qword_1000FB770;
    qword_1000FB770 = v4;

    v2 = (void *)qword_1000FB770;
  }
  return v2;
}

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_content("com.apple.wifivelocity", a2);
}

+ (BOOL)diagnosticsModeEnabled
{
  unsigned __int8 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = +[W5FeatureAvailability isInternalBuild](W5FeatureAvailability, "isInternalBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[W5FeatureAvailability _featureAvailabilityDefaults](W5FeatureAvailability, "_featureAvailabilityDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("diagnostics-mode")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[W5FeatureAvailability _featureAvailabilityDefaults](W5FeatureAvailability, "_featureAvailabilityDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("diagnostics-mode")));

    v2 = objc_msgSend(v6, "BOOLValue");
  }
  return v2;
}

@end
