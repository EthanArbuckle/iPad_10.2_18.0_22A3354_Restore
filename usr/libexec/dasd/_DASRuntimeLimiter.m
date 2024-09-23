@implementation _DASRuntimeLimiter

- (_DASRuntimeLimiter)init
{
  _DASRuntimeLimiter *v2;
  _DASRuntimeLimiter *v3;
  uint64_t v4;
  NSDictionary *customDurations;
  uint64_t v6;
  _DASTrialManager *trialManager;
  NSMutableDictionary *testingOverride;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASRuntimeLimiter;
  v2 = -[_DASRuntimeLimiter init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter loadCustomDurations](v2, "loadCustomDurations"));
    customDurations = v3->_customDurations;
    v3->_customDurations = (NSDictionary *)v4;

    objc_storeStrong((id *)&v3->_limitationName, kDASRuntimeLimitationName);
    v6 = objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstanceForNamespace:](_DASTrialManager, "sharedInstanceForNamespace:", CFSTR("COREOS_DAS")));
    trialManager = v3->_trialManager;
    v3->_trialManager = (_DASTrialManager *)v6;

    -[_DASTrialManager addDelegate:](v3->_trialManager, "addDelegate:", v3);
    -[_DASRuntimeLimiter resetOnlyPreemptiveSuspend](v3, "resetOnlyPreemptiveSuspend");
    -[_DASRuntimeLimiter loadTrialParameters](v3, "loadTrialParameters");
    if (v3->_defaultRuntime == 0.0)
      v3->_defaultRuntime = 180.0;
    if (v3->_leniencyRuntime == 0.0)
      v3->_leniencyRuntime = 600.0;
    if (v3->_limitedRuntime == 0.0)
      v3->_limitedRuntime = 60.0;
    testingOverride = v3->_testingOverride;
    v3->_testingOverride = 0;

  }
  return v3;
}

+ (id)sharedLimiter
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018F30;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB3D8 != -1)
    dispatch_once(&qword_1001AB3D8, block);
  return (id)qword_1001AB3E0;
}

+ (BOOL)activityRequiresStrictCaps:(id)a3
{
  id v3;
  double v4;
  unsigned __int8 v5;

  v3 = a3;
  objc_msgSend(v3, "interval");
  if (v4 == 0.0)
    v5 = objc_msgSend(v3, "preventDeviceSleep");
  else
    v5 = 1;

  return v5;
}

+ (BOOL)activityRequiresLeniencyCaps:(id)a3
{
  id v3;
  BOOL v4;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isIntensive") & 1) != 0
    || (objc_msgSend(v3, "requiresDeviceInactivity") & 1) != 0
    || (objc_msgSend(v3, "requiresPlugin") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));

    v4 = v6 != 0;
  }

  return v4;
}

- (BOOL)hasDynamicOverrides:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  if (objc_msgSend(v3, "noTransferSizeSpecified"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
    v5 = objc_msgSend(v4, "containsOverrideForActivity:withLimitation:", v3, kDASDynamicRuntimeLimitationName);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (double)durationWithActivityType:(unint64_t)a3
{
  uint64_t v3;
  double result;

  if (!a3)
    return 0.0;
  if (a3 >= 0xB)
  {
    result = -1.0;
    if (a3 > 0x1D)
      return result;
    v3 = 40;
  }
  else
  {
    v3 = 32;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (BOOL)hasStaticOverrides:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *customDurations;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  customDurations = self->_customDurations;
  if (customDurations
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](customDurations, "objectForKeyedSubscript:", v5)),
        v7,
        v7))
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    if ((objc_msgSend(v9, "containsString:", CFSTR("com.apple.softwareupdate.autoinstall.startInstall")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v8 = objc_msgSend(v10, "containsString:", CFSTR("com.apple.SUOSUScheduler.tonight.install"));

    }
  }

  return v8;
}

- (double)dynamicDurationForActivity:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = 0.0;
  if (!-[_DASRuntimeLimiter hasDynamicOverrides:](self, "hasDynamicOverrides:", v4))
  {
LABEL_8:
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimits")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000DF880();
    goto LABEL_10;
  }
  v7 = (double)(unint64_t)objc_msgSend(v4, "duration");
  if ((objc_msgSend(v4, "noTransferSizeSpecified") & 1) != 0)
  {
    v6 = v7;
    goto LABEL_8;
  }
  -[_DASRuntimeLimiter durationWithActivityType:](self, "durationWithActivityType:", objc_msgSend(v4, "transferSizeType"));
  v6 = -1.0;
  if (v8 != -1.0)
  {
    if (v8 <= v7)
      v6 = v7;
    else
      v6 = v8;
    goto LABEL_8;
  }
  v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimits")));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000DF908();
LABEL_10:

  return v6;
}

