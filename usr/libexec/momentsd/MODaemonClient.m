@implementation MODaemonClient

+ (id)getRefreshVariantName:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("Full");
  v4 = CFSTR("Reset");
  if (a3 != 0xFFFF)
    v4 = 0;
  if (a3 != 1280)
    v3 = v4;
  v5 = CFSTR("Default");
  if (a3 != 768)
    v5 = 0;
  if (a3 == 512)
    v5 = CFSTR("Light");
  if ((uint64_t)a3 <= 1279)
    v3 = v5;
  v6 = CFSTR("SettingsChange");
  if (a3 != 336)
    v6 = 0;
  if (a3 == 256)
    v6 = CFSTR("Onboarding");
  if (!a3)
    v6 = CFSTR("Unknown");
  if ((uint64_t)a3 <= 511)
    return (id)v6;
  else
    return (id)v3;
}

- (MODaemonClient)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
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
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  MODaemonClient *v44;
  dispatch_queue_attr_t v45;
  NSObject *v46;
  dispatch_queue_t v47;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_attr_t v49;
  NSObject *v50;
  dispatch_queue_t v51;
  OS_dispatch_queue *externalQueue;
  NSLock *v53;
  NSLock *scheduledTaskLock;
  MOEvergreenAnnotationManager *v55;
  MOEvergreenAnnotationManager *evergreenManager;
  MODaemonSPINotifier *v57;
  MODaemonSPINotifier *notifier;
  double v59;
  float v60;
  void *v61;
  MODaemonClient *v62;
  id os_log;
  NSObject *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  SEL v68;
  MODaemonClient *v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  id v74;
  id obj;
  objc_super v76;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOEventManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  v12 = (objc_class *)objc_opt_class(MOEventBundleManager, v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v14));

  v17 = (objc_class *)objc_opt_class(MOConfigurationManager, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v19));

  v21 = (objc_class *)objc_opt_class(MODataAccessManager, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v74 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v23));

  v25 = (objc_class *)objc_opt_class(MODefaultsManager, v24);
  v26 = NSStringFromClass(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v27));

  v30 = (objc_class *)objc_opt_class(MOEngagementHistoryManager, v29);
  v31 = NSStringFromClass(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v32));

  v35 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, v34);
  v36 = NSStringFromClass(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v37));

  v40 = (objc_class *)objc_opt_class(MONotificationsManager, v39);
  v41 = NSStringFromClass(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v42));

  if (!v10)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v64 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      -[MODaemonClient initWithUniverse:].cold.1();

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", v74, obj));
    v66 = v65;
    v67 = CFSTR("Invalid parameter not satisfying: eventManager");
    v68 = a2;
    v69 = self;
    v70 = 130;
    goto LABEL_12;
  }
  if (!v15)
  {
    v71 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      -[MODaemonClient initWithUniverse:].cold.2();

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", v74, obj));
    v66 = v65;
    v67 = CFSTR("Invalid parameter not satisfying: eventBundleManager");
    v68 = a2;
    v69 = self;
    v70 = 131;
LABEL_12:
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", v68, v69, CFSTR("MODaemonClient.m"), v70, v67);

    v62 = 0;
    goto LABEL_13;
  }
  v76.receiver = self;
  v76.super_class = (Class)MODaemonClient;
  v44 = -[MODaemonClient init](&v76, "init");
  if (v44)
  {
    v45 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    v47 = dispatch_queue_create("MODaemonClient.internal", v46);
    internalQueue = v44->_internalQueue;
    v44->_internalQueue = (OS_dispatch_queue *)v47;

    v49 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    v51 = dispatch_queue_create("MODaemonClient.external", v50);
    externalQueue = v44->_externalQueue;
    v44->_externalQueue = (OS_dispatch_queue *)v51;

    v44->_refreshLock = 0;
    v53 = objc_opt_new(NSLock);
    scheduledTaskLock = v44->_scheduledTaskLock;
    v44->_scheduledTaskLock = v53;

    objc_storeStrong((id *)&v44->_eventManager, v10);
    objc_storeStrong((id *)&v44->_configManager, obj);
    objc_storeStrong((id *)&v44->_dataAccessManager, v74);
    objc_storeStrong((id *)&v44->_defaultsManager, v28);
    objc_storeStrong((id *)&v44->_eventBundleManager, v15);
    v55 = -[MOEvergreenAnnotationManager initWithUniverse:]([MOEvergreenAnnotationManager alloc], "initWithUniverse:", v5);
    evergreenManager = v44->_evergreenManager;
    v44->_evergreenManager = v55;

    objc_storeStrong((id *)&v44->_engagementHistoryManager, v33);
    objc_storeStrong((id *)&v44->_onboardingAndSettingsPersistence, v38);
    objc_storeStrong((id *)&v44->_notificationsManager, v43);
    v57 = -[MODaemonSPINotifier initWithName:]([MODaemonSPINotifier alloc], "initWithName:", CFSTR("DaemonClient"));
    notifier = v44->_notifier;
    v44->_notifier = v57;

    LODWORD(v59) = 10.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v44->_configManager, "getFloatSettingForKey:withFallback:", CFSTR("WatchdogOverrideDefaultCadenceInSeconds"), v59);
    v44->_watchdogCadence = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter"));
    objc_msgSend(v61, "configureWithDaemonClient:", v44);

  }
  self = v44;
  v62 = self;
LABEL_13:

  return v62;
}

- (void)_scheduleSendBarrierBlock:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  id v5;

  v3 = (void (**)(_QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "scheduleSendBarrierBlock:", v3);
  else
    v3[2](v3);

}

- (void)scheduleClientTask:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Client Task Scheduled [%@]", (uint8_t *)&v16, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v11 = objc_msgSend(v10, "getBoolSettingForKey:withFallback:", CFSTR("ClientOverrideAvoidQuerySerialization"), 0);

  if ((v11 & 1) == 0)
    -[NSLock lock](self->_scheduledTaskLock, "lock");
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Client Task Started [%@]", (uint8_t *)&v16, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = objc_claimAutoreleasedReturnValue(-[MODaemonClient externalQueue](self, "externalQueue"));
  if (v14)
    +[NSXPCConnection _handoffCurrentReplyToQueue:block:](NSXPCConnection, "_handoffCurrentReplyToQueue:block:", v15, v6);
  else
    dispatch_async(v15, v6);

}

- (void)scheduleInternalClientTask:(id)a3 withName:(id)a4
{
  -[MODaemonClient scheduleInternalClientTask:withName:andAllowHandoffReplayQueue:](self, "scheduleInternalClientTask:withName:andAllowHandoffReplayQueue:", a3, a4, 1);
}

- (void)scheduleInternalClientTask:(id)a3 withName:(id)a4 andAllowHandoffReplayQueue:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Internal Client Task Scheduled [%@]", (uint8_t *)&v18, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v13 = objc_msgSend(v12, "getBoolSettingForKey:withFallback:", CFSTR("ClientOverrideAvoidQuerySerialization"), 0);

  if ((v13 & 1) == 0)
    -[NSLock lock](self->_scheduledTaskLock, "lock");
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Internal Client Task Started [%@]", (uint8_t *)&v18, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (v16 && v5)
  {
    v17 = objc_claimAutoreleasedReturnValue(-[MODaemonClient internalQueue](self, "internalQueue"));
    +[NSXPCConnection _handoffCurrentReplyToQueue:block:](NSXPCConnection, "_handoffCurrentReplyToQueue:block:", v17, v8);
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(-[MODaemonClient internalQueue](self, "internalQueue"));
    dispatch_async(v17, v8);
  }

}

- (void)finalizeClientTaskWithName:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v6 = objc_msgSend(v5, "getBoolSettingForKey:withFallback:", CFSTR("ClientOverrideAvoidQuerySerialization"), 0);

  if ((v6 & 1) == 0)
    -[NSLock unlock](self->_scheduledTaskLock, "unlock");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Client Task Completed [%@]", (uint8_t *)&v9, 0xCu);
  }

}

- (BOOL)validateIfActiveClientHasAnyEntitlementInArray:(id)a3 withErrorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v21)(id, void *);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  NSErrorUserInfoKey v26;
  void *v27;
  _BYTE v28[128];

  v6 = a3;
  v21 = (void (**)(id, void *))a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    LODWORD(v10) = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient entitlementDelegate](self, "entitlementDelegate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
        LODWORD(v10) = v10 | objc_msgSend(v14, "clientConnection:hasInternalEntitlement:", v15, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  if (v21 && (v10 & 1) == 0)
  {
    v16 = objc_autoreleasePoolPush();
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("entitlementErrorResponse")));
    v26 = NSLocalizedFailureReasonErrorKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("missing Moments internal entitlement - requires any in %@"), v7));
    v27 = v18;
    v10 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, v10));

    objc_msgSend(v17, "pet");
    v21[2](v21, v19);
    objc_msgSend(v17, "cancel");

    objc_autoreleasePoolPop(v16);
    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

- (void)_abortIfNeeded:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v5 = objc_msgSend(v4, "getIntegerSettingForKey:withFallback:", v6, 0);

  if (v5 == 1)
    abort();

}

- (void)storeEvents:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  const __CFString *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v15));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v16);
  v23 = CFSTR("MOStoreEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v18 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v17, v11);

  if (v18)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke;
    v19[3] = &unk_1002ADA68;
    v19[4] = self;
    v20 = v9;
    v21 = v10;
    v22 = v11;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v19, CFSTR("storeEvents"));

  }
}

void __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke_2;
  v6[3] = &unk_1002B1710;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_storeEvents:withContext:andHandler:", v3, v4, v6);

}

id __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("storeEvents"));
}

- (void)_storeEvents:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id os_log;
  NSObject *v15;
  MOEventManager *eventManager;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  MODaemonClient *v21;
  id v22;
  _QWORD *v23;
  uint8_t buf[16];
  _QWORD v25[5];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__18;
  v26 = (id)os_transaction_create("com.apple.moments.daemon-client.store-events", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("StoreEvents")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "store events", buf, 2u);
  }

  eventManager = self->_eventManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke;
  v19[3] = &unk_1002B1760;
  v17 = v13;
  v20 = v17;
  v18 = v10;
  v22 = v18;
  v23 = v25;
  v21 = self;
  -[MOEventManager storeEvents:handler:](eventManager, "storeEvents:handler:", v8, v19);

  _Block_object_dispose(v25, 8);
  objc_autoreleasePoolPop(v11);

}

void __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void ***v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke_2;
  v11 = &unk_1002B1738;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v12 = v5;
  v13 = v6;
  v7 = objc_retainBlock(&v8);
  objc_msgSend(*(id *)(a1 + 40), "_scheduleSendBarrierBlock:", v7, v8, v9, v10, v11);

}

void __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)scheduleDatabaseUpgradeWithContext:(id)a3 andDelegate:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  id os_log;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[8];
  _QWORD v26[4];
  id v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  const __CFString *v30;

  v7 = a3;
  v8 = a4;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v12));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v13);
  v30 = CFSTR("MOScheduleDatabaseUpgrade");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke;
  v26[3] = &unk_1002B1788;
  v15 = v8;
  v27 = v15;
  v16 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v14, v26);

  if (v16)
  {
    if (-[MODaemonClient acquireRefreshLock](self, "acquireRefreshLock"))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_169;
      v22[3] = &unk_1002B17D8;
      v22[4] = self;
      v23 = v7;
      v24 = v15;
      -[MODaemonClient scheduleInternalClientTask:withName:andAllowHandoffReplayQueue:](self, "scheduleInternalClientTask:withName:andAllowHandoffReplayQueue:", v22, CFSTR("scheduleDatabaseUpgradeWithContext"), 0);

    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
      v18 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "RefreshLock is in use. Drop the refresh.", buf, 2u);
      }

      v19 = objc_alloc((Class)NSError);
      v28 = NSLocalizedDescriptionKey;
      v29 = CFSTR("The refresh is dropped due to an existing refresh.");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v21 = objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("MODaemonClient"), 0, v20);

      objc_msgSend(v15, "didUpdateWithStatus:andError:", 0, v21);
    }
  }

}

id __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateWithStatus:andError:", 0, a2);
}

void __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_169(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_2;
  v6[3] = &unk_1002B17B0;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "_scheduleDatabaseUpgradeWithContext:andHandler:", v3, v6);

}

