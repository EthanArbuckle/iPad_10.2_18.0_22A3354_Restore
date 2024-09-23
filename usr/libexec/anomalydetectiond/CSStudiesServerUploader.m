@implementation CSStudiesServerUploader

- (CSStudiesServerUploader)initWithSpoolerFolder:(id)a3 serverConfiguration:(id)a4 registrationPeriodInSeconds:(unint64_t)a5 retentionPeriodInSeconds:(unint64_t)a6 outOfBandMetadataTimeout:(double)a7 defaultsKeyPostfix:(id)a8
{
  id v14;
  id v15;
  id v16;
  CSStudiesServerUploader *v17;
  NSURL *v18;
  NSURL *folderURL;
  NSObject *v20;
  NSURL *v21;
  uint64_t v22;
  NSString *defaultsSubjectIDKeyName;
  uint64_t v24;
  NSString *defaultsSubjectAuthTokenKeyName;
  uint64_t v26;
  NSString *defaultsRegistrationDateKeyName;
  CSStudiesServerSubmitter *submitter;
  objc_super v30;
  uint8_t buf[4];
  NSURL *v32;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CSStudiesServerUploader;
  v17 = -[CSStudiesServerUploader init](&v30, "init");
  if (v17)
  {
    v18 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v14, 1);
    folderURL = v17->_folderURL;
    v17->_folderURL = v18;

    if (qword_1003873E0 != -1)
      dispatch_once(&qword_1003873E0, &stru_100346DA8);
    v20 = qword_1003873E8;
    if (os_log_type_enabled((os_log_t)qword_1003873E8, OS_LOG_TYPE_INFO))
    {
      v21 = v17->_folderURL;
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Starting uploader with spooler at: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&v17->_configuration, a4);
    v17->_registrationPeriodInSeconds = a5;
    v17->_retentionPeriodInSeconds = a6;
    objc_storeStrong((id *)&v17->_postfix, a8);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("StudiesServerUploaderDefaultsSubjectID"), "stringByAppendingString:", v16));
    defaultsSubjectIDKeyName = v17->_defaultsSubjectIDKeyName;
    v17->_defaultsSubjectIDKeyName = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("StudiesServerUploaderDefaultsSubjectAuthorizationToken"), "stringByAppendingString:", v16));
    defaultsSubjectAuthTokenKeyName = v17->_defaultsSubjectAuthTokenKeyName;
    v17->_defaultsSubjectAuthTokenKeyName = (NSString *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("StudiesServerUploaderDefaultsRegistrationDate"), "stringByAppendingString:", v16));
    defaultsRegistrationDateKeyName = v17->_defaultsRegistrationDateKeyName;
    v17->_defaultsRegistrationDateKeyName = (NSString *)v26;

    -[CSStudiesServerUploader checkForPersistedRegistration](v17, "checkForPersistedRegistration");
    submitter = v17->_submitter;
    v17->_submitter = 0;

    -[CSStudiesServerUploader createSubmitterIfRegistered](v17, "createSubmitterIfRegistered");
    v17->_oobTimeout = a7;
  }

  return v17;
}

