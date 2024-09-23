@implementation MBDriveBackupEngine

+ (id)backupEngineWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v5;
  id v6;
  MBDriveBackupEngine *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MBDriveBackupEngine initWithSettingsContext:debugContext:]([MBDriveBackupEngine alloc], "initWithSettingsContext:debugContext:", v6, v5);

  return v7;
}

- (MBDriveBackupEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  MBDriveBackupEngine *v11;
  MBProgress *v12;
  MBProgress *progress;
  MBDriveScript *v14;
  MBDriveScript *driveScript;
  MBProgressDrive *v16;
  MBDriveScript *v17;
  void *v18;
  void *v19;
  MBProgressDrive *v20;
  MBDrive *drive;
  MBBackupHelper *v22;
  MBBackupHelper *backupHelper;
  NSMutableSet *v24;
  NSMutableSet *modifiedDomains;
  NSMutableDictionary *v26;
  NSMutableDictionary *uploadOperationsByPath;
  MBMountedSnapshotTracker *v28;
  MBMountedSnapshotTracker *mountedSnapshotTracker;
  void *v30;
  unsigned int v31;
  MBProperties *v32;
  MBProperties *preflightProperties;
  void *v34;
  void *v35;
  void *v36;
  MBAnalyticsEvent *v37;
  unsigned int v38;
  int v39;
  NSMutableSet *v40;
  NSMutableSet *inodeCache;
  NSMutableSet *v42;
  NSMutableSet *cloneIDCache;
  objc_super v45;
  id v46;

  v6 = a3;
  v7 = a4;
  v46 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", &v46));
  v9 = v46;
  v10 = objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", v8);
  v45.receiver = self;
  v45.super_class = (Class)MBDriveBackupEngine;
  v11 = -[MBEngine initWithSettingsContext:debugContext:domainManager:](&v45, "initWithSettingsContext:debugContext:domainManager:", v6, v7, v10);
  if (v11)
  {
    v12 = objc_alloc_init(MBProgress);
    progress = v11->_progress;
    v11->_progress = v12;

    v14 = -[MBDriveScript initWithProgress:]([MBDriveScript alloc], "initWithProgress:", v11->_progress);
    driveScript = v11->_driveScript;
    v11->_driveScript = v14;

    v16 = [MBProgressDrive alloc];
    v17 = v11->_driveScript;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](v11, "settingsContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "drive"));
    v20 = -[MBProgressDrive initWithScript:delegate:](v16, "initWithScript:delegate:", v17, v19);
    drive = v11->_drive;
    v11->_drive = &v20->super;

    v22 = -[MBBackupHelper initWithSettingsContext:domainManager:]([MBBackupHelper alloc], "initWithSettingsContext:domainManager:", v6, v11->super._domainManager);
    backupHelper = v11->_backupHelper;
    v11->_backupHelper = v22;

    v24 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    modifiedDomains = v11->_modifiedDomains;
    v11->_modifiedDomains = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uploadOperationsByPath = v11->_uploadOperationsByPath;
    v11->_uploadOperationsByPath = v26;

    v28 = objc_opt_new(MBMountedSnapshotTracker);
    mountedSnapshotTracker = v11->_mountedSnapshotTracker;
    v11->_mountedSnapshotTracker = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](v11, "settingsContext"));
    v31 = objc_msgSend(v30, "isDeviceTransfer");

    if (v31)
    {
      v11->_engineType = 4;
      if (v11->super._preflightProperties)
        sub_100087680();
      v32 = (MBProperties *)objc_alloc_init((Class)MBProperties);
      preflightProperties = v11->super._preflightProperties;
      v11->super._preflightProperties = v32;

    }
    else
    {
      v11->_engineType = 1;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MBEngine stringForEngineType:](MBEngine, "stringForEngineType:", -[MBDriveBackupEngine engineType](v11, "engineType")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[MBEngine stringForEngineMode:](MBEngine, "stringForEngineMode:", -[MBDriveBackupEngine engineMode](v11, "engineMode")));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.MobileBackup"), v34, v35));

    v37 = -[MBAnalyticsEvent initWithEventName:]([MBAnalyticsEvent alloc], "initWithEventName:", v36);
    -[MBEngine setAnalyticsEvent:](v11, "setAnalyticsEvent:", v37);

    v11->_concurrentUploadBatchCount = 1;
    v38 = objc_msgSend(v7, "intForName:", CFSTR("BatchSize"));
    if (v38)
      v39 = v38;
    else
      v39 = 128;
    v11->_batchSize = v39;
    if ((_os_feature_enabled_impl("MobileBackup", "D2DHardLinksAndClones") & v31) == 1)
    {
      v40 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      inodeCache = v11->_inodeCache;
      v11->_inodeCache = v40;

      v42 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      cloneIDCache = v11->_cloneIDCache;
      v11->_cloneIDCache = v42;

    }
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[MBDriveBackupEngine setScanner:](self, "setScanner:", 0);
  -[MBDriveBackupEngine _removeFilesystemSnapshot](self, "_removeFilesystemSnapshot");
  v3.receiver = self;
  v3.super_class = (Class)MBDriveBackupEngine;
  -[MBDriveBackupEngine dealloc](&v3, "dealloc");
}

- (MBDriveSettingsContext)settingsContext
{
  return (MBDriveSettingsContext *)self->super._settingsContext;
}

- (NSSet)prefixDirectories
{
  MBDriveBackupEngine *v2;
  NSSet *prefixDirectories;
  NSMutableSet *v4;
  uint64_t v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  v2 = self;
  objc_sync_enter(v2);
  prefixDirectories = v2->_prefixDirectories;
  if (!prefixDirectories)
  {
    v4 = objc_opt_new(NSMutableSet);
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x"), v5));
      -[NSMutableSet addObject:](v4, "addObject:", v6);

      v5 = (v5 + 1);
    }
    while ((_DWORD)v5 != 256);
    v7 = v2->_prefixDirectories;
    v2->_prefixDirectories = &v4->super;

    prefixDirectories = v2->_prefixDirectories;
  }
  v8 = prefixDirectories;
  objc_sync_exit(v2);

  return v8;
}

- (id)preflight
{
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  MBDebugContext *debugContext;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  double v35;

  v3 = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = -[MBDriveBackupEngine setStartTime:](self, "setStartTime:");
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting backup", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Starting backup");
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  objc_msgSend(v10, "log");

  v13 = MBGetDefaultLog(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    debugContext = self->super._debugContext;
    *(_DWORD *)buf = 138412290;
    v35 = *(double *)&debugContext;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "DebugContext: %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "DebugContext: %@", self->super._debugContext);
  }

  v18 = MBGetDefaultLog(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Starting preflight", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Starting preflight");
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _preflight](self, "_preflight"));
  v21 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v23 = v22;
  v25 = MBGetDefaultLog(v21, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v23 - v5;
    *(_DWORD *)buf = 134217984;
    v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Finished preflight in %0.3fs", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Finished preflight in %0.3fs", v27);
  }

  if (v20)
  {
    v30 = MBGetDefaultLog(v28, v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = *(double *)&v20;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to preflight: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to preflight: %@", v20);
    }

    v32 = -[MBDriveBackupEngine _cleanup](self, "_cleanup");
  }
  objc_autoreleasePoolPop(v3);
  return v20;
}

- (id)backupAfterPreflight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  double v21;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _backupAfterPreflight](self, "_backupAfterPreflight"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = -[MBDriveBackupEngine startTime](self, "startTime");
  v9 = v8;
  v11 = MBGetDefaultLog(v7, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v6 - v9;
    *(_DWORD *)buf = 134217984;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Finished backup in %0.3fs", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Finished backup in %0.3fs", v13);
  }

  if (v4)
  {
    v16 = MBGetDefaultLog(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = *(double *)&v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to backup: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to backup: %@", v4);
    }

    v18 = -[MBDriveBackupEngine _cleanup](self, "_cleanup");
  }
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)cleanup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _cleanup](self, "_cleanup"));
  v6 = (void *)v4;
  if (v4)
  {
    v7 = MBGetDefaultLog(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to cleanup: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to cleanup: %@", v6);
    }

  }
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)promptUser
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  LAContext *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  intptr_t v21;
  uint64_t v22;
  intptr_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v27[4];
  NSObject *v28;
  _BYTE *v29;
  uint8_t v30[4];
  uint64_t v31;
  _BYTE buf[24];
  char v33;
  _QWORD v34[2];
  _QWORD v35[2];

  if (sub_100081D30()
    && (v30[0] = 0,
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona")),
        v4 = objc_msgSend(v3, "getBooleanValueForKey:keyExists:", CFSTR("EnableLocalBackupPrompt"), v30),
        v3,
        v30[0])
    && !v4)
  {
    v7 = MBGetDefaultLog(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = CFSTR("EnableLocalBackupPrompt");
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@:%d", buf, 0x12u);
      _MBLog(CFSTR("DEFAULT"), "%{public}@:%d", CFSTR("EnableLocalBackupPrompt"), 0);
    }

    v9 = 0;
    v10 = 0;
  }
  else
  {
    v11 = objc_autoreleasePoolPush();
    v12 = objc_opt_new(LAContext);
    v13 = MBLocalizedStringFromTable(CFSTR("PROMPT_LOCAL_BACKUP_TITLE"), CFSTR("MobileBackup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = MBLocalizedStringFromTable(CFSTR("PROMPT_LOCAL_BACKUP_BODY"), CFSTR("MobileBackup"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)v16;
    v18 = 0;
    if (v14 && v16)
    {
      v34[0] = &off_1000E4ED8;
      v34[1] = &off_1000E4EF0;
      v35[0] = v14;
      v35[1] = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v33 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001DB14;
    v27[3] = &unk_1000D94F0;
    v29 = buf;
    v19 = dispatch_semaphore_create(0);
    v28 = v19;
    -[LAContext evaluatePolicy:options:reply:](v12, "evaluatePolicy:options:reply:", 1013, v18, v27);
    v20 = dispatch_time(0, 1800000000000);
    v21 = dispatch_semaphore_wait(v19, v20);
    v23 = v21;
    if (v21)
    {
      v24 = MBGetDefaultLog(v21, v22);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v30 = 134217984;
        v31 = 30;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Timed out waiting %lld minutes for passcode", v30, 0xCu);
        _MBLog(CFSTR("ERROR"), "Timed out waiting %lld minutes for passcode", 30);
      }

      -[LAContext invalidate](v12, "invalidate");
      v9 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Device locked - timeout waiting for passcode entry")));
      v10 = v9;
    }
    else
    {
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        v9 = 0;
      else
        v9 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Device locked")));
      v10 = 0;
    }

    _Block_object_dispose(buf, 8);
    objc_autoreleasePoolPop(v11);
    if (!v23)
    {
      v9 = v9;
      v10 = v9;
    }
  }

  return v10;
}

- (id)backup
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine promptUser](self, "promptUser"));
  if (!v3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine preflight](self, "preflight"));
    if (!v3)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine backupAfterPreflight](self, "backupAfterPreflight"));
      if (!v3)
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine cleanup](self, "cleanup"));
    }
  }
  return v3;
}

- (id)_preflight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MBError *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _preconditions](self, "_preconditions"));
  if (!v3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setup](self, "_setup"));
    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "plugins"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));
      v7 = sub_100039C34(self, v6, "startingBackupWithEngine:", (uint64_t)self);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v7);

      if (!v3)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _resume](self, "_resume"));
        if (!v3)
        {
          if (!self->_fullBackup)
          {
            v8 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _verifyBackupReloadingManifest:](self, "_verifyBackupReloadingManifest:", 0));
            if (v8)
            {
              v10 = (void *)v8;
              v11 = MBGetDefaultLog(v8, v9);
              v12 = objc_claimAutoreleasedReturnValue(v11);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v15 = v10;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Existing backup is corrupt, forcing a full backup: %@", buf, 0xCu);
                _MBLog(CFSTR("ERROR"), "Existing backup is corrupt, forcing a full backup: %@", v10);
              }

              self->_fullBackup = 1;
            }
          }
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _scan](self, "_scan"));
          if (!v3)
            v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareForPreflight](self, "_prepareForPreflight"));
        }
      }
    }
  }
  return v3;
}

- (id)_backupAfterPreflight
{
  uint64_t v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  MBError *v9;

  while (1)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareForUpload](self, "_prepareForUpload"));
    if (v3)
      goto LABEL_7;
    v3 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _upload](self, "_upload"));
    if (v3)
      goto LABEL_7;
    if (!-[MBDriveBackupEngine _shouldRetry](self, "_shouldRetry"))
      break;
    v3 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _retry](self, "_retry"));
    if (!v3)
    {
      v3 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _scan](self, "_scan"));
      if (!v3)
      {
        v3 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareForPreflight](self, "_prepareForPreflight"));
        if (!v3)
          continue;
      }
    }
    goto LABEL_7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _moveWithOperationType:](self, "_moveWithOperationType:", 3));
  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _removeWithOperationType:](self, "_removeWithOperationType:", 4));
    if (!v4)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _removeDeviceSnapshot](self, "_removeDeviceSnapshot"));
      if (!v4)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _removeOldBackup](self, "_removeOldBackup"));
        if (!v4
          && (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine")
           || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _verifyBackupReloadingManifest:](self, "_verifyBackupReloadingManifest:", 1))) == 0))
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "plugins"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));
          v9 = sub_100039C34(self, v8, "endingBackupWithEngine:", (uint64_t)self);
          v4 = (void *)objc_claimAutoreleasedReturnValue(v9);

          if (!v4)
          {
            v3 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _postconditions](self, "_postconditions"));
LABEL_7:
            v4 = (void *)v3;
          }
        }
      }
    }
  }
  return v4;
}

- (id)_setup
{
  void *v3;
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  MBAppManager *v11;
  MBAppManager *appManager;
  MBAppManager *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  __CFString *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  __CFString *v39;
  void *v40;
  MBDomainManager *domainManager;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *j;
  void *v47;
  MBDomainManager *v48;
  void *v49;
  id v50;
  void *v51;
  NSMutableSet *v52;
  NSMutableSet *domainsToScan;
  void *v54;
  __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  const __CFString *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v76;
  __CFString *v77;
  id obj;
  __CFString *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint8_t v89[128];
  uint8_t buf[4];
  const __CFString *v91;
  _BYTE v92[128];

  v3 = objc_autoreleasePoolPush();
  if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrash")))
    abort();
  if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateException")))
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("SimulatedException"), CFSTR("Simulated exception"));
  v4 = -[MBDebugContext intForName:](self->super._debugContext, "intForName:", CFSTR("SimulateErrorCode"));
  if (!(_DWORD)v4)
  {
    v7 = MBGetDefaultLog(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Initializing app manager", buf, 2u);
      _MBLog(CFSTR("INFO"), "Initializing app manager");
    }

    v9 = objc_alloc((Class)MBAppManager);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v11 = (MBAppManager *)objc_msgSend(v9, "initWithSettingsContext:", v10);
    appManager = self->super._appManager;
    self->super._appManager = v11;

    v13 = self->super._appManager;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
    v88 = 0;
    LOBYTE(v13) = -[MBAppManager loadAppsWithPersona:safeHarbors:error:](v13, "loadAppsWithPersona:safeHarbors:error:", v14, 1, &v88);
    v15 = (__CFString *)v88;

    if ((v13 & 1) != 0)
    {
      v18 = MBGetDefaultLog(v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Removing old safe harbors", buf, 2u);
        _MBLog(CFSTR("INFO"), "Removing old safe harbors");
      }

      -[MBAppManager removeOldSafeHarbors](self->super._appManager, "removeOldSafeHarbors");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDomainManager domainForPath:relativePath:](self->super._domainManager, "domainForPath:relativePath:", CFSTR("/var/mobile/Applications"), 0));

      v23 = MBGetDefaultLog(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = v24;
      v77 = v15;
      if (v20)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v91 = CFSTR("/var/mobile/Applications");
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ is being backed up directly", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "%@ is being backed up directly", CFSTR("/var/mobile/Applications"));
        }
      }
      else
      {
        v76 = v3;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Creating container domains", buf, 2u);
          _MBLog(CFSTR("INFO"), "Creating container domains");
        }

        v25 = objc_claimAutoreleasedReturnValue(-[MBAppManager allRestrictedDomainNames](self->super._appManager, "allRestrictedDomainNames"));
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(-[MBAppManager allContainers](self->super._appManager, "allContainers"));
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v85;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(_QWORD *)v85 != v29)
                objc_enumerationMutation(obj);
              v31 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "domain"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
              v34 = -[NSObject containsObject:](v25, "containsObject:", v33);

              if ((v34 & 1) != 0)
              {
                v37 = MBGetDefaultLog(v35, v36);
                v38 = objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  v39 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
                  *(_DWORD *)buf = 138412290;
                  v91 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Not backing up restricted app: %@", buf, 0xCu);

                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
                  _MBLog(CFSTR("INFO"), "Not backing up restricted app: %@", v40);

                }
              }
              else
              {
                domainManager = self->super._domainManager;
                v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "domain"));
                -[MBDomainManager addDomain:](domainManager, "addDomain:", v38);
              }

            }
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
          }
          while (v28);
        }

        v3 = v76;
      }

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MBAppManager allSystemContainers](self->super._appManager, "allSystemContainers"));
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(_QWORD *)v81 != v45)
              objc_enumerationMutation(v42);
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j), "domain"));
            v48 = self->super._domainManager;
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
            LOBYTE(v48) = -[MBDomainManager containsDomainName:](v48, "containsDomainName:", v49);

            if ((v48 & 1) == 0)
              -[MBDomainManager addDomain:](self->super._domainManager, "addDomain:", v47);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
        }
        while (v44);
      }

      v50 = objc_alloc((Class)NSMutableSet);
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MBDomainManager allDomains](self->super._domainManager, "allDomains"));
      v52 = (NSMutableSet *)objc_msgSend(v50, "initWithArray:", v51);
      domainsToScan = self->_domainsToScan;
      self->_domainsToScan = v52;

      -[MBDebugContext setInt:forName:](self->super._debugContext, "setInt:forName:", 0, CFSTR("RetryCount"));
      if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
      {
        v15 = v77;
        if (objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password")))
          sub_1000876A8();
      }
      else
      {
        v79 = v77;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeychainManager fetchLocalBackupPasswordAndReturnError:](MBKeychainManager, "fetchLocalBackupPasswordAndReturnError:", &v79));
        v55 = v79;

        -[MBDriveBackupEngine setPassword:](self, "setPassword:", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));

        if (v56
          || (v57 = +[MBError isError:withCode:](MBError, "isError:withCode:", v55, 4), !(_DWORD)v57))
        {
          if (v55)
          {
            v59 = MBGetDefaultLog(v57, v58);
            v60 = objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v91 = v55;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Error fetching backup password: %@", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), "Error fetching backup password: %@", v55);
            }

            v26 = v55;
            v15 = v26;
            goto LABEL_67;
          }
        }
        else
        {

        }
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));

        if (v61)
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
          objc_msgSend(v62, "updatePassword:", v63);

        }
        v15 = 0;
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
      -[MBEngine setEncrypted:](self, "setEncrypted:", v64 != 0);

      v67 = MBGetDefaultLog(v65, v66);
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        if (-[MBEngine encrypted](self, "encrypted"))
          v69 = CFSTR("enabled");
        else
          v69 = CFSTR("disabled");
        *(_DWORD *)buf = 138412290;
        v91 = v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Encryption is %@", buf, 0xCu);
        if (-[MBEngine encrypted](self, "encrypted"))
          v70 = CFSTR("enabled");
        else
          v70 = CFSTR("disabled");
        _MBLog(CFSTR("DEFAULT"), "Encryption is %@", v70);
      }

      -[MBDebugContext setBool:forName:](self->super._debugContext, "setBool:forName:", -[MBEngine encrypted](self, "encrypted"), CFSTR("IsEncrypted"));
      if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
        goto LABEL_65;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[MBLockdown connect](MBLockdown, "connect"));
      if (v71)
      {
        v72 = v71;
        v73 = objc_msgSend(v71, "objectForDomain:andKey:", CFSTR("com.apple.mobile.backup"), CFSTR("RequiresEncryption"));
        v74 = v73;
        if (!v73 || !objc_msgSend(v73, "BOOLValue") || -[MBEngine encrypted](self, "encrypted"))
        {
          objc_msgSend(v72, "disconnect");

LABEL_65:
          objc_autoreleasePoolPop(v3);
          return 0;
        }
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 207, CFSTR("No backup password set when required by device management")));

LABEL_68:
        goto LABEL_69;
      }
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to connect to lockdown")));
    }
    else
    {
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v15, CFSTR("Error initializing app manager")));
    }
LABEL_67:
    v6 = v26;
    goto LABEL_68;
  }
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", (int)v4, CFSTR("Simulated error code")));
LABEL_69:
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)endWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MBError *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "plugins"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
  v8 = sub_100039C90(self, v7, "endedBackupWithEngine:error:", (uint64_t)self, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = -[MBDriveBackupEngine _removeFilesystemSnapshot](self, "_removeFilesystemSnapshot");
  if (!v4 && v9)
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v9));
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Backup error - %@", buf, 0xCu);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v9));
      _MBLog(CFSTR("ERROR"), "Backup error - %@", v15);

    }
    v4 = v9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine analyticsEvent](self, "analyticsEvent"));
  objc_msgSend(v16, "submit");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  objc_msgSend(v17, "setEncryptionManager:", 0);

  return v4;
}

- (id)_cleanup
{
  MBBackupOperationJournal *operationJournal;
  MBManifestDB *snapshotManifestDB;
  MBManifestDB *backupManifestDB;

  -[MBBackupOperationJournal close](self->_operationJournal, "close");
  operationJournal = self->_operationJournal;
  self->_operationJournal = 0;

  -[MBManifestDB closeWithError:](self->_snapshotManifestDB, "closeWithError:", 0);
  snapshotManifestDB = self->_snapshotManifestDB;
  self->_snapshotManifestDB = 0;

  -[MBManifestDB closeAndRemoveFileWithError:](self->_backupManifestDB, "closeAndRemoveFileWithError:", 0);
  backupManifestDB = self->_backupManifestDB;
  self->_backupManifestDB = 0;

  return -[MBDriveBackupEngine _cleanupDeviceSnapshotDir](self, "_cleanupDeviceSnapshotDir");
}