void __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  void *v12;

  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithContext with status %@", (uint8_t *)&v11, 0xCu);

  }
  if (a2 <= 4)
  {
    if (a2 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "didUpdateWithStatus:andError:", 2, v5);
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "didUpdateWithStatus:andError:", a2, v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "releaseRefreshLock");
  objc_msgSend(*(id *)(a1 + 40), "finalizeClientTaskWithName:", CFSTR("scheduleDatabaseUpgradeWithContext"));
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithContext completed", (uint8_t *)&v11, 2u);
  }

LABEL_9:
}

- (void)_scheduleDatabaseUpgradeWithContext:(id)a3 andHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  MOPerformanceMeasurement *v18;
  id v19;
  NSObject *v20;
  MOPerformanceMeasurement *v21;
  unsigned __int8 v22;
  id os_log;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  _QWORD v27[4];
  MOPerformanceMeasurement *v28;
  void (**v29)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  const __CFString *v31;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  v9 = objc_msgSend(v8, "isAllowedToCollectAndCompute");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v11 = objc_msgSend(v10, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideForceFullRefreshAtBoot"), 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v13 = objc_msgSend(v12, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideAvoidFullRefreshAtBoot"), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v15 = objc_msgSend(v14, "getBoolSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerOverrideAllowFullRefreshAtBoot"), 1);

  if (!v9)
    goto LABEL_15;
  if ((+[MOPlatformInfo wasBuildVersionUpdated](MOPlatformInfo, "wasBuildVersionUpdated") & v15 & (v13 ^ 1) | v11) != 1)
  {
    v22 = +[MOPlatformInfo wasBuildVersionUpdated](MOPlatformInfo, "wasBuildVersionUpdated");
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if ((v22 & 1) != 0)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        v26 = "Refresh.First: build upgrade was detected but overrides prevent this task to run, skipped!";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v26, buf, 2u);
      }
    }
    else if (v25)
    {
      *(_WORD *)buf = 0;
      v26 = "Refresh.First: no build upgrade detected, skipped!";
      goto LABEL_13;
    }

LABEL_15:
    v7[2](v7, 1, 0);
    goto LABEL_16;
  }
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0x500uLL, "XPCRefreshDatabaseUpgrade", ", buf, 2u);
  }

  v18 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ScheduledRefreshFirstWrapper"), 0);
  -[MOPerformanceMeasurement startSession](v18, "startSession");
  v7[2](v7, 2, 0);
  v19 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = CFSTR("com.apple.momentsd.eventRefresh.first");
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ detected build upgrade", buf, 0xCu);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __65__MODaemonClient__scheduleDatabaseUpgradeWithContext_andHandler___block_invoke;
  v27[3] = &unk_1002B1710;
  v28 = v18;
  v29 = v7;
  v21 = v18;
  -[MODaemonClient _refreshEventsWithContext:andRefreshVariant:andSoftKindFlag:andHandler:](self, "_refreshEventsWithContext:andRefreshVariant:andSoftKindFlag:andHandler:", v6, 1280, 0, v27);

LABEL_16:
}

void __65__MODaemonClient__scheduleDatabaseUpgradeWithContext_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (!v3)
    +[MOPlatformInfo persistBuildVersion](MOPlatformInfo, "persistBuildVersion");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "XPCRefreshDatabaseUpgrade", ", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)fetchEventsWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  const __CFString *v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v15));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v16);
  v26 = CFSTR("MOFetchEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke;
  v24[3] = &unk_1002B1800;
  v18 = v11;
  v25 = v18;
  v19 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v17, v24);

  if (v19)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_2;
    v20[3] = &unk_1002ADA68;
    v20[4] = self;
    v21 = v9;
    v22 = v10;
    v23 = v18;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v20, CFSTR("fetchEventsWithOptions"));

  }
}

uint64_t __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_3;
  v6[3] = &unk_1002AEB80;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_fetchEventsWithOptions:withContext:andHandler:", v3, v4, v6);

}

id __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("fetchEventsWithOptions"));
}

- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id os_log;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD block[4];
  id v23;
  MODaemonClient *v24;
  id v25;
  id v26;
  _QWORD *v27;
  uint8_t buf[8];
  _QWORD v29[5];
  id v30;
  _QWORD v31[2];

  v7 = a3;
  v8 = a4;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v12));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v13);
  v31[0] = CFSTR("MOUserNotifications");
  v31[1] = CFSTR("MOPromptManagerTest");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
  LODWORD(v11) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v14, v8);

  if ((_DWORD)v11)
  {
    v15 = objc_autoreleasePoolPush();
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__18;
    v29[4] = __Block_byref_object_dispose__18;
    v30 = (id)os_transaction_create("com.apple.momentsd.test", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("testMomentsNotifications")));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "testing moments notifications", buf, 2u);
    }

    v20 = objc_claimAutoreleasedReturnValue(-[MODaemonClient internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke;
    block[3] = &unk_1002B1850;
    v23 = v17;
    v24 = self;
    v25 = v7;
    v26 = v8;
    v27 = v29;
    v21 = v17;
    dispatch_async(v20, block);

    _Block_object_dispose(v29, 8);
    objc_autoreleasePoolPop(v15);
  }

}

void __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "pet");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "notificationsManager"));
  v3 = *(_QWORD *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke_2;
  v6[3] = &unk_1002B1828;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v8 = v4;
  v9 = v5;
  objc_msgSend(v2, "testMomentsNotificationsWithOptions:handler:", v3, v6);

}

void __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "pet");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (void)setupPeriodicTimeToWriteMomentsNotificationsForApplication:(id)a3 usingDateComponents:(id)a4 withActionURL:(id)a5 withContext:(id)a6 andHandler:(id)a7
{
  void (**v9)(id, void *);
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  const __CFString *v20;

  v9 = (void (**)(id, void *))a7;
  v10 = NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v13));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v14);
  v20 = CFSTR("MOUserNotifications");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  LODWORD(self) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v15, v9);

  if ((_DWORD)self)
  {
    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("Deprecated");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v16));

    v9[2](v9, v17);
  }

}

- (void)getMomentsNotificationsSchedule:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id os_log;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  MODaemonClient *v22;
  id v23;
  uint8_t buf[8];
  _QWORD v25[4];
  id v26;
  const __CFString *v27;

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v27 = CFSTR("MOUserNotifications");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke;
  v25[3] = &unk_1002B1800;
  v12 = v5;
  v26 = v12;
  v13 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, v25);

  if (v13)
  {
    v14 = objc_autoreleasePoolPush();
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("getMomentsNotificationsSchedule")));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "get notification schedule", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient internalQueue](self, "internalQueue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke_196;
    v20[3] = &unk_1002AEBA8;
    v21 = v15;
    v22 = self;
    v23 = v12;
    v19 = v15;
    +[NSXPCConnection _handoffCurrentReplyToQueue:block:](NSXPCConnection, "_handoffCurrentReplyToQueue:block:", v18, v20);

    objc_autoreleasePoolPop(v14);
  }

}

uint64_t __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke_196(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "pet");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "notificationsManager"));
  objc_msgSend(v2, "getMomentsNotificationsSchedule:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)setupMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id os_log;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  MODaemonClient *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[16];
  const __CFString *v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v15));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v16);
  v32 = CFSTR("MOUserNotifications");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  v18 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v17, v11);

  if (v18)
  {
    v19 = objc_autoreleasePoolPush();
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("setupMomentsNotificationsWithSchedule")));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "setup notifications with schedule", buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient internalQueue](self, "internalQueue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke;
    v25[3] = &unk_1002AE198;
    v26 = v20;
    v27 = self;
    v28 = v9;
    v29 = v10;
    v30 = v11;
    v24 = v20;
    +[NSXPCConnection _handoffCurrentReplyToQueue:block:](NSXPCConnection, "_handoffCurrentReplyToQueue:block:", v23, v25);

    objc_autoreleasePoolPop(v19);
  }

}

void __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pet");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "notificationsManager"));
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2;
  v5[3] = &unk_1002B1878;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:options:handler:", v3, v4, v5);

}

id __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "pet");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)getTimeToWriteNotificationsApplicationScheduleWithContext:(id)a3 andHandler:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  const __CFString *v20;

  v6 = a4;
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v10));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v11);
  v20 = CFSTR("MOUserNotifications");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __87__MODaemonClient_getTimeToWriteNotificationsApplicationScheduleWithContext_andHandler___block_invoke;
  v16[3] = &unk_1002B1800;
  v13 = v6;
  v17 = v13;
  LODWORD(self) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v12, v16);

  if ((_DWORD)self)
  {
    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("Deprecated");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v14));

    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v15);
  }

}

uint64_t __87__MODaemonClient_getTimeToWriteNotificationsApplicationScheduleWithContext_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchEventsWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id os_log;
  NSObject *v14;
  MOPerformanceMeasurement *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  MOEventManager *eventManager;
  id v23;
  id v24;
  id v25;
  MOPerformanceMeasurement *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  MODaemonClient *v30;
  MOPerformanceMeasurement *v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  void *v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__18;
  v34[4] = __Block_byref_object_dispose__18;
  v35 = (id)os_transaction_create("com.apple.moments.daemon-client.fetch-events", v12);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCFetchEvents", ", buf, 2u);
  }

  v15 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCFetchEvents"), 0);
  -[MOPerformanceMeasurement startSession](v15, "startSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("FetchEvents")));
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "fetch event with options", buf, 2u);
  }

  v19 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "xpcProcessName"));
    *(_DWORD *)buf = 138412290;
    v37 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetch XPC context [%@]", buf, 0xCu);

  }
  eventManager = self->_eventManager;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke;
  v27[3] = &unk_1002B1908;
  v23 = v16;
  v28 = v23;
  v24 = v9;
  v29 = v24;
  v30 = self;
  v25 = v10;
  v32 = v25;
  v33 = v34;
  v26 = v15;
  v31 = v26;
  -[MOEventManager fetchEventsWithOptions:CompletionHandler:](eventManager, "fetchEventsWithOptions:CompletionHandler:", v8, v27);

  _Block_object_dispose(v34, 8);
  objc_autoreleasePoolPop(v11);

}

void __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  MOPerformanceMeasurement *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  _QWORD *v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id obj;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "xpcProcessName"));
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("triggerSource"));

  v41 = v6;
  if (v6)
  {
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v39 = v7;
  v40 = a1;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v53 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "the number of events fetched : %lu", buf, 0xCu);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v17 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventIdentifier"));
          *(_DWORD *)buf = 138412290;
          v53 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "events fetched : %@", buf, 0xCu);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extendedAttributes"));

        if (v20)
        {
          v21 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extendedAttributes"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
            *(_DWORD *)buf = 138412290;
            v53 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "events extended attribute : %@", buf, 0xCu);

          }
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trends", v39));

        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trends"));
          objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_21);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v13);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v40 + 48), "notifier"));
  objc_msgSend(v27, "sendNotification:withPayload:", 0, v39);

  objc_msgSend(*(id *)(v40 + 32), "pet");
  v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCFetchEventsCompletion", ", buf, 2u);
  }

  v30 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCFetchEventsCompletion"), 0);
  -[MOPerformanceMeasurement startSession](v30, "startSession");
  v31 = *(_QWORD *)(v40 + 64);
  if (v31)
    (*(void (**)(uint64_t, id, void *))(v31 + 16))(v31, obj, v41);
  v32 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCFetchEventsCompletion", ", buf, 2u);
  }

  -[MOPerformanceMeasurement endSession](v30, "endSession");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke_209;
  v43[3] = &unk_1002B18E0;
  v34 = *(id *)(v40 + 32);
  v35 = *(_QWORD *)(v40 + 48);
  v44 = v34;
  v45 = v35;
  v46 = *(_QWORD *)(v40 + 72);
  v36 = objc_retainBlock(v43);
  objc_msgSend(*(id *)(v40 + 48), "_scheduleSendBarrierBlock:", v36);
  v37 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCFetchEvents", ", buf, 2u);
  }

  objc_msgSend(*(id *)(v40 + 56), "endSession");
}

void __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke_205(id a1, NSString *a2, id a3, BOOL *a4)
{
  NSString *v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "events trends : %@, %@", (uint8_t *)&v9, 0x16u);
  }

}

