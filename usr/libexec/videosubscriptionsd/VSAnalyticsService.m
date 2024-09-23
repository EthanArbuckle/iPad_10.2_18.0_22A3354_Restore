@implementation VSAnalyticsService

- (VSAnalyticsService)init
{
  void *v3;
  VSAnalyticsService *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VSAnalyticsService *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  AMSBag *bag;
  id v13;
  id v14;
  MTMetricsKit *v15;
  MTMetricsKit *mainMetricsKit;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *eventQueue;
  void *v26;
  void *v27;
  VSPreferences *v28;
  VSPreferences *preferences;
  uint64_t v30;
  NSObject *v31;
  VSAnalyticsService *v32;
  __int16 v34;
  objc_super v35;
  _QWORD v36[4];

  v3 = objc_autoreleasePoolPush();
  v35.receiver = self;
  v35.super_class = (Class)VSAnalyticsService;
  v4 = -[VSAnalyticsService init](&v35, "init");
  v8 = v4;
  if (v4)
  {
    v9 = VSDefaultLogObject(v4, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initializing analytics service.", (uint8_t *)&v34, 2u);
    }

    v11 = objc_claimAutoreleasedReturnValue(+[AMSBag vs_defaultBag](AMSBag, "vs_defaultBag"));
    bag = v8->_bag;
    v8->_bag = (AMSBag *)v11;

    v13 = objc_msgSend(objc_alloc((Class)MTStoreAMSBagDelegatePackage), "initWithAMSBag:", v8->_bag);
    v14 = objc_alloc((Class)MTMetricsKit);
    v15 = (MTMetricsKit *)objc_msgSend(v14, "initWithTopic:delegatePackage:", VSMetricsKitTopicMain, v13);
    mainMetricsKit = v8->_mainMetricsKit;
    v8->_mainMetricsKit = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTMetricsKit eventHandlers](v8->_mainMetricsKit, "eventHandlers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "base"));
    objc_msgSend(v18, "setDelegate:", v8);

    v36[0] = VSEntitlementNameAnalyticsService;
    v36[1] = VSEntitlementNameAnalyticsReportFederatedEvents;
    v36[2] = VSEntitlementNameAnalyticsReportMetricsEvents;
    v36[3] = VSEntitlementNameAnalyticsReportAMSMetricsEvents;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 4));
    v20 = VSAnalyticsServiceInterface(-[VSAnalyticsService setEntitlementNames:](v8, "setEntitlementNames:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[VSAnalyticsService setExportedInterface:](v8, "setExportedInterface:", v21);

    -[VSAnalyticsService setExportedObject:](v8, "setExportedObject:", v8);
    v22 = objc_alloc_init((Class)NSMutableArray);
    -[VSAnalyticsService setEventCache:](v8, "setEventCache:", v22);

    v23 = objc_alloc_init((Class)NSMutableArray);
    -[VSAnalyticsService setAmsEventCache:](v8, "setAmsEventCache:", v23);

    v24 = dispatch_queue_create("EventQueue", 0);
    eventQueue = v8->_eventQueue;
    v8->_eventQueue = (OS_dispatch_queue *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection"));
    objc_msgSend(v26, "registerObserver:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection"));
    v8->_optedIn = objc_msgSend(v27, "analyticsAllowed") == (id)1;

    v28 = (VSPreferences *)objc_alloc_init((Class)VSPreferences);
    preferences = v8->_preferences;
    v8->_preferences = v28;

    v8->_didBuddyComplete = 1;
  }
  v30 = VSDefaultLogObject(v4, v5, v6, v7);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Analytics service initialized", (uint8_t *)&v34, 2u);
  }

  v32 = v8;
  objc_autoreleasePoolPop(v3);

  return v32;
}

- (void)recordAMSMetricsEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  NSObject *v26;
  VSAnalyticsService *v27;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = -[NSObject shouldAllowAccessForBooleanEntitlement:](v7, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameAnalyticsReportAMSMetricsEvents);
    if (!(_DWORD)v8)
    {
      v23 = VSErrorLogObject();
      v21 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10000E818();
      goto LABEL_15;
    }
    v12 = VSDefaultLogObject(v8, v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Allowing XPC invocation to record AMS metrics event", buf, 2u);
    }

    if (!-[VSAnalyticsService didBuddyComplete](self, "didBuddyComplete"))
    {
      v21 = self;
      objc_sync_enter(v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject amsEventCache](v21, "amsEventCache"));
      objc_msgSend(v24, "addObject:", v4);

      objc_sync_exit(v21);
