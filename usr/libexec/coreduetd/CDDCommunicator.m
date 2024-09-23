@implementation CDDCommunicator

- (CDDCommunicator)initWithCDDinstance:(id)a3
{
  id v5;
  CDDCommunicator *v6;
  CDDCommunicator *v7;
  id *p_cdd;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *daemonQueue;
  os_log_t v15;
  OS_os_log *log;
  uint64_t v17;
  NSMutableArray *scheduledForecastRequests;
  NSString *localFocalApp;
  id v20;
  NSObject *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *localNonAppsInFocus;
  NSDate *lastSystemExchange;
  NSMutableSet *v25;
  NSMutableSet *lastSentFocalNonFocalState;
  NSDictionary *registeredDevices;
  uint64_t v28;
  NSMutableDictionary *systemData;
  uint64_t v30;
  NSArray *focalAppWhitelist;
  void *v32;
  void *v33;
  int v34;
  CDDCommunicator *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  CDDCommControl *v39;
  CDDCommControl *control;
  NSObject *v41;
  CDDCommControl *v42;
  uint64_t v43;
  NSArray *exclusiveApps;
  uint64_t v45;
  NSArray *nonTrafficBundleID;
  objc_super v48;
  uint8_t buf[4];
  CDDCommControl *v50;

  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CDDCommunicator;
  v6 = -[CDDCommunicator init](&v48, "init");
  v7 = v6;
  if (!v6)
  {
    v35 = 0;
    goto LABEL_18;
  }
  p_cdd = (id *)&v6->cdd;
  objc_storeStrong((id *)&v6->cdd, a3);
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
  v12 = objc_claimAutoreleasedReturnValue(v11);

  v13 = dispatch_queue_create("com.apple.coreduetdCommDaemonQueue", v12);
  daemonQueue = v7->daemonQueue;
  v7->daemonQueue = (OS_dispatch_queue *)v13;

  v15 = os_log_create("com.apple.coreduet.admissionCheck", "communicator");
  log = v7->_log;
  v7->_log = (OS_os_log *)v15;

  v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  scheduledForecastRequests = v7->scheduledForecastRequests;
  v7->scheduledForecastRequests = (NSMutableArray *)v17;

  v7->localMinSupportedVersionNumber = 1;
  *(int64x2_t *)&v7->remoteVersionNumber = vdupq_n_s64(2uLL);
  localFocalApp = v7->localFocalApp;
  v7->localFocalApp = 0;

  v20 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  objc_msgSend(v20, "synchronize");
  v21 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    sub_100022D7C(v21);

  v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  localNonAppsInFocus = v7->localNonAppsInFocus;
  v7->localNonAppsInFocus = v22;

  lastSystemExchange = v7->lastSystemExchange;
  v7->lastSystemExchange = 0;

  v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  lastSentFocalNonFocalState = v7->lastSentFocalNonFocalState;
  v7->lastSentFocalNonFocalState = v25;

  v7->shouldTriggerDelayedMessage = 1;
  registeredDevices = v7->registeredDevices;
  v7->registeredDevices = 0;

  v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  systemData = v7->systemData;
  v7->systemData = (NSMutableDictionary *)v28;

  v30 = objc_claimAutoreleasedReturnValue(-[CDDCommunicator getStringArrayFromConfigurationPlist:](v7, "getStringArrayFromConfigurationPlist:", CFSTR("CDDCommFocalAppWhitelist")));
  focalAppWhitelist = v7->focalAppWhitelist;
  v7->focalAppWhitelist = (NSArray *)v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](v7->cdd, "config"));
  if ((int)objc_msgSend(v32, "commMinClientGranularity") <= 899)
  {

    goto LABEL_9;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_cdd, "config"));
  v34 = objc_msgSend(v33, "commSyncBoundarySeconds");

  if (v34 <= 3599)
  {
LABEL_9:
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_cdd, "config"));
    objc_msgSend(v36, "setCommMinClientGranularity:", 900);

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_cdd, "config"));
    objc_msgSend(v37, "setCommSyncBoundarySeconds:", 86400);

    v38 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "CDDCommunicator: sanitized configuration inputs.", buf, 2u);
    }

  }
  v39 = -[CDDCommControl initWithCommInstance:]([CDDCommControl alloc], "initWithCommInstance:", v7);
  control = v7->control;
  v7->control = v39;

  if (v7->control)
  {
    v41 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = v7->control;
      *(_DWORD *)buf = 134217984;
      v50 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "CDDCommunicator: control setup %p.", buf, 0xCu);
    }

    v43 = objc_claimAutoreleasedReturnValue(-[CDDCommunicator getStringArrayFromConfigurationPlist:](v7, "getStringArrayFromConfigurationPlist:", CFSTR("CDDCommExclusiveApps")));
    exclusiveApps = v7->exclusiveApps;
    v7->exclusiveApps = (NSArray *)v43;

    v45 = objc_claimAutoreleasedReturnValue(-[CDDCommunicator getStringArrayFromConfigurationPlist:](v7, "getStringArrayFromConfigurationPlist:", CFSTR("CDDCommNonTrafficBundleID")));
    nonTrafficBundleID = v7->nonTrafficBundleID;
    v7->nonTrafficBundleID = (NSArray *)v45;

    v35 = v7;
  }
  else
  {
    v35 = 0;
  }

LABEL_18:
  return v35;
}

- (void)setupCommControl
{
  OS_dispatch_queue *daemonQueue;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[CDDCommControl setupIDSLink](self->control, "setupIDSLink");
  daemonQueue = self->daemonQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013B9C;
  v8[3] = &unk_100038A70;
  v8[4] = self;
  v4 = v8;
  v5 = daemonQueue;
  v6 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019820;
  block[3] = &unk_100038A98;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  dispatch_async(v5, block);

}

