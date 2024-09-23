@implementation MOConfigurationManagerBase

- (MOConfigurationManagerBase)init
{
  MODefaultsManager *v3;
  MOConfigurationManagerBase *v4;

  v3 = -[MODefaultsManager initWithSuiteName:]([MODefaultsManager alloc], "initWithSuiteName:", CFSTR("com.apple.momentsd"));
  v4 = -[MOConfigurationManagerBase initWithDefaultsManager:enableTrialClient:](self, "initWithDefaultsManager:enableTrialClient:", v3, 1);

  return v4;
}

- (MOConfigurationManagerBase)initWithDefaultsManager:(id)a3 enableTrialClient:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  MOConfigurationManagerBase *v7;
  MOConfigurationManagerBase *v8;
  TRIClient *trialClient;
  NSArray *trialFactorNames;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOConfigurationManagerBase;
  v7 = -[MOConfigurationManagerBase init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    -[MOConfigurationManagerBase setFDefaultsManager:](v7, "setFDefaultsManager:", v6);
    if (v4)
    {
      trialClient = v8->_trialClient;
      v8->_trialClient = 0;

      trialFactorNames = v8->_trialFactorNames;
      v8->_trialFactorNames = 0;

      -[MOConfigurationManagerBase doTrialSetup](v8, "doTrialSetup");
    }
  }

  return v8;
}

- (id)getStringDefaultsForKey:(id)a3 withFallback:(id)a4
{
  id v6;
  id v7;
  id v8;
  MODefaultsManager *fDefaultsManager;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id os_log;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "copy");
  fDefaultsManager = self->_fDefaultsManager;
  v10 = objc_msgSend(v6, "copy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](fDefaultsManager, "objectForKey:", v10));

  if (v11)
  {
    v13 = objc_opt_class(NSString, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    {
      v14 = objc_msgSend(v11, "copy");

      v8 = v14;
    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v16 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412802;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v18, 0x20u);
  }

  return v8;
}

- (int)getIntegerDefaultsForKey:(id)a3 withFallback:(int)a4
{
  id v6;
  MODefaultsManager *fDefaultsManager;
  id v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  id os_log;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  int v21;

  v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  v8 = objc_msgSend(v6, "copy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](fDefaultsManager, "objectForKey:", v8));

  v11 = a4;
  if (v9)
  {
    v12 = objc_opt_class(NSNumber, v10);
    v11 = a4;
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
      v11 = objc_msgSend(v9, "integerValue");
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412802;
    v17 = v6;
    v18 = 1024;
    v19 = v11;
    v20 = 1024;
    v21 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [i:%i] and fallback [i:%i]", (uint8_t *)&v16, 0x18u);
  }

  return v11;
}

- (BOOL)getBoolDefaultsForKey:(id)a3 withFallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  MODefaultsManager *fDefaultsManager;
  id v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  id os_log;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  _BOOL4 v21;

  v4 = a4;
  v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  v8 = objc_msgSend(v6, "copy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](fDefaultsManager, "objectForKey:", v8));

  v11 = v4;
  if (v9)
  {
    v12 = objc_opt_class(NSNumber, v10);
    v11 = v4;
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
      v11 = objc_msgSend(v9, "BOOLValue");
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412802;
    v17 = v6;
    v18 = 1024;
    v19 = v11;
    v20 = 1024;
    v21 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [b:%i] and fallback [b:%i]", (uint8_t *)&v16, 0x18u);
  }

  return v11;
}

- (float)getFloatDefaultsForKey:(id)a3 withFallback:(float)a4
{
  id v6;
  MODefaultsManager *fDefaultsManager;
  id v8;
  void *v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  double v13;
  id os_log;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;

  v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  v8 = objc_msgSend(v6, "copy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](fDefaultsManager, "objectForKey:", v8));

  v11 = a4;
  if (v9)
  {
    v12 = objc_opt_class(NSNumber, v10);
    v11 = a4;
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v13;
    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412802;
    v18 = v6;
    v19 = 2048;
    v20 = v11;
    v21 = 2048;
    v22 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [f:%f] and fallback [f:%f]", (uint8_t *)&v17, 0x20u);
  }

  return v11;
}

- (double)getDoubleDefaultsForKey:(id)a3 withFallback:(double)a4
{
  id v6;
  MODefaultsManager *fDefaultsManager;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  id os_log;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;

  v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  v8 = objc_msgSend(v6, "copy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](fDefaultsManager, "objectForKey:", v8));

  v11 = a4;
  if (v9)
  {
    v12 = objc_opt_class(NSNumber, v10);
    v11 = a4;
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v13;
    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412802;
    v18 = v6;
    v19 = 2048;
    v20 = v11;
    v21 = 2048;
    v22 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [d:%f] and fallback [d:%f]", (uint8_t *)&v17, 0x20u);
  }

  return v11;
}

- (void)doTrialSetup
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Cached factor names: %@", (uint8_t *)&v3, 0xCu);
}

- (id)getStringTrialLevelForKey:(id)a3 withFallback:(id)a4
{
  id v6;
  id v7;
  id v8;
  TRIClient *trialClient;
  id v10;
  void *v11;
  uint64_t v12;
  id os_log;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "copy");
  if (-[NSArray containsObject:](self->_trialFactorNames, "containsObject:", v6))
  {
    trialClient = self->_trialClient;
    v10 = objc_msgSend(v6, "copy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", v10, CFSTR("MOMENTS_TRIAL")));

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));

      v8 = (id)v12;
    }

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412802;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v16, 0x20u);
  }

  return v8;
}