- (id)_cleanupDeviceSnapshotDir
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint8_t buf[16];

  if (!self->_uuid)
    return 0;
  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing snapshot on device", buf, 2u);
    _MBLog(CFSTR("INFO"), "Removing snapshot on device");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
  v14 = 0;
  v7 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v14);
  v8 = v14;

  if ((v7 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    if (objc_msgSend(v11, "isEqualToString:", NSCocoaErrorDomain))
    {
      v12 = objc_msgSend(v8, "code");

      if (v12 == (id)4)
      {
        v9 = 0;
        v13 = v8;
        v8 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 102, v8, v13, CFSTR("Error removing snapshot dir")));
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (void)fileModifiedWhileUploadingFile:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MBManifestDB *snapshotManifestDB;
  void *v16;
  id v17;
  MBDriveBackupEngine *v18;
  NSMutableSet *modifiedDomains;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absolutePath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileID"));
    *(_DWORD *)buf = 138412802;
    v22 = v7;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "File modified while being uploaded (%@): %@ (%@)", buf, 0x20u);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absolutePath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileID"));
    _MBLog(CFSTR("DEFAULT"), "File modified while being uploaded (%@): %@ (%@)", v7, v13, v14);

  }
  snapshotManifestDB = self->_snapshotManifestDB;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileID"));
  v17 = -[MBManifestDB setFlags:mask:forFileID:](snapshotManifestDB, "setFlags:mask:forFileID:", 16, -9, v16);

  v18 = self;
  objc_sync_enter(v18);
  modifiedDomains = v18->_modifiedDomains;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  -[NSMutableSet addObject:](modifiedDomains, "addObject:", v20);

  objc_sync_exit(v18);
}

- (id)_preconditions
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  id v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetIdentifier"));
  v6 = MBDeviceUDID_Legacy();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "targetIdentifier"));
    v35 = MBDeviceUDID_Legacy();
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveBackupEngine.m"), 517, CFSTR("Backup target device ID %@ doesn't match actual device ID %@"), v34, v36);

  }
  if (BYSetupAssistantNeedsToRun())
  {
    v9 = CFSTR("Unable to backup until Setup is finished");
    v10 = 212;
    return (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v10, v9));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v12 = objc_msgSend(v11, "isEphemeralMultiUser");

  if (v12)
  {
    v9 = CFSTR("Backup disabled for this device");
    v10 = 22;
    return (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v10, v9));
  }
  if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "manager"));

  }
  else
  {
    v15 = objc_alloc_init((Class)MBManager);
  }
  v37 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "restoreStateWithError:", &v37));
  v17 = v37;
  if (v16)
  {
    v18 = objc_msgSend(v16, "state");
    v20 = (int)v18;
    if (v18 >= 7 || ((0x71u >> (char)v18) & 1) == 0)
    {
      v21 = MBGetDefaultLog(v18, v19);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "iTunes Backup is unavailable while an iCloud Restore is in progress (%d)", buf, 8u);
        _MBLog(CFSTR("ERROR"), "iTunes Backup is unavailable while an iCloud Restore is in progress (%d)", v20);
      }

      v23 = CFSTR("iTunes Backup is unavailable while an iCloud Restore is in progress");
      v24 = 25;
LABEL_25:
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v24, v23));
      goto LABEL_26;
    }
  }
  else
  {
    v25 = +[MBError isError:withCode:](MBError, "isError:withCode:", v17, 210);
    v26 = (char)v25;
    v28 = MBGetDefaultLog(v25, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = v29;
    if ((v26 & 1) == 0)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v17;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to fetch iCloud Restore state: %{public}@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to fetch iCloud Restore state: %{public}@", v17);
      }

      v23 = CFSTR("Failed to determine iCloud Restore state");
      v24 = 1;
      goto LABEL_25;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No iCloud account", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "No iCloud account");
    }

  }
  v31 = 0;
LABEL_26:

  return v31;
}

- (id)_postconditions
{
  -[MBDriveScript finishedPerforming](self->_driveScript, "finishedPerforming");
  return 0;
}

- (id)_resume
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  MBBackupHelper *backupHelper;
  MBStatus *v10;
  id v11;
  MBStatus *status;
  MBStatus *v13;
  double v14;
  MBStatus *v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  MBDebugContext *v29;
  const __CFString *v30;
  MBDebugContext *debugContext;
  void *v32;
  MBDebugContext *v33;
  void *v34;
  NSString *v35;
  NSString *uuid;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  double v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  double v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  id v70;
  MBManifestDB *snapshotManifestDB;
  _BOOL8 v72;
  uint64_t v73;
  MBManifestDB *backupManifestDB;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  unsigned int v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  NSString *v85;
  NSString *v86;
  uint64_t v87;
  NSObject *v88;
  double v89;
  double v90;
  void *v91;
  id v93;
  uint8_t buf[4];
  double v95;

  v3 = objc_autoreleasePoolPush();
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting to retrieve previous backup status", buf, 2u);
    _MBLog(CFSTR("INFO"), "Starting to retrieve previous backup status");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  backupHelper = self->_backupHelper;
  v93 = 0;
  v10 = (MBStatus *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readStatusWithError:](backupHelper, "readStatusWithError:", &v93));
  v11 = v93;
  status = self->_status;
  self->_status = v10;

  v13 = self->_status;
  if (!v13)
    goto LABEL_10;
  -[MBStatus version](v13, "version");
  if (v14 >= 3.3)
  {
    debugContext = self->super._debugContext;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MBStatus backupStateName](self->_status, "backupStateName"));
    -[MBDebugContext setValue:forName:](debugContext, "setValue:forName:", v32, CFSTR("BackupState"));

    v33 = self->super._debugContext;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBStatus snapshotStateName](self->_status, "snapshotStateName"));
    -[MBDebugContext setValue:forName:](v33, "setValue:forName:", v34, CFSTR("SnapshotState"));

    -[MBDebugContext setInt:forName:](self->super._debugContext, "setInt:forName:", -[MBStatus isFullBackup](self->_status, "isFullBackup"), CFSTR("StatusIsFullBackup"));
    v35 = (NSString *)objc_claimAutoreleasedReturnValue(-[MBStatus uuid](self->_status, "uuid"));
    uuid = self->_uuid;
    self->_uuid = v35;

    self->_fullBackup = -[MBStatus isFullBackup](self->_status, "isFullBackup");
    v37 = -[MBStatus isFinished](self->_status, "isFinished");
    if (!v37)
    {
      v39 = MBGetDefaultLog(v37, v38);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[MBStatus snapshotStateName](self->_status, "snapshotStateName")));
        *(_DWORD *)buf = 138412290;
        v95 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Resuming after failure during '%@' phase", buf, 0xCu);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MBStatus snapshotStateName](self->_status, "snapshotStateName"));
        _MBLog(CFSTR("DEFAULT"), "Resuming after failure during '%@' phase", v42);

      }
    }
    if (-[MBStatus isUploading](self->_status, "isUploading"))
    {
      v43 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _resumeAfterFailureUploading](self, "_resumeAfterFailureUploading"));
    }
    else if (-[MBStatus isMoving](self->_status, "isMoving"))
    {
      v43 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _resumeAfterFailureMoving](self, "_resumeAfterFailureMoving"));
    }
    else if (-[MBStatus isRemoving](self->_status, "isRemoving"))
    {
      v43 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _resumeAfterFailureRemoving](self, "_resumeAfterFailureRemoving"));
    }
    else if (-[MBStatus isFinished](self->_status, "isFinished"))
    {
      v43 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _resumeAfterSuccess](self, "_resumeAfterSuccess"));
    }
    else
    {
      v43 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Invalid snapshot state: %d"), -[MBStatus snapshotState](self->_status, "snapshotState")));
    }
    v55 = (void *)v43;

    if (v55)
    {
      v56 = +[MBError isError:withCode:](MBError, "isError:withCode:", v55, 203);
      if ((_DWORD)v56)
      {
        v58 = MBGetDefaultLog(v56, v57);
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v55)));
          *(_DWORD *)buf = 138412290;
          v95 = v60;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

          v61 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v55));
          _MBLog(CFSTR("INFO"), "%@", v61);

        }
        v64 = MBGetDefaultLog(v62, v63);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Performing full backup to replace unsupported format", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Performing full backup to replace unsupported format");
        }

        -[MBDebugContext setFlag:](self->super._debugContext, "setFlag:", CFSTR("ManifestVersionUnsupported"));
        self->_fullBackup = 1;
      }
      else
      {
        v66 = +[MBError isError:withCode:](MBError, "isError:withCode:", v55, 207);
        if (!(_DWORD)v66)
        {
          v54 = v55;
          v11 = v54;
          goto LABEL_69;
        }
        v68 = MBGetDefaultLog(v66, v67);
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Password has changed. Performing full backup encrypted with new password.", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Password has changed. Performing full backup encrypted with new password.");
        }

        self->_fullBackup = 1;
        v70 = -[MBDriveBackupEngine _cleanupDeviceSnapshotDir](self, "_cleanupDeviceSnapshotDir");
      }
    }
    snapshotManifestDB = self->_snapshotManifestDB;
    if (snapshotManifestDB && (v72 = -[MBManifestDB domainRedirects](snapshotManifestDB, "domainRedirects"))
      || (backupManifestDB = self->_backupManifestDB) != 0
      && (v72 = -[MBManifestDB domainRedirects](backupManifestDB, "domainRedirects")))
    {
      v75 = MBGetDefaultLog(v72, v73);
      v76 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Performing full backup because of domain redirects", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Performing full backup because of domain redirects");
      }

      self->_fullBackup = 1;
    }
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
    if (objc_msgSend(v77, "hasCorruptSQLiteDBs"))
    {

    }
    else
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_backupManifestDB, "properties"));
      v81 = objc_msgSend(v80, "hasCorruptSQLiteDBs");

      if (!v81)
      {
LABEL_60:
        v23 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterResumingSuccessfully"));
        if ((_DWORD)v23)
          abort();
        v11 = 0;
        goto LABEL_62;
      }
    }
    v82 = MBGetDefaultLog(v78, v79);
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136380675;
      v95 = COERCE_DOUBLE("9365479");
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "This backup has corrupt SQLite databases. Forcing a full backup to work around %{private}s", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "This backup has corrupt SQLite databases. Forcing a full backup to work around %{private}s", "9365479");
    }

    self->_fullBackup = 1;
    goto LABEL_60;
  }
  v15 = self->_status;
  if (v15)
  {
    v16 = -[MBStatus version](v15, "version");
    if (v18 < 3.3)
    {
      v19 = MBGetDefaultLog(v16, v17);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[MBStatus version](self->_status, "version");
        *(_DWORD *)buf = 134217984;
        v95 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Status: version=%0.1f", buf, 0xCu);
        -[MBStatus version](self->_status, "version");
        _MBLog(CFSTR("INFO"), "Status: version=%0.1f", v22);
      }

      v23 = -[MBDebugContext setFlag:](self->super._debugContext, "setFlag:", CFSTR("OldStatusFound"));
      goto LABEL_27;
    }
  }
LABEL_10:
  v25 = +[MBError isError:withCode:](MBError, "isError:withCode:", v11, 4);
  if (!(_DWORD)v25)
  {
    v44 = +[MBError isError:withCode:](MBError, "isError:withCode:", v11, 203);
    if ((_DWORD)v44)
    {
      v46 = MBGetDefaultLog(v44, v45);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v11)));
        *(_DWORD *)buf = 138412290;
        v95 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        v49 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v11));
        _MBLog(CFSTR("INFO"), "%@", v49);

      }
      v52 = MBGetDefaultLog(v50, v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Performing full backup to replace unsupported format", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Performing full backup to replace unsupported format");
      }

      v29 = self->super._debugContext;
      v30 = CFSTR("StatusVersionUnsupported");
      goto LABEL_26;
    }
    v54 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v11, CFSTR("Error reading status")));
LABEL_69:
    v91 = v54;
    goto LABEL_67;
  }
  v27 = MBGetDefaultLog(v25, v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "No status exists", buf, 2u);
    _MBLog(CFSTR("INFO"), "No status exists");
  }

  v29 = self->super._debugContext;
  v30 = CFSTR("StatusNotFound");
LABEL_26:
  -[MBDebugContext setFlag:](v29, "setFlag:", v30);

  v11 = 0;
LABEL_27:
  self->_fullBackup = 1;
LABEL_62:
  if (!self->_uuid)
  {
    v84 = MBRandomUUID(v23);
    v85 = (NSString *)objc_claimAutoreleasedReturnValue(v84);
    v86 = self->_uuid;
    self->_uuid = v85;

  }
  v87 = MBGetDefaultLog(v23, v24);
  v88 = objc_claimAutoreleasedReturnValue(v87);
  if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134217984;
    v95 = v89 - v8;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "Retrieved previous backup status in %0.3f s", buf, 0xCu);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    _MBLog(CFSTR("INFO"), "Retrieved previous backup status in %0.3f s", v90 - v8);
  }

  v91 = 0;
LABEL_67:

  objc_autoreleasePoolPop(v3);
  return v91;
}

- (id)_openBackupManifestForResume
{
  MBManifestDB *v2;
  unsigned __int8 v4;
  MBBackupHelper *backupHelper;
  id v6;
  MBManifestDB *backupManifestDB;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  MBManifestDB *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  MBManifestDB *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;

  if (!self->_fullBackup)
  {
    backupHelper = self->_backupHelper;
    v22 = 0;
    v2 = (MBManifestDB *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestDatabaseWithError:](backupHelper, "readBackupManifestDatabaseWithError:", &v22));
    v6 = v22;
    backupManifestDB = self->_backupManifestDB;
    self->_backupManifestDB = v2;

    if (v6)
    {
      v8 = v6;
      v9 = v8;
      goto LABEL_22;
    }
  }
  v4 = -[MBEngine encrypted](self, "encrypted");
  if ((v4 & 1) != 0)
  {
    if (!-[MBEngine encrypted](self, "encrypted"))
      goto LABEL_15;
    goto LABEL_10;
  }
  v2 = (MBManifestDB *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_backupManifestDB, "properties"));
  if (-[MBManifestDB encrypted](v2, "encrypted"))
  {

    goto LABEL_13;
  }
  if (-[MBEngine encrypted](self, "encrypted"))
  {
LABEL_10:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_backupManifestDB, "properties"));
    v11 = objc_msgSend(v10, "encrypted");

    if ((v4 & 1) == 0)
    if ((v11 & 1) != 0)
      goto LABEL_15;
LABEL_13:
    self->_fullBackup = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 207, CFSTR("Encryption settings changed")));
    v8 = 0;
    goto LABEL_22;
  }

LABEL_15:
  if (-[MBEngine encrypted](self, "encrypted"))
  {
    v12 = self->_backupManifestDB;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
    v21 = 0;
    v14 = -[MBManifestDB setupEncryptionWithPassword:withError:](v12, "setupEncryptionWithPassword:withError:", v13, &v21);
    v8 = v21;

    if ((v14 & 1) == 0)
    {
      v17 = MBGetDefaultLog(v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v8);
      }

      -[MBManifestDB closeWithError:](self->_backupManifestDB, "closeWithError:", 0);
      v19 = self->_backupManifestDB;
      self->_backupManifestDB = 0;

    }
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
LABEL_22:

  return v9;
}

- (id)_resumeAfterFailureUploading
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  MBManifestDB *v9;
  uint64_t v10;
  MBManifestDB *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  const __CFString *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  unsigned __int8 v71;
  uint64_t v72;
  uint64_t v73;
  MBManifestDB *v74;
  uint64_t v75;
  MBManifestDB *v76;
  MBManifestDB *snapshotManifestDB;
  MBManifestDB *v78;
  uint64_t v79;
  uint64_t v80;
  _BOOL8 v81;
  uint64_t v82;
  MBManifestDB *v83;
  void *v84;
  unsigned __int8 v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  NSObject *v98;
  uint64_t v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  NSObject *v106;
  void *v107;
  void *v108;
  _QWORD v109[5];
  _QWORD v110[5];
  NSObject *v111;
  NSObject *v112;
  id v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  id v120;
  uint8_t buf[4];
  NSObject *v122;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _openBackupManifestForResume](self, "_openBackupManifestForResume"));
  if (!v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotManifestDatabasePath](self, "_deviceSnapshotManifestDatabasePath"));
    v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    if (!v8)
    {
      v4 = 0;
      v5 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v9 = [MBManifestDB alloc];
    v10 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotManifestDatabasePath](self, "_deviceSnapshotManifestDatabasePath"));
    v11 = -[MBManifestDB initWithPath:domainManager:](v9, "initWithPath:domainManager:", v10, self->super._domainManager);

    v120 = 0;
    LOBYTE(v10) = -[MBManifestDB openWithError:](v11, "openWithError:", &v120);
    v12 = v120;
    v4 = v12;
    if ((v10 & 1) != 0)
    {
      if (-[MBEngine encrypted](self, "encrypted"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
        v119 = v4;
        v15 = -[MBManifestDB setupEncryptionWithPassword:withError:](v11, "setupEncryptionWithPassword:withError:", v14, &v119);
        v16 = v119;

        if ((v15 & 1) == 0)
        {
          v55 = MBGetDefaultLog(v17, v18);
          v56 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v16;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
            _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v16);
          }

          -[MBManifestDB closeWithError:](v11, "closeWithError:", 0);
          v57 = v16;
LABEL_41:
          v4 = v57;
          v5 = v57;
          goto LABEL_26;
        }
        v4 = v16;
      }
      v19 = v4;
      v118 = v4;
      v20 = -[MBManifestDB checkWithError:](v11, "checkWithError:", &v118);
      v4 = v118;

      if ((v20 & 1) != 0)
      {
        v117 = v4;
        v21 = -[MBManifestDB closeWithError:](v11, "closeWithError:", &v117);
        v22 = v117;

        if ((v21 & 1) == 0)
        {
          v58 = MBGetDefaultLog(v23, v24);
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v22;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Failed to close existing snapshot manifest database: %@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Failed to close existing snapshot manifest database: %@", v22);
          }

          v5 = 0;
          v4 = v22;
          goto LABEL_26;
        }

        v27 = MBGetDefaultLog(v25, v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Reading snapshot properties from device", buf, 2u);
          _MBLog(CFSTR("INFO"), "Reading snapshot properties from device");
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotPropertiesPath](self, "_deviceSnapshotPropertiesPath"));
        v116 = v22;
        v11 = (MBManifestDB *)objc_claimAutoreleasedReturnValue(+[MBProperties propertiesWithFile:error:](MBProperties, "propertiesWithFile:error:", v29, &v116));
        v30 = v116;

        if (v11)
        {
          v33 = MBTemporaryPath(v31, v32);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotManifestDatabasePath](self, "_deviceSnapshotManifestDatabasePath"));
          v115 = v30;
          v108 = (void *)v34;
          v36 = objc_msgSend(v6, "moveItemAtPath:toPath:error:", v35, v34, &v115);
          v4 = v115;

          v39 = MBGetDefaultLog(v37, v38);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          v41 = v40;
          if ((v36 & 1) == 0)
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v122 = v4;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to move existing snapshot manifest DB after upload failure: %@", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), "Failed to move existing snapshot manifest DB after upload failure: %@", v4);
            }

            v65 = CFSTR("Failed to move snapshot manifest database");
            goto LABEL_45;
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Removing snapshot on device", buf, 2u);
            _MBLog(CFSTR("INFO"), "Removing snapshot on device");
          }

          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
          v114 = v4;
          v44 = objc_msgSend(v42, "removeItemAtPath:error:", v43, &v114);
          v45 = v114;

          if ((v44 & 1) != 0)
          {
            v46 = v108;
LABEL_18:
            v47 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setupSnapshotDirectory](self, "_setupSnapshotDirectory"));

            if (v47)
            {
LABEL_19:
              v48 = v47;
              v4 = v48;
LABEL_68:
              v5 = v48;
              goto LABEL_69;
            }
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotManifestDatabasePath](self, "_deviceSnapshotManifestDatabasePath"));
            v113 = 0;
            v71 = objc_msgSend(v6, "moveItemAtPath:toPath:error:", v46, v70, &v113);
            v4 = v113;

            if ((v71 & 1) == 0)
            {
              v97 = MBGetDefaultLog(v72, v73);
              v98 = objc_claimAutoreleasedReturnValue(v97);
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v122 = v4;
                _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "Failed to move existing snapshot manifest DB back in place after upload failure: %@", buf, 0xCu);
                _MBLog(CFSTR("ERROR"), "Failed to move existing snapshot manifest DB back in place after upload failure: %@", v4);
              }

              v48 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v4, CFSTR("Failed to move snapshot manifest database back")));
              goto LABEL_68;
            }
            v74 = [MBManifestDB alloc];
            v75 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotManifestDatabasePath](self, "_deviceSnapshotManifestDatabasePath"));
            v76 = -[MBManifestDB initWithPath:properties:domainManager:](v74, "initWithPath:properties:domainManager:", v75, v11, self->super._domainManager);
            snapshotManifestDB = self->_snapshotManifestDB;
            self->_snapshotManifestDB = v76;

            v78 = self->_snapshotManifestDB;
            v112 = v4;
            LOBYTE(v75) = -[MBManifestDB openWithError:](v78, "openWithError:", &v112);
            v45 = v112;

            if ((v75 & 1) != 0)
            {
              v81 = -[MBEngine encrypted](self, "encrypted");
              if (v81)
              {
                v83 = self->_snapshotManifestDB;
                v84 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
                v111 = v45;
                v85 = -[MBManifestDB setupEncryptionWithPassword:withError:](v83, "setupEncryptionWithPassword:withError:", v84, &v111);
                v47 = v111;

                if ((v85 & 1) == 0)
                {
                  v105 = MBGetDefaultLog(v81, v82);
                  v106 = objc_claimAutoreleasedReturnValue(v105);
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v122 = v47;
                    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
                    _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v47);
                  }

                  goto LABEL_19;
                }
                v45 = v47;
              }
              v86 = MBGetDefaultLog(v81, v82);
              v87 = objc_claimAutoreleasedReturnValue(v86);
              if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "Determining which files were already uploaded to the backup", buf, 2u);
                _MBLog(CFSTR("INFO"), "Determining which files were already uploaded to the backup");
              }

              v88 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
              v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "drive"));
              v90 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
              v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "driveSnapshotDir"));
              v110[0] = _NSConcreteStackBlock;
              v110[1] = 3221225472;
              v110[2] = sub_100020C9C;
              v110[3] = &unk_1000D9518;
              v110[4] = self;
              v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "enumerateContentsOfDirectoryAtPath:options:foundItem:", v91, 0, v110));

              v92 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
              v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "drive"));
              v94 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "driveBackupDir"));
              v109[0] = _NSConcreteStackBlock;
              v109[1] = 3221225472;
              v109[2] = sub_100020E34;
              v109[3] = &unk_1000D9518;
              v109[4] = self;
              v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "enumerateContentsOfDirectoryAtPath:options:foundItem:", v95, 0, v109));

              if (v96
                && +[MBError isError:withCode:](MBError, "isError:withCode:", v96, 4))
              {
                v5 = objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v96, CFSTR("Error getting contents of snapshot")));
                v4 = v96;
                goto LABEL_46;
              }
              v4 = objc_claimAutoreleasedReturnValue(-[MBManifestDB removeFilesNotAlreadyUploaded](self->_snapshotManifestDB, "removeFilesNotAlreadyUploaded"));

              if (!v4)
              {
                v5 = 0;
                goto LABEL_46;
              }
              v103 = MBGetDefaultLog(v101, v102);
              v104 = objc_claimAutoreleasedReturnValue(v103);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v122 = v4;
                _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "Failed to remove already uploaded files from snapshot manifest database: %@", buf, 0xCu);
                _MBLog(CFSTR("ERROR"), "Failed to remove already uploaded files from snapshot manifest database: %@", v4);
              }

              v65 = CFSTR("Failed to remove already uploaded files from snapshot manifest database");