void __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke_209(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventManager"));
  objc_msgSend(v2, "clearCache");

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)clearEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  const __CFString *v22;

  v9 = a3;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v14));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v15);
  v22 = CFSTR("MOPromptManagerTest");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v17 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v16, v10);

  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v18[3] = &unk_1002B1930;
    v18[4] = self;
    v19 = v9;
    v21 = a4;
    v20 = v10;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v18, CFSTR("clearEventsWithContext"));

  }
}

void __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002B1710;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_clearEventsWithContext:andRefreshVariant:andHandler:", v3, v4, v6);

}

id __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("clearEventsWithContext"));
}

- (void)_clearEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  MOEventManager *eventManager;
  id *v18;
  void ***v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[2];
  void ***v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  v8 = a3;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__18;
  v29[4] = __Block_byref_object_dispose__18;
  v30 = (id)os_transaction_create("com.apple.moments.daemon-client.clear-events", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("ClearEvents")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "xpcProcessName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MODaemonClient getRefreshVariantName:](MODaemonClient, "getRefreshVariantName:", a4));
    *(_DWORD *)buf = 138412546;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "clear XPC context [%@] variant [%@]", buf, 0x16u);

  }
  if (a4 == 0xFFFF)
  {
    eventManager = self->_eventManager;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v25[3] = &unk_1002B1760;
    v26[0] = v12;
    v27 = (void ***)v9;
    v28 = v29;
    v26[1] = self;
    -[MOEventManager clearEventsWithRefreshVariant:andHandler:](eventManager, "clearEventsWithRefreshVariant:andHandler:", 0xFFFFLL, v25);
    v18 = (id *)v26;
    v19 = v27;
  }
  else
  {
    objc_msgSend(v12, "pet");
    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_3;
    v23 = &unk_1002B1738;
    v24[0] = v12;
    v24[1] = v29;
    v19 = objc_retainBlock(&v20);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v19, v20, v21, v22, v23);
    v18 = (id *)v24;
  }

  _Block_object_dispose(v29, 8);
  objc_autoreleasePoolPop(v10);

}

void __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void ***v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v11 = &unk_1002B1738;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v12 = v5;
  v13 = v6;
  v7 = objc_retainBlock(&v8);
  objc_msgSend(*(id *)(a1 + 40), "_scheduleSendBarrierBlock:", v7, v8, v9, v10, v11);

}

void __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)fetchEventBundlesWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  const __CFString *v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v15));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v16);
  v26 = CFSTR("MOFetchEventBundles");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke;
  v24[3] = &unk_1002B1800;
  v18 = v11;
  v25 = v18;
  v19 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v17, v24);

  if (v19)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_2;
    v20[3] = &unk_1002ADA68;
    v20[4] = self;
    v21 = v9;
    v22 = v10;
    v23 = v18;
    -[MODaemonClient scheduleClientTask:withName:](self, "scheduleClientTask:withName:", v20, CFSTR("fetchEventBundlesWithOptions"));

  }
}

uint64_t __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_3;
  v6[3] = &unk_1002AEB80;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_fetchEventBundlesWithOptions:withContext:andHandler:", v3, v4, v6);

}

id __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("fetchEventBundlesWithOptions"));
}

- (void)_fetchEventBundlesWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id os_log;
  NSObject *v14;
  MOPerformanceMeasurement *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  MOEventBundleManager *eventBundleManager;
  id v23;
  id v24;
  id v25;
  id v26;
  MOPerformanceMeasurement *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  MODaemonClient *v31;
  id v32;
  MOPerformanceMeasurement *v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__18;
  v36[4] = __Block_byref_object_dispose__18;
  v37 = (id)os_transaction_create("com.apple.moments.daemon-client.fetch-event-bundles", v12);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "momentsd_XPCFetchEventBundle", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCFetchEventBundles"), 0);
  -[MOPerformanceMeasurement startSession](v15, "startSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("FetchEventBundles")));
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "fetch event bundles with options, %@", buf, 0xCu);
  }

  v19 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "xpcProcessName"));
    *(_DWORD *)buf = 138412290;
    v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetch XPC context [%@]", buf, 0xCu);

  }
  eventBundleManager = self->_eventBundleManager;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke;
  v28[3] = &unk_1002B1958;
  v23 = v16;
  v29 = v23;
  v24 = v9;
  v30 = v24;
  v31 = self;
  v25 = v8;
  v32 = v25;
  v26 = v10;
  v34 = v26;
  v35 = v36;
  v27 = v15;
  v33 = v27;
  -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:](eventBundleManager, "fetchEventBundlesWithOptions:CompletionHandler:", v25, v28);

  _Block_object_dispose(v36, 8);
  objc_autoreleasePoolPop(v11);

}

void __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  MOPerformanceMeasurement *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;

  v7 = a2;
  v37 = a3;
  v35 = a1;
  v36 = a4;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v47 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "the number of event bundles fetched : %lu", buf, 0xCu);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
          *(_DWORD *)buf = 138412290;
          v47 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "eventBundle fetched : %@", buf, 0xCu);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v12);
  }

  v19 = objc_msgSend(v36, "mutableCopy");
  v20 = v19;
  if (v37)
    objc_msgSend(v19, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v35 + 40), "xpcProcessName"));
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("triggerSource"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v35 + 48), "notifier"));
  objc_msgSend(v22, "sendNotification:withPayload:", 1, v20);

  if (objc_msgSend(*(id *)(v35 + 56), "personalizedSensingFilter"))
  {
    v23 = objc_claimAutoreleasedReturnValue(+[MOPersonalizedSensingUtils getPersonalizedSensingAllowedBundles:allowVisits:](MOPersonalizedSensingUtils, "getPersonalizedSensingAllowedBundles:allowVisits:", v10, objc_msgSend(*(id *)(v35 + 56), "personalizedSensingVisitsAllowed")));

    v10 = (id)v23;
  }
  objc_msgSend(*(id *)(v35 + 32), "pet");
  v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCFetchEventBundlesCompletion", ", buf, 2u);
  }

  v26 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCFetchEventBundlesCompletion"), 0);
  -[MOPerformanceMeasurement startSession](v26, "startSession");
  v27 = *(_QWORD *)(v35 + 72);
  if (v27)
    (*(void (**)(uint64_t, id, id))(v27 + 16))(v27, v10, v37);
  v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCFetchEventBundlesCompletion", ", buf, 2u);
  }

  -[MOPerformanceMeasurement endSession](v26, "endSession");
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_226;
  v38[3] = &unk_1002B1738;
  v30 = *(id *)(v35 + 32);
  v31 = *(_QWORD *)(v35 + 80);
  v39 = v30;
  v40 = v31;
  v32 = objc_retainBlock(v38);
  objc_msgSend(*(id *)(v35 + 48), "_scheduleSendBarrierBlock:", v32);
  v33 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 1uLL, "momentsd_XPCFetchEventBundle", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(*(id *)(v35 + 64), "endSession");
}

void __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_226(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)collectEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  const __CFString *v22;

  v9 = a3;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v14));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v15);
  v22 = CFSTR("MOPromptManagerTest");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v17 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v16, v10);

  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v18[3] = &unk_1002B1930;
    v18[4] = self;
    v19 = v9;
    v21 = a4;
    v20 = v10;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v18, CFSTR("collectEventsWithContext"));

  }
}

void __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002B1710;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_collectEventsWithContext:andRefreshVariant:andHandler:", v3, v4, v6);

}

id __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("collectEventsWithContext"));
}

- (void)_collectEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  MOEventManager *eventManager;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  MODaemonClient *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v8 = a3;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__18;
  v27[4] = __Block_byref_object_dispose__18;
  v28 = (id)os_transaction_create("com.apple.moments.daemon-client.collect-events", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("CollectEvents")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "xpcProcessName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MODaemonClient getRefreshVariantName:](MODaemonClient, "getRefreshVariantName:", a4));
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "collect XPC context [%@] variant [%@]", buf, 0x16u);

  }
  eventManager = self->_eventManager;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke;
  v21[3] = &unk_1002B1980;
  v18 = v12;
  v22 = v18;
  v19 = v8;
  v23 = v19;
  v24 = self;
  v20 = v9;
  v25 = v20;
  v26 = v27;
  -[MOEventManager collectEventsWithRefreshVariant:andHandler:](eventManager, "collectEventsWithRefreshVariant:andHandler:", a4, v21);

  _Block_object_dispose(v27, 8);
  objc_autoreleasePoolPop(v10);

}

void __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void ***v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "pet");
  v8 = objc_msgSend(v7, "mutableCopy");

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "xpcProcessName"));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("triggerSource"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "notifier"));
  objc_msgSend(v10, "sendNotification:withPayload:", 2, v8);

  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v18 = &unk_1002B1738;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v19 = v12;
  v20 = v13;
  v14 = objc_retainBlock(&v15);
  objc_msgSend(*(id *)(a1 + 48), "_scheduleSendBarrierBlock:", v14, v15, v16, v17, v18);

}

void __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)bundleEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  const __CFString *v22;

  v9 = a3;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v14));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v15);
  v22 = CFSTR("MOPromptManagerTest");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v17 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v16, v10);

  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v18[3] = &unk_1002B1930;
    v18[4] = self;
    v19 = v9;
    v21 = a4;
    v20 = v10;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v18, CFSTR("bundleEventsWithContext"));

  }
}

void __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002B1710;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_bundleEventsWithContext:andRefreshVariant:andHandler:", v3, v4, v6);

}

id __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("bundleEventsWithContext"));
}

- (void)_bundleEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  MOEventBundleManager *eventBundleManager;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  MODaemonClient *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v8 = a3;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__18;
  v27[4] = __Block_byref_object_dispose__18;
  v28 = (id)os_transaction_create("com.apple.moments.daemon-client.bundle-events", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("BundleEvents")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "xpcProcessName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MODaemonClient getRefreshVariantName:](MODaemonClient, "getRefreshVariantName:", a4));
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "bundle XPC context [%@] variant [%@]", buf, 0x16u);

  }
  eventBundleManager = self->_eventBundleManager;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke;
  v21[3] = &unk_1002B1980;
  v18 = v12;
  v22 = v18;
  v19 = v8;
  v23 = v19;
  v24 = self;
  v20 = v9;
  v25 = v20;
  v26 = v27;
  -[MOEventBundleManager bundleEventsWithRefreshVariant:andHandler:](eventBundleManager, "bundleEventsWithRefreshVariant:andHandler:", a4, v21);

  _Block_object_dispose(v27, 8);
  objc_autoreleasePoolPop(v10);

}

void __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void ***v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "pet");
  v8 = objc_msgSend(v7, "mutableCopy");

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "xpcProcessName"));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("triggerSource"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "notifier"));
  objc_msgSend(v10, "sendNotification:withPayload:", 3, v8);

  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v18 = &unk_1002B1738;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v19 = v12;
  v20 = v13;
  v14 = objc_retainBlock(&v15);
  objc_msgSend(*(id *)(a1 + 48), "_scheduleSendBarrierBlock:", v14, v15, v16, v17, v18);

}

void __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)purgeEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  const __CFString *v22;

  v9 = a3;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v14));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v15);
  v22 = CFSTR("MOPromptManagerTest");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v17 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v16, v10);

  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v18[3] = &unk_1002B1930;
    v18[4] = self;
    v19 = v9;
    v21 = a4;
    v20 = v10;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v18, CFSTR("purgeEventsWithContext"));

  }
}

void __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002B1710;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_purgeEventsWithContext:andRefreshVariant:andHandler:", v3, v4, v6);

}

id __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("purgeEventsWithContext"));
}

- (void)_purgeEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  MOEventManager *eventManager;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  MODaemonClient *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;

  v8 = a3;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__18;
  v34[4] = __Block_byref_object_dispose__18;
  v35 = (id)os_transaction_create("com.apple.moments.daemon-client.purge-events", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("PurgeEvents")));
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__18;
  v32[4] = __Block_byref_object_dispose__18;
  v33 = 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "xpcProcessName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MODaemonClient getRefreshVariantName:](MODaemonClient, "getRefreshVariantName:", a4));
    *(_DWORD *)buf = 138412546;
    v37 = v15;
    v38 = 2112;
    v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "purge XPC context [%@] variant [%@]", buf, 0x16u);

  }
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  eventManager = self->_eventManager;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke;
  v23[3] = &unk_1002B19D0;
  v19 = v12;
  v24 = v19;
  v20 = v17;
  v25 = v20;
  v26 = self;
  v29 = v32;
  v31 = a4;
  v21 = v8;
  v27 = v21;
  v22 = v9;
  v28 = v22;
  v30 = v34;
  -[MOEventManager cleanUpEventsWithRefreshVariant:andHandler:](eventManager, "cleanUpEventsWithRefreshVariant:andHandler:", a4, v23);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  objc_autoreleasePoolPop(v10);
}

