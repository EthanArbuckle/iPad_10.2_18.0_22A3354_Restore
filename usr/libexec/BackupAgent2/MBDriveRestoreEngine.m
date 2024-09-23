@implementation MBDriveRestoreEngine

+ (id)restoreEngineWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v5;
  id v6;
  MBDriveRestoreEngine *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MBDriveRestoreEngine initWithSettingsContext:debugContext:]([MBDriveRestoreEngine alloc], "initWithSettingsContext:debugContext:", v6, v5);

  return v7;
}

- (MBDriveRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  MBDriveRestoreEngine *v11;
  void *v12;
  int v13;
  MBProgress *v14;
  MBProgress *progress;
  MBDriveScript *v16;
  MBDriveScript *script;
  MBProgressDrive *v18;
  MBDriveScript *v19;
  void *v20;
  void *v21;
  MBProgressDrive *v22;
  MBDrive *drive;
  MBBackupHelper *v24;
  MBBackupHelper *backupHelper;
  NSMutableDictionary *v26;
  NSMutableDictionary *regularFileIDsByInodeNumber;
  NSMutableSet *v28;
  NSMutableSet *restoredAppBundleIDs;
  void *v30;
  void *v31;
  void *v32;
  MBAnalyticsEvent *v33;
  void *v35;
  void *v36;
  objc_super v37;
  id v38;

  v6 = a3;
  v38 = 0;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", &v38));
  v9 = v38;
  if (!v8)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MBDriveRestoreEngine initWithSettingsContext:debugContext:]"));
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MBDriveRestoreEngine.m"), 81, CFSTR("Unable to obtain personal persona for restore engine: %@"), v9);

  }
  v10 = objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", v8);
  v37.receiver = self;
  v37.super_class = (Class)MBDriveRestoreEngine;
  v11 = -[MBEngine initWithSettingsContext:debugContext:domainManager:](&v37, "initWithSettingsContext:debugContext:domainManager:", v6, v7, v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](v11, "settingsContext"));
    if (objc_msgSend(v12, "isDeviceTransfer"))
      v13 = 4;
    else
      v13 = 1;
    v11->_engineType = v13;

    v14 = objc_alloc_init(MBProgress);
    progress = v11->_progress;
    v11->_progress = v14;

    v16 = -[MBDriveScript initWithProgress:]([MBDriveScript alloc], "initWithProgress:", v11->_progress);
    script = v11->_script;
    v11->_script = v16;

    v18 = [MBProgressDrive alloc];
    v19 = v11->_script;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](v11, "settingsContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "drive"));
    v22 = -[MBProgressDrive initWithScript:delegate:](v18, "initWithScript:delegate:", v19, v21);
    drive = v11->_drive;
    v11->_drive = &v22->super;

    v24 = -[MBBackupHelper initWithSettingsContext:domainManager:]([MBBackupHelper alloc], "initWithSettingsContext:domainManager:", v6, v11->super._domainManager);
    backupHelper = v11->_backupHelper;
    v11->_backupHelper = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    regularFileIDsByInodeNumber = v11->_regularFileIDsByInodeNumber;
    v11->_regularFileIDsByInodeNumber = v26;

    v28 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    restoredAppBundleIDs = v11->_restoredAppBundleIDs;
    v11->_restoredAppBundleIDs = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MBEngine stringForEngineType:](MBEngine, "stringForEngineType:", -[MBDriveRestoreEngine engineType](v11, "engineType")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MBEngine stringForEngineMode:](MBEngine, "stringForEngineMode:", -[MBDriveRestoreEngine engineMode](v11, "engineMode")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.MobileBackup"), v30, v31));

    v33 = -[MBAnalyticsEvent initWithEventName:]([MBAnalyticsEvent alloc], "initWithEventName:", v32);
    -[MBEngine setAnalyticsEvent:](v11, "setAnalyticsEvent:", v33);

    objc_msgSend(v10, "setDelegate:", v11);
  }

  return v11;
}

- (int)engineMode
{
  return 2;
}

- (int)restoreType
{
  return 1;
}

- (id)properties
{
  return -[MBManifestLike properties](self->_manifest, "properties");
}

- (MBDriveSettingsContext)settingsContext
{
  return (MBDriveSettingsContext *)self->super._settingsContext;
}

- (BOOL)isIPod
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "targetDeviceClass"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("iPod"));

  return v4;
}

- (BOOL)isRestoringToSameDevice
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v11;
  void *v12;

  if (!-[MBEngine isRestoreEngine](self, "isRestoreEngine"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 127, CFSTR("Not a restore engine"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine properties](self, "properties"));

  if (!v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 128, CFSTR("Properties not set"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine properties](self, "properties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceID"));
  v7 = MBDeviceUDID_Legacy();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  return v9;
}

- (BOOL)encrypted
{
  MBManifestLike *manifest;
  void *v4;
  unsigned __int8 v5;
  void *v8;

  manifest = self->_manifest;
  if (!manifest)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 133, CFSTR("Manifest not loaded yet"));

    manifest = self->_manifest;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike properties](manifest, "properties"));
  v5 = objc_msgSend(v4, "encrypted");

  return v5;
}

- (BOOL)shouldVerifyDigests
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDebugContext valueForName:](self->super._debugContext, "valueForName:", CFSTR("VerifyDigests")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (MBManifest)manifest
{
  MBManifestLike *manifest;
  void *v6;

  manifest = self->_manifest;
  if (!manifest)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 143, CFSTR("No manifest yet"));

    manifest = self->_manifest;
  }
  return (MBManifest *)manifest;
}

- (BOOL)hasManifest
{
  return self->_manifest != 0;
}

- (MBKeyBag)keybag
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keybag"));

  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 152, CFSTR("No keybag yet"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keybag"));

  return (MBKeyBag *)v7;
}

- (id)restore
{
  void *v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  MBDebugContext *debugContext;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  double v48;
  __int16 v49;
  void *v50;

  v3 = objc_autoreleasePoolPush();
  v4 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v8 = MBGetDefaultLog(v4, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
    v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceIdentifier")));
    *(_DWORD *)buf = 138412290;
    v48 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting restore from %@", buf, 0xCu);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceIdentifier"));
    _MBLog(CFSTR("DEFAULT"), "Starting restore from %@", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v15 = objc_msgSend(v14, "shouldRestoreSystemFiles");

  if ((v15 & 1) == 0)
  {
    v18 = MBGetDefaultLog(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not restoring system files", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "Not restoring system files");
    }

  }
  MBLogDeviceProperties();
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  objc_msgSend(v20, "log");

  v23 = MBGetDefaultLog(v21, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    debugContext = self->super._debugContext;
    *(_DWORD *)buf = 138412290;
    v48 = *(double *)&debugContext;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "DebugContext: %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "DebugContext: %@", self->super._debugContext);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _restore](self, "_restore"));
  v28 = MBGetDefaultLog(v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v30 = v29;
  if (v26)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v31 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v26)));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v26));
      *(_DWORD *)buf = 138543618;
      v48 = v31;
      v49 = 2112;
      v50 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Restore error - %{public}@, %@", buf, 0x16u);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v26));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v26));
      _MBLog(CFSTR("ERROR"), "Restore error - %{public}@, %@", v33, v34);

    }
    v35 = -[MBDriveRestoreEngine _cleanup](self, "_cleanup");
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 134217984;
      v48 = v36 - v6;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Finished restore in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      _MBLog(CFSTR("DEFAULT"), "Finished restore in %0.3f s", v37 - v6);
    }

    v38 = objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _cleanup](self, "_cleanup"));
    v26 = (void *)v38;
    if (v38)
    {
      v40 = MBGetDefaultLog(v38, v39);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v26)));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v26));
        *(_DWORD *)buf = 138543618;
        v48 = v42;
        v49 = 2112;
        v50 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Restore error - %{public}@, %@", buf, 0x16u);

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v26));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v26));
        _MBLog(CFSTR("ERROR"), "Restore error - %{public}@, %@", v44, v45);

      }
    }
  }
  objc_autoreleasePoolPop(v3);
  return v26;
}

- (id)_restore
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _preconditions](self, "_preconditions"));
  if (!v3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _setUp](self, "_setUp"));
    if (!v3)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy notifyPluginsStartingRestoreWithEngine:](self->_restorePolicy, "notifyPluginsStartingRestoreWithEngine:", self));
      if (!v3)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _resume](self, "_resume"));
        if (!v3)
        {
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _prepare](self, "_prepare"));
          if (!v3)
          {
            v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _restoreContent](self, "_restoreContent"));
            if (!v3)
            {
              v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _annotate](self, "_annotate"));
              if (!v3)
              {
                v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _restoreDirectoryModificationTimes](self, "_restoreDirectoryModificationTimes"));
                if (!v3)
                {
                  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy notifyPluginsEndingRestoreWithEngine:](self->_restorePolicy, "notifyPluginsEndingRestoreWithEngine:", self));
                  if (!v3)
                  {
                    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _moveRestoreDirs](self, "_moveRestoreDirs"));
                    if (!v3)
                      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _postconditions](self, "_postconditions"));
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (id)_setUp
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  MBAppManager *v9;
  MBAppManager *appManager;
  MBAppManager *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  MBTemporaryDirectory *v17;
  MBTemporaryDirectory *sharedTemporaryDirectory;
  MBTemporaryDirectory *v19;
  MBTemporaryDirectory *userTemporaryDirectory;
  MBRestorePolicy *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  MBRestorePolicy *v28;
  MBRestorePolicy *restorePolicy;
  id v30;
  void *v32;
  uint64_t v33;
  MBAppManager *v34;
  id v35;
  id v36;
  uint8_t buf[16];

  if (-[MBDebugContext isFlagSet:](self->super._debugContext, "isFlagSet:", CFSTR("SimulateCrash")))
    abort();
  v3 = MBAcquireRestoreLock();
  if ((v3 & 1) == 0)
    return (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Acquiring restore lock failed")));
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initializing app manager", buf, 2u);
    _MBLog(CFSTR("INFO"), "Initializing app manager");
  }

  v7 = objc_alloc((Class)MBAppManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v9 = (MBAppManager *)objc_msgSend(v7, "initWithSettingsContext:", v8);
  appManager = self->super._appManager;
  self->super._appManager = v9;

  v11 = self->super._appManager;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
  v36 = 0;
  LOBYTE(v11) = -[MBAppManager loadAppsWithPersona:safeHarbors:error:](v11, "loadAppsWithPersona:safeHarbors:error:", v12, 1, &v36);
  v13 = v36;

  if ((v11 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
    v35 = v13;
    v15 = objc_msgSend(v14, "createRestoreDirectoriesWithError:", &v35);
    v16 = v35;

    if ((v15 & 1) != 0)
    {
      v17 = (MBTemporaryDirectory *)objc_claimAutoreleasedReturnValue(+[MBTemporaryDirectory sharedTemporaryDirectoryIdentifiedBy:](MBTemporaryDirectory, "sharedTemporaryDirectoryIdentifiedBy:", CFSTR("drive-restore-engine")));
      sharedTemporaryDirectory = self->_sharedTemporaryDirectory;
      self->_sharedTemporaryDirectory = v17;

      v19 = (MBTemporaryDirectory *)objc_claimAutoreleasedReturnValue(+[MBTemporaryDirectory userTemporaryDirectoryForPersona:identifiedBy:](MBTemporaryDirectory, "userTemporaryDirectoryForPersona:identifiedBy:", v14, CFSTR("drive-restore-engine")));
      userTemporaryDirectory = self->_userTemporaryDirectory;
      self->_userTemporaryDirectory = v19;

      v21 = [MBRestorePolicy alloc];
      v34 = self->super._appManager;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "plugins"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine properties](self, "properties"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "buildVersion"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
      v27 = objc_msgSend(v26, "shouldRestoreSystemFiles");
      BYTE2(v33) = 0;
      BYTE1(v33) = -[MBEngine restoresPrimaryAccount](self, "restoresPrimaryAccount");
      LOBYTE(v33) = v27;
      v28 = -[MBRestorePolicy initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:](v21, "initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:", v14, self, v34, v23, 0, v25, v33);
      restorePolicy = self->_restorePolicy;
      self->_restorePolicy = v28;

      v30 = 0;
    }
    else
    {
      v30 = v16;
    }

    return v30;
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v13, CFSTR("Error initializing app manager")));

    return v32;
  }
}

