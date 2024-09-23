@implementation FMFServiceProvider

- (FMFServiceProvider)init
{
  FMFServiceProvider *v2;
  dispatch_semaphore_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMFServiceProvider;
  v2 = -[FindBaseServiceProvider init](&v5, "init");
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    -[FMFServiceProvider setLocationManagerSemaphore:](v2, "setLocationManagerSemaphore:", v3);

  }
  return v2;
}

- (id)serviceName
{
  return CFSTR("FMF");
}

- (void)start
{
  objc_super v3;

  -[FMFServiceProvider performInitialSetup](self, "performInitialSetup");
  v3.receiver = self;
  v3.super_class = (Class)FMFServiceProvider;
  -[ServiceProvider start](&v3, "start");
}

- (void)performInitialSetup
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  FMFServiceProvider *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  dispatch_time_t v49;
  void *v50;
  _QWORD block[4];
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;

  if (!-[FMFServiceProvider hasCompletedInitialSetup](self, "hasCompletedInitialSetup"))
  {
    v3 = -[FindBaseServiceProvider authInvalidError](self, "authInvalidError");
    v4 = +[APSTokenWatcher sharedInstance](APSTokenWatcher, "sharedInstance");
    v5 = objc_msgSend(objc_alloc((Class)FMNanoIDSManager), "initWithServiceId:minimumVersion:", CFSTR("com.apple.private.alloy.fmflocator"), 4);
    -[FMFServiceProvider setIdsManager:](self, "setIdsManager:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
    v7 = objc_msgSend(v6, "isBuddyDone");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("purplebuddy.setupdone"), 0);

      if ((_DWORD)v3 == 1196379972)
      {
        v24 = sub_10001C4E8();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider fm_logID](self, "fm_logID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "username"));
          *(_DWORD *)buf = 138412546;
          v54 = v26;
          v55 = 2112;
          v56 = v28;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ found account: %@", buf, 0x16u);

        }
        -[FindBaseServiceProvider setAllowServerRequests:](self, "setAllowServerRequests:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
        objc_msgSend(v29, "setDelegate:", self);

        v30 = objc_claimAutoreleasedReturnValue(+[FMFLocatorDaemon sharedInstance](FMFLocatorDaemon, "sharedInstance"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "apsEnvironmentConstant"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30, "apsHandlerForEnvironment:", v32));

        objc_msgSend(v33, "registerDelegate:forTopic:", self, CFSTR("com.apple.mobileme.fmf"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "apsToken"));
        LOBYTE(v30) = v34 == 0;

        if ((v30 & 1) != 0)
        {
          v44 = sub_10001C4E8();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider fm_logID](self, "fm_logID"));
            *(_DWORD *)buf = 138412290;
            v54 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%@ No APS token yet", buf, 0xCu);

          }
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
          v48 = objc_msgSend(v47, "isInternalBuild");

          if (v48)
          {
            objc_initWeak((id *)buf, self);
            v49 = dispatch_time(0, 5000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000C590;
            block[3] = &unk_1000553F0;
            objc_copyWeak(&v52, (id *)buf);
            dispatch_after(v49, (dispatch_queue_t)&_dispatch_main_q, block);
            objc_destroyWeak(&v52);
            objc_destroyWeak((id *)buf);
          }
        }
        else
        {
          v35 = self;
          objc_sync_enter(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "apsToken"));
          -[FindBaseServiceProvider setApsToken:](v35, "setApsToken:", v36);

          objc_sync_exit(v35);
          -[FMFServiceProvider _sendStartupRegister](v35, "_sendStartupRegister");
        }
        -[FMFServiceProvider registerCommonNotifications](self, "registerCommonNotifications");
        -[FMFServiceProvider _registerIDSServices](self, "_registerIDSServices");
        -[FindBaseServiceProvider updateProactiveMonitorRegistration](self, "updateProactiveMonitorRegistration");
        -[FMFServiceProvider setHasCompletedInitialSetup:](self, "setHasCompletedInitialSetup:", 1);

      }
      else if ((_DWORD)v3 == 1481920331)
      {
        v9 = sub_10001C4E8();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceName](self, "serviceName"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));
          v14 = sub_10000EC88(1481920331);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          *(_DWORD *)buf = 138412802;
          v54 = v11;
          v55 = 2112;
          v56 = v13;
          v57 = 2112;
          v58 = v15;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@: Account %@ is invalid due to '%@' - will not register at this time", buf, 0x20u);

        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
        v17 = objc_msgSend(v16, "isInternalBuild");

        if (v17)
        {
          v18 = sub_10001C4E8();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceName](self, "serviceName"));
            *(_DWORD *)buf = 138412290;
            v54 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ is not functional as authentication credentials are not available.", buf, 0xCu);

          }
        }
        -[FMFServiceProvider requestAuthenticationShouldForce:](self, "requestAuthenticationShouldForce:", 1);
      }
      else
      {
        v37 = sub_10001C4E8();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceName](self, "serviceName"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "username"));
          v42 = sub_10000EC88(v3);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          *(_DWORD *)buf = 138412802;
          v54 = v39;
          v55 = 2112;
          v56 = v41;
          v57 = 2112;
          v58 = v43;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%@: Account %@ is invalid due to '%@' - will not register at this time", buf, 0x20u);

        }
      }
    }
    else
    {
      v21 = sub_10001C4E8();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceName](self, "serviceName"));
        *(_DWORD *)buf = 138412290;
        v54 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@: Buddy is not complete yet. Waiting...", buf, 0xCu);

      }
      -[FMFServiceProvider _checkForBuddyCompletion](self, "_checkForBuddyCompletion");
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider idsManager](self, "idsManager"));
    objc_msgSend(v50, "start");

  }
}

