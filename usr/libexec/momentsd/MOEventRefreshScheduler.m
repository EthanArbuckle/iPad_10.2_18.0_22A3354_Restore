@implementation MOEventRefreshScheduler

- (MOEventRefreshScheduler)initWithUniverse:(id)a3
{
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  MOEventRefreshScheduler *v36;
  dispatch_queue_attr_t v37;
  NSObject *v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *queue;
  MODaemonSPINotifier *v41;
  MODaemonSPINotifier *notifier;
  void *v43;
  double v44;
  float v45;
  NSBackgroundActivityScheduler *defaultRefreshActivity;
  id os_log;
  NSObject *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  SEL v52;
  MOEventRefreshScheduler *v53;
  uint64_t v54;
  id v55;
  NSObject *v56;
  id obj;
  objc_super v59;

  v6 = a3;
  v8 = (objc_class *)objc_opt_class(MOConfigurationManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v10));

  v12 = (objc_class *)objc_opt_class(MODefaultsManager, v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v14));

  v17 = (objc_class *)objc_opt_class(MOEventManager, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v19));

  v22 = (objc_class *)objc_opt_class(MOEventBundleManager, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v24));

  v27 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, v26);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v29));

  v32 = (objc_class *)objc_opt_class(MONotificationsManager, v31);
  v33 = NSStringFromClass(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v34));

  if (!v20)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[MODaemonClient initWithUniverse:].cold.1();

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v50 = v49;
    v51 = CFSTR("Invalid parameter not satisfying: eventManager");
    v52 = a2;
    v53 = self;
    v54 = 86;
    goto LABEL_11;
  }
  if (!v25)
  {
    v55 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      -[MOEventRefreshScheduler initWithUniverse:].cold.2();

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v50 = v49;
    v51 = CFSTR("Invalid parameter not satisfying: eventBundleManager");
    v52 = a2;
    v53 = self;
    v54 = 87;
LABEL_11:
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", v52, v53, CFSTR("MOEventRefreshScheduler.m"), v54, v51);

    v36 = 0;
    goto LABEL_12;
  }
  v59.receiver = self;
  v59.super_class = (Class)MOEventRefreshScheduler;
  v36 = -[MOEventRefreshScheduler init](&v59, "init");
  if (!v36)
  {
LABEL_12:
    v43 = obj;
    goto LABEL_13;
  }
  v37 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  v39 = dispatch_queue_create("MOEventRefreshScheduler", v38);
  queue = v36->_queue;
  v36->_queue = (OS_dispatch_queue *)v39;

  objc_storeStrong((id *)&v36->_universe, a3);
  v41 = -[MODaemonSPINotifier initWithName:]([MODaemonSPINotifier alloc], "initWithName:", CFSTR("MOEventRefreshScheduler"));
  notifier = v36->_notifier;
  v36->_notifier = v41;

  v43 = obj;
  objc_storeStrong((id *)&v36->_configurationManager, obj);
  objc_storeStrong((id *)&v36->_defaultsManager, v15);
  objc_storeStrong((id *)&v36->_eventManager, v20);
  objc_storeStrong((id *)&v36->_eventBundleManager, v25);
  objc_storeStrong((id *)&v36->_onboardingAndSettingsPersistence, v30);
  objc_storeStrong((id *)&v36->_notificationsManager, v35);
  LODWORD(v44) = 10.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v36->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("WatchdogOverrideDefaultCadenceInSeconds"), v44);
  v36->_watchdogCadence = v45;
  defaultRefreshActivity = v36->_defaultRefreshActivity;
  v36->_defaultRefreshActivity = 0;

  -[MOEventRefreshScheduler registerDefaultRefreshActivity](v36, "registerDefaultRefreshActivity");
  -[MOEventRefreshScheduler registerFirstRefreshActivity](v36, "registerFirstRefreshActivity");
  -[MOEventRefreshScheduler registerLightRefreshActivity](v36, "registerLightRefreshActivity");
LABEL_13:

  return v36;
}