- (void)checkForPersistedRegistration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  unint64_t v8;
  CSStudiesServerUploader *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader defaultsRegistrationDateKeyName](self, "defaultsRegistrationDateKeyName"));
  v5 = objc_msgSend(v3, "integerForKey:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = (unint64_t)(v7 - (double)(unint64_t)v5);

    if (-[CSStudiesServerUploader registrationPeriodInSeconds](self, "registrationPeriodInSeconds") <= v8)
    {
      if (qword_1003873E0 != -1)
        dispatch_once(&qword_1003873E0, &stru_100346DA8);
      v21 = (id)qword_1003873E8;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = 134349312;
        v23 = v8;
        v24 = 2050;
        v25 = -[CSStudiesServerUploader registrationPeriodInSeconds](self, "registrationPeriodInSeconds");
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Expired HDS UUID found: %{public}llu > %{public}llu", (uint8_t *)&v22, 0x16u);
      }

      -[CSStudiesServerUploader setRegistered:](self, "setRegistered:", 0);
    }
    else
    {
      v9 = self;
      objc_sync_enter(v9);
      -[CSStudiesServerUploader setRegistered:](v9, "setRegistered:", 1);
      v10 = objc_alloc((Class)NSUUID);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader defaultsSubjectIDKeyName](v9, "defaultsSubjectIDKeyName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForKey:", v12));
      v14 = objc_msgSend(v10, "initWithUUIDString:", v13);
      -[CSStudiesServerUploader setSubjectID:](v9, "setSubjectID:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader defaultsSubjectAuthTokenKeyName](v9, "defaultsSubjectAuthTokenKeyName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringForKey:", v16));
      -[CSStudiesServerUploader setSubjectAuthorizationToken:](v9, "setSubjectAuthorizationToken:", v17);

      objc_sync_exit(v9);
      if (qword_1003873E0 != -1)
        dispatch_once(&qword_1003873E0, &stru_100346DA8);
      v18 = (id)qword_1003873E8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader subjectID](v9, "subjectID"));
        v22 = 138543362;
        v23 = (unint64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Persisted HDS UUID found: %{public}@", (uint8_t *)&v22, 0xCu);

      }
    }
  }
  else
  {
    if (qword_1003873E0 != -1)
      dispatch_once(&qword_1003873E0, &stru_100346DA8);
    v20 = qword_1003873E8;
    if (os_log_type_enabled((os_log_t)qword_1003873E8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "No persisted HDS UUID found", (uint8_t *)&v22, 2u);
    }
    -[CSStudiesServerUploader setRegistered:](self, "setRegistered:", 0);
  }
}

- (void)createSubmitterIfRegistered
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CSStudiesServerSubmitter *v12;
  void *v13;
  CSStudiesServerSubmitter *v14;
  int v15;
  void *v16;

  if (-[CSStudiesServerUploader registered](self, "registered"))
  {
    if (qword_1003873E0 != -1)
      dispatch_once(&qword_1003873E0, &stru_100346DA8);
    v3 = (id)qword_1003873E8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader subjectID](self, "subjectID"));
      v15 = 138543362;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Registered with Studies Server as %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "server"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("/ingest/v2/submit/")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader submitter](self, "submitter"));
    LODWORD(v5) = v9 == 0;

    if ((_DWORD)v5)
    {
      v12 = [CSStudiesServerSubmitter alloc];
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader configuration](self, "configuration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "auth"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader subjectAuthorizationToken](self, "subjectAuthorizationToken"));
      v14 = -[CSStudiesServerSubmitter initWithEndpoint:authorization:subjectToken:](v12, "initWithEndpoint:authorization:subjectToken:", v8, v11, v13);
      -[CSStudiesServerUploader setSubmitter:](self, "setSubmitter:", v14);

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader submitter](self, "submitter"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader subjectAuthorizationToken](self, "subjectAuthorizationToken"));
      objc_msgSend(v10, "updateRegistrationWithSubjectToken:", v11);
    }

  }
}

- (BOOL)registerForUploadingWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CSStudiesServerRegistrar *v14;
  void *v15;
  void *v16;
  CSStudiesServerRegistrar *v17;
  dispatch_semaphore_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  void *v21;
  id *v23;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id location;

  -[CSStudiesServerUploader checkForPersistedRegistration](self, "checkForPersistedRegistration");
  if (!-[CSStudiesServerUploader registered](self, "registered"))
  {
    v23 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "server"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("/ingest/v2/register/")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "studyUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", v12));

    v14 = [CSStudiesServerRegistrar alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader configuration](self, "configuration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "auth"));
    v17 = -[CSStudiesServerRegistrar initWithEndpoint:authorization:cellularAccess:timeoutInSeconds:](v14, "initWithEndpoint:authorization:cellularAccess:timeoutInSeconds:", v13, v16, 1, 60);

    v18 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_100012AF8;
    v32 = sub_100012B08;
    v33 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100012B10;
    v24[3] = &unk_100346CE8;
    v26 = &v28;
    objc_copyWeak(&v27, &location);
    v19 = v18;
    v25 = v19;
    -[CSStudiesServerRegistrar registerWithHandler:](v17, "registerWithHandler:", v24);
    v20 = dispatch_time(0, 61000000000);
    dispatch_semaphore_wait(v19, v20);
    v21 = (void *)v29[5];
    if (v21)
      *v23 = objc_retainAutorelease(v21);
    -[CSStudiesServerUploader createSubmitterIfRegistered](self, "createSubmitterIfRegistered");

    objc_destroyWeak(&v27);
    _Block_object_dispose(&v28, 8);

    objc_destroyWeak(&location);
  }
  return -[CSStudiesServerUploader registered](self, "registered");
}

- (BOOL)isFileOldEnoughForDeletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v19 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, &v19));
  v8 = v19;
  if (v8)
  {
    if (qword_1003873E0 != -1)
      dispatch_once(&qword_1003873E0, &stru_100346DA8);
    v9 = qword_1003873E8;
    if (os_log_type_enabled((os_log_t)qword_1003873E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v4;
      v22 = 2114;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to get attributes for file %{public}@: %{public}@", buf, 0x16u);
    }
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileCreationDate"));
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v16 = v15;

    v10 = -[CSStudiesServerUploader retentionPeriodInSeconds](self, "retentionPeriodInSeconds") + (unint64_t)v13 < (unint64_t)v16;
  }
  if (qword_1003873E0 != -1)
    dispatch_once(&qword_1003873E0, &stru_100346DA8);
  v17 = qword_1003873E8;
  if (os_log_type_enabled((os_log_t)qword_1003873E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v4;
    v22 = 1026;
    LODWORD(v23) = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "File %{public}@ for deletion? %{public}d", buf, 0x12u);
  }

  return v10;
}

- (BOOL)startMonitoringWithError:(id *)a3
{
  int v5;
  CSFolderMonitor *v6;
  void *v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  void *v10;
  void *v11;
  CSFolderMonitor *v12;
  void *v13;
  unsigned int v14;
  CSFolderMonitorBackgroundScanningConfiguration *v15;
  void *v16;
  _QWORD *v17;
  CSFolderMonitor *v18;
  void *v19;
  void *v20;
  void *v21;
  CSFolderMonitor *v22;
  CSFolderMonitorBackgroundScanningConfiguration *v23;
  void *v24;
  CSFolderMonitor *v25;
  void *v26;
  void *v27;
  void *v28;
  CSFolderMonitor *v29;
  CSFolderMonitorBackgroundScanningConfiguration *v30;
  void *v31;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  id location[2];

  if (-[CSStudiesServerUploader monitoring](self, "monitoring"))
  {
LABEL_13:
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = sub_10001A13C(self, a3, CFSTR("starter"));
  if (v5)
  {
    objc_initWeak(location, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000135A8;
    v38[3] = &unk_100346D38;
    objc_copyWeak(&v39, location);
    v38[4] = self;
    v33 = objc_retainBlock(v38);
    v6 = [CSFolderMonitor alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader folderURL](self, "folderURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader postfix](self, "postfix"));
    v12 = -[CSFolderMonitor initWithFolder:fileExtension:queue:postfix:andAction:](v6, "initWithFolder:fileExtension:queue:postfix:andAction:", v8, CFSTR("protodata"), v10, v11, v33);
    -[CSStudiesServerUploader setOobMetadataMonitor:](self, "setOobMetadataMonitor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("UploaderIndigenousXPCActivity"));

    if (v14)
    {
      v15 = -[CSFolderMonitorBackgroundScanningConfiguration initWithFileProtectionType:allowBattery:periodInseconds:]([CSFolderMonitorBackgroundScanningConfiguration alloc], "initWithFileProtectionType:allowBattery:periodInseconds:", NSFileProtectionCompleteUnlessOpen, 1, XPC_ACTIVITY_INTERVAL_1_HOUR);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader oobMetadataMonitor](self, "oobMetadataMonitor"));
      objc_msgSend(v16, "setupRecurringScanningWithConfiguration:runNow:", v15, 1);

    }
    else
    {
      v15 = (CSFolderMonitorBackgroundScanningConfiguration *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader oobMetadataMonitor](self, "oobMetadataMonitor"));
      -[CSFolderMonitorBackgroundScanningConfiguration registerForFolderMonitorActivity](v15, "registerForFolderMonitorActivity");
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100013E48;
    v36[3] = &unk_100346D38;
    objc_copyWeak(&v37, location);
    v36[4] = self;
    v17 = objc_retainBlock(v36);
    v18 = [CSFolderMonitor alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader folderURL](self, "folderURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader postfix](self, "postfix"));
    v22 = -[CSFolderMonitor initWithFolder:fileExtension:queue:postfix:andAction:](v18, "initWithFolder:fileExtension:queue:postfix:andAction:", v20, CFSTR("metadata"), v10, v21, v17);
    -[CSStudiesServerUploader setEncryptMonitor:](self, "setEncryptMonitor:", v22);

    if (v14)
    {
      v23 = -[CSFolderMonitorBackgroundScanningConfiguration initWithFileProtectionType:allowBattery:periodInseconds:]([CSFolderMonitorBackgroundScanningConfiguration alloc], "initWithFileProtectionType:allowBattery:periodInseconds:", NSFileProtectionCompleteUnlessOpen, 1, XPC_ACTIVITY_INTERVAL_1_HOUR);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader encryptMonitor](self, "encryptMonitor"));
      objc_msgSend(v24, "setupRecurringScanningWithConfiguration:runNow:", v23, 1);

    }
    else
    {
      v23 = (CSFolderMonitorBackgroundScanningConfiguration *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader encryptMonitor](self, "encryptMonitor"));
      -[CSFolderMonitorBackgroundScanningConfiguration registerForFolderMonitorActivity](v23, "registerForFolderMonitorActivity");
    }

    v25 = [CSFolderMonitor alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader folderURL](self, "folderURL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader postfix](self, "postfix"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100014A54;
    v34[3] = &unk_100346D88;
    objc_copyWeak(&v35, location);
    v29 = -[CSFolderMonitor initWithFolder:fileExtension:queue:postfix:andAction:](v25, "initWithFolder:fileExtension:queue:postfix:andAction:", v27, CFSTR("encrypted"), v10, v28, v34);
    -[CSStudiesServerUploader setSubmitMonitor:](self, "setSubmitMonitor:", v29);

    if (v14)
    {
      v30 = -[CSFolderMonitorBackgroundScanningConfiguration initWithFileProtectionType:allowBattery:periodInseconds:]([CSFolderMonitorBackgroundScanningConfiguration alloc], "initWithFileProtectionType:allowBattery:periodInseconds:", NSFileProtectionCompleteUntilFirstUserAuthentication, 1, XPC_ACTIVITY_INTERVAL_1_HOUR);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader submitMonitor](self, "submitMonitor"));
      objc_msgSend(v31, "setupRecurringScanningWithConfiguration:runNow:", v30, 1);

    }
    else
    {
      v30 = (CSFolderMonitorBackgroundScanningConfiguration *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader submitMonitor](self, "submitMonitor"));
      -[CSFolderMonitorBackgroundScanningConfiguration registerForFolderMonitorActivity](v30, "registerForFolderMonitorActivity");
    }

    -[CSStudiesServerUploader setMonitoring:](self, "setMonitoring:", 1);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(location);
    goto LABEL_13;
  }
  return v5;
}