- (id)_cleanup
{
  MBManifestLike *manifest;
  MBTemporaryDirectory *sharedTemporaryDirectory;
  MBTemporaryDirectory *userTemporaryDirectory;

  manifest = self->_manifest;
  if (manifest)
    -[MBManifestLike closeWithError:](manifest, "closeWithError:", 0);
  -[MBTemporaryDirectory dispose](self->_sharedTemporaryDirectory, "dispose");
  sharedTemporaryDirectory = self->_sharedTemporaryDirectory;
  self->_sharedTemporaryDirectory = 0;

  -[MBTemporaryDirectory dispose](self->_userTemporaryDirectory, "dispose");
  userTemporaryDirectory = self->_userTemporaryDirectory;
  self->_userTemporaryDirectory = 0;

  MBReleaseRestoreLock();
  return 0;
}

- (id)_temporaryPathForFile:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  int *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v6 = objc_msgSend(v5, "shouldRestoreToSharedVolume");
  v7 = &OBJC_IVAR___MBDriveRestoreEngine__userTemporaryDirectory;
  if (v6)
    v7 = &OBJC_IVAR___MBDriveRestoreEngine__sharedTemporaryDirectory;
  v8 = *(id *)((char *)&self->super.super.isa + *v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v11));

  return v12;
}

- (id)endWithError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MBRestorePolicy notifyPluginsEndedRestoreWithEngine:error:](self->_restorePolicy, "notifyPluginsEndedRestoreWithEngine:error:", self, v4));
  v7 = (void *)v5;
  if (!v4 && v5)
  {
    v8 = MBGetDefaultLog(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v7));
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Restore error - %@", buf, 0xCu);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v7));
      _MBLog(CFSTR("ERROR"), "Restore error - %@", v11);

    }
    v4 = v7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine analyticsEvent](self, "analyticsEvent"));
  objc_msgSend(v12, "submit");

  return v4;
}

- (id)_preconditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  uint64_t v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  id v43;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceIdentifier"));

  if (!v5)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 339, CFSTR("Source identifier missing for restore"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetIdentifier"));
  v8 = MBDeviceUDID_Legacy();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "targetIdentifier"));
    v39 = MBDeviceUDID_Legacy();
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 340, CFSTR("Restore target device ID %@ doesn't match actual device ID %@"), v38, v40);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v12 = objc_msgSend(v11, "isEphemeralMultiUser");

  if (v12)
    return (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 22, CFSTR("Backup disabled for this device")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "manager"));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = objc_alloc_init((Class)MBManager);
  v18 = v17;

  v41 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "restoreStateWithError:", &v41));
  v20 = v41;
  if (v19)
  {
    v21 = objc_msgSend(v19, "state");
    v23 = (int)v21;
    if (v21 >= 7 || ((0x71u >> (char)v21) & 1) == 0)
    {
      v24 = MBGetDefaultLog(v21, v22);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Restore from iTunes Backup is unavailable while an iCloud Restore is in progress (%d)", buf, 8u);
        _MBLog(CFSTR("ERROR"), "Restore from iTunes Backup is unavailable while an iCloud Restore is in progress (%d)", v23);
      }

      v26 = CFSTR("Restore from iTunes Backup is unavailable while an iCloud Restore is in progress");
      v27 = 25;
LABEL_24:
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v27, v26));
      goto LABEL_25;
    }
  }
  else
  {
    v28 = +[MBError isError:withCode:](MBError, "isError:withCode:", v20, 210);
    v29 = (char)v28;
    v31 = MBGetDefaultLog(v28, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    if ((v29 & 1) == 0)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v20;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to fetch iCloud Restore state: %{public}@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to fetch iCloud Restore state: %{public}@", v20);
      }

      v26 = CFSTR("Failed to determine iCloud Restore state");
      v27 = 1;
      goto LABEL_24;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No iCloud account", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "No iCloud account");
    }

  }
  v34 = 0;
LABEL_25:

  return v34;
}

- (id)_postconditions
{
  -[MBDriveScript finishedPerforming](self->_script, "finishedPerforming");
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
  NSObject *v11;
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  MBDebugContext *debugContext;
  void *v34;
  MBDebugContext *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  id v49;
  uint8_t buf[4];
  double v51;
  __int16 v52;
  void *v53;

  v3 = objc_autoreleasePoolPush();
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting to retrieve previous backup status", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Starting to retrieve previous backup status");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  backupHelper = self->_backupHelper;
  v49 = 0;
  v10 = (MBStatus *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readStatusWithError:](backupHelper, "readStatusWithError:", &v49));
  v11 = v49;
  status = self->_status;
  self->_status = v10;

  v13 = self->_status;
  if (!v13)
  {
LABEL_10:
    v29 = +[MBError isError:withCode:](MBError, "isError:withCode:", v11, 4);
    if (!(_DWORD)v29)
    {
      v38 = objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v11, CFSTR("Error reading status")));
LABEL_22:
      v39 = v38;
      goto LABEL_23;
    }
    v31 = MBGetDefaultLog(v29, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "No status exists", buf, 2u);
      _MBLog(CFSTR("INFO"), "No status exists");
    }

    -[MBDebugContext setFlag:](self->super._debugContext, "setFlag:", CFSTR("StatusNotFound"));
    v28 = CFSTR("No status exists in backup");
    goto LABEL_16;
  }
  -[MBStatus version](v13, "version");
  if (v14 < 2.4)
  {
    v15 = self->_status;
    if (v15)
    {
      v16 = -[MBStatus version](v15, "version");
      if (v18 < 2.4)
      {
        v19 = MBGetDefaultLog(v16, v17);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[MBStatus version](self->_status, "version");
          v22 = v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MBStatus snapshotStateName](self->_status, "snapshotStateName"));
          *(_DWORD *)buf = 134218242;
          v51 = v22;
          v52 = 2112;
          v53 = v23;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Status: version=%0.1f, name=%@", buf, 0x16u);

          -[MBStatus version](self->_status, "version");
          v25 = v24;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBStatus snapshotStateName](self->_status, "snapshotStateName"));
          _MBLog(CFSTR("DEFAULT"), "Status: version=%0.1f, name=%@", v25, v26);

        }
        -[MBDebugContext setFlag:](self->super._debugContext, "setFlag:", CFSTR("OldStatusFound"));
        -[MBStatus version](self->_status, "version");
        v48 = v27;
        v28 = CFSTR("Unsupported backup status version: %0.1f");
        goto LABEL_20;
      }
    }
    goto LABEL_10;
  }
  debugContext = self->super._debugContext;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBStatus backupStateName](self->_status, "backupStateName"));
  -[MBDebugContext setValue:forName:](debugContext, "setValue:forName:", v34, CFSTR("BackupState"));

  v35 = self->super._debugContext;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MBStatus snapshotStateName](self->_status, "snapshotStateName"));
  -[MBDebugContext setValue:forName:](v35, "setValue:forName:", v36, CFSTR("SnapshotState"));

  -[MBDebugContext setInt:forName:](self->super._debugContext, "setInt:forName:", -[MBStatus isFullBackup](self->_status, "isFullBackup"), CFSTR("StatusIsFullBackup"));
  if (-[MBStatus isBackupEmpty](self->_status, "isBackupEmpty"))
  {
    v28 = CFSTR("Backup state is empty");
LABEL_16:
    v37 = 204;
LABEL_21:
    v38 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v37, v28, v48));
    goto LABEL_22;
  }
  if (-[MBStatus isBackupOld](self->_status, "isBackupOld"))
  {
    v28 = CFSTR("Backup is in old format");
LABEL_20:
    v37 = 203;
    goto LABEL_21;
  }
  if (!-[MBStatus isBackupNew](self->_status, "isBackupNew"))
  {
    v48 = -[MBStatus backupState](self->_status, "backupState");
    v28 = CFSTR("Invalid backup state: %d");
LABEL_28:
    v37 = 205;
    goto LABEL_21;
  }
  if (-[MBStatus isUploading](self->_status, "isUploading"))
  {
    v41 = objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _resumeAfterFailureUploading](self, "_resumeAfterFailureUploading"));
    goto LABEL_35;
  }
  if (-[MBStatus isMoving](self->_status, "isMoving"))
  {
    v41 = objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _resumeAfterFailureMoving](self, "_resumeAfterFailureMoving"));
    goto LABEL_35;
  }
  if (-[MBStatus isRemoving](self->_status, "isRemoving"))
  {
    v41 = objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _resumeAfterFailureRemoving](self, "_resumeAfterFailureRemoving"));
    goto LABEL_35;
  }
  if (!-[MBStatus isFinished](self->_status, "isFinished"))
  {
    v48 = -[MBStatus snapshotState](self->_status, "snapshotState");
    v28 = CFSTR("Invalid snapshot state: %d");
    goto LABEL_28;
  }
  v41 = objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _resumeAfterSuccess](self, "_resumeAfterSuccess"));