- (void)registerDefaultRefreshActivity
{
  NSBackgroundActivityScheduler *v3;
  NSBackgroundActivityScheduler *defaultRefreshActivity;
  void *v5;
  unsigned int v6;
  id os_log;
  NSObject *v8;
  _BOOL4 v9;
  NSBackgroundActivityScheduler *v10;
  void ***v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  MOEventRefreshScheduler *v16;
  uint64_t v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  MOEventRefreshScheduler *v22;
  uint64_t v23;
  uint8_t buf[16];

  if (!self->_defaultRefreshActivity)
  {
    v3 = (NSBackgroundActivityScheduler *)objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", CFSTR("com.apple.momentsd.eventRefresh"));
    defaultRefreshActivity = self->_defaultRefreshActivity;
    self->_defaultRefreshActivity = v3;

    -[NSBackgroundActivityScheduler setPreregistered:](self->_defaultRefreshActivity, "setPreregistered:", 1);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  v6 = objc_msgSend(v5, "isAllowedToCollectAndCompute");

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Allowed to collect and compute, registering activity com.apple.momentsd.eventRefresh", buf, 2u);
    }

    v10 = self->_defaultRefreshActivity;
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke;
    v21 = &unk_1002B3030;
    LOBYTE(v23) = v6;
    v22 = self;
    v11 = &v18;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not allowed to collect and compute, registering empty activity handler for com.apple.momentsd.eventRefresh", buf, 2u);
    }

    v10 = self->_defaultRefreshActivity;
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_98;
    v15 = &unk_1002B3030;
    LOBYTE(v17) = 0;
    v16 = self;
    v11 = &v12;
  }
  -[NSBackgroundActivityScheduler scheduleWithBlock:](v10, "scheduleWithBlock:", v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id os_log;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  MOPerformanceMeasurement *v26;
  void *v27;
  id v28;
  NSObject *v29;
  MOPerformanceMeasurement *v30;
  NSObject *v31;
  _QWORD v32[5];
  MOPerformanceMeasurement *v33;
  void (**v34)(id, uint64_t);
  uint8_t *v35;
  uint8_t v36[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh completionHandler with isAllowedToCollectAndCompute=%i", buf, 8u);
  }

  *(_QWORD *)buf = 0;
  v45 = buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__23;
  v48 = __Block_byref_object_dispose__23;
  v49 = (id)os_transaction_create("com.apple.moments.refresh-scheduler.default", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "onboardingAndSettingsPersistence"));
  objc_msgSend(v8, "publishOnboardingStatusAnalytics");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("EventRefreshSchedulerLastAttemptTriggerDefault")));

  if (v11)
  {
    v13 = objc_opt_class(NSDate, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    {
      v14 = v11;

      v9 = v14;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "timeIntervalSinceDate:", v9);
  v17 = v16;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "interval");
  v19 = v18;
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
    *(_DWORD *)v36 = 138413058;
    v37 = v9;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v22;
    v42 = 2112;
    v43 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Interval stats since run of same activity: last attempt %@, now %@, interval %@, expected interval %@)", v36, 0x2Au);

  }
  if (v9 && v17 > 0.0 && v19 > 0.0 && v17 < v19 * 0.9)
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_cold_1();

    v3[2](v3, 1);
    v26 = (MOPerformanceMeasurement *)*((_QWORD *)v45 + 5);
    *((_QWORD *)v45 + 5) = 0;
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    objc_msgSend(v27, "setObject:forKey:", v15, CFSTR("EventRefreshSchedulerLastAttemptTriggerDefault"));

    v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)v36 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0x300uLL, "ScheduledRefreshRegularWrapper", ", v36, 2u);
    }

    v30 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshRegularWrapper"), 0);
    -[MOPerformanceMeasurement startSession](v30, "startSession");
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_90;
    v32[3] = &unk_1002B3008;
    v32[4] = *(_QWORD *)(a1 + 32);
    v34 = v3;
    v35 = buf;
    v33 = v30;
    v26 = v30;
    dispatch_async(v31, v32);

  }
  _Block_object_dispose(buf, 8);

}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_90(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_2;
  v5[3] = &unk_1002B2FE0;
  v5[4] = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "refreshWithRefreshVariant:andCompletion:", 768, v5);

}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refresh: All completed with error (%@)", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refresh: All completed!", (uint8_t *)&v14, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("EventRefreshSchedulerLastSuccessfulTrigger"));

    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v9, CFSTR("EventRefreshSchedulerLastSuccessfulTriggerDefault"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 0x300uLL, "ScheduledRefreshRegularWrapper", ", (uint8_t *)&v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_98(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id os_log;
  NSObject *v5;
  int v6;
  void *v7;
  _DWORD v8[2];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 40);
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh completionHandler with isAllowedToCollectAndCompute=%i", (uint8_t *)v8, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "onboardingAndSettingsPersistence"));
  objc_msgSend(v7, "publishOnboardingStatusAnalytics");

  v3[2](v3, 1);
}

- (void)registerFirstRefreshActivity
{
  -[MOEventRefreshScheduler registerFirstRefreshActivityWithPreRegisteredTask:](self, "registerFirstRefreshActivityWithPreRegisteredTask:", 1);
}