LABEL_45:
              v5 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v4, v65));
LABEL_46:
              v46 = v108;
LABEL_69:

              goto LABEL_26;
            }
            v99 = MBGetDefaultLog(v79, v80);
            v100 = objc_claimAutoreleasedReturnValue(v99);
            if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v122 = v45;
              _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "Failed to open snapshot manifest database: %@", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), "Failed to open snapshot manifest database: %@", v45);
            }

            v5 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v45, CFSTR("Failed to open resume snapshot manifest database")));
LABEL_54:
            v4 = v45;
            goto LABEL_69;
          }
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v45, "domain"));
          v46 = v108;
          if (objc_msgSend(v66, "isEqualToString:", NSCocoaErrorDomain))
          {
            v67 = -[NSObject code](v45, "code");

            if (v67 == (id)4)
            {

              v45 = 0;
              goto LABEL_18;
            }
          }
          else
          {

          }
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
          v5 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 102, v45, v69, CFSTR("Error removing snapshot dir")));

          goto LABEL_54;
        }
        v60 = +[MBError isError:withCode:](MBError, "isError:withCode:", v30, 4);
        if ((v60 & 1) != 0
          || (v60 = +[MBError codeForNSError:](MBError, "codeForNSError:", v30), (_DWORD)v60 == 4))
        {
          v62 = MBGetDefaultLog(v60, v61);
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "Snapshot properties not found", buf, 2u);
            _MBLog(CFSTR("INFO"), "Snapshot properties not found");
          }

          v64 = v30;
          v30 = 0;
        }
        else
        {
          v68 = MBGetDefaultLog(v60, v61);
          v64 = objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v30;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Error reading snapshot properties from device: %@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Error reading snapshot properties from device: %@", v30);
          }
        }

        v57 = v30;
        goto LABEL_41;
      }
      v51 = -[MBManifestDB closeWithError:](v11, "closeWithError:", 0);
      v53 = MBGetDefaultLog(v51, v52);
      v50 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v4;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Existing snapshot manifest database failed check: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Existing snapshot manifest database failed check: %@", v4);
      }
    }
    else
    {
      v49 = MBGetDefaultLog(v12, v13);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v4;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Failed to open existing snapshot manifest database: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Failed to open existing snapshot manifest database: %@", v4);
      }
    }

    v5 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v4 = v3;
  v5 = v4;
LABEL_28:

  return v5;
}

- (id)_resumeAfterFailureMoving
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[6];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setupOperationJournal](self, "_setupOperationJournal"));
  if (!v3)
  {
    v7 = MBGetDefaultLog(0, v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Determining which files which weren't already moved from the snapshot during the last backup", buf, 2u);
      _MBLog(CFSTR("INFO"), "Determining which files which weren't already moved from the snapshot during the last backup");
    }

    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "drive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "driveSnapshotDir"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000211BC;
    v16[3] = &unk_1000D9540;
    v16[4] = self;
    v16[5] = buf;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enumerateContentsOfDirectoryAtPath:options:foundItem:", v12, 0, v16));

    if (v5 && +[MBError isError:withCode:](MBError, "isError:withCode:", v5, 4))
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v5, CFSTR("Error getting contents of snapshot")));
LABEL_13:
      v6 = v13;
      _Block_object_dispose(buf, 8);
      goto LABEL_14;
    }
    if (v18[24])
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _openBackupManifestForResume](self, "_openBackupManifestForResume"));

      if (v14)
      {
        v13 = v14;
        v5 = v13;
        goto LABEL_13;
      }
      v5 = 0;
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _resumeAfterFailureRemoving](self, "_resumeAfterFailureRemoving"));
    goto LABEL_13;
  }
  v5 = v3;
  v6 = v5;
LABEL_14:

  return v6;
}

- (id)_resumeAfterFailureRemoving
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setupOperationJournal](self, "_setupOperationJournal"));
  if (!v3
    && (self->_backupManifestDB
     || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _openBackupManifestForResume](self, "_openBackupManifestForResume"))) == 0))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _addBackupPathsNotInManifestDB:operationType:](self, "_addBackupPathsNotInManifestDB:operationType:"));
    if (!v3)
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _resumeAfterSuccess](self, "_resumeAfterSuccess"));
  }
  return v3;
}

- (id)_resumeAfterSuccess
{
  void *v3;

  if (self->_backupManifestDB
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _openBackupManifestForResume](self, "_openBackupManifestForResume"))) == 0)
  {
    v3 = 0;
    self->_fullBackup = 0;
  }
  return v3;
}

- (id)_scan
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  MBError *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MBError *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint8_t buf[4];
  double v35;

  v3 = objc_autoreleasePoolPush();
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting to scan", buf, 2u);
    _MBLog(CFSTR("INFO"), "Starting to scan");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setupOperationJournal](self, "_setupOperationJournal"));
  if (v9)
    goto LABEL_6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setupManifestDB](self, "_setupManifestDB"));
  if (v9)
    goto LABEL_6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setupEncryption](self, "_setupEncryption"));
  if (v9)
    goto LABEL_6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "plugins"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectEnumerator"));
  v17 = sub_100039C34(self, v16, "preparingBackupWithEngine:", (uint64_t)self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
    goto LABEL_10;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _snapshotFilesystem](self, "_snapshotFilesystem"));
  if (v9)
    goto LABEL_6;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
  v20 = objc_msgSend(v19, "isPersonalPersona");

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "volumeMountPoint"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine mountedSnapshotTracker](self, "mountedSnapshotTracker"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "snapshotMountPointForVolumeMountPoint:", v22));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MBiCloudDrivePlugin backUpiCloudDriveDatabaseManifestForUserVolume:snapshotMountPoint:](MBiCloudDrivePlugin, "backUpiCloudDriveDatabaseManifestForUserVolume:snapshotMountPoint:", v22, v24));
    if (v25
      || (v25 = (void *)objc_claimAutoreleasedReturnValue(+[MBiCloudDrivePlugin backUpFPFSDatabaseManifestForUserVolume:snapshotMountPoint:](MBiCloudDrivePlugin, "backUpFPFSDatabaseManifestForUserVolume:snapshotMountPoint:", v22, v24))) != 0)
    {
      v11 = v25;

      v12 = v11;
      goto LABEL_8;
    }

  }
  -[MBDriveBackupEngine _recordCurrentTime](self, "_recordCurrentTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _scanAllDomains](self, "_scanAllDomains"));
  if (v9)
    goto LABEL_6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "plugins"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectEnumerator"));
  v29 = sub_100039C34(self, v28, "preparedBackupWithEngine:", (uint64_t)self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v29);

  if (v18)
  {
LABEL_10:
    v10 = v18;
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _findPathsRemovedFromBackup](self, "_findPathsRemovedFromBackup"));
  if (v9
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _scanFinished](self, "_scanFinished"))) != 0)
  {
LABEL_6:
    v10 = v9;
LABEL_7:
    v11 = v10;
    v12 = v10;
    goto LABEL_8;
  }
  v31 = MBGetDefaultLog(0, v30);
  v11 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134217984;
    v35 = v32 - v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Scanned in %0.3f s", buf, 0xCu);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    _MBLog(CFSTR("DEFAULT"), "Scanned in %0.3f s", v33 - v8);
  }
  v12 = 0;
LABEL_8:

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (void)_recordCurrentTime
{
  time_t v3;
  void *v4;
  void *v5;
  double v6;
  MBDebugContext *debugContext;
  void *v8;
  time_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  uint64_t v15;
  useconds_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  int64_t maximumModificationTime;
  timeval v23[2];
  uint8_t buf[4];
  useconds_t v25;

  v3 = time(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDebugContext valueForName:](self->super._debugContext, "valueForName:", CFSTR("SimulatedSystemDate")));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSince1970");
    self->_maximumModificationTime = (uint64_t)v6;
    debugContext = self->super._debugContext;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", 1.0));
    -[MBDebugContext setValue:forName:](debugContext, "setValue:forName:", v8, CFSTR("SimulatedSystemDate"));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine mountedSnapshotTracker](self, "mountedSnapshotTracker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mountedSnapshots"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
      v14 = v3;
    else
      v14 = 0;
    self->_maximumModificationTime = v14;
    do
    {
      v23[0].tv_sec = 0;
      *(_QWORD *)&v23[0].tv_usec = 0;
      v15 = gettimeofday(v23, 0);
      v16 = 1000000 - v23[0].tv_usec;
      v18 = MBGetDefaultLog(v15, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rolling system clock forward %d us\n", buf, 8u);
        _MBLog(CFSTR("DEFAULT"), "Rolling system clock forward %d us\n", v16);
      }

      usleep(v16);
      v9 = time(0);
    }
    while (v9 <= v3);
  }
  v20 = MBGetDefaultLog(v9, v10);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    maximumModificationTime = self->_maximumModificationTime;
    LODWORD(v23[0].tv_sec) = 134218240;
    *(__darwin_time_t *)((char *)&v23[0].tv_sec + 4) = v3;
    *((_WORD *)&v23[0].tv_usec + 2) = 2048;
    *(_QWORD *)((char *)&v23[0].tv_usec + 6) = maximumModificationTime;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "currentTime:%ld, maximumModificationTime:%ld", (uint8_t *)v23, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "currentTime:%ld, maximumModificationTime:%ld", v3, self->_maximumModificationTime);
  }

}

- (id)_snapshotFilesystem
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  double v36;
  double v37;
  NSObject *v38;
  id v39;
  MBDriveBackupEngine *v40;
  id v41;
  uint64_t v42;
  void *k;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  double v58;
  id v60;
  NSObject *obj;
  void *v62;
  MBDriveBackupEngine *v63;
  _QWORD v64[5];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  double v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];

  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine mountedSnapshotTracker](self, "mountedSnapshotTracker"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "mountedSnapshots"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v79;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v79 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v8);
        v10 = MBGetDefaultLog(v4, v5);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshotName"));
          v13 = v3;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "volumeMountPoint"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshotMountPoint"));
          *(_DWORD *)buf = 138412802;
          v86 = *(double *)&v12;
          v87 = 2112;
          v88 = v14;
          v89 = 2112;
          v90 = v15;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found existing snapshot %@ for volume %@ mounted at %@", buf, 0x20u);

          v3 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshotName"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "volumeMountPoint"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshotMountPoint"));
          _MBLog(CFSTR("DEFAULT"), "Found existing snapshot %@ for volume %@ mounted at %@", v16, v17, v18);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      v6 = v4;
    }
    while (v4);
    v19 = 0;
  }
  else
  {

    v63 = self;
    if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
    {
      v20 = CFSTR("D2D");
      v21 = MBD2DSnapshotMountPoints();
    }
    else
    {
      v20 = CFSTR("Finder");
      v21 = MBFinderSnapshotMountPoints();
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](v63, "persona"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "volumesToBackUp"));

    v25 = MBSnapshotName(CFSTR("com.apple.mobilebackup"), v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v3 = v22;
    v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v29)
            objc_enumerationMutation(v3);
          +[MBFileSystemManager unmount:error:](MBFileSystemManager, "unmount:error:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i), 0);
        }
        v28 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      }
      while (v28);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v31 = v24;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(_QWORD *)v71 != v34)
            objc_enumerationMutation(v31);
          +[MBFileSystemManager deleteAllSnapshotsForVolume:withPrefix:error:](MBFileSystemManager, "deleteAllSnapshotsForVolume:withPrefix:error:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j), CFSTR("com.apple.mobilebackup"), 0);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      }
      while (v33);
    }

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v37 = v36;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v38 = v31;
    v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    v40 = v63;
    if (v39)
    {
      v41 = v39;
      v42 = *(_QWORD *)v67;
      obj = v38;
      while (2)
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          v44 = v3;
          if (*(_QWORD *)v67 != v42)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)k);
          v65 = 0;
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_100022050;
          v64[3] = &unk_1000D9568;
          v64[4] = v40;
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileSystemManager createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:](MBFileSystemManager, "createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:", v45, v26, v44, &v65, v64));
          v47 = v65;
          v49 = v47;
          if (v46)
          {
            v50 = MBGetDefaultLog(v47, v48);
            v51 = objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v86 = *(double *)&v26;
              v87 = 2112;
              v88 = v45;
              v89 = 2114;
              v90 = v46;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Snapshot %{public}@ for %@ was mounted successfully at %{public}@", buf, 0x20u);
              _MBLog(CFSTR("DEFAULT"), "Snapshot %{public}@ for %@ was mounted successfully at %{public}@", v26, v45, v46);
            }

            objc_msgSend(v62, "trackSnapshotForVolume:snapshotName:mountPount:", v45, v26, v46);
            v40 = v63;
          }
          else
          {
            v60 = v47;
          }

          v3 = v44;
          if (!v46)
          {
            v19 = v60;
            v38 = obj;
            v57 = obj;
            goto LABEL_45;
          }
        }
        v38 = obj;
        v41 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        if (v41)
          continue;
        break;
      }
    }

    v52 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v54 = v53;
    v56 = MBGetDefaultLog(v52, v55);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v54 - v37;
      *(_DWORD *)buf = 134217984;
      v86 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Filesystem snapshots created and mounted in %.3fs", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Filesystem snapshots created and mounted in %.3fs", v58);
    }
    v19 = 0;
LABEL_45:

  }
  return v19;
}

- (void)_removeFilesystemSnapshot
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine mountedSnapshotTracker](self, "mountedSnapshotTracker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mountedSnapshots"));

  if (objc_msgSend(v3, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "volumeMountPoint"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshotMountPoint"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshotName"));
          v13 = MBGetDefaultLog(v11, v12);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v11;
            v29 = 2112;
            v30 = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unmounting APFS snapshot %@ from %@ and removing it", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "Unmounting APFS snapshot %@ from %@ and removing it", v11, v10);
          }

          v22 = 0;
          v15 = +[MBFileSystemManager unmountAndDeleteSnapshotForVolume:name:mountPoint:error:](MBFileSystemManager, "unmountAndDeleteSnapshotForVolume:name:mountPoint:error:", v9, v11, v10, &v22);
          v16 = v22;
          if ((v15 & 1) == 0)
          {
            v17 = +[MBError isError:withCode:](MBError, "isError:withCode:", v16, 4);
            if ((v17 & 1) == 0)
            {
              v19 = MBGetDefaultLog(v17, v18);
              v20 = objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v28 = v11;
                v29 = 2112;
                v30 = v10;
                v31 = 2112;
                v32 = v16;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to unmount or delete the APFS snapshot %@ at %@: %@", buf, 0x20u);
                _MBLog(CFSTR("ERROR"), "Failed to unmount or delete the APFS snapshot %@ at %@: %@", v11, v10, v16);
              }

            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v5);
    }

  }
}

- (id)_setupOperationJournal
{
  MBBackupOperationJournal *operationJournal;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  MBBackupOperationJournal *v17;
  MBBackupOperationJournal *v18;
  const __CFString *v19;
  id v21;
  uint8_t buf[8];
  _QWORD v23[2];
  _QWORD v24[2];

  operationJournal = self->_operationJournal;
  v4 = MBGetDefaultLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (!operationJournal)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Creating snapshot directory on device", buf, 2u);
      _MBLog(CFSTR("INFO"), "Creating snapshot directory on device");
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
    v23[0] = NSFileOwnerAccountName;
    v23[1] = NSFileGroupOwnerAccountName;
    v24[0] = CFSTR("mobile");
    v24[1] = CFSTR("mobile");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    v21 = 0;
    v12 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, v11, &v21);
    v7 = v21;

    if ((v12 & 1) != 0)
    {
      v15 = MBGetDefaultLog(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Initializing operation journal", buf, 2u);
        _MBLog(CFSTR("INFO"), "Initializing operation journal");
      }

      v17 = -[MBBackupOperationJournal initWithBatchSize:]([MBBackupOperationJournal alloc], "initWithBatchSize:", self->_batchSize);
      v18 = self->_operationJournal;
      self->_operationJournal = v17;

      if (self->_operationJournal)
        goto LABEL_5;
      v19 = CFSTR("Error initializing operation journal");
    }
    else
    {
      v19 = CFSTR("Error creating snapshot directory on device");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v7, v19));
    goto LABEL_15;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Operation journal already initialized", buf, 2u);
    _MBLog(CFSTR("INFO"), "Operation journal already initialized");
  }

  v7 = 0;
LABEL_5:
  v8 = 0;
LABEL_15:

  return v8;
}

- (id)_setupSnapshotDirectory
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  id v12;
  uint8_t buf[8];
  _QWORD v14[2];
  _QWORD v15[2];

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Creating snapshot directory on device", buf, 2u);
    _MBLog(CFSTR("INFO"), "Creating snapshot directory on device");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
  v14[0] = NSFileOwnerAccountName;
  v14[1] = NSFileGroupOwnerAccountName;
  v15[0] = CFSTR("mobile");
  v15[1] = CFSTR("mobile");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v12 = 0;
  v8 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v7, &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v9, CFSTR("Error creating snapshot directory on device")));

    v9 = (id)v10;
  }
  return v9;
}

- (id)_setupManifestDB
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  MBManifestDB *snapshotManifestDB;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  MBManifestDB *backupManifestDB;
  void *v21;
  MBManifestDB *v22;
  MBManifestDB *v23;
  MBManifestDB *v24;
  unsigned int v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  NSObject *v34;
  id v35;
  uint8_t buf[4];
  NSObject *v37;
  __int16 v38;
  id v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _setupSnapshotDirectory](self, "_setupSnapshotDirectory"));
  if (!v3)
  {
    v6 = -[MBDriveBackupEngine engineType](self, "engineType");
    v8 = sub_100080294(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v11 = MBGetDefaultLog(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "requiredProductVersion:%{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "requiredProductVersion:%{public}@", v9);
    }

    snapshotManifestDB = self->_snapshotManifestDB;
    v16 = MBGetDefaultLog(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (snapshotManifestDB)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Manifest database already initialized", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Manifest database already initialized");
      }
      v4 = 0;
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Initializing snapshot manifest database", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Initializing snapshot manifest database");
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("Manifest.db")));

      backupManifestDB = self->_backupManifestDB;
      if (backupManifestDB)
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](backupManifestDB, "properties"));
      else
        v21 = 0;
      v22 = -[MBManifestDB initWithPath:properties:domainManager:]([MBManifestDB alloc], "initWithPath:properties:domainManager:", v17, v21, self->super._domainManager);
      v23 = self->_snapshotManifestDB;
      self->_snapshotManifestDB = v22;

      v24 = self->_snapshotManifestDB;
      v35 = 0;
      v25 = -[MBManifestDB openWithError:](v24, "openWithError:", &v35);
      v26 = v35;
      v4 = v26;
      if (!v25)
      {
        v33 = MBGetDefaultLog(v26, v27);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v37 = v17;
          v38 = 2112;
          v39 = v4;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to open snapshot manifest database at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to open snapshot manifest database at %@: %@", v17, v4);
        }

        v5 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v4, CFSTR("Error initializing manifest database")));
        goto LABEL_17;
      }

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
    objc_msgSend(v28, "removeAllContainers");

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBAppManager allContainers](self->super._appManager, "allContainers"));
    objc_msgSend(v29, "addContainersFromArray:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
    objc_msgSend(v31, "setRequiredProductVersion:", v9);

    v4 = v4;
    v5 = v4;
LABEL_17:

    goto LABEL_18;
  }
  v4 = v3;
  v5 = v4;
LABEL_18:

  return v5;
}