LABEL_35:
  v42 = (void *)v41;

  if (v42)
  {
    v38 = v42;
    v11 = v38;
    goto LABEL_22;
  }
  v43 = -[MBManifestLike buildIndexFromDatabaseIfNeeded](self->_manifest, "buildIndexFromDatabaseIfNeeded");
  v45 = MBGetDefaultLog(v43, v44);
  v11 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134217984;
    v51 = v46 - v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Finished retrieving previous backup status in %0.3f s", buf, 0xCu);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    _MBLog(CFSTR("DEFAULT"), "Finished retrieving previous backup status in %0.3f s", v47 - v8);
  }
  v39 = 0;
LABEL_23:

  objc_autoreleasePoolPop(v3);
  return v39;
}

- (id)_resumeAfterFailureUploading
{
  MBBackupHelper *backupHelper;
  MBManifestLike *v4;
  id v5;
  MBManifestLike *manifest;
  id v7;
  void *v8;
  id v10;

  backupHelper = self->_backupHelper;
  v10 = 0;
  v4 = (MBManifestLike *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestWithError:](backupHelper, "readBackupManifestWithError:", &v10));
  v5 = v10;
  manifest = self->_manifest;
  self->_manifest = v4;

  if (v5)
  {
    if (+[MBError isError:withCode:](MBError, "isError:withCode:", v5, 4))
      v7 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 204, CFSTR("Initial backup failed while uploading files")));
    else
      v7 = v5;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_resumeAfterFailureMoving
{
  uint64_t v3;
  NSObject *v4;
  MBDrive *drive;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  MBBackupHelper *backupHelper;
  id *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  MBBackupHelper *v20;
  MBManifestLike *v21;
  id v22;
  MBManifestLike *v23;
  unsigned __int8 v24;
  MBBackupHelper *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  id v29;
  MBManifestLike *v30;
  MBManifestLike *manifest;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Getting contents of snapshot", buf, 2u);
    _MBLog(CFSTR("INFO"), "Getting contents of snapshot");
  }

  drive = self->_drive;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "driveSnapshotDir"));
  v60 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDrive contentsOfDirectoryAtPath:options:error:](drive, "contentsOfDirectoryAtPath:options:error:", v7, 0, &v60));
  v9 = v60;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

  if (!v9)
  {
    v13 = objc_msgSend(v11, "containsObject:", CFSTR("Manifest.plist"));
    backupHelper = self->_backupHelper;
    if ((v13 & 1) != 0)
    {
      v59 = 0;
      v15 = (id *)&v59;
      v16 = objc_claimAutoreleasedReturnValue(-[MBBackupHelper readSnapshotPropertiesWithError:](backupHelper, "readSnapshotPropertiesWithError:", &v59));
    }
    else
    {
      v58 = 0;
      v15 = (id *)&v58;
      v16 = objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupPropertiesWithError:](backupHelper, "readBackupPropertiesWithError:", &v58));
    }
    v17 = (void *)v16;
    v18 = *v15;
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      if (!objc_msgSend(v17, "hasManifestDB"))
      {
        v24 = objc_msgSend(v11, "containsObject:", CFSTR("Manifest.mbdb"));
        v25 = self->_backupHelper;
        if ((v24 & 1) != 0)
        {
          v56 = 0;
          v26 = (id *)&v56;
          v27 = objc_claimAutoreleasedReturnValue(-[MBBackupHelper readSnapshotDatabaseWithError:](v25, "readSnapshotDatabaseWithError:", &v56));
        }
        else
        {
          v55 = 0;
          v26 = (id *)&v55;
          v27 = objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupDatabaseWithError:](v25, "readBackupDatabaseWithError:", &v55));
        }
        v28 = (void *)v27;
        v29 = *v26;
        v9 = v29;
        if (v29)
        {
          v12 = v29;
        }
        else
        {
          v49 = v28;
          v30 = (MBManifestLike *)objc_claimAutoreleasedReturnValue(+[MBManifest manifestWithProperties:database:databaseIndex:](MBManifest, "manifestWithProperties:database:databaseIndex:", v17, v28, 0));
          manifest = self->_manifest;
          self->_manifest = v30;

          v32 = -[MBManifestLike buildIndexFromDatabaseIfNeeded](self->_manifest, "buildIndexFromDatabaseIfNeeded");
          v34 = MBGetDefaultLog(v32, v33);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Determining which files remain in the snapshot", buf, 2u);
            _MBLog(CFSTR("DEFAULT"), "Determining which files remain in the snapshot");
          }

          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v50 = v11;
          v36 = v11;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v52;
            do
            {
              for (i = 0; i != v38; i = (char *)i + 1)
              {
                if (*(_QWORD *)v52 != v39)
                  objc_enumerationMutation(v36);
                v41 = objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i)));
                v43 = (void *)v41;
                if (v41)
                {
                  v44 = MBGetDefaultLog(v41, v42);
                  v45 = objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v62 = v43;
                    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "In snapshot: %@", buf, 0xCu);
                    _MBLog(CFSTR("INFO"), "In snapshot: %@", v43);
                  }

                  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike databaseIndex](self->_manifest, "databaseIndex"));
                  v47 = objc_msgSend(v46, "setFlags:forFileID:", 8, v43);

                }
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
            }
            while (v38);
          }

          v12 = 0;
          v11 = v50;
          v28 = v49;
          v9 = 0;
        }

        goto LABEL_35;
      }
      v20 = self->_backupHelper;
      v57 = 0;
      v21 = (MBManifestLike *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readSnapshotManifestDatabaseWithError:](v20, "readSnapshotManifestDatabaseWithError:", &v57));
      v22 = v57;
      v23 = self->_manifest;
      self->_manifest = v21;

      if (!v22)
      {
        v9 = 0;
        v12 = 0;
        goto LABEL_35;
      }
      v19 = v22;
    }
    v9 = v19;
    v12 = v19;
LABEL_35:

    goto LABEL_36;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v9, CFSTR("Error getting contents of snapshot")));
LABEL_36:

  return v12;
}

- (id)_resumeAfterFailureRemoving
{
  MBBackupHelper *backupHelper;
  MBManifestLike *v4;
  id v5;
  MBManifestLike *manifest;
  id v7;
  id v9;

  backupHelper = self->_backupHelper;
  v9 = 0;
  v4 = (MBManifestLike *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestWithError:](backupHelper, "readBackupManifestWithError:", &v9));
  v5 = v9;
  manifest = self->_manifest;
  self->_manifest = v4;

  if (v5)
    v7 = v5;

  return v5;
}

- (id)_resumeAfterSuccess
{
  MBBackupHelper *backupHelper;
  MBManifestLike *v4;
  id v5;
  MBManifestLike *manifest;
  id v7;
  id v9;

  backupHelper = self->_backupHelper;
  v9 = 0;
  v4 = (MBManifestLike *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestWithError:](backupHelper, "readBackupManifestWithError:", &v9));
  v5 = v9;
  manifest = self->_manifest;
  self->_manifest = v4;

  if (v5)
    v7 = v5;

  return v5;
}

- (id)_prepare
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  double v15;
  double v16;
  uint8_t buf[4];
  double v18;

  v3 = objc_autoreleasePoolPush();
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting to prepare for restore", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Starting to prepare for restore");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _checkCompatibility](self, "_checkCompatibility"));
  if (v9
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _prepareEncryption](self, "_prepareEncryption"))) != 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy notifyPluginsPreparingRestoreWithEngine:](self->_restorePolicy, "notifyPluginsPreparingRestoreWithEngine:", self))) != 0|| (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _prepareProgress](self, "_prepareProgress"))) != 0|| (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _prepareFreeSpace](self, "_prepareFreeSpace"))) != 0|| (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _prepareCopyBackup](self, "_prepareCopyBackup"))) != 0)
  {
    v11 = v9;
    v12 = v11;
  }
  else
  {
    v14 = MBGetDefaultLog(0, v10);
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 134217984;
      v18 = v15 - v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Finished preparing for restore in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      _MBLog(CFSTR("DEFAULT"), "Finished preparing for restore in %0.3f s", v16 - v8);
    }
    v12 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (id)_checkCompatibility
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  MBDrive *drive;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  id v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  void *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sourceIdentifier"));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Info.plist")));
  v7 = MBGetDefaultLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = CFSTR("Info.plist");
    v34 = 2112;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loading %{public}@ at %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Loading %{public}@ at %@", CFSTR("Info.plist"), v5);
  }

  drive = self->_drive;
  v31 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBInfo infoWithDrive:path:error:](MBInfo, "infoWithDrive:path:error:", drive, v5, &v31));
  v11 = v31;
  v13 = v11;
  if (v10)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "productVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike properties](self->_manifest, "properties"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "requiredProductVersion"));

    v19 = MBGetDefaultLog(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v33 = CFSTR("Info.plist");
      v34 = 2114;
      v35 = v14;
      v36 = 2114;
      v37 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@ - productVersion:%{public}@, requiredProductVersion:%{public}@", buf, 0x20u);
      _MBLog(CFSTR("DEFAULT"), "Loaded %{public}@ - productVersion:%{public}@, requiredProductVersion:%{public}@", CFSTR("Info.plist"), v14, v16);
    }

    if (v14)
    {
      v21 = MBProductVersion();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = MBIsRestoreCompatible(v22, v14, v16, 0);

      v26 = 0;
      if ((v23 & 1) == 0)
      {
        v27 = MBGetDefaultLog(v24, v25);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Refusing to restore from an incompatible backup", buf, 2u);
          _MBLog(CFSTR("ERROR"), "Refusing to restore from an incompatible backup");
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 203, CFSTR("Backup is from an incompatible OS version")));
      }
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v29 = MBGetDefaultLog(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v33 = CFSTR("Info.plist");
      v34 = 2112;
      v35 = v5;
      v36 = 2112;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ at %@: %@", buf, 0x20u);
      _MBLog(CFSTR("ERROR"), "Failed to fetch %{public}@ at %@: %@", CFSTR("Info.plist"), v5, v13);
    }
    v26 = 0;
  }

  return v26;
}