- (void)registerFirstRefreshActivityWithPreRegisteredTask:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  id os_log;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  __CFString *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  unsigned __int8 v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  _QWORD v39[5];
  char v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  uint8_t buf[4];
  const __CFString *v45;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  v6 = objc_msgSend(v5, "isAllowedToCollectAndCompute");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler configurationManager](self, "configurationManager"));
  v8 = objc_msgSend(v7, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideForceFullRefreshAtBoot"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler configurationManager](self, "configurationManager"));
  v10 = objc_msgSend(v9, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideAvoidFullRefreshAtBoot"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler configurationManager](self, "configurationManager"));
  v12 = objc_msgSend(v11, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideAllowFullRefreshAtBoot"), 1);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      v45 = CFSTR("com.apple.momentsd.eventRefresh.first");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not allowed to collect and compute, retiring activity %@", buf, 0xCu);
    }

    v19 = objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    -[NSObject deregisterTaskWithIdentifier:](v19, "deregisterTaskWithIdentifier:", CFSTR("com.apple.momentsd.eventRefresh.first"));
    goto LABEL_26;
  }
  if (v15)
  {
    *(_DWORD *)buf = 138412290;
    v45 = CFSTR("com.apple.momentsd.eventRefresh.first");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Allowed to collect and compute, registering activity %@", buf, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke;
  v39[3] = &unk_1002B30A8;
  v40 = v6;
  v41 = v12;
  v42 = v10;
  v43 = v8;
  v39[4] = self;
  v17 = objc_msgSend(v16, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.momentsd.eventRefresh.first"), 0, v39);

  if (!v3)
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = CFSTR("com.apple.momentsd.eventRefresh.first");
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Re-registering %@ activity with high priority", buf, 0xCu);
    }

    v19 = objc_msgSend(objc_alloc((Class)BGNonRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.momentsd.eventRefresh.first"));
    -[NSObject setRequiresNetworkConnectivity:](v19, "setRequiresNetworkConnectivity:", 0);
    -[NSObject setRequiresExternalPower:](v19, "setRequiresExternalPower:", 0);
    -[NSObject setRequiresProtectionClass:](v19, "setRequiresProtectionClass:", 2);
    -[NSObject setTrySchedulingBefore:](v19, "setTrySchedulingBefore:", 60.0);
    -[NSObject setPriority:](v19, "setPriority:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "taskRequestForIdentifier:", CFSTR("com.apple.momentsd.eventRefresh.first")));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v25 = v24;
    if (v23)
    {
      v38 = 0;
      v26 = objc_msgSend(v24, "updateTaskRequest:error:", v19, &v38);
      v27 = (__CFString *)v38;

      v28 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v30 = v29;
      if ((v26 & 1) == 0)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[MOEventRefreshScheduler registerFirstRefreshActivityWithPreRegisteredTask:].cold.2(v27, v30, v35);
        goto LABEL_25;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v31 = "Succeeded updating task";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
      }
    }
    else
    {
      v37 = 0;
      v32 = objc_msgSend(v24, "submitTaskRequest:error:", v19, &v37);
      v27 = (__CFString *)v37;

      v33 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      v30 = v34;
      if ((v32 & 1) == 0)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[MOEventRefreshScheduler registerFirstRefreshActivityWithPreRegisteredTask:].cold.1(v27, v30, v36);
        goto LABEL_25;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v31 = "Succeeded submitting task";
        goto LABEL_20;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if ((v17 & 1) != 0)
    return;
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = CFSTR("com.apple.momentsd.eventRefresh.first");
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Re-registering %@ activity failed", buf, 0xCu);
  }
LABEL_26:

}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  int v6;
  id v7;
  NSObject *v8;
  MOPerformanceMeasurement *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  double v18;
  float v19;
  float v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  unsigned __int8 v40;
  id v41;
  NSObject *v42;
  _BOOL4 v43;
  const char *v44;
  id v45;
  NSObject *v46;
  _QWORD block[5];
  id v48;
  MOPerformanceMeasurement *v49;
  _BYTE *v50;
  float v51;
  uint8_t v52[4];
  const __CFString *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = CFSTR("com.apple.momentsd.eventRefresh.first");
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ completionHandler with isAllowedToCollectAndCompute=%i", buf, 0x12u);
  }

  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0x500uLL, "ScheduledRefreshFirstWrapper", ", buf, 2u);
  }

  v9 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshFirstWrapper"), 0);
  -[MOPerformanceMeasurement startSession](v9, "startSession");
  if (+[MOPlatformInfo wasBuildVersionUpdated](MOPlatformInfo, "wasBuildVersionUpdated")
    && *(_BYTE *)(a1 + 41)
    && !*(_BYTE *)(a1 + 42)
    || *(_BYTE *)(a1 + 43))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v61 = __Block_byref_object_copy__23;
    v62 = __Block_byref_object_dispose__23;
    v63 = (id)os_transaction_create("com.apple.moments.refresh-scheduler.first", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("EventRefreshSchedulerLastAttemptTriggerFirst")));

    if (v13)
    {
      v15 = objc_opt_class(NSDate, v14);
      if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
      {
        v16 = v13;

        v11 = v16;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
    LODWORD(v18) = -1.0;
    objc_msgSend(v17, "getFloatSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideOnFailureRetryAfter"), v18);
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v21, "timeIntervalSinceDate:", v11);
    v23 = v22;
    if (v20 >= 0.0)
      v24 = v20;
    else
      v24 = 3600.0;
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
      *(_DWORD *)v52 = 138413058;
      v53 = v11;
      v54 = 2112;
      v55 = v21;
      v56 = 2112;
      v57 = v27;
      v58 = 2112;
      v59 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Interval stats since run of same activity: last attempt %@, now %@, interval %@, expected interval %@)", v52, 0x2Au);

    }
    if (v11 && v23 > 0.0 && v24 > 0.0 && v23 < v24 * 0.9)
    {
      v29 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_cold_1(v30, v31, v32);

      objc_msgSend(v3, "setTaskCompleted");
      v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

      v34 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_signpost_enabled(v35))
      {
        *(_WORD *)v52 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "ScheduledRefreshFirstWrapper", ", v52, 2u);
      }

      -[MOPerformanceMeasurement endSession](v9, "endSession");
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
      objc_msgSend(v36, "setObject:forKey:", v21, CFSTR("EventRefreshSchedulerLastAttemptTriggerFirst"));

      v37 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v52 = 138412290;
        v53 = CFSTR("com.apple.momentsd.eventRefresh.first");
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ detected build upgrade", v52, 0xCu);
      }

      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_116;
      block[3] = &unk_1002B3080;
      block[4] = *(_QWORD *)(a1 + 32);
      v51 = v20;
      v48 = v3;
      v50 = buf;
      v49 = v9;
      dispatch_async(v39, block);

      _Block_object_dispose(buf, 8);
    }
    goto LABEL_38;
  }
  v40 = +[MOPlatformInfo wasBuildVersionUpdated](MOPlatformInfo, "wasBuildVersionUpdated");
  v41 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
  if ((v40 & 1) != 0)
  {
    if (v43)
    {
      *(_WORD *)buf = 0;
      v44 = "Refresh.First: build upgrade was detected but overrides prevent this task to run, skipped!";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, v44, buf, 2u);
    }
  }
  else if (v43)
  {
    *(_WORD *)buf = 0;
    v44 = "Refresh.First: no build upgrade detected, skipped!";
    goto LABEL_34;
  }

  objc_msgSend(v3, "setTaskCompleted");
  v45 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "ScheduledRefreshFirstWrapper", ", buf, 2u);
  }

  -[MOPerformanceMeasurement endSession](v9, "endSession");