LABEL_15:

      goto LABEL_16;
    }
    v14 = -[VSAnalyticsService optedIn](self, "optedIn");
    if (v14)
    {
      v18 = VSDefaultLogObject(v14, v15, v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Recording AMS metrics event", buf, 2u);
      }

      v20 = objc_claimAutoreleasedReturnValue(-[VSAnalyticsService eventQueue](self, "eventQueue"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000039A4;
      v25[3] = &unk_100018650;
      v26 = v4;
      v27 = self;
      dispatch_async(v20, v25);

      v21 = v26;
      goto LABEL_15;
    }
  }
  else
  {
    v22 = VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000E818();
  }
LABEL_16:

}

- (void)recordFederatedPunchoutEventWithError:(id)a3 metadata:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  VSAnalyticsService *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  uint8_t buf[4];
  NSObject *v54;
  __int16 v55;
  NSObject *v56;
  __int16 v57;
  NSObject *v58;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection"));
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    v11 = -[NSObject shouldAllowAccessForBooleanEntitlement:](v10, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameAnalyticsReportFederatedEvents);
    if ((_DWORD)v11)
    {
      v15 = VSDefaultLogObject(v11, v12, v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_claimAutoreleasedReturnValue(-[NSObject signingIdentifier](v10, "signingIdentifier"));
        *(_DWORD *)buf = 138412802;
        v54 = v17;
        v55 = 2112;
        v56 = v6;
        v57 = 2112;
        v58 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Recording federated punchout for client %@: %@/%@", buf, 0x20u);

      }
      v22 = VSDefaultLogObject(v18, v19, v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v54 = v6;
        v55 = 2112;
        v56 = v7;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Will publish federated punchout event with error: %@ metadata: %@", buf, 0x16u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[VSMetricsCenter sharedMetricsCenter](VSMetricsCenter, "sharedMetricsCenter"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "flexibleBaseFields"));

      if (v6)
      {
        v26 = v6;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v26, "domain"));
        -[NSObject setObject:forKey:](v25, "setObject:forKey:", v27, VSMetricFlexibleFieldErrorType);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSObject code](v26, "code")));
        -[NSObject setObject:forKey:](v25, "setObject:forKey:", v28, VSMetricFlexibleFieldErrorCode);

      }
      if (-[NSObject count](v7, "count"))
      {
        if (!v7)
          +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The eventData parameter must not be nil."));
        -[NSObject addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v7);
      }
      v29 = VSMetricFlexibleFieldBundleID;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", VSMetricFlexibleFieldBundleID));

      if (v30)
      {
        v35 = objc_alloc((Class)VSBundleRecord);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v29));
        v37 = objc_msgSend(v35, "initWithBundleID:", v36);

        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleVersion"));
          if (v38)
          {
            -[NSObject setObject:forKey:](v25, "setObject:forKey:", v38, VSMetricFlexibleFieldBundleVersion);
          }
          else
          {
            v41 = VSErrorLogObject();
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
              sub_10000E888(v7, v29, v42);

          }
        }

      }
      v51 = v6;
      v43 = VSDefaultLogObject(v31, v32, v33, v34);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v25;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Recording federated punchout event with data %@", buf, 0xCu);
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[VSAnalyticsService mainMetricsKit](self, "mainMetricsKit"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "eventHandlers"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "flexible"));
      v52 = v25;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
      v49 = self;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "metricsDataWithEventType:eventData:", CFSTR("federated_punchout"), v48));

      -[VSAnalyticsService publishMetricsKitEventWithData:](v49, "publishMetricsKitEventWithData:", v50);
      v6 = v51;
    }
    else
    {
      v40 = VSErrorLogObject();
      v25 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10000E914();
    }

  }
  else
  {
    v39 = VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000E818();
  }

}

- (void)recordNowPlayingBrokenEventWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  VSAnalyticsService *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  id v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = -[NSObject shouldAllowAccessForBooleanEntitlement:](v7, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameAnalyticsReportFederatedEvents);
    if ((_DWORD)v8)
    {
      v12 = VSDefaultLogObject(v8, v9, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_claimAutoreleasedReturnValue(-[NSObject signingIdentifier](v7, "signingIdentifier"));
        *(_DWORD *)buf = 138412546;
        v38 = v14;
        v39 = 2112;
        v40 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Recording Now Playing broken event for client %@ with bundle ID %@", buf, 0x16u);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[VSMetricsCenter sharedMetricsCenter](VSMetricsCenter, "sharedMetricsCenter"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "flexibleBaseFields"));

      -[NSObject vs_setObjectUnlessNil:forKey:](v16, "vs_setObjectUnlessNil:forKey:", v4, VSMetricFlexibleFieldBundleID);
      v17 = objc_msgSend(objc_alloc((Class)VSBundleRecord), "initWithBundleID:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleVersion"));

      if (v18)
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleVersion"));
        -[NSObject vs_setObjectUnlessNil:forKey:](v16, "vs_setObjectUnlessNil:forKey:", v19, VSMetricFlexibleFieldBundleVersion);
      }
      else
      {
        v22 = VSErrorLogObject();
        v19 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          sub_10000E974();
      }
      v35 = v17;

      v27 = VSDefaultLogObject(v23, v24, v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Recording Now Playing Broken event with data %@", buf, 0xCu);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[VSAnalyticsService mainMetricsKit](self, "mainMetricsKit"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "eventHandlers"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "flexible"));
      v36 = v16;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      v33 = self;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "metricsDataWithEventType:eventData:", CFSTR("now_playing_broken"), v32));

      -[VSAnalyticsService publishMetricsKitEventWithData:](v33, "publishMetricsKitEventWithData:", v34);
    }
    else
    {
      v21 = VSErrorLogObject();
      v16 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10000E914();
    }

  }
  else
  {
    v20 = VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000E818();
  }

}

- (void)recordMetricsCenterFlexibleEventWithName:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[16];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection"));
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameAnalyticsReportMetricsEvents);
    if ((_DWORD)v10)
    {
      v14 = VSDefaultLogObject(v10, v11, v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Analytics service received flexible event", v23, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSAnalyticsService mainMetricsKit](self, "mainMetricsKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventHandlers"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flexible"));
      v24 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metricsDataWithEventType:eventData:", v6, v19));

      -[VSAnalyticsService publishMetricsKitEventWithData:](self, "publishMetricsKitEventWithData:", v20);
    }
    else
    {
      v22 = VSErrorLogObject();
      v20 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10000E914();
    }
  }
  else
  {
    v21 = VSErrorLogObject();
    v20 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10000E9D8();
  }

}

- (void)recordMetricsCenterClickEventWithPage:(id)a3 pageType:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection"));
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameAnalyticsReportMetricsEvents);
    if ((_DWORD)v13)
    {
      v17 = VSDefaultLogObject(v13, v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Analytics service received click event", v26, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VSAnalyticsService mainMetricsKit](self, "mainMetricsKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventHandlers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "click"));
      v27 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metricsDataWithPageId:pageType:pageContext:eventData:", v8, v9, CFSTR("page_ctx_default"), v22));

      -[VSAnalyticsService publishMetricsKitEventWithData:](self, "publishMetricsKitEventWithData:", v23);
    }
    else
    {
      v25 = VSErrorLogObject();
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10000E914();
    }
  }
  else
  {
    v24 = VSErrorLogObject();
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10000E9D8();
  }

}

- (void)recordMetricsCenterEnterEventWithPage:(id)a3 pageType:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection"));
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameAnalyticsReportMetricsEvents);
    if ((_DWORD)v13)
    {
      v17 = VSDefaultLogObject(v13, v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Analytics service received enter event", v26, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VSAnalyticsService mainMetricsKit](self, "mainMetricsKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventHandlers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "enter"));
      v27 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metricsDataWithPageId:pageType:pageContext:eventData:", v8, v9, CFSTR("page_ctx_default"), v22));

      -[VSAnalyticsService publishMetricsKitEventWithData:](self, "publishMetricsKitEventWithData:", v23);
    }
    else
    {
      v25 = VSErrorLogObject();
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10000E914();
    }
  }
  else
  {
    v24 = VSErrorLogObject();
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10000E9D8();
  }

}

