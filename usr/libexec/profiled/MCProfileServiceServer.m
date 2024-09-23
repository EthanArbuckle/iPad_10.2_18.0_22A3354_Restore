@implementation MCProfileServiceServer

- (void)checkInWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  os_unfair_lock_s *p_checkInLock;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = _MCLogObjects[2];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Client waiting to check in...", buf, 2u);
  }
  p_checkInLock = &self->_checkInLock;
  os_unfair_lock_lock(p_checkInLock);
  if (v4)
    v4[2](v4, 0);
  v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Client checked in with profiled", v8, 2u);
  }
  os_unfair_lock_unlock(p_checkInLock);

}

+ (id)sharedServer
{
  if (qword_1000FD7F8 != -1)
    dispatch_once(&qword_1000FD7F8, &stru_1000E2C28);
  return (id)qword_1000FD7F0;
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 completion:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  OS_dispatch_queue *workerQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  int v40;
  BOOL v41;
  BOOL v42;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v21 = a11;
  v22 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetParameterForSettings"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004164;
  block[3] = &unk_1000E31A0;
  block[4] = self;
  v33 = v16;
  v41 = a5;
  v42 = a6;
  v34 = v17;
  v35 = v18;
  v40 = a9;
  v36 = v19;
  v37 = v20;
  v38 = v22;
  v39 = v21;
  v24 = v21;
  v25 = v22;
  v26 = v20;
  v27 = v19;
  v28 = v18;
  v29 = v17;
  v30 = v16;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (DMCDaemonConnectionTracker)connectionTracker
{
  return self->_connectionTracker;
}

- (MCProfileServiceServer)init
{
  MCProfileServiceServer *v2;
  MCProfileServiceServer *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workerQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *monitorQueue;
  MCBackgroundActivityManager *v8;
  MCBackgroundActivityManager *workerQueueBackgroundActivityManager;
  dispatch_queue_t v10;
  OS_dispatch_queue *memberQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *clientRestrictionQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *mailAccountsQueue;
  uint64_t v16;
  LSApplicationWorkspace *appWorkspace;
  CoreTelephonyClient *v18;
  CoreTelephonyClient *coreTelephonyClient;
  DMCDaemonConnectionTracker *v20;
  DMCDaemonConnectionTracker *connectionTracker;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MCProfileServiceServer;
  v2 = -[MCProfileServiceServer init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    v2->_checkInLock._os_unfair_lock_opaque = 0;
    v2->_memberQueueIdleTimeInterval = 60.0;
    v4 = dispatch_queue_create("MCProfileServiceServer worker queue", 0);
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("MCProfileServiceServer monitor queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    monitorQueue = v3->_monitorQueue;
    v3->_monitorQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(MCBackgroundActivityManager);
    workerQueueBackgroundActivityManager = v3->_workerQueueBackgroundActivityManager;
    v3->_workerQueueBackgroundActivityManager = v8;

    -[MCBackgroundActivityManager setServer:](v3->_workerQueueBackgroundActivityManager, "setServer:", v3);
    v3->_workerQueueLastCarrierProfileCheckTime = 0;
    v10 = dispatch_queue_create("MCProfileServiceServer member queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    memberQueue = v3->_memberQueue;
    v3->_memberQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("MCProfileServiceServer client restriction queue", 0);
    clientRestrictionQueue = v3->_clientRestrictionQueue;
    v3->_clientRestrictionQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("MCProfileServiceServer mail accounts queue", 0);
    mailAccountsQueue = v3->_mailAccountsQueue;
    v3->_mailAccountsQueue = (OS_dispatch_queue *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    appWorkspace = v3->_appWorkspace;
    v3->_appWorkspace = (LSApplicationWorkspace *)v16;

    v18 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", v3->_workerQueue);
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = v18;

    v20 = (DMCDaemonConnectionTracker *)objc_msgSend(objc_alloc((Class)DMCDaemonConnectionTracker), "initWithProcessName:connectionThreshold:requestThreshold:", CFSTR("profiled"), 2, 5);
    connectionTracker = v3->_connectionTracker;
    v3->_connectionTracker = v20;

  }
  return v3;
}

- (void)start
{
  NSObject *v3;
  id v4;
  OS_dispatch_queue *workerQueue;
  OS_dispatch_queue *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Profile Service Server starting...", buf, 2u);
  }
  v4 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-StartServer"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000076D0;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)workerQueue, block);
  v6 = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000775C;
  v8[3] = &unk_1000E2D20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)v6, v8);

}

- (void)notifyBatterySaverModeChanged
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer clientRestrictionQueue](self, "clientRestrictionQueue"));
  dispatch_async(v2, &stru_1000E2D40);

}

- (void)localeChanged
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-LocaleChanged"));
  -[MCProfileServiceServer reapplyAppEnforcedRestrictionsWithAssertion:](self, "reapplyAppEnforcedRestrictionsWithAssertion:", v3);

}

- (void)reapplyAppEnforcedRestrictionsWithAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer clientRestrictionQueue](self, "clientRestrictionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007ED0;
  block[3] = &unk_1000E2C50;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)_workerQueuePrepareForService
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  id v22;
  OS_dispatch_queue *workerQueue;
  id v24;
  void *v25;
  uint64_t restarted;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  _QWORD v56[5];
  id v57;
  _QWORD block[5];
  uint8_t buf[4];
  void *v60;

  v3 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-WorkerQueue"));
  v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Performing startup checks.", buf, 2u);
  }
  v5 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008688;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_barrier_async(v5, block);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = MCCrashDetectionFilePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v6, "fileExistsAtPath:", v8);

  if (v9)
  {
    v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cleaning up after previous crash", buf, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
    objc_msgSend(v11, "recomputeProfileRestrictionsWithCompletionBlock:", &stru_1000E2D80);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v12, "removeOrphanedClientRestrictions");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = MCCrashDetectionFilePath();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "removeItemAtPath:error:", v15, 0);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
  v17 = objc_msgSend(v16, "isPasscodeSet");

  if ((v17 & 1) == 0)
    -[MCProfileServiceServer workerQueueNotifyDeviceUnlocked](self, "workerQueueNotifyDeviceUnlocked");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = MCOutstandingNagComputationFilePath();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = objc_msgSend(v18, "fileExistsAtPath:", v20);

  if (v21)
  {
    v22 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-OutstandingNag"));
    workerQueue = self->_workerQueue;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100008740;
    v56[3] = &unk_1000E2D20;
    v56[4] = self;
    v57 = v22;
    v24 = v22;
    dispatch_async((dispatch_queue_t)workerQueue, v56);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  restarted = MCSystemRestartLogPath();
  v27 = (void *)objc_claimAutoreleasedReturnValue(restarted);
  v28 = objc_msgSend(v25, "fileExistsAtPath:", v27);

  if (v28)
  {
    v29 = MCSystemRestartLogPath();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v30, 4, 0));

    v32 = _MCLogObjects[2];
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_DWORD *)buf = 138543362;
        v60 = v31;
        v34 = "Device restarted due to MDM command at %{public}@";
        v35 = v32;
        v36 = 12;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
      }
    }
    else if (v33)
    {
      *(_WORD *)buf = 0;
      v34 = "Device restarted due to MDM command at unknown time.";
      v35 = v32;
      v36 = 2;
      goto LABEL_17;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v38 = MCSystemRestartLogPath();
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    objc_msgSend(v37, "removeItemAtPath:error:", v39, 0);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v41 = MCSystemShutDownLogPath();
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v43 = objc_msgSend(v40, "fileExistsAtPath:", v42);

  if (!v43)
    goto LABEL_27;
  v44 = MCSystemShutDownLogPath();
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v45, 4, 0));

  v47 = _MCLogObjects[2];
  v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
  if (v46)
  {
    if (v48)
    {
      *(_DWORD *)buf = 138543362;
      v60 = v46;
      v49 = "Device shut down due to MDM command at %{public}@";
      v50 = v47;
      v51 = 12;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
    }
  }
  else if (v48)
  {
    *(_WORD *)buf = 0;
    v49 = "Device shut down due to MDM command at unknown time.";
    v50 = v47;
    v51 = 2;
    goto LABEL_25;
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v53 = MCSystemShutDownLogPath();
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  objc_msgSend(v52, "removeItemAtPath:error:", v54, 0);

LABEL_27:
  v55 = _MCLogObjects[2];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Completed startup checks.", buf, 2u);
  }

}

- (void)workerQueueDidRecomputeNagMessageWithResult:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _DWORD v12[2];

  v3 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finished recomputing nag message. Success: %d", (uint8_t *)v12, 8u);
  }
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = MCOutstandingNagComputationFilePath();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "removeItemAtPath:error:", v8, 0);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v10 = MCOutstandingNagComputationFilePath();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "writeToFile:atomically:", v11, 1);

    -[MCBackgroundActivityManager scheduleRecomputeNagMetadataJob](self->_workerQueueBackgroundActivityManager, "scheduleRecomputeNagMetadataJob");
  }
}

- (void)workerQueueRecomputeNagMessage
{
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v6[16];

  v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Recomputing passcode requirement message", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v5 = objc_msgSend(v4, "recomputeNagMetadata");

  -[MCProfileServiceServer workerQueueDidRecomputeNagMessageWithResult:](self, "workerQueueDidRecomputeNagMessageWithResult:", v5);
}