- (id)_prepareEncryption
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  MBManifestLike *manifest;
  unsigned __int8 v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  uint64_t v38;
  NSObject *v39;
  const __CFString *v40;
  __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  __CFString *v47;
  __CFString *v48;
  id v49;
  uint8_t buf[4];
  const __CFString *v51;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike properties](self->_manifest, "properties"));
  v4 = objc_msgSend(v3, "encrypted");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));

  if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
  {
    if (v4)
      sub_100088030();
    if (v6)
      sub_100088058();
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  manifest = self->_manifest;
  v49 = 0;
  v8 = -[MBManifestLike setupEncryptionWithPassword:withError:](manifest, "setupEncryptionWithPassword:withError:", v6, &v49);
  v9 = (__CFString *)v49;
  v11 = v9;
  if ((v8 & 1) == 0)
  {
    v12 = MBGetDefaultLog(v9, v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to setup manifest encryption: %@", v11);
    }

    v14 = v11;
    v15 = v14;
    goto LABEL_35;
  }
LABEL_11:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keybag"));

  if (!v17)
  {
    v25 = MBGetDefaultLog(v18, v19);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Decoding and unlocking backup keybag from manifest", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "Decoding and unlocking backup keybag from manifest");
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike properties](self->_manifest, "properties"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "keybagData"));

    if (v28)
    {
      v47 = v11;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag unlockedKeyBagWithData:password:error:](MBKeyBag, "unlockedKeyBagWithData:password:error:", v28, v6, &v47));
      v15 = v47;

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
      objc_msgSend(v30, "setKeybag:", v29);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "keybag"));

      if (v32)
      {

        goto LABEL_22;
      }
      if (+[MBError isError:withCode:](MBError, "isError:withCode:", v15, 207))
      {
        v44 = CFSTR("Invalid password when restoring encrypted backup");
        v45 = 207;
      }
      else
      {
        v44 = CFSTR("Error decoding keybag");
        v45 = 1;
      }
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v45, v15, v44));
    }
    else
    {
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("No keybag in manifest")));
      v15 = v11;
    }

    goto LABEL_39;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keybag"));
  v22 = objc_msgSend(v21, "isUnlocked");

  if ((v22 & 1) == 0)
  {
    v33 = MBGetDefaultLog(v23, v24);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Unlocking backup keybag from manifest", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "Unlocking backup keybag from manifest");
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "keybag"));
    v48 = v11;
    v37 = objc_msgSend(v36, "unlockWithPassword:error:", v6, &v48);
    v15 = v48;

    if ((v37 & 1) != 0)
      goto LABEL_22;
    if (+[MBError isError:withCode:](MBError, "isError:withCode:", v15, 207))
    {
      v42 = CFSTR("Invalid password when restoring encrypted backup");
      v43 = 207;
    }
    else
    {
      v42 = CFSTR("Error decoding keybag");
      v43 = 1;
    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v43, v15, v42));
LABEL_35:
    v41 = v14;
    goto LABEL_39;
  }
  v15 = v11;
LABEL_22:
  v38 = MBGetDefaultLog(v23, v24);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v40 = CFSTR("encrypted");
    else
      v40 = CFSTR("unencrypted");
    *(_DWORD *)buf = 138412290;
    v51 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Backup is %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Backup is %@", v40);
  }

  -[MBDebugContext setBool:forName:](self->super._debugContext, "setBool:forName:", -[MBDriveRestoreEngine encrypted](self, "encrypted"), CFSTR("IsEncrypted"));
  v41 = 0;
LABEL_39:

  return v41;
}

- (id)_prepareProgress
{
  uint64_t v4;
  NSObject *v5;
  MBManifestLike *manifest;
  id v7;
  uint64_t v8;
  uint64_t v9;
  MBDriveScript *script;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t totalDownloadCount;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  double v23;
  _QWORD v25[11];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t v48[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  unint64_t v53;

  v4 = MBGetDefaultLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Calculating expected duration", buf, 2u);
    _MBLog(CFSTR("INFO"), "Calculating expected duration");
  }

  *(_QWORD *)buf = 0;
  v43 = buf;
  v44 = 0x3032000000;
  v45 = sub_100033CDC;
  v46 = sub_100033CEC;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  manifest = self->_manifest;
  v29 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100033CF4;
  v25[3] = &unk_1000D9700;
  v25[4] = self;
  v25[5] = buf;
  v25[9] = &v26;
  v25[10] = a2;
  v25[6] = &v38;
  v25[7] = &v34;
  v25[8] = &v30;
  v7 = -[MBManifestLike enumerateFiles:](manifest, "enumerateFiles:", v25);
  v9 = v39[3];
  if (v9)
  {
    script = self->_script;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToDownloadFilesWithCount:size:](MBDriveOperation, "operationToDownloadFilesWithCount:size:", v9, v35[3]));
    -[MBDriveScript addOperation:](script, "addOperation:", v11);

    ++v31[3];
  }
  v12 = MBGetDefaultLog(v7, v8);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v31[3];
    v15 = v27[3];
    totalDownloadCount = self->_totalDownloadCount;
    *(_DWORD *)v48 = 134218496;
    v49 = v14;
    v50 = 2048;
    v51 = v15;
    v52 = 2048;
    v53 = totalDownloadCount;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enqueued batches (%lld) of total files (%lld) total download (%lld)", v48, 0x20u);
    _MBLog(CFSTR("DEFAULT"), "Enqueued batches (%lld) of total files (%lld) total download (%lld)", v31[3], v27[3], self->_totalDownloadCount);
  }

  v19 = MBGetDefaultLog(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[MBProgress total](self->_progress, "total");
      *(_DWORD *)v48 = 134217984;
      v49 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Expected duration: %0.3f s", v48, 0xCu);
    }

    -[MBProgress total](self->_progress, "total");
    _MBLog(CFSTR("DEFAULT"), "Expected duration: %0.3f s", v23);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(buf, 8);

  return 0;
}

- (id)_prepareFreeSpace
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t totalDownloadSize;
  void *v14;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Checking free disk space", buf, 2u);
    _MBLog(CFSTR("INFO"), "Checking free disk space");
  }

  v5 = MBFreeDiskSpace();
  v7 = MBGetDefaultLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v17 = v5;
    v18 = 2048;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Free disk space on device: %llu (%{bytes}llu)", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Free disk space on device: %llu (%{bytes}llu)", v5, v5);
  }

  v9 = -[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine");
  if (v9 || v5 >= self->_totalDownloadSize)
  {
    v14 = 0;
  }
  else
  {
    v11 = MBGetDefaultLog(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      totalDownloadSize = self->_totalDownloadSize;
      *(_DWORD *)buf = 134218752;
      v17 = v5;
      v18 = 2048;
      v19 = v5;
      v20 = 2048;
      v21 = totalDownloadSize;
      v22 = 2048;
      v23 = totalDownloadSize;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Insufficient free disk space on device to restore: %llu (%{bytes}llu) < %llu (%{bytes}llu)", buf, 0x2Au);
      _MBLog(CFSTR("ERROR"), "Insufficient free disk space on device to restore: %llu (%{bytes}llu) < %llu (%{bytes}llu)", v5, v5, self->_totalDownloadSize, self->_totalDownloadSize);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 106, CFSTR("Insufficient free disk space on device to restore (%llu < %llu)"), v5, self->_totalDownloadSize));
  }
  return v14;
}

- (id)_prepareCopyBackup
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  MBDrive *drive;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  MBDrive *v28;
  unsigned __int8 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  unsigned int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  int v46;
  const __CFString *v47;
  double v49;
  void *v50;
  MBDriveScript *script;
  void *v52;
  MBDriveScript *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  double v67;
  double v68;
  MBDrive *v69;
  unsigned __int8 v70;
  id v71;
  id v72;
  double v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  MBDrive *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  unint64_t v99;
  id v100;
  unint64_t v101;
  double v102;
  id v103;
  uint8_t buf[4];
  double v105;
  __int16 v106;
  unint64_t v107;
  __int16 v108;
  int v109;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v4 = objc_msgSend(v3, "shouldCopyBackup");

  v7 = MBGetDefaultLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Not copying backup", buf, 2u);
      _MBLog(CFSTR("INFO"), "Not copying backup");
    }

    -[MBDriveScript beginPerforming](self->_script, "beginPerforming");
    v20 = 0;
    goto LABEL_31;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Copying backup", buf, 2u);
    _MBLog(CFSTR("INFO"), "Copying backup");
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "targetIdentifier"));

  v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Info.plist"))));
  v14 = MBGetDefaultLog(*(_QWORD *)&v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Decoding %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Decoding %@", *(_QWORD *)&v12);
  }

  drive = self->_drive;
  v103 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MBInfo infoWithDrive:path:error:](MBInfo, "infoWithDrive:path:error:", drive, *(_QWORD *)&v12, &v103));
  v18 = v103;
  if (v18)
  {
    v20 = v18;
    v21 = +[MBError isError:withCode:](MBError, "isError:withCode:", v18, 4);
    if ((_DWORD)v21)
    {
      v23 = MBGetDefaultLog(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "No backup info exists", buf, 2u);
        _MBLog(CFSTR("INFO"), "No backup info exists");
      }

      -[MBDriveScript beginPerforming](self->_script, "beginPerforming");
      v25 = 0;
      goto LABEL_29;
    }
    v47 = CFSTR("Error decoding backup info");
LABEL_28:
    v25 = objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v20, v47));