- (double)staticDurationForActivity:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  double v12;
  NSObject *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = 0.0;
  if (!-[_DASRuntimeLimiter hasStaticOverrides:](self, "hasStaticOverrides:", v4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (objc_msgSend(v7, "containsString:", CFSTR("com.apple.softwareupdate.autoinstall.startInstall")))
  {

    v8 = -1.0;
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v10 = objc_msgSend(v9, "containsString:", CFSTR("com.apple.SUOSUScheduler.tonight.install"));

  v8 = -1.0;
  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_customDurations, "objectForKeyedSubscript:", v5));
    objc_msgSend(v11, "doubleValue");
    v6 = v12;

    if (v6 > 0.0)
    {
LABEL_6:
      v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimits")));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_1000DF974();

      v8 = v6;
    }
  }
LABEL_9:

  return v8;
}

- (id)loadCustomDurations
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "loadOverrides"));

  v4 = kDASRuntimeLimitationName;
  v18 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kDASRuntimeLimitationName));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryForPlist:", 1));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v4));

        if (v16)
        {
          if (!v11)
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)defaultRuntimeForActivity:(id)a3
{
  id v4;
  double leniencyRuntime;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  leniencyRuntime = -1.0;
  if (-[_DASRuntimeLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_testingOverride, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_testingOverride, "objectForKeyedSubscript:", v6));
      objc_msgSend(v8, "doubleValue");
      leniencyRuntime = v9;

      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", leniencyRuntime));
        v13 = 138543618;
        v14 = v4;
        v15 = 2112;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ has testing overrides to %@ seconds", (uint8_t *)&v13, 0x16u);

      }
    }
    else if (+[_DASRuntimeLimiter activityRequiresLeniencyCaps:](_DASRuntimeLimiter, "activityRequiresLeniencyCaps:", v4))
    {
      leniencyRuntime = self->_leniencyRuntime;
    }
    else if (+[_DASRuntimeLimiter activityRequiresStrictCaps:](_DASRuntimeLimiter, "activityRequiresStrictCaps:", v4))
    {
      leniencyRuntime = self->_limitedRuntime;
    }
    else
    {
      leniencyRuntime = self->_defaultRuntime;
    }

  }
  return leniencyRuntime;
}

