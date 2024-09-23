@implementation FMDDaemon

+ (id)sharedInstance
{
  if (qword_100306430 != -1)
    dispatch_once(&qword_100306430, &stru_1002C1848);
  return (id)qword_100306428;
}

- (FMDDaemon)init
{
  FMDDaemon *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *apsHandlers;
  dispatch_queue_t v5;
  OS_dispatch_queue *apsHandlersModQueue;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMDDaemon;
  v2 = -[FMDDaemon init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    apsHandlers = v2->_apsHandlers;
    v2->_apsHandlers = v3;

    v5 = dispatch_queue_create("APSHandlers-Mods", 0);
    apsHandlersModQueue = v2->_apsHandlersModQueue;
    v2->_apsHandlersModQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init((Class)FMStateCapture);
    -[FMDDaemon setStateCapture:](v2, "setStateCapture:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDaemon stateCapture](v2, "stateCapture"));
    objc_msgSend(v8, "setStateCaptureBlock:", &stru_1002C1868);

  }
  return v2;
}

- (void)startupWithCompletion:(id)a3
{
  -[FMDDaemon _startupNowWithCompletion:](self, "_startupNowWithCompletion:", a3);
}

- (void)_startupNowWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  NSObject *v24;
  void *v25;
  FMDEventLoggerEventLaunch *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  void *v33;
  _QWORD block[5];
  uint8_t buf[16];
  void *v36;

  v4 = (void (**)(_QWORD))a3;
  -[FMDDaemon migrateAosnotifydStuff](self, "migrateAosnotifydStuff");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance"));
  objc_msgSend(v5, "recalculateLostMode");

  -[FMDDaemon waitForSpringBoard](self, "waitForSpringBoard");
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "************ FindMyDevice Daemon Starting... ************", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMDDaemon setStartTime:](self, "setStartTime:", v8);

  -[FMDDaemon versionCheck](self, "versionCheck");
  -[FMDDaemon calculateFirstRunStatus](self, "calculateFirstRunStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v9, "setLaunchOnRebootActivity:keepAliveActivity:", CFSTR("com.apple.icloud.findmydeviced.launch-on-reboot"), CFSTR("com.apple.icloud.findmydeviced.keep-alive-on-dirty"));

  v10 = +[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance");
  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_100226070(v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v13, "isInternalBuild"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v15 = objc_msgSend(v14, "isRunningInRecovery");

    if ((v15 & 1) != 0)
      goto LABEL_12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDaemon verifyLaunchEventsConfiguration:withExclusions:](self, "verifyLaunchEventsConfiguration:withExclusions:", CFSTR("/System/Library/LaunchDaemons/com.apple.icloud.findmydeviced.plist"), &off_1002D8EB8));
    if (v13)
    {
      v16 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100226010();

    }
  }

