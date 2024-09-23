@implementation MOEventRefreshHelper

- (MOEventRefreshHelper)initWithUniverse:(id)a3
{
  id v5;
  MOEventRefreshHelper *v6;
  MOEventRefreshHelper *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  MOConfigurationManager *configurationManager;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  MODefaultsManager *defaultsManager;
  MOEventRefreshHelper *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MOEventRefreshHelper;
  v6 = -[MOEventRefreshHelper init](&v22, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_universe, a3);
    v9 = (objc_class *)objc_opt_class(MOConfigurationManager, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v11));
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v12;

    v15 = (objc_class *)objc_opt_class(MODefaultsManager, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v17));
    defaultsManager = v7->_defaultsManager;
    v7->_defaultsManager = (MODefaultsManager *)v18;

    v20 = v7;
  }

  return v7;
}

- (void)getCollectDatesForVariant:(unint64_t)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  MOConfigurationManager *configurationManager;
  const __CFString *v13;
  float v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id os_log;
  NSObject *v22;
  void *v24;
  id v25;
  NSObject *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshHelper defaultsManager](self, "defaultsManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("EventRefreshSchedulerLastSuccessfulTrigger")));

  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if (a3 != 256)
    {
      v11 = 0;
      if (a3 != 336)
        goto LABEL_18;
    }
    goto LABEL_10;
  }
  if (a3 == 1280)
  {
    configurationManager = self->_configurationManager;
    v13 = CFSTR("EventManagerOverrideRefreshMinimumLookBackWindowFull");
    goto LABEL_12;
  }
  if (a3 == 768)
  {
LABEL_10:
    configurationManager = self->_configurationManager;
    v13 = CFSTR("EventManagerOverrideRefreshMinimumLookBackWindowDefault");
LABEL_12:
    LODWORD(v9) = 1242802176;
    goto LABEL_13;
  }
  v11 = 0;
  if (a3 != 512)
    goto LABEL_18;
  configurationManager = self->_configurationManager;
  v13 = CFSTR("EventManagerOverrideRefreshMinimumLookBackWindowLight");
  LODWORD(v9) = 1216159744;
LABEL_13:
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v13, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, (float)-v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, 0.0));

  if (v10)
    v16 = v11 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startOfDayForDate:", v10));

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      v27 = 138412802;
      v28 = v20;
      v29 = 2112;
      v30 = v11;
      v31 = 2112;
      v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "inferred collect adjusted start date (%@) and end date (%@) with variant (%@)", (uint8_t *)&v27, 0x20u);

    }
    if (objc_msgSend(v20, "isAfterDate:", v11))
    {
      v25 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[MOEventRefreshHelper getCollectDatesForVariant:withHandler:].cold.2();

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t, void *, void *))v6 + 2))(v6, 1, v20, v11);
    }

    goto LABEL_29;
  }
LABEL_18:
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    -[MOEventRefreshHelper getCollectDatesForVariant:withHandler:].cold.1(a3);

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
LABEL_29:

}

- (void)getBundlingDatesForVariant:(unint64_t)a3 withHandler:(id)a4
{
  void (**v6)(id, uint64_t, void *, void *);
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  MOConfigurationManager *configurationManager;
  const __CFString *v13;
  float v14;
  void *v15;
  BOOL v16;
  id os_log;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v22;
  id v23;
  NSObject *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;

  v6 = (void (**)(id, uint64_t, void *, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshHelper defaultsManager](self, "defaultsManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("EventRefreshSchedulerLastSuccessfulTrigger")));

  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if (a3 != 256)
    {
      v11 = 0;
      if (a3 != 336)
        goto LABEL_17;
    }
LABEL_10:
    configurationManager = self->_configurationManager;
    v13 = CFSTR("EventBundleManagerOverrideRefreshMinimumLookBackWindowDefault");
    LODWORD(v9) = *(_DWORD *)"";
    goto LABEL_12;
  }
  if (a3 != 1280)
  {
    if (a3 != 768)
    {
      v11 = 0;
      if (a3 == 512)
      {
        configurationManager = self->_configurationManager;
        v13 = CFSTR("EventBundleManagerOverrideRefreshMinimumLookBackWindowLight");
        LODWORD(v9) = 1216159744;
        goto LABEL_12;
      }
LABEL_17:
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
      v18 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[MOEventRefreshHelper getBundlingDatesForVariant:withHandler:].cold.1(a3);

      goto LABEL_26;
    }
    goto LABEL_10;
  }
  configurationManager = self->_configurationManager;
  v13 = CFSTR("EventBundleManagerOverrideRefreshMinimumLookBackWindowFull");
  LODWORD(v9) = 1242802176;
LABEL_12:
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v13, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, (float)-v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, 0.0));

  if (v10)
    v16 = v11 == 0;
  else
    v16 = 1;
  if (v16)
    goto LABEL_17;
  v19 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v25 = 138412802;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "inferred bundling start date (%@) and end date (%@) with variant (%@)", (uint8_t *)&v25, 0x20u);

  }
  if (!objc_msgSend(v10, "isAfterDate:", v11))
  {
    v6[2](v6, 1, v10, v11);
    goto LABEL_28;
  }
  v23 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    -[MOEventRefreshHelper getBundlingDatesForVariant:withHandler:].cold.2();

