@implementation LNFeatureFlagUtilities

+ (BOOL)featureEnabledWithDomain:(id)a3 feature:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = objc_msgSend(v5, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "UTF8String");

  return _os_feature_enabled_impl(v7, v9);
}

+ (BOOL)featureEnabledWithDomainFeaturePair:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = 0;
  else
    v8 = +[LNFeatureFlagUtilities featureEnabledWithDomain:feature:](LNFeatureFlagUtilities, "featureEnabledWithDomain:feature:", v4, v5);

  return v8;
}

@end