- (void)workerQueueCheckForAutoInstallProfiles
{
  const __CFString *v3;
  const __CFString *v4;
  int AppBooleanValue;
  BOOL v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  os_log_t v18;
  NSObject *v19;
  unsigned int v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  os_log_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  MCProfileServiceServer *v42;
  uint64_t v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];

  keyExistsAndHasValidFormat = 0;
  v3 = (const __CFString *)kMCHasCheckedForAutoInstalledProfiles;
  v4 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(kMCHasCheckedForAutoInstalledProfiles, kMCNotBackedUpPreferencesDomain, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v6 = AppBooleanValue == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
    v8 = objc_msgSend(v7, "isDeviceLocked");

    if (v8)
    {
      v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Cannot check for auto-install profiles: device is locked. Checking next time the device is unlocked.", buf, 2u);
      }
    }
    else
    {
      v40 = v3;
      v41 = v4;
      v42 = self;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enumeratorAtPath:", CFSTR("/Library/AutoInstall/Profiles/")));

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v51 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i));
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        }
        while (v14);
      }

      v17 = objc_msgSend(v10, "sortedArrayUsingSelector:", "compare:");
      if (objc_msgSend(v10, "count"))
      {
        v18 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          v19 = v18;
          v20 = objc_msgSend(v10, "count");
          *(_DWORD *)buf = 67109120;
          LODWORD(v58) = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Auto-installing %d profiles.", buf, 8u);

        }
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = v10;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v47;
        v43 = kMCInstallProfileOptionIsAutoInstalled;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(_QWORD *)v47 != v23)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
            v26 = objc_autoreleasePoolPush();
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pathExtension"));
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("mobileconfig"));

            if (v28)
            {
              v29 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v58 = v25;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Automatically installing %{public}@", buf, 0xCu);
              }
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/Library/AutoInstall/Profiles/"), "stringByAppendingPathComponent:", v25));
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v30));
              if (v31)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
                v55 = v43;
                v56 = &__kCFBooleanTrue;
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
                v45 = 0;
                v34 = objc_msgSend(v32, "installProfileData:options:interactionClient:source:outError:", v31, v33, 0, CFSTR("MCProfileServiceServer.workerQueueCheckForAutoInstalledProfiles"), &v45);
                v35 = v45;

                if (v35)
                {
                  v36 = _MCLogObjects[0];
                  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                  {
                    v37 = v36;
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "MCVerboseDescription"));
                    *(_DWORD *)buf = 138543362;
                    v58 = v38;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Installation failed. Error: %{public}@", buf, 0xCu);

                  }
                }

              }
            }
            objc_autoreleasePoolPop(v26);
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        }
        while (v22);
      }

      CFPreferencesSetAppValue(v40, kCFBooleanTrue, v41);
      CFPreferencesAppSynchronize(v41);

      self = v42;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueueBackgroundActivityManager](self, "workerQueueBackgroundActivityManager"));
    objc_msgSend(v39, "rescheduleProfileJanitorJob");

  }
}

- (void)_sendRestrictionChangedNotification
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending restriction changed notification.", v4, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, MCRestrictionChangedNotification, 0, 0, 1u);
}

- (void)_sendEffectiveSettingsChangedNotification
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending effective settings changed notification.", v4, 2u);
  }
  +[MCSignpostManager willPostEffectiveSettingsChangedNotification](MCSignpostManager, "willPostEffectiveSettingsChangedNotification");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, MCEffectiveSettingsChangedNotification, 0, 0, 1u);
}

- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *workerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008FBC;
  block[3] = &unk_1000E2DA8;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *workerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000090C4;
  block[3] = &unk_1000E2DA8;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  OS_dispatch_queue *workerQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  workerQueue = self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000091CC;
  v9[3] = &unk_1000E2DD0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, v9);

}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  OS_dispatch_queue *workerQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  MCProfileServiceServer *v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  workerQueue = self->_workerQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100009360;
  v21[3] = &unk_1000E2E20;
  v27 = a6;
  v25 = self;
  v26 = v15;
  v22 = v14;
  v23 = v12;
  v24 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v15;
  v20 = v14;
  dispatch_async((dispatch_queue_t)workerQueue, v21);

}

- (BOOL)_isValidProvisioningProfileData:(id)a3
{
  id v3;
  const void *v4;
  uint64_t DeviceUUID;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _DWORD v11[2];

  v3 = a3;
  if (v3)
  {
    v4 = (const void *)MISProfileCreateWithData(0, v3);
    if (v4)
    {
      DeviceUUID = MCGestaltGetDeviceUUID();
      v6 = (void *)objc_claimAutoreleasedReturnValue(DeviceUUID);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v8 = MISProvisioningProfileCheckValidity(v4, v6, v7);
      CFRelease(v4);
      LOBYTE(v4) = v8 == 0;
      if (v8)
      {
        v9 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v11[0] = 67109120;
          v11[1] = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Profile UI installation path encountered invalid provisioning profile with MIS error: %d", (uint8_t *)v11, 8u);
        }
      }

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (void)installProfileData:(id)a3 interactionClient:(id)a4 options:(id)a5 source:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  OS_dispatch_queue *workerQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  MCProfileServiceServer *v30;
  id v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-InstallProfile"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009948;
  block[3] = &unk_1000E2E70;
  v26 = v12;
  v27 = v14;
  v28 = v13;
  v29 = v15;
  v31 = v17;
  v32 = v16;
  v30 = self;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v13;
  v23 = v14;
  v24 = v12;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)updateProfileIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *workerQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-UpdateProfileID"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009C08;
  block[3] = &unk_1000E2E98;
  v22 = v10;
  v23 = v11;
  v25 = v14;
  v26 = v13;
  v24 = v12;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *workerQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  MCProfileServiceServer *v22;
  id v23;
  id v24;
  int64_t v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-RemoveProfile"));
  workerQueue = self->_workerQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009DD0;
  v19[3] = &unk_1000E2EE8;
  v20 = v10;
  v21 = v11;
  v24 = v12;
  v25 = a4;
  v22 = self;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, v19);

}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *workerQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  int64_t v21;
  unint64_t v22;

  v10 = a3;
  v11 = a6;
  v12 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-RemoveUninstalledProfile"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009FD8;
  block[3] = &unk_1000E2F10;
  v21 = a4;
  v22 = a5;
  v19 = v12;
  v20 = v11;
  v18 = v10;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 sender:(id)a8 localizedClientDescription:(id)a9 localizedWarningMessage:(id)a10 completion:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _BOOL8 v26;
  uint64_t v27;
  _BOOL4 v29;
  void (**v30)(id, _QWORD, _BOOL8, id);
  id v31;
  unsigned __int8 v32;
  __int16 v33;

  v29 = a4;
  v30 = (void (**)(id, _QWORD, _BOOL8, id))a11;
  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v23 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-ApplyRestrictions"));
  v33 = 0;
  v32 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v31 = 0;
  LOBYTE(v27) = 1;
  objc_msgSend(v24, "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v22, v29, v21, 1, v20, v19, v18, v17, v16, v27, (char *)&v33 + 1, &v33, &v32, &v31);

  v25 = v31;
  -[MCProfileServiceServer workerQueueDidRecomputeNagMessageWithResult:](self, "workerQueueDidRecomputeNagMessageWithResult:", v32);
  if (HIBYTE(v33))
    -[MCProfileServiceServer _sendRestrictionChangedNotification](self, "_sendRestrictionChangedNotification");
  if ((_BYTE)v33)
  {
    -[MCProfileServiceServer _sendEffectiveSettingsChangedNotification](self, "_sendEffectiveSettingsChangedNotification");
    v26 = (_BYTE)v33 != 0;
  }
  else
  {
    v26 = 0;
  }
  v30[2](v30, HIBYTE(v33), v26, v25);

}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *workerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A314;
  block[3] = &unk_1000E2DA8;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5 completion:(id)a6
{
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetUserInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setUserInfo:forClientUUID:sender:", v12, v11, v10);

  v9[2](v9, 0);
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  OS_dispatch_queue *workerQueue;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];
  _QWORD block[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A6A0;
  block[3] = &unk_1000E2F38;
  block[4] = self;
  block[5] = &v20;
  block[6] = &v16;
  dispatch_sync(v7, block);

  if (a3)
  {
LABEL_13:
    workerQueue = self->_workerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000A6E4;
    v12[3] = &unk_1000E2DA8;
    v13 = v6;
    dispatch_async_and_wait((dispatch_queue_t)workerQueue, v12);

    goto LABEL_14;
  }
  if (!*((_BYTE *)v21 + 24))
  {
    v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Waiting for migration.", buf, 2u);
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_13;
    goto LABEL_11;
  }
  if (*((_BYTE *)v17 + 24))
  {
LABEL_11:
    v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Waiting for activation record change to be committed.", buf, 2u);
    }
    goto LABEL_13;
  }
  v8 = _MCLogObjects[2];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Allowing client to proceed.", buf, 2u);
  }
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_14:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

}

- (BOOL)isOpenInRestrictionInEffect
{
  if (-[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"))
    return !-[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
  else
    return 1;
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", MCFeatureOpenFromUnmanagedToManagedAllowed) != 2;

  return v3;
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", MCFeatureOpenFromManagedToUnmanagedAllowed) != 2;

  return v3;
}

- (void)mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _BOOL8, _QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _BOOL8, _QWORD))a6;
  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v19 = 138543874;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 1024;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking if app is allowed to share to %{public}@. App bundle ID: %{public}@, account is managed: %d.", (uint8_t *)&v19, 0x1Cu);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

  if (!-[MCProfileServiceServer isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromOpenInSourceRestrictions(v11) & 1) != 0)
  {
    goto LABEL_7;
  }
  if ((MCIsAppAccountBasedSourceForOpenIn(v11) & 1) != 0)
  {
    if (!v7)
    {
LABEL_7:
      v17 = 1;
      goto LABEL_8;
    }
  }
  else if ((objc_msgSend(v16, "containsObject:", v11) & 1) == 0)
  {
    goto LABEL_7;
  }
  v17 = -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged");
LABEL_8:
  v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v19 = 67109120;
    LODWORD(v20) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Result: %d", (uint8_t *)&v19, 8u);
  }
  v12[2](v12, v17, 0);

}

- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  id v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  if (!-[MCProfileServiceServer isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromOpenInSourceRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (!MCIsAppAccountBasedSourceForOpenIn(v10))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));

    LODWORD(v15) = objc_msgSend(v17, "containsObject:", v10);
    if ((_DWORD)v15)
      goto LABEL_11;
LABEL_12:
    v13 = -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
    v11 = 1;
    v12 = 1;
    goto LABEL_5;
  }
  if (a4 == 1)
    goto LABEL_12;
  if (a4 == 2)
  {
LABEL_11:
    v12 = -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged");
    v11 = 1;
    goto LABEL_4;
  }
LABEL_3:
  v11 = 0;
  v12 = 1;
LABEL_4:
  v13 = 1;
LABEL_5:
  *a5 = v13;
  *a6 = v12;

  return v11;
}

- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  -[MCProfileServiceServer mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:originatingAppBundleID:originatingAccountIsManaged:completion:](self, "mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:originatingAppBundleID:originatingAccountIsManaged:completion:", CFSTR("Messages"), a3, a4, a5);
}

- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  -[MCProfileServiceServer mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:originatingAppBundleID:originatingAccountIsManaged:completion:](self, "mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:originatingAppBundleID:originatingAccountIsManaged:completion:", CFSTR("AirDrop"), a3, a4, a5);
}

- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCCommunicationServiceRulesUtilities defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:](MCCommunicationServiceRulesUtilities, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:", a3, a4));
  if (v8)
    v8[2](v8, v7, 0);

}

- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  dispatch_queue_global_t global_queue;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  id v48;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = MCContainingBundleIDForBundleID(a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v44 = v34;
    v45 = 1024;
    v46 = v7;
    v47 = 2114;
    v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking for app bundle IDs allowed for Open In. Originating Bundle: %{public}@, account is managed: %d. Original list: %{public}@", buf, 0x1Cu);
  }
  v33 = v11;
  v14 = MCBundleIDToContainingBundleIDMap(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Resolved app extension containers to: %{public}@", buf, 0xCu);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allValues"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeys"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:](MCRestrictionManager, "allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:", v17, v19, v34, v7, -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged"), -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"), &stru_1000E2F78, &stru_1000E2F98));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = v10;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v28));
        if (objc_msgSend(v21, "containsObject:", v29))
          objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v25);
  }

  v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v22;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }
  if (v33)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v32 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AFD4;
    block[3] = &unk_1000E2EC0;
    v37 = v33;
    v36 = v22;
    dispatch_async(v32, block);

  }
}

- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  dispatch_queue_global_t global_queue;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  id v48;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = MCContainingBundleIDForBundleID(a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v44 = v34;
    v45 = 1024;
    v46 = v7;
    v47 = 2114;
    v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking for app bundle IDs allowed for Import From. Originating Bundle: %{public}@, account is managed: %d. Original list: %{public}@", buf, 0x1Cu);
  }
  v33 = v11;
  v14 = MCBundleIDToContainingBundleIDMap(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Resolved app extension containers to: %{public}@", buf, 0xCu);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allValues"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeys"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:](MCRestrictionManager, "allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:", v17, v19, v34, v7, -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged"), -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"), &stru_1000E2FB8, &stru_1000E2FD8));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = v10;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v28));
        if (objc_msgSend(v21, "containsObject:", v29))
          objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v25);
  }

  v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v22;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }
  if (v33)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v32 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B3D4;
    block[3] = &unk_1000E2EC0;
    v37 = v33;
    v36 = v22;
    dispatch_async(v32, block);

  }
}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 messageSendingAppBundleID:(id)a4 hostAppBundleID:(id)a5 accountIsManaged:(BOOL)a6 completion:(id)a7
{
  unint64_t v8;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  dispatch_queue_global_t global_queue;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD block[4];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  int v57;
  __int16 v58;
  id v59;

  v8 = a6;
  v12 = a3;
  v45 = a7;
  v13 = a4;
  v14 = MCContainingBundleIDForBundleID(a5);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = MCContainingBundleIDForBundleID(v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v55 = v15;
    v56 = 1024;
    v57 = v8;
    v58 = 2114;
    v59 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Checking for 3rd party keyboards allowed for Bundle ID %{public}@, account is managed: %d. Original list: %{public}@", buf, 0x1Cu);
  }
  v19 = v17;
  if (MCIsAppBasicallySafari(v15))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "effectiveUnionValuesForSetting:", MCFeatureManagedWebDomains));
    v8 = v21 != 0;

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCAccountUtilities accountDataclassesForBundleID:](MCAccountUtilities, "accountDataclassesForBundleID:", v15));
    if (v20)
    {
      v8 = (unint64_t)+[MCAccountUtilities hasManagedAccountOfDataclasses:](MCAccountUtilities, "hasManagedAccountOfDataclasses:", v20);
    }
    else if ((MCIsAppAccountBasedSourceForOpenIn(v19) & 1) == 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allKeys"));
      v8 = (unint64_t)objc_msgSend(v23, "containsObject:", v19);

    }
  }
  v43 = v19;
  v44 = (void *)v15;

  v24 = MCBundleIDToContainingBundleIDMap(v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v55 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Resolved keyboard extension containers to: %{public}@", buf, 0xCu);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allValues"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](MDMManagedMediaReader, "attributesByAppID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allKeys"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:managedAppBundleIDs:hostAppIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:](MCRestrictionManager, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:managedAppBundleIDs:hostAppIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:", v27, v29, v8, -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged"), -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged")));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = v12;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v38));
        if (objc_msgSend(v31, "containsObject:", v39))
          objc_msgSend(v32, "addObject:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v35);
  }

  v40 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v55 = (uint64_t)v32;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }
  if (v45)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v42 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B898;
    block[3] = &unk_1000E2EC0;
    v48 = v45;
    v47 = v32;
    dispatch_async(v42, block);

  }
}

- (void)loadMailAccountsWithAuditToken:(id *)a3 filteringEnabled:(BOOL)a4 sourceAccountManagement:(int)a5 completion:(id)a6
{
  uint64_t v6;
  _BOOL4 v7;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[8];
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  uint8_t v35;
  char v36;
  _BYTE v37[9];

  v6 = *(_QWORD *)&a5;
  v7 = a4;
  v10 = a6;
  v11 = MCBundleIDFromAuditToken(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](MailAccount, "activeAccounts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000E3018));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v14));

    buf[0] = 0;
    v37[0] = 0;
    if (v7
      && -[MCProfileServiceServer shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v12, v6, buf, v37))
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10000BBF0;
      v34[3] = &unk_1000E3038;
      v35 = buf[0];
      v36 = v37[0];
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v34));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredArrayUsingPredicate:", v16));

    }
    else
    {
      v17 = v15;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000BC54;
    v32[3] = &unk_1000E3060;
    v33 = v18;
    v19 = v18;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v32);
    v20 = objc_msgSend(v19, "copy");

    v21 = 0;
  }
  else
  {
    v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process for filtered mail sheets.", buf, 2u);
    }
    v23 = MCXPCErrorDomain;
    v24 = MCErrorArray(CFSTR("XPC_ERROR_LACKS_BUNDLE_IDENTIFIER_CODE"));
    v17 = (id)objc_claimAutoreleasedReturnValue(v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v23, 39001, v17, MCErrorTypeFatal, 0));
    v20 = 0;
  }

  if (v10)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v26 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BC98;
    block[3] = &unk_1000E3088;
    v30 = v10;
    v28 = v20;
    v29 = v21;
    dispatch_async(v26, block);

  }
}

- (void)setAutoCorrectionAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetAutoCorrectionAllowed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v11, "setSenderPID:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v12, "setBoolValue:forSetting:sender:", v8, MCFeatureAutoCorrectionAllowed, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setSenderPID:", getpid());

  v9[2](v9, 0);
}

- (void)setSmartPunctuationAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetSmartPunctuationAllowed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v11, "setSenderPID:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v12, "setBoolValue:forSetting:sender:", v8, MCFeatureSmartPunctuationAllowed, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setSenderPID:", getpid());

  v9[2](v9, 0);
}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetPredictiveKeyboardAllowed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v11, "setSenderPID:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v12, "setBoolValue:forSetting:sender:", v8, MCFeaturePredictiveKeyboardAllowed, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setSenderPID:", getpid());

  v9[2](v9, 0);
}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetContinuousPathKeyboardAllowed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v11, "setSenderPID:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v12, "setBoolValue:forSetting:sender:", v8, MCFeatureContinuousPathKeyboardAllowed, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setSenderPID:", getpid());

  v9[2](v9, 0);
}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetKeyboardShortcutsAllowed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v11, "setSenderPID:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v12, "setBoolValue:forSetting:sender:", v8, MCFeatureKeyboardShortcutsAllowed, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setSenderPID:", getpid());

  v9[2](v9, 0);
}

- (void)setSpellCheckAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetSpellCheckAllowed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v11, "setSenderPID:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v12, "setBoolValue:forSetting:sender:", v8, MCFeatureSpellCheckAllowed, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setSenderPID:", getpid());

  v9[2](v9, 0);
}

- (void)setAllowedURLStrings:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = *(_QWORD *)&a4;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v11 = a3;
  v15 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetAllowedURLStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v12, "setSenderPID:", v7);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "setIntersectionValues:forSetting:sender:", v11, MCFeatureWebContentFilterAutoPermittedURLs, v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v14, "setSenderPID:", getpid());

  v9[2](v9, 0);
}

- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  OS_dispatch_queue *workerQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-StartComplianceTimer"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C474;
  block[3] = &unk_1000E30B0;
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  OS_dispatch_queue *workerQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-HaveSeenComplianceMessage"));
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A254();
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C6CC;
  block[3] = &unk_1000E30B0;
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)recomputeUserComplianceWarningWithCompletion:(id)a3
{
  id v4;
  id v5;
  OS_dispatch_queue *workerQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-RecomputeUserComplianceWarning"));
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A2D4();
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C838;
  block[3] = &unk_1000E30B0;
  v10 = v5;
  v11 = v4;
  block[4] = self;
  v7 = v5;
  v8 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)recomputePerClientUserComplianceWithCompletion:(id)a3
{
  id v4;
  id v5;
  OS_dispatch_queue *workerQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-RecomputePerClientUserCompliance"));
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG))
    sub_10009A354();
  workerQueue = self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C948;
  v9[3] = &unk_1000E2EC0;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v9);

}

- (void)clearRecoveryPasscodeWithSenderBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  OS_dispatch_queue *workerQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-clearRecoveryPasscode"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CA64;
  block[3] = &unk_1000E30B0;
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)changePasscode:(id)a3 oldPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OS_dispatch_queue *workerQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-ChangePasscode"));
  workerQueue = self->_workerQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000CCD0;
  v23[3] = &unk_1000E30D8;
  v24 = v14;
  v25 = v13;
  v29 = a5;
  v27 = v16;
  v28 = v15;
  v26 = v12;
  v18 = v16;
  v19 = v15;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  dispatch_async((dispatch_queue_t)workerQueue, v23);

}

- (void)changePasscode:(id)a3 recoveryPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OS_dispatch_queue *workerQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-ChangePasscodeWithRecovery"));
  workerQueue = self->_workerQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000D000;
  v23[3] = &unk_1000E30D8;
  v24 = v14;
  v25 = v13;
  v29 = a5;
  v27 = v16;
  v28 = v15;
  v26 = v12;
  v18 = v16;
  v19 = v15;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  dispatch_async((dispatch_queue_t)workerQueue, v23);

}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  OS_dispatch_queue *workerQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-CreateMDMUnlockToken"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D1FC;
  block[3] = &unk_1000E30B0;
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *workerQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  MCProfileServiceServer *v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-ClearPasscode"));
  workerQueue = self->_workerQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000D428;
  v21[3] = &unk_1000E3100;
  v22 = v12;
  v23 = v10;
  v24 = v11;
  v25 = self;
  v26 = v14;
  v27 = v13;
  v16 = v14;
  v17 = v13;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  dispatch_async((dispatch_queue_t)workerQueue, v21);

}

- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *workerQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workerQueue = self->_workerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D5EC;
  v11[3] = &unk_1000E3128;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, v11);

}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  id v4;
  id v5;
  OS_dispatch_queue *workerQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-ResetPasscodeMetadata"));
  workerQueue = self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D744;
  v9[3] = &unk_1000E2EC0;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v9);

}

- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3
{
  void (**v3)(id, id, _QWORD);
  id v4;

  v3 = (void (**)(id, id, _QWORD))a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCVPNPayloadHandlerBase managedServiceIDs](MCNewVPNPayloadHandler, "managedServiceIDs"));
  v3[2](v3, v4, 0);

}

- (void)managedWiFiNetworkNamesWithCompletion:(id)a3
{
  void (**v3)(id, id, _QWORD);
  id v4;

  v3 = (void (**)(id, id, _QWORD))a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCNewWiFiPayloadHandler managedWiFiNetworkNames](MCNewWiFiPayloadHandler, "managedWiFiNetworkNames"));
  v3[2](v3, v4, 0);

}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *workerQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  int v16;
  BOOL v17;

  v8 = a5;
  v9 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-MigrateWithContext"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D930;
  block[3] = &unk_1000E3150;
  v16 = a3;
  v17 = a4;
  v14 = v9;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *workerQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  int v14;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-MigrationCleanupWithContext"));
  workerQueue = self->_workerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000DA64;
  v11[3] = &unk_1000E3178;
  v14 = a3;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, v11);

}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  objc_msgSend(v4, "recomputeProfileRestrictionsWithCompletionBlock:", v3);

}

- (void)_workerQueue_setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 assertion:(id)a11 completion:(id)a12
{
  _BOOL8 v14;
  _BOOL8 v15;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void (**v24)(id, _QWORD);

  v14 = a6;
  v15 = a5;
  v24 = (void (**)(id, _QWORD))a12;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v23, "setSenderPID:", a9);
  objc_msgSend(v23, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:", v22, v21, v15, v14, v20, v19, v18);

  objc_msgSend(v23, "setSenderPID:", getpid());
  if (v24)
    v24[2](v24, 0);

}

- (void)removeBoolSetting:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *workerQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-RemoveBoolSetting"));
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000DD84;
  v17[3] = &unk_1000E31C8;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v17);

}

- (void)removeValueSetting:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *workerQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-RemoveValueForSetting"));
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000DEF8;
  v17[3] = &unk_1000E31C8;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v17);

}

- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *workerQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E018;
  block[3] = &unk_1000E31F0;
  v16 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = MCPostSetupAutoInstallSetAsideProfilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ((objc_msgSend(v4, "fileExistsAtPath:", v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = MCPostSetupAutoInstallSetAsideProfilePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13 = 0;
    v10 = objc_msgSend(v7, "removeItemAtPath:error:", v9, &v13);
    v11 = v13;

    if ((v10 & 1) == 0)
    {
      v12 = _MCLogObjects[8];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove set aside mdm profile. Error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {

    v11 = 0;
  }
  if (v3)
    v3[2](v3, v11);

}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = MCCloudConfigurationSetAsideDetailsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ((objc_msgSend(v4, "fileExistsAtPath:", v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = MCCloudConfigurationSetAsideDetailsFilePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13 = 0;
    v10 = objc_msgSend(v7, "removeItemAtPath:error:", v9, &v13);
    v11 = v13;

    if ((v10 & 1) == 0)
    {
      v12 = _MCLogObjects[8];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove set aside cloud configuration. Error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {

    v11 = 0;
  }
  if (v3)
    v3[2](v3, v11);

}

- (void)_handleSettingsJumpWithProfileData:(id)a3 targetDeviceType:(unint64_t)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  int v12;
  unint64_t v13;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 1uLL:
    case 4uLL:
      v10 = &kMCSettingsURLProfilesInstallation;
      goto LABEL_7;
    case 2uLL:
      v10 = &kMCBridgeURLProfilesInstallation;
      goto LABEL_7;
    case 3uLL:
      v10 = &kMCHomeURLProfilesInstallation;
LABEL_7:
      -[MCProfileServiceServer openSettingsAppForProfileInstallation:bundleID:](self, "openSettingsAppForProfileInstallation:bundleID:", *v10, v9);
      break;
    default:
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v12 = 134217984;
        v13 = a4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Profile Settings Jump is not supported for target device type: %lu", (uint8_t *)&v12, 0xCu);
      }
      break;
  }

}

- (id)URLForInstallingProfileInSettingsApp:(id)a3 returningToBundleID:(id)a4
{
  const __CFString *v4;
  void *v5;
  void *v6;

  v4 = CFSTR("com.apple.springboard");
  if (a4)
    v4 = (const __CFString *)a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@&sender=%@"), a3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  return v6;
}

- (void)openSettingsAppForProfileInstallation:(id)a3 bundleID:(id)a4
{
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = CFSTR("com.apple.springboard");
  if (a4)
    v4 = (const __CFString *)a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@&sender=%@"), a3, v4));
  v6 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v9 = MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey();
  v10 = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v6, v8);

  notify_post((const char *)objc_msgSend(MCProfileWasQueuedNotification, "UTF8String"));
}

- (void)signIntoFaceTimeWithUsername:(id)a3
{
  -[MCProfileServiceServer _workerQueueSignIntoFaceTimeWithUsername:](self, "_workerQueueSignIntoFaceTimeWithUsername:", a3);
}

- (void)_workerQueueSignIntoFaceTimeWithUsername:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = a3;
  v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning call into AK + AIDA to sign into Facetime on profiled's _workerQueue...", buf, 2u);
  }
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain stringFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "stringFromService:account:label:description:useSystemKeychain:outError:", kMCCCDEPFastTimeService, kMCCCDEPFastTimeAccount, 0, 0, 0, &v13));
  v6 = v13;
  if (v6)
  {
    v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error trying to retrieve credential from Keychain! \n Error:  %{public}@", buf, 0xCu);

    }
  }
  v10 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  objc_msgSend(v10, "setUsername:", v3);
  objc_msgSend(v10, "_setPassword:", v5);
  objc_msgSend(v10, "setIsUsernameEditable:", 0);
  objc_msgSend(v10, "setServiceType:", 5);
  objc_msgSend(v10, "setAppProvidedContext:", CFSTR("axmft"));
  v11 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  objc_msgSend(v11, "authenticateWithContext:completion:", v10, &stru_1000E3230);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfigurationWriter sharedInstance](MCCloudConfigurationWriter, "sharedInstance"));
  objc_msgSend(v12, "faceTimeSignInAttemptDidFinish");

}

- (void)_workerQueueRemoveAllCarrierProfiles
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing all carrier profiles.", buf, 2u);
  }
  v4 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiersOfProfilesWithFilterFlags:", 2));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller", (_QWORD)v14));
        objc_msgSend(v13, "removeProfileWithIdentifier:installationType:source:", v12, 1, CFSTR("Carrier Profile Removal"));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

+ (id)_descriptionForServiceSubscriptionContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSString *v6;
  __CFString *v7;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
    v5 = objc_msgSend(v3, "slotID");

    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@, %s]"), v4, CTSubscriptionSlotAsString(v5));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v7 = CFSTR("<nil>");
  }
  return v7;
}

- (void)_workerQueueCheckCarrierProfileForCarrierIdentifier:(id)a3 name:(id)a4 atPath:(id)a5 forceReinstallation:(BOOL)a6
{
  id v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  os_log_t v39;
  NSObject *v40;
  __CFString *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  const __CFString *v60;

  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v13);

  v14 = _MCLogObjects[2];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("<nil>");
    if (v12)
      v15 = v12;
    *(_DWORD *)buf = 138543362;
    v60 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: (wq) Evaluating carrier profile at path: %{public}@", buf, 0xCu);
  }
  if (v12)
  {
    v56 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifiersOfProfilesWithFilterFlags:", 2));
    v18 = v17;
    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v19));

    }
    else
    {
      v20 = 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = objc_msgSend(v22, "fileExistsAtPath:", v12);

    if (!v23)
    {
      v33 = _MCLogObjects[2];
      v26 = v20;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: No configuration profile found in carrier bundle.", buf, 2u);
      }
      v11 = v56;
      if (objc_msgSend(v18, "count"))
      {
        v34 = _MCLogObjects[2];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Removing carrier configuration profile.", buf, 2u);
        }
        -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
      }
      goto LABEL_53;
    }
    v24 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v12));
    v25 = _MCLogObjects[2];
    v26 = v20;
    v55 = (void *)v24;
    if (!v24)
    {
      v11 = v56;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not load configuration profile from carrier bundle.", buf, 2u);
      }
      goto LABEL_52;
    }
    v54 = v10;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Installing carrier configuration profile if needed...", buf, 2u);
    }
    v58 = 0;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v55, &v58));
    v28 = v58;
    if (!v28)
    {
      if (!a6 && v20)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
        if ((objc_msgSend(v29, "isEqualToString:", v30) & 1) != 0)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUID"));
          v51 = v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUID"));
          v50 = objc_msgSend(v52, "isEqualToString:", v31);

          if ((v50 & 1) != 0)
          {
            v32 = _MCLogObjects[2];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Carrier profile was already installed.", buf, 2u);
            }
            v28 = 0;
            goto LABEL_49;
          }
        }
        else
        {

        }
      }
      v53 = v20;
      -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
      v35 = objc_msgSend((id)objc_opt_class(self), "_optionsForCarrierProfileInstallationForCarrierIdentifier:name:", v54, v56);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
      v57 = 0;
      v38 = objc_msgSend(v37, "installProfileData:options:interactionClient:source:outError:", v55, v36, 0, CFSTR("MCProfileServiceServer._workerQueueCheckCarrierProfileAtPath"), &v57);
      v28 = v57;

      if (!v28)
      {
        v48 = _MCLogObjects[2];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Successfully installed carrier configuration profile.", buf, 2u);
        }

        v28 = 0;
        v11 = v56;
        v26 = v53;
        goto LABEL_50;
      }

      v26 = v20;
    }

    v39 = _MCLogObjects[2];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = v39;
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v60 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Error installing carrier profile: %{public}@", buf, 0xCu);

    }
    -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "domain"));
    v42 = MCInstallationErrorDomain;
    if (objc_msgSend(v27, "isEqual:", MCInstallationErrorDomain))
    {
      v43 = objc_msgSend(v28, "code");

      if (v43 != (id)4001)
      {
        v26 = v20;
        v11 = v56;
LABEL_51:

        v10 = v54;
LABEL_52:

LABEL_53:
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueueBackgroundActivityManager](self, "workerQueueBackgroundActivityManager"));
        objc_msgSend(v49, "rescheduleProfileJanitorJob");

        goto LABEL_54;
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      if (v27)
      {
        v45 = objc_opt_class(NSError);
        v26 = v20;
        if ((objc_opt_isKindOfClass(v27, v45) & 1) != 0)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "domain"));
          v11 = v56;
          if ((objc_msgSend(v46, "isEqual:", v42) & 1) != 0)
          {
            v47 = objc_msgSend(v27, "code");

            if (v47 == (id)4009)
              -[MCProfileServiceServer _workerQueueForceCheckOfCarrierProfileOnNextUnlock](self, "_workerQueueForceCheckOfCarrierProfileOnNextUnlock");
          }
          else
          {

          }
          goto LABEL_50;
        }
      }
      else
      {
        v26 = v20;
      }
    }
LABEL_49:
    v11 = v56;
LABEL_50:

    goto LABEL_51;
  }
  v21 = _MCLogObjects[2];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Removing all installed carrier profiles as requested.", buf, 2u);
  }
  -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueueBackgroundActivityManager](self, "workerQueueBackgroundActivityManager"));
  objc_msgSend(v16, "rescheduleProfileJanitorJob");
LABEL_54:

}

+ (id)_optionsForCarrierProfileInstallationForCarrierIdentifier:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", &off_1000ED0B8, kMCInstallProfileOptionFilterFlag);
  if (v5)
    -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v5, kMCInstallProfileOptionCarrierIdentifier);
  if (v6)
    -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v6, kMCInstallProfileOptionCarrierName);
  v8 = -[NSMutableDictionary copy](v7, "copy");

  return v8;
}

- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  CoreTelephonyClient *coreTelephonyClient;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: checkCarrierProfileAndForceReinstallation:completion:", buf, 2u);
  }
  coreTelephonyClient = self->_coreTelephonyClient;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F664;
  v10[3] = &unk_1000E3310;
  v12 = a3;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[CoreTelephonyClient getPreferredDataSubscriptionContext:](coreTelephonyClient, "getPreferredDataSubscriptionContext:", v10);

}

- (id)_carrierIdentifierFromContext:(id)a3
{
  return objc_msgSend(a3, "labelID");
}

- (id)_carrierNameFromContext:(id)a3
{
  id v4;
  id v5;
  CoreTelephonyClient *coreTelephonyClient;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
  coreTelephonyClient = self->_coreTelephonyClient;
  v16 = 0;
  v7 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](coreTelephonyClient, "copyCarrierBundleValue:key:bundleType:error:", v4, CFSTR("CarrierName"), v5, &v16);

  v8 = v16;
  if (!v7)
  {
    v11 = _MCLogObjects[2];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not get carrier name: %{public}@", buf, 0xCu);

    }
    goto LABEL_8;
  }
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    v14 = _MCLogObjects[2];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Returned carrier name is not a string.", buf, 2u);
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = v7;
LABEL_9:

  return v10;
}

- (void)_workerQueueForceCheckOfCarrierProfileOnNextUnlock
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Forcing check of carrier profile on next unlock.", v5, 2u);
  }
  v4 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v4);

  -[MCProfileServiceServer setWorkerQueueLastCarrierProfileCheckTime:](self, "setWorkerQueueLastCarrierProfileCheckTime:", 0);
}

- (void)_workerQueueCheckCarrierProfileOnUnlockSometimes
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  const __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  MCProfileServiceServer *v18;
  SEL v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  const __CFString *v23;

  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, determining if we should check.", buf, 2u);
  }
  v5 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v5);

  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000102D8;
  v17 = &unk_1000E3338;
  v18 = self;
  v19 = a2;
  if (qword_1000FD818 != -1)
    dispatch_once(&qword_1000FD818, &v14);
  v6 = mach_continuous_time();
  if (!-[MCProfileServiceServer workerQueueLastCarrierProfileCheckTime](self, "workerQueueLastCarrierProfileCheckTime", v14, v15, v16, v17, v18, v19))
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, never checked before, will check.", buf, 2u);
    }
    goto LABEL_17;
  }
  v7 = -[MCProfileServiceServer workerQueueLastCarrierProfileCheckTime](self, "workerQueueLastCarrierProfileCheckTime");
  if (byte_1000FD810)
    v8 = 86400;
  else
    v8 = 0;
  v9 = _MCLogObjects[0];
  v10 = (v6 - v7) * dword_1000FD800 / qword_1000FD808;
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("will not");
    if (v10 > v8)
      v11 = CFSTR("will");
    *(_DWORD *)buf = 134218242;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, %qu seconds since last check, %@ check", buf, 0x16u);
  }
  if (v10 > v8)
  {
LABEL_17:
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, checking carrier profile.", buf, 2u);
    }
    -[MCProfileServiceServer setWorkerQueueLastCarrierProfileCheckTime:](self, "setWorkerQueueLastCarrierProfileCheckTime:", v6);
    -[MCProfileServiceServer checkCarrierProfileAndForceReinstallation:completion:](self, "checkCarrierProfileAndForceReinstallation:completion:", 0, &stru_1000E3358);
  }
}

- (void)workerQueueReadBiometricState
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[8];
  id v7;

  v7 = 0;
  sub_10000477C(&v7, 0);
  v2 = v7;
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    v4 = objc_msgSend(v2, "BOOLValue");
    objc_msgSend(v3, "setBoolValue:forSetting:sender:", v4, MCFeatureFingerprintUnlockAllowed, CFSTR("MCProfileServiceServer.workerQueueReadBiometricState"));

  }
  else
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Fingerprint unlock state is not available yet. Ignoring.", v6, 2u);
    }
  }

}

- (void)workerQueueNotifyDeviceUnlocked
{
  -[MCProfileServiceServer _workerQueueCheckCarrierProfileOnUnlockSometimes](self, "_workerQueueCheckCarrierProfileOnUnlockSometimes");
}

