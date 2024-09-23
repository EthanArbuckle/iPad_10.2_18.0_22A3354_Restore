@implementation FMFLocatorDaemon

+ (id)sharedInstance
{
  if (qword_100069568 != -1)
    dispatch_once(&qword_100069568, &stru_100055018);
  return (id)qword_100069560;
}

- (FMFLocatorDaemon)init
{
  FMFLocatorDaemon *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *apsHandlers;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFLocatorDaemon;
  v2 = -[FMFLocatorDaemon init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    apsHandlers = v2->_apsHandlers;
    v2->_apsHandlers = v3;

    v5 = objc_alloc_init((Class)FMStateCapture);
    -[FMFLocatorDaemon setStateCapture:](v2, "setStateCapture:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon stateCapture](v2, "stateCapture"));
    objc_msgSend(v6, "setStateCaptureBlock:", &stru_100055058);

  }
  return v2;
}

- (void)startupWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  void *v7;
  FMFLocatorMigrator *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[8];
  _BYTE v50[128];
  _BYTE v51[128];

  v4 = (void (**)(_QWORD))a3;
  if (MGGetBoolAnswer(CFSTR("HasSpringBoard")))
    -[FMFLocatorDaemon waitForSpringBoard](self, "waitForSpringBoard");
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "\n*******************************************************************************\n                    FMFLocator Daemon Starting...\n*******************************************************************************", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMFLocatorDaemon setStartTime:](self, "setStartTime:", v7);

  -[FMFLocatorDaemon calculateFirstRunStatus](self, "calculateFirstRunStatus");
  if (-[FMFLocatorDaemon isFirstRunAfterBoot](self, "isFirstRunAfterBoot"))
  {
    v8 = objc_alloc_init(FMFLocatorMigrator);
    v9 = -[FMFLocatorMigrator performMigration](v8, "performMigration");

    if ((v9 & 1) == 0)
    {
      v10 = sub_10001C4E8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not perform migration", buf, 2u);
      }

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v12, "setLaunchOnRebootActivity:keepAliveActivity:", CFSTR("com.apple.icloud.fmflocatord.launch-on-reboot"), CFSTR("com.apple.icloud.fmflocatord.keep-alive-on-dirty"));

  v13 = +[SystemConfig sharedInstance](SystemConfig, "sharedInstance");
  v14 = +[FMFAppStateObserver sharedInstance](FMFAppStateObserver, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v16 = objc_msgSend(v15, "isInternalBuild");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon verifyLaunchEventsConfiguration:withExclusions:](self, "verifyLaunchEventsConfiguration:withExclusions:", CFSTR("/System/Library/LaunchDaemons/com.apple.icloud.fmflocatord.plist"), &__NSArray0__struct));
    if (v17)
    {
      v18 = sub_10001C4E8();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        sub_100033640((uint64_t)v17, v19);

    }
  }
  v20 = sub_10001C4E8();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    sub_10003358C(v21);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon apsHandlers](self, "apsHandlers"));
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v46;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon apsHandlers](self, "apsHandlers"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v27));

        objc_msgSend(v29, "suspendRegistrations");
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v24);
  }

  v30 = +[APSTokenWatcher sharedInstance](APSTokenWatcher, "sharedInstance");
  -[FMFLocatorDaemon startServiceProviders](self, "startServiceProviders");
  v31 = +[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance");
  sub_100007D34();
  -[FMFLocatorDaemon setStartupComplete:](self, "setStartupComplete:", 1);
  -[FMFLocatorDaemon checkInAllAPSHandlers](self, "checkInAllAPSHandlers");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon apsHandlers](self, "apsHandlers", 0));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v42;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon apsHandlers](self, "apsHandlers"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v37));

        objc_msgSend(v39, "resumeRegistrations");
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v34);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[XPCManager sharedInstance](XPCManager, "sharedInstance"));
  objc_msgSend(v40, "initializeXPC");

  if (v4)
    v4[2](v4);

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
  v4[2] = sub_100007050;
  v4[3] = &unk_100055080;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (id)apsHandlerForEnvironment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon apsHandlers](self, "apsHandlers"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (!v6)
  {
    v7 = objc_alloc((Class)FMAPSHandler);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud.fmflocatord.aps-"), "stringByAppendingString:", v4));
    v6 = objc_msgSend(v7, "initWithEnvironmentName:launchOnDemandPort:", v4, v8);

    if (!-[FMFLocatorDaemon startupComplete](self, "startupComplete"))
      objc_msgSend(v6, "suspendRegistrations");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorDaemon apsHandlers](self, "apsHandlers"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (void)startServiceProviders
{
  id v2;
  NSObject *v3;
  void *v4;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000336B4(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceProviderMgr sharedInstance](ServiceProviderMgr, "sharedInstance"));
  objc_msgSend(v4, "start");

}

- (id)xpcDarwinEventHandlers
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[8];
  _QWORD v15[8];

  v14[0] = CFSTR("com.apple.locationd/Prefs");
  v2 = objc_msgSend(&stru_1000550A0, "copy");
  v15[0] = v2;
  v14[1] = CFSTR("com.apple.locationd.authorization");
  v3 = objc_msgSend(&stru_1000550C0, "copy");
  v15[1] = v3;
  v14[2] = CFSTR("com.apple.mobileme.fmf1.allowFindMyFriendsModification");
  v4 = objc_msgSend(&stru_1000550E0, "copy");
  v15[2] = v4;
  v14[3] = CFSTR("com.apple.system.hostname");
  v5 = objc_msgSend(&stru_100055100, "copy");
  v15[3] = v5;
  v13[0] = CFSTR("AppleLanguagePreferencesChangedNotification");
  v13[1] = CFSTR("AppleDatePreferencesChangedNotification");
  v13[2] = CFSTR("AppleTimePreferencesChangedNotification");
  v13[3] = CFSTR("AppleNumberPreferencesChangedNotification");
  v13[4] = CFSTR("AppleKeyboardsPreferencesChangedNotification");
  v13[5] = CFSTR("com.apple.language.changed");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));
  v14[4] = v6;
  v7 = objc_msgSend(&stru_100055120, "copy");
  v15[4] = v7;
  v14[5] = CFSTR("com.apple.purplebuddy.setupdone");
  v8 = objc_msgSend(&stru_100055140, "copy");
  v15[5] = v8;
  v14[6] = NRPairedDeviceRegistryDeviceDidPairDarwinNotification;
  v9 = objc_msgSend(&stru_100055160, "copy");
  v15[6] = v9;
  v14[7] = NRPairedDeviceRegistryDeviceDidUnpairDarwinNotification;
  v10 = objc_msgSend(&stru_100055180, "copy");
  v15[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 8));

  return v11;
}