void __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[16];

  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
  }
  objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v7);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "purge: Calling purge bundles", buf, 2u);
  }

  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(*(_QWORD *)(a1 + 48) + 88);
  v12 = *(_QWORD *)(a1 + 88);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_243;
  v19[3] = &unk_1002B19A8;
  v13 = v10;
  v14 = *(_QWORD *)(a1 + 72);
  v20 = v13;
  v25 = v14;
  v15 = *(id *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 48);
  v21 = v15;
  v22 = v16;
  v24 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 80);
  v23 = v17;
  v26 = v18;
  objc_msgSend(v11, "cleanUpEventBundlesWithRefreshVariant:andHandler:", v12, v19);

}

void __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_243(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void ***v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t v26;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v5;
    objc_storeStrong(v8, v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Purge expired events and bundles all completed", buf, 2u);
  }

  v14 = *(void **)(a1 + 32);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "xpcProcessName"));
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("triggerSource"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "notifier"));
  objc_msgSend(v16, "sendNotification:withPayload:", 4, *(_QWORD *)(a1 + 32));

  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
    (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_244;
  v24 = &unk_1002B1738;
  v18 = *(id *)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 80);
  v25 = v18;
  v26 = v19;
  v20 = objc_retainBlock(&v21);
  objc_msgSend(*(id *)(a1 + 48), "_scheduleSendBarrierBlock:", v20, v21, v22, v23, v24);

}

void __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_244(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)runAnalyticsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  const __CFString *v22;

  v9 = a3;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v14));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v15);
  v22 = CFSTR("MOPromptManagerTest");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v17 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v16, v10);

  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke;
    v18[3] = &unk_1002B1930;
    v18[4] = self;
    v19 = v9;
    v21 = a4;
    v20 = v10;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v18, CFSTR("runAnalyticsWithContext"));

  }
}

void __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002B1710;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_runAnalyticsWithContext:andRefreshVariant:andHandler:", v3, v4, v6);

}

id __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("runAnalyticsWithContext"));
}

- (void)_runAnalyticsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  MOEventManager *eventManager;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  MODaemonClient *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v8 = a3;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__18;
  v27[4] = __Block_byref_object_dispose__18;
  v28 = (id)os_transaction_create("com.apple.moments.daemon-client.run-analytics", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("RunAnalytics")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "xpcProcessName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MODaemonClient getRefreshVariantName:](MODaemonClient, "getRefreshVariantName:", a4));
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "analytics XPC context [%@] variant [%@]", buf, 0x16u);

  }
  eventManager = self->_eventManager;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke;
  v21[3] = &unk_1002B1980;
  v18 = v12;
  v22 = v18;
  v19 = v8;
  v23 = v19;
  v24 = self;
  v20 = v9;
  v25 = v20;
  v26 = v27;
  -[MOEventManager runAnalyticsWithRefreshVariant:andHandler:](eventManager, "runAnalyticsWithRefreshVariant:andHandler:", a4, v21);

  _Block_object_dispose(v27, 8);
  objc_autoreleasePoolPop(v10);

}

void __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void ***v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "pet");
  v8 = objc_msgSend(v7, "mutableCopy");

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultOverallSuccess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "xpcProcessName"));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("triggerSource"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "notifier"));
  objc_msgSend(v10, "sendNotification:withPayload:", 5, v8);

  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v18 = &unk_1002B1738;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v19 = v12;
  v20 = v13;
  v14 = objc_retainBlock(&v15);
  objc_msgSend(*(id *)(a1 + 48), "_scheduleSendBarrierBlock:", v14, v15, v16, v17, v18);

}

void __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)analyzeTrendsInEvents:(id)a3 withContext:(id)a4 andRefreshVariant:(unint64_t)a5 andHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  _QWORD v27[4];
  id v28;
  const __CFString *v29;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v17));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v18);
  v29 = CFSTR("MOPromptManagerTest");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke;
  v27[3] = &unk_1002B1800;
  v20 = v13;
  v28 = v20;
  v21 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v19, v27);

  if (v21)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2;
    v22[3] = &unk_1002AEA58;
    v22[4] = self;
    v23 = v11;
    v24 = v12;
    v26 = a5;
    v25 = v20;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v22, CFSTR("analyzeTrendsInEvents"));

  }
}

uint64_t __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3;
  v7[3] = &unk_1002AEB80;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v2, "_analyzeTrendsInEvents:withContext:andRefreshVariant:andHandler:", v3, v4, v5, v7);

}

id __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("analyzeTrendsInEvents"));
}

- (void)_analyzeTrendsInEvents:(id)a3 withContext:(id)a4 andRefreshVariant:(unint64_t)a5 andHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id os_log;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  MOTrendsAnalyzer *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  MODaemonClient *v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_autoreleasePoolPush();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__18;
  v31[4] = __Block_byref_object_dispose__18;
  v32 = (id)os_transaction_create("com.apple.moments.daemon-client.analyze-trends", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("AnalyzeTrends")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v17 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "run trends analytics", buf, 2u);
  }

  v18 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcProcessName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MODaemonClient getRefreshVariantName:](MODaemonClient, "getRefreshVariantName:", a5));
    *(_DWORD *)buf = 138412546;
    v34 = v20;
    v35 = 2112;
    v36 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "trends XPC context [%@] variant [%@]", buf, 0x16u);

  }
  v22 = objc_opt_new(MOTrendsAnalyzer);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer buildAnalyticsPlans](v22, "buildAnalyticsPlans"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke;
  v26[3] = &unk_1002B1A20;
  v24 = v15;
  v27 = v24;
  v25 = v12;
  v29 = v25;
  v30 = v31;
  v28 = self;
  -[MOTrendsAnalyzer analyzeEvents:analyticsPlans:handler:](v22, "analyzeEvents:analyticsPlans:handler:", v10, v23, v26);

  _Block_object_dispose(v31, 8);
  objc_autoreleasePoolPop(v13);

}

void __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  NSMutableString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  NSMutableString *v19;
  _QWORD v20[4];
  id v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  char v26;
  NSErrorUserInfoKey v27;
  NSMutableString *v28;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "trends analytics completes", buf, 2u);
  }

  if (v6)
  {
    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x2020000000;
    v26 = 1;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_256;
    v20[3] = &unk_1002B19F8;
    v21 = *(id *)(a1 + 32);
    v22 = buf;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);
    objc_msgSend(*(id *)(a1 + 32), "pet");
    if (v24[24])
    {
      v9 = 0;
    }
    else
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2;
      v18[3] = &unk_1002ADA90;
      v10 = objc_opt_new(NSMutableString);
      v19 = v10;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);
      v27 = NSLocalizedDescriptionKey;
      v28 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 0, v11));

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "pet");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3;
  v15[3] = &unk_1002B1738;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 56);
  v16 = v12;
  v17 = v13;
  v14 = objc_retainBlock(v15);
  objc_msgSend(*(id *)(a1 + 40), "_scheduleSendBarrierBlock:", v14);

}

void __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_256(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "pet");
  LODWORD(v6) = objc_msgSend(v7, "unsignedIntValue");

  if (((_DWORD)v6 - 4) >= 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

id __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(%@:%@)"), a2, a3);
}

void __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)softRefreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  double v29;
  float v30;
  float v31;
  void *v32;
  double v33;
  double v34;
  float v35;
  id v36;
  NSObject *v37;
  double v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  NSObject *v42;
  _BOOL4 v43;
  _QWORD v44[5];
  id v45;
  id v46;
  unint64_t v47;
  uint8_t buf[4];
  void *v49;
  const __CFString *v50;
  _QWORD v51[2];

  v9 = a3;
  v10 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting softRefresh", buf, 2u);
  }

  v13 = NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v16));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v17);
  if (a4 == 512)
  {
    v51[0] = CFSTR("MORefreshLight");
    v51[1] = CFSTR("MOPromptManagerTest");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
    v19 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v18, v10);

    if ((v19 & 1) == 0)
      goto LABEL_26;
LABEL_7:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient defaultsManager](self, "defaultsManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("EventRefreshSchedulerLastSuccessfulTrigger")));

    if (v24)
    {
      v26 = objc_opt_class(NSDate, v25);
      if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
      {
        v27 = v24;

        v22 = v27;
      }
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
    LODWORD(v29) = 1155596288;
    objc_msgSend(v28, "getFloatSettingForKey:withFallback:", CFSTR("EventRefreshSchedulerBlackoutTimeWindowForSoftRefresh"), v29);
    v31 = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v32, "timeIntervalSinceDate:", v22);
    v34 = v33;

    if (v22 && (v35 = v34, v35 > 0.0) && v31 > v35)
    {
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(float *)&v38 = v35;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38));
        *(_DWORD *)buf = 138412290;
        v49 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "softRefreshEventsWithContext had nothing to do because we refreshed %@ seconds ago", buf, 0xCu);

      }
      if (!v10)
        goto LABEL_25;
    }
    else
    {
      v40 = -[MODaemonClient acquireRefreshLock](self, "acquireRefreshLock");
      v41 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
      if ((v40 & 1) != 0)
      {
        if (v43)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "RefreshLock is acquired. Eligible to run soft refresh", buf, 2u);
        }

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = __76__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andHandler___block_invoke;
        v44[3] = &unk_1002B1930;
        v44[4] = self;
        v45 = v9;
        v47 = a4;
        v46 = v10;
        -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v44, CFSTR("softRefreshEventsWithContext"));

        goto LABEL_25;
      }
      if (v43)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "RefreshLock is in use. Drop the soft refresh.", buf, 2u);
      }

      if (!v10)
        goto LABEL_25;
    }
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_25:

    goto LABEL_26;
  }
  v50 = CFSTR("MOPromptManagerTest");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v21 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v20, v10);

  if (v21)
    goto LABEL_7;
LABEL_26:

}

void __76__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __76__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v4[3] = &unk_1002B1878;
  v4[4] = v1;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_refreshEventsWithContext:andRefreshVariant:andSoftKindFlag:andHandler:", v2, v3, 1, v4);

}

id __76__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id os_log;
  NSObject *v6;
  uint8_t v8[16];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "releaseRefreshLock");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RefreshLock is released.", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("softRefreshEventsWithContext"));
}

- (BOOL)acquireRefreshLock
{
  MODaemonClient *v2;
  _BOOL4 refreshLock;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  refreshLock = v2->_refreshLock;
  if (!v2->_refreshLock)
    v2->_refreshLock = 1;
  v4 = !refreshLock;
  objc_sync_exit(v2);

  return v4;
}

- (void)releaseRefreshLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Release an invalid refresh lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)refreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned int v19;
  id os_log;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  unint64_t v28;
  uint8_t buf[16];
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v9 = a3;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v14));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v15);
  if (a4 == 512)
  {
    v33[0] = CFSTR("MORefreshLight");
    v33[1] = CFSTR("MOPromptManagerTest");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
    v17 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v16, v10);

    if ((v17 & 1) == 0)
      goto LABEL_11;
  }
  else
  {
    v32 = CFSTR("MOPromptManagerTest");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v19 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v18, v10);

    if (!v19)
      goto LABEL_11;
  }
  if (-[MODaemonClient acquireRefreshLock](self, "acquireRefreshLock"))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v25[3] = &unk_1002B1930;
    v25[4] = self;
    v26 = v9;
    v28 = a4;
    v27 = v10;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v25, CFSTR("refreshEventsWithContext"));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v21 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "RefreshLock is in use. Drop the refresh.", buf, 2u);
    }

    if (v10)
    {
      v22 = objc_alloc((Class)NSError);
      v30 = NSLocalizedDescriptionKey;
      v31 = CFSTR("The refresh is dropped due to an existing refresh.");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      v24 = objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("MODaemonClient"), 0, v23);

      (*((void (**)(id, id))v10 + 2))(v10, v24);
    }
  }