- (void)registerForSystemConditionChanges
{
  _CDLocalContext *v3;
  _CDLocalContext *context;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _CDContextualChangeRegistration *v12;
  _CDContextualChangeRegistration *pluggedInRegistration;
  _CDContextualChangeRegistration *v14;
  _CDContextualChangeRegistration *batteryRegistration;
  _CDContextualChangeRegistration *v16;
  _CDContextualChangeRegistration *thermalRegistration;
  _CDContextualChangeRegistration *v18;
  _CDContextualChangeRegistration *applicationRegistration;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _CDContextualChangeRegistration *v25;
  _CDContextualChangeRegistration *networkRegistration;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[10];
  _QWORD v34[3];
  _QWORD v35[2];

  v3 = (_CDLocalContext *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  context = self->_context;
  self->_context = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForThermalPressureLevel](_CDContextQueries, "keyPathForThermalPressureLevel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForForegroundApp](_CDContextQueries, "keyPathForForegroundApp"));
  v35[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForServicesAppearingForeground](_CDContextQueries, "keyPathForServicesAppearingForeground"));
  v35[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPaths:](_CDContextualPredicate, "predicateForChangeAtKeyPaths:", v10));

  v33[5] = _NSConcreteStackBlock;
  v33[6] = 3221225472;
  v33[7] = sub_100013FA8;
  v33[8] = &unk_100038CF0;
  v33[9] = self;
  v12 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.cddcommunicator.pluginChanged"), v29));
  pluggedInRegistration = self->_pluggedInRegistration;
  self->_pluggedInRegistration = v12;

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100013FF4;
  v33[3] = &unk_100038CF0;
  v33[4] = self;
  v14 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.cddcommunicator.batteryChanged"), v28, CFSTR("com.apple.coreduetd.CDDCommunicator"), v33));
  batteryRegistration = self->_batteryRegistration;
  self->_batteryRegistration = v14;

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100014078;
  v32[3] = &unk_100038CF0;
  v32[4] = self;
  v16 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.cddcommunicator.thermalChanged"), v27, CFSTR("com.apple.coreduetd.CDDCommunicator"), v32));
  thermalRegistration = self->_thermalRegistration;
  self->_thermalRegistration = v16;

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000140C4;
  v31[3] = &unk_100038CF0;
  v31[4] = self;
  v18 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.cddcommunicator.appChanged"), v11, CFSTR("com.apple.coreduetd.CDDCommunicator"), v31));
  applicationRegistration = self->_applicationRegistration;
  self->_applicationRegistration = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality"));
  v34[0] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality"));
  v34[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality"));
  v34[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 3));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPaths:](_CDContextualPredicate, "predicateForChangeAtKeyPaths:", v23));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000140CC;
  v30[3] = &unk_100038CF0;
  v30[4] = self;
  v25 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.cddcommunicator.nwchanged"), v24, CFSTR("com.apple.coreduetd.CDDCommunicator"), v30));
  networkRegistration = self->_networkRegistration;
  self->_networkRegistration = v25;

  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", self->_networkRegistration);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", self->_pluggedInRegistration);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", self->_batteryRegistration);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", self->_thermalRegistration);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", self->_applicationRegistration);

}

- (void)deregisterForSystemConditionChanges
{
  -[_CDLocalContext deregisterCallback:](self->_context, "deregisterCallback:", self->_pluggedInRegistration);
  -[_CDLocalContext deregisterCallback:](self->_context, "deregisterCallback:", self->_batteryRegistration);
  -[_CDLocalContext deregisterCallback:](self->_context, "deregisterCallback:", self->_thermalRegistration);
  -[_CDLocalContext deregisterCallback:](self->_context, "deregisterCallback:", self->_applicationRegistration);
  -[_CDLocalContext deregisterCallback:](self->_context, "deregisterCallback:", self->_networkRegistration);
}

- (id)getDictionaryFromConfigurationPlist:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDConfigurationBundlePath](CDDPaths, "CDDConfigurationBundlePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v4));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDConfigurationBundlePathDefault](CDDPaths, "CDDConfigurationBundlePathDefault"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v6));

    v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (!v5)
    {
      if (v8)
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no bundle found in path default", (uint8_t *)&v16, 2u);
      }
      v5 = 0;
      goto LABEL_16;
    }
    if (v8)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "loaded bundle in default path", (uint8_t *)&v16, 2u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForInfoDictionaryKey:", v3));
  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  v10 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v10)
    {
      v14 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v16 = 136315138;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no array of strings for key %s found in configuration plist", (uint8_t *)&v16, 0xCu);
    }
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  if (v10)
  {
    v11 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    v16 = 136315138;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found dict for key %s in configuration plist:", (uint8_t *)&v16, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
    v13 = objc_msgSend(v12, "UTF8String");
    v16 = 136315138;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found dict content in plist: %s", (uint8_t *)&v16, 0xCu);

  }
LABEL_17:

  return v9;
}

- (id)getStringArrayFromConfigurationPlist:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v18;
  id v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDConfigurationBundlePath](CDDPaths, "CDDConfigurationBundlePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v4));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDConfigurationBundlePathDefault](CDDPaths, "CDDConfigurationBundlePathDefault"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v6));

    v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (!v5)
    {
      if (v8)
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no bundle found in path default", (uint8_t *)&v18, 2u);
      }
      v5 = 0;
      goto LABEL_16;
    }
    if (v8)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "loaded bundle in default path", (uint8_t *)&v18, 2u);
    }

  }
  v9 = objc_alloc((Class)NSArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForInfoDictionaryKey:", v3));
  v11 = objc_msgSend(v9, "initWithArray:", v10);

  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  v12 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v12)
    {
      v16 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v18 = 136315138;
      v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no array of strings for key %s found in configuration plist", (uint8_t *)&v18, 0xCu);
    }
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  if (v12)
  {
    v13 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    v18 = 136315138;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found array of strings for key %s in configuration plist:", (uint8_t *)&v18, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description")));
    v15 = objc_msgSend(v14, "UTF8String");
    v18 = 136315138;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found whitelisted array in plist: %s", (uint8_t *)&v18, 0xCu);

  }
LABEL_17:

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray enumerateObjectsUsingBlock:](self->scheduledForecastRequests, "enumerateObjectsUsingBlock:", &stru_100038D30);
  v3.receiver = self;
  v3.super_class = (Class)CDDCommunicator;
  -[CDDCommunicator dealloc](&v3, "dealloc");
}

- (double)currentBatteryLevel
{
  _CDLocalContext *context;
  void *v3;
  void *v4;
  double v5;
  double v6;

  context = self->_context;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (BOOL)isPluggedIn
{
  _CDLocalContext *context;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  context = self->_context;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (int)thermalPressureLevel
{
  _CDLocalContext *context;
  void *v3;
  void *v4;
  int v5;

  context = self->_context;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForThermalPressureLevel](_CDContextQueries, "keyPathForThermalPressureLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));
  v5 = objc_msgSend(v4, "intValue");

  return v5;
}

- (id)currentFocalApplication
{
  _CDLocalContext *context;
  void *v3;
  void *v4;

  context = self->_context;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForForegroundApp](_CDContextQueries, "keyPathForForegroundApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));

  return v4;
}

- (BOOL)itemsDifferIn:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            if (!objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15))
            {
              v13 = 0;
              goto LABEL_14;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v10)
            continue;
          break;
        }
      }
      v13 = 1;
LABEL_14:

    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)appsDifferBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if ((!v5 || v6) && (v5 || !v6))
    v8 = objc_msgSend(v5, "isEqualToString:", v6) ^ 1;
  else
    LOBYTE(v8) = 1;

  return v8;
}