LABEL_12:
  v18 = sub_1000031B8();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_100225F60(v19);

  -[FMDDaemon startServiceProviders](self, "startServiceProviders");
  v20 = +[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMNetworkMonitor sharedInstance](FMNetworkMonitor, "sharedInstance"));
  v22 = objc_msgSend(v21, "isMonitoring");

  if ((v22 & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMNetworkMonitor sharedInstance](FMNetworkMonitor, "sharedInstance"));
    objc_msgSend(v23, "startMonitoring");

  }
  -[FMDDaemon cleanupPostWipe](self, "cleanupPostWipe");
  -[FMDDaemon setStartupComplete:](self, "setStartupComplete:", 1);
  -[FMDDaemon checkInAllAPSHandlers](self, "checkInAllAPSHandlers");
  v24 = objc_claimAutoreleasedReturnValue(-[FMDDaemon apsHandlersModQueue](self, "apsHandlersModQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016580;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_sync(v24, block);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FMDXPCManager sharedInstance](FMDXPCManager, "sharedInstance"));
  objc_msgSend(v25, "initializeXPC");

  -[FMDDaemon _performPostStartupTasks](self, "_performPostStartupTasks");
  if (v4)
    v4[2](v4);
  v26 = -[FMDEventLoggerEventLaunch initWithEventName:]([FMDEventLoggerEventLaunch alloc], "initWithEventName:", CFSTR("FMDDaemonLaunchEvent"));
  -[FMDEventLoggerEventLaunch setLaunchReason:](v26, "setLaunchReason:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLogger sharedLogger](FMDEventLogger, "sharedLogger"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityDataPeek facilityName](FMDEventLoggerFacilityDataPeek, "facilityName"));
  v36 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  objc_msgSend(v27, "logEvent:toFacilitiesNamed:", v26, v29);

  if (!MKBGetDeviceLockState(0, v30))
  {
    v31 = sub_1000031B8();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Start clearing up empty folders", buf, 2u);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    objc_msgSend(v33, "cleanupEmptyFolders");

  }
}

- (void)checkInAllAPSHandlers
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[3];

  v5[0] = CFSTR("production");
  v5[1] = CFSTR("development");
  v5[2] = CFSTR("demo");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016778;
  v4[3] = &unk_1002C1890;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (id)apsHandlerForEnvironment:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100016990;
  v17 = sub_1000169A0;
  v18 = 0;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FMDDaemon apsHandlersModQueue](self, "apsHandlersModQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000169A8;
    block[3] = &unk_1002C18B8;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(v5, block);

  }
  else
  {
    v6 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1002260B0(v7);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)startServiceProviders
{
  FMDFMIPServiceProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v3 = objc_alloc_init(FMDFMIPServiceProvider);
  -[FMDDaemon setActiveServiceProvider:](self, "setActiveServiceProvider:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDaemon activeServiceProvider](self, "activeServiceProvider"));
  objc_msgSend(v4, "start");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
  objc_msgSend(v5, "syncFMIPAccountInfo");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDaemon activeServiceProvider](self, "activeServiceProvider"));
  v7 = objc_msgSend(v6, "newLocationManager");

  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Started Location Manager (handling launch event) %p", (uint8_t *)&v10, 0xCu);
  }

}

- (id)xpcDarwinEventHandlers
{
  if (qword_100306440 != -1)
    dispatch_once(&qword_100306440, &stru_1002C18D8);
  return (id)qword_100306438;
}

- (id)xpcDistributedEventHandlers
{
  if (qword_100306450 != -1)
    dispatch_once(&qword_100306450, &stru_1002C1BE8);
  return (id)qword_100306448;
}

- (void)versionCheck
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  void *v12;
  uint8_t v13[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buildVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = objc_msgSend(v5, "isRunningInRecovery");

  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v9)
      goto LABEL_7;
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)&v13[4] = v4;
    v10 = "OS: %@ [Recovery Partition]";
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)&v13[4] = v4;
    v10 = "OS: %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, v13, 0xCu);
LABEL_7:

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr lastLaunchVersion](FMDPreferencesMgr, "lastLaunchVersion"));
  v12 = v11;
  if (v11)
  {
    if ((objc_msgSend(v11, "isEqualToString:", v4) & 1) == 0)
      -[FMDDaemon migrateFromVersion:toVersion:](self, "migrateFromVersion:toVersion:", v12, v4);
  }
  else
  {
    -[FMDDaemon initialLaunchProcessing](self, "initialLaunchProcessing");
  }
  +[FMDPreferencesMgr setLastLaunchVersion:](FMDPreferencesMgr, "setLastLaunchVersion:", v4, *(_OWORD *)v13);

}

- (void)initialLaunchProcessing
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_1000031B8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initial launch", v4, 2u);
  }

}