- (id)_setupEncryption
{
  MBManifestDB *snapshotManifestDB;
  MBManifestDB *v5;
  uint64_t v6;
  MBManifestDB *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 fullBackup;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  _BOOL8 v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  uint64_t v69;
  void *v70;
  void *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  __CFString *v76;
  id v77;
  uint8_t buf[4];
  const __CFString *v79;

  snapshotManifestDB = self->_snapshotManifestDB;
  if (snapshotManifestDB)
  {
    v5 = snapshotManifestDB;
    v7 = v5;
  }
  else
  {
    v5 = self->_backupManifestDB;
    v7 = v5;
    if (!v5)
      goto LABEL_13;
  }
  v8 = MBGetDefaultLog(v5, v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](v7, "properties"));
    if (objc_msgSend(v10, "encrypted"))
      v11 = CFSTR("encrypted");
    else
      v11 = CFSTR("unencrypted");
    *(_DWORD *)buf = 138412290;
    v79 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Existing backup is %@", buf, 0xCu);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](v7, "properties"));
    if (objc_msgSend(v12, "encrypted"))
      v13 = CFSTR("encrypted");
    else
      v13 = CFSTR("unencrypted");
    _MBLog(CFSTR("INFO"), "Existing backup is %@", v13);

  }
LABEL_13:
  if (-[MBEngine encrypted](self, "encrypted"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));

    if (!v14)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveBackupEngine.m"), 1138, CFSTR("No password available for encrypted backup"));

    }
  }
  if (-[MBEngine encrypted](self, "encrypted"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
    v77 = 0;
    v16 = -[MBManifestDB setupEncryptionWithPassword:withError:](v7, "setupEncryptionWithPassword:withError:", v15, &v77);
    v17 = (__CFString *)v77;

    if ((v16 & 1) == 0)
    {
      v20 = MBGetDefaultLog(v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v17;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v17);
      }

      v22 = v17;
      v23 = v22;
      goto LABEL_51;
    }
  }
  else
  {
    v17 = 0;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "keybag"));

  if (!v25)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](v7, "properties"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "keybagData"));
    if (v31)
    {
      fullBackup = self->_fullBackup;

      if (fullBackup)
        goto LABEL_40;
      v35 = MBGetDefaultLog(v33, v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Decoding and unlocking keybag from manifest", buf, 2u);
        _MBLog(CFSTR("INFO"), "Decoding and unlocking keybag from manifest");
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](v7, "properties"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "keybagData"));

      if (!v30)
      {
        v63 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("No keybag in manifest")));
        v23 = v17;
        goto LABEL_57;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
      v76 = v17;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag unlockedKeyBagWithData:password:error:](MBKeyBag, "unlockedKeyBagWithData:password:error:", v30, v38, &v76));
      v23 = v76;

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
      objc_msgSend(v40, "setKeybag:", v39);

      if (v23)
      {
        v41 = +[MBError isError:withCode:](MBError, "isError:withCode:", v23, 207);
        if (!(_DWORD)v41)
        {
          v68 = CFSTR("Error decoding keybag from manifest");
          v69 = 205;
          goto LABEL_55;
        }
        v43 = MBGetDefaultLog(v41, v42);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Password in keychain doesn't match keybag", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Password in keychain doesn't match keybag");
        }

      }
      v17 = 0;
    }

LABEL_40:
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "keybag"));

    if (!v46)
    {
      v49 = MBGetDefaultLog(v47, v48);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Creating keybag", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Creating keybag");
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
      v75 = v17;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag keybagWithPassword:error:](MBKeyBag, "keybagWithPassword:error:", v51, &v75));
      v23 = v75;

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
      objc_msgSend(v53, "setKeybag:", v52);

      if (!v23)
      {
        v56 = MBGetDefaultLog(v54, v55);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Performing a full backup", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Performing a full backup");
        }

        v17 = 0;
        self->_fullBackup = 1;
        goto LABEL_53;
      }
      goto LABEL_50;
    }
LABEL_53:
    v64 = -[MBEngine encrypted](self, "encrypted");
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
    objc_msgSend(v65, "setEncrypted:", v64);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "keybag"));
    v73 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "dataWithError:", &v73));
    v23 = v73;

    if (!v23)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
      objc_msgSend(v70, "setKeybagData:", v30);

      v63 = 0;
      goto LABEL_57;
    }
    v68 = CFSTR("Error encoding keybag");
    v69 = 1;
LABEL_55:
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v69, v23, v68));
LABEL_57:

    goto LABEL_58;
  }
  if (!self->_fullBackup || self->_retryCount)
  {
    v28 = MBGetDefaultLog(v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Keybag already initialized", buf, 2u);
      _MBLog(CFSTR("INFO"), "Keybag already initialized");
    }

    goto LABEL_53;
  }
  v58 = MBGetDefaultLog(v26, v27);
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Performing full backup, creating keybag", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Performing full backup, creating keybag");
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
  v74 = v17;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag keybagWithPassword:error:](MBKeyBag, "keybagWithPassword:error:", v60, &v74));
  v23 = v74;

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  objc_msgSend(v62, "setKeybag:", v61);

  if (!v23)
  {
    v17 = 0;
    goto LABEL_53;
  }
LABEL_50:
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v23, CFSTR("Error creating keybag")));
LABEL_51:
  v63 = v22;
LABEL_58:

  return v63;
}

- (id)_scanAllDomains
{
  MBDebugContext *debugContext;
  void *v4;
  MBDebugContext *v5;
  void *v6;
  MBFileScanner *v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSMutableSet *modifiedDomains;
  id v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];

  debugContext = self->super._debugContext;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fullBackup));
  -[MBDebugContext setValue:forName:](debugContext, "setValue:forName:", v4, CFSTR("DidFullBackup"));

  v5 = self->super._debugContext;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MBDriveBackupEngine isFinalRetry](self, "isFinalRetry")));
  -[MBDebugContext setValue:forName:](v5, "setValue:forName:", v6, CFSTR("IsFinalRetry"));

  v7 = -[MBFileScanner initWithDelegate:mode:enginePolicy:debugContext:]([MBFileScanner alloc], "initWithDelegate:mode:enginePolicy:debugContext:", self, 1, -[MBEngine enginePolicy](self, "enginePolicy"), self->super._debugContext);
  -[MBDriveBackupEngine setScanner:](self, "setScanner:", v7);
  if (-[MBEngine isCanceled](self, "isCanceled"))
    -[MBFileScanner cancel](v7, "cancel");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_domainsToScan;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine mountedSnapshotTracker](self, "mountedSnapshotTracker"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "volumeMountPoint"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "snapshotMountPointForVolumeMountPoint:", v15));

        if (!v16)
          sub_1000876D0();
        v17 = objc_msgSend(v13, "isPlaceholderDomain");
        if ((_DWORD)v17)
        {
          v19 = MBGetDefaultLog(v17, v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Skipping scanning the PlaceholderDomain", buf, 2u);
            _MBLog(CFSTR("DEFAULT"), "Skipping scanning the PlaceholderDomain");
          }

        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner scanDomain:snapshotMountPoint:](v7, "scanDomain:snapshotMountPoint:", v13, v16));
          if (v21)
          {
            v29 = v21;

            v30 = v29;
            goto LABEL_20;
          }
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v10)
        continue;
      break;
    }
  }

  v24 = MBGetDefaultLog(v22, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner loggableStats](v7, "loggableStats"));
    *(_DWORD *)buf = 138412290;
    v37 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Finished scanning all domains - %@", buf, 0xCu);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner loggableStats](v7, "loggableStats"));
    _MBLog(CFSTR("DEFAULT"), "Finished scanning all domains - %@", v27);

  }
  modifiedDomains = self->_modifiedDomains;
  v29 = (id)objc_claimAutoreleasedReturnValue(-[MBFileScanner modifiedDomains](v7, "modifiedDomains"));
  -[NSMutableSet unionSet:](modifiedDomains, "unionSet:", v29);
  v30 = 0;
LABEL_20:

  return v30;
}

- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v9;
  BOOL v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
  v7 = 0;
  if ((-[MBManifestDB flagsForFileID:error:](self->_snapshotManifestDB, "flagsForFileID:error:", v6, 0) & 8) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB fetchFileWithID:error:](self->_snapshotManifestDB, "fetchFileWithID:error:", v6, 0));
  if (!self->_fullBackup && v7 == 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB fetchFileWithID:error:](self->_backupManifestDB, "fetchFileWithID:error:", v6, 0));
  if (v7)
  {
    v9 = objc_msgSend(v5, "lastModified");
    v10 = v9 != objc_msgSend(v7, "lastModified");
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)fileScanner:(id)a3 didFindFile:(id)a4
{
  id v5;
  MBManifestDB *snapshotManifestDB;
  void *v7;
  unsigned __int8 v8;
  MBManifestDB *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MBManifestDB *v15;
  void *v16;
  MBManifestDB *backupManifestDB;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSMutableSet *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSMutableSet *modifiedDomains;
  void *v76;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;

  v5 = a4;
  snapshotManifestDB = self->_snapshotManifestDB;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
  v8 = -[MBManifestDB flagsForFileID:error:](snapshotManifestDB, "flagsForFileID:error:", v7, 0);

  v9 = self->_snapshotManifestDB;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
  v11 = -[MBManifestDB flagsForFileID:error:](v9, "flagsForFileID:error:", v10, 0);

  v14 = 0;
  if ((v8 & 8) != 0)
  {
    v15 = self->_snapshotManifestDB;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB fetchFileWithID:error:](v15, "fetchFileWithID:error:", v16, 0));

  }
  if (!self->_fullBackup && v14 == 0)
  {
    backupManifestDB = self->_backupManifestDB;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB fetchFileWithID:error:](backupManifestDB, "fetchFileWithID:error:", v19, 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_backupManifestDB, "properties"));
    if (objc_msgSend(v20, "encrypted"))
      v21 = v14 == 0;
    else
      v21 = 1;
    if (!v21 && (objc_msgSend(v14, "isRegularFile") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "encryptionKey"));

      if (!v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
        v24 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Encryption key missing: %@ (%@)"), v14, v23));

        goto LABEL_49;
      }
LABEL_17:
      v25 = objc_msgSend(v5, "lastModified");
      v26 = objc_msgSend(v14, "lastModified");
      if (v25 == v26)
      {
        v28 = MBGetDefaultLog(v26, v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        v30 = v29;
        if ((v8 & 8) != 0 && (v11 & 0x80) != 0)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
            *(_DWORD *)buf = 138412546;
            v79 = v31;
            v80 = 2112;
            v81 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Unmodified and already uploaded to snapshot: %@ (%@)", buf, 0x16u);

            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
            _MBLog(CFSTR("INFO"), "Unmodified and already uploaded to snapshot: %@ (%@)", v33, v34);

          }
          -[MBDriveBackupEngine _addFileToMove:](self, "_addFileToMove:", v14);
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "typeString"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
            *(_DWORD *)buf = 138412802;
            v79 = v61;
            v80 = 2112;
            v81 = v62;
            v82 = 2112;
            v83 = v63;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Unmodified %@: %@ (%@)", buf, 0x20u);

            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "typeString"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
            _MBLog(CFSTR("DEBUG"), "Unmodified %@: %@ (%@)", v64, v65, v66);

          }
          -[MBDriveBackupEngine _addFileToLeaveAlone:flags:](self, "_addFileToLeaveAlone:flags:", v14, 0);
        }
        goto LABEL_44;
      }
      v43 = MBGetDefaultLog(v26, v27);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "typeString"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
        *(_DWORD *)buf = 138412802;
        v79 = v45;
        v80 = 2112;
        v81 = v46;
        v82 = 2112;
        v83 = v47;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Modified %@: %@ (%@)", buf, 0x20u);

        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "typeString"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
        _MBLog(CFSTR("INFO"), "Modified %@: %@ (%@)", v48, v49, v50);

      }
      if (objc_msgSend(v5, "isRegularFile"))
      {
        -[MBDriveBackupEngine _addFileToUploadAndMove:flags:](self, "_addFileToUploadAndMove:flags:", v5, 0);
LABEL_44:

        goto LABEL_45;
      }
      v24 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _addMetadataToFile:](self, "_addMetadataToFile:", v5));
      if (v24)
      {
        v67 = +[MBError isError:withCode:](MBError, "isError:withCode:", v24, 4);
        if (!(_DWORD)v67)
        {
          v24 = v24;

          goto LABEL_46;
        }
        v69 = MBGetDefaultLog(v67, v68);
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
          *(_DWORD *)buf = 138412546;
          v79 = v71;
          v80 = 2112;
          v81 = v72;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Removed while getting metadata: %@ (%@)", buf, 0x16u);

          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
          _MBLog(CFSTR("DEFAULT"), "Removed while getting metadata: %@ (%@)", v73, v74);

        }
        modifiedDomains = self->_modifiedDomains;
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
        -[NSMutableSet addObject:](modifiedDomains, "addObject:", v76);

        goto LABEL_44;
      }
      -[MBDriveBackupEngine _addFileToLeaveAlone:flags:](self, "_addFileToLeaveAlone:flags:", v5, 0);
LABEL_49:

      goto LABEL_46;
    }

  }
  if (v14)
    goto LABEL_17;
  v35 = MBGetDefaultLog(v12, v13);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "typeString"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
    *(_DWORD *)buf = 138412802;
    v79 = v37;
    v80 = 2112;
    v81 = v38;
    v82 = 2112;
    v83 = v39;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Added %@: %@ (%@)", buf, 0x20u);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "typeString"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
    _MBLog(CFSTR("DEBUG"), "Added %@: %@ (%@)", v40, v41, v42);

  }
  if (objc_msgSend(v5, "isRegularFile"))
  {
    -[MBDriveBackupEngine _addFileToUploadAndMove:flags:](self, "_addFileToUploadAndMove:flags:", v5, 0);
LABEL_45:
    v24 = 0;
    goto LABEL_46;
  }
  v24 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _addMetadataToFile:](self, "_addMetadataToFile:", v5));
  if (!v24)
  {
    -[MBDriveBackupEngine _addFileToLeaveAlone:flags:](self, "_addFileToLeaveAlone:flags:", v5, 0);
    goto LABEL_46;
  }
  v51 = +[MBError isError:withCode:](MBError, "isError:withCode:", v24, 4);
  if ((_DWORD)v51)
  {
    v53 = MBGetDefaultLog(v51, v52);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
      *(_DWORD *)buf = 138412546;
      v79 = v55;
      v80 = 2112;
      v81 = v56;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Removed while getting metadata: %@ (%@)", buf, 0x16u);

      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileID"));
      _MBLog(CFSTR("DEFAULT"), "Removed while getting metadata: %@ (%@)", v57, v58);

    }
    v59 = self->_modifiedDomains;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    -[NSMutableSet addObject:](v59, "addObject:", v60);

    goto LABEL_45;
  }
LABEL_46:

  return v24;
}

- (BOOL)fileScanner:(id)a3 shouldExcludeFile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint8_t buf[4];
  void *v19;

  v5 = a4;
  if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine")
    || -[MBEngine encrypted](self, "encrypted")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToOnlyBackupEncrypted")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath")),
        v9 = objc_msgSend(v7, "containsObject:", v8),
        v8,
        v7,
        v6,
        !v9))
  {
    v16 = 0;
  }
  else
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
      *(_DWORD *)buf = 138412290;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "File excluded in unencrypted drive backups: %@", buf, 0xCu);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
      _MBLog(CFSTR("DEFAULT"), "File excluded in unencrypted drive backups: %@", v15);

    }
    v16 = 1;
  }

  return v16;
}

- (void)_addFileToUploadAndMove:(id)a3 flags:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  MBManifestDB *snapshotManifestDB;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  v6 = objc_msgSend(v21, "size");
  if (*(_OWORD *)&self->_inodeCache == 0)
  {
    v9 = 0;
  }
  else
  {
    if (objc_msgSend(v21, "isHardLink"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "inodeNumber")));
      if ((-[NSMutableSet containsObject:](self->_inodeCache, "containsObject:", v7) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        -[NSMutableSet addObject:](self->_inodeCache, "addObject:", v7);
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(v21, "isFullClone"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "cloneID")));
      if (-[NSMutableSet containsObject:](self->_cloneIDCache, "containsObject:", v8))
        v9 = v9 | 2;
      else
        -[NSMutableSet addObject:](self->_cloneIDCache, "addObject:", v8);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "domain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fileID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupOperation backupOperationWithType:domain:fileID:path:size:flags:](MBBackupOperation, "backupOperationWithType:domain:fileID:path:size:flags:", 2, v10, v11, v12, v6, v9));

  -[MBBackupOperationJournal addOperation:](self->_operationJournal, "addOperation:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "domain"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fileID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupOperation backupOperationWithType:domain:fileID:path:size:](MBBackupOperation, "backupOperationWithType:domain:fileID:path:size:", 3, v14, v15, 0, 0));

  -[MBBackupOperationJournal addOperation:](self->_operationJournal, "addOperation:", v16);
  v17 = -[MBManifestDB addPlaceholderForFile:flags:](self->_snapshotManifestDB, "addPlaceholderForFile:flags:", v21, a4);
  snapshotManifestDB = self->_snapshotManifestDB;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fileID"));
  v20 = -[MBManifestDB setFlags:mask:forFileID:](snapshotManifestDB, "setFlags:mask:forFileID:", 0, -65, v19);

}

- (void)_addFileToMove:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MBManifestDB *snapshotManifestDB;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileID"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupOperation backupOperationWithType:domain:fileID:path:size:](MBBackupOperation, "backupOperationWithType:domain:fileID:path:size:", 3, v5, v6, 0, 0));

  -[MBBackupOperationJournal addOperation:](self->_operationJournal, "addOperation:", v10);
  snapshotManifestDB = self->_snapshotManifestDB;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileID"));

  v9 = -[MBManifestDB setFlags:mask:forFileID:](snapshotManifestDB, "setFlags:mask:forFileID:", 136, -65, v8);
}

- (void)_addFileToLeaveAlone:(id)a3 flags:(unint64_t)a4
{
  id v4;

  v4 = -[MBManifestDB addFile:flags:](self->_snapshotManifestDB, "addFile:flags:", a3, a4);
}

- (id)_addMetadataToFile:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v24;
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;

  v5 = a3;
  if (objc_msgSend(v5, "isRegularFile"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveBackupEngine.m"), 1405, CFSTR("Metadata should be added to files after upload"));

  }
  v25 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBExtendedAttributes attributesForPathFSR:error:](MBExtendedAttributes, "attributesForPathFSR:error:", objc_msgSend(v5, "absolutePathFSR"), &v25));
  v7 = v25;
  objc_msgSend(v5, "setExtendedAttributes:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extendedAttributes"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extendedAttributes"));
    v10 = +[MBExtendedAttributes sizeOfAttributes:](MBExtendedAttributes, "sizeOfAttributes:", v9);

    if (v10 >= 0x801)
    {
      v13 = MBGetDefaultLog(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
        *(_DWORD *)buf = 134218498;
        v27 = v10;
        v28 = 1024;
        v29 = 2048;
        v30 = 2112;
        v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Extended attributes size greater than supported (%{bytes}lu > %{bytes}d): %@", buf, 0x1Cu);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "Extended attributes size greater than supported (%{bytes}lu > %{bytes}d): %@", v10, 2048, v16);

      }
      objc_msgSend(v5, "setExtendedAttributes:", &__NSDictionary0__struct);
    }
    if (objc_msgSend(v5, "isSymbolicLink"))
    {
      if (objc_msgSend(v5, "isDataless"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithDomain:code:format:](MBError, "errorWithDomain:code:format:", NSCocoaErrorDomain, 3328, CFSTR("Dataless symlinks are not supported: %@"), v17));

      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backupSymbolicLinkTarget"));

        if (v18)
        {
          v7 = v18;
          v18 = v7;
        }
        else
        {
          v7 = 0;
        }
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v19 = +[MBError isError:withCode:](MBError, "isError:withCode:", v7, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
    if (v19)
    {
      v21 = CFSTR("File removed while getting extended attributes");
      v22 = 4;
    }
    else
    {
      v21 = CFSTR("Error reading extended attributes");
      v22 = 101;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", v22, v7, v20, v21));

  }
  return v18;
}

- (id)_findPathsRemovedFromBackup
{
  void *v2;
  uint64_t v4;
  NSObject *v5;
  MBManifestDB *backupManifestDB;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v11[6];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (self->_fullBackup)
  {
    v2 = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v4 = MBGetDefaultLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Searching old manifest for removed regular files", buf, 2u);
    _MBLog(CFSTR("INFO"), "Searching old manifest for removed regular files");
  }

  *(_QWORD *)buf = 0;
  v13 = buf;
  v14 = 0x3032000000;
  v15 = sub_100024970;
  v16 = sub_100024980;
  v17 = 0;
  backupManifestDB = self->_backupManifestDB;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024988;
  v11[3] = &unk_1000D9590;
  v11[4] = self;
  v11[5] = buf;
  v7 = objc_claimAutoreleasedReturnValue(-[MBManifestDB enumerateFiles:](backupManifestDB, "enumerateFiles:", v11));
  v2 = (void *)v7;
  v8 = (void *)*((_QWORD *)v13 + 5);
  if (v8 || (v8 = (void *)v7) != 0)
  {
    v5 = v8;
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  _Block_object_dispose(buf, 8);

  if (v9)
    goto LABEL_9;
LABEL_10:

  return v5;
}

- (id)_scanFinished
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  MBManifestDB *snapshotManifestDB;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  unint64_t v43;

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Committing operation journal", buf, 2u);
    _MBLog(CFSTR("INFO"), "Committing operation journal");
  }

  v5 = -[MBBackupOperationJournal commit](self->_operationJournal, "commit");
  v7 = MBGetDefaultLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = -[MBBackupOperationJournal size](self->_operationJournal, "size");
    *(_DWORD *)buf = 134217984;
    v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Operation journal size: %{bytes}llu", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Operation journal size: %{bytes}llu", -[MBBackupOperationJournal size](self->_operationJournal, "size"));
  }

  v10 = -[MBEngine encrypted](self, "encrypted");
  if (!v10)
  {
    v22 = 0;
    goto LABEL_12;
  }
  v12 = MBGetDefaultLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Fetching manifest encryption key", buf, 2u);
    _MBLog(CFSTR("INFO"), "Fetching manifest encryption key");
  }

  snapshotManifestDB = self->_snapshotManifestDB;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "keybag"));
  v41 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB getEncryptedFileHandleWithKeybag:error:](snapshotManifestDB, "getEncryptedFileHandleWithKeybag:error:", v16, &v41));
  v18 = v41;

  if (!v17)
  {
    v34 = MBGetDefaultLog(v19, v20);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't get an encrypted file handle for the manifest DB, and therefore couldn't write out its wrapped key", buf, 2u);
      _MBLog(CFSTR("ERROR"), "Couldn't get an encrypted file handle for the manifest DB, and therefore couldn't write out its wrapped key");
    }

    v32 = CFSTR("Error getting manifest encryption key");
    v33 = 101;
    goto LABEL_20;
  }
  v40 = v18;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "encryptionKeyWithError:", &v40));
  v22 = v40;

  if (v21)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
    objc_msgSend(v25, "setManifestEncryptionKey:", v21);