- (void)workerQueueNotifyDeviceUnlockedAndPasscodeRequired
{
  -[MCProfileServiceServer workerQueueRecomputeNagMessage](self, "workerQueueRecomputeNagMessage");
  -[MCProfileServiceServer workerQueueCheckForAutoInstallProfiles](self, "workerQueueCheckForAutoInstallProfiles");
}

- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *workerQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:", buf, 2u);
  }
  workerQueue = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010588;
  v8[3] = &unk_1000E3128;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v8);

}

- (void)notifyDeviceUnlockedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *workerQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notifyDeviceUnlockedWithCompletion:", buf, 2u);
  }
  workerQueue = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010694;
  v8[3] = &unk_1000E3128;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v8);

}

- (void)notifyFirstUnlock
{
  OS_dispatch_queue *workerQueue;
  _QWORD block[5];

  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001072C;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)notifyGracePeriodChanged
{
  dispatch_async((dispatch_queue_t)self->_workerQueue, &stru_1000E3378);
}

- (void)notifyProvisioningProfilesChanged
{
  OS_dispatch_queue *workerQueue;
  _QWORD block[5];

  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001081C;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (BOOL)_hasCompletedPostLoginWork
{
  sem_t *v2;
  sem_t *v3;

  v2 = sem_open("profiled.firstboot_check", 0);
  v3 = v2;
  if (v2 != (sem_t *)-1)
    sem_close(v2);
  return v3 != (sem_t *)-1;
}

- (void)_markPostUserLoginWorkCompleted
{
  sem_t *v2;
  void *v3;
  NSObject *v4;
  int *v5;
  char *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;

  v2 = sem_open("profiled.firstboot_check", 512, 256, 0);
  if (v2 == (sem_t *)-1)
  {
    v3 = (void *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = __error();
      v6 = strerror(*v5);
      *(_DWORD *)buf = 136446466;
      v8 = "profiled.firstboot_check";
      v9 = 2082;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to create semaphore %{public}s: %{public}s", buf, 0x16u);

    }
  }
  else
  {
    sem_close(v2);
  }
}

- (void)notifyUserLoggedIn
{
  OS_dispatch_queue *workerQueue;
  _QWORD block[5];

  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010AD8;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)workerQueueNotifyUserLoggedIn
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad")
    && !-[MCProfileServiceServer _hasCompletedPostLoginWork](self, "_hasCompletedPostLoginWork"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
    v4 = objc_msgSend(v3, "verifiedMDMProfileIdentifierWithCleanUp");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
    objc_msgSend(v5, "scheduleTokenUpdateIfNecessary");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](MDMUserClient, "sharedClient"));
    objc_msgSend(v6, "scheduleTokenUpdate");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](MDMUserClient, "sharedClient"));
    objc_msgSend(v7, "simulatePush");

    -[MCProfileServiceServer _markPostUserLoginWorkCompleted](self, "_markPostUserLoginWorkCompleted");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueueBackgroundActivityManager](self, "workerQueueBackgroundActivityManager"));
  objc_msgSend(v8, "rescheduleProfileJanitorJob");

}

- (void)notifyMementoEffaced
{
  NSObject *v3;
  OS_dispatch_queue *workerQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received memento effaced notification. Clearing related opaque data.", buf, 2u);
  }
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010C60;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)workerQueueNotifyMementoEffaced
{
  -[MCBackgroundActivityManager rescheduleRecoveryPasscodeExpiryJob](self->_workerQueueBackgroundActivityManager, "rescheduleRecoveryPasscodeExpiryJob");
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  OS_dispatch_queue *workerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010CEC;
  block[3] = &unk_1000E2C50;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *workerQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-StoreCertificate"));
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100010FDC;
  v17[3] = &unk_1000E31C8;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v17);

}

- (id)_badProvisioningProfileError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCProvisioningProfileErrorDomain;
  v3 = MCErrorArray(CFSTR("PROVISIONING_ERROR_BAD_PROFILE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 25000, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_localProvisioningProfileError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCProvisioningProfileErrorDomain;
  v3 = MCErrorArray(CFSTR("PROVISIONING_ERROR_LOCAL_PROFILE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 25004, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *workerQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  MCProfileServiceServer *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-InstallProvisioningProfile"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000112C0;
  block[3] = &unk_1000E2E98;
  v18 = v8;
  v19 = self;
  v21 = v11;
  v22 = v10;
  v20 = v9;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 sender:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *workerQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-RemoveProvisioningProfile"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001166C;
  block[3] = &unk_1000E2E98;
  v22 = v10;
  v23 = v12;
  v25 = v14;
  v26 = v13;
  v24 = v11;
  v16 = v14;
  v17 = v13;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *workerQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-AddTrustedProvisioningProfile"));
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100011958;
  v17[3] = &unk_1000E2E48;
  v18 = v11;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v11;
  v16 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, v17);

}

- (BOOL)isBundleBlocked:(id)a3 outHash:(id *)a4 outHashType:(id *)a5
{
  char v7;
  id v8;
  int v10;
  id v11;

  if (!a3)
    return 0;
  v11 = 0;
  v10 = 26;
  v7 = MISQueryBlacklistForBundle(a3, 0, 0, 0, &v11, &v10, 0);
  v8 = v11;
  if (v11)
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease(v11);
      v8 = v11;
    }
    CFRelease(v8);
  }
  if (a5 && v10)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  return v7;
}

- (void)workerQueueRemoveExpiredProfiles
{
  void *v3;
  MCProfileJanitor *v4;

  v4 = objc_alloc_init(MCProfileJanitor);
  -[MCProfileJanitor removeExpiredProfiles](v4, "removeExpiredProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueueBackgroundActivityManager](self, "workerQueueBackgroundActivityManager"));
  objc_msgSend(v3, "rescheduleProfileJanitorJob");

}

- (void)removeExpiredProfiles
{
  OS_dispatch_queue *workerQueue;
  _QWORD block[5];

  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012044;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)workerQueueRevalidateManagedApps
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
  objc_msgSend(v3, "updateMISTrust");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueueBackgroundActivityManager](self, "workerQueueBackgroundActivityManager"));
  objc_msgSend(v4, "rescheduleManagedAppValidationJob");

}

- (void)revalidateManagedApps
{
  OS_dispatch_queue *workerQueue;
  _QWORD block[5];

  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000120FC;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)removeExpiredProfilesWithCompletion:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[MCProfileServiceServer removeExpiredProfiles](self, "removeExpiredProfiles");
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000121A0;
    block[3] = &unk_1000E2DA8;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = _MCLogObjects[2];
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Forgetting post-setup profile.", buf, 2u);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = MCPostSetupAutoInstallProfilePath();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v15, "removeItemAtPath:error:", v17, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = MCPostSetupAutoInstallSetAsideProfilePath();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v18, "removeItemAtPath:error:", v20, 0);

    v12 = 0;
    if (v7)
      goto LABEL_16;
    goto LABEL_17;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remembering post-setup profile.", buf, 2u);
  }
  v10 = MCPostSetupAutoInstallProfilePath();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v30 = 0;
  objc_msgSend(v6, "writeToFile:options:error:", v11, 0, &v30);
  v12 = v30;

  if (v12)
  {
    v13 = _MCLogObjects[2];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    v14 = "Failed to store profile data with error: %{public}@";
    goto LABEL_14;
  }
  v21 = MCPostSetupAutoInstallSetAsideProfilePath();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v29 = 0;
  objc_msgSend(v6, "writeToFile:options:error:", v22, 0, &v29);
  v12 = v29;

  if (!v12)
  {
    v23 = MCPostSetupAutoInstallSetAsideProfilePath();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    MCSetSkipBackupAttributeToItemAtPath(v24, 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "details"));
    v27 = objc_msgSend(v26, "mutableCopy");

    v28 = 0;
    -[MCProfileServiceServer storeCloudConfigurationDetails:outError:](self, "storeCloudConfigurationDetails:outError:", v27, &v28);
    v12 = v28;

    if (!v7)
      goto LABEL_17;
    goto LABEL_16;
  }
  v13 = _MCLogObjects[2];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    v14 = "Failed to store set aside profile data with error: %{public}@";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
  }
LABEL_15:
  if (v7)
LABEL_16:
    v7[2](v7, v12);
LABEL_17:

}

- (void)storedProfileDataWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, _QWORD);

  v10 = (void (**)(id, void *, _QWORD))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = MCPostSetupAutoInstallProfilePath();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  if (v6)
  {
    v7 = MCPostSetupAutoInstallProfilePath();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v8));

  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v9, 0);

}

- (void)markStoredProfileAsInstalledWithCompletion:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  v3 = ((uint64_t (*)(void))MCCloudConfigurationDetailsFilePath)();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v4));

  if (v5)
  {
    v6 = MCCloudConfigurationDetailsFilePath(objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCPostSetupProfileWasInstalledKey));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "MCWriteToBinaryFile:", v7);

    MCSendCloudConfigurationDetailsChangedNotification();
  }
  v8[2](v8, 0);

}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 sender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *workerQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-ResetSettingsToDefault"));
  workerQueue = self->_workerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000126DC;
  v15[3] = &unk_1000E3438;
  v19 = a3;
  v17 = v10;
  v18 = v9;
  v16 = v8;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v15);

}

- (void)rereadManagedAppAttributesWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *workerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000127F4;
  block[3] = &unk_1000E2DA8;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))a3 + 2))(a3, 1, 0, 0);
}