- (void)recordMetricsCenterExitEventWithPage:(id)a3 pageType:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection"));
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameAnalyticsReportMetricsEvents);
    if ((_DWORD)v13)
    {
      v17 = VSDefaultLogObject(v13, v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Analytics service received exit event", v26, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VSAnalyticsService mainMetricsKit](self, "mainMetricsKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventHandlers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "exit"));
      v27 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metricsDataWithPageId:pageType:pageContext:eventData:", v8, v9, CFSTR("page_ctx_default"), v22));

      -[VSAnalyticsService publishMetricsKitEventWithData:](self, "publishMetricsKitEventWithData:", v23);
    }
    else
    {
      v25 = VSErrorLogObject();
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10000E914();
    }
  }
  else
  {
    v24 = VSErrorLogObject();
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10000E9D8();
  }

}

- (void)publishMetricsKitEventWithData:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  VSAnalyticsService *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  VSAnalyticsService *v21;
  VSAnalyticsService *v22;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[VSAnalyticsService didBuddyComplete](self, "didBuddyComplete");
  if (!v5)
  {
    v17 = VSDefaultLogObject(v5, v6, v7, v8);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Analytics service caching event received during setup.", buf, 2u);
    }

    v16 = self;
    objc_sync_enter(v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VSAnalyticsService eventCache](v16, "eventCache"));
    objc_msgSend(v19, "addObject:", v4);

    objc_sync_exit(v16);
    goto LABEL_9;
  }
  v9 = -[VSAnalyticsService optedIn](self, "optedIn");
  if (v9)
  {
    v13 = VSDefaultLogObject(v9, v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Analytics service recording event.", buf, 2u);
    }

    v15 = objc_claimAutoreleasedReturnValue(-[VSAnalyticsService eventQueue](self, "eventQueue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100004B30;
    v20[3] = &unk_100018650;
    v21 = (VSAnalyticsService *)v4;
    v22 = self;
    dispatch_async(v15, v20);

    v16 = v21;
LABEL_9:

  }
}

- (void)profileConnectionSettingsChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t v11[16];

  v4 = a3;
  v8 = VSDefaultLogObject(v4, v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received profile effective settings did change notification.", v11, 2u);
  }

  v10 = objc_msgSend(v4, "analyticsAllowed");
  -[VSAnalyticsService setOptedIn:](self, "setOptedIn:", v10 == (id)1);
}

- (id)dsId:(id)a3
{
  return 0;
}

- (id)pageUrl:(id)a3
{
  return 0;
}

- (id)connection:(id)a3
{
  return 0;
}

- (id)hardwareModel:(id)a3
{
  return 0;
}

- (id)pixelRatio:(id)a3
{
  return 0;
}

- (id)resourceRevNum:(id)a3
{
  return 0;
}

- (id)screenWidth:(id)a3
{
  return 0;
}

- (id)screenHeight:(id)a3
{
  return 0;
}

- (id)windowInnerWidth:(id)a3
{
  return 0;
}

- (id)windowInnerHeight:(id)a3
{
  return 0;
}

- (id)windowOuterWidth:(id)a3
{
  return 0;
}

- (id)windowOuterHeight:(id)a3
{
  return 0;
}

- (id)xpPostFrequency:(id)a3
{
  return 0;
}

- (id)xpSendMethod:(id)a3
{
  return 0;
}

- (id)clientId:(id)a3
{
  return 0;
}

- (id)isSignedIn:(id)a3
{
  return 0;
}

- (id)capacityData:(id)a3
{
  return 0;
}

- (id)capacitySystem:(id)a3
{
  return 0;
}

- (id)capacityDataAvailable:(id)a3
{
  return 0;
}

- (id)capacityDisk:(id)a3
{
  return 0;
}

- (id)capacitySystemAvailable:(id)a3
{
  return 0;
}

- (MTMetricsKit)mainMetricsKit
{
  return self->_mainMetricsKit;
}

- (void)setMainMetricsKit:(id)a3
{
  objc_storeStrong((id *)&self->_mainMetricsKit, a3);
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSMutableArray)eventCache
{
  return self->_eventCache;
}

- (void)setEventCache:(id)a3
{
  objc_storeStrong((id *)&self->_eventCache, a3);
}

- (NSMutableArray)amsEventCache
{
  return self->_amsEventCache;
}

- (void)setAmsEventCache:(id)a3
{
  objc_storeStrong((id *)&self->_amsEventCache, a3);
}

- (BOOL)didBuddyComplete
{
  return self->_didBuddyComplete;
}

- (void)setDidBuddyComplete:(BOOL)a3
{
  self->_didBuddyComplete = a3;
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  self->_optedIn = a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_amsEventCache, 0);
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_mainMetricsKit, 0);
}

@end