- (void)_sendStartupRegister
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  __CFString *v13;
  __CFString *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountAddTime"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountAddTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLocatorDaemon sharedInstance](FMFLocatorDaemon, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startTime"));
    v10 = objc_msgSend(v7, "compare:", v9);

    if (v10 != (id)-1)
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AccountAdded")));
      -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", v14);
      goto LABEL_8;
    }
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLocatorDaemon sharedInstance](FMFLocatorDaemon, "sharedInstance"));
  v12 = objc_msgSend(v11, "isFirstRunAfterBoot");
  v13 = CFSTR("Restart");
  if (v12)
    v13 = CFSTR("DeviceRestart");
  v14 = v13;

  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", v14);
LABEL_8:

}

- (void)registerCommonNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "fmfRestrictionsChanged:", CFSTR("FMFRestrictionsMayHaveChangedNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "pairedDevicesChanged:", CFSTR("nano.devicedidpair"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "pairedDevicesChanged:", CFSTR("nano.devicedidunpair"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "pairedDevicesChanged:", NRPairedDeviceRegistryDeviceDidPairNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "pairedDevicesChanged:", NRPairedDeviceRegistryDeviceDidUnpairNotification, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C9C4;
  v12[3] = &unk_100055208;
  v12[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("kAPSTokenWatcherUpdatedNotification"), 0, v9, v12));
  -[FMFServiceProvider setTokenWatcherObserverToken:](self, "setTokenWatcherObserverToken:", v10);

  v11.receiver = self;
  v11.super_class = (Class)FMFServiceProvider;
  -[FindBaseServiceProvider registerCommonNotifications](&v11, "registerCommonNotifications");
}