LABEL_11:

}

void __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v4[3] = &unk_1002B1878;
  v4[4] = v1;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_refreshEventsWithContext:andRefreshVariant:andSoftKindFlag:andHandler:", v2, v3, 0, v4);

}

id __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id os_log;
  NSObject *v6;
  uint8_t v8[16];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "releaseRefreshLock");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RefreshLock is released.", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("refreshEventsWithContext"));
}

- (void)_refreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andSoftKindFlag:(BOOL)a5 andHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  MOPerformanceMeasurement *v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  id v42;
  id v43;
  _QWORD *v44;
  _QWORD *v45;
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  NSObject *v50;
  id v51;
  MOPerformanceMeasurement *v52;
  _QWORD *v53;
  _QWORD *v54;
  _BOOL4 v55;
  _QWORD v56[4];
  id v57;
  MODaemonClient *v58;
  id v59;
  id v60;
  _BYTE *v61;
  unint64_t v62;
  _QWORD v63[4];
  id v64;
  MODaemonClient *v65;
  id v66;
  id v67;
  _BYTE *v68;
  unint64_t v69;
  _QWORD v70[4];
  id v71;
  MODaemonClient *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  _BYTE *v77;
  unint64_t v78;
  BOOL v79;
  _QWORD v80[4];
  id v81;
  MODaemonClient *v82;
  id v83;
  id v84;
  _BYTE *v85;
  unint64_t v86;
  _QWORD v87[4];
  id v88;
  MODaemonClient *v89;
  id v90;
  id v91;
  id v92;
  _BYTE *v93;
  unint64_t v94;
  BOOL v95;
  _QWORD v96[4];
  id v97;
  MODaemonClient *v98;
  id v99;
  id v100;
  unint64_t v101;
  _QWORD v102[5];
  id v103;
  unint64_t v104;
  _QWORD v105[4];
  id v106;
  MODaemonClient *v107;
  MOPerformanceMeasurement *v108;
  id v109;
  _BYTE *v110;
  _QWORD *v111;
  unint64_t v112;
  _QWORD v113[5];
  id v114;
  uint8_t v115[4];
  unint64_t v116;
  _BYTE buf[24];
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;

  v55 = a5;
  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("refreshEvents")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "xpcProcessName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v55));
    v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(+[MODaemonClient getRefreshVariantName:](MODaemonClient, "getRefreshVariantName:", a4));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v118 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "refresh XPC context [%@] soft kind [%@] variant [%@]", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v118 = __Block_byref_object_copy__18;
  v119 = __Block_byref_object_dispose__18;
  v120 = 0;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x3032000000;
  v113[3] = __Block_byref_object_copy__18;
  v113[4] = __Block_byref_object_dispose__18;
  v114 = (id)os_transaction_create("com.apple.moments.daemon-client.refresh-events", v17);
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)v115 = 134349056;
    v116 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, a4, "momentsd_XPCRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", v115, 0xCu);
  }

  v21 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefresh"), 0);
  -[MOPerformanceMeasurement startSession](v21, "startSession");
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke;
  v105[3] = &unk_1002B1A48;
  v112 = a4;
  v22 = v11;
  v106 = v22;
  v51 = v10;
  v109 = v51;
  v107 = self;
  v110 = buf;
  v111 = v113;
  v52 = v21;
  v108 = v52;
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_279;
  v102[3] = &unk_1002B1A98;
  v104 = a4;
  v102[4] = self;
  v53 = objc_retainBlock(v105);
  v103 = v53;
  v23 = objc_retainBlock(v102);
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_283;
  v96[3] = &unk_1002AEA58;
  v101 = a4;
  v24 = v22;
  v97 = v24;
  v98 = self;
  v25 = v9;
  v99 = v25;
  v26 = v23;
  v100 = v26;
  v27 = objc_retainBlock(v96);
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_288;
  v87[3] = &unk_1002B1B10;
  v94 = a4;
  v28 = v24;
  v88 = v28;
  v89 = self;
  v29 = v25;
  v90 = v29;
  v93 = buf;
  v95 = v55;
  v30 = v26;
  v91 = v30;
  v54 = v27;
  v92 = v54;
  v31 = objc_retainBlock(v87);
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_292;
  v80[3] = &unk_1002B1B60;
  v86 = a4;
  v32 = v28;
  v81 = v32;
  v82 = self;
  v33 = v29;
  v83 = v33;
  v85 = buf;
  v34 = v31;
  v84 = v34;
  v35 = objc_retainBlock(v80);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_296;
  v70[3] = &unk_1002B1BB0;
  v78 = a4;
  v36 = v32;
  v71 = v36;
  v72 = self;
  v37 = v33;
  v73 = v37;
  v77 = buf;
  v38 = v30;
  v74 = v38;
  v79 = v55;
  v39 = v34;
  v75 = v39;
  v40 = v35;
  v76 = v40;
  v41 = objc_retainBlock(v70);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_300;
  v63[3] = &unk_1002B1B60;
  v69 = a4;
  v42 = v36;
  v64 = v42;
  v65 = self;
  v43 = v37;
  v66 = v43;
  v68 = buf;
  v44 = v41;
  v67 = v44;
  v45 = objc_retainBlock(v63);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_304;
  v56[3] = &unk_1002B1B60;
  v62 = a4;
  v46 = v42;
  v57 = v46;
  v58 = self;
  v47 = v43;
  v59 = v47;
  v61 = buf;
  v48 = v45;
  v60 = v48;
  v49 = objc_retainBlock(v56);
  v50 = objc_claimAutoreleasedReturnValue(-[MODaemonClient internalQueue](self, "internalQueue"));
  dispatch_async(v50, v49);

  _Block_object_dispose(v113, 8);
  _Block_object_dispose(buf, 8);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  int8x16_t v18;
  _QWORD v19[4];
  int8x16_t v20;
  uint64_t v21;
  uint8_t buf[4];
  os_signpost_id_t v23;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshCompletion", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshCompletion"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_278;
  v19[3] = &unk_1002B18E0;
  v18 = *(int8x16_t *)(a1 + 32);
  v8 = (id)v18.i64[0];
  v20 = vextq_s8(v18, v18, 8uLL);
  v21 = *(_QWORD *)(a1 + 72);
  v9 = objc_retainBlock(v19);
  objc_msgSend(*(id *)(a1 + 40), "_scheduleSendBarrierBlock:", v9);
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 80);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v13, "XPCRefreshCompletion", ", buf, 2u);
  }

  -[MOPerformanceMeasurement endSession](v6, "endSession");
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 80);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 134349056;
    v23 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v17, "momentsd_XPCRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_278(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventManager"));
  objc_msgSend(v2, "clearCache");

  objc_msgSend(*(id *)(a1 + 40), "cancel");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_279(uint64_t a1)
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
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshNotificationService", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshNotificationService"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsManager"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_282;
  v14 = &unk_1002B1A70;
  v8 = *(_QWORD *)(a1 + 48);
  v15 = v6;
  v16 = v8;
  v9 = v6;
  objc_msgSend(v7, "serviceSuggestionsNotificationsWithHandler:", &v11);

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalQueue", v11, v12, v13, v14));
  dispatch_async(v10, *(dispatch_block_t *)(a1 + 40));

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_282(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  id v11;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Notification scheduling complete, error: %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "XPCRefreshNotificationService", ", (uint8_t *)&v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_283(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  MOPerformanceMeasurement *v12;
  _QWORD v13[4];
  MOPerformanceMeasurement *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshDataDump", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshDataDump"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v7 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_286;
  v13[3] = &unk_1002B1AC0;
  v18 = v7;
  v14 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v12 = v6;
  objc_msgSend(v9, "_checkElegibilityAndRequestDataExportForTrigger:withFeedback:requestUpload:refreshVariant:context:reply:", 2, 0, 1, v7, v8, v13);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_286(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, v5, "XPCRefreshDataDump", ", v9, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v6 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_286_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "pet");
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
  dispatch_async(v8, *(dispatch_block_t *)(a1 + 56));

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_288(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  MOPerformanceMeasurement *v12;
  _QWORD v13[4];
  MOPerformanceMeasurement *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshBundleEvents", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshBundleEvents"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v8 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_291;
  v13[3] = &unk_1002B1AE8;
  v9 = *(_QWORD *)(a1 + 80);
  v19 = *(_QWORD *)(a1 + 72);
  v20 = v9;
  v14 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v21 = *(_BYTE *)(a1 + 88);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v12 = v6;
  objc_msgSend(v8, "_bundleEventsWithContext:andRefreshVariant:andHandler:", v7, v9, v13);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_291(uint64_t a1, void *a2)
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
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_block_t *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  __int16 v24[8];
  uint8_t buf[16];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 80);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "XPCRefreshBundleEvents", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v12 = v10;
  else
    v12 = v3;
  objc_storeStrong(v9, v12);
  objc_msgSend(*(id *)(a1 + 40), "pet");
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v24[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Refresh: All completed!", (uint8_t *)v24, 2u);
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_291_cold_2();

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
    v18 = (dispatch_block_t *)(a1 + 56);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "defaultsManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("EventRefreshSchedulerLastSuccessfulTrigger"));

    v21 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_291_cold_1();

    v23 = *(unsigned __int8 *)(a1 + 88);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
    v18 = (dispatch_block_t *)(a1 + 64);
    if (v23)
      v18 = (dispatch_block_t *)(a1 + 56);
  }
  dispatch_async(v17, *v18);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_292(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  MOPerformanceMeasurement *v12;
  _QWORD v13[4];
  MOPerformanceMeasurement *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshAnalytics", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshAnalytics"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v8 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_295;
  v13[3] = &unk_1002B1B38;
  v9 = *(_QWORD *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = v9;
  v14 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v12 = v6;
  objc_msgSend(v8, "_runAnalyticsWithContext:andRefreshVariant:andHandler:", v7, v9, v13);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_295(uint64_t a1, void *a2)
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
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v14[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "XPCRefreshAnalytics", ", (uint8_t *)v14, 2u);
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
  objc_msgSend(*(id *)(a1 + 40), "pet");
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
  dispatch_async(v13, *(dispatch_block_t *)(a1 + 56));

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_296(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  MOPerformanceMeasurement *v12;
  _QWORD v13[4];
  MOPerformanceMeasurement *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 88);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshCollect", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshCollect"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v8 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_299;
  v13[3] = &unk_1002B1B88;
  v9 = *(_QWORD *)(a1 + 88);
  v20 = *(_QWORD *)(a1 + 80);
  v21 = v9;
  v14 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v22 = *(_BYTE *)(a1 + 96);
  v18 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 72);
  v12 = v6;
  objc_msgSend(v8, "_collectEventsWithContext:andRefreshVariant:andHandler:", v7, v9, v13);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_299(uint64_t a1, void *a2)
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
  int v15;
  NSObject *v16;
  dispatch_block_t *v17;
  id v18;
  NSObject *v19;
  __int16 v20[8];

  v4 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 88);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v20[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v8, "XPCRefreshCollect", ", (uint8_t *)v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v12 = *(void **)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v11 = v12;
  if (v12)
    v13 = v11;
  else
    v13 = v4;
  objc_storeStrong(v10, v13);
  objc_msgSend(*(id *)(a1 + 40), "pet");
  if (v4
    && ((objc_msgSend(v4, "code") & 0x400) != 0 || objc_msgSend(v4, "code") == (id)22)
    && (v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain")),
        v14,
        v14 == CFSTR("MOErrorDomain")))
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_299_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a2);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
    v17 = (dispatch_block_t *)(a1 + 56);
  }
  else
  {
    v15 = *(unsigned __int8 *)(a1 + 96);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
    v17 = (dispatch_block_t *)(a1 + 72);
    if (v15)
      v17 = (dispatch_block_t *)(a1 + 64);
  }
  dispatch_async(v16, *v17);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_300(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  MOPerformanceMeasurement *v12;
  _QWORD v13[4];
  MOPerformanceMeasurement *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshPurge", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshPurge"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v8 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_303;
  v13[3] = &unk_1002B1B38;
  v9 = *(_QWORD *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = v9;
  v14 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v12 = v6;
  objc_msgSend(v8, "_purgeEventsWithContext:andRefreshVariant:andHandler:", v7, v9, v13);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_303(uint64_t a1, void *a2)
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
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v14[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "XPCRefreshPurge", ", (uint8_t *)v14, 2u);
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
  objc_msgSend(*(id *)(a1 + 40), "pet");
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
  dispatch_async(v13, *(dispatch_block_t *)(a1 + 56));

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_304(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  MOPerformanceMeasurement *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  MOPerformanceMeasurement *v12;
  _QWORD v13[4];
  MOPerformanceMeasurement *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "XPCRefreshClearEvents", ", buf, 2u);
  }

  v6 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("XPCRefreshClearEvents"), 0);
  -[MOPerformanceMeasurement startSession](v6, "startSession");
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v8 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_307;
  v13[3] = &unk_1002B1B38;
  v9 = *(_QWORD *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = v9;
  v14 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v12 = v6;
  objc_msgSend(v8, "_clearEventsWithContext:andRefreshVariant:andHandler:", v7, v9, v13);

}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_307(uint64_t a1, void *a2)
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
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v14[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "XPCRefreshClearEvents", ", (uint8_t *)v14, 2u);
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
  objc_msgSend(*(id *)(a1 + 40), "pet");
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "internalQueue"));
  dispatch_async(v13, *(dispatch_block_t *)(a1 + 56));

}

- (void)checkElegibilityAndRequestDataExportForTrigger:(unint64_t)a3 withFeedback:(id)a4 requestUpload:(BOOL)a5 reply:(id)a6
{
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unsigned int v20;
  _QWORD v21[5];
  id v22;
  id v23;
  unint64_t v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  const __CFString *v28;

  v11 = a4;
  v12 = a6;
  v13 = NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v16));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v17);
  v28 = CFSTR("MOPromptManagerTest");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke;
  v26[3] = &unk_1002B1800;
  v19 = v12;
  v27 = v19;
  v20 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v18, v26);

  if (v20)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_2;
    v21[3] = &unk_1002B1C00;
    v21[4] = self;
    v24 = a3;
    v22 = v11;
    v25 = a5;
    v23 = v19;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v21, CFSTR("dataDumpWithFeedback"));

  }
}