- (id)currentFocalNonApps
{
  _CDLocalContext *context;
  void *v3;
  void *v4;

  context = self->_context;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForServicesAppearingForeground](_CDContextQueries, "keyPathForServicesAppearingForeground"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));

  return v4;
}

- (void)handleAppStateChanged
{
  void *v3;
  void *v4;
  NSObject *log;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  CDDCommunicator *v11;
  void *v12;
  uint64_t v13;
  int v14;
  _BYTE v15[10];
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator currentFocalApplication](self, "currentFocalApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator lastFocalApp](self, "lastFocalApp"));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    *(_QWORD *)v15 = v3;
    *(_WORD *)&v15[8] = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Focal App: %@, Previous: %@", (uint8_t *)&v14, 0x16u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator currentFocalNonApps](self, "currentFocalNonApps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator lastFocalNonApps](self, "lastFocalNonApps"));
  v8 = -[CDDCommunicator appsDifferBetween:and:](self, "appsDifferBetween:and:", v3, v4);
  if (v7)
    v9 = -[CDDCommunicator itemsDifferIn:and:](self, "itemsDifferIn:and:", v6, v7);
  else
    v9 = 1;
  v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109376;
    *(_DWORD *)v15 = v8;
    *(_WORD *)&v15[4] = 1024;
    *(_DWORD *)&v15[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Apps Differ: %u, Non-Apps Differ: %u", (uint8_t *)&v14, 0xEu);
  }
  if (((v8 ^ 1 | v9) & 1) != 0)
  {
    if (((v8 | v9 ^ 1) & 1) != 0)
    {
      if (v3 && (objc_msgSend(v3, "isEqualToString:", &stru_100039CD0) & 1) == 0)
      {
        v11 = self;
        v12 = v3;
        v13 = 0;
      }
      else
      {
        v11 = self;
        v12 = v4;
        v13 = 1;
      }
      -[CDDCommunicator triggerExchangeForFocalApp:inState:withNonApps:byClient:](v11, "triggerExchangeForFocalApp:inState:withNonApps:byClient:", v12, v13, v6, 31);
    }
    else
    {
      -[CDDCommunicator triggerNonAppFocalExchange:byClient:](self, "triggerNonAppFocalExchange:byClient:", v6, 31);
    }
  }
  else
  {
    -[CDDCommunicator triggerFocalAppExchange:inState:](self, "triggerFocalAppExchange:inState:", v4, 1);
    -[CDDCommunicator triggerFocalAppExchange:inState:](self, "triggerFocalAppExchange:inState:", v3, 0);
    -[CDDCommunicator setLastFocalApp:](self, "setLastFocalApp:", v3);
  }
  -[CDDCommunicator setLastFocalApp:](self, "setLastFocalApp:", v3);
  -[CDDCommunicator setLastFocalNonApps:](self, "setLastFocalNonApps:", v6);

}

- (unint64_t)currentWiFiWiredQuality
{
  _CDLocalContext *context;
  void *v4;
  void *v5;
  id v6;
  _CDLocalContext *v7;
  void *v8;
  void *v9;
  id v10;

  context = self->_context;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = self->_context;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 <= v6)
    return (unint64_t)v6;
  else
    return (unint64_t)v10;
}

- (unint64_t)currentCellQuality
{
  _CDLocalContext *context;
  void *v3;
  void *v4;
  id v5;

  context = self->_context;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return (unint64_t)v5;
}

- (void)handleNetworkChanged
{
  unint64_t v3;
  BOOL v4;
  char v5;
  unint64_t v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v3 = -[CDDCommunicator currentWiFiWiredQuality](self, "currentWiFiWiredQuality");
  v4 = v3 > 0x31 && self->_lastWiFiWiredQuality > 0x31;
  v5 = (self->_lastWiFiWiredQuality > 0x31) ^ (v3 > 0x31);
  v6 = -[CDDCommunicator currentCellQuality](self, "currentCellQuality");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = log;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network quality changed: %@ and %@", (uint8_t *)&v12, 0x16u);

  }
  v11 = v4 | (v5 | (self->_lastCellQuality < 0x32) ^ (v6 < 0x32)) ^ 1;
  self->_lastWiFiWiredQuality = v3;
  self->_lastCellQuality = v6;
  if ((v11 & 1) == 0)
    -[CDDCommunicator triggerSystemDataExchange:wakeRemote:](self, "triggerSystemDataExchange:wakeRemote:", 1, 0);
}

- (BOOL)registerScheduledExchange:(id *)a3
{
  NSObject *v5;
  unint64_t var5;
  void *v7;
  signed int v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  NSMutableArray *v18;
  OS_dispatch_queue *daemonQueue;
  _QWORD *v20;
  NSObject *v21;
  NSMutableArray *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  NSMutableArray *v26;
  _OWORD *v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;

  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CDDCommunicator: registering exchange.", buf, 2u);
  }

  var5 = a3->var2.var5;
  if (var5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self->cdd, "config"));
    v8 = objc_msgSend(v7, "commMinClientGranularity");

    if (var5 < v8)
      return 0;
  }
  v9 = malloc_type_calloc(1uLL, 0x88uLL, 0x92B5BEB3uLL);
  v10 = v9;
  *v9 = *(_OWORD *)&a3->var0;
  v11 = *(_OWORD *)&a3->var2.var6;
  v13 = *(_OWORD *)&a3->var2.var0;
  v12 = *(_OWORD *)&a3->var2.var2;
  v9[3] = *(_OWORD *)&a3->var2.var4;
  v9[4] = v11;
  v9[1] = v13;
  v9[2] = v12;
  v15 = *(_OWORD *)&a3->var2.var10;
  v14 = *(_OWORD *)&a3->var2.var12;
  v16 = *(_OWORD *)&a3->var2.var8;
  *((_QWORD *)v9 + 16) = *(_QWORD *)&a3->var2.var14;
  v9[6] = v15;
  v9[7] = v14;
  v9[5] = v16;
  if (a3->var1)
  {
    free(v9);
    return 0;
  }
  v18 = self->scheduledForecastRequests;
  daemonQueue = self->daemonQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000150E0;
  v25[3] = &unk_100038D58;
  v26 = v18;
  v27 = v10;
  v20 = v25;
  v21 = daemonQueue;
  v22 = v18;
  v23 = (void *)os_transaction_create("cd_dispatch_async_tx");
  *(_QWORD *)buf = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_100019820;
  v31 = &unk_100038A98;
  v32 = v23;
  v33 = v20;
  v24 = v23;
  dispatch_async(v21, buf);

  return 1;
}