- (void)deregisterCommonNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("FMFRestrictionsMayHaveChangedNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("nano.devicedidpair"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("nano.devicedidunpair"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider tokenWatcherObserverToken](self, "tokenWatcherObserverToken"));
  objc_msgSend(v6, "removeObserver:", v7);

  -[FMFServiceProvider setTokenWatcherObserverToken:](self, "setTokenWatcherObserverToken:", 0);
  v8.receiver = self;
  v8.super_class = (Class)FMFServiceProvider;
  -[FindBaseServiceProvider deregisterCommonNotifications](&v8, "deregisterCommonNotifications");
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMFServiceProvider;
  -[ServiceProvider stop](&v3, "stop");
  -[FindBaseServiceProvider setAllowServerRequests:](self, "setAllowServerRequests:", 0);
}

- (void)accountDeactivated
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;

  v10.receiver = self;
  v10.super_class = (Class)FMFServiceProvider;
  -[ServiceProvider accountDeactivated](&v10, "accountDeactivated");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
  objc_msgSend(v3, "eventDidOccur:", 1);

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider fm_logID](self, "fm_logID"));
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Removing any fences that were set...", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  objc_msgSend(v7, "setFencesToMonitor:withFenceVersion:triggerValidityDuration:andTriggerURL:", 0, 0, 0, 0.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider buddyWaitTimer](self, "buddyWaitTimer"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider buddyWaitTimer](self, "buddyWaitTimer"));
    objc_msgSend(v9, "invalidate");

    -[FMFServiceProvider setBuddyWaitTimer:](self, "setBuddyWaitTimer:", 0);
  }
  -[FMFServiceProvider setWaitingForBuddy:](self, "setWaitingForBuddy:", 0);
  -[FindBaseServiceProvider deleteRegisterDigest](self, "deleteRegisterDigest");
  +[RealmSupport setServerContextHeaderString:](RealmSupport, "setServerContextHeaderString:", 0);
  -[FindBaseServiceProvider unregisterDevice](self, "unregisterDevice");
}

- (void)accountDidChange
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v4 = -[FMFServiceProvider hasCompletedInitialSetup](self, "hasCompletedInitialSetup");
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider fm_logID](self, "fm_logID"));
      v11 = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Sending register because account changed", (uint8_t *)&v11, 0xCu);

    }
    -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("AccountChange"));
  }
  else
  {
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider fm_logID](self, "fm_logID"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Attempting to start this FMF provider again because account changed", (uint8_t *)&v11, 0xCu);

    }
    -[FMFServiceProvider performInitialSetup](self, "performInitialSetup");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "internalAuthToken"));

  if (!v10)
    -[FMFServiceProvider requestAuthenticationShouldForce:](self, "requestAuthenticationShouldForce:", 0);

}

- (void)deinitializeProvider
{
  void *v3;
  FMFServiceProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMFServiceProvider;
  -[FindBaseServiceProvider deinitializeProvider](&v10, "deinitializeProvider");
  -[FMFServiceProvider deregisterCommonNotifications](self, "deregisterCommonNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  v4 = (FMFServiceProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  if (v4 == self)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
    objc_msgSend(v5, "setDelegate:", 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLocatorDaemon sharedInstance](FMFLocatorDaemon, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "apsEnvironmentConstant"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "apsHandlerForEnvironment:", v8));

  objc_msgSend(v9, "deregisterDelegate:", self);
}

- (id)serviceIdentifierInURL
{
  return CFSTR("fmf");
}

- (id)copyHandlerForCommand:(id)a3 params:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v19[3];
  _QWORD v20[3];

  v6 = a3;
  v8 = a4;
  v9 = (void *)qword_1000695B0;
  if (!qword_1000695B0)
  {
    v19[0] = CFSTR("register");
    v20[0] = objc_opt_class(CommandHandlerRegistration, v7);
    v19[1] = CFSTR("locate");
    v20[1] = objc_opt_class(CommandHandlerLocate, v10);
    v19[2] = CFSTR("fence");
    v20[2] = objc_opt_class(CommandHandlerFences, v11);
    v12 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
    v13 = (void *)qword_1000695B0;
    qword_1000695B0 = v12;

    v9 = (void *)qword_1000695B0;
  }
  v14 = (objc_class *)objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  if (v14)
  {
    v15 = objc_msgSend([v14 alloc], "initWithParams:provider:", v8, self);
  }
  else
  {
    v16 = sub_10001C4E8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_100033BE8(self, (uint64_t)v6, v17);

    v15 = 0;
  }

  return v15;
}