LABEL_12:
    v26 = MBGetDefaultLog(v10, v11);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Saving snapshot properties", buf, 2u);
      _MBLog(CFSTR("INFO"), "Saving snapshot properties");
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotPropertiesPath](self, "_deviceSnapshotPropertiesPath"));
    v39 = v22;
    v30 = objc_msgSend(v28, "writeToFile:error:", v29, &v39);
    v18 = v39;

    if ((v30 & 1) != 0)
    {
      v31 = 0;
      goto LABEL_21;
    }
    v32 = CFSTR("Error saving snapshot properties");
    v33 = 102;
LABEL_20:
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v33, v18, v32));
    goto LABEL_21;
  }
  v37 = MBGetDefaultLog(v23, v24);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Couldn't get the wrapped key for the manifest DB", buf, 2u);
    _MBLog(CFSTR("ERROR"), "Couldn't get the wrapped key for the manifest DB");
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 101, v22, CFSTR("Error getting manifest encryption key")));
  v18 = v22;
LABEL_21:

  return v31;
}

- (id)_prepareForPreflight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint8_t buf[4];
  double v20;

  v3 = objc_autoreleasePoolPush();
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting to prepare for preflight", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Starting to prepare for preflight");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareProgress](self, "_prepareProgress"));
  if (v9
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareFreeSpace](self, "_prepareFreeSpace"))) != 0)
  {
    v10 = v9;
    v11 = v10;
  }
  else
  {
    v13 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v15 = v14;
    v17 = MBGetDefaultLog(v13, v16);
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v15 - v8;
      *(_DWORD *)buf = 134217984;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Prepared for preflight in %0.3fs", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Prepared for preflight in %0.3fs", v18);
    }
    v11 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (id)_prepareForUpload
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint8_t buf[4];
  double v20;

  v3 = objc_autoreleasePoolPush();
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Starting to prepare for backup", buf, 2u);
    _MBLog(CFSTR("DEBUG"), "Starting to prepare for backup");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareResume](self, "_prepareResume"));
  if (v9
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareMoveBackup](self, "_prepareMoveBackup"))) != 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _prepareSnapshot](self, "_prepareSnapshot"))) != 0)
  {
    v10 = v9;
    v11 = v10;
  }
  else
  {
    if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterPreparing")))abort();
    v13 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v15 = v14;
    v17 = MBGetDefaultLog(v13, v16);
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v18 = v15 - v8;
      *(_DWORD *)buf = 134217984;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Prepared for backup in %0.3fs", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Prepared for backup in %0.3fs", v18);
    }
    v11 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (id)_prepareProgress
{
  uint64_t v3;
  NSObject *v4;
  MBDriveScript *driveScript;
  void *v6;
  MBDriveScript *v7;
  void *v8;
  MBDriveScript *v9;
  void *v10;
  MBDriveScript *v11;
  void *v12;
  MBDriveScript *v13;
  void *v14;
  MBDriveScript *v15;
  void *v16;
  MBDriveScript *v17;
  void *v18;
  MBDriveScript *v19;
  void *v20;
  MBStatus *status;
  double v22;
  MBDriveScript *v23;
  void *v24;
  MBDriveScript *v25;
  void *v26;
  MBDriveScript *v27;
  void *v28;
  void *v29;
  int v30;
  MBDriveScript *v31;
  void *v32;
  MBDriveScript *v33;
  void *v34;
  MBDriveScript *v35;
  void *v36;
  MBDriveScript *v37;
  void *v38;
  MBDriveScript *v39;
  void *v40;
  MBDriveScript *v41;
  void *v42;
  MBDriveScript *v43;
  void *v44;
  MBDriveScript *v45;
  void *v46;
  MBDriveScript *v47;
  void *v48;
  MBDriveScript *v49;
  void *v50;
  MBDriveScript *v51;
  void *v52;
  MBDriveScript *v53;
  void *v54;
  MBDriveScript *v55;
  void *v56;
  MBDriveScript *v57;
  void *v58;
  MBDriveScript *v59;
  void *v60;
  MBStatus *v61;
  double v62;
  MBDriveScript *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  MBErrorInjectorDrive *v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  double v72;
  uint8_t buf[4];
  uint64_t v75;

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Calculating expected duration", buf, 2u);
    _MBLog(CFSTR("INFO"), "Calculating expected duration");
  }

  if (-[MBStatus isMoving](self->_status, "isMoving") && !self->_retryCount)
  {
    driveScript = self->_driveScript;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal driveOperationsForType:](self->_operationJournal, "driveOperationsForType:", 0));
    -[MBDriveScript addOperations:](driveScript, "addOperations:", v6);

    v7 = self->_driveScript;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToMoveItem](MBDriveOperation, "operationToMoveItem"));
    -[MBDriveScript addOperation:](v7, "addOperation:", v8);

    v9 = self->_driveScript;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToMoveItem](MBDriveOperation, "operationToMoveItem"));
    -[MBDriveScript addOperation:](v9, "addOperation:", v10);

    v11 = self->_driveScript;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
    -[MBDriveScript addOperation:](v11, "addOperation:", v12);

  }
  if ((-[MBStatus isMoving](self->_status, "isMoving") || -[MBStatus isRemoving](self->_status, "isRemoving"))
    && !self->_retryCount)
  {
    v13 = self->_driveScript;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal driveOperationsForType:](self->_operationJournal, "driveOperationsForType:", 1));
    -[MBDriveScript addOperations:](v13, "addOperations:", v14);

    v15 = self->_driveScript;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToRemoveItem](MBDriveOperation, "operationToRemoveItem"));
    -[MBDriveScript addOperation:](v15, "addOperation:", v16);

    v17 = self->_driveScript;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToRemoveItem](MBDriveOperation, "operationToRemoveItem"));
    -[MBDriveScript addOperation:](v17, "addOperation:", v18);

    v19 = self->_driveScript;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
    -[MBDriveScript addOperation:](v19, "addOperation:", v20);

  }
  status = self->_status;
  if (status)
  {
    -[MBStatus version](status, "version");
    if (v22 < 3.3 && !-[MBDriveBackupEngine movedOldBackup](self, "movedOldBackup"))
    {
      v23 = self->_driveScript;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToMoveItem](MBDriveOperation, "operationToMoveItem"));
      -[MBDriveScript addOperation:](v23, "addOperation:", v24);

    }
  }
  v25 = self->_driveScript;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToCreateDirectory](MBDriveOperation, "operationToCreateDirectory"));
  -[MBDriveScript addOperation:](v25, "addOperation:", v26);

  v27 = self->_driveScript;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToCreateDirectory](MBDriveOperation, "operationToCreateDirectory"));
  -[MBDriveScript addOperation:](v27, "addOperation:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine prefixDirectories](self, "prefixDirectories"));
  v30 = objc_msgSend(v29, "count");

  if (v30 >= 1)
  {
    do
    {
      v31 = self->_driveScript;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToCreateDirectory](MBDriveOperation, "operationToCreateDirectory"));
      -[MBDriveScript addOperation:](v31, "addOperation:", v32);

      v33 = self->_driveScript;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToCreateDirectory](MBDriveOperation, "operationToCreateDirectory"));
      -[MBDriveScript addOperation:](v33, "addOperation:", v34);

      --v30;
    }
    while (v30);
  }
  v35 = self->_driveScript;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
  -[MBDriveScript addOperation:](v35, "addOperation:", v36);

  v37 = self->_driveScript;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal driveOperationsForType:](self->_operationJournal, "driveOperationsForType:", 2));
  -[MBDriveScript addOperations:](v37, "addOperations:", v38);

  v39 = self->_driveScript;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
  -[MBDriveScript addOperation:](v39, "addOperation:", v40);

  v41 = self->_driveScript;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
  -[MBDriveScript addOperation:](v41, "addOperation:", v42);

  v43 = self->_driveScript;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
  -[MBDriveScript addOperation:](v43, "addOperation:", v44);

  v45 = self->_driveScript;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal driveOperationsForType:](self->_operationJournal, "driveOperationsForType:", 3));
  -[MBDriveScript addOperations:](v45, "addOperations:", v46);

  v47 = self->_driveScript;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToMoveItem](MBDriveOperation, "operationToMoveItem"));
  -[MBDriveScript addOperation:](v47, "addOperation:", v48);

  v49 = self->_driveScript;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToMoveItem](MBDriveOperation, "operationToMoveItem"));
  -[MBDriveScript addOperation:](v49, "addOperation:", v50);

  v51 = self->_driveScript;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
  -[MBDriveScript addOperation:](v51, "addOperation:", v52);

  v53 = self->_driveScript;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal driveOperationsForType:](self->_operationJournal, "driveOperationsForType:", 4));
  -[MBDriveScript addOperations:](v53, "addOperations:", v54);

  v55 = self->_driveScript;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToRemoveItem](MBDriveOperation, "operationToRemoveItem"));
  -[MBDriveScript addOperation:](v55, "addOperation:", v56);

  v57 = self->_driveScript;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToRemoveItem](MBDriveOperation, "operationToRemoveItem"));
  -[MBDriveScript addOperation:](v57, "addOperation:", v58);

  v59 = self->_driveScript;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
  -[MBDriveScript addOperation:](v59, "addOperation:", v60);

  v61 = self->_status;
  if (v61)
  {
    -[MBStatus version](v61, "version");
    if (v62 < 3.3)
    {
      v63 = self->_driveScript;
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToRemoveItem](MBDriveOperation, "operationToRemoveItem"));
      -[MBDriveScript addOperation:](v63, "addOperation:", v64);

    }
  }
  -[MBDriveScript beginPerforming](self->_driveScript, "beginPerforming");
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MBDebugContext valueForName:](self->super._debugContext, "valueForName:", CFSTR("InjectedDriveErrorIndex")));

  if (v65)
  {
    v68 = -[MBErrorInjectorDrive initWithScript:delegate:index:subindex:]([MBErrorInjectorDrive alloc], "initWithScript:delegate:index:subindex:", self->_driveScript, self->_drive, (int)-[MBDebugContext intForName:](self->super._debugContext, "intForName:", CFSTR("InjectedDriveErrorIndex")), (int)-[MBDebugContext intForName:](self->super._debugContext, "intForName:", CFSTR("InjectedDriveErrorSubindex")));
    objc_storeStrong((id *)&self->_drive, v68);
    if (-[MBErrorInjectorDrive done](v68, "done"))
    {
      -[MBDebugContext setFlag:](self->super._debugContext, "setFlag:", CFSTR("DoneInjectingDriveErrors"));
    }
    else
    {
      -[MBDebugContext setInt:forName:](self->super._debugContext, "setInt:forName:", -[MBErrorInjectorDrive nextIndex](v68, "nextIndex"), CFSTR("NextInjectedDriveErrorIndex"));
      -[MBDebugContext setInt:forName:](self->super._debugContext, "setInt:forName:", -[MBErrorInjectorDrive nextSubindex](v68, "nextSubindex"), CFSTR("NextInjectedDriveErrorSubindex"));
    }

  }
  v69 = MBGetDefaultLog(v66, v67);
  v70 = objc_claimAutoreleasedReturnValue(v69);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    -[MBProgress total](self->_progress, "total");
    *(_DWORD *)buf = 134217984;
    v75 = v71;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Expected duration: %0.3f s", buf, 0xCu);
    -[MBProgress total](self->_progress, "total");
    _MBLog(CFSTR("INFO"), "Expected duration: %0.3f s", v72);
  }

  return 0;
}

- (id)_prepareFreeSpace
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  MBDrive *drive;
  unsigned __int8 v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  unint64_t v46;

  v3 = -[MBBackupOperationJournal countForType:](self->_operationJournal, "countForType:", 2);
  v4 = -[MBBackupOperationJournal sizeForType:](self->_operationJournal, "sizeForType:", 2);
  v5 = -[MBBackupOperationJournal sizeExcludingHardlinksAndClonesForType:](self->_operationJournal, "sizeExcludingHardlinksAndClonesForType:", 2);
  v7 = MBGetDefaultLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v42 = v4;
    v43 = 2048;
    v44 = v5;
    v45 = 2048;
    v46 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "uploadSize:%llu(%llu), uploadFileCount:%llu", buf, 0x20u);
    _MBLog(CFSTR("DEFAULT"), "uploadSize:%llu(%llu), uploadFileCount:%llu", v4, v5, v3);
  }

  -[MBDriveBackupEngine setUploadFileCount:](self, "setUploadFileCount:", v3);
  -[MBDriveBackupEngine setUploadSize:](self, "setUploadSize:", v4);
  -[MBDriveBackupEngine setUploadSizeExcludingHardlinksAndClones:](self, "setUploadSizeExcludingHardlinksAndClones:", v5);
  if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
  {
    v9 = 0;
LABEL_5:
    v9 = v9;
    v10 = v9;
  }
  else
  {
    v39 = 0;
    v40 = 0;
    v11 = -[MBDrive freeSpace:error:](self->_drive, "freeSpace:error:", &v40, &v39);
    v12 = v39;
    v9 = v12;
    if (v11)
    {
      v14 = 0;
      v15 = v4 + 0x8000000;
      while (1)
      {
        v16 = MBGetDefaultLog(v12, v13);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v42 = (unint64_t)v40;
          v43 = 2048;
          v44 = (unint64_t)v40;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Free disk space on drive: %llu (%{bytes}llu)", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), "Free disk space on drive: %llu (%{bytes}llu)", v40, v40);
        }

        v20 = (char *)(v15 - (_QWORD)v40);
        if ((uint64_t)(v15 - (_QWORD)v40) < 0)
          goto LABEL_5;
        if ((v14 & 1) != 0)
          break;
        v21 = MBGetDefaultLog(v18, v19);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v42 = (unint64_t)v20;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Need extra space on host: %lld. Requesting host to purge now", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "Need extra space on host: %lld. Requesting host to purge now", v20);
        }

        v37 = v9;
        v38 = 0;
        v23 = -[MBDrive purgeDiskSpace:amountRequested:urgencyLevel:error:](self->_drive, "purgeDiskSpace:amountRequested:urgencyLevel:error:", &v38, v20 + 0x80000000, 4, &v37);
        v24 = v37;

        v27 = MBGetDefaultLog(v25, v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        v29 = v28;
        if ((v23 & 1) == 0)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v42 = (unint64_t)v24;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to purge disk space of drive: %@", buf, 0xCu);
            _MBLog(CFSTR("ERROR"), "Failed to purge disk space of drive: %@", v24);
          }

          goto LABEL_26;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v42 = (unint64_t)v38;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Successfully purged on host: %llu", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "Successfully purged on host: %llu", v38);
        }

        drive = self->_drive;
        v39 = v24;
        v31 = -[MBDrive freeSpace:error:](drive, "freeSpace:error:", &v40, &v39);
        v9 = v39;

        v14 = 1;
        if ((v31 & 1) == 0)
          goto LABEL_18;
      }
      v24 = v9;
LABEL_26:
      v35 = MBGetDefaultLog(v18, v19);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v42 = (unint64_t)v40;
        v43 = 2048;
        v44 = v4;
        v45 = 1024;
        LODWORD(v46) = 0x8000000;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Insufficient free disk space on drive to backup (%llu < %llu + %d)", buf, 0x1Cu);
        _MBLog(CFSTR("ERROR"), "Insufficient free disk space on drive to backup (%llu < %llu + %d)", v40, v4, 0x8000000);
      }

      v9 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 105, CFSTR("Insufficient free disk space on drive to back up")));
      goto LABEL_5;
    }
LABEL_18:
    v32 = MBGetDefaultLog(v12, v13);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = (unint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to get the free space of drive: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to get the free space of drive: %@", v9);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_prepareResume
{
  void *v3;

  if (!-[MBStatus isMoving](self->_status, "isMoving")
    || self->_retryCount
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _moveWithOperationType:](self, "_moveWithOperationType:", 0))) == 0)
  {
    if ((-[MBStatus isMoving](self->_status, "isMoving") || -[MBStatus isRemoving](self->_status, "isRemoving"))
      && !self->_retryCount)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _removeWithOperationType:](self, "_removeWithOperationType:", 1));
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_prepareMoveBackup
{
  MBStatus *status;
  double v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MBDrive *drive;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  status = self->_status;
  if (status
    && (-[MBStatus version](status, "version"), v4 < 3.3)
    && !-[MBDriveBackupEngine movedOldBackup](self, "movedOldBackup"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "targetIdentifier"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v10, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v8, v11));
    -[MBDriveBackupEngine setMovedBackupName:](self, "setMovedBackupName:", v12);

    v15 = MBGetDefaultLog(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine movedBackupName](self, "movedBackupName"));
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Renaming existing backup %@ to %@", buf, 0x16u);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine movedBackupName](self, "movedBackupName"));
      _MBLog(CFSTR("INFO"), "Renaming existing backup %@ to %@", v8, v18);

    }
    drive = self->_drive;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine movedBackupName](self, "movedBackupName"));
    v23 = 0;
    v21 = -[MBDrive moveItemAtPath:toPath:options:error:](drive, "moveItemAtPath:toPath:options:error:", v8, v20, 0, &v23);
    v22 = v23;

    if (v21)
    {
      -[MBDriveBackupEngine setMovedOldBackup:](self, "setMovedOldBackup:", 1);
      v5 = 0;
    }
    else
    {
      v5 = v22;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_prepareSnapshot
{
  uint64_t v3;
  NSObject *v4;
  MBDrive *drive;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  MBDrive *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  MBDrive *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  MBDrive *v48;
  id v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  unsigned __int8 v55;
  void *v56;
  id v57;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint8_t buf[16];
  _BYTE v73[128];
  _BYTE v74[128];

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Creating backup directory", buf, 2u);
    _MBLog(CFSTR("INFO"), "Creating backup directory");
  }

  drive = self->_drive;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "driveBackupDir"));
  v71 = 0;
  v8 = -[MBDrive createDirectoryAtPath:options:error:](drive, "createDirectoryAtPath:options:error:", v7, 0, &v71);
  v9 = v71;

  if ((v8 & 1) == 0)
  {
    if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v9, 3))
    {
      v50 = CFSTR("Error creating backup directory");
LABEL_50:
      v57 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v9, v50));
      goto LABEL_51;
    }

    v9 = 0;
  }
  v12 = MBGetDefaultLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Creating backup sub-directories", buf, 2u);
    _MBLog(CFSTR("INFO"), "Creating backup sub-directories");
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine prefixDirectories](self, "prefixDirectories"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v68;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
        v20 = objc_autoreleasePoolPush();
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "driveBackupDir"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22, "stringByAppendingPathComponent:", v19));

        v24 = self->_drive;
        v66 = v9;
        LOBYTE(v22) = -[MBDrive createDirectoryAtPath:options:error:](v24, "createDirectoryAtPath:options:error:", v23, 0, &v66);
        v25 = v66;

        if ((v22 & 1) != 0)
        {
          v9 = v25;
        }
        else
        {
          if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v25, 3))
          {
            v9 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v25, CFSTR("Error creating backup sub-directories")));

            objc_autoreleasePoolPop(v20);
            goto LABEL_21;
          }

          v9 = 0;
        }

        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_21:

  if (v9)
    goto LABEL_48;
  v28 = MBGetDefaultLog(v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Creating snapshot directory", buf, 2u);
    _MBLog(CFSTR("INFO"), "Creating snapshot directory");
  }

  v30 = self->_drive;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "driveSnapshotDir"));
  v65 = 0;
  v33 = -[MBDrive createDirectoryAtPath:options:error:](v30, "createDirectoryAtPath:options:error:", v32, 0, &v65);
  v9 = v65;

  if ((v33 & 1) != 0)
    goto LABEL_27;
  if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v9, 3))
  {
    v50 = CFSTR("Error creating snapshot directory");
    goto LABEL_50;
  }

  v9 = 0;
LABEL_27:
  v36 = MBGetDefaultLog(v34, v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Creating snapshot sub-directories", buf, 2u);
    _MBLog(CFSTR("INFO"), "Creating snapshot sub-directories");
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine prefixDirectories](self, "prefixDirectories"));
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v62;
    while (2)
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(_QWORD *)v62 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
        v44 = objc_autoreleasePoolPush();
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
        v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "driveSnapshotDir"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v46, "stringByAppendingPathComponent:", v43));

        v48 = self->_drive;
        v60 = v9;
        LOBYTE(v46) = -[MBDrive createDirectoryAtPath:options:error:](v48, "createDirectoryAtPath:options:error:", v47, 0, &v60);
        v49 = v60;

        if ((v46 & 1) != 0)
        {
          v9 = v49;
        }
        else
        {
          if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v49, 3))
          {
            v9 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v49, CFSTR("Error creating snapshot sub-directories")));

            objc_autoreleasePoolPop(v44);
            goto LABEL_43;
          }

          v9 = 0;
        }

        objc_autoreleasePoolPop(v44);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      if (v40)
        continue;
      break;
    }
  }
LABEL_43:

  if (v9)
    goto LABEL_48;
  v53 = MBGetDefaultLog(v51, v52);
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Setting status to \"uploading\", buf, 2u);
    _MBLog(CFSTR("INFO"), "Setting status to \"uploading\");
  }

  v59 = 0;
  v55 = -[MBDriveBackupEngine _uploadStatusToDriveWithSnapshotState:error:](self, "_uploadStatusToDriveWithSnapshotState:error:", 0, &v59);
  v9 = v59;
  if ((v55 & 1) == 0)
  {
LABEL_48:
    v57 = v9;
    v9 = v57;
LABEL_51:
    v56 = v57;
    goto LABEL_52;
  }
  v56 = 0;