- (void)migrateFromVersion:(id)a3 toVersion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "compare:", v6);
  if (v7 == (id)1)
  {
    v17 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2112;
      v23 = v6;
      v14 = "Back-migration from %@ to %@";
      v15 = v13;
      v16 = 22;
      goto LABEL_11;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v7 != (id)-1)
  {
    v18 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100226150();
    goto LABEL_14;
  }
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrating from %@ to %@", buf, 0x16u);
  }

  if (objc_msgSend(CFSTR("12A196"), "compare:", v5) != (id)-1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = 0;
    objc_msgSend(v10, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/Logs/findmydeviced"), &v19);
    v11 = v19;

    if (v11)
    {
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "Failed to delete log directory. findmydeviced logging may not work";
        v15 = v13;
        v16 = 2;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)calculateFirstRunStatus
{
  sem_t *v3;
  id v4;
  NSObject *v5;
  sem_t *v6;
  id v7;
  NSObject *v8;
  int *v9;
  char *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;

  v3 = sem_open("findmydeviced.boot_check", 0);
  if (v3 == (sem_t *)-1)
  {
    -[FMDDaemon setIsFirstRunAfterBoot:](self, "setIsFirstRunAfterBoot:", 1);
    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "This is the first run after a boot", buf, 2u);
    }

    v6 = sem_open("findmydeviced.boot_check", 512, 256, 0);
    if (v6 == (sem_t *)-1)
    {
      v7 = sub_1000031B8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 136315394;
        v12 = "findmydeviced.boot_check";
        v13 = 2080;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to create semaphore %s: %s", buf, 0x16u);
      }

    }
    else
    {
      sem_close(v6);
    }
  }
  else
  {
    sem_close(v3);
  }
}

- (void)waitForSpringBoard
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  unsigned int v7;
  id v8;
  id v9;
  uint64_t v10;
  int out_token;
  uint8_t buf[4];
  uint64_t v13;

  if (MGGetBoolAnswer(CFSTR("HasSpringBoard"), a2))
  {
    out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token != -1)
    {
      v10 = 0;
      notify_get_state(out_token, &v10);
      v2 = v10;
      v3 = sub_1000031B8();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (v5)
        {
          *(_WORD *)buf = 0;
          v6 = "SpringBoard is already running. Continuing to start findmydeviced";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
        }
      }
      else
      {
        if (v5)
        {
          *(_DWORD *)buf = 134217984;
          v13 = 20;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Waiting upto %ld seconds for SpringBoard to start...", buf, 0xCu);
        }

        if (!v10)
        {
          v7 = 0;
          do
          {
            sleep(1u);
            notify_get_state(out_token, &v10);
            if (v7 > 0x12)
              break;
            ++v7;
          }
          while (!v10);
          if (!v10)
          {
            v9 = sub_1000031B8();
            v4 = objc_claimAutoreleasedReturnValue(v9);
            if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
              goto LABEL_16;
            *(_WORD *)buf = 0;
            v6 = "Timed out while waiting for SpringBoard to start. Continuing to start findmydeviced anyway";
            goto LABEL_15;
          }
        }
        v8 = sub_1000031B8();
        v4 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v6 = "SpringBoard has started. Continuing to start findmydeviced";
          goto LABEL_15;
        }
      }
LABEL_16:

    }
  }
}

- (void)_performPostStartupTasks
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kFMDStartupCompleteNotification, 0, 0, 1u);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v3, kFMDLocalActivationLockInfoChangedNotification, 0, 0, 1u);
  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDLocalActivationLockInfoManager posted activationLockInfo changed notification after startup", v6, 2u);
  }

}