- (void)reducedMachineInfoDataWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  v6 = CFSTR("PRODUCT");
  v7 = CFSTR("VERSION");
  v8 = CFSTR("LANGUAGE");
  v9 = CFSTR("OS_VERSION");
  v10 = CFSTR("SUPPLEMENTAL_BUILD_VERSION");
  v11 = CFSTR("SUPPLEMENTAL_OS_VERSION_EXTRA");
  v12 = CFSTR("SOFTWARE_UPDATE_DEVICE_ID");
  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 7));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCMachineInfo machineInfoWithKeys:outError:](MCMachineInfo, "machineInfoWithKeys:outError:", v4, 0, v6, v7, v8, v9, v10, v11, v12));
  v3[2](v3, v5, 0);

}

- (id)cloudConfigurationMachineInfo
{
  return -[MCProfileServiceServer cloudConfigurationMachineInfoDataWithAdditionalInfo:](self, "cloudConfigurationMachineInfoDataWithAdditionalInfo:", &__NSDictionary0__struct);
}

- (id)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;

  v7 = CFSTR("UDID");
  v8 = CFSTR("SERIAL");
  v9 = CFSTR("PRODUCT");
  v10 = CFSTR("VERSION");
  v11 = CFSTR("IMEI");
  v12 = CFSTR("MEID");
  v13 = CFSTR("LANGUAGE");
  v14 = CFSTR("OS_VERSION");
  v15 = CFSTR("SUPPLEMENTAL_BUILD_VERSION");
  v16 = CFSTR("SUPPLEMENTAL_OS_VERSION_EXTRA");
  v17 = CFSTR("SOFTWARE_UPDATE_DEVICE_ID");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 11));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCMachineInfo machineInfoWithKeys:challenge:identity:additionalInfo:outError:](MCMachineInfo, "machineInfoWithKeys:challenge:identity:additionalInfo:outError:", v4, 0, 0, v3, 0, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17));

  return v5;
}

- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer cloudConfigurationMachineInfoDataWithAdditionalInfo:](self, "cloudConfigurationMachineInfoDataWithAdditionalInfo:", a3));
  v6[2](v6, v7, 0);

}

- (BOOL)storeCloudConfigurationDetails:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfigurationWriter sharedInstance](MCCloudConfigurationWriter, "sharedInstance"));
  LOBYTE(a4) = objc_msgSend(v6, "saveCloudConfigurationDetails:outError:", v5, a4);

  return (char)a4;
}

- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-CloudConfigStoreDetails"));
  v19 = 0;
  -[MCProfileServiceServer storeCloudConfigurationDetails:outError:](self, "storeCloudConfigurationDetails:outError:", v7, &v19);

  v9 = v19;
  global_queue = dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100012CFC;
  v15[3] = &unk_1000E3088;
  v17 = v8;
  v18 = v6;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  v14 = v6;
  dispatch_async(v11, v15);

}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  void (**v3)(id, id);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint8_t buf[16];

  v3 = (void (**)(id, id))a3;
  v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Restoring cloud config & mdm profile from set aside data...", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = MDMCloudConfigurationSetAsideDetailsFilePath();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ((objc_msgSend(v5, "fileExistsAtPath:", v7) & 1) == 0)
  {

    goto LABEL_11;
  }
  v8 = MDMCloudConfigurationDetailsFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v5, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0)
  {
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v11 = _MCLogObjects[2];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Restoring set aside cloud config...", buf, 2u);
  }
  v12 = MDMCloudConfigurationSetAsideDetailsFilePath();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = MDMCloudConfigurationDetailsFilePath();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v31 = 0;
  DMCSafelyCopyItemAtPathToDestinationPathFM(v5, v13, v15, &v31);
  v16 = v31;

  if (!v16)
  {
    v18 = 1;
LABEL_12:
    v19 = MDMPostSetupAutoInstallSetAsideProfilePath();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_msgSend(v5, "fileExistsAtPath:", v20) & 1) != 0)
    {
      v21 = MDMPostSetupAutoInstallProfilePath();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = objc_msgSend(v5, "fileExistsAtPath:", v22);

      if ((v23 & 1) != 0)
      {
        v16 = 0;
        if (!v18)
          goto LABEL_25;
        goto LABEL_24;
      }
      v24 = _MCLogObjects[2];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Restoring set aside mdm profile...", buf, 2u);
      }
      v25 = MDMPostSetupAutoInstallSetAsideProfilePath();
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = MDMPostSetupAutoInstallProfilePath();
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v30 = 0;
      DMCSafelyCopyItemAtPathToDestinationPathFM(v5, v26, v28, &v30);
      v16 = v30;

      if (!v16)
        goto LABEL_24;
      v29 = _MCLogObjects[2];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to restore set aside mdm profile", buf, 2u);
      }
    }
    else
    {

      v16 = 0;
    }
    if ((v18 & 1) == 0)
      goto LABEL_25;
LABEL_24:
    MCSendCloudConfigurationDetailsChangedNotification();
    goto LABEL_25;
  }
  v17 = _MCLogObjects[2];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to restore set aside cloud config", buf, 2u);
  }
LABEL_25:
  if (v3)
    v3[2](v3, v16);

}

- (void)createActivationLockBypassCodeWithCompletion:(id)a3
{
  void (**v3)(id, void *, id);
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void (**)(id, void *, id))a3;
  v4 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-CreateActivationLockBypass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v6 = objc_msgSend(v5, "isSupervised");

  if (v6)
    v7 = +[MCCrypto createAndStoreNewActivationLockBypassCodeAndHashIfNeeded](MCCrypto, "createAndStoreNewActivationLockBypassCodeAndHashIfNeeded");
  v10 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCCrypto storedActivationLockBypassCodeWithOutError:](MCCrypto, "storedActivationLockBypassCodeWithOutError:", &v10));
  v9 = v10;
  if (v3)
    v3[2](v3, v8, v9);

}

- (void)storeActivationRecord:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  CFPropertyListRef *v12;
  const __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  OS_dispatch_queue *workerQueue;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  _QWORD block[5];
  uint8_t buf[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-StoreActivationRecord"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kDMCActivationRecordDeviceFlagsKey));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMCFeatureOverrides activationRecordFlagsWithFlags:](DMCFeatureOverrides, "activationRecordFlagsWithFlags:", v9));
  if (v10)
  {
    if ((objc_opt_respondsToSelector(v10, "intValue") & 1) != 0)
    {
      v11 = objc_msgSend(v10, "intValue");
      v12 = (CFPropertyListRef *)&kCFBooleanTrue;
      if ((v11 & 1) == 0)
        v12 = (CFPropertyListRef *)&kCFBooleanFalse;
      v13 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
      CFPreferencesSetAppValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, *v12, kMCNotBackedUpPreferencesDomain);
      CFPreferencesSetAppValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, 0, v13);
      v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wait for preferences to flush its caches", buf, 2u);
      }
      _CFPreferencesFlushCachesForIdentifier(v13, kMCPreferencesMobileUserName);
      v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Saved activation configuration.", buf, 2u);
      }
      v16 = objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer memberQueue](self, "memberQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013480;
      block[3] = &unk_1000E2C50;
      block[4] = self;
      dispatch_barrier_async(v16, block);

      workerQueue = self->_workerQueue;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10001348C;
      v23[3] = &unk_1000E2D20;
      v23[4] = self;
      v24 = v8;
      dispatch_async((dispatch_queue_t)workerQueue, v23);

      goto LABEL_16;
    }
    v18 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "The activation record configuration flags entry is invalid.", buf, 2u);
    }
  }
  v19 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  v20 = (const __CFString *)kMCPreferencesMobileUserName;
  CFPreferencesSetValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, kCFBooleanFalse, kMCNotBackedUpPreferencesDomain, kMCPreferencesMobileUserName, kCFPreferencesCurrentHost);
  CFPreferencesSetValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, kCFBooleanFalse, v19, v20, kCFPreferencesCurrentHost);
  v21 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Wait for preferences to flush its caches", buf, 2u);
  }
  _CFPreferencesFlushCachesForIdentifier(v19, v20);
  v22 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No activation configuration was received.", buf, 2u);
  }
LABEL_16:
  MCSendActivationRecordStoredNotification();
  v6[2](v6, 0);

}

- (void)setURLsFromUserBookmarkDictsAsSettings:(id)a3 sender:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, MCIntersectionKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, MCFeatureWebContentFilterWhitelistedURLs);
  if (v5)
  {
    v20 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v5, "count")));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v5;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      v15 = kMCWCFAddressKey;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v16), "objectForKeyedSubscript:", v15));
          if (v17)
            objc_msgSend(v10, "addObject:", v17);

          v16 = (char *)v16 + 1;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, MCSettingParameterValuesKey);

    v6 = v20;
    v5 = v21;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v19, "setParametersForSettingsByType:sender:", v7, v6);

}

- (id)bookmarksFromBookmarkDicts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v12 = objc_alloc((Class)MCBookmark);
          v13 = objc_msgSend(v12, "initWithSerializableDictionary:", v11, (_QWORD)v15);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)bookmarkDictsFromBookmarks:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "serializableDictionary", (_QWORD)v13));
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setUserBookmarks:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7;
  void (**v10)(id, _QWORD);
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = *(_QWORD *)&a4;
  v10 = (void (**)(id, _QWORD))a6;
  v11 = a5;
  v12 = a3;
  v17 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetUserBookmarks"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer bookmarksFromBookmarkDicts:](self, "bookmarksFromBookmarkDicts:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCBookmarkManager sharedManager](MCBookmarkManager, "sharedManager"));
  objc_msgSend(v14, "setUserBookmarks:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v15, "setSenderPID:", v7);

  -[MCProfileServiceServer setURLsFromUserBookmarkDictsAsSettings:sender:](self, "setURLsFromUserBookmarkDictsAsSettings:sender:", v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v16, "setSenderPID:", getpid());

  v10[2](v10, 0);
}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013BC4;
  v9[3] = &unk_1000E3460;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "updateMISTrustAndValidateApps:validateManagedApps:completion:", v6, 1, v9);

}