- (id)obtainForegroundApplication
{
  NSObject *v2;
  void ***v3;
  id v4;
  id v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void **v11;
  uint64_t v12;
  intptr_t (*v13)(uint64_t, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000152F8;
  v21 = sub_100015308;
  v22 = 0;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100015310;
  v14 = &unk_100038D80;
  v2 = dispatch_semaphore_create(0);
  v15 = v2;
  v16 = &v17;
  v3 = objc_retainBlock(&v11);
  v4 = objc_alloc((Class)FBSDisplayLayoutMonitor);
  v5 = objc_msgSend(v4, "initWithDisplayType:handler:", 0, v3, v11, v12, v13, v14);
  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v2, v6);
  objc_msgSend(v5, "invalidate");
  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v18[5];
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Returning foreground app as %@ on start", buf, 0xCu);
  }

  v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (void)syncStateWithActiveRemote
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator obtainForegroundApplication](self, "obtainForegroundApplication"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App %@ foreground on start", (uint8_t *)&v5, 0xCu);
    }

    -[CDDCommunicator triggerFocalAppExchange:inState:](self, "triggerFocalAppExchange:inState:", v3, 0);
  }
  -[CDDCommunicator triggerSystemDataExchange:wakeRemote:](self, "triggerSystemDataExchange:wakeRemote:", 1, 1);

}

- (void)checkDevices:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 hasRemote;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  _BYTE v30[128];

  v4 = a3;
  if (self->initialized)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommControl identifierFromDeviceDescription:](self->control, "identifierFromDeviceDescription:", v11, (_QWORD)v22));
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", &off_10003B230));
            -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v8);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v5, "allKeys"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->registeredDevices, "allKeys"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));

    hasRemote = self->hasRemote;
    if ((objc_msgSend(v17, "isEqualToSet:", v15) & 1) == 0)
    {
      objc_storeStrong((id *)&self->registeredDevices, v5);
      if (-[NSDictionary count](self->registeredDevices, "count"))
      {
        self->hasRemote = 1;
        if (!hasRemote)
          -[CDDCommunicator registerForSystemConditionChanges](self, "registerForSystemConditionChanges");
        -[CDDCommunicator informCommunicationError](self, "informCommunicationError", (_QWORD)v22);
        v19 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = -[CDDCommunicator remoteVersionNumber](self, "remoteVersionNumber");
          v21 = -[CDDCommunicator localMaxSupportedVersionNumber](self, "localMaxSupportedVersionNumber");
          *(_DWORD *)buf = 134218240;
          v27 = v20;
          v28 = 2048;
          v29 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: Resetting outgoing version number from %llu to %llu.", buf, 0x16u);
        }

        -[CDDCommunicator setRemoteVersionNumber:](self, "setRemoteVersionNumber:", -[CDDCommunicator localMaxSupportedVersionNumber](self, "localMaxSupportedVersionNumber"));
      }
      else
      {
        self->hasRemote = 0;
        if (hasRemote)
          -[CDDCommunicator deregisterForSystemConditionChanges](self, "deregisterForSystemConditionChanges");
      }
      notify_post("com.apple.coreduetd.remoteDeviceChange");
    }

  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not initialized at checkDevices", buf, 2u);
    }
  }

}

- (id)convertMessage:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = objc_msgSend(a3, "mutableCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10003B230));
  if (a4 == 1 && a5 == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CDDCommunicatorHelper sharedInstance](CDDCommunicatorHelper, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_10003B248));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getNewThermalValueForOldValue:", v10));
LABEL_7:
    v12 = (void *)v11;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, &off_10003B248);

    goto LABEL_8;
  }
  if (a4 == 2 && a5 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CDDCommunicatorHelper sharedInstance](CDDCommunicatorHelper, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_10003B248));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getOldThermalValueForNewValue:", v10));
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, &off_10003B230);

  return v7;
}

- (id)getVersionsDictFromMaxVersion:(unint64_t)a3 minVersion:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("MaxVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v9[1] = CFSTR("MinVersion");
  v10[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  return v7;
}

- (id)getCurrrentSupportedVersions
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001612C;
  block[3] = &unk_100038A70;
  block[4] = self;
  if (qword_100040EC0 != -1)
    dispatch_once(&qword_100040EC0, block);
  return (id)qword_100040EB8;
}

- (unint64_t)getOutgoingVersionForIncomingVersions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator getCurrrentSupportedVersions](self, "getCurrrentSupportedVersions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CDDCommunicatorHelper sharedInstance](CDDCommunicatorHelper, "sharedInstance"));
  v7 = objc_msgSend(v6, "highestCommonVersionFor:and:", v5, v4);

  return (unint64_t)v7;
}

- (id)getScheduledForecasts
{
  void *v3;
  NSObject *daemonQueue;
  id v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000152F8;
  v15 = sub_100015308;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  daemonQueue = self->daemonQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000162E0;
  block[3] = &unk_100038E70;
  block[4] = self;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(daemonQueue, block);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)isConversionRequiredForMessage:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;

  v7 = a3;
  v8 = v7;
  if (a4 != a5 && (a4 == 1 || a5 == 1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10003B260));
    v11 = objc_msgSend(v10, "intValue");

    if (v11 <= 7)
      v9 = (0x83u >> v11) & 1;
    else
      LOBYTE(v9) = 0;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)handleMessageVersioning:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (self->localMaxSupportedVersionNumber == self->remoteVersionNumber
    || !-[CDDCommunicator isConversionRequiredForMessage:fromVersion:toVersion:](self, "isConversionRequiredForMessage:fromVersion:toVersion:", v4))
  {
    v5 = v4;
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CDDCommunicator convertMessage:fromVersion:toVersion:](self, "convertMessage:fromVersion:toVersion:", v4, self->localMaxSupportedVersionNumber, self->remoteVersionNumber));
  }
  v6 = v5;

  return v6;
}