- (BOOL)isProviderEnabledForLocations
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFConfig sharedInstance](FMFConfig, "sharedInstance"));
  if (objc_msgSend(v2, "isLocationServicesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFConfig sharedInstance](FMFConfig, "sharedInstance"));
    v4 = objc_msgSend(v3, "isLocationServicesEnabledForShareMyLocation");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_constructStandardDeviceContext
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMFServiceProvider;
  v2 = -[FindBaseServiceProvider _constructStandardDeviceContext](&v7, "_constructStandardDeviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  v5 = objc_msgSend(v4, "bccOnFenceTrigger");

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("bccOnFenceTrigger"));
  return v3;
}

- (id)_constructVolatileFullDeviceInfo
{
  id v3;
  void *v4;
  FMFServiceProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FMFServiceProvider;
  v3 = -[FindBaseServiceProvider _constructVolatileFullDeviceInfo](&v18, "_constructVolatileFullDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider apsToken](v5, "apsToken"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("aps-token"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APSTokenWatcher sharedInstance](APSTokenWatcher, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tokenList"));

  if (v6 && (objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
  {
    v9 = sub_10001C4E8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_100033C94(v10);

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:", v6));
    v8 = (void *)v11;
  }
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("allPushTokens"), v8);

  objc_sync_exit(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[FMFServiceProvider _isFMFAppRestrictionSet](FMFServiceProvider, "_isFMFAppRestrictionSet")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("fmfRestrictions"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](v5, "account"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "isActive")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("fmf"));

  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("fmfVersion"), CFSTR("526"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("fmfBuildVersion"), CFSTR("5.0"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fenceVersion"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("fenceVersion"), v16);

  return v4;
}

- (id)_constructNonVolatileFullDeviceInfo
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFServiceProvider;
  v2 = -[FindBaseServiceProvider _constructNonVolatileFullDeviceInfo](&v8, "_constructNonVolatileFullDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend((id)v4, "isRegionMonitoringAvailable")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fenceMonitoringCapable"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFConfig sharedInstance](FMFConfig, "sharedInstance"));
  LOBYTE(v4) = objc_msgSend(v6, "isFMFAllowed");

  if ((v4 & 1) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("fmfBlocked"));
  return v3;
}

- (id)newLocationManager
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)CLLocationManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework")));
  v4 = objc_msgSend(v2, "initWithEffectiveBundle:", v3);

  return v4;
}

- (void)_triggerFence:(id)a3 atLocation:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  objc_msgSend(v7, "triggerFence:atLocation:", v6, v5);

}

- (void)sendTriggeredFence:(id)a3 withTriggerLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  FMRequestFenceTrigger *v21;
  void *v22;
  FMRequestFenceTrigger *v23;
  uint64_t v24;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "shouldUseIDSTrigger"))
  {
    -[FMFServiceProvider _triggerFence:atLocation:](self, "_triggerFence:atLocation:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "triggerURL"));
    v9 = sub_100026EA4((uint64_t)objc_msgSend(v6, "lastTrigger"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!v8 || !objc_msgSend(v8, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "triggerURL"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider substituteStandardURLPlaceholders:](self, "substituteStandardURLPlaceholders:", v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fenceId"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fenceId"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${fenceId}"), v14));

        v8 = (void *)v15;
      }
      if (v10)
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${triggerAction}"), v10));

        v8 = (void *)v16;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
    v18 = sub_10001C4E8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceName](self, "serviceName"));
      *(_DWORD *)buf = 138412802;
      v30 = v20;
      v31 = 2080;
      v32 = "-[FMFServiceProvider sendTriggeredFence:withTriggerLocation:]";
      v33 = 2112;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: %s: %@", buf, 0x20u);

    }
    v21 = [FMRequestFenceTrigger alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
    objc_msgSend(v22, "triggerValidityDuration");
    v23 = -[FMRequestFenceTrigger initWithProvider:triggeredLocation:fence:validityDuration:triggerURL:](v21, "initWithProvider:triggeredLocation:fence:validityDuration:triggerURL:", self, v7, v6, v17);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000D8D4;
    v28[3] = &unk_100055418;
    v28[4] = self;
    -[FMRequest setCompletionHandler:](v23, "setCompletionHandler:", v28);
    v24 = ct_green_tea_logger_create_static("fmflocatord");
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v24);
    v26 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
    v27 = v26;
    if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
    }

    -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v23);
  }

}