- (int)getIntegerTrialLevelForKey:(id)a3 withFallback:(int)a4
{
  id v6;
  unsigned int v7;
  TRIClient *trialClient;
  id v9;
  void *v10;
  id os_log;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;

  v6 = a3;
  v7 = a4;
  if (-[NSArray containsObject:](self->_trialFactorNames, "containsObject:", v6))
  {
    trialClient = self->_trialClient;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", v9, CFSTR("MOMENTS_TRIAL")));

    v7 = a4;
    if (v10)
    {
      v7 = a4;
      if (objc_msgSend(v10, "levelOneOfCase") == 13)
        v7 = objc_msgSend(v10, "longValue");
    }

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [i:%i] and fallback [i:%i]", (uint8_t *)&v14, 0x18u);
  }

  return v7;
}

- (BOOL)getBoolTrialLevelForKey:(id)a3 withFallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned int v7;
  TRIClient *trialClient;
  id v9;
  void *v10;
  unsigned int v11;
  id os_log;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  _BOOL4 v20;

  v4 = a4;
  v6 = a3;
  v7 = v4;
  if (-[NSArray containsObject:](self->_trialFactorNames, "containsObject:", v6))
  {
    trialClient = self->_trialClient;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", v9, CFSTR("MOMENTS_TRIAL")));

    v7 = v4;
    if (v10)
    {
      v11 = objc_msgSend(v10, "levelOneOfCase");
      if (v11 == 13)
      {
        v7 = objc_msgSend(v10, "longValue") != 0;
      }
      else
      {
        v7 = v4;
        if (v11 == 10)
          v7 = objc_msgSend(v10, "BOOLeanValue");
      }
    }

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412802;
    v16 = v6;
    v17 = 1024;
    v18 = v7;
    v19 = 1024;
    v20 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [b:%i] and fallback [b:%i]", (uint8_t *)&v15, 0x18u);
  }

  return v7;
}

- (float)getFloatTrialLevelForKey:(id)a3 withFallback:(float)a4
{
  id v6;
  float v7;
  TRIClient *trialClient;
  id v9;
  void *v10;
  double v11;
  id os_log;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;

  v6 = a3;
  v7 = a4;
  if (-[NSArray containsObject:](self->_trialFactorNames, "containsObject:", v6))
  {
    trialClient = self->_trialClient;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", v9, CFSTR("MOMENTS_TRIAL")));

    v7 = a4;
    if (v10)
    {
      v7 = a4;
      if (objc_msgSend(v10, "levelOneOfCase") == 15)
      {
        objc_msgSend(v10, "doubleValue");
        v7 = v11;
      }
    }

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412802;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [f:%f] and fallback [f:%f]", (uint8_t *)&v15, 0x20u);
  }

  return v7;
}