- (id)makeSystemComboMessage
{
  double v3;
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *localFocalApp;
  void *v26;
  void *v27;
  NSObject *v28;
  NSMutableDictionary *systemData;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  _QWORD v37[4];
  _QWORD v38[4];

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v36, "timeIntervalSinceReferenceDate");
  v4 = (uint64_t)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v6 = objc_msgSend(v5, "secondsFromGMT");

  dispatch_assert_queue_V2((dispatch_queue_t)self->daemonQueue);
  -[CDDCommunicator currentBatteryLevel](self, "currentBatteryLevel");
  v8 = v7;
  v9 = -[CDDCommunicator isPluggedIn](self, "isPluggedIn");
  LOBYTE(v5) = v9;
  v10 = v9;
  v11 = -[CDDCommunicator thermalPressureLevel](self, "thermalPressureLevel");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDD privacyMonitor](self->cdd, "privacyMonitor"));
  v14 = objc_msgSend(v13, "updateAllowed");

  self->_lastBatteryPercentageSent = v8;
  self->_lastPluginStateSent = (char)v5;
  self->_lastThermalLevelSent = v11;
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v4));
  objc_msgSend(v15, "setObject:forKey:", v16, &off_10003B260);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v6));
  objc_msgSend(v15, "setObject:forKey:", v17, &off_10003B278);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  objc_msgSend(v15, "setObject:forKey:", v18, &off_10003B230);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 100.0));
  objc_msgSend(v15, "setObject:forKey:", v19, &off_10003B290);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10));
  objc_msgSend(v15, "setObject:forKey:", v20, &off_10003B2A8);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v12));
  objc_msgSend(v15, "setObject:forKey:", v21, &off_10003B248);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
  objc_msgSend(v15, "setObject:forKey:", v22, &off_10003B2C0);

  self->_lastWiFiWiredQuality = -[CDDCommunicator currentWiFiWiredQuality](self, "currentWiFiWiredQuality");
  self->_lastCellQuality = -[CDDCommunicator currentCellQuality](self, "currentCellQuality");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_lastWiFiWiredQuality));
  objc_msgSend(v15, "setObject:forKey:", v23, &off_10003B2D8);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_lastCellQuality));
  objc_msgSend(v15, "setObject:forKey:", v24, &off_10003B2F0);

  localFocalApp = self->localFocalApp;
  if (localFocalApp && sub_1000169C4(self->focalAppWhitelist, localFocalApp))
    objc_msgSend(v15, "setObject:forKey:", self->localFocalApp, &off_10003B308);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator generateNonAppFocalString](self, "generateNonAppFocalString"));
  if (v26)
    objc_msgSend(v15, "setObject:forKey:", v26, &off_10003B320);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CDD watchUpdate](self->cdd, "watchUpdate"));
  objc_msgSend(v27, "addWatchfaceInfo:", v15);

  v28 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    sub_100022DE4(v15, v28);

  systemData = self->systemData;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), &off_10003B338));
  -[NSMutableDictionary setObject:forKey:](systemData, "setObject:forKey:", v15, v30);

  v38[0] = &off_10003B278;
  v37[0] = &off_10003B260;
  v37[1] = &off_10003B278;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->remoteVersionNumber));
  v38[1] = v31;
  v37[2] = &off_10003B2A8;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator getCurrrentSupportedVersions](self, "getCurrrentSupportedVersions"));
  v37[3] = &off_10003B230;
  v38[2] = v32;
  v38[3] = v15;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 4));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator handleMessageVersioning:](self, "handleMessageVersioning:", v33));
  return v34;
}

- (id)makeScheduledMessage:(id)a3 withForecasts:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", a3));
  if (!v4)
    goto LABEL_4;
  v7 = objc_claimAutoreleasedReturnValue(-[CDDCommunicator getScheduledForecasts](self, "getScheduledForecasts"));
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "addObjectsFromArray:", v7);

LABEL_4:
    v9 = v6;
    goto LABEL_5;
  }
  v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator: null forecast data.", v12, 2u);
  }

  v9 = 0;
LABEL_5:

  return v9;
}

- (id)makeForecastMessage:(id *)a3
{
  unint64_t var8;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v12;
  void *p_var2;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[6];
  _QWORD v42[6];
  _QWORD v43[2];
  _QWORD v44[7];
  uint8_t buf[8];
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  var8 = a3->var8;
  v4 = 1;
  if ((var8 & 0x800) == 0)
    v4 = 2;
  if ((var8 & 0x400) != 0)
    v5 = 0;
  else
    v5 = v4;
  if (a3->var13)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CDDCommunicator: invalid attribute format.", buf, 2u);
    }

    goto LABEL_10;
  }
  v12 = objc_claimAutoreleasedReturnValue(-[CDD pmfOverHourOfDayWithParams:](self->cdd, "pmfOverHourOfDayWithParams:"));
  if (!v12)
  {
LABEL_10:
    v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CDDCommunicator: failed to generate forecast.", buf, 2u);
    }
    v8 = 0;
    goto LABEL_13;
  }
  v7 = v12;
  if (a3->var14)
  {
    p_var2 = a3;
    if (v5)
    {
      if (v5 == 2)
        p_var2 = &a3->var2;
      else
        p_var2 = &a3->var1;
    }
  }
  else
  {
    p_var2 = 0;
  }
  v14 = sub_1000158A0(v12, v5, 0, (uint64_t)p_var2);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)v15;
  if (v15)
  {
    v40 = (void *)v15;
    v44[0] = &off_10003B260;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var8));
    *(_QWORD *)buf = v39;
    v44[1] = &off_10003B278;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var9));
    v46 = v38;
    v44[2] = &off_10003B230;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var13));
    v47 = v17;
    v44[3] = &off_10003B290;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var3));
    v48 = v18;
    v44[4] = &off_10003B2A8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var4));
    v49 = v19;
    v44[5] = &off_10003B248;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var5));
    v50 = v20;
    v44[6] = &off_10003B2C0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var6));
    v51 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v44, 7));
    v23 = objc_msgSend(v22, "mutableCopy");

    if (a3->var14)
    {
      v24 = a3->var8;
      v25 = 1;
      if ((v24 & 0x800) == 0)
        v25 = 2;
      if ((v24 & 0x400) != 0)
        v26 = 0;
      else
        v26 = v25;
      if (v26 == 2)
      {
        v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3->var2));
      }
      else if (v26 == 1)
      {
        v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var1));
      }
      else
      {
        v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var0));
      }
      v28 = (void *)v27;
      -[NSObject setObject:forKey:](v23, "setObject:forKey:", v27, &off_10003B308);

    }
    v16 = v40;
    if (!v23)
      sub_100022E70();
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CDD knowledgeStore](self->cdd, "knowledgeStore"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[_DKPredictor predictorWithKnowledgeStore:](_DKPredictor, "predictorWithKnowledgeStore:", v29));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localInBedPeriod"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
    v43[0] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
    v43[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));

    v42[0] = &off_10003B290;
    v41[0] = &off_10003B260;
    v41[1] = &off_10003B278;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->remoteVersionNumber));
    v42[1] = v35;
    v41[2] = &off_10003B2A8;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator getCurrrentSupportedVersions](self, "getCurrrentSupportedVersions"));
    v42[2] = v36;
    v42[3] = v40;
    v41[3] = &off_10003B230;
    v41[4] = &off_10003B248;
    v41[5] = &off_10003B290;
    v42[4] = v34;
    v42[5] = v23;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator handleMessageVersioning:](self, "handleMessageVersioning:", v37));
  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "CDDCommunicator: failed to pack forecast.", buf, 2u);
    }
    v8 = 0;
  }

LABEL_13:
  return v8;
}

- (id)makeRemoteDeviceSyncMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v9[0] = &off_10003B320;
  v8[0] = &off_10003B260;
  v8[1] = &off_10003B278;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->remoteVersionNumber));
  v9[1] = v3;
  v8[2] = &off_10003B2A8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator getCurrrentSupportedVersions](self, "getCurrrentSupportedVersions"));
  v9[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator handleMessageVersioning:](self, "handleMessageVersioning:", v5));
  return v6;
}

- (id)makeAckMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v10[0] = &off_10003B2C0;
  v9[0] = &off_10003B260;
  v9[1] = &off_10003B278;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->remoteVersionNumber));
  v10[1] = v3;
  v9[2] = &off_10003B2A8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator getCurrrentSupportedVersions](self, "getCurrrentSupportedVersions"));
  v10[2] = v4;
  v9[3] = &off_10003B230;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator handleMessageVersioning:](self, "handleMessageVersioning:", v6));
  return v7;
}

- (void)receiveInBedTimes:(id)a3
{
  -[CDD saveRemoteInBedTimes:](self->cdd, "saveRemoteInBedTimes:", a3);
}

- (void)receiveForecast:(id)a3 paramDict:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  CDD *cdd;
  unsigned __int8 v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  const char *v22;
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->initialized && !-[CDD classCLocked](self->cdd, "classCLocked"))
  {
    if (v8)
    {
      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommControl identifierFromDeviceDescription:](self->control, "identifierFromDeviceDescription:", v10));
        v12 = sub_100017518(v9);
        cdd = self->cdd;
        v23 = 0;
        v14 = -[CDD saveForecast:queryParameters:deviceIdentifier:error:](cdd, "saveForecast:queryParameters:deviceIdentifier:error:", v8, v12, v11, &v23);
        v15 = v23;
        free(v12);
        v16 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if ((v14 & 1) != 0)
        {
          if (v17)
          {
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
            v19 = objc_msgSend(v18, "UTF8String");
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
            v21 = objc_msgSend(v20, "UTF8String");
            *(_DWORD *)buf = 136315394;
            v25 = v19;
            v26 = 2080;
            v27 = v21;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: forecasts saved. %s paramdict = %s ", buf, 0x16u);

          }
        }
        else if (v17)
        {
          *(_DWORD *)buf = 138412290;
          v25 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: failed to save forecast with %@", buf, 0xCu);
        }

        goto LABEL_16;
      }
      v15 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v22 = "CDDCommunicator: saveForecast: no param dictionary.";
        goto LABEL_12;
      }
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v22 = "CDDCommunicator: saveForecast: no forecast data.";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v22, buf, 2u);
      }
    }
LABEL_16:

  }
}

- (void)receiveSystemData:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  const char *v27;
  id v28;
  NSObject *v29;
  NSObject *daemonQueue;
  id v31;
  void *v32;
  void *v33;
  _CDLocalContext *context;
  void *v35;
  void *v36;
  void *v37;
  _CDLocalContext *v38;
  void *v39;
  void *v40;
  void *v41;
  _CDLocalContext *v42;
  void *v43;
  void *v44;
  void *v45;
  _CDLocalContext *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *i;
  void *v56;
  id v57;
  _CDLocalContext *v58;
  void *v59;
  NSObject *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  id v71;
  id v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD block[5];
  id v79;
  id v80;
  uint8_t v81[128];
  uint8_t buf[4];
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;

  v6 = a3;
  v7 = a4;
  if (self->initialized)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommControl identifierFromDeviceDescription:](self->control, "identifierFromDeviceDescription:", v7));
    v9 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v8;
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", &off_10003B260)));
      v12 = objc_msgSend(v11, "UTF8String");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", &off_10003B230)));
      v14 = objc_msgSend(v13, "UTF8String");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", &off_10003B278)));
      *(_DWORD *)buf = 136315650;
      v83 = v12;
      v84 = 2080;
      v85 = v14;
      v86 = 2080;
      v87 = objc_msgSend(v15, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: received system data from \"%s\" (%s:%s):", buf, 0x20u);

      v8 = v10;
    }

    v16 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_100022EC0((uint64_t)v6, v16, v17);

    if (v6)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B260));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B278));
      v20 = (void *)v19;
      if (v18 && v19)
      {
        v64 = v7;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B230));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B290));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B2A8));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B248));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B2C0));
        v62 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B308));
        v70 = v18;
        v71 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B320));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("\nTimestamp         : %d"), -[NSObject intValue](v18, "intValue")));
        v69 = v20;
        objc_msgSend(v25, "appendFormat:", CFSTR("\nTimestampOffset   : %d sec"), objc_msgSend(v20, "intValue"));
        v68 = v21;
        objc_msgSend(v25, "appendFormat:", CFSTR("\nBatteryLevel      : %d%%"), objc_msgSend(v21, "intValue"));
        v67 = v22;
        objc_msgSend(v25, "appendFormat:", CFSTR("\nBatteryCapacity   : %d"), objc_msgSend(v22, "intValue"));
        v66 = v23;
        v26 = objc_msgSend(v23, "BOOLValue");
        v27 = "NO";
        if (v26)
          v27 = "YES";
        objc_msgSend(v25, "appendFormat:", CFSTR("\nCharging          : %s"), v27);
        objc_msgSend(v25, "appendFormat:", CFSTR("\nThermalLevel      : %d"), objc_msgSend(v73, "intValue"));
        v65 = v24;
        objc_msgSend(v25, "appendFormat:", CFSTR("\nBgAppRefresh      : %d"), objc_msgSend(v24, "intValue"));
        v61 = objc_retainAutorelease(v62);
        objc_msgSend(v25, "appendFormat:", CFSTR("\nFocalApp          : %s"), objc_msgSend(v61, "UTF8String"));
        v28 = objc_retainAutorelease(v71);
        objc_msgSend(v25, "appendFormat:", CFSTR("\nFocalNonApp       : %s"), objc_msgSend(v28, "UTF8String"));
        v29 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v25;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
        v63 = v25;

        daemonQueue = self->daemonQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100017F14;
        block[3] = &unk_100038E98;
        block[4] = self;
        v79 = v6;
        v72 = v8;
        v31 = v8;
        v80 = v31;
        dispatch_sync(daemonQueue, block);
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->systemData, "objectForKeyedSubscript:", v31));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", &off_10003B230));
        context = self->_context;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceBatteryLevel](_CDContextQueries, "keyPathForDefaultPairedDeviceBatteryLevel"));
        -[_CDLocalContext setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", v33, v35);

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->systemData, "objectForKeyedSubscript:", v31));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", &off_10003B2A8));
        v38 = self->_context;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus](_CDContextQueries, "keyPathForDefaultPairedDevicePluginStatus"));
        -[_CDLocalContext setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v37, v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->systemData, "objectForKeyedSubscript:", v31));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", &off_10003B248));
        v42 = self->_context;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceThermalPressureLevel](_CDContextQueries, "keyPathForDefaultPairedDeviceThermalPressureLevel"));
        -[_CDLocalContext setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v41, v43);

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->systemData, "objectForKeyedSubscript:", v31));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", &off_10003B308));
        v46 = self->_context;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceForegroundApp](_CDContextQueries, "keyPathForDefaultPairedDeviceForegroundApp"));
        -[_CDLocalContext setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v45, v47);

        v48 = v28;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(",")));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v51 = v49;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
        v7 = v64;
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v53; i = (char *)i + 1)
            {
              if (*(_QWORD *)v75 != v54)
                objc_enumerationMutation(v51);
              v56 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v56, "length"))
                objc_msgSend(v50, "addObject:", v56);
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
          }
          while (v53);
        }

        v57 = objc_msgSend(v50, "copy");
        v58 = self->_context;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedServicesAppearingForeground](_CDContextQueries, "keyPathForDefaultPairedServicesAppearingForeground"));
        -[_CDLocalContext setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v57, v59);

        v18 = v70;
        v8 = v72;
      }
      else
      {
        v60 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "CDDCommunicator: missing timestamps for persisting system data.", buf, 2u);
        }

      }
    }
    else
    {
      v18 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CDDCommunicator: missing system data, cannot proceed.", buf, 2u);
      }
    }

  }
}