LABEL_38:

}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_116(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;
  int v11;
  uint8_t buf[4];
  const __CFString *v13;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = CFSTR("com.apple.momentsd.eventRefresh.first");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ detected build upgrade, triggering full refresh", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_117;
  v7[3] = &unk_1002B3058;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v11 = *(_DWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v10 = v6;
  objc_msgSend(v8, "refreshWithRefreshVariant:andCompletion:", 1280, v7);

}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  id os_log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v3 = a2;
  if (!v3)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Refresh.First: All completed!", (uint8_t *)&v20, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("EventRefreshSchedulerLastSuccessfulTrigger"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("EventRefreshSchedulerLastSuccessfulTriggerFirst"));

    +[MOPlatformInfo persistBuildVersion](MOPlatformInfo, "persistBuildVersion");
    goto LABEL_9;
  }
  v4 = *(float *)(a1 + 64);
  v5 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 < 0.0)
  {
    if (v7)
    {
      v20 = 138412290;
      v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Refresh.First: Giving up with error (%@)", (uint8_t *)&v20, 0xCu);
    }

LABEL_9:
    objc_msgSend(*(id *)(a1 + 40), "setTaskCompleted");
    goto LABEL_13;
  }
  if (v7)
  {
    LODWORD(v8) = *(_DWORD *)(a1 + 64);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
    v20 = 138412546;
    v21 = v15;
    v22 = 2112;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Refresh.First: Deferred to %@ seconds later with error (%@)", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setTaskExpiredWithRetryAfter:error:", 0, *(float *)(a1 + 64));
LABEL_13:
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

  v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "ScheduledRefreshFirstWrapper", ", (uint8_t *)&v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

- (void)registerLightRefreshActivity
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  id os_log;
  const char *v14;
  _QWORD v15[5];
  char v16;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  v4 = objc_msgSend(v3, "isAllowedToCollectAndCompute");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler configurationManager](self, "configurationManager"));
  v6 = objc_msgSend(v5, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideForceLightRefresh"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler configurationManager](self, "configurationManager"));
  v8 = objc_msgSend(v7, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideAvoidLightRefresh"), 0);

  if (!v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "Not allowed to collect and compute, discarding activity com.apple.momentsd.eventRefresh.light";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_11:

    xpc_activity_unregister("com.apple.momentsd.eventRefresh.light");
    return;
  }
  v9 = v8 ^ 1 | v6;
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9 != 1)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      v14 = "Alowed to collect and compute, yet internal configuration requirements are not met, discarding activity com."
            "apple.momentsd.eventRefresh.light";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Allowed to collect and compute, registering activity com.apple.momentsd.eventRefresh.light", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke;
  v15[3] = &unk_1002B3120;
  v15[4] = self;
  v16 = v4;
  xpc_activity_register("com.apple.momentsd.eventRefresh.light", XPC_ACTIVITY_CHECK_IN, v15);
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  uint64_t v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  xpc_object_t v14;
  void *v15;
  int64_t int64;
  id os_log;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSNumber *v25;
  void *v26;
  void *v27;
  double v28;
  float v29;
  void *v30;
  double v31;
  float v32;
  void *v33;
  xpc_activity_state_t state;
  id v35;
  NSObject *v36;
  int v37;
  id v38;
  NSObject *v39;
  MOPerformanceMeasurement *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  _xpc_activity_s *v44;
  MOPerformanceMeasurement *v45;
  id v46;
  NSObject *v47;
  xpc_activity_state_t v48;
  void *v49;
  id v50;
  NSNumber *v51;
  void *v52;
  void **v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  uint64_t v57;
  _xpc_activity_s *v58;
  MOPerformanceMeasurement *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t buf[4];
  _BYTE v68[10];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;

  v3 = a2;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__23;
  v65 = __Block_byref_object_dispose__23;
  v66 = (id)os_transaction_create("com.apple.moments.refresh-scheduler.light", v4);
  if (xpc_activity_get_state(v3))
  {
    v5 = (xpc_object_t)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("EventRefreshSchedulerLastAttemptTriggerLight")));

    if (v7)
    {
      v9 = objc_opt_class(NSDate, v8);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        v10 = v7;

        v5 = v10;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v11, "timeIntervalSinceDate:", v5);
    v13 = v12;
    v14 = xpc_activity_copy_criteria(v3);
    v15 = v14;
    if (!v14)
      __assert_rtn("-[MOEventRefreshScheduler registerLightRefreshActivity]_block_invoke", "MOEventRefreshScheduler.m", 326, "criteria");
    int64 = xpc_dictionary_get_int64(v14, XPC_ACTIVITY_INTERVAL);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v18 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)int64));
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v68 = v5;
      *(_WORD *)&v68[8] = 2112;
      v69 = v11;
      v70 = 2112;
      v71 = v19;
      v72 = 2112;
      v73 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Interval stats since run of same activity: last attempt %@, now %@, interval %@, expected interval %@)", buf, 0x2Au);

    }
    if (v5 && v13 > 0.0 && int64 >= 1 && v13 < (double)int64 * 0.9)
    {
      v21 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_2();

      if (xpc_activity_set_state(v3, 5))
        goto LABEL_37;
      v23 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", xpc_activity_get_state(v3));
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_1(v26, (uint64_t)buf, v24);
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
      objc_msgSend(v33, "setObject:forKey:", v11, CFSTR("EventRefreshSchedulerLastAttemptTriggerLight"));

      state = xpc_activity_get_state(v3);
      v35 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v68 = state;
        *(_WORD *)&v68[4] = 1024;
        *(_DWORD *)&v68[6] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh.light completionHandler with state=%i, isAllowedToCollectAndCompute=%i", buf, 0xEu);
      }

      if (state == 2)
      {
        v38 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, 0x200uLL, "ScheduledRefreshLightWrapper", ", buf, 2u);
        }

        v40 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshLightWrapper"), 0);
        -[MOPerformanceMeasurement startSession](v40, "startSession");
        v41 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh.light Triggering light refresh", buf, 2u);
        }

        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
        v53 = _NSConcreteStackBlock;
        v54 = 3221225472;
        v55 = __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_140;
        v56 = &unk_1002B30F8;
        v57 = *(_QWORD *)(a1 + 32);
        v44 = v3;
        v58 = v44;
        v60 = &v61;
        v45 = v40;
        v59 = v45;
        dispatch_async(v43, &v53);

        if (xpc_activity_get_state(v44) == 2 && !xpc_activity_set_state(v44, 4))
        {
          v46 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v48 = xpc_activity_get_state(v44);
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v48, v53, v54, v55, v56, v57, v58));
            __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_3(v49, (uint64_t)buf, v47);
          }

        }
        goto LABEL_38;
      }
      if (xpc_activity_set_state(v3, 5))
      {
LABEL_37:
        v45 = (MOPerformanceMeasurement *)v62[5];
        v62[5] = 0;
LABEL_38:

        goto LABEL_39;
      }
      v50 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v24 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v51 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", xpc_activity_get_state(v3));
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_1(v52, (uint64_t)buf, v24);
      }
    }

    goto LABEL_37;
  }
  v5 = xpc_activity_copy_criteria(v3);
  if (!v5)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
    LODWORD(v28) = 1163984896;
    objc_msgSend(v27, "getFloatSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideLightRefreshInterval"), v28);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, (uint64_t)v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
    LODWORD(v31) = 1150681088;
    objc_msgSend(v30, "getFloatSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideLightRefreshGracePeriod"), v31);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)v32);

    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_activity_set_criteria(v3, v5);
  }