LABEL_52:

  return v56;
}

- (id)_upload
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  id v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  MBManifestDB *snapshotManifestDB;
  unsigned int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  MBManifestDB *v41;
  unsigned __int8 v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  _BOOL8 v50;
  uint64_t v51;
  MBManifestDB *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  unsigned __int8 v57;
  MBManifestDB *v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  MBDrive *v63;
  void *v64;
  id v65;
  MBManifestDB *v66;
  id v67;
  MBDrive *drive;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint8_t buf[4];
  unint64_t v81;
  __int16 v82;
  unint64_t v83;
  __int16 v84;
  double v85;
  __int16 v86;
  unint64_t v87;

  v3 = objc_autoreleasePoolPush();
  v4 = -[MBBackupOperationJournal countForType:](self->_operationJournal, "countForType:", 2);
  v5 = -[MBBackupOperationJournal sizeForType:](self->_operationJournal, "sizeForType:", 2);
  v7 = MBGetDefaultLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v81 = v4;
    v82 = 2048;
    v83 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting to upload %lu files of size %{bytes}llu", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Starting to upload %lu files of size %{bytes}llu", v4, v5);
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v10 = v9;
  v11 = -[MBDebugContext performSelectorForName:withObject:](self->super._debugContext, "performSelectorForName:withObject:", CFSTR("StartingUpload"), self->super._debugContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _uploadInBatches](self, "_uploadInBatches"));
  if (!v12)
  {
    if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateErrorAfterUploading")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Simulated error after uploading")));
      goto LABEL_46;
    }
    if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterUploading")))goto LABEL_47;
    v13 = -[MBDriveBackupEngine _shouldRetry](self, "_shouldRetry");
    if (v13)
    {
      v15 = 0;
      goto LABEL_9;
    }
    v23 = MBGetDefaultLog(v13, v14);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Removing ephemeral files added and deleted during retries", buf, 2u);
      _MBLog(CFSTR("INFO"), "Removing ephemeral files added and deleted during retries");
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB removeEphemeralRetriedFiles](self->_snapshotManifestDB, "removeEphemeralRetriedFiles"));
    if (!v12)
    {
      v26 = MBGetDefaultLog(0, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Preparing to close snapshot manifest database", buf, 2u);
        _MBLog(CFSTR("INFO"), "Preparing to close snapshot manifest database");
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB unsetAlreadyUploadedFlags](self->_snapshotManifestDB, "unsetAlreadyUploadedFlags"));
      if (!v12)
      {
        v29 = MBGetDefaultLog(0, v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Closing and checkpointing snapshot manifest database", buf, 2u);
          _MBLog(CFSTR("INFO"), "Closing and checkpointing snapshot manifest database");
        }

        snapshotManifestDB = self->_snapshotManifestDB;
        v79 = 0;
        v32 = -[MBManifestDB closeWithError:](snapshotManifestDB, "closeWithError:", &v79);
        v33 = v79;
        v12 = v33;
        if (v32)
        {
          v35 = MBGetDefaultLog(v33, v34);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Uploading properties to snapshot", buf, 2u);
            _MBLog(CFSTR("INFO"), "Uploading properties to snapshot");
          }

          drive = self->_drive;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotPropertiesPath](self, "_deviceSnapshotPropertiesPath"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "driveSnapshotPropertiesPath"));
          v78 = v12;
          LOBYTE(drive) = -[MBDrive uploadFileAtPath:toPath:options:error:](drive, "uploadFileAtPath:toPath:options:error:", v37, v38, 0, &v78);
          v65 = v78;

          if ((drive & 1) == 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v65, CFSTR("Error uploading properties to snapshot")));

            goto LABEL_46;
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotPropertiesPath](self, "_deviceSnapshotPropertiesPath"));
          v77 = v65;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[MBProperties propertiesWithFile:error:](MBProperties, "propertiesWithFile:error:", v39, &v77));
          v71 = v77;

          if (v40)
          {
            v69 = v40;
            v41 = self->_snapshotManifestDB;
            v76 = v71;
            v42 = -[MBManifestDB openWithError:](v41, "openWithError:", &v76);
            v43 = v76;

            if ((v42 & 1) != 0)
            {
              v46 = MBGetDefaultLog(v44, v45);
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Uploading manifest database to snapshot", buf, 2u);
                _MBLog(CFSTR("INFO"), "Uploading manifest database to snapshot");
              }

              v66 = self->_snapshotManifestDB;
              v72 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "driveSnapshotManifestDatabasePath"));
              v63 = self->_drive;
              v64 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "keybag"));
              v75 = v43;
              LOBYTE(v63) = -[MBManifestDB uploadToPath:withDrive:keybag:error:](v66, "uploadToPath:withDrive:keybag:error:", v48, v63, v49, &v75);
              v67 = v75;

              if ((v63 & 1) != 0)
              {
                v15 = v67;
                v50 = -[MBEngine encrypted](self, "encrypted");
                if (v50
                  && (v52 = self->_snapshotManifestDB,
                      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password")),
                      v74 = v67,
                      LOBYTE(v52) = -[MBManifestDB setupEncryptionWithPassword:withError:](v52, "setupEncryptionWithPassword:withError:", v53, &v74), v15 = v74, v67, v53, (v52 & 1) == 0))
                {
                  v60 = MBGetDefaultLog(v50, v51);
                  v61 = objc_claimAutoreleasedReturnValue(v60);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v81 = (unint64_t)v15;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
                    _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v15);
                  }

                }
                else
                {
                  v54 = v15;
                  v55 = MBGetDefaultLog(v50, v51);
                  v56 = objc_claimAutoreleasedReturnValue(v55);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Setting status to \"moving\", buf, 2u);
                    _MBLog(CFSTR("INFO"), "Setting status to \"moving\");
                  }

                  v73 = v54;
                  v57 = -[MBDriveBackupEngine _uploadStatusToDriveWithSnapshotState:error:](self, "_uploadStatusToDriveWithSnapshotState:error:", 1, &v73);
                  v15 = v73;

                  if ((v57 & 1) != 0)
                  {

LABEL_9:
                    if (!-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterUploadingSuccessfully")))
                    {
                      v16 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
                      v18 = v17;
                      v20 = MBGetDefaultLog(v16, v19);
                      v21 = objc_claimAutoreleasedReturnValue(v20);
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                      {
                        v22 = v18 - v10;
                        *(_DWORD *)buf = 134218752;
                        v81 = v4;
                        v82 = 2048;
                        v83 = v5;
                        v84 = 2048;
                        v85 = v22;
                        v86 = 2048;
                        v87 = (unint64_t)((double)v5 / v22);
                        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Uploaded %lu files of %{bytes}llu in %0.3f s at %{bytes}llu/s", buf, 0x2Au);
                        _MBLog(CFSTR("DEFAULT"), "Uploaded %lu files of %{bytes}llu in %0.3f s at %{bytes}llu/s", v4, v5, *(_QWORD *)&v22, (unint64_t)((double)v5 / v22));
                      }

                      v12 = 0;
                      goto LABEL_46;
                    }
LABEL_47:
                    abort();
                  }
                }
                v59 = v15;
                v43 = v59;
              }
              else
              {
                v43 = v67;
                v59 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v67, CFSTR("Error uploading database to snapshot")));
              }
            }
            else
            {
              v58 = self->_snapshotManifestDB;
              self->_snapshotManifestDB = 0;

              v59 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 101, CFSTR("Error opening snapshot manifest database from device")));
            }
            v12 = v59;
            v40 = v69;
          }
          else
          {
            v43 = v71;
            v12 = v43;
          }

        }
      }
    }
  }
LABEL_46:
  objc_autoreleasePoolPop(v3);
  return v12;
}

- (id)_uploadInBatches
{
  MBDrive *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t batchSize;
  unint64_t concurrentUploadBatchCount;
  uint64_t v10;
  void *v11;
  __uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id *p_isa;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  __uint64_t v32;
  MBDriveUploadBatch *v33;
  uint64_t v34;
  MBDriveUploadBatch *v35;
  __uint64_t v36;
  double v37;
  unsigned int v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  unsigned int v42;
  void *v43;
  id v44;
  unsigned int v45;
  void *v46;
  NSObject *v47;
  MBDriveUploadBatch *v48;
  id v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  __uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  MBDrive *v74;
  NSObject *log;
  NSObject *group;
  dispatch_semaphore_t v77;
  void *v78;
  unsigned int v79;
  void *v80;
  uint64_t v81;
  MBDriveBackupEngine *v82;
  id v83;
  __uint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *context;
  id v89;
  _QWORD v90[4];
  NSObject *v91;
  _QWORD v92[4];
  NSObject *v93;
  MBDriveUploadBatch *v94;
  id *v95;
  id v96;
  NSObject *v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  __uint64_t v103;
  __uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  uint8_t buf[4];
  _BYTE v128[34];
  __int16 v129;
  uint64_t v130;
  __int16 v131;
  double v132;
  __int16 v133;
  double v134;
  __int16 v135;
  uint64_t v136;
  const __CFString *v137;
  MBDriveBackupEngine *v138;

  if (!self->_batchSize)
    sub_1000876F8();
  if (!self->_concurrentUploadBatchCount)
    sub_100087720();
  v3 = self->_drive;
  v74 = v3;
  if (!v3)
    sub_100087748();
  v82 = self;
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class(v82);
    batchSize = v82->_batchSize;
    concurrentUploadBatchCount = v82->_concurrentUploadBatchCount;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v128 = v7;
    *(_WORD *)&v128[8] = 2048;
    *(_QWORD *)&v128[10] = batchSize;
    *(_WORD *)&v128[18] = 2048;
    *(_QWORD *)&v128[20] = concurrentUploadBatchCount;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@, uploadBatchSize:%lu, concurrentUploadBatchCount:%lu", buf, 0x20u);
    v10 = objc_opt_class(v82);
    _MBLog(CFSTR("DEFAULT"), "%{public}@, uploadBatchSize:%lu, concurrentUploadBatchCount:%lu", v10, v82->_batchSize, v82->_concurrentUploadBatchCount);
  }

  v77 = dispatch_semaphore_create(v82->_concurrentUploadBatchCount + (v82->_concurrentUploadBatchCount >> 1));
  v79 = -[MBEngine isDeviceTransferEngine](v82, "isDeviceTransferEngine");
  v83 = (id)v82->_batchSize;
  if (!v83)
    sub_100087770();
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](v82, "settingsContext"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "driveSnapshotDir"));

  if (!v80)
    sub_100087798();
  v121 = 0;
  v122 = &v121;
  v123 = 0x3032000000;
  v124 = sub_100024970;
  v125 = sub_100024980;
  v126 = 0;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v120 = 0;
  v113 = 0;
  v114 = &v113;
  v115 = 0x2020000000;
  v116 = 0;
  v109 = 0;
  v110 = &v109;
  v111 = 0x2020000000;
  v112 = -1;
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = 0;
  v137 = CFSTR("FileHandleFactory");
  v138 = v82;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1));
  group = dispatch_group_create();
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal operationEnumeratorWithDomainManager:](v82->_operationJournal, "operationEnumeratorWithDomainManager:", v82->super._domainManager));
  v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v84 = 0;
  v86 = 0;
  v87 = 0;
  v81 = 0;
  v89 = 0;
  do
  {
    context = objc_autoreleasePoolPush();
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "nextObject"));
    v14 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "type") != 2)
        goto LABEL_28;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
      v16 = v15 == 0;

      if (v16)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v82, CFSTR("MBDriveBackupEngine.m"), 1919, CFSTR("No domain for upload operation"));

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fileID"));
      v18 = v17 == 0;

      if (v18)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v82, CFSTR("MBDriveBackupEngine.m"), 1920, CFSTR("No file ID for upload operation"));

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
      v20 = v19 == 0;

      if (v20)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, v82, CFSTR("MBDriveBackupEngine.m"), 1921, CFSTR("No path for upload operation"));

      }
      if (!v89)
        v89 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v83);
      if (!v87)
        v87 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v83);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fileID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filenameWithPrefix"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "stringByAppendingPathComponent:", v23));
      if (v79 && objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", v21)))
        __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]", "MBDriveBackupEngine.m", 1929, "!isDeviceTransfer || paths[fromPath] == nil");
      v25 = objc_msgSend(v14, "size");
      objc_msgSend(v89, "setObject:forKeyedSubscript:", v24, v21);
      v26 = objc_retainAutorelease(v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(v26, "fileSystemRepresentation")));
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v14, v27);

      v86 += (uint64_t)v25;
    }
    else if (objc_msgSend(v89, "count"))
    {
      goto LABEL_26;
    }
    if (objc_msgSend(v89, "count") != v83)
    {
LABEL_28:
      LOBYTE(v29) = 0;
      goto LABEL_39;
    }
LABEL_26:
    p_isa = v82;
    objc_sync_enter(p_isa);
    v29 = objc_msgSend(p_isa, "isCanceled");
    if (v29)
    {
      v30 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File upload cancelled")));
      v31 = (void *)v122[5];
      v122[5] = v30;

      objc_sync_exit(p_isa);
    }
    else
    {
      objc_msgSend(p_isa[23], "addEntriesFromDictionary:", v87);
      objc_sync_exit(p_isa);

      v32 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      v33 = -[MBDriveUploadBatch initWithPaths:size:last:]([MBDriveUploadBatch alloc], "initWithPaths:size:last:", v89, v86, v14 == 0);
      v35 = v33;
      v36 = v84;
      if (!v84)
        v36 = v32;
      v84 = v36;
      v37 = (double)(v32 - v12) / 1000000000.0;
      do
        v38 = __ldxr(&dword_1000F9DF4);
      while (__stxr(v38 + 1, &dword_1000F9DF4));
      v39 = MBGetDefaultLog(v33, v34);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = v40;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          log = v41;
          v42 = -[MBDriveUploadBatch index](v35, "index");
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveUploadBatch paths](v35, "paths"));
          v44 = objc_msgSend(v43, "count");
          *(_DWORD *)buf = 67110144;
          *(_DWORD *)v128 = v42;
          *(_WORD *)&v128[4] = 2048;
          *(_QWORD *)&v128[6] = v44;
          *(_WORD *)&v128[14] = 2048;
          *(_QWORD *)&v128[16] = v86;
          *(_WORD *)&v128[24] = 2048;
          *(double *)&v128[26] = v37;
          v129 = 1024;
          LODWORD(v130) = v38;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Fetched batch i:%u, c:%lu, s:%llu, t:%.3f, o:%u", buf, 0x2Cu);

          v41 = log;
        }

        v45 = -[MBDriveUploadBatch index](v35, "index");
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveUploadBatch paths](v35, "paths"));
        _MBLog(CFSTR("INFO"), "Fetched batch i:%u, c:%lu, s:%llu, t:%.3f, o:%u", v45, objc_msgSend(v46, "count"), v86, v37, v38);

      }
      dispatch_group_enter(group);
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_100027DF8;
      v92[3] = &unk_1000D95B8;
      v47 = v77;
      v93 = v47;
      v103 = v32;
      v104 = v84;
      v48 = v35;
      v94 = v48;
      v95 = p_isa;
      v98 = &v121;
      v49 = v87;
      v96 = v49;
      v99 = &v117;
      v100 = &v113;
      v101 = &v109;
      v102 = &v105;
      v97 = group;
      objc_msgSend(p_isa, "_uploadBatch:options:completion:", v48, v78, v92);

      dispatch_semaphore_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
      v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);

      v86 = 0;
      v87 = 0;
      v89 = 0;
      v81 = (v81 + 1);
      p_isa = (id *)&v48->super.isa;
    }

LABEL_39:
    objc_autoreleasePoolPop(context);
    v50 = v29 ^ 1;
    if (!v14)
      v50 = 0;
  }
  while ((v50 & 1) != 0);
  dispatch_group_enter(group);
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_1000281D4;
  v90[3] = &unk_1000D95E0;
  v54 = group;
  v91 = v54;
  -[MBDrive finishBatchUploadsWithOptions:completion:](v74, "finishBatchUploadsWithOptions:completion:", v78, v90);
  MBGroupWaitForever(v54);
  v55 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v57 = (double)(v55 - v84) / 1000000000.0;
  v58 = -1.0;
  if (v57 > 0.0)
    v58 = (double)(unint64_t)v118[3] / v57 / 1000000.0;
  v59 = v114[3];
  if (v59)
    v60 = v118[3] / v59;
  else
    v60 = 0;
  if (v122[5])
  {
    v61 = MBGetDefaultLog(v55, v56);
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = v110[3];
      v64 = v106[3];
      v65 = v118[3];
      v66 = v122[5];
      *(_DWORD *)buf = 67110914;
      *(_DWORD *)v128 = v81;
      *(_WORD *)&v128[4] = 2048;
      *(_QWORD *)&v128[6] = v63;
      *(_WORD *)&v128[14] = 2048;
      *(_QWORD *)&v128[16] = v64;
      *(_WORD *)&v128[24] = 2048;
      *(_QWORD *)&v128[26] = v60;
      v129 = 2048;
      v130 = v65;
      v131 = 2048;
      v132 = v57;
      v133 = 2048;
      v134 = v58;
      v135 = 2112;
      v136 = v66;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to upload after %u batches, s:{%llu,%llu,%llu,%llu}, t:%.3f, r:%.3f - %@", buf, 0x4Eu);
      _MBLog(CFSTR("ERROR"), "Failed to upload after %u batches, s:{%llu,%llu,%llu,%llu}, t:%.3f, r:%.3f - %@", v81, v110[3], v106[3], v60, v118[3], *(_QWORD *)&v57, *(_QWORD *)&v58, v122[5]);
    }
  }
  else
  {
    v67 = MBGetDefaultLog(v55, v56);
    v62 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v68 = v110[3];
      v69 = v106[3];
      v70 = v118[3];
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)v128 = v81;
      *(_WORD *)&v128[4] = 2048;
      *(_QWORD *)&v128[6] = v68;
      *(_WORD *)&v128[14] = 2048;
      *(_QWORD *)&v128[16] = v69;
      *(_WORD *)&v128[24] = 2048;
      *(_QWORD *)&v128[26] = v60;
      v129 = 2048;
      v130 = v70;
      v131 = 2048;
      v132 = v57;
      v133 = 2048;
      v134 = v58;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Finished uploading %u batches, s:{%llu,%llu,%llu,%llu}, t:%.3f, r:%.3f", buf, 0x44u);
      _MBLog(CFSTR("DEFAULT"), "Finished uploading %u batches, s:{%llu,%llu,%llu,%llu}, t:%.3f, r:%.3f", v81, v110[3], v106[3], v60, v118[3], v57, v58);
    }
  }

  v71 = (id)v122[5];
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v121, 8);

  return v71;
}

- (void)_uploadBatch:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  MBDrive *v13;
  MBDrive *v14;
  unsigned int v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MBDriveBackupEngine *v20;
  id v21;
  SEL v22;
  unsigned int v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
    sub_1000877E8();
  v12 = v11;
  if (!v11)
    sub_100087810();
  v13 = self->_drive;
  if (!v13)
    sub_100087838();
  v14 = v13;
  v15 = objc_msgSend(v9, "index");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100028328;
  v18[3] = &unk_1000D9608;
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "paths"));
  v20 = self;
  v23 = v15;
  v21 = v12;
  v22 = a2;
  v16 = v12;
  v17 = v19;
  -[MBDrive uploadBatch:options:completion:](v14, "uploadBatch:options:completion:", v9, v10, v18);

}

- (id)_moveWithOperationType:(int)a3
{
  uint64_t v3;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  MBDrive *drive;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  MBDrive *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  unsigned int v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  double v44;
  double v45;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  double v54;

  v3 = *(_QWORD *)&a3;
  v5 = objc_autoreleasePoolPush();
  v6 = -[MBBackupOperationJournal countForType:](self->_operationJournal, "countForType:", v3);
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v52 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Starting to move %lu items", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Starting to move %lu items", v6);
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateErrorBeforeMoving")))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Simulated error before moving")));
    goto LABEL_29;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _moveInBatchesWithOperationType:](self, "_moveInBatchesWithOperationType:", v3));
  if (v12)
    goto LABEL_29;
  v13 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterMoving"));
  if ((_DWORD)v13)
    goto LABEL_30;
  v47 = v5;
  v15 = MBGetDefaultLog(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Moving properties", buf, 2u);
    _MBLog(CFSTR("INFO"), "Moving properties");
  }

  drive = self->_drive;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "driveSnapshotPropertiesPath"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "driveBackupPropertiesPath"));
  v50 = 0;
  v22 = -[MBDrive moveItemAtPath:toPath:options:error:](drive, "moveItemAtPath:toPath:options:error:", v19, v21, 0, &v50);
  v23 = v50;

  if ((v22 & 1) == 0)
  {
    if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v23, 4))
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v23, CFSTR("Error moving properties from snapshot")));

      goto LABEL_28;
    }

    v23 = 0;
  }
  v24 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterMovingProperties"));
  if ((_DWORD)v24)
    goto LABEL_30;
  v26 = MBGetDefaultLog(v24, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Moving manifest database", buf, 2u);
    _MBLog(CFSTR("INFO"), "Moving manifest database");
  }

  v28 = self->_drive;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "driveSnapshotManifestDatabasePath"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "driveBackupManifestDatabasePath"));
  v49 = v23;
  v33 = -[MBDrive moveItemAtPath:toPath:options:error:](v28, "moveItemAtPath:toPath:options:error:", v30, v32, 0, &v49);
  v34 = v49;

  if ((v33 & 1) == 0)
  {
    if (+[MBError isError:withCode:](MBError, "isError:withCode:", v34, 4))
    {

      v34 = 0;
      goto LABEL_18;
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v34, CFSTR("Error moving database from snapshot")));

LABEL_28:
    v5 = v47;
    goto LABEL_29;
  }