- (id)getAckMessage
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(-[CDDCommunicator makeAckMessage](self, "makeAckMessage"));
  if (!v2)
    sub_100022F2C();
  v3 = (void *)v2;
  v4 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, 0));
  if (!v4)
    sub_100022F54();
  v5 = (void *)v4;

  return v5;
}

- (id)getScheduledMessage:(id)a3 withForecasts:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[CDDCommunicator makeScheduledMessage:withForecasts:](self, "makeScheduledMessage:withForecasts:", v6, v4));
  if (!v7)
    sub_100022F7C();
  v8 = (void *)v7;
  v9 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0));
  if (!v9)
    sub_100022FA4();
  v10 = (void *)v9;

  return v10;
}

- (void)triggerExchangeForFocalApp:(id)a3 inState:(int)a4 withNonApps:(id)a5 byClient:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  OS_dispatch_queue *daemonQueue;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  int v19;
  _QWORD block[4];
  id v21;
  id v22;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  -[CDDCommunicator triggerFocalAppExchange:inState:shouldSendMessage:](self, "triggerFocalAppExchange:inState:shouldSendMessage:", a3, v7, 0);
  -[CDDCommunicator triggerNonAppFocalExchange:byClient:shouldSendMessage:](self, "triggerNonAppFocalExchange:byClient:shouldSendMessage:", v10, a6, 0);
  daemonQueue = self->daemonQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100018138;
  v17[3] = &unk_100038EC0;
  v19 = v7;
  v17[4] = self;
  v18 = v10;
  v12 = v17;
  v13 = daemonQueue;
  v14 = v10;
  v15 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019820;
  block[3] = &unk_100038A98;
  v21 = v15;
  v22 = v12;
  v16 = v15;
  dispatch_async(v13, block);

}

- (void)triggerFocalAppExchange:(id)a3 inState:(int)a4
{
  -[CDDCommunicator triggerFocalAppExchange:inState:shouldSendMessage:](self, "triggerFocalAppExchange:inState:shouldSendMessage:", a3, *(_QWORD *)&a4, 1);
}

- (void)triggerFocalAppExchange:(id)a3 inState:(int)a4 shouldSendMessage:(BOOL)a5
{
  id v8;
  void *v9;
  _BOOL4 initialized;
  OS_dispatch_queue *daemonQueue;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  int v18;
  BOOL v19;
  _QWORD block[4];
  id v21;
  id v22;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self->cdd, "config"));
  if (objc_msgSend(v9, "commEnabled"))
  {
    initialized = self->initialized;

    if (v8 && initialized)
    {
      daemonQueue = self->daemonQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000182B8;
      v16[3] = &unk_100038EE8;
      v18 = a4;
      v16[4] = self;
      v17 = v8;
      v19 = a5;
      v12 = v16;
      v13 = daemonQueue;
      v14 = (void *)os_transaction_create("cd_dispatch_async_tx");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100019820;
      block[3] = &unk_100038A98;
      v21 = v14;
      v22 = v12;
      v15 = v14;
      dispatch_async(v13, block);

    }
  }
  else
  {

  }
}

- (id)generateNonAppFocalString
{
  NSMutableDictionary *localNonAppsInFocus;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000152F8;
  v10 = sub_100015308;
  v11 = 0;
  localNonAppsInFocus = self->localNonAppsInFocus;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018544;
  v5[3] = &unk_100038F10;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](localNonAppsInFocus, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)generateFocalNonAppFocalMutableSet
{
  id v3;
  NSMutableDictionary *localNonAppsInFocus;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init((Class)NSMutableSet);
  localNonAppsInFocus = self->localNonAppsInFocus;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018670;
  v7[3] = &unk_100038C60;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](localNonAppsInFocus, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (self->localFocalApp)
    objc_msgSend(v5, "addObject:");

  return v5;
}

- (void)informCommunicationError
{
  OS_dispatch_queue *daemonQueue;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  id v10;

  daemonQueue = self->daemonQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018748;
  v7[3] = &unk_100038A70;
  v7[4] = self;
  v3 = v7;
  v4 = daemonQueue;
  v5 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019820;
  block[3] = &unk_100038A98;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  dispatch_async(v4, block);

}

- (void)exchangeSystemComboMessage:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  NSMutableSet *lastSentFocalNonFocalState;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  CDDCommControl *control;
  void *v16;
  NSDate *v17;
  NSDate *lastSystemExchange;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *daemonQueue;
  _QWORD v22[5];
  BOOL v23;
  uint8_t buf[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator generateFocalNonAppFocalMutableSet](self, "generateFocalNonAppFocalMutableSet"));
  if (-[NSArray count](self->exclusiveApps, "count"))
  {
    v6 = 0;
    do
    {
      lastSentFocalNonFocalState = self->lastSentFocalNonFocalState;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->exclusiveApps, "objectAtIndex:", v6));
      LOBYTE(lastSentFocalNonFocalState) = -[NSMutableSet containsObject:](lastSentFocalNonFocalState, "containsObject:", v8);

      if ((lastSentFocalNonFocalState & 1) != 0)
        goto LABEL_16;
    }
    while (++v6 < -[NSArray count](self->exclusiveApps, "count"));
  }
  if (objc_msgSend(v5, "isEqualToSet:", self->lastSentFocalNonFocalState))
  {
    self->shouldTriggerDelayedMessage = 0;
    v9 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "CDDCommunicator: Same focal app/nonapp state as last sent. Avoiding broadcasting. Any scheduled delayed mess"
            "ages set to void";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "isSubsetOfSet:", self->lastSentFocalNonFocalState))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator:  Focal app/nonapp state subset of last sent.", buf, 2u);
    }

    if (!self->shouldTriggerDelayedMessage)
    {
      self->shouldTriggerDelayedMessage = 1;
      v19 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "CDDCommunicator:  Scheduled to broadcast delayed focal app/nonapp message.", buf, 2u);
      }

      v20 = dispatch_time(0, 10000000000);
      daemonQueue = self->daemonQueue;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100018AB4;
      v22[3] = &unk_100038F38;
      v22[4] = self;
      v23 = v3;
      dispatch_after(v20, daemonQueue, v22);
      goto LABEL_19;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "CDDCommunicator:  Avoiding broadcast of delayed focal app/nonapp message. Another delayed message already scheduled or ";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_19;
  }