LABEL_39:

  _Block_object_dispose(&v61, 8);
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_140(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_2;
  v5[3] = &unk_1002B30D0;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v8 = v4;
  objc_msgSend(v6, "refreshWithRefreshVariant:andCompletion:", 512, v5);

}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  float v6;
  float v7;
  id os_log;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  NSNumber *v13;
  void *v14;
  const char *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSNumber *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  int v29;
  id v30;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
    LODWORD(v5) = -1.0;
    objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideOnFailureRetryAfter"), v5);
    v7 = v6;

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7 >= 0.0)
    {
      if (v10)
      {
        v29 = 138412290;
        v30 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Refresh.Light: Deferred with error (%@)", (uint8_t *)&v29, 0xCu);
      }

      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
      {
        v23 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
        v12 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v24 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40)));
          v14 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v29 = 138412290;
          v30 = v14;
          v15 = "com.apple.momentsd.eventRefresh.light Failed to mark activity as Deferred. Current state is %@";
          goto LABEL_18;
        }
        goto LABEL_19;
      }
    }
    else
    {
      if (v10)
      {
        v29 = 138412290;
        v30 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Refresh.Light: Giving up with error (%@)", (uint8_t *)&v29, 0xCu);
      }

      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
      {
        v11 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
LABEL_7:
          v13 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40)));
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v29 = 138412290;
          v30 = v14;
          v15 = "com.apple.momentsd.eventRefresh.light Failed to mark activity as Done. Current state is %@";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v29, 0xCu);

        }