LABEL_18:
  v5 = v47;
  v35 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterMovingManifest"));
  if ((_DWORD)v35)
    goto LABEL_30;
  v37 = MBGetDefaultLog(v35, v36);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Setting status to \"removing\", buf, 2u);
    _MBLog(CFSTR("INFO"), "Setting status to \"removing\");
  }

  v48 = v34;
  v39 = -[MBDriveBackupEngine _uploadStatusToDriveWithSnapshotState:error:](self, "_uploadStatusToDriveWithSnapshotState:error:", 2, &v48);
  v12 = v48;

  if (v39)
  {
    v40 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterMovingState"));
    if (!(_DWORD)v40)
    {
      v42 = MBGetDefaultLog(v40, v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        *(_DWORD *)buf = 134218240;
        v52 = v6;
        v53 = 2048;
        v54 = v44 - v11;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Moved %lu files in %0.3f s", buf, 0x16u);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        _MBLog(CFSTR("DEFAULT"), "Moved %lu files in %0.3f s", v6, v45 - v11);
      }

      v12 = 0;
      goto LABEL_29;
    }
LABEL_30:
    abort();
  }
LABEL_29:
  objc_autoreleasePoolPop(v5);
  return v12;
}

- (id)_moveInBatchesWithOperationType:(int)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MBManifestDB *snapshotManifestDB;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
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
  void *v27;
  id v28;
  SEL v30;
  int v31;
  id v32;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal operationEnumeratorWithDomainManager:](self->_operationJournal, "operationEnumeratorWithDomainManager:", self->super._domainManager));
  v8 = objc_autoreleasePoolPush();
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
  if (!v9)
  {
LABEL_13:
    objc_autoreleasePoolPop(v8);
    if (objc_msgSend(v6, "count"))
    {
      v28 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _moveBatchWithPaths:](self, "_moveBatchWithPaths:", v6));
      if (!v28)
        objc_msgSend(v6, "removeAllObjects");
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_19;
  }
  v10 = (void *)v9;
  v30 = a2;
  v31 = a3;
  while (1)
  {
    snapshotManifestDB = self->_snapshotManifestDB;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileID", v30));
    v32 = 0;
    v13 = -[MBManifestDB flagsForFileID:error:](snapshotManifestDB, "flagsForFileID:error:", v12, &v32);
    v14 = v32;

    if (v14)
    {
      v28 = v14;
      goto LABEL_17;
    }
    if (objc_msgSend(v10, "type") == a3 && (v13 & 0x10) == 0)
      break;
LABEL_12:

    objc_autoreleasePoolPop(v8);
    v8 = objc_autoreleasePoolPush();
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
    if (!v10)
      goto LABEL_13;
  }
  v15 = v6;
  v16 = v7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileID"));

  if (!v17)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v30, self, CFSTR("MBDriveBackupEngine.m"), 2156, CFSTR("No file ID for move operation"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filenameWithPrefix"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "driveSnapshotDir"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingPathComponent:", v19));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "driveBackupDir"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingPathComponent:", v19));

  v6 = v15;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, v22);
  v7 = v16;
  a3 = v31;
  if (objc_msgSend(v15, "count") != (id)self->_batchSize)
  {
LABEL_11:

    goto LABEL_12;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _moveBatchWithPaths:](self, "_moveBatchWithPaths:", v15));
  if (!v26)
  {
    objc_msgSend(v15, "removeAllObjects");
    goto LABEL_11;
  }
  v28 = v26;

LABEL_17:
  objc_autoreleasePoolPop(v8);

LABEL_19:
  return v28;
}

- (id)_moveBatchWithPaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  MBDrive *drive;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];

  v4 = a3;
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v37 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Moving batch of %lu items", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Moving batch of %lu items", objc_msgSend(v4, "count"));
  }

  drive = self->_drive;
  v34 = 0;
  v35 = 0;
  v9 = -[MBDrive moveItemsAtPaths:options:results:error:](drive, "moveItemsAtPaths:options:results:error:", v4, 0, &v35, &v34);
  v10 = v35;
  v11 = v34;
  v12 = v11;
  v13 = 0;
  if ((v9 & 1) == 0)
  {
    v28 = v11;
    v29 = v10;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v31;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v19);
          v21 = MBGetDefaultLog(v15, v16);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v20));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v20));
            *(_DWORD *)buf = 138412802;
            v37 = v20;
            v38 = 2112;
            v39 = v23;
            v40 = 2112;
            v41 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error moving \"%@\" to \"%@\": %@", buf, 0x20u);

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v20));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v20));
            _MBLog(CFSTR("ERROR"), "Error moving \"%@\" to \"%@\": %@", v20, v25, v26);

          }
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        v17 = v15;
      }
      while (v15);
    }

    v12 = v28;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v28, CFSTR("Error moving items from snapshot")));
    v10 = v29;
  }

  return v13;
}

- (id)_removeWithOperationType:(int)a3
{
  uint64_t v3;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  MBDrive *drive;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  MBDrive *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  unsigned __int8 v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  double v44;
  double v45;
  const __CFString *v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  unint64_t v51;
  __int16 v52;
  double v53;

  v3 = *(_QWORD *)&a3;
  v5 = objc_autoreleasePoolPush();
  v6 = -[MBBackupOperationJournal countForType:](self->_operationJournal, "countForType:", v3);
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v51 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Starting to remove %lu items", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Starting to remove %lu items", v6);
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashBeforeRemoving")))goto LABEL_34;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _removeInBatchesWithOperationType:](self, "_removeInBatchesWithOperationType:", v3));
  if (v12)
  {
    v13 = v12;
LABEL_6:
    v14 = v13;
LABEL_7:
    v15 = v13;
    goto LABEL_8;
  }
  v17 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterRemoving"));
  if ((_DWORD)v17)
LABEL_34:
    abort();
  v19 = MBGetDefaultLog(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Removing snapshot directory", buf, 2u);
    _MBLog(CFSTR("INFO"), "Removing snapshot directory");
  }

  drive = self->_drive;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "driveSnapshotDir"));
  v49 = 0;
  v24 = -[MBDrive removeItemAtPath:options:error:](drive, "removeItemAtPath:options:error:", v23, 0, &v49);
  v14 = v49;

  if ((v24 & 1) != 0)
  {
    v25 = v14;
  }
  else
  {
    if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v14, 4))
    {
      v46 = CFSTR("Error removing snapshot directory");
LABEL_33:
      v13 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v14, v46));
      goto LABEL_7;
    }

    v25 = 0;
  }
  v26 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterRemovingSnapshot"));
  if ((_DWORD)v26)
    goto LABEL_34;
  v28 = MBGetDefaultLog(v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Removing old database index if it exists", buf, 2u);
    _MBLog(CFSTR("INFO"), "Removing old database index if it exists");
  }

  v30 = self->_drive;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "driveBackupDatabaseIndexPath"));
  v48 = v25;
  v33 = -[MBDrive removeItemAtPath:options:error:](v30, "removeItemAtPath:options:error:", v32, 0, &v48);
  v14 = v48;

  if ((v33 & 1) != 0)
  {
    v36 = v14;
    goto LABEL_23;
  }
  if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v14, 4))
  {
    v46 = CFSTR("Error removing old database index");
    goto LABEL_33;
  }

  v36 = 0;
LABEL_23:
  v37 = MBGetDefaultLog(v34, v35);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Setting status to \"finished\", buf, 2u);
    _MBLog(CFSTR("INFO"), "Setting status to \"finished\");
  }

  v47 = v36;
  v39 = -[MBDriveBackupEngine _uploadStatusToDriveWithSnapshotState:error:](self, "_uploadStatusToDriveWithSnapshotState:error:", 3, &v47);
  v14 = v47;

  if ((v39 & 1) == 0)
  {
    v13 = v14;
    goto LABEL_6;
  }
  v40 = -[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrashAfterRemovingUploadingState"));
  if ((_DWORD)v40)
    goto LABEL_34;
  v42 = MBGetDefaultLog(v40, v41);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134218240;
    v51 = v6;
    v52 = 2048;
    v53 = v44 - v11;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Removed %lu items in %0.3f s", buf, 0x16u);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    _MBLog(CFSTR("DEFAULT"), "Removed %lu items in %0.3f s", v6, v45 - v11);
  }

  v15 = 0;
LABEL_8:

  objc_autoreleasePoolPop(v5);
  return v15;
}

- (id)_removeInBatchesWithOperationType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MBDriveBackupEngine *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v25;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal operationEnumeratorWithDomainManager:](self->_operationJournal, "operationEnumeratorWithDomainManager:", self->super._domainManager));
  v7 = objc_autoreleasePoolPush();
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
  if (v8)
  {
    v9 = (void *)v8;
    v25 = v5;
    do
    {
      if (objc_msgSend(v9, "type") != (_DWORD)v3)
        goto LABEL_10;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileID"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "driveBackupDir"));
        v13 = self;
        v14 = v3;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileID"));
        v16 = v6;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filenameWithPrefix"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v17));

        v6 = v16;
        v3 = v14;
        self = v13;
        v5 = v25;

        if (!v18)
          goto LABEL_13;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
        if (!v18)
        {
LABEL_13:
          v20 = v6;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveBackupEngine.m"), 2274, CFSTR("No file ID or path for remove operation"));

          v6 = v20;
        }
      }
      objc_msgSend(v5, "addObject:", v18);
      if (objc_msgSend(v5, "count") == (id)self->_batchSize)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _removeBatchWithPaths:](self, "_removeBatchWithPaths:", v5));
        if (v19)
        {
          v22 = v19;

          objc_autoreleasePoolPop(v7);
          goto LABEL_19;
        }
        objc_msgSend(v5, "removeAllObjects");
      }

LABEL_10:
      objc_autoreleasePoolPop(v7);
      v7 = objc_autoreleasePoolPush();
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
    }
    while (v9);
  }
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v5, "count"))
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _removeBatchWithPaths:](self, "_removeBatchWithPaths:", v5));
    if (!v22)
      objc_msgSend(v5, "removeAllObjects");
  }
  else
  {
    v22 = 0;
  }
LABEL_19:

  return v22;
}

- (id)_removeBatchWithPaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  MBDrive *drive;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v4 = a3;
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v35 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing batch of %lu items", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Removing batch of %lu items", objc_msgSend(v4, "count"));
  }

  drive = self->_drive;
  v32 = 0;
  v33 = 0;
  v9 = -[MBDrive removeItemsAtPaths:options:results:error:](drive, "removeItemsAtPaths:options:results:error:", v4, 0, &v33, &v32);
  v10 = v33;
  v11 = v32;
  v12 = 0;
  if ((v9 & 1) == 0)
  {
    if (+[MBError isError:withCode:](MBError, "isError:withCode:", v11, 2))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v14)
      {
        v15 = v14;
        v26 = v10;
        v27 = v4;
        v16 = 0;
        v17 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v19));
            v21 = +[MBError isError:withCode:](MBError, "isError:withCode:", v20, 4);
            if ((v21 & 1) == 0)
            {
              v23 = MBGetDefaultLog(v21, v22);
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v35 = v19;
                v36 = 2112;
                v37 = v20;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error removing \"%@\": %@", buf, 0x16u);
                _MBLog(CFSTR("ERROR"), "Error removing \"%@\": %@", v19, v20);
              }

              v16 = 1;
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        }
        while (v15);

        v4 = v27;
        if ((v16 & 1) != 0)
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v11, CFSTR("Error removing files")));
        else
          v12 = 0;
        v10 = v26;
      }
      else
      {

        v12 = 0;
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v11, CFSTR("Error removing files")));
    }
  }

  return v12;
}

- (id)_removeDeviceSnapshot
{
  uint64_t v3;
  NSObject *v4;
  MBManifestDB *snapshotManifestDB;
  unsigned __int8 v6;
  id v7;
  id v8;
  MBManifestDB *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v15;
  id v16;
  uint8_t buf[16];

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing device snapshot directory", buf, 2u);
    _MBLog(CFSTR("INFO"), "Removing device snapshot directory");
  }

  snapshotManifestDB = self->_snapshotManifestDB;
  if (snapshotManifestDB)
  {
    v16 = 0;
    v6 = -[MBManifestDB closeAndRemoveFileWithError:](snapshotManifestDB, "closeAndRemoveFileWithError:", &v16);
    v7 = v16;
    v8 = v7;
    if ((v6 & 1) == 0)
    {
      v13 = v7;
      v8 = v13;
      goto LABEL_10;
    }
    v9 = self->_snapshotManifestDB;
    self->_snapshotManifestDB = 0;

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
    v15 = 0;
    v12 = objc_msgSend(v10, "removeItemAtPath:error:", v11, &v15);
    v8 = v15;

    if ((v12 & 1) == 0)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v8, CFSTR("Error cleaning up snapshot")));
      goto LABEL_10;
    }
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (id)_removeOldBackup
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  MBDrive *drive;
  void *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = -[MBDriveBackupEngine movedOldBackup](self, "movedOldBackup");
  if (!v3)
    goto LABEL_6;
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine movedBackupName](self, "movedBackupName"));
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Removing old backup %@", buf, 0xCu);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine movedBackupName](self, "movedBackupName"));
    _MBLog(CFSTR("INFO"), "Removing old backup %@", v8);

  }
  drive = self->_drive;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine movedBackupName](self, "movedBackupName"));
  v13 = 0;
  LODWORD(drive) = -[MBDrive removeItemAtPath:options:error:](drive, "removeItemAtPath:options:error:", v10, 0, &v13);
  v11 = v13;

  if ((_DWORD)drive)
  {

LABEL_6:
    v11 = 0;
  }
  return v11;
}

- (id)_verifyBackupReloadingManifest:(BOOL)a3
{
  _BOOL4 v3;
  MBBackupHelper *backupHelper;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  __CFString *v16;
  __CFString *v17;
  BOOL v18;
  MBBackupHelper *v19;
  MBManifestDB *v20;
  __CFString *v21;
  MBManifestDB *backupManifestDB;
  __CFString *v23;
  void *v24;
  MBManifestDB *v25;
  unsigned __int8 v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  MBManifestDB *v49;
  unsigned int v50;
  __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const __CFString *v59;
  id v61;
  _QWORD v62[5];
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  id v67;
  uint8_t buf[4];
  const __CFString *v69;

  v3 = a3;
  backupHelper = self->_backupHelper;
  v67 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readStatusWithError:](backupHelper, "readStatusWithError:", &v67));
  v7 = (__CFString *)v67;
  v8 = v7;
  if (!v6)
  {
    v17 = v7;
LABEL_15:
    v8 = v17;
    v16 = v17;
    goto LABEL_54;
  }
  v9 = objc_msgSend(v6, "version");
  v11 = v10;
  v13 = MBGetDefaultLog(v9, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11 >= 3.3)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Verifying backup contents", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "Verifying backup contents");
    }

    if (self->_backupManifestDB)
      v18 = !v3;
    else
      v18 = 0;
    if (!v18)
    {
      v19 = self->_backupHelper;
      v66 = v8;
      v20 = (MBManifestDB *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestDatabaseWithError:](v19, "readBackupManifestDatabaseWithError:", &v66));
      v21 = v66;

      backupManifestDB = self->_backupManifestDB;
      self->_backupManifestDB = v20;

      if (v21)
      {
        v17 = v21;
        goto LABEL_15;
      }
      v8 = 0;
    }
    v23 = v8;
    v65 = v8;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeychainManager fetchLocalBackupPasswordAndReturnError:](MBKeychainManager, "fetchLocalBackupPasswordAndReturnError:", &v65));
    v8 = v65;

    if (+[MBError isError:withCode:](MBError, "isError:withCode:", v8, 4))
    {

      v8 = 0;
    }
    if (-[MBEngine encrypted](self, "encrypted"))
    {
      v25 = self->_backupManifestDB;
      v64 = v8;
      v26 = -[MBManifestDB setupEncryptionWithPassword:withError:](v25, "setupEncryptionWithPassword:withError:", v24, &v64);
      v27 = v64;

      if ((v26 & 1) == 0)
      {
        v39 = MBGetDefaultLog(v28, v29);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v27;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v27);
        }

        v41 = v27;
LABEL_51:
        v8 = v41;
        goto LABEL_52;
      }
      v8 = v27;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_backupManifestDB, "properties"));
    v31 = objc_msgSend(v30, "encrypted");

    if (v31)
    {
      if (v24)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_backupManifestDB, "properties"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "keybagData"));

        if (v35)
        {
          v63 = v8;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag unlockedKeyBagWithData:password:error:](MBKeyBag, "unlockedKeyBagWithData:password:error:", v35, v24, &v63));
          v37 = v63;

          if (!v36)
          {
            v8 = v37;

            v16 = v8;
            goto LABEL_53;
          }
          v8 = v37;
        }
        else
        {
          v36 = 0;
        }

        goto LABEL_36;
      }
      v38 = CFSTR("Backup properties encrypted but no password set");
    }
    else
    {
      if (!v24)
      {
LABEL_36:
        v42 = MBGetDefaultLog(v32, v33);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Getting contents of backup directory", buf, 2u);
          _MBLog(CFSTR("INFO"), "Getting contents of backup directory");
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "drive"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "driveBackupDir"));
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_10002A73C;
        v62[3] = &unk_1000D9518;
        v62[4] = self;
        v48 = objc_msgSend(v45, "enumerateContentsOfDirectoryAtPath:options:foundItem:", v47, 0, v62);

        if (!v8)
        {
          v49 = self->_backupManifestDB;
          v61 = 0;
          v50 = -[MBManifestDB hasUnverifiedFilesWithError:](v49, "hasUnverifiedFilesWithError:", &v61);
          v51 = (__CFString *)v61;
          v8 = v51;
          if (v50)
          {
            if (!v51)
            {
              v53 = MBGetDefaultLog(0, v52);
              v54 = objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Manifest references files that are not in the backup", buf, 2u);
                _MBLog(CFSTR("ERROR"), "Manifest references files that are not in the backup");
              }

              v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Manifest references files not in backup")));
              v8 = 0;
              goto LABEL_53;
            }
          }
          else
          {
            v55 = -[MBManifestDB unsetVerifiedFlags](self->_backupManifestDB, "unsetVerifiedFlags");
            v57 = MBGetDefaultLog(v55, v56);
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              if (v8)
                v59 = v8;
              else
                v59 = CFSTR("clean");
              *(_DWORD *)buf = 138412290;
              v69 = v59;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Finished verifying backup: %@", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Finished verifying backup: %@", v59);
            }

          }
        }
        v41 = v8;
        goto LABEL_51;
      }
      v38 = CFSTR("Backup password set but properties not encrypted");
    }
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, v38));
LABEL_52:
    v16 = v41;
LABEL_53:

    goto LABEL_54;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping verification of old format backup", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Skipping verification of old format backup");
  }

  v16 = 0;
LABEL_54:

  return v16;
}

- (BOOL)_shouldRetry
{
  id v3;

  v3 = -[NSMutableSet count](self->_modifiedDomains, "count");
  if (v3)
    LOBYTE(v3) = self->_retryCount == 0;
  return (char)v3;
}

- (BOOL)isFinalRetry
{
  return self->_retryCount == 1;
}

- (id)_retry
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  char **v8;
  unint64_t retryCount;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  MBDriveScript *v15;
  MBDriveScript *driveScript;
  MBProgressDrive *v17;
  MBDriveScript *v18;
  void *v19;
  void *v20;
  MBDrive *v21;
  MBDrive *drive;
  MBManifestDB *snapshotManifestDB;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  MBManifestDB *v34;
  unsigned __int8 v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  unsigned int v41;
  id v42;
  uint64_t v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  MBAppManager *appManager;
  void *v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  MBManifestDB *v58;
  uint64_t v59;
  MBManifestDB *v60;
  MBManifestDB *v61;
  MBManifestDB *v62;
  MBManifestDB *v63;
  void *v64;
  unsigned __int8 v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  MBManifestDB *v73;
  NSObject *v74;
  int v75;
  uint64_t v77;
  uint64_t v78;
  MBBackupOperationJournal **p_operationJournal;
  void *v80;
  id obj;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  id v86;
  uint8_t buf[4];
  NSObject *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  void *v92;

  v3 = objc_autoreleasePoolPush();
  ++self->_retryCount;
  v4 = -[MBDebugContext setInt:forName:](self->super._debugContext, "setInt:forName:");
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = &selRef_initWithDecoder_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    retryCount = self->_retryCount;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_modifiedDomains, "allObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 134218498;
    v88 = retryCount;
    v89 = 1024;
    v90 = 1;
    v91 = 2112;
    v92 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying backup (attempt %lu of %d, modified domains: {%@})", buf, 0x1Cu);

    v12 = self->_retryCount;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_modifiedDomains, "allObjects"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));
    v8 = &selRef_initWithDecoder_;
    _MBLog(CFSTR("DEFAULT"), "Retrying backup (attempt %lu of %d, modified domains: {%@})", v12, 1, v14);

  }
  -[MBProgress current](self->_progress, "current");
  -[MBProgress setTotal:](self->_progress, "setTotal:");
  v15 = -[MBDriveScript initWithProgress:]([MBDriveScript alloc], "initWithProgress:", self->_progress);
  driveScript = self->_driveScript;
  self->_driveScript = v15;

  v17 = [MBProgressDrive alloc];
  v18 = self->_driveScript;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "drive"));
  v21 = -[MBProgressDrive initWithScript:delegate:](v17, "initWithScript:delegate:", v18, v20);
  drive = self->_drive;
  self->_drive = v21;

  snapshotManifestDB = self->_snapshotManifestDB;
  if (snapshotManifestDB)
  {
    v80 = v3;
    v24 = 0;
    goto LABEL_5;
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotPropertiesPath](self, "_deviceSnapshotPropertiesPath"));
  v86 = 0;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[MBProperties propertiesWithFile:error:](MBProperties, "propertiesWithFile:error:", v55, &v86));
  v57 = v86;

  if (!v56)
  {
    v68 = +[MBError isError:withCode:](MBError, "isError:withCode:", v57, 4);
    if ((v68 & 1) != 0
      || (v68 = +[MBError codeForNSError:](MBError, "codeForNSError:", v57), (_DWORD)v68 == 4))
    {
      v70 = MBGetDefaultLog(v68, v69);
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Snapshot properties not found", buf, 2u);
        _MBLog(CFSTR("INFO"), "Snapshot properties not found");
      }

      v72 = v57;
      v57 = 0;
    }
    else
    {
      v77 = MBGetDefaultLog(v68, v69);
      v72 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v57;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Error reading snapshot properties from device: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Error reading snapshot properties from device: %@", v57);
      }
    }
    goto LABEL_50;
  }
  v58 = [MBManifestDB alloc];
  v59 = objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotManifestDatabasePath](self, "_deviceSnapshotManifestDatabasePath"));
  v60 = -[MBManifestDB initWithPath:properties:domainManager:](v58, "initWithPath:properties:domainManager:", v59, v56, self->super._domainManager);
  v61 = self->_snapshotManifestDB;
  self->_snapshotManifestDB = v60;

  v62 = self->_snapshotManifestDB;
  v85 = v57;
  LOBYTE(v59) = -[MBManifestDB openWithError:](v62, "openWithError:", &v85);
  v24 = v85;

  if ((v59 & 1) == 0)
  {
    v73 = self->_snapshotManifestDB;
    self->_snapshotManifestDB = 0;

    v74 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 101, CFSTR("Error opening snapshot manifest database from device")));