LABEL_16:
  v12 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CDDCommunicator:  Non-Matching focal app/nonapp state. Broadcasting right away. Any scheduled delayed messages set to void", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator makeSystemComboMessage](self, "makeSystemComboMessage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0));
  self->shouldTriggerDelayedMessage = 0;
  control = self->control;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
  -[CDDCommControl triggeredExchange:opportunistic:queue:timeout:urgent:](control, "triggeredExchange:opportunistic:queue:timeout:urgent:", v14, v3, 0, v16, 1);

  v17 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastSystemExchange = self->lastSystemExchange;
  self->lastSystemExchange = v17;

  -[NSMutableSet setSet:](self->lastSentFocalNonFocalState, "setSet:", v5);
LABEL_19:

}

- (void)triggerNonAppFocalExchange:(id)a3 byClient:(unint64_t)a4
{
  -[CDDCommunicator triggerNonAppFocalExchange:byClient:shouldSendMessage:](self, "triggerNonAppFocalExchange:byClient:shouldSendMessage:", a3, a4, 1);
}

- (void)triggerNonAppFocalExchange:(id)a3 byClient:(unint64_t)a4 shouldSendMessage:(BOOL)a5
{
  id v8;
  OS_dispatch_queue *daemonQueue;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  BOOL v18;
  _QWORD block[4];
  id v20;
  id v21;

  v8 = a3;
  daemonQueue = self->daemonQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100018CE8;
  v15[3] = &unk_100038F60;
  v16 = v8;
  v17 = a4;
  v15[4] = self;
  v18 = a5;
  v10 = v15;
  v11 = daemonQueue;
  v12 = v8;
  v13 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019820;
  block[3] = &unk_100038A98;
  v20 = v13;
  v21 = v10;
  v14 = v13;
  dispatch_async(v11, block);

}

- (void)triggerSystemDataExchange:(BOOL)a3 wakeRemote:(BOOL)a4
{
  _BOOL4 initialized;
  OS_dispatch_queue *daemonQueue;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  BOOL v15;
  BOOL v16;
  _QWORD block[4];
  id v18;
  id v19;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[CDD config](self->cdd, "config"));
  if (objc_msgSend(v13, "commEnabled"))
  {
    initialized = self->initialized;

    if (initialized)
    {
      daemonQueue = self->daemonQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000191F0;
      v14[3] = &unk_100038F88;
      v14[4] = self;
      v15 = a3;
      v16 = a4;
      v9 = v14;
      v10 = daemonQueue;
      v11 = (void *)os_transaction_create("cd_dispatch_async_tx");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100019820;
      block[3] = &unk_100038A98;
      v18 = v11;
      v19 = v9;
      v12 = v11;
      dispatch_async(v10, block);

    }
  }
  else
  {

  }
}

- (void)requestRemoteDeviceSync
{
  OS_dispatch_queue *daemonQueue;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  id v10;

  daemonQueue = self->daemonQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001945C;
  v7[3] = &unk_100038A70;
  v7[4] = self;
  v3 = v7;
  v4 = daemonQueue;
  v5 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019820;
  block[3] = &unk_100038A98;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  dispatch_async(v4, block);

}

- (id)satisfyForecastDataRequest:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = sub_100017518(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommunicator makeForecastMessage:](self, "makeForecastMessage:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0));
    if (v6)
      free(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)receiveRequestedForecast:(id)a3 paramDict:(id)a4 transactionId:(unint64_t)a5 device:(id)a6
{
  -[CDDCommunicator receiveForecast:paramDict:device:](self, "receiveForecast:paramDict:device:", a3, a4, a6);
}

- (CDD)cdd
{
  return self->cdd;
}

- (CDDCommControl)control
{
  return self->control;
}

- (NSDictionary)registeredDevices
{
  return self->registeredDevices;
}

- (BOOL)initialized
{
  return self->initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->initialized = a3;
}

- (BOOL)hasRemote
{
  return self->hasRemote;
}

- (unint64_t)remoteVersionNumber
{
  return self->remoteVersionNumber;
}

- (void)setRemoteVersionNumber:(unint64_t)a3
{
  self->remoteVersionNumber = a3;
}

- (unint64_t)localMaxSupportedVersionNumber
{
  return self->localMaxSupportedVersionNumber;
}

- (unint64_t)localMinSupportedVersionNumber
{
  return self->localMinSupportedVersionNumber;
}

- (NSArray)exclusiveApps
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (NSArray)nonTrafficBundleID
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)lastFocalApp
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLastFocalApp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSArray)lastFocalNonApps
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setLastFocalNonApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocalNonApps, 0);
  objc_storeStrong((id *)&self->_lastFocalApp, 0);
  objc_storeStrong((id *)&self->registeredDevices, 0);
  objc_storeStrong((id *)&self->daemonQueue, 0);
  objc_storeStrong((id *)&self->nonTrafficBundleID, 0);
  objc_storeStrong((id *)&self->exclusiveApps, 0);
  objc_storeStrong((id *)&self->lastSentFocalNonFocalState, 0);
  objc_storeStrong((id *)&self->lastSystemExchange, 0);
  objc_storeStrong((id *)&self->systemData, 0);
  objc_storeStrong((id *)&self->focalAppWhitelist, 0);
  objc_storeStrong((id *)&self->localNonAppsInFocus, 0);
  objc_storeStrong((id *)&self->localFocalApp, 0);
  objc_storeStrong((id *)&self->scheduledForecastRequests, 0);
  objc_storeStrong((id *)&self->_networkRegistration, 0);
  objc_storeStrong((id *)&self->_applicationRegistration, 0);
  objc_storeStrong((id *)&self->_thermalRegistration, 0);
  objc_storeStrong((id *)&self->_pluggedInRegistration, 0);
  objc_storeStrong((id *)&self->_batteryRegistration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->control, 0);
  objc_storeStrong((id *)&self->cdd, 0);
}

@end