- (void)ackFencesCommand:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  FMRequestAckFences *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  FMFServiceProvider *v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ackURL")));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
    v10 = -[FMRequestAckFences initWithProvider:fencesCommand:ackURL:]([FMRequestAckFences alloc], "initWithProvider:fencesCommand:ackURL:", self, v6, v9);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10000DC1C;
    v16 = &unk_100055440;
    v17 = self;
    v18 = v7;
    -[FMRequest setCompletionHandler:](v10, "setCompletionHandler:", &v13);
    -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v10, v13, v14, v15, v16, v17);

  }
  else
  {
    v11 = sub_10001C4E8();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceName](self, "serviceName"));
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: Not acking the fences command because there is no ack URL", buf, 0xCu);

    }
  }

}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceName](self, "serviceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ - Auth failure received for account %@", (uint8_t *)&v11, 0x16u);

  }
  v10 = objc_msgSend(v4, "showAuthFailedMessage");

  if (v10)
    -[FMFServiceProvider requestAuthenticationShouldForce:](self, "requestAuthenticationShouldForce:", 1);
}

- (void)tryToFetchAuthToken
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authToken"));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    -[FMFServiceProvider requestAuthenticationShouldForce:](self, "requestAuthenticationShouldForce:", 0);
}

- (void)requestAuthenticationShouldForce:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[AppleAccountManager sharedInstance](AppleAccountManager, "sharedInstance"));
  objc_msgSend(v4, "requestAuthenticationShouldForce:completion:", v3, 0);

}

- (void)_checkForBuddyCompletion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E01C;
  block[3] = &unk_100055230;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_registerIDSServices
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider idsManager](self, "idsManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E2D4;
  v4[3] = &unk_100055468;
  v4[4] = self;
  objc_msgSend(v3, "handleRequestsOfType:withHandler:", 1, v4);

}

- (id)connectionStringForNRDevice:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString **v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  unsigned int v15;
  id v16;
  int v18;
  id v19;
  __int16 v20;
  __CFString *v21;

  v4 = a3;
  v5 = CFSTR("unknown");
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider idsManager](self, "idsManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "devices"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceForNRDevice:fromIDSDevices:", v4, v8));

  if (v10)
  {
    if ((objc_msgSend(v10, "isNearby") & 1) != 0)
    {
      v11 = &off_1000560D8;
    }
    else
    {
      v15 = objc_msgSend(v10, "isConnected");
      v11 = &off_1000560E0;
      if (v15)
        v11 = &off_1000560F0;
    }
    v14 = *v11;

    v16 = sub_10001C4E8();
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMFServiceProvider : match ids device %@ %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    v12 = sub_10001C4E8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMFServiceProvider : !match ids device %@", (uint8_t *)&v18, 0xCu);
    }
    v14 = v5;
  }

  objc_autoreleasePoolPop(v6);
  return v14;
}