- (BOOL)persistToDiskWithSpooledFile:(BOOL)a3 fileURL:(id)a4 enqueueTime:(double)a5 metadata:(id)a6 theError:(id *)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;

  v10 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  v15 = CFSTR("metadata");
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("metadata"));
  objc_msgSend(v14, "encodeBool:forKey:", v10, CFSTR("spooled"));
  objc_msgSend(v14, "encodeDouble:forKey:", CFSTR("enqueueTime"), a5);
  if (!v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
    objc_msgSend(v14, "encodeObject:forKey:", v16, CFSTR("unspooledFilePath"));

  }
  objc_msgSend(v14, "finishEncoding");
  -[CSStudiesServerUploader oobTimeout](self, "oobTimeout");
  if (v17 != 0.0)
    v15 = CFSTR("protodata");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader folderURL](self, "folderURL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathComponent:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathExtension:", v15));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "encodedData"));
  v23 = objc_msgSend(v22, "writeToURL:options:error:", v21, 805306369, a7);

  return v23;
}

- (BOOL)enqueueFileWithFilename:(id)a3 andMetadata:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v8 = a3;
  v20 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) != 0)
  {
    v10 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByDeletingLastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader folderURL](self, "folderURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    LOBYTE(a5) = -[CSStudiesServerUploader persistToDiskWithSpooledFile:fileURL:enqueueTime:metadata:theError:](self, "persistToDiskWithSpooledFile:fileURL:enqueueTime:metadata:theError:", v15, v10, v20, a5);

  }
  else if (a5)
  {
    v21 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("While enqueuing, file doesnt exist: %@"), v8));
    v22 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, v18));

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)addOutOfBandMetadata:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("oobMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("enqueueTime"));

  objc_msgSend(v7, "finishEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader folderURL](self, "folderURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("oob")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "encodedData"));
  LOBYTE(a4) = objc_msgSend(v14, "writeToURL:options:error:", v13, 805306369, a4);

  return (char)a4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader submitMonitor](self, "submitMonitor"));
  objc_msgSend(v3, "stopRecurringScanning");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader encryptMonitor](self, "encryptMonitor"));
  objc_msgSend(v4, "stopRecurringScanning");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploader oobMetadataMonitor](self, "oobMetadataMonitor"));
  objc_msgSend(v5, "stopRecurringScanning");

  v6.receiver = self;
  v6.super_class = (Class)CSStudiesServerUploader;
  -[CSStudiesServerUploader dealloc](&v6, "dealloc");
}