LABEL_29:
    v46 = 1;
    goto LABEL_30;
  }
  v26 = MBGetDefaultLog(0, v19);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Determining backup usage", buf, 2u);
    _MBLog(CFSTR("INFO"), "Determining backup usage");
  }

  v101 = 0;
  v102 = 0.0;
  v28 = self->_drive;
  v100 = 0;
  v29 = -[MBDrive usageOfDirectoryAtPath:count:size:options:error:](v28, "usageOfDirectoryAtPath:count:size:options:error:", v11, &v102, &v101, 0, &v100);
  v30 = v100;
  v20 = v30;
  if ((v29 & 1) == 0)
  {
    v47 = CFSTR("Error determining backup usage");
    goto LABEL_28;
  }
  v32 = MBGetDefaultLog(v30, v31);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Checking free disk space on drive", buf, 2u);
    _MBLog(CFSTR("INFO"), "Checking free disk space on drive");
  }

  v98 = v20;
  *(double *)&v99 = 0.0;
  v34 = -[MBDrive freeSpace:error:](self->_drive, "freeSpace:error:", &v99, &v98);
  v35 = v98;

  v38 = MBGetDefaultLog(v36, v37);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  v40 = v39;
  if (!v34)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v35)));
      *(_DWORD *)buf = 138412290;
      v105 = v49;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Error getting free space of drive: %@", buf, 0xCu);

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[MBError descriptionForError:](MBError, "descriptionForError:", v35));
      _MBLog(CFSTR("DEFAULT"), "Error getting free space of drive: %@", v50);

    }
    v43 = v101;
    goto LABEL_36;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v105 = *(double *)&v99;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%{bytes}llu of free disk space on drive", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "%{bytes}llu of free disk space on drive", v99);
  }

  v43 = v101;
  if (v99 >= v101 + 0x8000000)
  {
LABEL_36:
    v95 = v17;
    script = self->_script;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToC0pyItemWithCount:size:](MBDriveOperation, "operationToC0pyItemWithCount:size:", *(_QWORD *)&v102, v43));
    -[MBDriveScript insertOperation:atIndex:](script, "insertOperation:atIndex:", v52, 0);

    v53 = self->_script;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFileWithSize:](MBDriveOperation, "operationToUploadFileWithSize:", 0));
    -[MBDriveScript insertOperation:atIndex:](v53, "insertOperation:atIndex:", v54, 1);

    -[MBDriveScript beginPerforming](self->_script, "beginPerforming");
    v55 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v56 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v56, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
    v94 = (void *)v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "stringFromDate:", v55));
    v58 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v11, v57)));

    v61 = MBGetDefaultLog(v59, v60);
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v58;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Naming backup copy %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Naming backup copy %@", *(_QWORD *)&v58);
    }

    v65 = MBGetDefaultLog(v63, v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v105 = v102;
      v106 = 2048;
      v107 = v101;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Starting to copy backup with %ld files of size %{bytes}llu", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Starting to copy backup with %ld files of size %{bytes}llu", *(_QWORD *)&v102, v101);
    }

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v68 = v67;
    v69 = self->_drive;
    v97 = v35;
    v70 = -[MBDrive copyItemAtPath:toPath:options:error:](v69, "copyItemAtPath:toPath:options:error:", v11, *(_QWORD *)&v58, 0, &v97);
    v71 = v97;

    if ((v70 & 1) != 0)
    {
      v72 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v74 = v73;
      v76 = MBGetDefaultLog(v72, v75);
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = v74 - v68;
        *(_DWORD *)buf = 134218240;
        v105 = v78;
        v106 = 2048;
        v107 = (unint64_t)((double)v101 / v78);
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Finished copying backup in %0.3f s at %{bytes}llu/s", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), "Finished copying backup in %0.3f s at %{bytes}llu/s", *(_QWORD *)&v78, (unint64_t)((double)v101 / v78));
      }

      v81 = MBGetDefaultLog(v79, v80);
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Updating backup info", buf, 2u);
        _MBLog(CFSTR("INFO"), "Updating backup info");
      }

      objc_msgSend(v95, "setTargetIdentifier:", *(_QWORD *)&v58);
      v83 = objc_alloc_init((Class)NSDateFormatter);

      v84 = MBLocale();
      v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
      objc_msgSend(v83, "setLocale:", v85);

      objc_msgSend(v83, "setDateStyle:", 2);
      objc_msgSend(v83, "setTimeStyle:", 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "displayName"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "stringFromDate:", v94));
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v86, v87));
      objc_msgSend(v95, "setDisplayName:", v88);

      v89 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v58, "stringByAppendingPathComponent:", CFSTR("Info.plist"))));
      v91 = MBGetDefaultLog(*(_QWORD *)&v89, v90);
      v92 = objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v105 = v89;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "Writing %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Writing %@", *(_QWORD *)&v89);
      }

      v93 = self->_drive;
      v96 = v71;
      v25 = (uint64_t)objc_msgSend(v95, "writeToDrive:path:error:", v93, *(_QWORD *)&v89, &v96);
      v35 = v96;

      if ((v25 & 1) != 0)
      {
        v46 = 0;
      }
      else
      {
        v25 = objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v35, CFSTR("Error writing updated backup info")));
        v46 = 1;
      }

      v56 = v83;
    }
    else
    {
      v25 = objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v71, CFSTR("Error copying backup")));
      v46 = 1;
      v35 = v71;
    }
    v17 = v95;

    goto LABEL_53;
  }
  v44 = MBGetDefaultLog(v41, v42);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v105 = *(double *)&v99;
    v106 = 2048;
    v107 = v101;
    v108 = 1024;
    v109 = 0x8000000;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Skipping copying backup because there is not enough free disk space on the drive (%{bytes}llu < %{bytes}llu + %{bytes}d)", buf, 0x1Cu);
    _MBLog(CFSTR("DEFAULT"), "Skipping copying backup because there is not enough free disk space on the drive (%{bytes}llu < %{bytes}llu + %{bytes}d)", v99, v101, 0x8000000);
  }

  -[MBDriveScript beginPerforming](self->_script, "beginPerforming");
  v25 = 0;
  v46 = 1;
LABEL_53:
  v20 = v35;
LABEL_30:

  if (!v46)
LABEL_31:
    v25 = 0;

  return (id)v25;
}

- (id)_restoreContent
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t totalDownloadCount;
  unint64_t totalDownloadSize;
  double v10;
  double v11;
  MBManifestLike *manifest;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  double v29;
  unint64_t v30;
  _QWORD v32[11];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t v51[4];
  double v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  unint64_t v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v4 = objc_autoreleasePoolPush();
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    totalDownloadCount = self->_totalDownloadCount;
    totalDownloadSize = self->_totalDownloadSize;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = totalDownloadCount;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = totalDownloadSize;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting to restore %lu files of size %{bytes}llu", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Starting to restore %lu files of size %{bytes}llu", self->_totalDownloadCount, self->_totalDownloadSize);
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = sub_100033CDC;
  v59 = sub_100033CEC;
  v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100033CDC;
  v37 = sub_100033CEC;
  manifest = self->_manifest;
  v38 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100035258;
  v32[3] = &unk_1000D9700;
  v32[4] = self;
  v32[5] = &v33;
  v32[9] = &v39;
  v32[10] = a2;
  v32[6] = buf;
  v32[7] = &v47;
  v32[8] = &v43;
  v13 = -[MBManifestLike enumerateFiles:](manifest, "enumerateFiles:", v32);
  v14 = (void *)v34[5];
  if (v14)
  {
    v15 = v14;
  }
  else
  {
    v16 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
    if (v16)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _restoreRegularFiles:size:](self, "_restoreRegularFiles:size:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v48[3]));
      if (v15)
        goto LABEL_13;
      v16 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
      v44[3] += (uint64_t)v16;
      ++*((_QWORD *)v40 + 3);
    }
    v18 = MBGetDefaultLog(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v40[3];
      v21 = v44[3];
      v22 = self->_totalDownloadSize;
      *(_DWORD *)v51 = 134218496;
      v52 = v20;
      v53 = 2048;
      v54 = v21;
      v55 = 2048;
      v56 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Restored batches (%lld) of total files (%lld) of total %lld bytes", v51, 0x20u);
      _MBLog(CFSTR("DEFAULT"), "Restored batches (%lld) of total files (%lld) of total %lld bytes", *((_QWORD *)v40 + 3), v44[3], self->_totalDownloadSize);
    }

    v23 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v25 = v24;
    v27 = MBGetDefaultLog(v23, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v25 - v11;
      v30 = (unint64_t)((double)self->_totalDownloadSize / v29);
      *(_DWORD *)v51 = 134218240;
      v52 = v29;
      v53 = 2048;
      v54 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Finished restoring files in %0.3f s at %{bytes}llu/s", v51, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Finished restoring files in %0.3f s at %{bytes}llu/s", *(_QWORD *)&v29, (unint64_t)((double)self->_totalDownloadSize / v29));
    }

    v15 = 0;
  }
LABEL_13:
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(v4);
  return v15;
}

- (BOOL)_shouldRestoreContentWithFile:(id)a3 quiet:(BOOL)a4
{
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  unint64_t v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  char **v60;
  uint64_t v61;
  char *v62;
  void *v63;
  MBRestorePolicy *restorePolicy;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned __int8 v75;
  uint64_t v76;
  id v77;
  char *v78;
  void *v79;
  id v80;
  unint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  unsigned __int8 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  NSObject *v93;
  char *v94;
  void *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v105;
  objc_class *v106;
  const char *Name;
  void *v108;
  objc_class *v109;
  const char *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  NSObject *v115;
  BOOL v116;
  BOOL v117;
  id v118;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  uint8_t v133[128];
  uint8_t buf[4];
  const char *v135;
  __int16 v136;
  void *v137;
  _BYTE v138[128];

  v118 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v119 = v6;
  if ((objc_msgSend(v7, "shouldRestoreSystemFiles") & 1) != 0)
  {

  }
  else
  {
    v8 = objc_msgSend(v6, "isAppDomain");

    if ((v8 & 1) == 0)
    {
      v11 = v118;
      if (objc_msgSend(v6, "isSystemSharedContainerDomain")
        && -[MBRestorePolicy shouldAlwaysRestoreSystemSharedContainerDomain:](self->_restorePolicy, "shouldAlwaysRestoreSystemSharedContainerDomain:", v6))
      {
        v20 = 1;
        goto LABEL_95;
      }
      v117 = a4;
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "relativePath"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "pathComponents"));

      v69 = -[NSObject count](v13, "count");
      v70 = 0;
      do
      {
        v71 = objc_autoreleasePoolPush();
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject subarrayWithRange:](v13, "subarrayWithRange:", 0, v70));
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v72));

        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsOfSystemFilesToAlwaysRestore"));
        v75 = objc_msgSend(v74, "containsObject:", v73);

        objc_autoreleasePoolPop(v71);
        if ((v75 & 1) != 0)
        {
          v20 = 1;
          goto LABEL_94;
        }
        ++v70;
      }
      while (v70 <= (unint64_t)v69);
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsOfSystemFilesToAlwaysRestore"));
      v114 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v128, v138, 16);
      v115 = v13;
      if (v114)
      {
        v76 = *(_QWORD *)v129;
        v113 = *(_QWORD *)v129;
        do
        {
          v77 = 0;
          do
          {
            if (*(_QWORD *)v129 != v76)
              objc_enumerationMutation(v16);
            v78 = (char *)v77;
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1)
                                                                               + 8 * (_QWORD)v77), "pathComponents"));
            v80 = objc_msgSend(v79, "count");
            v81 = 0;
            do
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "subarrayWithRange:", 0, v81));
              v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v82));

              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "relativePath"));
              v85 = objc_msgSend(v84, "isEqualToString:", v83);

              if ((v85 & 1) != 0)
              {
                v20 = 1;
                goto LABEL_71;
              }
              ++v81;
            }
            while (v81 <= (unint64_t)v80);

            v77 = v78 + 1;
            v13 = v115;
            v6 = v119;
            v76 = v113;
          }
          while (v77 != v114);
          v114 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v128, v138, 16);
        }
        while (v114);
      }

      if (!v117)
      {
        v88 = MBGetDefaultLog(v86, v87);
        v16 = objc_claimAutoreleasedReturnValue(v88);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v89 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          *(_DWORD *)buf = 138412290;
          v135 = v89;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Not restoring because it's a system file: %@", buf, 0xCu);

          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          _MBLog(CFSTR("INFO"), "Not restoring because it's a system file: %@", v79);
          v20 = 0;
LABEL_71:

          v13 = v115;
          goto LABEL_92;
        }