LABEL_19:

      }
    }
  }
  else
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Refresh.Light: All completed!", (uint8_t *)&v29, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("EventRefreshSchedulerLastSuccessfulTrigger"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("EventRefreshSchedulerLastSuccessfulTriggerLight"));

    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
    {
      v22 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      v12 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_7;
      goto LABEL_19;
    }
  }
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = 0;

  v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_signpost_enabled(v28))
  {
    LOWORD(v29) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0x200uLL, "ScheduledRefreshLightWrapper", ", (uint8_t *)&v29, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

- (void)refreshWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  NSObject *v11;
  MOPerformanceMeasurement *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  MOPerformanceMeasurement *v29;
  _QWORD *v30;
  void (**v31)(id, NSObject *);
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD v42[5];
  id v43;
  _QWORD *v44;
  unint64_t v45;
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD *v49;
  unint64_t v50;
  _QWORD v51[5];
  id v52;
  _QWORD *v53;
  unint64_t v54;
  _QWORD v55[5];
  id v56;
  unint64_t v57;
  _QWORD v58[5];
  id v59;
  MOPerformanceMeasurement *v60;
  void (**v61)(id, NSObject *);
  _QWORD *v62;
  unint64_t v63;
  _QWORD v64[5];
  id v65;
  NSErrorUserInfoKey v66;
  const __CFString *v67;
  uint8_t buf[4];
  unint64_t v69;

  v6 = a4;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__23;
  v64[4] = __Block_byref_object_dispose__23;
  v65 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler universe](self, "universe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getService:", CFSTR("DaemonClient")));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  v11 = v10;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134349056;
    v69 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, a3, "momentsd_ScheduledRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", buf, 0xCu);
  }

  v12 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefresh"), 0);
  -[MOPerformanceMeasurement startSession](v12, "startSession");
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke;
  v58[3] = &unk_1002B3148;
  v63 = a3;
  v61 = (void (**)(id, NSObject *))v6;
  v62 = v64;
  v31 = v61;
  v58[4] = self;
  v32 = v8;
  v59 = v32;
  v29 = v12;
  v60 = v29;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_150;
  v55[3] = &unk_1002B1A98;
  v57 = a3;
  v55[4] = self;
  v30 = objc_retainBlock(v58);
  v56 = v30;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_154;
  v51[3] = &unk_1002B3198;
  v51[4] = self;
  v53 = v64;
  v54 = a3;
  v13 = objc_retainBlock(v55);
  v52 = v13;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_158;
  v46[3] = &unk_1002B31E8;
  v49 = v64;
  v50 = a3;
  v46[4] = self;
  v14 = objc_retainBlock(v51);
  v47 = v14;
  v15 = v13;
  v48 = v15;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_162;
  v42[3] = &unk_1002B3198;
  v42[4] = self;
  v44 = v64;
  v45 = a3;
  v16 = objc_retainBlock(v46);
  v43 = v16;
  v17 = objc_retainBlock(v42);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_166;
  v37[3] = &unk_1002B31E8;
  v40 = v64;
  v41 = a3;
  v37[4] = self;
  v18 = v15;
  v38 = v18;
  v19 = v17;
  v39 = v19;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_170;
  v33[3] = &unk_1002B3198;
  v33[4] = self;
  v35 = v64;
  v36 = a3;
  v20 = objc_retainBlock(v37);
  v34 = v20;
  v21 = objc_retainBlock(v33);
  if (objc_msgSend(v32, "acquireRefreshLock"))
  {
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Refresh: RefreshLock is acquired. Running refresh.", buf, 2u);
    }

    v24 = objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler queue](self, "queue"));
    dispatch_async(v24, v21);
    goto LABEL_12;
  }
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[MOEventRefreshScheduler refreshWithRefreshVariant:andCompletion:].cold.1();

  if (v31)
  {
    v27 = objc_alloc((Class)NSError);
    v66 = NSLocalizedDescriptionKey;
    v67 = CFSTR("The refresh is dropped due to an existing refresh.");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    v24 = objc_msgSend(v27, "initWithDomain:code:userInfo:", CFSTR("MOEventRefreshSchduler"), 0, v28);

    v31[2](v31, v24);
LABEL_12:

  }
  _Block_object_dispose(v64, 8);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  int v19;
  os_signpost_id_t v20;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ScheduledRefreshCompletion", ", (uint8_t *)&v19, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshCompletion"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventManager"));
  objc_msgSend(v8, "clearCache");

  objc_msgSend(*(id *)(a1 + 40), "releaseRefreshLock");
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Refresh: RefreshLock is released", (uint8_t *)&v19, 2u);
  }

  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 72);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v14, "ScheduledRefreshCompletion", ", (uint8_t *)&v19, 2u);
  }

  -[MOPerformanceMeasurement endSession](v6, "endSession");
  v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 72);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v19 = 134349056;
    v20 = v18;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v18, "momentsd_ScheduledRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_150(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  void *v7;
  uint64_t v8;
  MOPerformanceMeasurement *v9;
  NSObject *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MOPerformanceMeasurement *v15;
  uint64_t v16;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ScheduledRefreshNotificationService", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshNotificationService"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsManager"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_153;
  v14 = &unk_1002B1A70;
  v8 = *(_QWORD *)(a1 + 48);
  v15 = v6;
  v16 = v8;
  v9 = v6;
  objc_msgSend(v7, "serviceSuggestionsNotificationsWithHandler:", &v11);

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue", v11, v12, v13, v14));
  dispatch_async(v10, *(dispatch_block_t *)(a1 + 40));

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "ScheduledRefreshNotificationService", ", (uint8_t *)&v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Notification scheduling complete, error: %@", (uint8_t *)&v10, 0xCu);
  }

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_154(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  void *v7;
  uint64_t v8;
  id v9;
  MOPerformanceMeasurement *v10;
  __int128 v11;
  _QWORD v12[4];
  MOPerformanceMeasurement *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ScheduledRefreshDataDump", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshDataDump"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_157;
  v12[3] = &unk_1002B3170;
  v16 = v8;
  v13 = v6;
  v14 = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v15 = v11;
  v10 = v6;
  objc_msgSend(v7, "_dataDumpWithRefreshVariant:completion:", v8, v12);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int16 v14[8];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v14[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "ScheduledRefreshDataDump", ", (uint8_t *)v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v12 = v10;
  else
    v12 = v3;
  objc_storeStrong(v9, v12);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  dispatch_async(v13, *(dispatch_block_t *)(a1 + 48));

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_158(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MOPerformanceMeasurement *v10;
  _QWORD v11[4];
  MOPerformanceMeasurement *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ScheduledRefreshBundleEvents", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshBundleEvents"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_161;
  v11[3] = &unk_1002B31C0;
  v7 = *(_QWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = v7;
  v9 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v9;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v10 = v6;
  objc_msgSend(v9, "_computeWithRefreshVariant:andCompletion:", v7, v11);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_block_t *v14;
  __int16 v15[8];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v15[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "ScheduledRefreshBundleEvents", ", (uint8_t *)v15, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v12 = v10;
  else
    v12 = v3;
  objc_storeStrong(v9, v12);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) || *(_QWORD *)(a1 + 72) != 768)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
    v14 = (dispatch_block_t *)(a1 + 56);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
    v14 = (dispatch_block_t *)(a1 + 48);
  }
  dispatch_async(v13, *v14);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_162(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  void *v7;
  uint64_t v8;
  id v9;
  MOPerformanceMeasurement *v10;
  __int128 v11;
  _QWORD v12[4];
  MOPerformanceMeasurement *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ScheduledRefreshAnalytics", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshAnalytics"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_165;
  v12[3] = &unk_1002B3170;
  v16 = v8;
  v13 = v6;
  v14 = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v15 = v11;
  v10 = v6;
  objc_msgSend(v7, "_trendsWithRefreshVariant:andCompletion:", v8, v12);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int16 v14[8];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v14[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "ScheduledRefreshAnalytics", ", (uint8_t *)v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v12 = v10;
  else
    v12 = v3;
  objc_storeStrong(v9, v12);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  dispatch_async(v13, *(dispatch_block_t *)(a1 + 48));

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_166(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MOPerformanceMeasurement *v10;
  _QWORD v11[4];
  MOPerformanceMeasurement *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ScheduledRefreshCollect", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshCollect"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_169;
  v11[3] = &unk_1002B31C0;
  v7 = *(_QWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = v7;
  v9 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v9;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v10 = v6;
  objc_msgSend(v9, "_collectWithRefreshVariant:andCompletion:", v7, v11);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_169(uint64_t a1, void *a2)
{
  id v4;
  id os_log;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  dispatch_block_t *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  __int16 v20[8];

  v4 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 72);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v20[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v8, "ScheduledRefreshCollect", ", (uint8_t *)v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v11 = v12;
  if (v12)
    v13 = v11;
  else
    v13 = v4;
  objc_storeStrong(v10, v13);
  if (v4
    && ((objc_msgSend(v4, "code") & 0x400) != 0 || objc_msgSend(v4, "code") == (id)22)
    && (v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain")),
        v14,
        v14 == CFSTR("MOErrorDomain")))
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_169_cold_1((uint64_t)v4, v18, v19);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
    v16 = (dispatch_block_t *)(a1 + 48);
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
    v16 = (dispatch_block_t *)(a1 + 56);
  }
  dispatch_async(v15, *v16);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_170(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  void *v7;
  uint64_t v8;
  id v9;
  MOPerformanceMeasurement *v10;
  __int128 v11;
  _QWORD v12[4];
  MOPerformanceMeasurement *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ScheduledRefreshPurge", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshPurge"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_173;
  v12[3] = &unk_1002B3170;
  v16 = v8;
  v13 = v6;
  v14 = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v15 = v11;
  v10 = v6;
  objc_msgSend(v7, "_purgeEventsAndBundlesWithRefreshVariant:andCompletion:", v8, v12);

}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_173(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int16 v14[8];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v14[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "ScheduledRefreshPurge", ", (uint8_t *)v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v12 = v10;
  else
    v12 = v3;
  objc_storeStrong(v9, v12);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  dispatch_async(v13, *(dispatch_block_t *)(a1 + 48));

}

- (void)_purgeEventsAndBundlesWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id os_log;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MOEventRefreshScheduler *v18;
  id v19;
  _QWORD *v20;
  unint64_t v21;
  uint8_t buf[16];
  _QWORD v23[5];
  id v24;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("RefreshPurge")));
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__23;
  v23[4] = __Block_byref_object_dispose__23;
  v24 = 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Refresh: Calling purge events", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler eventManager](self, "eventManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke;
  v15[3] = &unk_1002B3238;
  v12 = v7;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v18 = self;
  v20 = v23;
  v21 = a3;
  v14 = v6;
  v19 = v14;
  objc_msgSend(v11, "cleanUpEventsWithRefreshVariant:andHandler:", a3, v15);

  _Block_object_dispose(v23, 8);
}

void __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  int8x16_t v14;
  __int128 v15;
  _QWORD block[4];
  id v17;
  int8x16_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "pet");
  objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v8);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_2;
  block[3] = &unk_1002B1B60;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 72);
  v17 = v10;
  v20 = v11;
  v14 = *(int8x16_t *)(a1 + 40);
  v12 = (id)v14.i64[0];
  v18 = vextq_s8(v14, v14, 8uLL);
  v15 = *(_OWORD *)(a1 + 56);
  v13 = (id)v15;
  v19 = v15;
  dispatch_async(v9, block);

}