- (id)xpcDistributedEventHandlers
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("com.apple.LaunchServices.applicationRegistered");
  v2 = objc_msgSend(&stru_1000551C0, "copy");
  v6[1] = CFSTR("com.apple.LaunchServices.applicationUnregistered");
  v7[0] = v2;
  v3 = objc_msgSend(&stru_1000551E0, "copy");
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
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

  v3 = sem_open("fmflocatord.boot_check", 0);
  if (v3 == (sem_t *)-1)
  {
    -[FMFLocatorDaemon setIsFirstRunAfterBoot:](self, "setIsFirstRunAfterBoot:", 1);
    v4 = sub_10001C4E8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "This is the first run after a boot", buf, 2u);
    }

    v6 = sem_open("fmflocatord.boot_check", 512, 256, 0);
    if (v6 == (sem_t *)-1)
    {
      v7 = sub_10001C4E8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 136315394;
        v12 = "fmflocatord.boot_check";
        v13 = 2080;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to create semaphore %s: %s", buf, 0x16u);
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

  out_token = -1;
  notify_register_check("com.apple.springboard.finishedstartup", &out_token);
  if (out_token != -1)
  {
    v10 = 0;
    notify_get_state(out_token, &v10);
    v2 = v10;
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        v6 = "SpringBoard is already running. Continuing to start fmflocatord";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v6, buf, 2u);
      }
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        v13 = 0x404E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Waiting upto %.0f seconds for SpringBoard to start...", buf, 0xCu);
      }

      if (!v10)
      {
        v7 = 0;
        do
        {
          sleep(1u);
          notify_get_state(out_token, &v10);
          if (v7 > 0x3A)
            break;
          ++v7;
        }
        while (!v10);
        if (!v10)
        {
          v9 = sub_10001C4E8();
          v4 = objc_claimAutoreleasedReturnValue(v9);
          if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
            goto LABEL_15;
          *(_WORD *)buf = 0;
          v6 = "Timed out while waiting for SpringBoard to start. Continuing to start fmflocatord anyway";
          goto LABEL_14;
        }
      }
      v8 = sub_10001C4E8();
      v4 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v6 = "SpringBoard has started. Continuing to start fmflocatord";
        goto LABEL_14;
      }
    }
LABEL_15:

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

- (BOOL)startupComplete
{
  return self->_startupComplete;
}

- (void)setStartupComplete:(BOOL)a3
{
  self->_startupComplete = a3;
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
  objc_storeStrong((id *)&self->_apsHandlers, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