- (void)monitorEnrollmentStateForClient:(id)a3 personaID:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *monitorQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  monitorQueue = self->_monitorQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013C7C;
  v11[3] = &unk_1000E2D20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)monitorQueue, v11);

}

- (void)managingOrganizationInformationWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[15];
  _BYTE v37[128];

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  objc_msgSend(v4, "refreshDetailsFromDisk");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "memberQueueOrganizationInfo"));
  if (v5)
    goto LABEL_2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "details"));

  v8 = kCCOrganizationNameKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCCOrganizationNameKey));

  if (v9)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v8;
    v36[0] = v8;
    v36[1] = kCCOrganizationShortNameKey;
    v36[2] = kCCOrganizationDepartmentKey;
    v36[3] = kCCOrganizationAddressKey;
    v36[4] = kCCOrganizationAddressLine1Key;
    v36[5] = kCCOrganizationAddressLine2Key;
    v36[6] = kCCOrganizationAddressLine3Key;
    v36[7] = kCCOrganizationCityKey;
    v36[8] = kCCOrganizationRegionKey;
    v36[9] = kCCOrganizationZipCodeKey;
    v36[10] = kCCOrganizationCountryKey;
    v36[11] = kCCOrganizationPhoneKey;
    v36[12] = kCCOrganizationEmailKey;
    v36[13] = kCCOrganizationSupportPhoneKey;
    v36[14] = kCCOrganizationSupportEmailKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 15));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v15);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v12);
    }

    v8 = v27;
    if (v5)
      goto LABEL_2;
  }
  else
  {

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "memberQueueManagingProfileIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "installedProfileWithIdentifier:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "organization"));
  if (v21)
  {
    v34 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "organization"));
    v35 = v22;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));

    if (v5)
      goto LABEL_2;
  }
  else
  {

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "memberQueueServerURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "host"));

  if (v24)
  {
    v32 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "memberQueueServerURL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "host"));
    v33 = v26;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));

  }
  else
  {
    v5 = 0;
  }
LABEL_2:
  v3[2](v3, v5, 0);

}

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MCPairedWatchManager *v21;

  v11 = a6;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = objc_opt_new(MCPairedWatchManager);
  -[MCPairedWatchManager stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:declarationConfiguration:completion:](v21, "stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:declarationConfiguration:completion:", v20, v19, v18, v11, v17, v16, v15);

}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  id v3;
  MCPairedWatchManager *v4;

  v3 = a3;
  v4 = objc_opt_new(MCPairedWatchManager);
  -[MCPairedWatchManager unstageMDMEnrollmentInfoForPairingWatchWithCompletion:](v4, "unstageMDMEnrollmentInfoForPairingWatchWithCompletion:", v3);

}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v3;
  MCPairedWatchManager *v4;

  v3 = a3;
  v4 = objc_opt_new(MCPairedWatchManager);
  -[MCPairedWatchManager fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:](v4, "fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:", v3);

}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  MCPairedWatchManager *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new(MCPairedWatchManager);
  -[MCPairedWatchManager fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:completion:](v7, "fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:completion:", v6, v5);

}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  id v3;
  MCPairedWatchManager *v4;

  v3 = a3;
  v4 = objc_opt_new(MCPairedWatchManager);
  -[MCPairedWatchManager fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:](v4, "fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:", v3);

}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MCPairedWatchManager *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13 = objc_opt_new(MCPairedWatchManager);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfigurationWriter sharedInstance](MCCloudConfigurationWriter, "sharedInstance"));
  -[MCPairedWatchManager applyPairingWatchMDMEnrollmentData:source:usingProfileInstaller:cloudConfigReader:cloudConfigWriter:completion:](v13, "applyPairingWatchMDMEnrollmentData:source:usingProfileInstaller:cloudConfigReader:cloudConfigWriter:completion:", v10, v9, self, v11, v12, v8);

}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  MCPairedWatchManager *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new(MCPairedWatchManager);
  -[MCPairedWatchManager updateMDMEnrollmentInfoForPairingWatch:completion:](v7, "updateMDMEnrollmentInfoForPairingWatch:completion:", v6, v5);

}

- (void)effectiveBoolValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void (**v16)(id, void *, _QWORD);

  v16 = (void (**)(id, void *, _QWORD))a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCWatchSettingsMirror sharedMirror](MCWatchSettingsMirror, "sharedMirror"));
  v13 = objc_msgSend(v12, "effectiveBoolValueForSetting:pairingID:pairingDataStore:", v11, v10, v9);

  if (v16)
  {
    v14 = &__kCFBooleanTrue;
    if (v13 != 1)
      v14 = 0;
    if (v13 == 2)
      v15 = &__kCFBooleanFalse;
    else
      v15 = v14;
    v16[2](v16, v15, 0);
  }

}

- (void)effectiveValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);

  v14 = (void (**)(id, void *, _QWORD))a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCWatchSettingsMirror sharedMirror](MCWatchSettingsMirror, "sharedMirror"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "effectiveValueForSetting:pairingID:pairingDataStore:", v11, v10, v9));

  if (v14)
    v14[2](v14, v13, 0);

}

- (void)effectiveValuesForWatchIntersectionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);

  v14 = (void (**)(id, void *, _QWORD))a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCWatchSettingsMirror sharedMirror](MCWatchSettingsMirror, "sharedMirror"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "effectiveIntersectionValuesForSetting:pairingID:pairingDataStore:", v11, v10, v9));

  if (v14)
    v14[2](v14, v13, 0);

}

- (void)effectiveValuesForWatchUnionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);

  v14 = (void (**)(id, void *, _QWORD))a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCWatchSettingsMirror sharedMirror](MCWatchSettingsMirror, "sharedMirror"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "effectiveUnionValuesForSetting:pairingID:pairingDataStore:", v11, v10, v9));

  if (v14)
    v14[2](v14, v13, 0);

}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OS_dispatch_queue *workerQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-DebugRescheduleBackgroundActivity"));
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014818;
  block[3] = &unk_1000E3488;
  v28 = v15;
  v29 = a3;
  block[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async((dispatch_queue_t)workerQueue, block);

}

- (void)setConnectionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTracker, a3);
}

- (os_unfair_lock_s)checkInLock
{
  return self->_checkInLock;
}

- (void)setCheckInLock:(os_unfair_lock_s)a3
{
  self->_checkInLock = a3;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (MCBackgroundActivityManager)workerQueueBackgroundActivityManager
{
  return self->_workerQueueBackgroundActivityManager;
}

- (void)setWorkerQueueBackgroundActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueueBackgroundActivityManager, a3);
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_monitorQueue, a3);
}

- (unint64_t)workerQueueLastCarrierProfileCheckTime
{
  return self->_workerQueueLastCarrierProfileCheckTime;
}

- (void)setWorkerQueueLastCarrierProfileCheckTime:(unint64_t)a3
{
  self->_workerQueueLastCarrierProfileCheckTime = a3;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (double)memberQueueIdleTimeInterval
{
  return self->_memberQueueIdleTimeInterval;
}

- (void)setMemberQueueIdleTimeInterval:(double)a3
{
  self->_memberQueueIdleTimeInterval = a3;
}

- (BOOL)memberQueueHasMigrated
{
  return self->_memberQueueHasMigrated;
}

- (void)setMemberQueueHasMigrated:(BOOL)a3
{
  self->_memberQueueHasMigrated = a3;
}

- (BOOL)memberQueueHasActivationRecordChangesPending
{
  return self->_memberQueueHasActivationRecordChangesPending;
}

- (void)setMemberQueueHasActivationRecordChangesPending:(BOOL)a3
{
  self->_memberQueueHasActivationRecordChangesPending = a3;
}

- (OS_dispatch_queue)clientRestrictionQueue
{
  return self->_clientRestrictionQueue;
}

- (void)setClientRestrictionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientRestrictionQueue, a3);
}

- (OS_dispatch_queue)mailAccountsQueue
{
  return self->_mailAccountsQueue;
}

- (void)setMailAccountsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mailAccountsQueue, a3);
}

- (id)powerAssertionAssertedNotificationToken
{
  return self->_powerAssertionAssertedNotificationToken;
}

- (void)setPowerAssertionAssertedNotificationToken:(id)a3
{
  objc_storeStrong(&self->_powerAssertionAssertedNotificationToken, a3);
}

- (id)powerAssertionDeassertedNotificationToken
{
  return self->_powerAssertionDeassertedNotificationToken;
}

- (void)setPowerAssertionDeassertedNotificationToken:(id)a3
{
  objc_storeStrong(&self->_powerAssertionDeassertedNotificationToken, a3);
}

- (int)mobileKeybagLockStateChangeNotificationToken
{
  return self->_mobileKeybagLockStateChangeNotificationToken;
}

- (void)setMobileKeybagLockStateChangeNotificationToken:(int)a3
{
  self->_mobileKeybagLockStateChangeNotificationToken = a3;
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_appWorkspace, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong(&self->_powerAssertionDeassertedNotificationToken, 0);
  objc_storeStrong(&self->_powerAssertionAssertedNotificationToken, 0);
  objc_storeStrong((id *)&self->_mailAccountsQueue, 0);
  objc_storeStrong((id *)&self->_clientRestrictionQueue, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_workerQueueBackgroundActivityManager, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_connectionTracker, 0);
}

@end