- (double)maximumRuntimeForActivity:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = -1.0;
  if (-[_DASRuntimeLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_testingOverride, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_testingOverride, "objectForKeyedSubscript:", v6));
      objc_msgSend(v8, "doubleValue");
      v5 = v9;

      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
        v17 = 138543618;
        v18 = v4;
        v19 = 2112;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ has testing overrides to %@ seconds", (uint8_t *)&v17, 0x16u);

      }
    }
    else
    {
      v12 = 0.0;
      if (!-[_DASRuntimeLimiter hasDynamicOverrides:](self, "hasDynamicOverrides:", v4)
        || (-[_DASRuntimeLimiter dynamicDurationForActivity:](self, "dynamicDurationForActivity:", v4),
            v12 = v13,
            v13 != -1.0))
      {
        if (-[_DASRuntimeLimiter hasStaticOverrides:](self, "hasStaticOverrides:", v4))
        {
          -[_DASRuntimeLimiter staticDurationForActivity:](self, "staticDurationForActivity:", v4);
          if (v12 < v14)
            v12 = v14;
        }
        if (v12 != -1.0)
        {
          -[_DASRuntimeLimiter defaultRuntimeForActivity:](self, "defaultRuntimeForActivity:", v4);
          if (v12 >= v15)
            v5 = v12;
          else
            v5 = v15;
        }
      }
    }

  }
  return v5;
}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  double v11;
  NSObject *v12;
  const char *v13;
  double v14;
  BOOL v15;
  int v17;
  id v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "schedulingPriority");
  if ((unint64_t)v5 > _DASSchedulingPriorityDefault)
    goto LABEL_15;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("NSURLSessionBackgroundPoolName"));

    if ((v9 & 1) != 0)
      goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  if (!v10)
    goto LABEL_15;
  if (!-[_DASRuntimeLimiter hasStaticOverrides:](self, "hasStaticOverrides:", v4)
    || (-[_DASRuntimeLimiter staticDurationForActivity:](self, "staticDurationForActivity:", v4), v11 != -1.0))
  {
    if (!-[_DASRuntimeLimiter hasDynamicOverrides:](self, "hasDynamicOverrides:", v4)
      || (-[_DASRuntimeLimiter dynamicDurationForActivity:](self, "dynamicDurationForActivity:", v4), v14 != -1.0))
    {
      v15 = 1;
      goto LABEL_16;
    }
    v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimits")));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v17 = 138412290;
    v18 = v4;
    v13 = "Unlimited runtime due to dynamic overrides: %@";
    goto LABEL_13;
  }
  v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimits")));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    v13 = "Unlimited runtime due to static overrides: %@";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
  }
LABEL_14:

LABEL_15:
  v15 = 0;
LABEL_16:

  return v15;
}

- (BOOL)featureDurationLimitAppliesToActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "featureCodes"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "featureCodes"));
      v7 = objc_msgSend(v6, "count") != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)featureHasRunTime:(id)a3
{
  double v3;

  -[_DASRuntimeLimiter remainingDurationForFeature:](self, "remainingDurationForFeature:", a3);
  return v3 > 0.0;
}

- (BOOL)featureHasNoRemainingRuntimeForActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22;
  _DASRuntimeLimiter *v23;
  id v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  unsigned int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v22 = v4;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes"));
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v9)
      {
        v10 = v9;
        v26 = *(_QWORD *)v28;
        LOBYTE(v8) = 1;
        v23 = self;
        do
        {
          v11 = 0;
          v24 = v10;
          do
          {
            if (*(_QWORD *)v28 != v26)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
            v13 = -[_DASRuntimeLimiter featureHasRunTime:](self, "featureHasRunTime:", v12);
            v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("featureDurationTracker")));
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = objc_msgSend(v12, "intValue");
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFeatureDurationTracker sharedInstance](_DASFeatureDurationTracker, "sharedInstance"));
              objc_msgSend(v16, "durationForFeature:", v12);
              v18 = v17;
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFeatureDurationTracker sharedInstance](_DASFeatureDurationTracker, "sharedInstance"));
              objc_msgSend(v19, "maximumDurationForFeature:", v12);
              *(_DWORD *)buf = 67109632;
              v32 = v15;
              self = v23;
              v33 = 2048;
              v34 = v18;
              v35 = 2048;
              v36 = v20;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Feature code %d has utilized %f < %f", buf, 0x1Cu);

              v10 = v24;
            }
            LOBYTE(v8) = (v13 ^ 1) & v8;

            v11 = (char *)v11 + 1;
          }
          while (v10 != v11);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        }
        while (v10);
      }
      else
      {
        LOBYTE(v8) = 1;
      }

      v4 = v22;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (id)exhaustedRuntimeFeatureCodesAssociatedWithActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (!-[_DASRuntimeLimiter featureHasRunTime:](self, "featureHasRunTime:", v15))
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
      v16 = v9;
    else
      v16 = 0;
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (double)remainingDurationForFeature:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFeatureDurationTracker sharedInstance](_DASFeatureDurationTracker, "sharedInstance"));
  objc_msgSend(v4, "maximumDurationForFeature:", v3);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFeatureDurationTracker sharedInstance](_DASFeatureDurationTracker, "sharedInstance"));
  objc_msgSend(v7, "durationForFeature:", v3);
  v9 = v8;

  v10 = v6 - v9;
  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v3;
    v15 = 2048;
    v16 = v9;
    v17 = 2048;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Feature %@ has consumed %.1fs, remaining run time budget %.1fs", (uint8_t *)&v13, 0x20u);
  }

  return v10;
}

- (double)maximumRemainingFeatureDurationForActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "featureCodes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[_DASRuntimeLimiter remainingDurationForFeature:](self, "remainingDurationForFeature:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
        if (v10 > v8)
          v8 = v10;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)shouldLimitActivityAtRuntime:(id)a3 withStartDate:(id)a4 atDate:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  NSObject *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  NSString *v35;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suspendRequestDate"));

  v15 = 0;
  if (v11 && !v14)
  {
    if (!-[_DASRuntimeLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v10))
      goto LABEL_10;
    if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v10)
      && +[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:](_DASPhotosPolicy, "isPhotosSyncOverriddenWithContext:", v13))
    {
      v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Runtime limit doesn't apply because User initiated Sync Now %{public}@", buf, 0xCu);
      }
      v15 = 0;
      goto LABEL_23;
    }
    -[_DASRuntimeLimiter maximumRuntimeForActivity:](self, "maximumRuntimeForActivity:", v10);
    v18 = v17;
    objc_msgSend(v12, "timeIntervalSinceDate:", v11);
    v20 = v19;
    if (v18 == -1.0)
      goto LABEL_10;
    if (v18 == 0.0)
    {
      -[_DASRuntimeLimiter defaultRuntimeForActivity:](self, "defaultRuntimeForActivity:", v10);
      v18 = v21;
    }
    if (v20 >= v18)
    {
      v29 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
      v30 = v20 / 60.0;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
        v32 = v18 / 60.0;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
        *(_DWORD *)buf = 138543874;
        v38 = v10;
        v39 = 2114;
        v40 = v31;
        v41 = 2112;
        v42 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ should suspend, running for %{public}@ mins > max (activity) limit %@", buf, 0x20u);

      }
      else
      {
        v32 = v18 / 60.0;
      }

      v34 = kDASRuntimeLimitationName;
      v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exceed Activity Runtime %f mins > %f mins"), *(_QWORD *)&v30, *(_QWORD *)&v32);
    }
    else
    {
      if (!-[_DASRuntimeLimiter featureDurationLimitAppliesToActivity:](self, "featureDurationLimitAppliesToActivity:", v10)|| (-[_DASRuntimeLimiter maximumRemainingFeatureDurationForActivity:](self, "maximumRemainingFeatureDurationForActivity:", v10), v20 < v22))
      {
LABEL_10:
        v15 = 0;
        goto LABEL_24;
      }
      v23 = v22;
      v24 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
      v25 = v20 / 60.0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
        v27 = v23 / 60.0;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
        *(_DWORD *)buf = 138543874;
        v38 = v10;
        v39 = 2114;
        v40 = v26;
        v41 = 2112;
        v42 = v28;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ should suspend, running for %{public}@ mins (remaining feature runtime limit %@) mins", buf, 0x20u);

      }
      else
      {
        v27 = v23 / 60.0;
      }

      v34 = kDASRuntimeLimitationName;
      v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exceed Feature Runtime %f mins > %f mins"), *(_QWORD *)&v25, *(_QWORD *)&v27);
    }
    v16 = objc_claimAutoreleasedReturnValue(v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:](_DASLimiterResponse, "limitResponseWithDecision:withLimiter:validityDuration:rationale:", 3, v34, v16, 600.0));
LABEL_23:

  }
LABEL_24:

  return v15;
}

- (void)loadTrialParameters
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  uint64_t defaultRuntime;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t leniencyRuntime;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t limitedRuntime;
  int v18;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("runtimeDefaultLimit")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  self->_defaultRuntime = v5;
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    defaultRuntime = (uint64_t)self->_defaultRuntime;
    v18 = 134217984;
    v19 = defaultRuntime;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trial: runtimeDefaultLimit %ld", (uint8_t *)&v18, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("runtimeLenientLimit")));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  self->_leniencyRuntime = v10;
  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    leniencyRuntime = (uint64_t)self->_leniencyRuntime;
    v18 = 134217984;
    v19 = leniencyRuntime;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: runtimeLenientLimit %ld", (uint8_t *)&v18, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("runtimeLimitedLimit")));
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  self->_limitedRuntime = v15;
  v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    limitedRuntime = (uint64_t)self->_limitedRuntime;
    v18 = 134217984;
    v19 = limitedRuntime;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Trial: runtimeLimitedLimit %ld", (uint8_t *)&v18, 0xCu);
  }

}

- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("COREOS_DAS")))
    -[_DASRuntimeLimiter loadTrialParameters](self, "loadTrialParameters");
}

- (void)resetOnlyPreemptiveSuspend
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  _DWORD v6[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("isPreemptiveSuspendOnly")));
  v4 = objc_msgSend(v3, "BOOLeanValue");

  self->_onlyPreemptiveSuspend = v4;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trial: isPreemptiveSuspendOnly %d", (uint8_t *)v6, 8u);
  }

}

- (BOOL)deleteLimitForActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  int v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_testingOverride, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_testingOverride, "removeObjectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      v7 = "Removing override for %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      v7 = "Failed to remove override for %@";
      goto LABEL_6;
    }
  }

  return v5 != 0;
}

- (BOOL)setLimit:(double)a3 forActivity:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *testingOverride;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v6 = a4;
  if (!self->_testingOverride)
  {
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    testingOverride = self->_testingOverride;
    self->_testingOverride = v7;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_testingOverride, "setObject:forKeyedSubscript:", v9, v6);

  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set limit %@ seconds for %@", (uint8_t *)&v13, 0x16u);

  }
  return 1;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (-[_DASRuntimeLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suspendRequestDate"));

      if (v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_1000DFABC();
      }
      else
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        if (v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_testingOverride, "objectForKeyedSubscript:", v10));

          if (v12)
          {
            v11 = objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter testingOverride](self, "testingOverride"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v10));

            LODWORD(v11) = objc_msgSend(v13, "intValue");
            if (!(_DWORD)v11)
              goto LABEL_17;
          }
        }
        if (+[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 3, v7))
        {
          +[_DASLimiterResponse updateActivity:withLimitResponse:](_DASLimiterResponse, "updateActivity:withLimitResponse:", v6, v7);
          v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_1000DFA5C();

          LOBYTE(v11) = 1;
          goto LABEL_17;
        }
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000DF9FC();
    }
    LOBYTE(v11) = 0;
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v11) = 0;
LABEL_18:

  return (char)v11;
}

- (BOOL)onlyPreemptiveSuspend
{
  return self->_onlyPreemptiveSuspend;
}

- (void)setOnlyPreemptiveSuspend:(BOOL)a3
{
  self->_onlyPreemptiveSuspend = a3;
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
  objc_storeStrong((id *)&self->_limitationName, a3);
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (double)defaultRuntime
{
  return self->_defaultRuntime;
}

- (void)setDefaultRuntime:(double)a3
{
  self->_defaultRuntime = a3;
}

- (double)leniencyRuntime
{
  return self->_leniencyRuntime;
}

- (void)setLeniencyRuntime:(double)a3
{
  self->_leniencyRuntime = a3;
}

- (double)limitedRuntime
{
  return self->_limitedRuntime;
}

- (void)setLimitedRuntime:(double)a3
{
  self->_limitedRuntime = a3;
}

- (NSString)trialTreatmentID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTrialTreatmentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)trialExperimentID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTrialExperimentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSDictionary)customDurations
{
  return self->_customDurations;
}

- (void)setCustomDurations:(id)a3
{
  objc_storeStrong((id *)&self->_customDurations, a3);
}

- (NSMutableDictionary)testingOverride
{
  return self->_testingOverride;
}

- (void)setTestingOverride:(id)a3
{
  objc_storeStrong((id *)&self->_testingOverride, a3);
}

- (NSMutableDictionary)featureRuntimeLimits
{
  return self->_featureRuntimeLimits;
}

- (void)setFeatureRuntimeLimits:(id)a3
{
  objc_storeStrong((id *)&self->_featureRuntimeLimits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureRuntimeLimits, 0);
  objc_storeStrong((id *)&self->_testingOverride, 0);
  objc_storeStrong((id *)&self->_customDurations, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_limitationName, 0);
}

@end