- (double)getDoubleTrialLevelForKey:(id)a3 withFallback:(double)a4
{
  id v6;
  double v7;
  TRIClient *trialClient;
  id v9;
  void *v10;
  double v11;
  id os_log;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;

  v6 = a3;
  v7 = a4;
  if (-[NSArray containsObject:](self->_trialFactorNames, "containsObject:", v6))
  {
    trialClient = self->_trialClient;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", v9, CFSTR("MOMENTS_TRIAL")));

    v7 = a4;
    if (v10)
    {
      v7 = a4;
      if (objc_msgSend(v10, "levelOneOfCase") == 15)
      {
        objc_msgSend(v10, "doubleValue");
        v7 = v11;
      }
    }

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412802;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [d:%f] and fallback [d:%f]", (uint8_t *)&v15, 0x20u);
  }

  return v7;
}

- (id)getTrialExperimentIdentifiers
{
  return -[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", CFSTR("MOMENTS_TRIAL"));
}

- (id)getStringSettingForKey:(id)a3 withFallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase getStringTrialLevelForKey:withFallback:](self, "getStringTrialLevelForKey:withFallback:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase getStringDefaultsForKey:withFallback:](self, "getStringDefaultsForKey:withFallback:", v6, v8));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (int)getIntegerSettingForKey:(id)a3 withFallback:(int)a4
{
  uint64_t v4;
  id v6;
  int v7;
  id os_log;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[MOConfigurationManagerBase getIntegerDefaultsForKey:withFallback:](self, "getIntegerDefaultsForKey:withFallback:", v6, -[MOConfigurationManagerBase getIntegerTrialLevelForKey:withFallback:](self, "getIntegerTrialLevelForKey:withFallback:", v6, v4));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    v15 = 1024;
    v16 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [i:%i] and fallback [i:%i]", (uint8_t *)&v11, 0x18u);
  }

  return v7;
}

- (BOOL)getBoolSettingForKey:(id)a3 withFallback:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  id os_log;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;

  v4 = a4;
  v6 = a3;
  v7 = -[MOConfigurationManagerBase getBoolDefaultsForKey:withFallback:](self, "getBoolDefaultsForKey:withFallback:", v6, -[MOConfigurationManagerBase getBoolTrialLevelForKey:withFallback:](self, "getBoolTrialLevelForKey:withFallback:", v6, v4));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    v15 = 1024;
    v16 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [b:%i] and fallback [b:%i]", (uint8_t *)&v11, 0x18u);
  }

  return v7;
}

- (float)getFloatSettingForKey:(id)a3 withFallback:(float)a4
{
  id v6;
  double v7;
  float v8;
  float v9;
  id os_log;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;

  v6 = a3;
  *(float *)&v7 = a4;
  -[MOConfigurationManagerBase getFloatTrialLevelForKey:withFallback:](self, "getFloatTrialLevelForKey:withFallback:", v6, v7);
  -[MOConfigurationManagerBase getFloatDefaultsForKey:withFallback:](self, "getFloatDefaultsForKey:withFallback:", v6);
  v9 = v8;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412802;
    v14 = v6;
    v15 = 2048;
    v16 = v9;
    v17 = 2048;
    v18 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [f:%f] and fallback [f:%f]", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (double)getDoubleSettingForKey:(id)a3 withFallback:(double)a4
{
  id v6;
  double v7;
  double v8;
  id os_log;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;

  v6 = a3;
  -[MOConfigurationManagerBase getDoubleTrialLevelForKey:withFallback:](self, "getDoubleTrialLevelForKey:withFallback:", v6, a4);
  -[MOConfigurationManagerBase getDoubleDefaultsForKey:withFallback:](self, "getDoubleDefaultsForKey:withFallback:", v6);
  v8 = v7;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412802;
    v13 = v6;
    v14 = 2048;
    v15 = v8;
    v16 = 2048;
    v17 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [d:%lf] and fallback [d:%lf]", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

- (MODefaultsManager)fDefaultsManager
{
  return (MODefaultsManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFDefaultsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fDefaultsManager, 0);
  objc_storeStrong((id *)&self->_trialFactorNames, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