void __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_2(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "pet");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Refresh: Calling purge bundles", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventBundleManager"));
  v5 = *(_QWORD *)(a1 + 72);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_183;
  v10[3] = &unk_1002B3210;
  v11 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v9 = *(_OWORD *)(a1 + 56);
  v8 = (id)v9;
  v14 = v9;
  objc_msgSend(v4, "cleanUpEventBundlesWithRefreshVariant:andHandler:", v5, v10);

}

void __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "pet");
  objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v6);

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    v11 = v13;
    if (v10)
      v11 = v9;
    objc_storeStrong(v8, v11);
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", CFSTR("launchd"), CFSTR("triggerSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "notifier"));
  objc_msgSend(v12, "sendNotification:withPayload:", 4, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_collectWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MOEventRefreshScheduler *v15;
  id v16;
  uint8_t buf[16];

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh: Calling collect", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("RefreshCollect")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler eventManager](self, "eventManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __68__MOEventRefreshScheduler__collectWithRefreshVariant_andCompletion___block_invoke;
  v13[3] = &unk_1002B2068;
  v14 = v9;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "collectEventsWithRefreshVariant:andHandler:", a3, v13);

}

void __68__MOEventRefreshScheduler__collectWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "pet");
  v9 = objc_msgSend(v6, "mutableCopy");

  if (v7)
    objc_msgSend(v9, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  objc_msgSend(v9, "setObject:forKey:", CFSTR("launchd"), CFSTR("triggerSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "notifier"));
  objc_msgSend(v8, "sendNotification:withPayload:", 2, v9);

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_trendsWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MOEventRefreshScheduler *v15;
  id v16;
  uint8_t buf[16];

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh: Calling trends", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("RefreshTrends")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler eventManager](self, "eventManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __67__MOEventRefreshScheduler__trendsWithRefreshVariant_andCompletion___block_invoke;
  v13[3] = &unk_1002B2068;
  v14 = v9;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "runAnalyticsWithRefreshVariant:andHandler:", a3, v13);

}

void __67__MOEventRefreshScheduler__trendsWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "pet");
  v9 = objc_msgSend(v6, "mutableCopy");

  if (v7)
    objc_msgSend(v9, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  objc_msgSend(v9, "setObject:forKey:", CFSTR("launchd"), CFSTR("triggerSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "notifier"));
  objc_msgSend(v8, "sendNotification:withPayload:", 5, v9);

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_computeWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MOEventRefreshScheduler *v15;
  id v16;
  uint8_t buf[16];

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh: Calling compute", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("RefreshCompute")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler eventBundleManager](self, "eventBundleManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __68__MOEventRefreshScheduler__computeWithRefreshVariant_andCompletion___block_invoke;
  v13[3] = &unk_1002B2068;
  v14 = v9;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "bundleEventsWithRefreshVariant:andHandler:", a3, v13);

}

void __68__MOEventRefreshScheduler__computeWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "pet");
  v9 = objc_msgSend(v6, "mutableCopy");

  if (v7)
    objc_msgSend(v9, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  objc_msgSend(v9, "setObject:forKey:", CFSTR("launchd"), CFSTR("triggerSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "notifier"));
  objc_msgSend(v8, "sendNotification:withPayload:", 3, v9);

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_dataDumpWithRefreshVariant:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh: dataDumpWithCompletion", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("DataDump")));
  v10 = objc_opt_new(NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, CFSTR("kMORefreshVariant"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002D9740, "stringValue"));
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v13, CFSTR("kMORefreshSource"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler eventBundleManager](self, "eventBundleManager"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __66__MOEventRefreshScheduler__dataDumpWithRefreshVariant_completion___block_invoke;
  v17[3] = &unk_1002AEB58;
  v18 = v9;
  v19 = v6;
  v15 = v6;
  v16 = v9;
  objc_msgSend(v14, "captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:", 2, 0, v10, 1, v17);

}

void __66__MOEventRefreshScheduler__dataDumpWithRefreshVariant_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "pet");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("kMODataDumpEnabled")));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "cancel");

}