- (void)cleanupPostWipe
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v14;
  uint8_t buf[4];
  void *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v3 = objc_msgSend(v2, "isBuddyDone");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPWipeLostModeInfo"), kFMDPostWipePrefDomain));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("lostModeEnabled")));
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      v14 = 0;
      v7 = (void *)MAEGetActivationStateWithError(&v14);
      v8 = v14;
      if (v8)
      {
        v9 = sub_1000031B8();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_1002260F0();

      }
      v11 = sub_1000031B8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Doing fallback cleanup of postwipe preferences.  Activation state: [%@]", buf, 0xCu);
      }

      +[FMDPreferencesMgr setFMIPWipeLostModeInfo:](FMDPreferencesMgr, "setFMIPWipeLostModeInfo:", 0);
    }

  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100018400, CFSTR("com.apple.purplebuddy.setupdone"), 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)migrateAosnotifydStuff
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t buf[16];

  if (!+[FMDPreferencesMgr importedAosnotifydData](FMDPreferencesMgr, "importedAosnotifydData"))
  {
    v2 = sub_1000031B8();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking for stuff to migrate from aosnotifyd", buf, 2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/FMIP-trackedLocations.dat"), CFSTR("/var/mobile/Library/Caches/com.apple.aosnotifyd")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v7, "removeItemAtPath:error:", v4, 0);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v8, "moveItemAtPath:toPath:error:", CFSTR("/var/mobile/Library/Preferences/com.apple.AOSNotification.FMIPAccounts.plist"), CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v9, "moveItemAtPath:toPath:error:", CFSTR("/var/mobile/Library/Preferences/com.apple.AOSNotification.FMIPAccounts.notbackedup.plist"), CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist"), 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("_trackingInfo_FMIP"), CFSTR("com.apple.AOSNotification.notbackedup")));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationTracker stringForLocationTrackerType:](FMDLocationTracker, "stringForLocationTrackerType:", 0));
      +[FMDPreferencesMgr setTrackingInfo:forType:](FMDPreferencesMgr, "setTrackingInfo:forType:", v10, v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("ClientLostModeInfo"), CFSTR("com.apple.AOSNotification.public.notbackedup")));
    if (v12)
      +[FMDPreferencesMgr setClientLostModeInfo:](FMDPreferencesMgr, "setClientLostModeInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPWipeLostModeInfo"), CFSTR("com.apple.AOSNotification.postwipe")));
    if (v13)
      +[FMDPreferencesMgr setFMIPWipeLostModeInfo:](FMDPreferencesMgr, "setFMIPWipeLostModeInfo:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPLostModeInfo"), CFSTR("com.apple.AOSNotification.public.notbackedup")));
    if (v14)
      +[FMDPreferencesMgr setLostModeInfo:](FMDPreferencesMgr, "setLostModeInfo:", v14);
    v15 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("_wipeState"), CFSTR("com.apple.AOSNotification.notbackedup"));
    if (v15)
      +[FMDPreferencesMgr setWipeState:](FMDPreferencesMgr, "setWipeState:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("_wipeInfo"), CFSTR("com.apple.AOSNotification.notbackedup")));
    if (v16)
      +[FMDPreferencesMgr setWipeInfo:](FMDPreferencesMgr, "setWipeInfo:", v16);
    +[FMDPreferencesMgr setImportedAosnotifydData:](FMDPreferencesMgr, "setImportedAosnotifydData:", 1);

  }
}

- (BOOL)isFirstRunAfterBoot
{
  return self->_isFirstRunAfterBoot;
}

- (void)setIsFirstRunAfterBoot:(BOOL)a3
{
  self->_isFirstRunAfterBoot = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (BOOL)logLevelsMaxedOut
{
  return self->_logLevelsMaxedOut;
}

- (void)setLogLevelsMaxedOut:(BOOL)a3
{
  self->_logLevelsMaxedOut = a3;
}

- (NSMutableDictionary)apsHandlers
{
  return self->_apsHandlers;
}

- (void)setApsHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_apsHandlers, a3);
}

- (OS_dispatch_queue)apsHandlersModQueue
{
  return self->_apsHandlersModQueue;
}

- (void)setApsHandlersModQueue:(id)a3
{
  objc_storeStrong((id *)&self->_apsHandlersModQueue, a3);
}

- (BOOL)startupComplete
{
  return self->_startupComplete;
}

- (void)setStartupComplete:(BOOL)a3
{
  self->_startupComplete = a3;
}

- (FMDServiceProvider)activeServiceProvider
{
  return self->_activeServiceProvider;
}

- (void)setActiveServiceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activeServiceProvider, a3);
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_stateCapture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_activeServiceProvider, 0);
  objc_storeStrong((id *)&self->_apsHandlersModQueue, 0);
  objc_storeStrong((id *)&self->_apsHandlers, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