LABEL_26:
  v6[2](v6, 0, 0, 0);
LABEL_28:

}

- (void)getPatternDetectorDatesForVariant:(unint64_t)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  MOConfigurationManager *configurationManager;
  const __CFString *v13;
  float v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id os_log;
  NSObject *v22;
  void *v24;
  id v25;
  NSObject *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshHelper defaultsManager](self, "defaultsManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("EventRefreshSchedulerLastSuccessfulTrigger")));

  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if (a3 != 256)
    {
      v11 = 0;
      if (a3 != 336)
        goto LABEL_18;
    }
    goto LABEL_10;
  }
  if (a3 == 1280)
  {
    configurationManager = self->_configurationManager;
    v13 = CFSTR("PatternDetectorRefreshMinimumLookBackWindowFull");
    goto LABEL_12;
  }
  if (a3 == 768)
  {
LABEL_10:
    configurationManager = self->_configurationManager;
    v13 = CFSTR("PatternDetectorRefreshMinimumLookBackWindowDefault");
LABEL_12:
    LODWORD(v9) = 1242802176;
    goto LABEL_13;
  }
  v11 = 0;
  if (a3 != 512)
    goto LABEL_18;
  configurationManager = self->_configurationManager;
  v13 = CFSTR("PatternDetectorRefreshMinimumLookBackWindowLight");
  LODWORD(v9) = 1216159744;
LABEL_13:
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v13, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, (float)-v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, 0.0));

  if (v10)
    v16 = v11 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startOfDayForDate:", v10));

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      v27 = 138412802;
      v28 = v20;
      v29 = 2112;
      v30 = v11;
      v31 = 2112;
      v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "inferred pattern detection adjusted date (%@) and end date (%@) with variant (%@)", (uint8_t *)&v27, 0x20u);

    }
    if (objc_msgSend(v20, "isAfterDate:", v11))
    {
      v25 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[MOEventRefreshHelper getPatternDetectorDatesForVariant:withHandler:].cold.2();

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t, void *, void *))v6 + 2))(v6, 1, v20, v11);
    }

    goto LABEL_29;
  }
LABEL_18:
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    -[MOEventRefreshHelper getPatternDetectorDatesForVariant:withHandler:].cold.1(a3);

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
LABEL_29:

}

- (MODaemonUniverse)universe
{
  return self->_universe;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
}

- (void)getCollectDatesForVariant:(uint64_t)a1 withHandler:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "unable to determine start and end date for collect (with variant %@)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5();
}

- (void)getCollectDatesForVariant:withHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_13((void *)&_mh_execute_header, v0, v1, "incorrect collect state: adjusted start date (%@) is after end date (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)getBundlingDatesForVariant:(uint64_t)a1 withHandler:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "unable to determine start and end date for bundling (with variant %@)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5();
}

- (void)getBundlingDatesForVariant:withHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_13((void *)&_mh_execute_header, v0, v1, "incorrect bundling state: start date (%@) is after end date (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)getPatternDetectorDatesForVariant:(uint64_t)a1 withHandler:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "unable to determine start and end date for pattern detection (with variant %@)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5();
}

- (void)getPatternDetectorDatesForVariant:withHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_13((void *)&_mh_execute_header, v0, v1, "incorrect pattern detection state: adjusted start date (%@) is after end date (%@)");
  OUTLINED_FUNCTION_1();
}

@end