uint64_t __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_3;
  v7[3] = &unk_1002B1BD8;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v2, "_checkElegibilityAndRequestDataExportForTrigger:withFeedback:requestUpload:refreshVariant:context:reply:", v5, v3, v4, 0, 0, v7);

}

id __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("dataDumpWithFeedback"));
}

- (void)_checkElegibilityAndRequestDataExportForTrigger:(unint64_t)a3 withFeedback:(id)a4 requestUpload:(BOOL)a5 refreshVariant:(unint64_t)a6 context:(id)a7 reply:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id os_log;
  NSObject *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MOEventBundleManager *eventBundleManager;
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  MODaemonClient *v33;
  id v34;
  _QWORD *v35;
  uint8_t buf[16];
  _QWORD v37[5];
  id v38;

  v11 = a5;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = objc_autoreleasePoolPush();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__18;
  v37[4] = __Block_byref_object_dispose__18;
  v38 = (id)os_transaction_create("com.apple.moments.daemon-client.data-dump", v18);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v20 = objc_claimAutoreleasedReturnValue(os_log);
  v30 = a3;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "dataDumpWithFeedback", buf, 2u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("DataUpload")));
  v22 = objc_opt_new(NSMutableDictionary);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringValue"));
  -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v24, CFSTR("kMORefreshVariant"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002D8F48, "stringValue"));
  -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v25, CFSTR("kMORefreshSource"));

  if (v15)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "xpcProcessName"));
    -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v26, CFSTR("kMORefreshClientContext"));

  }
  eventBundleManager = self->_eventBundleManager;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke;
  v31[3] = &unk_1002B1760;
  v28 = v21;
  v32 = v28;
  v29 = v16;
  v34 = v29;
  v35 = v37;
  v33 = self;
  -[MOEventBundleManager captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:](eventBundleManager, "captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:", v30, v14, v22, v11, v31);

  _Block_object_dispose(v37, 8);
  objc_autoreleasePoolPop(v17);

}

void __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void ***v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("kMODataDumpEnabled")));

  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    if (v5 || !v7)
    {
      v9 = 0;
      v10 = v5;
    }
    else
    {
      v9 = v6;
      v10 = 0;
    }
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v10);
  }
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke_2;
  v17 = &unk_1002B1738;
  v11 = *(id *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 56);
  v18 = v11;
  v19 = v12;
  v13 = objc_retainBlock(&v14);
  objc_msgSend(*(id *)(a1 + 40), "_scheduleSendBarrierBlock:", v13, v14, v15, v16, v17);

}

void __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)getSnapshotDictionaryForAnalyticsWithHandler:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  const __CFString *v18;

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v18 = CFSTR("MOPromptManagerTest");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke;
  v16[3] = &unk_1002B1800;
  v12 = v5;
  v17 = v12;
  v13 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, v16);

  if (v13)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2;
    v14[3] = &unk_1002B0C18;
    v14[4] = self;
    v15 = v12;
    -[MODaemonClient scheduleInternalClientTask:withName:](self, "scheduleInternalClientTask:withName:", v14, CFSTR("getSnapshotDictionaryForAnalyticsWithHandler"));

  }
}

uint64_t __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_3;
  v4[3] = &unk_1002B1BD8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_getSnapshotDictionaryForAnalyticsWithHandler:", v4);

}

id __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("getSnapshotDictionaryForAnalyticsWithHandler"));
}

- (void)_getSnapshotDictionaryForAnalyticsWithHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSnapshotDictionaryForAnalytics"));

  v4[2](v4, v6, 0);
}

- (void)fetchPhotoAnalyticsMetricsWithContext:(id)a3 andHandler:(id)a4
{
  id v6;
  void (**v7)(id, NSMutableDictionary *, _QWORD);
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSNumber *v16;
  void *v17;
  int v18;
  void *v19;

  v6 = a3;
  v7 = (void (**)(id, NSMutableDictionary *, _QWORD))a4;
  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("FetchPhotoAnlytics")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "run analytics", (uint8_t *)&v18, 2u);
  }

  v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcProcessName"));
    v18 = 138412290;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "photo analytics XPC context [%@]", (uint8_t *)&v18, 0xCu);

  }
  v15 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setValue:forKey:](v15, "setValue:forKey:", CFSTR("1.0.1"), CFSTR("version"));
  v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", arc4random_uniform(0x4Au));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setValue:forKey:](v15, "setValue:forKey:", v17, CFSTR("seed"));

  v7[2](v7, v15, 0);
  objc_msgSend(v9, "cancel");

  objc_autoreleasePoolPop(v8);
}

- (void)isAllowedToPromptResourceType:(unint64_t)a3 withReply:(id)a4
{
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned int v15;
  _QWORD v16[4];
  id v17;
  const __CFString *v18;

  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v11));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v12);
  v18 = CFSTR("MOReadPermissions");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __58__MODaemonClient_isAllowedToPromptResourceType_withReply___block_invoke;
  v16[3] = &unk_1002B1800;
  v14 = v7;
  v17 = v14;
  v15 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v13, v16);

  if (v15)
    -[MODaemonClient _isAllowedToPromptResourceType:withReply:](self, "_isAllowedToPromptResourceType:withReply:", a3, v14);

}

uint64_t __58__MODaemonClient_isAllowedToPromptResourceType_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_isAllowedToPromptResourceType:(unint64_t)a3 withReply:(id)a4
{
  void (**v6)(id, _BOOL8, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  id os_log;
  NSObject *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void ***v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;

  v6 = (void (**)(id, _BOOL8, _QWORD))a4;
  v7 = objc_autoreleasePoolPush();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__18;
  v26 = (id)os_transaction_create("com.apple.moments.daemon-client.is-allowed-resource", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("IsAllowedToPromptResourceType")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "isAllowedToPrompt resource category %@", buf, 0xCu);

  }
  v13 = -[MOConfigurationManager isAllowedToPromptResourceType:](self->_configManager, "isAllowedToPromptResourceType:", a3);
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
    *(_DWORD *)buf = 138412290;
    v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "isAllowedToPrompt result: %@", buf, 0xCu);

  }
  v6[2](v6, v13, 0);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = __59__MODaemonClient__isAllowedToPromptResourceType_withReply___block_invoke;
  v22 = &unk_1002B1738;
  v17 = v9;
  v23 = v17;
  v24 = v25;
  v18 = objc_retainBlock(&v19);
  -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v18, v19, v20, v21, v22);

  _Block_object_dispose(v25, 8);
  objc_autoreleasePoolPop(v7);

}

void __59__MODaemonClient__isAllowedToPromptResourceType_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)isAllowedToPromptEventCategory:(unint64_t)a3 withReply:(id)a4
{
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned int v15;
  _QWORD v16[4];
  id v17;
  const __CFString *v18;

  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v11));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v12);
  v18 = CFSTR("MOReadPermissions");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __59__MODaemonClient_isAllowedToPromptEventCategory_withReply___block_invoke;
  v16[3] = &unk_1002B1800;
  v14 = v7;
  v17 = v14;
  v15 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v13, v16);

  if (v15)
    -[MODaemonClient _isAllowedToPromptEventCategory:withReply:](self, "_isAllowedToPromptEventCategory:withReply:", a3, v14);

}

uint64_t __59__MODaemonClient_isAllowedToPromptEventCategory_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_isAllowedToPromptEventCategory:(unint64_t)a3 withReply:(id)a4
{
  void (**v6)(id, _BOOL8, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  id os_log;
  NSObject *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void ***v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;

  v6 = (void (**)(id, _BOOL8, _QWORD))a4;
  v7 = objc_autoreleasePoolPush();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__18;
  v26 = (id)os_transaction_create("com.apple.moments.daemon-client.is-allowed-event", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("IsAllowedToPromptEventCategory")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "isAllowedToPrompt event category %@", buf, 0xCu);

  }
  v13 = -[MOConfigurationManager isAllowedToPromptEventCategory:](self->_configManager, "isAllowedToPromptEventCategory:", a3);
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
    *(_DWORD *)buf = 138412290;
    v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "isAllowedToPrompt result: %@", buf, 0xCu);

  }
  v6[2](v6, v13, 0);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = __60__MODaemonClient__isAllowedToPromptEventCategory_withReply___block_invoke;
  v22 = &unk_1002B1738;
  v17 = v9;
  v23 = v17;
  v24 = v25;
  v18 = objc_retainBlock(&v19);
  -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v18, v19, v20, v21, v22);

  _Block_object_dispose(v25, 8);
  objc_autoreleasePoolPop(v7);

}

void __60__MODaemonClient__isAllowedToPromptEventCategory_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)logEngagementEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v15));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v16);
  v19 = CFSTR("MOLogEngagement");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v18 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v17, &__block_literal_global_330);

  if (v18)
    -[MODaemonClient _logEngagementEvent:timestamp:withContext:](self, "_logEngagementEvent:timestamp:withContext:", v9, v10, v11);

}

void __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);

}

