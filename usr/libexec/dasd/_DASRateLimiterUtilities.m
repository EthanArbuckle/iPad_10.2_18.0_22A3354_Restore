@implementation _DASRateLimiterUtilities

+ (id)defaultRateLimiterConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 25, 300.0));
  objc_msgSend(v2, "addObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 60, 3600.0));

  objc_msgSend(v2, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:](_DASActivityRateLimitConfiguration, "rateLimitConfigurationWithName:andLimits:", _DASDefaultConfigurationName, v2));

  return v5;
}

+ (id)ckRateLimitConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 60, 60.0));
  objc_msgSend(v2, "addObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 120, 300.0));

  objc_msgSend(v2, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 360, 3600.0));

  objc_msgSend(v2, "addObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 480, 14400.0));

  objc_msgSend(v2, "addObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 1080, 86400.0));

  objc_msgSend(v2, "addObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:](_DASActivityRateLimitConfiguration, "rateLimitConfigurationWithName:andLimits:", _DASCKRateLimitConfigurationName, v2));

  return v8;
}

+ (id)pecRateLimitConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimit rateLimitWithMaximum:perWindow:](_DASActivityRateLimit, "rateLimitWithMaximum:perWindow:", 100, 86400.0));
  objc_msgSend(v2, "addObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:](_DASActivityRateLimitConfiguration, "rateLimitConfigurationWithName:andLimits:", _DASCKRateLimitConfigurationName, v2));

  return v4;
}

+ (BOOL)consideredInLPMWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLowPowerModeStatus](_CDContextQueries, "keyPathForLowPowerModeStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v7));

  LOBYTE(v3) = objc_msgSend(v8, "BOOLValue");
  return v3 & ~v6;
}

+ (BOOL)isAggregateClient:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  void *v19;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NSURLSessionBackgroundPoolName"));

    if ((v7 & 1) != 0)
      goto LABEL_8;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ckdiscretionaryd"));

    if ((v11 & 1) != 0)
      goto LABEL_8;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
    v15 = objc_msgSend(v14, "containsString:", CFSTR("com.apple.mlhost"));

    if ((v15 & 1) != 0)
      goto LABEL_8;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widgetID"));

  if (v16)
  {
LABEL_8:
    LOBYTE(v17) = 1;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rateLimitConfigurationName"));
    v17 = objc_msgSend(v19, "isEqualToString:", _DASCKRateLimitConfigurationName);

  }
  return v17;
}

+ (id)rateLimitIdentifierForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rateLimitConfigurationName"));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v5));
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"));

  if (v7)
    goto LABEL_5;
  if (!v5)
  {
    if (!objc_msgSend(a1, "isAggregateClient:", v4)
      || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications")),
          v16 = objc_msgSend(v15, "count"),
          v15,
          !v16))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceName"));

      if (v18)
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceName"));
        goto LABEL_6;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "involvedProcesses"));
      v20 = objc_msgSend(v19, "count");

      if (v20)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "involvedProcesses"));
        goto LABEL_19;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
      v22 = objc_msgSend(v21, "count");

      if (!v22)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleId"));

        if (!v9)
          goto LABEL_7;
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleId"));
        goto LABEL_6;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
LABEL_19:
    v13 = v17;
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
    goto LABEL_20;
  }
  if (objc_msgSend(v5, "isEqualToString:", _DASCKRateLimitConfigurationName))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

      objc_msgSend(v6, "appendFormat:", CFSTR("-%@"), v13);
      v14 = v6;
LABEL_20:
      v9 = v14;

      goto LABEL_7;
    }
  }
LABEL_5:
  v8 = v6;
LABEL_6:
  v9 = v8;
LABEL_7:

  return v9;
}

+ (void)adjustStartAfterDate:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "setStartAfter:", a3);
}

+ (id)getCurrentBootSessionUUID
{
  void *v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0xA177D5A1uLL);
  sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2));
  free(v2);
  return v3;
}

@end