LABEL_68:
        v20 = 0;
        goto LABEL_93;
      }
LABEL_69:
      v20 = 0;
      goto LABEL_94;
    }
  }
  v9 = objc_msgSend(v6, "isUninstalledAppDomain");
  v11 = v118;
  if ((_DWORD)v9)
  {
    if (!a4)
    {
      v12 = MBGetDefaultLog(v9, v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "relativePath"));
        *(_DWORD *)buf = 138412546;
        v135 = v14;
        v136 = 2112;
        v137 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not restoring because the app %@ isn't being restored: %@", buf, 0x16u);

        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "containerID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "relativePath"));
        _MBLog(CFSTR("INFO"), "Not restoring because the app %@ isn't being restored: %@", v16, v17);

        v6 = v119;
        goto LABEL_68;
      }
      goto LABEL_69;
    }
LABEL_10:
    v20 = 0;
    goto LABEL_95;
  }
  v18 = objc_msgSend(v6, "isPlaceholderAppDomain");
  if ((_DWORD)v18)
  {
    if (!a4)
    {
      v90 = MBGetDefaultLog(v18, v19);
      v13 = objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v91 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
        *(_DWORD *)buf = 138412290;
        v135 = v91;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not restoring because it's a placeholder app file: %@", buf, 0xCu);

        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
        _MBLog(CFSTR("INFO"), "Not restoring because it's a placeholder app file: %@", v16);
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    goto LABEL_10;
  }
  v116 = a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine properties](self, "properties"));
  v22 = objc_msgSend(v21, "hasCorruptSQLiteDBs");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "relativePath"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pathExtension"));

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v24 = MBSQLitePathExtensions();
    v16 = objc_claimAutoreleasedReturnValue(v24);
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v125;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v125 != v27)
            objc_enumerationMutation(v16);
          v29 = -[NSObject isEqualToString:](v13, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i));
          if ((_DWORD)v29)
          {
            v92 = MBGetDefaultLog(v29, v30);
            v93 = objc_claimAutoreleasedReturnValue(v92);
            v11 = v118;
            if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
            {
              v94 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
              *(_DWORD *)buf = 138412290;
              v135 = v94;
              _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Not restoring %@ because sqlite databases are corrupt in this backup", buf, 0xCu);

              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
              _MBLog(CFSTR("INFO"), "Not restoring %@ because sqlite databases are corrupt in this backup", v95);
LABEL_89:

            }
            goto LABEL_90;
          }
        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
      }
      while (v26);
    }

  }
  v11 = v118;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "relativePath"));
  v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "pathComponents"));

  v33 = -[NSObject count](v32, "count");
  v34 = 0;
  while (1)
  {
    v13 = v32;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject subarrayWithRange:](v32, "subarrayWithRange:", 0, v34));
    v16 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v35));

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "relativePathsNotToRestore"));
    v37 = objc_msgSend(v36, "containsObject:", v16);

    if (v37)
    {
      if (v116)
        goto LABEL_91;
      v96 = MBGetDefaultLog(v38, v39);
      v93 = objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        v97 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
        *(_DWORD *)buf = 138412290;
        v135 = v97;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Not restoring: %@", buf, 0xCu);

        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
        _MBLog(CFSTR("INFO"), "Not restoring: %@", v95);
        goto LABEL_89;
      }
      goto LABEL_90;
    }
    if (!-[MBDriveRestoreEngine isRestoringToSameDevice](self, "isRestoringToSameDevice"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "relativePathsNotToMigrate"));
      v41 = objc_msgSend(v40, "containsObject:", v16);

      if (v41)
      {
        if (v116)
          goto LABEL_91;
        v98 = MBGetDefaultLog(v42, v43);
        v93 = objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          v99 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          *(_DWORD *)buf = 138412290;
          v135 = v99;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Not restoring because this is a migrate: %@", buf, 0xCu);

          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          _MBLog(CFSTR("INFO"), "Not restoring because this is a migrate: %@", v95);
          goto LABEL_89;
        }
        goto LABEL_90;
      }
    }
    v6 = v119;
    if (-[MBDriveRestoreEngine isIPod](self, "isIPod"))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "relativePathsNotToRestoreToIPods"));
      v45 = objc_msgSend(v44, "containsObject:", v16);

      v6 = v119;
      if (v45)
      {
        if (v116)
          goto LABEL_68;
        v100 = MBGetDefaultLog(v46, v47);
        v93 = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          v101 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          *(_DWORD *)buf = 138412290;
          v135 = v101;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Not restoring because this is an iPod: %@", buf, 0xCu);

          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          _MBLog(CFSTR("INFO"), "Not restoring because this is an iPod: %@", v95);
          goto LABEL_89;
        }
        goto LABEL_90;
      }
    }
    if (!-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsNotToRestoreFromLocal"));
      v49 = objc_msgSend(v48, "containsObject:", v16);

      v6 = v119;
      if (v49)
      {
        if (v116)
          goto LABEL_68;
        v102 = MBGetDefaultLog(v50, v51);
        v93 = objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          v103 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          *(_DWORD *)buf = 138412290;
          v135 = v103;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Not restoring because this is a local restore: %@", buf, 0xCu);

          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          _MBLog(CFSTR("INFO"), "Not restoring because this is a local restore: %@", v95);
          goto LABEL_89;
        }
        goto LABEL_90;
      }
    }
    if (v34 >= (unint64_t)v33 || !objc_msgSend(v118, "isSymbolicLink"))
      goto LABEL_38;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", v34));
    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("..")) & 1) == 0)
    {

      goto LABEL_38;
    }
    v53 = objc_msgSend(v119, "shouldRestoreRelativeSymlinks");

    if ((v53 & 1) == 0)
      break;
LABEL_38:

    ++v34;
    v32 = v13;
    if (v34 > (unint64_t)v33)
    {
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "plugins"));

      v57 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
      if (!v57)
      {
        v20 = 1;
        goto LABEL_92;
      }
      v58 = v57;
      v59 = *(_QWORD *)v121;
      v60 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
LABEL_41:
      v61 = 0;
      v62 = v60[314];
      while (1)
      {
        if (*(_QWORD *)v121 != v59)
          objc_enumerationMutation(v16);
        v63 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v61);
        if ((objc_opt_respondsToSelector(v63, v62) & 1) != 0)
        {
          restorePolicy = self->_restorePolicy;
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
          LOBYTE(restorePolicy) = objc_msgSend(v63, "shouldRestoreContentWithPolicy:atPath:", restorePolicy, v65);

          if ((restorePolicy & 1) == 0)
            break;
        }
        if (v58 == (id)++v61)
        {
          v58 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
          v20 = 1;
          v60 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
          if (v58)
            goto LABEL_41;
          goto LABEL_79;
        }
      }
      if (v116)
      {
        v20 = 0;
LABEL_79:
        v11 = v118;
        goto LABEL_92;
      }
      v105 = MBGetDefaultLog(v66, v67);
      v93 = objc_claimAutoreleasedReturnValue(v105);
      v11 = v118;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        v106 = (objc_class *)objc_opt_class(v63);
        Name = class_getName(v106);
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
        *(_DWORD *)buf = 136446466;
        v135 = Name;
        v136 = 2112;
        v137 = v108;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Not restoring because it was refused by plugin %{public}s: %@", buf, 0x16u);

        v109 = (objc_class *)objc_opt_class(v63);
        v110 = class_getName(v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "absolutePath"));
        _MBLog(CFSTR("INFO"), "Not restoring because it was refused by plugin %{public}s: %@", v110, v111);

      }
      goto LABEL_90;
    }
  }
  if (v116)
    goto LABEL_91;
  v112 = MBGetDefaultLog(v54, v55);
  v93 = objc_claimAutoreleasedReturnValue(v112);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Not restoring because this is a relative symbolic link in a prohibited domain", buf, 2u);
    _MBLog(CFSTR("INFO"), "Not restoring because this is a relative symbolic link in a prohibited domain");
  }
LABEL_90:

LABEL_91:
  v20 = 0;
LABEL_92:
  v6 = v119;
LABEL_93:

LABEL_94:
LABEL_95:

  return v20;
}