- (void)didReceiveAPSMessage:(id)a3
{
  id v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  -[FMFServiceProvider _beginXPCTransaction](self, "_beginXPCTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
  objc_msgSend(v5, "eventDidOccur:", 4);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SRFMFNotificationReceived"), 0, 0, 1u);
  v7 = -[FindBaseServiceProvider essentialServerInfoMissingError](self, "essentialServerInfoMissingError");
  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((_DWORD)v7 == 1196379972)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_100033CD4(self, v4, v10);

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverContext")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intents")));
    -[FindBaseServiceProvider sendQueueCheckRequest:withReasons:](self, "sendQueueCheckRequest:withReasons:", v10, v11);
    goto LABEL_7;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider fm_logID](self, "fm_logID"));
    v13 = sub_10000EC88(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Ignoring APS message since some essential server info is missing = '%@'", (uint8_t *)&v14, 0x16u);

LABEL_7:
  }

  -[FMFServiceProvider _endXPCTransaction](self, "_endXPCTransaction");
}

- (void)didReceiveAPSToken:(id)a3
{
  FMFServiceProvider *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider apsToken](v4, "apsToken"));

  -[FindBaseServiceProvider setApsToken:](v4, "setApsToken:", v6);
  if (v5)
    -[FindBaseServiceProvider registerDeviceWithCause:](v4, "registerDeviceWithCause:", CFSTR("APSTokenReceived"));
  else
    -[FMFServiceProvider _sendStartupRegister](v4, "_sendStartupRegister");
  objc_sync_exit(v4);

}

- (void)fenceTriggered:(id)a3 atLocation:(id)a4
{
  -[FMFServiceProvider sendTriggeredFence:withTriggerLocation:](self, "sendTriggeredFence:withTriggerLocation:", a3, a4);
}

+ (BOOL)_isFMFAppRestrictionSet
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", MCFeatureFindMyFriendsModificationAllowed);

  return v3 == 2;
}

- (void)_buddyCompletionCheckTimerFired:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Buddy completion check timer fired", v6, 2u);
  }

  -[FMFServiceProvider _checkForBuddyCompletion](self, "_checkForBuddyCompletion");
}

- (void)buddyDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider fm_logID](self, "fm_logID"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Buddy completion notification received", (uint8_t *)&v7, 0xCu);

  }
  -[FMFServiceProvider _checkForBuddyCompletion](self, "_checkForBuddyCompletion");
}

- (void)fmfRestrictionsChanged:(id)a3
{
  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("FMFRestrictionsChanged"));
}

- (void)pairedDevicesChanged:(id)a3
{
  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("PairedDevicesChanged"));
}

- (void)_beginXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "beginTransaction:", v7);

}

- (void)_endXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "endTransaction:", v7);

}

- (BOOL)hasCompletedInitialSetup
{
  return self->_hasCompletedInitialSetup;
}

- (void)setHasCompletedInitialSetup:(BOOL)a3
{
  self->_hasCompletedInitialSetup = a3;
}

- (OS_dispatch_semaphore)locationManagerSemaphore
{
  return self->_locationManagerSemaphore;
}

- (void)setLocationManagerSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_locationManagerSemaphore, a3);
}

- (id)tokenWatcherObserverToken
{
  return self->_tokenWatcherObserverToken;
}

- (void)setTokenWatcherObserverToken:(id)a3
{
  objc_storeStrong(&self->_tokenWatcherObserverToken, a3);
}

- (NSTimer)buddyWaitTimer
{
  return self->_buddyWaitTimer;
}

- (void)setBuddyWaitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_buddyWaitTimer, a3);
}

- (BOOL)waitingForBuddy
{
  return self->_waitingForBuddy;
}

- (void)setWaitingForBuddy:(BOOL)a3
{
  self->_waitingForBuddy = a3;
}

- (FMNanoIDSManager)idsManager
{
  return self->_idsManager;
}

- (void)setIdsManager:(id)a3
{
  objc_storeStrong((id *)&self->_idsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_buddyWaitTimer, 0);
  objc_storeStrong(&self->_tokenWatcherObserverToken, 0);
  objc_storeStrong((id *)&self->_locationManagerSemaphore, 0);
}

@end