- (void)_logEngagementEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MOEngagementHistoryManager *v17;
  id os_log;
  NSObject *v19;
  id v20;
  NSObject *v21;
  MOEventBundleFetchOptions *v22;
  MOEventBundleManager *eventBundleManager;
  NSObject *v24;
  void *context;
  id v26;
  _QWORD block[4];
  MOEventBundleFetchOptions *v28;
  MOEngagementHistoryManager *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  MOEngagementHistoryManager *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  MODaemonClient *v44;
  _QWORD *v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;

  v8 = a3;
  v26 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getTrialExperimentIdentifiers"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getSnapshotDictionaryForAnalytics"));

  context = objc_autoreleasePoolPush();
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__18;
  v46[4] = __Block_byref_object_dispose__18;
  v47 = (id)os_transaction_create("com.apple.moments.daemon-client.log-engagement", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("logEngagementEvent")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("eventBundles")));
  v17 = self->_engagementHistoryManager;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Trial id: %@", buf, 0xCu);
  }

  v20 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v8;
    v50 = 2112;
    v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "logEngagementEvent %@ for bundles: '%@'", buf, 0x16u);
  }

  if (v16)
  {
    v22 = -[MOEventBundleFetchOptions initWithIdentifiers:ascending:filterBundle:]([MOEventBundleFetchOptions alloc], "initWithIdentifiers:ascending:filterBundle:", v16, 0, 0);
    eventBundleManager = self->_eventBundleManager;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke;
    v36[3] = &unk_1002B1C70;
    v37 = v15;
    v38 = v17;
    v39 = v8;
    v40 = v26;
    v41 = v9;
    v42 = v11;
    v43 = v13;
    v44 = self;
    v45 = v46;
    -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:](eventBundleManager, "fetchEventBundlesWithOptions:CompletionHandler:", v22, v36);

  }
  else
  {
    v24 = objc_claimAutoreleasedReturnValue(-[MODaemonClient internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_336;
    block[3] = &unk_1002B1C98;
    v28 = v15;
    v29 = v17;
    v30 = v8;
    v31 = v26;
    v32 = v9;
    v33 = v11;
    v34 = v13;
    v35 = v46;
    dispatch_async(v24, block);

    v22 = v28;
  }

  _Block_object_dispose(v46, 8);
  objc_autoreleasePoolPop(context);

}

void __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "pet");
  v10 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 40), "didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:", *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 32), "pet");
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("suggestionsSelected")) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("suggestionsQuickAddEntry")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("suggestionsDeleted")))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Selected, quick add, or deleted engagement logged; trigger notification servicing",
        buf,
        2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "notificationsManager"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_335;
    v18[3] = &unk_1002B1C48;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 96);
    v19 = v14;
    v20 = v15;
    objc_msgSend(v13, "serviceSuggestionsNotificationsWithHandler:", v18);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

  }
}

void __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_335(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Notification scheduling complete, error: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_336(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "pet");
  objc_msgSend(*(id *)(a1 + 40), "didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)logPerformanceEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  const __CFString *v14;

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v14 = CFSTR("MOLogPerformance");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  LODWORD(self) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, &__block_literal_global_337);

  if ((_DWORD)self)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MODaemonClient logPerformanceEvent:timestamp:withContext:].cold.1();

  }
}

void __60__MODaemonClient_logPerformanceEvent_timestamp_withContext___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);

}

- (void)logUsageEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  const __CFString *v14;

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v14 = CFSTR("MOLogUsage");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  LODWORD(self) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, &__block_literal_global_338);

  if ((_DWORD)self)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MODaemonClient logUsageEvent:timestamp:withContext:].cold.1();

  }
}

void __54__MODaemonClient_logUsageEvent_timestamp_withContext___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);

}

- (void)didAppEntryUpdateUsingSuggestions:(id)a3 onEvent:(unint64_t)a4 duringInterval:(id)a5 withInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  MOEngagementHistoryManager *v25;
  id os_log;
  NSObject *v27;
  void *v28;
  void *v29;
  MOEventBundleFetchOptions *v30;
  MOEventBundleManager *eventBundleManager;
  void *v32;
  void *context;
  void *v34;
  _QWORD v35[4];
  id v36;
  MOEngagementHistoryManager *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  const __CFString *v50;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v17));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v18);
  v50 = CFSTR("MOAppEntryEngagement");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  LODWORD(v16) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v19, &__block_literal_global_339);

  if ((_DWORD)v16)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getTrialExperimentIdentifiers"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getSnapshotDictionaryForAnalytics"));

    context = objc_autoreleasePoolPush();
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__18;
    v48 = __Block_byref_object_dispose__18;
    v49 = (id)os_transaction_create("com.apple.moments.daemon-client.updated-app-entry", v23);
    v24 = v11;
    v25 = self->_engagementHistoryManager;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v27 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[MODaemonClient didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.1((uint64_t)v24, a4, v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("didAppEntryUpdateUsingSuggestions")));
    v29 = v28;
    if (v24)
    {
      v30 = -[MOEventBundleFetchOptions initWithIdentifiers:ascending:filterBundle:]([MOEventBundleFetchOptions alloc], "initWithIdentifiers:ascending:filterBundle:", v24, 0, 0);
      eventBundleManager = self->_eventBundleManager;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = __84__MODaemonClient_didAppEntryUpdateUsingSuggestions_onEvent_duringInterval_withInfo___block_invoke_343;
      v35[3] = &unk_1002B1D20;
      v36 = v29;
      v37 = v25;
      v43 = a4;
      v38 = v12;
      v39 = v13;
      v40 = v34;
      v41 = v22;
      v42 = &v44;
      -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:](eventBundleManager, "fetchEventBundlesWithOptions:CompletionHandler:", v30, v35);

    }
    else
    {
      objc_msgSend(v28, "pet");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[MOEngagementHistoryManager didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:](v25, "didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:", a4, 0, v32, v12, v13, v34, v22, context);

      objc_msgSend(v29, "cancel");
      v30 = (MOEventBundleFetchOptions *)v45[5];
      v45[5] = 0;
    }

    _Block_object_dispose(&v44, 8);
    objc_autoreleasePoolPop(context);

  }
}

void __84__MODaemonClient_didAppEntryUpdateUsingSuggestions_onEvent_duringInterval_withInfo___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);

}

void __84__MODaemonClient_didAppEntryUpdateUsingSuggestions_onEvent_duringInterval_withInfo___block_invoke_343(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "pet");
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v5, "didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:", v6, v4, v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)getDiagnosticReporterConfiguration:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v16[0] = CFSTR("MOPromptManagerTest");
  v16[1] = CFSTR("MOOnboardingAndSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __53__MODaemonClient_getDiagnosticReporterConfiguration___block_invoke;
  v14[3] = &unk_1002B1800;
  v12 = v5;
  v15 = v12;
  v13 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, v14);

  if (v13)
    -[MODaemonClient _getDiagnosticReporterConfiguration:](self, "_getDiagnosticReporterConfiguration:", v12);

}

void __53__MODaemonClient_getDiagnosticReporterConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v3);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

- (void)_getDiagnosticReporterConfiguration:(id)a3
{
  uint64_t v4;
  id os_log;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  _QWORD *v23;
  void *context;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(id, void *, _QWORD);
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  uint8_t buf[16];
  _QWORD v41[5];
  id v42;
  _QWORD v43[9];
  _QWORD v44[9];

  v36 = (void (**)(id, void *, _QWORD))a3;
  context = objc_autoreleasePoolPush();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__18;
  v41[4] = __Block_byref_object_dispose__18;
  v42 = (id)os_transaction_create("com.apple.moments.daemon-client.diagnostic-reporter-configuration", v4);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "getDiagnosticReporterConfiguration", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v8 = objc_msgSend(v7, "getBoolSettingForKey:withFallback:", CFSTR("BundlingDataCollectionEnabled"), 0);

  v25 = v8;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("GetDiagnosticReporterConfiguration")));
  v43[0] = CFSTR("DiagnosticReporterRefractoryPeriodAfterAcceptance");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  LODWORD(v9) = 1202241536;
  objc_msgSend(v35, "getFloatSettingForKey:withFallback:", CFSTR("DiagnosticReporterOverrideRefractoryPeriodAfterAcceptance"), v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v44[0] = v34;
  v43[1] = CFSTR("DiagnosticReporterRefractoryPeriodAfterRejection");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  LODWORD(v10) = 1185464320;
  objc_msgSend(v33, "getFloatSettingForKey:withFallback:", CFSTR("DiagnosticReporterOverrideRefractoryPeriodAfterRejection"), v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v44[1] = v32;
  v43[2] = CFSTR("DiagnosticReporterAvoidNotification");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v31, "getBoolSettingForKey:withFallback:", CFSTR("DiagnosticReporterOverrideAvoidNotification"), 0)));
  v44[2] = v30;
  v43[3] = CFSTR("DiagnosticReporterForceNotification");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v29, "getBoolSettingForKey:withFallback:", CFSTR("DiagnosticReporterOverrideForceNotification"), 0)));
  v44[3] = v28;
  v43[4] = CFSTR("DiagnosticReporterTimeOfLastNotification");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  objc_msgSend(v11, "getDoubleSettingForKey:withFallback:", CFSTR("DiagnosticReporterLastIncidentTime"), 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v44[4] = v12;
  v43[5] = CFSTR("DiagnosticReporterIsInternalBuild");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild")));
  v44[5] = v13;
  v43[6] = CFSTR("DiagnosticReporterOnboardingStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "getOnboardingFlowCompletionStatus")));
  v44[6] = v15;
  v43[7] = CFSTR("DiagnosticReporterMaxTimeout");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v16, "getIntegerSettingForKey:withFallback:", CFSTR("DiagnosticReporterOverrideMaxTimeout"), 10)));
  v44[7] = v17;
  v43[8] = CFSTR("DiagnosticReporterIsOnboardedOnJournalStudy");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v18, "getBoolSettingForKey:withFallback:", CFSTR("DiagnosticReporterOverrideIsOnboardedOnJournalStudy"), v25)));
  v44[8] = v19;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 9));

  objc_msgSend(v27, "pet");
  if (v36)
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[MODaemonClient _getDiagnosticReporterConfiguration:].cold.1();

    v36[2](v36, v26, 0);
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __54__MODaemonClient__getDiagnosticReporterConfiguration___block_invoke;
  v37[3] = &unk_1002B1738;
  v22 = v27;
  v38 = v22;
  v39 = v41;
  v23 = objc_retainBlock(v37);
  -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v23);

  _Block_object_dispose(v41, 8);
  objc_autoreleasePoolPop(context);

}

void __54__MODaemonClient__getDiagnosticReporterConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)getApplicationsWithDataAccess:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v16[0] = CFSTR("MOPromptManagerTest");
  v16[1] = CFSTR("MOOnboardingAndSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __48__MODaemonClient_getApplicationsWithDataAccess___block_invoke;
  v14[3] = &unk_1002B1800;
  v12 = v5;
  v15 = v12;
  v13 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, v14);

  if (v13)
    -[MODaemonClient _getApplicationsWithDataAccess:](self, "_getApplicationsWithDataAccess:", v12);

}

void __48__MODaemonClient_getApplicationsWithDataAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v3);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

- (void)_getApplicationsWithDataAccess:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MODaemonClient dataAccessManager](self, "dataAccessManager"));
  objc_msgSend(v5, "getApplicationsWithDataAccess:", v4);

}

- (void)registerApplicationsForDataAccess:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _QWORD v13[2];

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v13[0] = CFSTR("MOPromptManagerTest");
  v13[1] = CFSTR("MOOnboardingAndSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v12 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, &__block_literal_global_363);

  if (v12)
    -[MODaemonClient _registerApplicationsForDataAccess:](self, "_registerApplicationsForDataAccess:", v5);

}

void __52__MODaemonClient_registerApplicationsForDataAccess___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);

}

- (void)_registerApplicationsForDataAccess:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MODaemonClient dataAccessManager](self, "dataAccessManager"));
  objc_msgSend(v5, "registerApplicationsForDataAccess:", v4);

}

- (void)getClientsWithDataAccess:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v16[0] = CFSTR("MOPromptManagerTest");
  v16[1] = CFSTR("MOOnboardingAndSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __43__MODaemonClient_getClientsWithDataAccess___block_invoke;
  v14[3] = &unk_1002B1800;
  v12 = v5;
  v15 = v12;
  v13 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, v14);

  if (v13)
    -[MODaemonClient _getClientsWithDataAccess:](self, "_getClientsWithDataAccess:", v12);

}

void __43__MODaemonClient_getClientsWithDataAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v3);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

- (void)_getClientsWithDataAccess:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MODaemonClient dataAccessManager](self, "dataAccessManager"));
  objc_msgSend(v5, "getClientsWithDataAccess:", v4);

}

- (void)registerClientsForDataAccess:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _QWORD v13[2];

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v13[0] = CFSTR("MOPromptManagerTest");
  v13[1] = CFSTR("MOOnboardingAndSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v12 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, &__block_literal_global_364);

  if (v12)
    -[MODaemonClient _registerClientsForDataAccess:](self, "_registerClientsForDataAccess:", v5);

}

void __47__MODaemonClient_registerClientsForDataAccess___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);

}

- (void)_registerClientsForDataAccess:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MODaemonClient dataAccessManager](self, "dataAccessManager"));
  objc_msgSend(v5, "registerClientsForDataAccess:", v4);

}

- (void)printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v15));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v16);
  v19 = CFSTR("MOPromptManagerTest");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v18 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v17, v11);

  if (v18)
    -[MODaemonClient _printSettingValue:withType:handler:](self, "_printSettingValue:withType:handler:", v9, v10, v11);

}