- (id)_restoreRegularFiles:(id)a3 size:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  MBDrive *drive;
  unsigned __int8 v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  std::__fs::filesystem::path *v45;
  void *v46;
  std::__fs::filesystem::path *v47;
  id v48;
  uint64_t v49;
  id v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  std::__fs::filesystem::path *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  std::__fs::filesystem::path *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  char v77;
  uint64_t v78;
  void *j;
  const std::__fs::filesystem::path *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const __CFString *v86;
  uint64_t v87;
  void *k;
  void *v89;
  std::__fs::filesystem::path *v90;
  const std::__fs::filesystem::path *v91;
  void *v92;
  void *v93;
  MBRestorePolicy *restorePolicy;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  const std::__fs::filesystem::path *v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  std::__fs::filesystem::path *v103;
  const std::__fs::filesystem::path *v104;
  std::__fs::filesystem::path *v105;
  const std::__fs::filesystem::path *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  std::error_code *v112;
  uint64_t v113;
  uint64_t v114;
  int *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  NSObject *v120;
  void *v121;
  unsigned __int8 v122;
  std::error_code *v123;
  uint64_t v124;
  NSObject *v125;
  uint64_t v126;
  NSObject *v127;
  id v128;
  uint64_t v130;
  NSObject *v131;
  NSString *v132;
  void *v133;
  uint64_t v134;
  NSObject *v135;
  _BOOL4 v136;
  NSString *v137;
  void *v138;
  id v139;
  void *v140;
  void *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  void *v147;
  uint64_t v148;
  id v149;
  void *v150;
  uint64_t v151;
  id obj;
  void *v153;
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  uint64_t v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  uint8_t v174[128];
  uint8_t buf[4];
  const std::__fs::filesystem::path *v176;
  __int16 v177;
  unint64_t v178;
  __int16 v179;
  void *v180;
  __int16 v181;
  void *v182;
  _BYTE v183[128];
  _BYTE v184[128];
  const __CFString *v185;
  MBDriveRestoreEngine *v186;
  _BYTE v187[128];

  v6 = a3;
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v176 = (const std::__fs::filesystem::path *)objc_msgSend(v6, "count");
    v177 = 2048;
    v178 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Downloading %lu files of size %{bytes}llu", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "Downloading %lu files of size %{bytes}llu", objc_msgSend(v6, "count"), a4);
  }

  v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v187, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v171;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v171 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike databaseIndex](self->_manifest, "databaseIndex"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fileID"));
        v17 = objc_msgSend(v15, "flagsForFileID:error:", v16, 0);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
        v19 = v18;
        if ((v17 & 8) != 0)
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "driveSnapshotDir"));
        else
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "driveBackupDir"));
        v21 = (void *)v20;

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nonRedirectedDomain"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relativePath"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithDomain:relativePath:](MBFileID, "fileIDWithDomain:relativePath:", v22, v23));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike properties](self->_manifest, "properties"));
        if ((objc_msgSend(v25, "hasManifestDB") & 1) != 0)
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "filenameWithPrefix"));
        else
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "filename"));
        v27 = (void *)v26;

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingPathComponent:", v27));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _temporaryPathForFile:](self, "_temporaryPathForFile:", v14));
        objc_msgSend(v153, "setObject:forKeyedSubscript:", v29, v28);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v187, 16);
    }
    while (v11);
  }

  v185 = CFSTR("FileHandleFactory");
  v186 = self;
  v30 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1));
  drive = self->_drive;
  v168 = 0;
  v169 = 0;
  v142 = (void *)v30;
  v32 = -[MBDrive downloadFilesAtPaths:options:results:error:](drive, "downloadFilesAtPaths:options:results:error:", v153);
  v143 = 0;
  v33 = 0;
  v34 = v33;
  if ((v32 & 1) == 0)
  {
    v73 = v33;
    if (!+[MBError isError:withCode:](MBError, "isError:withCode:", v33, 2))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v73, CFSTR("Error downloading files")));
      v72 = v142;
      v34 = v73;
      goto LABEL_100;
    }
    v140 = v73;
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v74 = v143;
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v164, v184, 16);
    if (v75)
    {
      v76 = v75;
      v77 = 0;
      v78 = *(_QWORD *)v165;
      do
      {
        for (j = 0; j != v76; j = (char *)j + 1)
        {
          if (*(_QWORD *)v165 != v78)
            objc_enumerationMutation(v74);
          v80 = *(const std::__fs::filesystem::path **)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)j);
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", v80));
          v82 = +[MBError isError:withCode:](MBError, "isError:withCode:", v81, 105);
          if ((v82 & 1) != 0)
          {
            v77 = 1;
          }
          else
          {
            v84 = MBGetDefaultLog(v82, v83);
            v85 = objc_claimAutoreleasedReturnValue(v84);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v176 = v80;
              v177 = 2112;
              v178 = (unint64_t)v81;
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Error downloading \"%@\": %@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), "Error downloading \"%@\": %@", v80, v81);
            }

          }
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v164, v184, 16);
      }
      while (v76);

      if ((v77 & 1) != 0)
      {
        v86 = CFSTR("No space left on device");
        v87 = 106;
LABEL_94:
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v87, v86));
        v72 = v142;
        v34 = v140;
        goto LABEL_100;
      }
    }
    else
    {

    }
    v86 = CFSTR("Multiple errors downloading files");
    v87 = 205;
    goto LABEL_94;
  }
  if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine")
    && -[MBDriveRestoreEngine shouldVerifyDigests](self, "shouldVerifyDigests"))
  {
    v139 = v34;
    v163 = 0u;
    v161 = 0u;
    v162 = 0u;
    v160 = 0u;
    v35 = obj;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v160, v183, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v161;
      v146 = v35;
      v148 = *(_QWORD *)v161;
      do
      {
        v39 = 0;
        v144 = v37;
        do
        {
          if (*(_QWORD *)v161 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "domain"));
          v42 = objc_msgSend(v41, "shouldDigest");

          if (v42)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "digest"));
            if (v44)
            {
              v45 = (std::__fs::filesystem::path *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _temporaryPathForFile:](self, "_temporaryPathForFile:", v40));
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[MBDigest sha256](MBDigest, "sha256"));
              v159 = 0;
              v47 = (std::__fs::filesystem::path *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "digestForFileAtPath:error:", v45, &v159));
              v48 = v159;
              v150 = v48;
              if (v47)
              {
                v50 = -[std::__fs::filesystem::path isEqualToData:](v47, "isEqualToData:", v44);
                v51 = (char)v50;
                v53 = MBGetDefaultLog(v50, v52);
                v54 = objc_claimAutoreleasedReturnValue(v53);
                v55 = v54;
                if ((v51 & 1) != 0)
                {
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  {
                    v56 = (std::__fs::filesystem::path *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "absolutePath"));
                    *(_DWORD *)buf = 138412290;
                    v176 = v56;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "Digest matches: %@", buf, 0xCu);

                    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "absolutePath"));
                    _MBLog(CFSTR("DEBUG"), "Digest matches: %@", v57);

                  }
                }
                else
                {
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "absolutePath"));
                    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "fileID"));
                    *(_DWORD *)buf = 138413058;
                    v176 = v47;
                    v177 = 2112;
                    v178 = (unint64_t)v44;
                    v179 = 2112;
                    v180 = v66;
                    v181 = 2112;
                    v182 = v67;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "File SHA256 digest does not match manifest (%@ vs %@): %@ (%@)", buf, 0x2Au);

                    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "absolutePath"));
                    v69 = v46;
                    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "fileID"));
                    _MBLog(CFSTR("ERROR"), "File SHA256 digest does not match manifest (%@ vs %@): %@ (%@)", v47, v44, v68, v70);

                    v46 = v69;
                  }

                  -[MBDriveRestoreEngine digestDidNotMatchForFile:](self, "digestDidNotMatchForFile:", v40);
                }
                v37 = v144;
                v35 = v146;
              }
              else
              {
                v64 = MBGetDefaultLog(v48, v49);
                v65 = objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v176 = v45;
                  v177 = 2112;
                  v178 = (unint64_t)v150;
                  _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to compute the SHA1 digest for %@: %@", buf, 0x16u);
                  v35 = v146;
                  _MBLog(CFSTR("ERROR"), "Failed to compute the SHA1 digest for %@: %@", v45, v150);
                }

                -[MBDriveRestoreEngine digestDidNotMatchForFile:](self, "digestDidNotMatchForFile:", v40);
              }

              v38 = v148;
            }
            else
            {
              v58 = MBGetDefaultLog(0, v43);
              v59 = objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v60 = (std::__fs::filesystem::path *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "absolutePath"));
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "fileID"));
                *(_DWORD *)buf = 138412546;
                v176 = v60;
                v177 = 2112;
                v178 = (unint64_t)v61;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Digest missing from file: %@ (%@)", buf, 0x16u);

                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "absolutePath"));
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "fileID"));
                _MBLog(CFSTR("ERROR"), "Digest missing from file: %@ (%@)", v62, v63);

              }
              -[MBDriveRestoreEngine digestDidNotMatchForFile:](self, "digestDidNotMatchForFile:", v40);
            }

          }
          v39 = (char *)v39 + 1;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v160, v183, 16);
      }
      while (v37);
    }

    v34 = v139;
  }
  if (self->_digestDidNotMatchForSomeFiles)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Digest didn't match for some files")));
    goto LABEL_48;
  }
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v145 = obj;
  v149 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
  if (!v149)
    goto LABEL_91;
  v151 = *(_QWORD *)v156;
  while (2)
  {
    for (k = 0; k != v149; k = (char *)k + 1)
    {
      if (*(_QWORD *)v156 != v151)
        objc_enumerationMutation(v145);
      v89 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)k);
      v90 = (std::__fs::filesystem::path *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine _temporaryPathForFile:](self, "_temporaryPathForFile:", v89)));
      v91 = (const std::__fs::filesystem::path *)-[std::__fs::filesystem::path fileSystemRepresentation](v90, "fileSystemRepresentation");
      v92 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "restorePathForRestorable:", v89));

      restorePolicy = self->_restorePolicy;
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "domain"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "relativePath"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy validateRestoreDomain:relativePath:](restorePolicy, "validateRestoreDomain:relativePath:", v95, v96));

      if (v97)
      {
        v118 = v93;
        v128 = v97;
        goto LABEL_97;
      }
      v98 = objc_retainAutorelease(v93);
      v99 = (const std::__fs::filesystem::path *)objc_msgSend(v98, "fileSystemRepresentation");
      v101 = MBGetDefaultLog(v99, v100);
      v102 = objc_claimAutoreleasedReturnValue(v101);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
      {
        v147 = v93;
        v103 = (std::__fs::filesystem::path *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "description"));
        v104 = v91;
        v105 = v90;
        v106 = v99;
        v107 = v98;
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "fileID"));
        *(_DWORD *)buf = 138412546;
        v176 = v103;
        v177 = 2112;
        v178 = (unint64_t)v108;
        _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "Restoring regular file: %@ (%@)", buf, 0x16u);

        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "description"));
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "fileID"));
        _MBLog(CFSTR("INFO"), "Restoring regular file: %@ (%@)", v109, v110);

        v98 = v107;
        v99 = v106;
        v90 = v105;
        v91 = v104;

        v93 = v147;
      }

      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "restoreRegularFileAtPath:", v90));
      if (v111)
      {
        v118 = v93;
        v128 = v111;
LABEL_97:
        v71 = v128;
        v34 = v128;
        goto LABEL_98;
      }
      rename(v91, v99, v112);
      if (!(_DWORD)v113)
        goto LABEL_86;
      v115 = __error();
      v117 = *v115;
      if ((_DWORD)v117 == 92 || (_DWORD)v117 == 63)
      {
        v124 = MBGetDefaultLog(v115, v116);
        v125 = objc_claimAutoreleasedReturnValue(v124);
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v176 = v90;
          v177 = 2112;
          v178 = (unint64_t)v98;
          v179 = 1024;
          LODWORD(v180) = v117;
          _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "Skipped rename from %@ to %@: %{errno}d", buf, 0x1Cu);
          _MBLog(CFSTR("ERROR"), "Skipped rename from %@ to %@: %{errno}d", v90, v98, v117);
        }