- (CSStudiesServerConfiguration)configuration
{
  return self->_configuration;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (NSUUID)subjectID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubjectID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)subjectAuthorizationToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubjectAuthorizationToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CSStudiesServerSubmitter)submitter
{
  return (CSStudiesServerSubmitter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubmitter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CSFolderMonitor)oobMetadataMonitor
{
  return (CSFolderMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOobMetadataMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CSFolderMonitor)encryptMonitor
{
  return (CSFolderMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEncryptMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CSFolderMonitor)submitMonitor
{
  return (CSFolderMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSubmitMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)registrationPeriodInSeconds
{
  return self->_registrationPeriodInSeconds;
}

- (void)setRegistrationPeriodInSeconds:(unint64_t)a3
{
  self->_registrationPeriodInSeconds = a3;
}

- (unint64_t)retentionPeriodInSeconds
{
  return self->_retentionPeriodInSeconds;
}

- (void)setRetentionPeriodInSeconds:(unint64_t)a3
{
  self->_retentionPeriodInSeconds = a3;
}

- (double)oobTimeout
{
  return self->_oobTimeout;
}

- (void)setOobTimeout:(double)a3
{
  self->_oobTimeout = a3;
}

- (NSString)postfix
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)defaultsSubjectIDKeyName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDefaultsSubjectIDKeyName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)defaultsSubjectAuthTokenKeyName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDefaultsSubjectAuthTokenKeyName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)defaultsRegistrationDateKeyName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDefaultsRegistrationDateKeyName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsRegistrationDateKeyName, 0);
  objc_storeStrong((id *)&self->_defaultsSubjectAuthTokenKeyName, 0);
  objc_storeStrong((id *)&self->_defaultsSubjectIDKeyName, 0);
  objc_storeStrong((id *)&self->_postfix, 0);
  objc_storeStrong((id *)&self->_submitMonitor, 0);
  objc_storeStrong((id *)&self->_encryptMonitor, 0);
  objc_storeStrong((id *)&self->_oobMetadataMonitor, 0);
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_subjectAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_subjectID, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