- (id)_createWatchDogWithName:(id)a3
{
  MOConfigurationManager *configurationManager;
  id v5;
  void *v6;
  double v7;
  int v8;
  int v9;
  MOWatchDog *v10;
  double v11;
  MOWatchDog *v12;

  configurationManager = self->_configurationManager;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("WatchdogOverrideDefaultCadenceInSeconds"), v5));
  *(float *)&v7 = self->_watchdogCadence;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v6, v7);
  v9 = v8;

  v10 = [MOWatchDog alloc];
  LODWORD(v11) = v9;
  v12 = -[MOWatchDog initWithName:cadenceInSeconds:andHandler:](v10, "initWithName:cadenceInSeconds:andHandler:", v5, 0, v11);

  return v12;
}

- (MODaemonSPINotifier)notifier
{
  return self->_notifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODaemonUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_storeStrong((id *)&self->_universe, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (MOEventBundleManager)eventBundleManager
{
  return self->_eventBundleManager;
}

- (void)setEventBundleManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleManager, a3);
}

- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence
{
  return self->_onboardingAndSettingsPersistence;
}

- (void)setOnboardingAndSettingsPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, a3);
}

- (MONotificationsManager)notificationsManager
{
  return self->_notificationsManager;
}

- (void)setNotificationsManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsManager, 0);
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_eventBundleManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_defaultRefreshActivity, 0);
}

- (void)initWithUniverse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventBundleManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Activity was run recently; giving up on com.apple.momentsd.eventRefresh",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)registerFirstRefreshActivityWithPreRegisteredTask:(uint64_t)a3 .cold.1(const __CFString *a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;

  v3 = CFSTR("Unknown");
  if (a1)
    v3 = a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, a3, "Failed to submit task with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)registerFirstRefreshActivityWithPreRegisteredTask:(uint64_t)a3 .cold.2(const __CFString *a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;

  v3 = CFSTR("Unknown");
  if (a1)
    v3 = a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, a3, "Failed to update task with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("com.apple.momentsd.eventRefresh.first");
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a1, a3, "Activity was run recently; giving up on %@",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a3, (uint64_t)a3, "com.apple.momentsd.eventRefresh.light Failed to mark activity as Done. Current state is %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_5_5();
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Activity was run recently; giving up on com.apple.momentsd.eventRefresh.light",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_2();
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a3, (uint64_t)a3, "com.apple.momentsd.eventRefresh.light Failed to mark activity as Continue. Current state is %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_5_5();
}

- (void)refreshWithRefreshVariant:andCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Refresh: RefreshLock is in use. Exiting early due to exiting refresh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_169_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, a3, "Refresh: Exiting early due to errors in collect: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