LABEL_86:
        v34 = 0;
        goto LABEL_87;
      }
      v118 = v93;
      if ((_DWORD)v117 != 21)
      {
        v130 = MBGetDefaultLog(v115, v116);
        v131 = objc_claimAutoreleasedReturnValue(v130);
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v176 = v91;
          v177 = 2080;
          v178 = (unint64_t)v99;
          v179 = 1024;
          LODWORD(v180) = v117;
          _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "rename from %s to %s failed: %{errno}d", buf, 0x1Cu);
          _MBLog(CFSTR("ERROR"), "rename from %s to %s failed: %{errno}d", v91, v99, v117);
        }

        v132 = NSStringFromSelector(a2);
        v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", (int)v117, v98, CFSTR("%@ rename error"), v133));

        v34 = 0;
LABEL_98:
        v72 = v142;
LABEL_99:

        goto LABEL_100;
      }
      v119 = MBGetDefaultLog(v115, v116);
      v120 = objc_claimAutoreleasedReturnValue(v119);
      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_INFO, "Removing existing directory", buf, 2u);
        _MBLog(CFSTR("INFO"), "Removing existing directory");
      }

      v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v154 = 0;
      v122 = objc_msgSend(v121, "removeItemAtPath:error:", v98, &v154);
      v34 = v154;

      if ((v122 & 1) == 0)
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 102, v34, v98, CFSTR("Error removing directory item while restoring regular file")));
        goto LABEL_98;
      }
      rename(v91, v99, v123);
      if ((_DWORD)v113)
      {
        v134 = MBGetDefaultLog(v113, v114);
        v135 = objc_claimAutoreleasedReturnValue(v134);
        v136 = os_log_type_enabled(v135, OS_LOG_TYPE_ERROR);
        v72 = v142;
        if (v136)
        {
          *(_DWORD *)buf = 136315650;
          v176 = v91;
          v177 = 2080;
          v178 = (unint64_t)v99;
          v179 = 1024;
          LODWORD(v180) = 21;
          _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_ERROR, "rename from %s to %s failed: %{errno}d", buf, 0x1Cu);
          _MBLog(CFSTR("ERROR"), "rename from %s to %s failed: %{errno}d", v91, v99, 21);
        }

        v137 = NSStringFromSelector(a2);
        v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 21, v98, CFSTR("%@ rename error"), v138));

        goto LABEL_99;
      }
LABEL_87:
      v126 = MBGetDefaultLog(v113, v114);
      v127 = objc_claimAutoreleasedReturnValue(v126);
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v176 = v91;
        v177 = 2080;
        v178 = (unint64_t)v99;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_INFO, "Renamed %s to %s", buf, 0x16u);
        _MBLog(CFSTR("INFO"), "Renamed %s to %s", (const char *)v91, (const char *)v99);
      }

    }
    v149 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
    if (v149)
      continue;
    break;
  }
LABEL_91:

  v71 = 0;
LABEL_48:
  v72 = v142;
LABEL_100:

  return v71;
}

- (id)_annotate
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  double v23;
  uint8_t buf[4];
  double v26;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v5 = objc_msgSend(v4, "shouldRemoveItemsNotRestored");

  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not annotating", buf, 2u);
      _MBLog(CFSTR("INFO"), "Not annotating");
    }
    goto LABEL_11;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Annotating", buf, 2u);
    _MBLog(CFSTR("INFO"), "Annotating");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
  v9 = objc_claimAutoreleasedReturnValue(+[MBRestoreDirectoryAnnotator restoreDirectoryAnnotatorWithContext:persona:engineType:backupPolicy:encrypted:](MBRestoreDirectoryAnnotator, "restoreDirectoryAnnotatorWithContext:persona:engineType:backupPolicy:encrypted:", v13, v14, self->_engineType, -[MBEngine backupPolicy](self, "backupPolicy"), -[MBDriveRestoreEngine encrypted](self, "encrypted")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBDomainManager allDomains](self->super._domainManager, "allDomains"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject annotateDomains:](v9, "annotateDomains:", v15));

  if (!v16)
  {
    v20 = MBGetDefaultLog(v17, v18);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 134217984;
      v26 = v22 - v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Annotated in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      _MBLog(CFSTR("DEFAULT"), "Annotated in %0.3f s", v23 - v12);
    }

LABEL_11:
    objc_autoreleasePoolPop(v3);
    v19 = 0;
    return v19;
  }
  v19 = v16;

  objc_autoreleasePoolPop(v3);
  return v19;
}

- (id)_restoreDirectoryModificationTimes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  MBManifestLike *manifest;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  double v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  double v28;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100033CDC;
  v25 = sub_100033CEC;
  v26 = 0;
  v3 = objc_autoreleasePoolPush();
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting to restore directory modification times", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Starting to restore directory modification times");
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  manifest = self->_manifest;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100038240;
  v20[3] = &unk_1000D9590;
  v20[4] = self;
  v20[5] = &v21;
  v10 = -[MBManifestLike enumerateFiles:](manifest, "enumerateFiles:", v20);
  v12 = (void *)v22[5];
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    v14 = MBGetDefaultLog(v10, v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        *(_DWORD *)buf = 134217984;
        v28 = v17 - v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished restoring directory modification times in %0.3f s", buf, 0xCu);
      }

      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      _MBLog(CFSTR("DEFAULT"), "Finished restoring directory modification times in %0.3f s", v18 - v8);
    }

  }
  objc_autoreleasePoolPop(v3);
  _Block_object_dispose(&v21, 8);

  return v12;
}

- (id)_moveRestoreDirs
{
  void *v2;
  id v3;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine persona](self, "persona"));
  v5 = 0;
  objc_msgSend(v2, "finalizeRestoreDirectoriesWithError:", &v5);
  v3 = v5;

  return v3;
}

- (id)fileForTemporaryPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingPathExtension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", v7));

  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 1279, CFSTR("Couldn't extract file ID from temporary restore path: %@"), v5);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestLike fetchFileWithID:error:](self->_manifest, "fetchFileWithID:error:", v8, 0));
  if (!v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveRestoreEngine.m"), 1282, CFSTR("Couldn't find file object for temporary restore path: %@"), v5);

  }
  return v9;
}

- (void)digestDidNotMatchForFile:(id)a3
{
  -[MBDebugContext setFlag:](self->super._debugContext, "setFlag:", CFSTR("RestoredFileDigestDoesNotMatch"));
  self->_digestDidNotMatchForSomeFiles = 1;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  MBRestoreFileHandle *v24;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  void *v29;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine fileForTemporaryPath:](self, "fileForTemporaryPath:", v10));
  if (-[MBDriveRestoreEngine encrypted](self, "encrypted"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveRestoreEngine settingsContext](self, "settingsContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keybag"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "encryptionKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MBEncryptedFileHandle encryptedFileHandleForRestoreWithPath:keybag:key:error:](MBEncryptedFileHandle, "encryptedFileHandleForRestoreWithPath:keybag:key:error:", v10, v13, v14, a6));

    if (!v15)
      goto LABEL_9;
    goto LABEL_8;
  }
  v16 = objc_claimAutoreleasedReturnValue(+[MBBasicFileHandle basicFileHandleWithPath:flags:mode:error:](MBBasicFileHandle, "basicFileHandleWithPath:flags:mode:error:", v10, v8, v7, a6));
  if (v16)
  {
    v15 = (void *)v16;
    v18 = MBGetDefaultLog(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v11, "protectionClass");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absolutePath"));
      *(_DWORD *)buf = 67109378;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Setting protection class to %d: %@", buf, 0x12u);

      v22 = objc_msgSend(v11, "protectionClass");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absolutePath"));
      _MBLog(CFSTR("INFO"), "Setting protection class to %d: %@", v22, v23);

    }
    if (!+[MBProtectionClassUtils setWithFD:value:error:](MBProtectionClassUtils, "setWithFD:value:error:", objc_msgSend(v15, "fd"), objc_msgSend(v11, "protectionClass"), a6))
    {
      objc_msgSend(v15, "closeWithError:", 0);
      v24 = 0;
      goto LABEL_11;
    }
LABEL_8:
    v24 = -[MBRestoreFileHandle initWithEngine:fileHandle:file:]([MBRestoreFileHandle alloc], "initWithEngine:fileHandle:file:", self, v15, v11);
LABEL_11:

    goto LABEL_12;
  }
LABEL_9:
  v24 = 0;
LABEL_12:

  return v24;
}

- (int)engineType
{
  return self->_engineType;
}

- (MBProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorePolicy, 0);
  objc_storeStrong((id *)&self->_userTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->_sharedTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->_restoredAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_regularFileIDsByInodeNumber, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_backupHelper, 0);
  objc_storeStrong((id *)&self->_drive, 0);
  objc_storeStrong((id *)&self->_script, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5
{
  return +[MBDriveRestoreDomainManagerDelegate domainForName:containerID:engine:](MBDriveRestoreDomainManagerDelegate, "domainForName:containerID:engine:", a3, a4, self);
}

@end