LABEL_51:
    v53 = (uint64_t)v74;

    objc_autoreleasePoolPop(v3);
    return (id)v53;
  }
  if (!-[MBEngine encrypted](self, "encrypted"))
  {
    v80 = v3;
    goto LABEL_45;
  }
  v63 = self->_snapshotManifestDB;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine password](self, "password"));
  v84 = v24;
  v65 = -[MBManifestDB setupEncryptionWithPassword:withError:](v63, "setupEncryptionWithPassword:withError:", v64, &v84);
  v57 = v84;

  if ((v65 & 1) == 0)
  {
    v78 = MBGetDefaultLog(v66, v67);
    v72 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v57;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v57);
    }
LABEL_50:

    v74 = v57;
    v24 = v74;
    goto LABEL_51;
  }
  v80 = v3;
  v24 = v57;
  v8 = &selRef_initWithDecoder_;
LABEL_45:

  snapshotManifestDB = self->_snapshotManifestDB;
LABEL_5:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](snapshotManifestDB, "properties"));
  objc_msgSend(v25, "removeAllContainers");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self->_snapshotManifestDB, "properties"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MBAppManager allContainers](self->super._appManager, "allContainers"));
  objc_msgSend(v26, "addContainersFromArray:", v27);

  obj = (id)objc_claimAutoreleasedReturnValue(+[MBBackupOperationJournal backupOperationJournalWithBatchSize:](MBBackupOperationJournal, "backupOperationJournalWithBatchSize:", self->_batchSize));
  p_operationJournal = &self->_operationJournal;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperationJournal operationEnumeratorWithDomainManager:](self->_operationJournal, "operationEnumeratorWithDomainManager:", self->super._domainManager));
  v29 = objc_autoreleasePoolPush();
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nextObject"));
  if (v30)
  {
    v31 = (void *)v30;
    while (1)
    {
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fileID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "domain"));
      if (!v33
        || !objc_msgSend(*(id *)((char *)&self->super.super.isa + *((int *)v8 + 910)), "containsObject:", v33))
      {
        if (objc_msgSend(v31, "type") != 2)
          objc_msgSend(obj, "addOperation:", v31);
        goto LABEL_22;
      }
      v34 = self->_snapshotManifestDB;
      v83 = v24;
      v35 = -[MBManifestDB flagsForFileID:error:](v34, "flagsForFileID:error:", v32, &v83);
      v36 = v83;

      if (v36)
      {
        v54 = v36;

        objc_autoreleasePoolPop(v29);
        v52 = 0;
        v53 = (uint64_t)v54;
        goto LABEL_40;
      }
      v37 = objc_msgSend(v31, "type");
      if ((_DWORD)v37 != 2)
        break;
      v8 = &selRef_initWithDecoder_;
      if (v32)
        goto LABEL_17;
LABEL_21:
      v24 = 0;
LABEL_22:

      objc_autoreleasePoolPop(v29);
      v29 = objc_autoreleasePoolPush();
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nextObject"));
      if (!v31)
        goto LABEL_23;
    }
    v37 = objc_msgSend(v31, "type");
    v24 = 0;
    v8 = &selRef_initWithDecoder_;
    if ((_DWORD)v37 != 3 || !v32)
      goto LABEL_22;
LABEL_17:
    if ((v35 & 0x10) == 0)
    {
      v39 = MBGetDefaultLog(v37, v38);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v41 = objc_msgSend(v31, "type");
        *(_DWORD *)buf = 138412546;
        v88 = v32;
        v89 = 1024;
        v90 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Already uploaded: %@ (operation: %d)", buf, 0x12u);
        _MBLog(CFSTR("DEBUG"), "Already uploaded: %@ (operation: %d)", v32, objc_msgSend(v31, "type"));
      }

      v42 = -[MBManifestDB setFlags:mask:forFileID:](self->_snapshotManifestDB, "setFlags:mask:forFileID:", 200, -17, v32);
    }
    goto LABEL_21;
  }
LABEL_23:
  objc_autoreleasePoolPop(v29);
  -[MBBackupOperationJournal close](*p_operationJournal, "close");
  objc_storeStrong((id *)p_operationJournal, obj);
  v43 = *((int *)v8 + 910);
  objc_storeStrong((id *)&self->_domainsToScan, *(id *)((char *)&self->super.super.isa + v43));
  v44 = (objc_class *)objc_alloc_init((Class)NSMutableSet);
  v45 = *(Class *)((char *)&self->super.super.isa + v43);
  *(Class *)((char *)&self->super.super.isa + v43) = v44;

  v48 = MBGetDefaultLog(v46, v47);
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Refreshing installed apps", buf, 2u);
    _MBLog(CFSTR("INFO"), "Refreshing installed apps");
  }

  appManager = self->super._appManager;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
  v82 = v24;
  v52 = 1;
  v53 = (uint64_t)-[MBAppManager loadAppsWithPersona:safeHarbors:error:](appManager, "loadAppsWithPersona:safeHarbors:error:", v51, 1, &v82);
  v54 = v82;

  if ((v53 & 1) == 0)
  {
    v53 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v54, CFSTR("Error loading apps")));
    v52 = 0;
  }
LABEL_40:

  objc_autoreleasePoolPop(v80);
  if (!v52)
    return (id)v53;
  v75 = -[MBDebugContext intForName:](self->super._debugContext, "intForName:", CFSTR("SimulateCrashAfterRetrying"));
  if (v75 >= 1 && self->_retryCount >= v75)
    abort();
  return 0;
}

- (int)engineMode
{
  return 1;
}

- (id)properties
{
  return -[MBManifestDB properties](self->_snapshotManifestDB, "properties");
}

- (id)_deviceSnapshotDir
{
  void *v3;
  void *v4;
  void *v5;
  void *v8;

  if (!self->_uuid)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveBackupEngine.m"), 2593, CFSTR("UUID not initialized"));

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceCacheDir"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", self->_uuid));

  return v5;
}

- (id)_deviceSnapshotPropertiesPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.plist")));

  return v3;
}

- (id)_deviceSnapshotManifestDatabasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _deviceSnapshotDir](self, "_deviceSnapshotDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.db")));

  return v3;
}

- (id)_fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  if (-[MBEngine encrypted](self, "encrypted"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keybag"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBEncryptedFileHandle encryptedFileHandleForBackupWithPath:keybag:error:](MBEncryptedFileHandle, "encryptedFileHandleForBackupWithPath:keybag:error:", v10, v12, a6));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBBasicFileHandle basicFileHandleWithPath:flags:mode:error:](MBBasicFileHandle, "basicFileHandleWithPath:flags:mode:error:", v10, v8, v7, a6));
  }

  return v13;
}

- (id)_compactSQLiteDatabaseAtPath:(id)a3 file:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  if (!v8)
    sub_100087860();
  v10 = v9;
  if (!v9)
    sub_100087888();
  if (!a5)
    sub_1000878B0();
  v11 = -[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine");
  if (v11)
  {
    v13 = 0;
  }
  else
  {
    v14 = MBTemporaryPath(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = objc_opt_class(self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_sync_enter(v16);
    v17 = +[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:toPath:error:](MBSQLiteFileHandle, "compactSQLiteDatabaseAtPath:toPath:error:", v8, v13, a5);
    objc_sync_exit(v16);

    v18 = v13;
    if ((v17 & 1) != 0)
      goto LABEL_8;
  }
  v19 = MBTemporaryPath(v11, v12);
  v18 = (id)objc_claimAutoreleasedReturnValue(v19);

  v20 = objc_opt_class(self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_sync_enter(v21);
  v22 = +[MBSQLiteFileHandle copySQLiteFileAtPath:toPath:error:](MBSQLiteFileHandle, "copySQLiteFileAtPath:toPath:error:", v8, v18, a5);
  objc_sync_exit(v21);

  if (!v22)
  {
    v23 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v18 = v18;
  v23 = v18;
LABEL_10:

  return v23;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  MBDriveBackupEngine *v11;
  NSMutableDictionary *uploadOperationsByPath;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  id v31;
  MBBackupFileHandle *v32;
  unsigned int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  MBError *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v57;
  id v58;
  id v59;
  id v60;
  char v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = self;
  objc_sync_enter(v11);
  uploadOperationsByPath = v11->_uploadOperationsByPath;
  v13 = objc_retainAutorelease(v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(v13, "fileSystemRepresentation")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](uploadOperationsByPath, "objectForKeyedSubscript:", v14));

  objc_sync_exit(v11);
  if (!v15)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MBDriveBackupEngine.m"), 2651, CFSTR("No operation found for path: %@"), v13);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "volumeMountPoint"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine mountedSnapshotTracker](v11, "mountedSnapshotTracker"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "snapshotMountPointForVolumeMountPoint:", v57));

  if (!v18)
    sub_1000878D8();
  v19 = objc_msgSend(v13, "hasPrefix:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rootPath"));
  v21 = v20;
  if (v19)
  {
    v22 = MBSnapshotPathFromLivePath(v20, v18, v57);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", (char *)objc_msgSend(v23, "length") + 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v16, v18, v24));

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", (char *)objc_msgSend(v20, "length") + 1));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v16, 0, v23));
  }

  if (!v25)
    sub_100087900();
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _fileHandleWithPath:flags:mode:error:](v11, "_fileHandleWithPath:flags:mode:error:", v13, v7, v6, a6));
  if (v26)
  {
    if (-[MBDriveBackupEngine isFinalRetry](v11, "isFinalRetry")
      || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path")),
          v28 = sub_10006BA40(v27),
          v27,
          v28))
    {
      v29 = 0;
      goto LABEL_12;
    }
    v61 = 0;
    v60 = 0;
    v34 = +[MBSQLiteFileHandle isSQLiteFileHandle:result:error:](MBSQLiteFileHandle, "isSQLiteFileHandle:result:error:", v26, &v61, &v60);
    v35 = v60;
    v29 = v35;
    if (!v34)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v35);
      objc_msgSend(v26, "closeWithError:", 0);
      goto LABEL_34;
    }
    if (v61)
    {
      v59 = v35;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _compactSQLiteDatabaseAtPath:file:error:](v11, "_compactSQLiteDatabaseAtPath:file:error:", v13, v25, &v59));
      v54 = v59;

      if (!v55)
      {
        v44 = MBGetDefaultLog(v36, v37);
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absolutePath"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fileID"));
          *(_DWORD *)buf = 138412802;
          v63 = v46;
          v64 = 2112;
          v65 = v47;
          v66 = 2112;
          v67 = v54;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to compact/copy SQLite database at %@ (%@): %@", buf, 0x20u);

          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absolutePath"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fileID"));
          _MBLog(CFSTR("ERROR"), "Failed to compact/copy SQLite database at %@ (%@): %@", v48, v49, v54);

        }
        -[MBDriveBackupEngine fileModifiedWhileUploadingFile:reason:](v11, "fileModifiedWhileUploadingFile:reason:", v25, CFSTR("Couldn't compact SQLite file"));
        if (a6)
          *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 9, v13, CFSTR("Couldn't compact SQLite file")));
        objc_msgSend(v26, "closeWithError:", 0);
        v29 = v54;
        goto LABEL_34;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](v11, "settingsContext"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "plugins"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectEnumerator"));

      v41 = sub_100039C90(v11, v40, "backingUpSQLiteFileCopyAtPath:temporaryPath:", (uint64_t)v13, (uint64_t)v55);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

      if (v42)
      {
        objc_msgSend(v26, "closeWithError:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v43, "removeItemAtPath:error:", v55, 0);

        if (a6)
          *a6 = objc_retainAutorelease(v42);

        v29 = v42;
        goto LABEL_34;
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine _fileHandleWithPath:flags:mode:error:](v11, "_fileHandleWithPath:flags:mode:error:", v55, 256, 0, a6));
      if (!v50)
      {
        objc_msgSend(v26, "closeWithError:", 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v52, "removeItemAtPath:error:", v55, 0);

        v29 = v55;
LABEL_34:

        v32 = 0;
        goto LABEL_19;
      }
      -[MBDebugContext setFlag:](v11->super._debugContext, "setFlag:", CFSTR("CopiedSQLiteFile"));
      v51 = objc_claimAutoreleasedReturnValue(+[MBSQLiteFileHandle SQLiteFileHandleWithOriginalFileHandle:copiedFileHandle:](MBSQLiteFileHandle, "SQLiteFileHandleWithOriginalFileHandle:copiedFileHandle:", v26, v50));

      v29 = 0;
      v32 = 0;
      v26 = (void *)v51;
      if (!v51)
        goto LABEL_20;
    }
LABEL_12:
    if (-[MBEngine encrypted](v11, "encrypted"))
    {
      v58 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "encryptionKeyWithError:", &v58));
      v31 = v58;

      if (!v30)
      {
        if (a6)
          *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 100, v31, CFSTR("Error getting encryption key for file: %@"), v13));
        objc_msgSend(v26, "closeWithError:", 0);

        v32 = 0;
        goto LABEL_18;
      }
      objc_msgSend(v25, "setEncryptionKey:", v30);

    }
    else
    {
      v31 = v29;
    }
    v32 = -[MBBackupFileHandle initWithEngine:fileHandle:file:]([MBBackupFileHandle alloc], "initWithEngine:fileHandle:file:", v11, v26, v25);

LABEL_18:
    v26 = v31;
LABEL_19:

    goto LABEL_20;
  }
  v32 = 0;
LABEL_20:

  return v32;
}

- (BOOL)_uploadStatusToDriveWithSnapshotState:(int)a3 error:(id *)a4
{
  uint64_t v5;
  unsigned int v7;
  uint64_t v8;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  MBDrive *drive;
  void *v18;
  void *v19;
  unsigned int v20;
  MBDebugContext *debugContext;
  void *v22;
  uint8_t buf[4];
  void *v25;

  v5 = *(_QWORD *)&a3;
  v7 = -[MBStatus backupState](self->_status, "backupState");
  if (!(_DWORD)v5 || v7 == 2)
    v8 = -[MBStatus backupState](self->_status, "backupState");
  else
    v8 = 2;
  v10 = (_DWORD)v5 != 3 && self->_fullBackup;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBStatus status](MBStatus, "status"));
  objc_msgSend(v11, "setUuid:", self->_uuid);
  objc_msgSend(v11, "setBackupState:", v8);
  objc_msgSend(v11, "setSnapshotState:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v11, "setDate:", v12);

  v13 = objc_msgSend(v11, "setFullBackup:", v10);
  v15 = MBGetDefaultLog(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Writing status to drive: %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Writing status to drive: %@", v11);
  }

  drive = self->_drive;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "driveBackupStatusPath"));
  v20 = objc_msgSend(v11, "writeToDrive:path:error:", drive, v19, a4);

  if (v20)
  {
    debugContext = self->super._debugContext;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MBStatus stringWithSnapshotState:](MBStatus, "stringWithSnapshotState:", v5));
    -[MBDebugContext setValue:forName:](debugContext, "setValue:forName:", v22, CFSTR("LastStatusWrittenName"));

  }
  else if (a4)
  {
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", *a4, CFSTR("Error writing status")));
  }

  return v20;
}

- (BOOL)isModifiedSince:(int64_t)a3 reason:(id *)a4
{
  int64_t maximumModificationTime;
  BOOL v5;

  maximumModificationTime = self->_maximumModificationTime;
  if (maximumModificationTime)
    v5 = maximumModificationTime < a3;
  else
    v5 = 0;
  if (!v5 || time(0) < a3)
    return 0;
  if (a4)
    *a4 = CFSTR("mod time changed");
  return 1;
}

- (BOOL)_isModifiedWithFileDescriptor:(int)a3 reason:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int *v11;
  stat v13;
  uint8_t buf[4];
  int v15;

  memset(&v13, 0, sizeof(v13));
  v6 = fstat(a3, &v13);
  if (!(_DWORD)v6)
    return -[MBDriveBackupEngine isModifiedSince:reason:](self, "isModifiedSince:reason:", v13.st_mtimespec.tv_sec, a4);
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = *__error();
    *(_DWORD *)buf = 67109120;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error stat'ing file descriptor: %{errno}d", buf, 8u);
    v11 = __error();
    _MBLog(CFSTR("ERROR"), "Error stat'ing file descriptor: %{errno}d", *v11);
  }

  return 0;
}

- (id)_addBackupPathsNotInManifestDB:(id)a3 operationType:(int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void **v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t, void *, void *);
  void *v22;
  MBDriveBackupEngine *v23;
  id v24;
  uint64_t *v25;
  int v26;
  uint8_t buf[16];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100024970;
  v32 = sub_100024980;
  v33 = 0;
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Searching backup contents for removed regular files", buf, 2u);
    _MBLog(CFSTR("INFO"), "Searching backup contents for removed regular files");
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "drive"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine settingsContext](self, "settingsContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "driveBackupDir"));
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10002C1DC;
  v22 = &unk_1000D9630;
  v23 = self;
  v14 = v6;
  v24 = v14;
  v25 = &v28;
  v26 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enumerateContentsOfDirectoryAtPath:options:foundItem:", v13, 0, &v19));

  if ((+[MBError isError:withCode:](MBError, "isError:withCode:", v15, 4, v19, v20, v21, v22, v23) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v17 = (void *)v29[5];
    if (!v17)
      v17 = v15;
    v16 = v17;
  }

  _Block_object_dispose(&v28, 8);
  return v16;
}

- (BOOL)cancel
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDriveBackupEngine;
  v3 = -[MBEngine cancel](&v6, "cancel");
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveBackupEngine scanner](self, "scanner"));
    objc_msgSend(v4, "cancel");

  }
  return v3;
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

- (MBManifestDB)backupManifestDB
{
  return self->_backupManifestDB;
}

- (MBManifestDB)snapshotManifestDB
{
  return self->_snapshotManifestDB;
}

- (MBProgress)progress
{
  return self->_progress;
}

- (int64_t)maximumModificationTime
{
  return self->_maximumModificationTime;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)concurrentUploadBatchCount
{
  return self->_concurrentUploadBatchCount;
}

- (void)setConcurrentUploadBatchCount:(unint64_t)a3
{
  self->_concurrentUploadBatchCount = a3;
}

- (unint64_t)uploadSize
{
  return self->_uploadSize;
}

- (void)setUploadSize:(unint64_t)a3
{
  self->_uploadSize = a3;
}

- (unint64_t)uploadFileCount
{
  return self->_uploadFileCount;
}

- (void)setUploadFileCount:(unint64_t)a3
{
  self->_uploadFileCount = a3;
}

- (unint64_t)uploadSizeExcludingHardlinksAndClones
{
  return self->_uploadSizeExcludingHardlinksAndClones;
}

- (void)setUploadSizeExcludingHardlinksAndClones:(unint64_t)a3
{
  self->_uploadSizeExcludingHardlinksAndClones = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (BOOL)movedOldBackup
{
  return self->_movedOldBackup;
}

- (void)setMovedOldBackup:(BOOL)a3
{
  self->_movedOldBackup = a3;
}

- (NSString)movedBackupName
{
  return self->_movedBackupName;
}

- (void)setMovedBackupName:(id)a3
{
  objc_storeStrong((id *)&self->_movedBackupName, a3);
}

- (void)setPrefixDirectories:(id)a3
{
  objc_storeStrong((id *)&self->_prefixDirectories, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (MBFileScanner)scanner
{
  return (MBFileScanner *)objc_getProperty(self, a2, 296, 1);
}

- (void)setScanner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (MBMountedSnapshotTracker)mountedSnapshotTracker
{
  return self->_mountedSnapshotTracker;
}

- (void)setMountedSnapshotTracker:(id)a3
{
  objc_storeStrong((id *)&self->_mountedSnapshotTracker, a3);
}

- (NSMutableSet)inodeCache
{
  return self->_inodeCache;
}

- (void)setInodeCache:(id)a3
{
  objc_storeStrong((id *)&self->_inodeCache, a3);
}

- (NSMutableSet)cloneIDCache
{
  return self->_cloneIDCache;
}

- (void)setCloneIDCache:(id)a3
{
  objc_storeStrong((id *)&self->_cloneIDCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloneIDCache, 0);
  objc_storeStrong((id *)&self->_inodeCache, 0);
  objc_storeStrong((id *)&self->_mountedSnapshotTracker, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_prefixDirectories, 0);
  objc_storeStrong((id *)&self->_movedBackupName, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_uploadOperationsByPath, 0);
  objc_storeStrong((id *)&self->_modifiedDomains, 0);
  objc_storeStrong((id *)&self->_operationJournal, 0);
  objc_storeStrong((id *)&self->_domainsToScan, 0);
  objc_storeStrong((id *)&self->_snapshotManifestDB, 0);
  objc_storeStrong((id *)&self->_backupManifestDB, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_backupHelper, 0);
  objc_storeStrong((id *)&self->_drive, 0);
  objc_storeStrong((id *)&self->_driveScript, 0);
}

@end