- (void)_printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id os_log;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  double v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "printSettingValue", (uint8_t *)&v27, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("PrintSettingValue")));
  if ((objc_msgSend(v9, "isEqual:", CFSTR("string")) & 1) != 0
    || objc_msgSend(v9, "isEqual:", CFSTR("str")))
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getStringSettingForKey:withFallback:", v8, &stru_1002B68D0));
      v27 = 138412802;
      v28 = v8;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "printSettingValue: name=%@, value=%@, type=%@", (uint8_t *)&v27, 0x20u);

    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("integer")) & 1) != 0
    || objc_msgSend(v9, "isEqual:", CFSTR("int")))
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v15 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "getIntegerSettingForKey:withFallback:", v8, 0)));
    v27 = 138412802;
    v28 = v8;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v9;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "printSettingValue: name=%@, value=%@, type=%@", (uint8_t *)&v27, 0x20u);

    goto LABEL_16;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("BOOLean")) & 1) != 0
    || objc_msgSend(v9, "isEqual:", CFSTR("BOOL")))
  {
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v15 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v19, "getBoolSettingForKey:withFallback:", v8, 0)));
    v27 = 138412802;
    v28 = v8;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v9;
    goto LABEL_15;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("float")))
  {
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v15 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
    LODWORD(v23) = 0;
    objc_msgSend(v19, "getFloatSettingForKey:withFallback:", v8, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v27 = 138412802;
    v28 = v8;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v9;
    goto LABEL_15;
  }
  v24 = objc_msgSend(v9, "isEqual:", CFSTR("double"));
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  v15 = v26;
  if (v24)
  {
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient configManager](self, "configManager"));
    objc_msgSend(v19, "getDoubleSettingForKey:withFallback:", v8, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v27 = 138412802;
    v28 = v8;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v9;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[MODaemonClient _printSettingValue:withType:handler:].cold.1();
LABEL_16:

  objc_msgSend(v13, "pet");
  v10[2](v10, 0);

  objc_msgSend(v13, "cancel");
}

- (void)printOnboardingStatusAnalytics:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v13 = CFSTR("MOPromptManagerTest");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v12 = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, v5);

  if (v12)
    -[MODaemonClient _printOnboardingStatusAnalytics:](self, "_printOnboardingStatusAnalytics:", v5);

}

- (void)_printOnboardingStatusAnalytics:(id)a3
{
  void (**v4)(id, _QWORD);
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, _QWORD))a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "printOnboardingStatusAnalytics", v9, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient _createWatchDogWithName:](self, "_createWatchDogWithName:", CFSTR("PrintOnboardingStatusAnalytics")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
  objc_msgSend(v8, "publishOnboardingStatusAnalytics");

  objc_msgSend(v7, "pet");
  v4[2](v4, 0);

  objc_msgSend(v7, "cancel");
}

- (void)printEvergreenBundlesWithSeed:(unint64_t)a3 handler:(id)a4
{
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id os_log;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  const __CFString *v28;

  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v11));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v12);
  v28 = CFSTR("MOFetchEventBundles");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke;
  v26[3] = &unk_1002B1800;
  v14 = v7;
  v27 = v14;
  LODWORD(v10) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v13, v26);

  if ((_DWORD)v10)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__18;
    v24[4] = __Block_byref_object_dispose__18;
    v25 = (id)os_transaction_create("com.apple.momentsd", v15);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[MODaemonClient printEvergreenBundlesWithSeed:handler:].cold.1();

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient evergreenManager](self, "evergreenManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke_388;
    v21[3] = &unk_1002B1D88;
    v22 = v14;
    v23 = v24;
    objc_msgSend(v18, "performAnnotationWithSeed:startDate:endDate:handler:", a3, v19, v20, v21);

    _Block_object_dispose(v24, 8);
  }

}

uint64_t __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke_388(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 134218242;
    v12 = objc_msgSend(v5, "count");
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "evergreen annotation manager event bundles, %lu, error, %@", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

- (void)triggerFeedbackAssistantFlow:(id)a3 handler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  +[MOFeedbackAssistant triggerFeedbackAssistantFlowWithFlowIdentifier:](_TtC8momentsd19MOFeedbackAssistant, "triggerFeedbackAssistantFlowWithFlowIdentifier:", a3);
  v5[2](v5, 0);

}

- (void)getOnboardingFlowCompletionStatusWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  const __CFString *v21;

  v5 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__18;
  v19[4] = __Block_byref_object_dispose__18;
  v20 = (id)os_transaction_create("com.apple.moments.daemon-client.get-onboarding-status", v6);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v10));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v11);
  v21 = CFSTR("MOOnboardingAndSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke;
  v17[3] = &unk_1002B1800;
  v13 = v5;
  v18 = v13;
  LOBYTE(v9) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v12, v17);

  if ((v9 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    (*((void (**)(id, id))v13 + 2))(v13, objc_msgSend(v14, "getOnboardingFlowCompletionStatus"));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke_2;
    v16[3] = &unk_1002AF360;
    v16[4] = v19;
    v15 = objc_retainBlock(v16);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v15);

  }
  _Block_object_dispose(v19, 8);

}

uint64_t __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  const __CFString *v17;

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__18;
  v15[4] = __Block_byref_object_dispose__18;
  v16 = (id)os_transaction_create("com.apple.moments.daemon-client.set-onboarding-status", a2);
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v9));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v10);
  v17 = CFSTR("MOOnboardingAndSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  LOBYTE(v8) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v11, &__block_literal_global_392);

  if ((v8 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    objc_msgSend(v12, "setOnboardingFlowCompletionStatus:", a3);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __52__MODaemonClient_setOnboardingFlowCompletionStatus___block_invoke_2;
    v14[3] = &unk_1002AF360;
    v14[4] = v15;
    v13 = objc_retainBlock(v14);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v13);

  }
  _Block_object_dispose(v15, 8);

}

void __52__MODaemonClient_setOnboardingFlowCompletionStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)getOnboardingFlowRefreshCompletionStatusWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  const __CFString *v21;

  v5 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__18;
  v19[4] = __Block_byref_object_dispose__18;
  v20 = (id)os_transaction_create("com.apple.moments.daemon-client.get-onboarding-refresh-status", v6);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v10));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v11);
  v21 = CFSTR("MOOnboardingAndSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke;
  v17[3] = &unk_1002B1800;
  v13 = v5;
  v18 = v13;
  LOBYTE(v9) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v12, v17);

  if ((v9 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    (*((void (**)(id, id))v13 + 2))(v13, objc_msgSend(v14, "getOnboardingFlowRefreshCompletionStatus"));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2;
    v16[3] = &unk_1002AF360;
    v16[4] = v19;
    v15 = objc_retainBlock(v16);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v15);

  }
  _Block_object_dispose(v19, 8);

}

uint64_t __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)getStateForSetting:(unint64_t)a3 withHandler:(id)a4
{
  id v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  const __CFString *v23;

  v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__18;
  v21[4] = __Block_byref_object_dispose__18;
  v22 = (id)os_transaction_create("com.apple.moments.daemon-client.get-setting-status", v8);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v12));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v13);
  v23 = CFSTR("MOOnboardingAndSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __49__MODaemonClient_getStateForSetting_withHandler___block_invoke;
  v19[3] = &unk_1002B1800;
  v15 = v7;
  v20 = v15;
  LOBYTE(v11) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v14, v19);

  if ((v11 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    (*((void (**)(id, id))v15 + 2))(v15, objc_msgSend(v16, "getStateForSetting:", a3));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __49__MODaemonClient_getStateForSetting_withHandler___block_invoke_2;
    v18[3] = &unk_1002AF360;
    v18[4] = v21;
    v17 = objc_retainBlock(v18);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v17);

  }
  _Block_object_dispose(v21, 8);

}

uint64_t __49__MODaemonClient_getStateForSetting_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__MODaemonClient_getStateForSetting_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)getStateForSettingFast:(unint64_t)a3 withHandler:(id)a4
{
  id v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  const __CFString *v23;

  v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__18;
  v21[4] = __Block_byref_object_dispose__18;
  v22 = (id)os_transaction_create("com.apple.moments.daemon-client.get-setting-status", v8);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v12));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v13);
  v23 = CFSTR("MOOnboardingAndSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke;
  v19[3] = &unk_1002B1800;
  v15 = v7;
  v20 = v15;
  LOBYTE(v11) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v14, v19);

  if ((v11 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    (*((void (**)(id, id))v15 + 2))(v15, objc_msgSend(v16, "getStateForSettingFast:", a3));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke_2;
    v18[3] = &unk_1002AF360;
    v18[4] = v21;
    v17 = objc_retainBlock(v18);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v17);

  }
  _Block_object_dispose(v21, 8);

}

uint64_t __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  _BOOL8 v5;
  NSString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  const __CFString *v19;

  v5 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__18;
  v17[4] = __Block_byref_object_dispose__18;
  v18 = (id)os_transaction_create("com.apple.moments.daemon-client.set-setting-status", a2);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InterruptMethod_%@"), v11));
  -[MODaemonClient _abortIfNeeded:](self, "_abortIfNeeded:", v12);
  v19 = CFSTR("MOOnboardingAndSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  LOBYTE(v10) = -[MODaemonClient validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:](self, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:", v13, &__block_literal_global_396);

  if ((v10 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    objc_msgSend(v14, "setState:forSetting:", v5, a4);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __38__MODaemonClient_setState_forSetting___block_invoke_2;
    v16[3] = &unk_1002AF360;
    v16[4] = v17;
    v15 = objc_retainBlock(v16);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v15);

  }
  _Block_object_dispose(v17, 8);

}

void __38__MODaemonClient_setState_forSetting___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (id)_createWatchDogWithName:(id)a3
{
  MOConfigurationManager *configManager;
  id v5;
  void *v6;
  double v7;
  int v8;
  int v9;
  MOWatchDog *v10;
  double v11;
  MOWatchDog *v12;

  configManager = self->_configManager;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("WatchdogOverrideDefaultCadenceInSeconds"), v5));
  *(float *)&v7 = self->_watchdogCadence;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configManager, "getFloatSettingForKey:withFallback:", v6, v7);
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

- (MODaemonClientConnectionEntitlementDelegate)entitlementDelegate
{
  return (MODaemonClientConnectionEntitlementDelegate *)objc_loadWeakRetained((id *)&self->_entitlementDelegate);
}

- (void)setEntitlementDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_entitlementDelegate, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (NSLock)scheduledTaskLock
{
  return self->_scheduledTaskLock;
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
  objc_storeStrong((id *)&self->_configManager, a3);
}

- (MODataAccessManager)dataAccessManager
{
  return self->_dataAccessManager;
}

- (void)setDataAccessManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataAccessManager, a3);
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (MOEventBundleManager)eventBundleManager
{
  return self->_eventBundleManager;
}

- (void)setEventBundleManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleManager, a3);
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (void)setEngagementHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_engagementHistoryManager, a3);
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

- (MOEvergreenAnnotationManager)evergreenManager
{
  return self->_evergreenManager;
}

- (void)setEvergreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_evergreenManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evergreenManager, 0);
  objc_storeStrong((id *)&self->_notificationsManager, 0);
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_eventBundleManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataAccessManager, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_scheduledTaskLock, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_entitlementDelegate);
  objc_storeStrong((id *)&self->_notifier, 0);
}

- (void)initWithUniverse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
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

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_286_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Finished data dump if allowed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_291_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Refresh finished.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_291_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Refresh finished with error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_299_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Refresh: Exiting early due to errors in collect: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userInfo"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0((void *)&_mh_execute_header, v2, v3, "client entitlement error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)logPerformanceEvent:timestamp:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "logPerformanceEvent not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)logUsageEvent:timestamp:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "logUsageEvent not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)didAppEntryUpdateUsingSuggestions:(os_log_t)log onEvent:duringInterval:withInfo:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "didAppEntryUpdateUsingSuggestions event %lu was created for bundles: '%@'", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_getDiagnosticReporterConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Sending diagnostic reporter configuration %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_printSettingValue:withType:handler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "printSettingValue: could not understand requested setting name=%@, type=%@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)printEvergreenBundlesWithSeed:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "printEvergreenBundlesWithSeed, seed, %lu _test", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
