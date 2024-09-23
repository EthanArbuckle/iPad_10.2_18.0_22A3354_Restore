@implementation ICCloudContext

+ (id)processingQueue
{
  return +[RDDispatchQueue_ObjC utilityQueue](_TtC7remindd20RDDispatchQueue_ObjC, "utilityQueue");
}

- (ICCloudContext)initWithStoreController:(id)a3
{
  id v5;
  ICCloudContext *v6;
  ICCloudContext *v7;
  ICUserDefaults *v8;
  NSOperationQueue *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICCloudContextSyncMetrics *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  NSObject *v23;
  int v24;
  void *v25;
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *v26;
  void *v27;
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *v28;
  void *v29;
  double v30;
  double v31;
  _TtC7remindd21RDDebouncerWithNumber *v32;
  void *v33;
  _TtC7remindd21RDDebouncerWithNumber *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  dispatch_queue_global_t global_queue;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v53;
  id v54;
  void *v55;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  dispatch_queue_global_t v63;
  NSObject *v64;
  ICCloudContext *v65;
  _QWORD block[4];
  ICCloudContext *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint8_t v75[16];
  objc_super v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;

  v5 = a3;
  v76.receiver = self;
  v76.super_class = (Class)ICCloudContext;
  v6 = -[ICCloudContext init](&v76, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeController, a3);
    v8 = objc_opt_new(ICUserDefaults);
    -[ICCloudContext setIcUserDefaults:](v7, "setIcUserDefaults:", v8);

    v9 = objc_opt_new(NSOperationQueue);
    -[ICCloudContext setOperationQueue:](v7, "setOperationQueue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](v7, "operationQueue"));
    objc_msgSend(v10, "setMaxConcurrentOperationCount:", 10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext processingQueue](ICCloudContext, "processingQueue"));
    -[ICCloudContext setProcessingQueue:](v7, "setProcessingQueue:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[ICCloudContext setObjectIDsToProcess:](v7, "setObjectIDsToProcess:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[ICCloudContext setAccountZoneIDsNeedingToBeSaved:](v7, "setAccountZoneIDsNeedingToBeSaved:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[ICCloudContext setObjectIDsToRetry:](v7, "setObjectIDsToRetry:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[ICCloudContext setRetryCountsByOperationType:](v7, "setRetryCountsByOperationType:", v15);

    v16 = -[ICCloudContextSyncMetrics initWithSyncReason:]([ICCloudContextSyncMetrics alloc], "initWithSyncReason:", CFSTR("InitSyncMetrics"));
    -[ICCloudContext setLastSyncMetrics:](v7, "setLastSyncMetrics:", v16);

    -[ICCloudContext setHasRetryTimer:](v7, "setHasRetryTimer:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[ICCloudContext setDatabaseScopeStringsNeedingRetryFetchChangesByAccountID:](v7, "setDatabaseScopeStringsNeedingRetryFetchChangesByAccountID:", v17);

    -[ICCloudContext setWasInternetReachable:](v7, "setWasInternetReachable:", +[ICUtilities isInternetReachable](ICUtilities, "isInternetReachable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](v7, "icUserDefaults"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userDefaults"));
    objc_msgSend(v19, "doubleForKey:", CFSTR("CloudKitLastSyncSinceInternetReachable"));
    -[ICCloudContext setLastSyncSinceInternetReachable:](v7, "setLastSyncSinceInternetReachable:");

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICSyncSettings sharedSettings](ICSyncSettings, "sharedSettings"));
    v21 = objc_msgSend(v20, "hasOptions:", 16);

    v22 = objc_msgSend(v5, "supportsSyncingToCloudKit");
    v23 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    v24 = v21 & v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v78 = v21 & v22;
      v79 = 2048;
      v80 = v21;
      v81 = 2048;
      v82 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "ICCloudContext INIT {supportsCloudKitSyncing: %ld, syncSettingsSupportsCloudKitSyncing: %ld, storeControllerSupportsCloudKitSyncing: %ld}", buf, 0x20u);
    }

    -[ICCloudContext setSupportsCloudKitSyncing:](v7, "setSupportsCloudKitSyncing:", v21 & v22);
    -[ICCloudContext setShouldUnregisterBuddy:](v7, "setShouldUnregisterBuddy:", 1);
    -[ICCloudContext setDisabled:](v7, "setDisabled:", v24 ^ 1u);
    -[ICCloudContext setDisabledInternal:](v7, "setDisabledInternal:", 0);
    -[ICCloudContext setQualityOfService:](v7, "setQualityOfService:", 17);
    -[ICCloudContext setTimeoutIntervalForResource:](v7, "setTimeoutIntervalForResource:", 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICSyncSettings sharedSettings](ICSyncSettings, "sharedSettings"));
    -[ICCloudContext setFetchingEnabled:](v7, "setFetchingEnabled:", objc_msgSend(v25, "hasOptions:", 0x80000));

    -[ICCloudContext setDidCheckForLongLivedOperations:](v7, "setDidCheckForLongLivedOperations:", 0);
    v26 = [_TtC7remindd37RDDebouncerWithCKDatabaseNotification alloc];
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](v7, "processingQueue"));
    v28 = -[RDDebouncerWithCKDatabaseNotification initWithDebouncingInterval:queue:handler:](v26, "initWithDebouncingInterval:queue:handler:", v27, &stru_1007D7BA8, 15.0);
    -[ICCloudContext setApsNotificationHandlingDebouncer:](v7, "setApsNotificationHandlingDebouncer:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
    objc_msgSend(v29, "accountChangedDebouncerInterval");
    v31 = v30;

    v32 = [_TtC7remindd21RDDebouncerWithNumber alloc];
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](v7, "processingQueue"));
    v34 = -[RDDebouncerWithNumber initWithDebouncingInterval:queue:handler:](v32, "initWithDebouncingInterval:queue:handler:", v33, &stru_1007D7BC8, v31);
    -[ICCloudContext setAccountChangedNotificationHandlingDebouncer:](v7, "setAccountChangedNotificationHandlingDebouncer:", v34);

    -[ICCloudContext loadZoneFetchState](v7, "loadZoneFetchState");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));
    objc_msgSend(v35, "addObserver:selector:name:object:", v7, "contextDidSave:", NSManagedObjectContextDidSaveObjectIDsNotification, v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v37, "addObserver:selector:name:object:", v7, "contextDidSave:", CFSTR("RDStoreControllerDidRemoveAccountStoresNotification"), v5);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[ICCloudContext setRecognizedCloudObjectClasses:](v7, "setRecognizedCloudObjectClasses:", v38);

    if (v24)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appleAccountUtilities"));
      if (v39)
      {
        -[ICCloudContext setAppleAccountUtilities:](v7, "setAppleAccountUtilities:", v39);
      }
      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[REMAppleAccountUtilities sharedInstance](REMAppleAccountUtilities, "sharedInstance"));
        -[ICCloudContext setAppleAccountUtilities:](v7, "setAppleAccountUtilities:", v40);

      }
      v7->_containersByAccountIDLock._os_unfair_lock_opaque = 0;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v42 = kReachabilityChangedNotification;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
      objc_msgSend(v41, "addObserver:selector:name:object:", v7, "reachabilityChanged:", v42, v43);

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v44, "addObserver:selector:name:object:", v7, "cloudKitAccountChanged:", CKAccountChangedNotification, 0);

      objc_initWeak((id *)buf, v7);
      -[ICCloudContext setIsSystemAvailableForSyncing:](v7, "setIsSystemAvailableForSyncing:", 0);
      v45 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.launch.pending.DADSystemAvailabilityChecker}", v75, 2u);
      }

      v46 = (void *)os_transaction_create("com.apple.remindd.cloudkit.launch.pending.accounts.initializer");
      global_queue = dispatch_get_global_queue(17, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](v7, "processingQueue"));
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_100020B14;
      v72[3] = &unk_1007D7BF0;
      objc_copyWeak(&v74, (id *)buf);
      v50 = v46;
      v73 = v50;
      +[DADSystemAvailabilityChecker waitForSyncEngineSystemAvailabilityBlockingQueue:completionQueue:completionBlock:](DADSystemAvailabilityChecker, "waitForSyncEngineSystemAvailabilityBlockingQueue:completionQueue:completionBlock:", v48, v49, v72);

      -[ICCloudContext setPendingAccountInitializerCompleteOnLaunch:](v7, "setPendingAccountInitializerCompleteOnLaunch:", 1);
      v51 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.launch.pending.RDAccountInitializerDidCompleteInitializeAllAccountsObserver}", v75, 2u);
      }

      v52 = (void *)os_transaction_create("com.apple.remindd.cloudkit.launch.pending.RDAccountInitializerDidCompleteInitializeAllAccountsObserver");
      v53 = [RDAccountInitializerDidCompleteInitializeAllAccountsObserver alloc];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100020C0C;
      v69[3] = &unk_1007D7C18;
      objc_copyWeak(&v71, (id *)buf);
      v54 = v52;
      v70 = v54;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](v7, "processingQueue"));
      v56 = -[RDAccountInitializerDidCompleteInitializeAllAccountsObserver initWithHandler:queue:](v53, "initWithHandler:queue:", v69, v55);
      -[ICCloudContext setAccountInitializerDidCompleteOnLaunchObserver:](v7, "setAccountInitializerDidCompleteOnLaunchObserver:", v56);

      v57 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "ICCC: Observing RDAccountInitializer.DidCompleteInitializeAllAccountsNotification on daemon launch before we enable syncing.", v75, 2u);
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountInitializerDidCompleteOnLaunchObserver](v7, "accountInitializerDidCompleteOnLaunchObserver"));
      objc_msgSend(v58, "observe");

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v59, "addObserver:selector:name:object:", v7, "updateConfiguration", CFSTR("ICCloudConfigurationChangedNotification"), 0);

      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v60, "addObserver:selector:name:object:", v7, "updateSelectorDelayers", CFSTR("ICCloudBatchIntervalDidChangeNotification"), 0);

      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v61, "addObserver:selector:name:object:", v7, "handleUnrecoverableError", CFSTR("ICCloudContextUnrecoverableErrorNotification"), 0);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](v7, "operationQueue"));
      objc_msgSend(v62, "addObserver:forKeyPath:options:context:", v7, CFSTR("operationCount"), 3, off_100836070);

      -[ICCloudContext setDidAddObservers:](v7, "setDidAddObservers:", 1);
      v63 = dispatch_get_global_queue(0, 0);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100020D28;
      block[3] = &unk_1007D7A60;
      v65 = v7;
      v68 = v65;
      dispatch_async(v64, block);

      v65->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock._os_unfair_lock_opaque = 0;
      objc_destroyWeak(&v71);

      objc_destroyWeak(&v74);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[ICCloudContext setDidAddObservers:](v7, "setDidAddObservers:", 0);
      -[ICCloudContext setIsSystemAvailableForSyncing:](v7, "setIsSystemAvailableForSyncing:", 1);
    }
    -[ICCloudContext addStateHandler](v7, "addStateHandler");
    -[ICCloudContext setBuddyStateObserver:](v7, "setBuddyStateObserver:", 0);
    -[ICCloudContext setHasPassedBuddy:](v7, "setHasPassedBuddy:", +[DADBuddyStateObserver hasPassedBuddy](DADBuddyStateObserver, "hasPassedBuddy"));
    if (!-[ICCloudContext hasPassedBuddy](v7, "hasPassedBuddy"))
      -[ICCloudContext registerForBuddy](v7, "registerForBuddy");
  }

  return v7;
}

- (void)bootstrapSyncingOnLaunchIfSystemReady
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id buf;
  __int16 v9;
  unsigned int v10;

  if (-[ICCloudContext isSystemAvailableForSyncing](self, "isSystemAvailableForSyncing")
    && !-[ICCloudContext pendingAccountInitializerCompleteOnLaunch](self, "pendingAccountInitializerCompleteOnLaunch"))
  {
    objc_initWeak(&buf, self);
    v4 = dispatch_time(0, 2000000000);
    v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020EC8;
    block[3] = &unk_1007D7AD0;
    objc_copyWeak(&v7, &buf);
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&buf);
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = -[ICCloudContext isSystemAvailableForSyncing](self, "isSystemAvailableForSyncing");
      v9 = 1024;
      v10 = -[ICCloudContext pendingAccountInitializerCompleteOnLaunch](self, "pendingAccountInitializerCompleteOnLaunch");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICCC: bootstrapSyncingOnLaunchIfSystemReady: Not ready to bootstrap syncing yet {isSystemAvailableForSyncing=%d, pendingAccountInitializerCompleteOnLaunch=%d}", (uint8_t *)&buf, 0xEu);
    }

  }
}

- (void)registerForBuddy
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id buf[2];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not passed buddy. ICCC now registers for buddy.", (uint8_t *)buf, 2u);
  }

  v4 = objc_alloc((Class)DADBuddyStateObserver);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v6 = objc_msgSend(v4, "initWithQueue:", v5);
  -[ICCloudContext setBuddyStateObserver:](self, "setBuddyStateObserver:", v6);

  objc_initWeak(buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021118;
  v10[3] = &unk_1007D7AD0;
  objc_copyWeak(&v11, buf);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext buddyStateObserver](self, "buddyStateObserver"));
  objc_msgSend(v7, "setBuddyDidFinishHandler:", v10);

  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000211A8;
  v9[3] = &unk_1007D7A60;
  v9[4] = self;
  dispatch_sync(v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

- (void)pq_unregisterForBuddy
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext buddyStateObserver](self, "buddyStateObserver"));
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICCC now unregisters buddy observer.", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext buddyStateObserver](self, "buddyStateObserver"));
    objc_msgSend(v6, "stop");

    -[ICCloudContext setBuddyStateObserver:](self, "setBuddyStateObserver:", 0);
  }
}

- (id)unsafeUntilSystemReady_hashedAccountPersonIDForAccount:(id)a3 usingSalt:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v28;
  NSString *v29;
  void *v30;
  NSString *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountTypeHost"));
  v10 = objc_msgSend(v9, "isCloudKit");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext appleAccountUtilities](self, "appleAccountUtilities"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:", v12));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v14, "aa_altDSID"));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
        v17 = objc_msgSend(v16, "enableHashingUserIdentifiablesWithPersonIDSalt");

        v19 = v15;
        if (v17)
        {
          v20 = objc_opt_class(self, v18);
          if ((objc_opt_respondsToSelector(v20, "conformsToRDICCloudContextCryptoStringProviding") & 1) != 0)
          {
            v22 = objc_msgSend((id)objc_opt_class(self, v21), "base64EncodedHMACStringFromString:usingSalt:", v19, v8);
            v23 = objc_claimAutoreleasedReturnValue(v22);

            v19 = (id)v23;
          }
          else
          {
            v26 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              sub_10067935C();

          }
        }
      }
      else
      {
        v24 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class(self, v25);
          v29 = NSStringFromClass(v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v31 = NSStringFromSelector(a2);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v30, v32));
          *(_DWORD *)buf = 138543618;
          v35 = v33;
          v36 = 2114;
          v37 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot proceed because aaAccount.aa_altDSID is nil {accountIdentifier: %{public}@}", buf, 0x16u);

        }
        v19 = 0;
      }

    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10067929C();
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)primaryCloudKitAccountPersonIDSaltDidSetWithSalt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  ICCloudContext *v12;
  id v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (-[ICCloudContext hasPassedBuddy](self, "hasPassedBuddy")
      && -[ICCloudContext isSystemAvailableForSyncing](self, "isSystemAvailableForSyncing"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
      v7 = objc_msgSend(v6, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.ICCloudContext.setPersonID"));

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10002169C;
      v10[3] = &unk_1007D7C40;
      v11 = v7;
      v12 = self;
      v13 = v4;
      v14 = v5;
      v8 = v5;
      v9 = v7;
      -[NSObject performBlockAndWait:](v9, "performBlockAndWait:", v10);

    }
    else
    {
      v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10067941C();
    }

  }
}

- (void)primaryCloudKitAccountPersonIDSaltDidFailToSetWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v6 = objc_msgSend(v5, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.ICCloudContext.setPersonID"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021A40;
  v9[3] = &unk_1007D7C68;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

- (void)observePrimaryCloudKitAccountPersonIDSaltChanges
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void ***v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  ICCloudContext *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountPersonIDSaltObserver](self, "accountPersonIDSaltObserver"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountPersonIDSaltObserver](self, "accountPersonIDSaltObserver"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ICCC is already observing primary CK account personIDSalt changes with RDAccountPersonIDSaltObserver {observer: %{public}@}", buf, 0xCu);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100021F04;
    v18[3] = &unk_1007D7C90;
    objc_copyWeak(&v19, (id *)buf);
    v18[4] = self;
    v7 = objc_retainBlock(v18);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10002204C;
    v15 = &unk_1007D7CB8;
    objc_copyWeak(&v17, (id *)buf);
    v16 = self;
    v8 = objc_retainBlock(&v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController", v12, v13, v14, v15));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:successHandler:errorHandler:", v10, v7, v8));
    -[ICCloudContext setAccountPersonIDSaltObserver:](self, "setAccountPersonIDSaltObserver:", v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)unobservePrimaryCloudKitAccountPersonIDSaltChanges
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountPersonIDSaltObserver](self, "accountPersonIDSaltObserver"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountPersonIDSaltObserver](self, "accountPersonIDSaltObserver"));
    objc_msgSend(v4, "unobservePrimaryCloudKitAccountPersonIDSaltChanges:", v5);

    -[ICCloudContext setAccountPersonIDSaltObserver:](self, "setAccountPersonIDSaltObserver:", 0);
  }
}

- (NSDictionary)containersByAccountID
{
  _QWORD *v3;
  NSDictionary *v4;
  _QWORD v6[5];

  if (!-[ICCloudContext supportsCloudKitSyncing](self, "supportsCloudKitSyncing")
    || !-[ICCloudContext isSystemAvailableForSyncing](self, "isSystemAvailableForSyncing")
    || !-[ICCloudContext hasPassedBuddy](self, "hasPassedBuddy"))
  {
    return (NSDictionary *)0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022328;
  v6[3] = &unk_1007D7A60;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  os_unfair_lock_lock(&self->_containersByAccountIDLock);
  ((void (*)(_QWORD *))v3[2])(v3);
  os_unfair_lock_unlock(&self->_containersByAccountIDLock);
  v4 = self->_containersByAccountID;

  return v4;
}

- (void)clearContainers
{
  NSObject *v3;
  NSDictionary *containersByAccountID;
  uint8_t v5[16];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing cloud containers.", v5, 2u);
  }

  os_unfair_lock_lock(&self->_containersByAccountIDLock);
  containersByAccountID = self->_containersByAccountID;
  self->_containersByAccountID = 0;

  os_unfair_lock_unlock(&self->_containersByAccountIDLock);
}

- (id)containerForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  ICCloudContext *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  if (-[ICCloudContext supportsCloudKitSyncing](self, "supportsCloudKitSyncing")
    && -[ICCloudContext isSystemAvailableForSyncing](self, "isSystemAvailableForSyncing")
    && -[ICCloudContext hasPassedBuddy](self, "hasPassedBuddy"))
  {
    if (v4)
    {
      if (objc_msgSend(v4, "length"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMAccount localAccountID](REMAccount, "localAccountID"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
        if (objc_msgSend(v4, "isEqualToString:", v7))
        {

        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[REMAccount localInternalAccountID](REMAccount, "localInternalAccountID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
          v14 = objc_msgSend(v4, "isEqualToString:", v13);

          if (!v14)
          {
LABEL_17:
            v22 = 0;
            v23 = &v22;
            v24 = 0x3032000000;
            v25 = sub_1000228A0;
            v26 = sub_1000228B0;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
            v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v4));

            os_unfair_lock_lock(&self->_containersByAccountIDLock);
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_1000228B8;
            v18[3] = &unk_1007D7D08;
            v21 = &v22;
            v19 = v4;
            v20 = self;
            sub_1000228B8(v18);
            os_unfair_lock_unlock(&self->_containersByAccountIDLock);

            v9 = (id)v23[5];
            _Block_object_dispose(&v22, 8);

            goto LABEL_14;
          }
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to create CKContainer for Local/LocalInternal account: %@"), v4));
        objc_msgSend((id)objc_opt_class(self, v16), "faultAndPromptToFileRadarWithICTap2RadarType:logMessage:", 6, v15);

        goto LABEL_17;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        sub_100679524();
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        sub_1006794F8();
    }

  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (id)containerAccountIDsDescription
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));

  if (v4)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@ }"), v4));
  else
    v5 = CFSTR("{ }");

  return v5;
}

- (id)accountIDForDatabase:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "container"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountOverrideInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountID"));

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD block[5];

  if (-[ICCloudContext shouldUnregisterBuddy](self, "shouldUnregisterBuddy"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022B78;
    block[3] = &unk_1007D7A60;
    block[4] = self;
    dispatch_sync(v3, block);

  }
  if (-[ICCloudContext didAddObservers](self, "didAddObservers"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("operationCount"));

  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext retryTimer](self, "retryTimer"));
  objc_msgSend(v5, "invalidate");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](self, "processingSelectorDelayer"));
  objc_msgSend(v6, "cancelPreviousFireRequests");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext pollingSelectorDelayer](self, "pollingSelectorDelayer"));
  objc_msgSend(v7, "cancelPreviousFireRequests");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)ICCloudContext;
  -[ICCloudContext dealloc](&v9, "dealloc");
}

- (id)newBackgroundContext
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v3 = objc_msgSend(v2, "newBackgroundContextWithAuthor:", RDStoreControllerICCloudContextAuthor);

  return v3;
}

- (ICCloudContext)contextWithQueryGenerationTokenEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v5 = objc_msgSend(v4, "newBackgroundContextWithAuthor:enableQueryGenerationToken:", RDStoreControllerICCloudContextAuthor, v3);

  return (ICCloudContext *)v5;
}

- (id)context
{
  return -[ICCloudContext contextWithQueryGenerationTokenEnabled:](self, "contextWithQueryGenerationTokenEnabled:", 1);
}

- (id)contextForAccountID:(id)a3 withBatchFetchHelper:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext context](self, "context"));
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext batchFetchHelperWithContext:](self, "batchFetchHelperWithContext:", v7));
    objc_msgSend(v7, "setBatchFetchHelper:", v8);

  }
  if (objc_msgSend(v6, "length")
    && (objc_msgSend(v7, "__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:", v6) & 1) == 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100679550();

  }
  return v7;
}

- (id)unitTest_contextWithBatchFetchHelperForAccountID:(id)a3
{
  return -[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", a3, 1);
}

- (void)performAndWaitContextWithBatchFetchHelperForAccountID:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022D88;
  v9[3] = &unk_1007D7D30;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", a3, 1));
  v11 = v6;
  v7 = v10;
  v8 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

- (id)mergeLocalObjectsFetchContextAffectingStoreOf:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v6 = objc_msgSend(v5, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.ICCloudContext.mergeLocalObjects"));

  if ((objc_msgSend(v6, "__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:", v4) & 1) == 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1006795B4();

  }
  return v6;
}

- (id)mergeLocalObjectsWriteContextAffectingStoreOf:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v6 = objc_msgSend(v5, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.ICCloudContext.mergeLocalObjects"));

  if ((objc_msgSend(v6, "__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:", v4) & 1) == 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100679618();

  }
  return v6;
}

- (id)internalContextWithBatchFetchHelper
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v4 = objc_msgSend(v3, "newBackgroundContextWithAuthor:", RDStoreControllerICCloudContextInternalAuthor);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext batchFetchHelperWithContext:](self, "batchFetchHelperWithContext:", v4));
  objc_msgSend(v4, "setBatchFetchHelper:", v5);

  return v4;
}

- (id)serverChangeTokenContext
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v3 = objc_msgSend(v2, "newBackgroundContextWithAuthor:enableQueryGenerationToken:", RDStoreControllerICCloudContextServerChangeTokenAuthor, 0);

  return v3;
}

- (id)batchFetchHelperWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  ICBatchFetchHelper *v9;
  void *v10;
  ICBatchFetchHelper *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v6 = objc_msgSend(v5, "fetchBatchSize");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v8 = objc_msgSend(v7, "fetchCacheCountLimit");

  v9 = [ICBatchFetchHelper alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v11 = -[ICBatchFetchHelper initWithQueue:managedObjectContext:batchSize:cacheCountLimit:](v9, "initWithQueue:managedObjectContext:batchSize:cacheCountLimit:", v10, v4, v6, v8);

  return v11;
}

- (BOOL)notificationContainsCloudContextInternalChangesOnly:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = NSManagedObjectContextTransactionAuthorKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  v7 = objc_opt_class(NSString, v6);
  v8 = REMDynamicCast(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  v11 = v9
     && ((objc_msgSend(v9, "isEqualToString:", RDStoreControllerICCloudContextInternalAuthor) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", RDStoreControllerICCloudContextServerChangeTokenAuthor));

  return v11;
}

+ (id)filterNonUploadableChangedManagedObjectIDs:(id)a3 cloudKitStoreIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  v26 = a4;
  if (qword_100852670 != -1)
    dispatch_once(&qword_100852670, &stru_1007D7D50);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entity", v22));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));

        if (v13)
        {
          v14 = objc_msgSend((id)qword_100852668, "containsObject:", v13);
        }
        else
        {
          objc_msgSend(v24, "addObject:", v11);
          v14 = 0;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentStore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

        if (v16)
        {
          v17 = objc_msgSend(v26, "containsObject:", v16) ^ 1;
        }
        else
        {
          objc_msgSend(v22, "addObject:", v11);
          v17 = 0;
        }
        if ((v14 | v17) == 1)
          objc_msgSend(v25, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v24, "count"))
  {
    v18 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      sub_1006796E0();

  }
  if (objc_msgSend(v22, "count", v22))
  {
    v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_10067967C();

  }
  if (objc_msgSend(v25, "count"))
  {
    v20 = objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v20, "minusSet:", v25);
  }
  else
  {
    v20 = v6;
  }

  return v20;
}

+ (BOOL)isNonUploadingTransactionAuthor:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *v6;

  v3 = a3;
  v4 = v3;
  if (qword_100852680 == -1)
  {
    if (v3)
    {
LABEL_3:
      v5 = objc_msgSend((id)qword_100852678, "containsObject:", v4);
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&qword_100852680, &stru_1007D7D70);
    if (v4)
      goto LABEL_3;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_100679744();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "transactionAuthor");
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)cloudKitAccountsInContext:(id)a3
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount allCloudKitAccountsInContext:](REMCDAccount, "allCloudKitAccountsInContext:", a3));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000237D0;
  v6[3] = &unk_1007D7D98;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

- (id)primaryCloudKitAccountInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[ICCloudContext hasPassedBuddy](self, "hasPassedBuddy")
    && -[ICCloudContext isSystemAvailableForSyncing](self, "isSystemAvailableForSyncing"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext appleAccountUtilities](self, "appleAccountUtilities"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount unsafeUntilSystemReady_primaryCloudKitAccountInContext:appleAccountUtilities:](REMCDAccount, "unsafeUntilSystemReady_primaryCloudKitAccountInContext:appleAccountUtilities:", v4, v5));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)readinessLoggingDescription
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  v17 = -[ICCloudContext syncDisabledByServer](self, "syncDisabledByServer");
  v16 = -[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v15 = objc_msgSend(v3, "supportsSyncingToCloudKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSyncSettings sharedSettings](ICSyncSettings, "sharedSettings"));
  v5 = objc_msgSend(v4, "hasOptions:", 16);
  v6 = -[ICCloudContext isDisabled](self, "isDisabled");
  v7 = -[ICCloudContext isDisabledInternal](self, "isDisabledInternal");
  v8 = -[ICCloudContext isSystemAvailableForSyncing](self, "isSystemAvailableForSyncing");
  v9 = -[ICCloudContext hasPassedBuddy](self, "hasPassedBuddy");
  v10 = -[ICCloudContext pendingAccountInitializerCompleteOnLaunch](self, "pendingAccountInitializerCompleteOnLaunch");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountStatusByAccountIDDescription](self, "accountStatusByAccountIDDescription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerAccountIDsDescription](self, "containerAccountIDsDescription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("syncDisabledByServer=%d accountAvailable=%d storeControllerSupportCloudKitSyncing=%d icSyncSetting=%d isDisabled=(%d %d) isSystemAvailableForSyncing=%d passedBuddy=%d pendingAccountInitializerCompleteOnLaunch=%d CKAccountStatusByAccountID=%@ ckContainerAccountIDs=%@"), v17, v16, v15, v5, v6, v7, v8, v9, v10, v11, v12));

  return v13;
}

- (BOOL)isReadyToSyncWithActiveAccountAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;
  unsigned int v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  uint8_t buf[16];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountStatusNumberByAccountID](self, "accountStatusNumberByAccountID"));
    if (objc_msgSend(v5, "count"))
    {

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "isReadyToSyncWithActiveAccountAvailable: accountStatusNumberByAccountID is empty, withActiveAccountAvailable = NO, containersByAccountID is not empty", buf, 2u);
        }

        *((_BYTE *)v19 + 24) = 1;
        goto LABEL_5;
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountStatusNumberByAccountID](self, "accountStatusNumberByAccountID"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100023C10;
  v16[3] = &unk_1007D7DC0;
  v16[4] = &v18;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);

  if (!*((_BYTE *)v19 + 24))
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
LABEL_5:
  if (!-[ICCloudContext isDisabled](self, "isDisabled"))
  {
    v8 = -[ICCloudContext supportsCloudKitSyncing](self, "supportsCloudKitSyncing");
    *((_BYTE *)v19 + 24) = v8;
    if (v8)
    {
      v9 = -[ICCloudContext pendingAccountInitializerCompleteOnLaunch](self, "pendingAccountInitializerCompleteOnLaunch");
      *((_BYTE *)v19 + 24) = v9 ^ 1;
      if ((v9 & 1) == 0)
      {
        v10 = -[ICCloudContext syncDisabledByServer](self, "syncDisabledByServer");
        *((_BYTE *)v19 + 24) = v10 ^ 1;
        if ((v10 & 1) == 0)
        {
          v7 = -[ICCloudContext isCloudKitAccountAvailableRequiringActive:](self, "isCloudKitAccountAvailableRequiringActive:", v3);
          *((_BYTE *)v19 + 24) = v7;
          goto LABEL_11;
        }
      }
    }
    goto LABEL_10;
  }
  v7 = 0;
  *((_BYTE *)v19 + 24) = 0;
LABEL_11:
  _Block_object_dispose(&v18, 8);
  return v7;
}

- (BOOL)isReadyToSync
{
  return -[ICCloudContext isReadyToSyncWithActiveAccountAvailable:](self, "isReadyToSyncWithActiveAccountAvailable:", 0);
}

- (BOOL)isCloudKitAccountAvailable
{
  return -[ICCloudContext isCloudKitAccountAvailableRequiringActive:](self, "isCloudKitAccountAvailableRequiringActive:", 0);
}

- (BOOL)isCloudKitAccountAvailableRequiringActive:(BOOL)a3
{
  id v4;
  char v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023D3C;
  v7[3] = &unk_1007D7DE8;
  v9 = &v11;
  v7[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext context](self, "context"));
  v8 = v4;
  v10 = a3;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (BOOL)_isCloudKitAccountAvailableWithManagedObjectContext:(id)a3 requireActive:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[REMCDAccount allCloudKitAccountsInContext:](REMCDAccount, "allCloudKitAccountsInContext:", a3));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!v4
          || !objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "inactive", (_QWORD)v12))
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (void)disableCloudSyncingIfCurrentVersionNotSuppported
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "minimumClientVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(",")));
  if (objc_msgSend(v5, "count") != (id)3)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_10067989C();
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  v7 = (int)objc_msgSend(v6, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
  v9 = (int)objc_msgSend(v8, "intValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 2));
  v11 = (int)objc_msgSend(v10, "intValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v14[0] = v7;
  v14[1] = v9;
  v14[2] = v11;
  LODWORD(v7) = objc_msgSend(v12, "isOperatingSystemAtLeastVersion:", v14);

  if (!(_DWORD)v7)
  {
    -[ICCloudContext setSyncDisabledByServer:](self, "setSyncDisabledByServer:", 1);
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100679808();
LABEL_8:

    goto LABEL_9;
  }
  -[ICCloudContext setSyncDisabledByServer:](self, "setSyncDisabledByServer:", 0);
LABEL_9:

}

- (void)updateConfiguration
{
  -[ICCloudContext disableCloudSyncingIfCurrentVersionNotSuppported](self, "disableCloudSyncingIfCurrentVersionNotSuppported");
  -[ICCloudContext updateSelectorDelayers](self, "updateSelectorDelayers");
}

- (void)updateSelectorDelayers
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  ICCloudContext *v7;
  void *v8;
  ICSelectorDelayer *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "throttlingPolicy"));
  objc_msgSend(v4, "batchInterval");
  v6 = v5;

  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](v7, "processingSelectorDelayer"));

  if (!v8)
  {
    v9 = -[ICSelectorDelayer initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:]([ICSelectorDelayer alloc], "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v7, "processPendingCloudObjects", 1, 1, v6);
    -[ICCloudContext setProcessingSelectorDelayer:](v7, "setProcessingSelectorDelayer:", v9);

  }
  objc_sync_exit(v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](v7, "processingSelectorDelayer"));
  objc_msgSend(v10, "setDelay:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](v7, "processingSelectorDelayer"));
  v12 = objc_msgSend(v11, "isScheduledToFire");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](v7, "processingSelectorDelayer"));
    objc_msgSend(v13, "cancelPreviousFireRequests");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](v7, "processingSelectorDelayer"));
    objc_msgSend(v14, "requestFire");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext pollingSelectorDelayer](v7, "pollingSelectorDelayer"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
    objc_msgSend(v16, "pollingInterval");
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext pollingSelectorDelayer](v7, "pollingSelectorDelayer"));
    objc_msgSend(v19, "setDelay:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext pollingSelectorDelayer](v7, "pollingSelectorDelayer"));
    v21 = objc_msgSend(v20, "isScheduledToFire");

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext pollingSelectorDelayer](v7, "pollingSelectorDelayer"));
      objc_msgSend(v22, "cancelPreviousFireRequests");

      v23 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext pollingSelectorDelayer](v7, "pollingSelectorDelayer"));
      objc_msgSend(v23, "requestFire");

    }
  }
}

- (void)handleUnrecoverableError
{
  -[ICCloudContext deleteAllServerChangeTokens](self, "deleteAllServerChangeTokens");
  -[ICCloudContext syncWithReason:discretionary:completionHandler:](self, "syncWithReason:discretionary:completionHandler:", CFSTR("UnrecoverableError"), 0, 0);
}

+ (id)_systemBuildVersion
{
  if (qword_100852688 != -1)
    dispatch_once(&qword_100852688, &stru_1007D7E08);
  return (id)qword_100852690;
}

+ (id)_cloudObjectClassesByRecordType
{
  if (qword_100852698 != -1)
    dispatch_once(&qword_100852698, &stru_1007D7E28);
  return (id)qword_1008526A0;
}

- (NSDictionary)cloudObjectClassesByRecordType
{
  return (NSDictionary *)objc_msgSend((id)objc_opt_class(self, a2), "_cloudObjectClassesByRecordType");
}

+ (id)_recordTypesToSortChildrenAfterFetch
{
  if (qword_1008526A8 != -1)
    dispatch_once(&qword_1008526A8, &stru_1007D7E48);
  return (id)qword_1008526B0;
}

+ (id)appZoneID
{
  if (qword_1008526C0 != -1)
    dispatch_once(&qword_1008526C0, &stru_1007D7E68);
  return (id)qword_1008526B8;
}

+ (id)migrationZoneID
{
  if (qword_1008526D0 != -1)
    dispatch_once(&qword_1008526D0, &stru_1007D7E88);
  return (id)qword_1008526C8;
}

+ (id)metadataZoneID
{
  if (qword_1008526E0 != -1)
    dispatch_once(&qword_1008526E0, &stru_1007D7EA8);
  return (id)qword_1008526D8;
}

- (void)reachabilityChanged:(id)a3
{
  _BOOL8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = +[ICUtilities isInternetReachable](ICUtilities, "isInternetReachable", a3);
  if (v4 != -[ICCloudContext wasInternetReachable](self, "wasInternetReachable"))
  {
    -[ICCloudContext setWasInternetReachable:](self, "setWasInternetReachable:", v4);
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      v7 = v6;

      -[ICCloudContext lastSyncSinceInternetReachable](self, "lastSyncSinceInternetReachable");
      v9 = v7 - v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
      objc_msgSend(v10, "reachabilityChangeSyncThrottleInterval");
      v12 = v11;

      if (v9 >= v12)
      {
        -[ICCloudContext setLastSyncSinceInternetReachable:](self, "setLastSyncSinceInternetReachable:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userDefaults"));
        objc_msgSend(v17, "setDouble:forKey:", CFSTR("CloudKitLastSyncSinceInternetReachable"), v7);

        v14 = 1;
      }
      else
      {
        v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Re-gain internet connection after losing it for a short time. Not going to sync. (throttled)", buf, 2u);
        }

        v14 = 2;
      }
      v18 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cloud context found an internet connection.", v20, 2u);
      }

      -[ICCloudContext processPendingCloudObjectsWithOperationName:](self, "processPendingCloudObjectsWithOperationName:", ICNSBlockOperationNameProcessObjectsForReachabilityChanged);
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Cloud context lost an internet connection.", v19, 2u);
      }

      v14 = 0;
    }
    -[ICCloudContext updateCloudContextStateWithSyncOption:syncReason:withCompletionHandler:](self, "updateCloudContextStateWithSyncOption:syncReason:withCompletionHandler:", v14, CFSTR("ReachabilityChanged"), &stru_1007D7EE8);
  }
}

- (void)cloudKitAccountChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024CC4;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)hasPendingOperations
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v3 = objc_msgSend(v2, "operationCount") != 0;

  return v3;
}

- (void)printOperationQueue
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v4 = objc_msgSend(v3, "operationCount");

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  else
    v5 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operations"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11), "ic_loggingDescription"));
        objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@"), v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }

  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
      v16 = objc_msgSend(v15, "operationCount");
      *(_DWORD *)buf = 67109378;
      v22 = v16;
      v23 = 2114;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Operation queue has %d operation(s):%{public}@", buf, 0x12u);

    }
  }
  else if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Operation queue has 0 operations", buf, 2u);
  }

}

- (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4
{
  id v5;
  NSObject *v6;
  dispatch_queue_global_t global_queue;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  const char *v12;
  uint8_t buf[4];
  const char *v14;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding os_state handler: %{public}s", buf, 0xCu);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025240;
  v10[3] = &unk_1007D7F60;
  v11 = v5;
  v12 = a3;
  v9 = v5;
  os_state_add_handler(v8, v10);

}

- (void)addStateHandler
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100025500;
  v3[3] = &unk_1007D7F88;
  objc_copyWeak(&v4, &location);
  -[ICCloudContext addStateHandlerWithName:stateBlock:](self, "addStateHandlerWithName:stateBlock:", "Cloud Context", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)status
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v3 = objc_msgSend(v2, "operationCount");

  if (v3)
    return CFSTR("Syncing in progress");
  else
    return CFSTR("No Sync in progress");
}

- (id)configurationDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  ICCloudSchemaCatchUpSyncContext *v14;
  void *v15;
  ICCloudSchemaCatchUpSyncContext *v16;
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
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  id obj;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), 20240715));
  v7 = v3;
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("runtimeCloudKitSchemaVersion"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v12, 0));
        v14 = [ICCloudSchemaCatchUpSyncContext alloc];
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "cloudSchemaCatchUpSyncSchedulingStateStorage"));
        v16 = -[ICCloudSchemaCatchUpSyncContext initWithAccountIdentifier:syncReason:schedulingStateStorage:managedObjectContext:](v14, "initWithAccountIdentifier:syncReason:schedulingStateStorage:managedObjectContext:", v12, CFSTR("DumpConfig"), v15, v13);

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("accountIdentifier: %@ -> version: %ld"), v12, -[ICCloudSchemaCatchUpSyncContext persistenceCloudSchemaVersion](v16, "persistenceCloudSchemaVersion")));
        objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("persistenceCloudSchemaVersion"));

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v9);
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "cloudKitSchemaCatchUpSyncLastSuccessDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v18));
  objc_msgSend(v7, "setObject:forKey:", v19, CFSTR("cloudKitSchemaCatchUpSyncLastSuccessDate"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "cloudKitSchemaCatchUpSyncLastSuccessBuildVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v20));
  objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("cloudKitSchemaCatchUpSyncLastSuccessBuildVersion"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "cloudSchemaCatchUpSyncSchedulingStateStorage"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v22, "schedulingState")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v23));
  objc_msgSend(v7, "setObject:forKey:", v24, CFSTR("cloudKitSchemaCatchUpSyncSchedulingState"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "cloudSchemaCatchUpSyncSchedulingStateStorage"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastScheduledDate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v26));
  objc_msgSend(v7, "setObject:forKey:", v27, CFSTR("cloudKitSchemaCatchUpSyncLastScheduledDate"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "throttlingPolicy"));
  objc_msgSend(v28, "batchInterval");
  v30 = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v30));
  objc_msgSend(v7, "setObject:forKey:", v31, CFSTR("throttlingPolicy.processingInterval"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "minimumClientVersion"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v32));
  objc_msgSend(v7, "setObject:forKey:", v33, CFSTR("minimumClientOSSupportedByServer"));

  objc_msgSend(v61, "pollingInterval");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v34));
  objc_msgSend(v7, "setObject:forKey:", v35, CFSTR("pollingInterval"));

  objc_msgSend(v61, "reachabilityChangeSyncThrottleInterval");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v36));
  objc_msgSend(v7, "setObject:forKey:", v37, CFSTR("reachabilityChangeSyncThrottleInterval"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "resultsLimitPerSyncOperation")));
  objc_msgSend(v7, "setObject:forKey:", v38, CFSTR("resultsLimitPerSyncOperation"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "resultsLimitPerSyncOperation")));
  objc_msgSend(v7, "setObject:forKey:", v39, CFSTR("numberOfRecordsToProcessBeforeSaving"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "fetchBatchSize")));
  objc_msgSend(v7, "setObject:forKey:", v40, CFSTR("fetchBatchSize"));

  objc_msgSend(v61, "persistedSubscriptionIDsValidityPeriod");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v41));
  objc_msgSend(v7, "setObject:forKey:", v42, CFSTR("persistedSubscriptionIDsValidityPeriod"));

  objc_msgSend(v61, "mergeLocalObjectsInitialRetryInterval");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v43));
  objc_msgSend(v7, "setObject:forKey:", v44, CFSTR("mergeLocalObjectsInitialRetryInterval"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "mergeLocalObjectsMaximumRetryCount")));
  objc_msgSend(v7, "setObject:forKey:", v45, CFSTR("mergeLocalObjectsMaximumRetryCount"));

  objc_msgSend(v61, "mergeLocalObjectsRetryStartOverThrottleInterval");
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v46));
  objc_msgSend(v7, "setObject:forKey:", v47, CFSTR("mergeLocalObjectsRetryStartOverThrottleInterval"));

  objc_msgSend(v61, "cloudSchemaCatchUpSyncInitialRetryInterval");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v48));
  objc_msgSend(v7, "setObject:forKey:", v49, CFSTR("cloudSchemaCatchUpSyncInitialRetryInterval"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "cloudSchemaCatchUpSyncMaximumRetryCount")));
  objc_msgSend(v7, "setObject:forKey:", v50, CFSTR("cloudSchemaCatchUpSyncMaximumRetryCount"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount")));
  objc_msgSend(v7, "setObject:forKey:", v51, CFSTR("fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "objectEffectiveVersionValidationFlushBatchSize")));
  objc_msgSend(v7, "setObject:forKey:", v52, CFSTR("objectEffectiveVersionValidationFlushBatchSize"));

  objc_msgSend(v61, "manualSortHintClientSideExpiration");
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v53));
  objc_msgSend(v7, "setObject:forKey:", v54, CFSTR("manualSortHintClientSideExpiration"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "manualSortHintLastAccessedUpdatePolicy"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v55));
  objc_msgSend(v7, "setObject:forKey:", v56, CFSTR("manualSortHintLastAccessedUpdatePolicy"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext _systemBuildVersion](ICCloudContext, "_systemBuildVersion"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v57));
  objc_msgSend(v7, "setObject:forKey:", v58, CFSTR("_systemBuildVersion"));

  return v7;
}

- (id)allZoneIDs
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext appZoneID](ICCloudContext, "appZoneID"));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext metadataZoneID](ICCloudContext, "metadataZoneID"));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

- (void)receivedZoneNotFound:(id)a3 operation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "database"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v8));

  if (!objc_msgSend(v9, "length"))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_loggingDescription"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_loggingDescription"));
      v20 = 138543874;
      v21 = v18;
      v22 = 2114;
      v23 = v19;
      v24 = 2114;
      v25 = v9;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "accountID is nil or empty in receivedZoneNotFound: %{public}@ %{public}@, accountID: %{public}@", (uint8_t *)&v20, 0x20u);

    }
  }
  v11 = objc_msgSend(v6, "ic_isOwnedByCurrentUser");
  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13)
      sub_10067999C();

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingToBeSaved](self, "accountZoneIDsNeedingToBeSaved"));
    objc_msgSend(v14, "ic_addZoneID:forAccountID:", v6, v9);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate"));
    objc_msgSend(v15, "cloudContext:receivedZoneNotFound:accountID:", self, v6, v9);
  }
  else
  {
    if (v13)
      sub_100679A28();

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingFetchChanges](self, "accountZoneIDsNeedingFetchChanges"));
    objc_msgSend(v16, "ic_removeZoneID:forAccountID:", v6, v9);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate"));
    objc_msgSend(v15, "cloudContext:sharedZoneWasDeleted:accountID:", self, v6, v9);
  }

  -[ICCloudContext saveZoneFetchState](self, "saveZoneFetchState");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "database"));
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:", v6, objc_msgSend(v17, "databaseScope"), v9);

}

+ (id)allCloudObjectIDsOfClassesPassingTest:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cloudObjectClassesByRecordType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));

  if (v6)
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_objectsPassingTest:", v6));
  else
    v11 = v10;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "allCloudObjectIDsInContext:", v7, (_QWORD)v19));
        if (v17)
          objc_msgSend(v8, "addObjectsFromArray:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v8;
}

- (id)allDirtyCloudObjectIDsInContext:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "allDirtyCloudObjectIDsInContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

+ (id)allDirtyCloudObjectIDsInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject allDirtyCloudObjectIDsInContext:](REMCDObject, "allDirtyCloudObjectIDsInContext:", v3));

  if (v5)
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

- (BOOL)_generateAndSavePersonIDSaltIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  v6 = objc_msgSend(v5, "enableAutoGenerateCKPersonIDSalt");

  if (!v6)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if ((isCloudContextSyncReasonUserInitiated(v4) & 1) == 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not generating PersonIDSalt because the sync reason wasn't initiated by the user {reason: %@}", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_7;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
  v8 = objc_msgSend(v7, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.ICCloudContext.setPersonIDSalt"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002669C;
  v13[3] = &unk_1007D7FB0;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  p_buf = &buf;
  objc_msgSend(v9, "performBlockAndWait:", v13);
  v10 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_8:

  return v10;
}

- (void)syncWithReason:(id)a3 discretionary:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  BOOL v36;
  id v37;
  _QWORD block[6];
  id v39;
  NSObject *v40;
  _QWORD *v41;
  os_signpost_id_t v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SYNC[FULL] START {reason: %{public}@}", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.remindd.cloudkit.sync.full[%@]"), v8));
  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: %{public}@}", buf, 0xCu);
  }

  v13 = objc_retainAutorelease(v11);
  v14 = (void *)os_transaction_create(objc_msgSend(v13, "cStringUsingEncoding:", 1));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100026B54;
  v44[3] = &unk_1007D7FD8;
  v15 = v9;
  v47 = v15;
  v16 = v13;
  v45 = v16;
  v17 = v14;
  v46 = v17;
  v18 = objc_retainBlock(v44);
  if (!-[ICCloudContext isReadyToSync](self, "isReadyToSync"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext storeController](self, "storeController"));
    v29 = objc_msgSend(v28, "supportsSyncingToCloudKit");

    if ((v29 & 1) != 0)
    {
      v30 = -[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable");
      v31 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
      if ((v30 & 1) != 0)
      {
        if (v32)
          sub_100679B0C(self, v31);
        goto LABEL_17;
      }
      if (v32)
        sub_100679B8C();

    }
    else
    {
      v35 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_100679BB8();

    }
    v27 = 0;
    goto LABEL_25;
  }
  if (!-[ICCloudContext isInternetReachable](self, "isInternetReachable"))
  {
    v31 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_100679AE0();
LABEL_17:

    v34 = objc_msgSend((id)objc_opt_class(self, v33), "errorForDisabledCloudSyncing");
    v27 = (id)objc_claimAutoreleasedReturnValue(v34);
LABEL_25:
    ((void (*)(_QWORD *, id))v18[2])(v18, v27);
    goto LABEL_26;
  }
  v36 = a4;
  v37 = v8;
  v19 = objc_claimAutoreleasedReturnValue(+[REMSignpost sync](REMSignpost, "sync"));
  v20 = os_signpost_id_generate(v19);
  v21 = v19;
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "cloudkit.full", ", buf, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v24 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026C38;
  block[3] = &unk_1007D8078;
  block[4] = self;
  block[5] = v37;
  v43 = v36;
  v39 = v23;
  v40 = v22;
  v42 = v20;
  v41 = v18;
  v25 = v22;
  v26 = v23;
  v8 = v37;
  v27 = v26;
  dispatch_async(v24, block);

LABEL_26:
}

- (void)_syncWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  ICCloudContext *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  __CFString *v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:syncReason:](self, "setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:syncReason:", v10, v6));
  v12 = objc_msgSend(v11, "count");
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
    else
      v14 = CFSTR("NONE");
    *(_DWORD *)buf = 138543362;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SYNC[FULL] CONTINUE - List of accountIDs that need to perform CloudSchemaCatchUpSync: {%{public}@}", buf, 0xCu);
    if (v12)

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002777C;
  v18[3] = &unk_1007D80F0;
  v19 = v8;
  v20 = self;
  v21 = v6;
  v22 = v11;
  v23 = v7;
  v24 = v12 != 0;
  v15 = v7;
  v16 = v11;
  v17 = v8;
  -[ICCloudContext fetchDatabaseChangesWithReason:cloudSchemaCatchUpSyncContextMap:completionHandler:](self, "fetchDatabaseChangesWithReason:cloudSchemaCatchUpSyncContextMap:completionHandler:", v6, v16, v18);

}

- (void)cancelEverythingWithCompletionHandler:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027C54;
  v8[3] = &unk_1007D8140;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)clearPendingActivity
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](self, "processingSelectorDelayer"));
  objc_msgSend(v3, "cancelPreviousFireRequests");

  v4 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028344;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v4, block);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028598;
  v5[3] = &unk_1007D7A60;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)configureOperation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext lastSyncMetrics](self, "lastSyncMetrics"));
  objc_msgSend(v5, "setOperationCount:", (char *)objc_msgSend(v5, "operationCount") + 1);

  objc_msgSend(v4, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  -[ICCloudContext timeoutIntervalForResource](self, "timeoutIntervalForResource");
  v7 = v6;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));

  objc_msgSend(v8, "setTimeoutIntervalForResource:", v7);
}

- (void)deleteRecordZonesWithZoneIDs:(id)a3 accountID:(id)a4 markZonesAsUserPurged:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, void *);
  void *v25;
  id v26;
  ICCloudContext *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  _BOOL4 v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v31 = v7;
    v32 = 2114;
    v33 = v11;
    v34 = 2114;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting record zones (markZonesAsUserPurged=%d) in account ID %{public}@: %{public}@", buf, 0x1Cu);
  }

  if (objc_msgSend(v11, "length"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v11));
    v15 = objc_msgSend(objc_alloc((Class)CKModifyRecordZonesOperation), "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v10);
    -[ICCloudContext configureOperation:](self, "configureOperation:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "privateCloudDatabase"));
    objc_msgSend(v15, "setDatabase:", v16);
    objc_msgSend(v15, "setMarkZonesAsUserPurged:", v7);
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_100028910;
    v25 = &unk_1007D8208;
    v26 = v11;
    v27 = self;
    v28 = v16;
    v29 = v12;
    v17 = v16;
    objc_msgSend(v15, "setModifyRecordZonesCompletionBlock:", &v22);
    v18 = objc_alloc_init((Class)CKOperationGroup);
    objc_msgSend(v18, "setName:", CFSTR("DeleteRecordZones"), v22, v23, v24, v25);
    objc_msgSend(v18, "setQuantity:", objc_msgSend(v10, "count"));
    objc_msgSend(v18, "setExpectedSendSize:", 1);
    objc_msgSend(v18, "setExpectedReceiveSize:", 1);
    objc_msgSend(v15, "setGroup:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
    objc_msgSend(v19, "addOperation:", v15);

    -[ICCloudContext errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary](self, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
LABEL_9:

    goto LABEL_10;
  }
  v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    sub_100679F24();

  if (v12)
  {
    v21 = ICGenericError();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v21);
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)isFetchingAllRecordZones
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "operations"));
  v4 = objc_msgSend(v3, "copy");

  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(CKFetchRecordZonesOperation, v5);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)isInternetReachable
{
  return +[ICUtilities isInternetReachable](ICUtilities, "isInternetReachable");
}

+ (id)errorForDisabledCloudSyncing
{
  void *v2;
  void *v3;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("Cloud syncing is not enabled.");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminders.cloud"), 1, v2));

  return v3;
}

+ (id)errorFromErrors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  id v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    }
    else
    {
      v7 = CFSTR("Errors");
      v8 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminders.cloud"), 2, v5));

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)errorFromOperations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error", (_QWORD)v18));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v15 = objc_msgSend((id)objc_opt_class(a1, v14), "errorFromErrors:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (double)timeIntervalToRetryAfterFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v24 = 0;
    v25 = (double *)&v24;
    v26 = 0x2020000000;
    v27 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CKErrorRetryAfterKey));

    if (v6)
    {
      v8 = objc_opt_class(NSNumber, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CKErrorRetryAfterKey));
      v11 = REMDynamicCast(v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      objc_msgSend(v12, "doubleValue");
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v16 = REMErrorRetryAfterKey;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", REMErrorRetryAfterKey));

      if (!v17)
      {
        if (objc_msgSend(v4, "code") != (id)2)
          goto LABEL_9;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100029414;
        v23[3] = &unk_1007D8230;
        v23[4] = &v24;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v23);
LABEL_8:

LABEL_9:
        v14 = v25[3];
        _Block_object_dispose(&v24, 8);
        goto LABEL_10;
      }
      v19 = objc_opt_class(NSNumber, v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));
      v20 = REMDynamicCast(v19, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v20);
      objc_msgSend(v12, "doubleValue");
    }
    *((_QWORD *)v25 + 3) = v13;

    goto LABEL_8;
  }
  v14 = 0.0;
LABEL_10:

  return v14;
}

- (BOOL)canRetryImmediatelyAfterError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.reminders.cloud")))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == (id)2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Errors")));
      goto LABEL_8;
    }
  }
  else
  {

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v10 = objc_msgSend(v9, "isEqualToString:", CKErrorDomain);

  if (v10)
  {
    if (objc_msgSend(v4, "code") == (id)2)
    {
      v12 = objc_opt_class(NSDictionary, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));
      v14 = REMDynamicCast(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allValues"));

LABEL_8:
      if (v8)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v16 = v8;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v16);
              if (-[ICCloudContext canRetryImmediatelyAfterError:](self, "canRetryImmediatelyAfterError:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), (_QWORD)v23))
              {

                goto LABEL_22;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v18)
              continue;
            break;
          }
        }

      }
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "code") == (id)31 || objc_msgSend(v4, "code") == (id)14)
    {
LABEL_22:
      v21 = 1;
      goto LABEL_23;
    }
  }
LABEL_20:
  v21 = 0;
LABEL_23:

  return v21;
}

- (void)finishOperationsForRecordID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICCloudContext *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029794;
  block[3] = &unk_1007D8258;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (NSDictionary)accountStatusNumberByAccountID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForKey:", CFSTR("CloudKitAccountStatus")));

  return (NSDictionary *)v4;
}

- (void)setAccountStatusNumberByAccountID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userDefaults"));

  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("CloudKitAccountStatus"));
  objc_msgSend(v6, "synchronize");

}

- (int64_t)accountStatusFromAccountStatusNumber:(id)a3
{
  return (int)objc_msgSend(a3, "intValue");
}

- (void)setAccountStatus:(int64_t)a3 forAccountID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountStatusNumberByAccountID](self, "accountStatusNumberByAccountID"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountStatusNumberByAccountID](self, "accountStatusNumberByAccountID"));
    v11 = objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v6);

  v10 = objc_msgSend(v11, "copy");
  -[ICCloudContext setAccountStatusNumberByAccountID:](self, "setAccountStatusNumberByAccountID:", v10);

}

- (void)updateAccountStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029F1C;
  v7[3] = &unk_1007D8140;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeStaleAccountStatus
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A428;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)removeStaleFetchDatabaseRetryMetadata
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A6A0;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)accountStatusByAccountIDDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("{")));
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountStatusNumberByAccountID](self, "accountStatusNumberByAccountID"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10002AAD4;
  v11 = &unk_1007D82F8;
  v13 = v14;
  v5 = v3;
  v12 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v8);

  objc_msgSend(v5, "appendString:", CFSTR(" }"), v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v5));

  _Block_object_dispose(v14, 8);
  return v6;
}

- (id)unitTest_accountStatusNumberForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountStatusNumberByAccountID](self, "accountStatusNumberByAccountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)fetchUserRecordOperationWithContainer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  __int128 *p_buf;
  id v18;
  _QWORD v19[5];
  id location;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKFetchRecordsOperation fetchCurrentUserRecordOperation](CKFetchRecordsOperation, "fetchCurrentUserRecordOperation"));
  -[ICCloudContext configureOperation:](self, "configureOperation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateCloudDatabase"));
  objc_msgSend(v8, "setDatabase:", v9);

  objc_initWeak(&location, v8);
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching user record in cloud context {operation: %{public}@}", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = sub_1000228A0;
  v24 = sub_1000228B0;
  v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002AEA0;
  v19[3] = &unk_1007D8320;
  v19[4] = &buf;
  objc_msgSend(v8, "setPerRecordCompletionBlock:", v19);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002AFC8;
  v15[3] = &unk_1007D8348;
  objc_copyWeak(&v18, &location);
  v11 = v7;
  v16 = v11;
  p_buf = &buf;
  objc_msgSend(v8, "setFetchRecordsCompletionBlock:", v15);
  v12 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v12, "setName:", CFSTR("FetchUserRecord"));
  objc_msgSend(v12, "setQuantity:", 1);
  objc_msgSend(v12, "setExpectedSendSize:", 1);
  objc_msgSend(v12, "setExpectedReceiveSize:", 1);
  objc_msgSend(v8, "setGroup:", v12);
  v13 = v8;

  objc_destroyWeak(&v18);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
  return v13;
}

- (id)fetchUserRecordOperationWithAccountID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext fetchUserRecordOperationWithContainer:completionHandler:](self, "fetchUserRecordOperationWithContainer:completionHandler:", v7, v6));

  return v8;
}

- (void)fetchUserRecordWithContainer:(id)a3 completionHandler:(id)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext fetchUserRecordOperationWithContainer:completionHandler:](self, "fetchUserRecordOperationWithContainer:completionHandler:", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "database"));
  objc_msgSend(v4, "addOperation:", v5);

}

- (void)fetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v6));
    -[ICCloudContext fetchUserRecordWithContainer:completionHandler:](self, "fetchUserRecordWithContainer:completionHandler:", v8, v7);

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_10067A164();

    if (v7)
    {
      v10 = ICGenericError();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7[2](v7, 0, v11);

    }
  }

}

- (void)operationQueueFetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext fetchUserRecordOperationWithAccountID:completionHandler:](self, "fetchUserRecordOperationWithAccountID:completionHandler:", v7, v6));

  objc_msgSend(v8, "addOperation:", v9);
  -[ICCloudContext errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary](self, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
}

- (void)updateUserRecordWithAccountID:(id)a3 updateFunction:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  ICCloudContext *v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_10002B44C;
    v19 = &unk_1007D8398;
    v22 = v9;
    v20 = self;
    v21 = v8;
    v23 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext fetchUserRecordOperationWithAccountID:completionHandler:](self, "fetchUserRecordOperationWithAccountID:completionHandler:", v21, &v16));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "database", v16, v17, v18, v19, v20));
    objc_msgSend(v12, "addOperation:", v11);

    v13 = v22;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_10067A190();

    v15 = ICGenericError();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }

}

+ (id)userRecordNameForContainer:(id)a3
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000228A0;
  v15 = sub_1000228B0;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B6F4;
  v8[3] = &unk_1007D83C0;
  v10 = &v11;
  v4 = dispatch_semaphore_create(0);
  v9 = v4;
  objc_msgSend(v3, "fetchUserRecordIDWithCompletionHandler:", v8);
  v5 = dispatch_time(0, 120000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)existingCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v11, v12, v9, v8));
  return v13;
}

- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 || !v12)
  {
    if (v10)
    {
      if (v12)
      {
LABEL_7:
        v16 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v25 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        sub_10067A2D4((uint64_t)v11, (uint64_t)v12, v25);

      if (v12)
        goto LABEL_7;
    }
    v26 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      sub_10067A244((uint64_t)v11, v10);

    goto LABEL_7;
  }
  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType"));
    v15 = objc_msgSend(v14, "objectForKeyedSubscript:", v11);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "existingCloudObjectForRecordID:accountID:context:", v10, v12, v13));
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType", 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allValues"));

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v22), "existingCloudObjectForRecordID:accountID:context:", v10, v12, v13));
          if (v23)
          {
            v16 = (void *)v23;
            goto LABEL_18;
          }
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v20)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_18:

  }
LABEL_19:

  return v16;
}

- (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordType"));
  v13 = objc_msgSend(v11, "objectForKeyedSubscript:", v12);

  v14 = objc_msgSend(v13, "newCloudObjectForRecord:accountID:context:", v10, v9, v8);
  return v14;
}

- (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 recordType:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType"));
  v15 = objc_msgSend(v14, "objectForKeyedSubscript:", v11);

  v16 = objc_msgSend(v15, "newPlaceholderObjectForRecordID:account:context:", v13, v12, v10);
  return v16;
}

- (void)fetchRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 runExclusively:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002BCEC;
  v21[3] = &unk_1007D83E8;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v26 = a6;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, v21);

}

- (void)addFetchOperationsForRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 runExclusively:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v40 = objc_msgSend(v12, "count");
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Adding operations to fetch %ld records", buf, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationsToFetchRecordIDs:operationGroupName:accountID:](self, "operationsToFetchRecordIDs:operationGroupName:accountID:", v12, v14, v13));
  if (v8)
  {
    v19 = (void *)objc_opt_class(self, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
    objc_msgSend(v19, "addRunExclusivelyOperations:operationQueue:", v18, v20);

    if (!v15)
      goto LABEL_15;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
    objc_msgSend(v21, "addOperations:waitUntilFinished:", v18, 0);

    -[ICCloudContext errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary](self, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
    if (!v15)
      goto LABEL_15;
  }
  v30 = v13;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10002BFD4;
  v35[3] = &unk_1007D8410;
  v35[4] = self;
  v22 = v18;
  v36 = v22;
  v37 = v15;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICNSBlockOperation blockOperationWithBlock:](ICNSBlockOperation, "blockOperationWithBlock:", v35));
  objc_msgSend(v23, "setName:", ICNSBlockOperationNameFetchCompletion);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v23, "addDependency:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v26);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  objc_msgSend(v29, "addOperation:", v23);

  -[ICCloudContext errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary](self, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
  v13 = v30;
LABEL_15:

}

- (id)operationsToFetchRecordIDs:(id)a3 operationGroupName:(id)a4 accountID:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  ICCloudContext *v32;
  id v33;
  __int128 *v34;
  uint8_t buf[4];
  void *v36;
  uint8_t v37[128];
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (!objc_msgSend(v10, "length"))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_10067A34C();
    goto LABEL_19;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(v38) = 138543362;
      *(_QWORD *)((char *)&v38 + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No record IDs to fetch, no fetch record operation is created for accountID: %{public}@", (uint8_t *)&v38, 0xCu);
    }
LABEL_19:
    v24 = &__NSArray0__struct;
    goto LABEL_20;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = objc_msgSend((id)objc_opt_class(self, v12), "objectsByDatabaseScope:", v8);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  *(_QWORD *)&v38 = 0;
  *((_QWORD *)&v38 + 1) = &v38;
  v39 = 0x2020000000;
  v40 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002C4D0;
  v30[3] = &unk_1007D8438;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v10));
  v31 = v15;
  v32 = self;
  v16 = v11;
  v33 = v16;
  v34 = &v38;
  -[NSObject enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v30);
  if (!v9)
    v9 = CFSTR("FetchIndividualRecords");
  v17 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v17, "setName:", v9);
  objc_msgSend(v17, "setQuantity:", objc_msgSend(v8, "count"));
  objc_msgSend(v17, "setExpectedSendSize:", 1);
  objc_msgSend(v17, "setExpectedReceiveSize:", CKOperationGroupTransferSizeForBytes(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 24)));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v21), "setGroup:", v17, (_QWORD)v26);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v19);
  }

  v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543362;
    v36 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Fetching records with operation group %{public}@", buf, 0xCu);

  }
  v24 = v18;

  _Block_object_dispose(&v38, 8);
LABEL_20:

  return v24;
}

- (id)operationsToFetchRecordIDs:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  unsigned int v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_arrayByGroupingIntoArraysWithMaxCount:", 100));
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v6, "count");
      v12 = CKDatabaseScopeString(objc_msgSend(v7, "databaseScope"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 67109634;
      v27 = v11;
      v28 = 2114;
      v29 = v13;
      v30 = 1024;
      v31 = objc_msgSend(v9, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Grouping fetch requests for %d %{public}@ records into %d batches", buf, 0x18u);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationToFetchRecordIDs:database:](self, "operationToFetchRecordIDs:database:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v18), v7, (_QWORD)v21));
        objc_msgSend(v8, "addObject:", v19);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v8;
}

- (id)operationToFetchRecordIDs:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id location;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)CKFetchRecordsOperation), "initWithRecordIDs:", v6);
  -[ICCloudContext configureOperation:](self, "configureOperation:", v8);
  objc_msgSend(v8, "setDatabase:", v7);
  v21 = v8;
  objc_initWeak(&location, v8);
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543362;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating %{public}@", buf, 0xCu);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v14);
        v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_loggingDescription"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_loggingDescription"));
          *(_DWORD *)buf = 138543618;
          v34 = v17;
          v35 = 2114;
          v36 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Will fetch %{public}@ %{public}@", buf, 0x16u);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v12);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002CB70;
  v26[3] = &unk_1007D8460;
  v26[4] = self;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v21, "setPerRecordProgressBlock:", v26);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002CBDC;
  v24[3] = &unk_1007D8488;
  v24[4] = self;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v21, "setPerRecordCompletionBlock:", v24);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002CCB8;
  v22[3] = &unk_1007D84B0;
  v22[4] = self;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v21, "setFetchRecordsCompletionBlock:", v22);
  v19 = v21;
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
  return v19;
}

- (void)fetchOperation:(id)a3 progressChangedWithRecordID:(id)a4 progress:(double)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  if (((int)(a5 * 100.0) - 1) <= 0x62)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_loggingDescription"));
      v12 = 138543874;
      v13 = v10;
      v14 = 1024;
      v15 = (int)(a5 * 100.0);
      v16 = 2114;
      v17 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Progress fetching %{public}@: %d%% %{public}@", (uint8_t *)&v12, 0x1Cu);

    }
  }

}

- (void)fetchOperation:(id)a3 recordWasFetchedWithRecordID:(id)a4 record:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CF6C;
  block[3] = &unk_1007D8500;
  block[4] = self;
  v20 = v10;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)fetchOperation:(id)a3 didCompleteWithRecordsByRecordID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  ICCloudContext *v15;

  v7 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D554;
  block[3] = &unk_1007D7CE0;
  v13 = v8;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)didFetchShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootRecordID"));
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RootRecord")));
    if (v12)
    {
      v13 = objc_alloc((Class)CKRecordID);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v11 = objc_msgSend(v13, "initWithRecordName:zoneID:", v15, v17);

    }
    else
    {
      v11 = 0;
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RootRecordType")));
  if (!v18)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "creatorUserRecordID"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recordName"));

    if (v19 && !-[NSObject isEqualToString:](v19, "isEqualToString:", CKCurrentUserDefaultName))
    {
      v27 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        goto LABEL_27;
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_loggingDescription"));
      *(_DWORD *)buf = 138412802;
      v40 = v29;
      v41 = 2114;
      v42 = v35;
      v43 = 2112;
      v44 = (uint64_t)v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "No root record type in share %@ for %{public}@, shareCreatorRecordName %@", buf, 0x20u);

    }
    else
    {
      v27 = objc_claimAutoreleasedReturnValue(+[REMCDAccount cloudKitAccountWithCKIdentifier:context:](REMCDAccount, "cloudKitAccountWithCKIdentifier:context:", v9, v10));
      if (!v27)
      {
        v28 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_10067A550((uint64_t)v9, v11);

      }
      v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_loggingDescription"));
        *(_DWORD *)buf = 138412802;
        v40 = v38;
        v41 = 2114;
        v42 = v33;
        v43 = 2112;
        v44 = objc_claimAutoreleasedReturnValue(-[NSObject ckUserRecordName](v27, "ckUserRecordName"));
        v34 = (void *)v44;
        _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "No root record type in share %@ for %{public}@, default shareUserRecordName %@", buf, 0x20u);

      }
    }

LABEL_27:
    goto LABEL_28;
  }
  if (v11)
  {
    v19 = objc_claimAutoreleasedReturnValue(-[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v11, v18, v9, v10));
    if (v19)
    {
LABEL_9:
      v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_loggingDescription"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v19, "recordType"));
        v37 = v9;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v19, "recordID"));
        v36 = v10;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ic_loggingDescription"));
        *(_DWORD *)buf = 138543874;
        v40 = v22;
        v41 = 2114;
        v42 = v23;
        v43 = 2114;
        v44 = (uint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received share %{public}@ for %{public}@ %{public}@", buf, 0x20u);

        v9 = v37;
        v10 = v36;

      }
      -[NSObject setServerShareIfNewer:](v19, "setServerShareIfNewer:", v8);
      goto LABEL_28;
    }
    v30 = objc_claimAutoreleasedReturnValue(+[REMCDAccount cloudKitAccountWithCKIdentifier:context:](REMCDAccount, "cloudKitAccountWithCKIdentifier:context:", v9, v10));
    if (v30)
    {
      v31 = (void *)v30;
      v19 = -[ICCloudContext newPlaceholderObjectForRecordID:account:recordType:context:](self, "newPlaceholderObjectForRecordID:account:recordType:context:", v11, v30, v18, v10);

      if (v19)
        goto LABEL_9;
    }
    else
    {
      v32 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v40 = v9;
        v41 = 2114;
        v42 = v11;
        v43 = 2114;
        v44 = (uint64_t)v18;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "didFetchShare: Cannot get CK account {ckIdentifier: %{public}@} for newPlaceholderObjectForRecordID {record: %{public}@, rootRecordType: %{public}@}", buf, 0x20u);
      }

    }
    v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10067A670(v8, v19);
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_10067A5DC(v8, v19);
  }
LABEL_28:

}

- (void)deleteSharesForObjects:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext objectsByAccount:](ICCloudContext, "objectsByAccount:", v6));
  if (objc_msgSend(v8, "count"))
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = sub_1000228A0;
    v15[4] = sub_1000228B0;
    v16 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002DD50;
    v9[3] = &unk_1007D8550;
    v9[4] = self;
    v12 = v15;
    v10 = v8;
    v13 = v14;
    v11 = v7;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v9);

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v15, 8);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)deleteSharesForObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = objc_alloc_init((Class)NSMutableArray);
  v12 = objc_alloc_init((Class)NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v18, "isSharedRootObject"))
        {
          objc_msgSend(v11, "addObject:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));
          objc_msgSend(v12, "addObject:", v19);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v11, "count"))
  {
    v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 138543618;
      v34 = v9;
      v35 = 2048;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will Delete Shares in account ID %{public}@ for %lu Objects:", buf, 0x16u);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002E1F8;
    v27[3] = &unk_1007D8578;
    v22 = v9;
    v28 = v22;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:operationGroupName:addDependencies:accountID:](self, "operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:operationGroupName:addDependencies:accountID:", 0, 0, v11, CFSTR("DeleteShares"), 0, v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
    objc_msgSend(v24, "addOperations:waitUntilFinished:", v23, 0);

    -[ICCloudContext errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary](self, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext fetchAndCompletionOperationWithDeleteShareObjects:accountID:dependencyOperations:completionHandler:](self, "fetchAndCompletionOperationWithDeleteShareObjects:accountID:dependencyOperations:completionHandler:", v11, v22, v23, v10));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
    objc_msgSend(v26, "addOperation:", v25);

    -[ICCloudContext errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary](self, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }

}

- (id)fetchAndCompletionOperationWithDeleteShareObjects:(id)a3 accountID:(id)a4 dependencyOperations:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v10 = a3;
  v11 = a4;
  v39 = a5;
  v37 = a6;
  v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = objc_alloc_init((Class)NSMutableSet);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v19, "isSharedRootObject"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectID"));
          objc_msgSend(v12, "addObject:", v20);

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordID"));
          v22 = v21;
          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneID"));
            objc_msgSend(v13, "addObject:", v23);

          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v16);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10002E63C;
  v47[3] = &unk_1007D8608;
  v47[4] = self;
  v24 = v13;
  v48 = v24;
  v38 = v11;
  v49 = v38;
  v25 = v12;
  v50 = v25;
  v26 = v37;
  v51 = v26;
  v27 = objc_retainBlock(v47);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10002E9B0;
  v44[3] = &unk_1007D8410;
  v44[4] = self;
  v28 = v39;
  v45 = v28;
  v29 = v27;
  v46 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICNSBlockOperation blockOperationWithBlock:](ICNSBlockOperation, "blockOperationWithBlock:", v44));
  objc_msgSend(v30, "setName:", ICNSBlockOperationNameDeleteSharesForObjectsFetchAndCompletion);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = v28;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(v30, "addDependency:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v33);
  }

  return v30;
}

- (id)operationsToModifyRecordsForCloudObjectsToSave:(id)a3 delete:(id)a4 deleteShares:(id)a5 operationGroupName:(id)a6 addDependencies:(BOOL)a7 accountID:(id)a8
{
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *k;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  void *m;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  id v78;
  BOOL v80;
  void *v81;
  __CFString *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  NSObject *v99;
  ICCloudContext *v100;
  id v101;
  id v102;
  _BYTE *v103;
  BOOL v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  id v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint8_t v120[4];
  void *v121;
  _BYTE v122[16];
  uint8_t v123[128];
  _BYTE buf[24];
  uint64_t v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];

  v13 = a3;
  v84 = a4;
  v83 = a5;
  v82 = (__CFString *)a6;
  v86 = a8;
  v81 = v13;
  if (!objc_msgSend(v86, "length"))
  {
    v67 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
      sub_10067A76C();
    goto LABEL_72;
  }
  if (!objc_msgSend(v13, "count") && !objc_msgSend(v84, "count") && !objc_msgSend(v83, "count"))
  {
    v67 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v86;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "No cloud objects to save or delete or delelet-share, no modify record operation is created for accountID: %{public}@", buf, 0xCu);
    }
LABEL_72:
    v78 = &__NSArray0__struct;
    goto LABEL_73;
  }
  v80 = a7;
  if (objc_msgSend(v13, "count"))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = objc_msgSend(v13, "count");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v86;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Creating operations to push %ld records for account ID %{public}@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v84, "count"))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v84, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v86;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Creating operations to delete %ld records for account ID %{public}@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v83, "count"))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v83, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v86;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Creating operations to delete %ld share records for account ID %{public}@", buf, 0x16u);
    }

  }
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v117 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "recordID"));
        if (v24)
          objc_msgSend(v88, "setObject:forKeyedSubscript:", v23, v24);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
    }
    while (v20);
  }

  v25 = objc_msgSend(v19, "mutableCopy");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = (void *)objc_opt_class(self, v27);
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_10002F690;
  v113[3] = &unk_1007D8630;
  v87 = v25;
  v114 = v87;
  v89 = v26;
  v115 = v89;
  objc_msgSend(v28, "recursivelyFixCrossZoneRelationship:perObjectHandler:", v19, v113);
  if (objc_msgSend(v89, "count"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Records with cross zone relationship are found. Will try to delete old records and upload new records. {count: %lu}"), objc_msgSend(v89, "count")));
    objc_msgSend((id)objc_opt_class(self, v30), "faultAndPromptToFileRadarWithICTap2RadarType:logMessage:", 4, v29);

  }
  v31 = v82;
  if (!v82)
    v31 = CFSTR("ModifyRecords");
  v82 = (__CFString *)v31;
  v91 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v91, "setName:", v82);
  objc_msgSend(v91, "setQuantity:", (char *)objc_msgSend(v83, "count")+ (_QWORD)objc_msgSend(v87, "count")+ (_QWORD)objc_msgSend(v89, "count")+ (unint64_t)objc_msgSend(v84, "count"));
  objc_msgSend(v91, "setExpectedReceiveSize:", 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = objc_msgSend((id)objc_opt_class(self, v32), "deduplicatedRecordsForCloudObjects:", v84);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v89, "addObjectsFromArray:", v34);

  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v35 = v83;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v110;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        if (*(_QWORD *)v110 != v37)
          objc_enumerationMutation(v35);
        v39 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)j);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "ckServerShare"));
        v41 = v40;
        if (v40)
        {
          if (objc_msgSend(v40, "ic_isOwnedByCurrentUser"))
          {
            objc_msgSend(v39, "setCkServerShare:", 0);
            objc_msgSend(v87, "addObject:", v39);
          }
          objc_msgSend(v89, "addObject:", v41);
          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "recordID"));
          if (v42)
          {
            v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "recordID"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recordID"));
            objc_msgSend(v93, "setObject:forKeyedSubscript:", v43, v44);

          }
          else
          {
            v43 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "shortLoggingDescription"));
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v86;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "No root record ID when trying to delete share for %{public}@ for account ID %{public}@", buf, 0x16u);

            }
          }

        }
        else
        {
          v42 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "ckServerRecord"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "ic_loggingDescription"));
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v46;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v86;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Record to delete share from doesn't have a server share %{public}@ for accountID %{public}@", buf, 0x16u);

          }
        }

      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
    }
    while (v36);
  }

  v49 = objc_msgSend((id)objc_opt_class(self, v48), "deduplicatedRecordsForCloudObjects:", v87);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v85 = objc_msgSend(v50, "mutableCopy");

  objc_msgSend(v89, "ic_removeRecordsWithSameCKRecordIDInRecords:", v85);
  v52 = objc_msgSend((id)objc_opt_class(self, v51), "objectsByDatabaseScope:", v85);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v55 = objc_msgSend((id)objc_opt_class(self, v54), "objectsByDatabaseScope:", v89);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v86));
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v58 = objc_msgSend(&off_100804BE8, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v106;
    do
    {
      for (k = 0; k != v58; k = (char *)k + 1)
      {
        if (*(_QWORD *)v106 != v59)
          objc_enumerationMutation(&off_100804BE8);
        v61 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)k);
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "databaseWithDatabaseScope:", objc_msgSend(v61, "integerValue")));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v61));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v61));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationsToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:](self, "operationsToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:", v63, v64, v93, v62));
        objc_msgSend(v90, "addObjectsFromArray:", v65);

      }
      v58 = objc_msgSend(&off_100804BE8, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
    }
    while (v58);
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationToSaveZonesIfNecessaryForAccountID:](self, "operationToSaveZonesIfNecessaryForAccountID:", v86));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v125 = 0;
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_10002F6E8;
  v98[3] = &unk_1007D8658;
  v67 = v88;
  v99 = v67;
  v100 = self;
  v103 = buf;
  v104 = v80;
  v68 = v66;
  v101 = v68;
  v69 = v90;
  v102 = v69;
  objc_msgSend(v69, "enumerateObjectsUsingBlock:", v98);
  objc_msgSend(v91, "setExpectedSendSize:", CKOperationGroupTransferSizeForBytes(*(_QWORD *)(*(_QWORD *)&buf[8] + 24)));
  if (v68)
    objc_msgSend(v69, "addObject:", v68);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v70 = v69;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v94, v123, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v95;
    do
    {
      for (m = 0; m != v71; m = (char *)m + 1)
      {
        if (*(_QWORD *)v95 != v72)
          objc_enumerationMutation(v70);
        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)m), "setGroup:", v91);
      }
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v94, v123, 16);
    }
    while (v71);
  }

  if ((unint64_t)objc_msgSend(v70, "count") >= 2)
  {
    v74 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      sub_10067A798((uint64_t)v122, (uint64_t)objc_msgSend(v70, "count"), v74);

  }
  v75 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "ic_loggingDescription"));
    *(_DWORD *)v120 = 138543362;
    v121 = v76;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "Modifying records with operation group %{public}@", v120, 0xCu);

  }
  v77 = v102;
  v78 = v70;

  _Block_object_dispose(buf, 8);
LABEL_73:

  return v78;
}

+ (void)batchRecordsToSave:(id)a3 delete:(id)a4 maxRecordCountPerBatch:(unint64_t)a5 maxRecordSizePerBatch:(unint64_t)a6 withBlock:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  unsigned int v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  char *v36;
  id v37;
  unint64_t v38;
  char *v39;
  BOOL v40;
  char v41;
  NSObject *v42;
  unint64_t v43;
  BOOL v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  char *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void (**v68)(id, _QWORD, id, id);
  uint64_t v69;
  void *v70;
  void *v72;
  char v73;
  char v74[15];
  char v75;
  char v76[15];
  char v77[16];
  char v78[16];
  char v79[16];
  _QWORD v80[2];
  uint8_t buf[4];
  _BYTE v82[28];
  __int16 v83;
  unint64_t v84;

  v10 = a3;
  v11 = a4;
  v68 = (void (**)(id, _QWORD, id, id))a7;
  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_map:", &stru_1007D8698));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_map:", &stru_1007D86B8));
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v82 = v64;
    *(_WORD *)&v82[8] = 2112;
    *(_QWORD *)&v82[10] = v65;
    *(_WORD *)&v82[18] = 2048;
    *(_QWORD *)&v82[20] = a5;
    v83 = 2048;
    v84 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Batching with recordsToSave:%@ recordsToDelete:%@, maxRecordCountPerBatch:%lu, maxRecordSizePerBatch:%lu", buf, 0x2Au);

  }
  v67 = v10;
  v13 = objc_msgSend(v10, "mutableCopy");
  v14 = v11;
  v15 = v13;
  v66 = v14;
  v16 = objc_msgSend(v14, "mutableCopy");
  v17 = 0;
  v70 = v16;
  while (objc_msgSend(v15, "count") || objc_msgSend(v16, "count"))
  {
    v69 = v17 + 1;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
    v19 = 0;
    while (1)
    {
      if (objc_msgSend(v15, "count"))
      {
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v20, "recordType"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAlarm ckRecordType](REMCDAlarm, "ckRecordType"));
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if ((unint64_t)objc_msgSend(v15, "count") < 2)
          v24 = 0;
        else
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordType"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAlarmTrigger ckRecordType](REMCDAlarmTrigger, "ckRecordType"));
        v30 = objc_msgSend(v28, "isEqualToString:", v29);

        LODWORD(v29) = v23 & v30;
        v31 = (char *)-[NSObject size](v20, "size");
        v32 = v31;
        if ((_DWORD)v29 == 1)
        {
          v33 = (char *)objc_msgSend(v24, "size");
          v34 = &v32[v19];
          v35 = a6;
          v36 = &v33[(_QWORD)v34];
          v37 = objc_msgSend(v18, "count");
          v38 = v35;
          v39 = (char *)objc_msgSend(v72, "count") + (_QWORD)v37 + 2;
          v40 = (unint64_t)v36 >= v35 || (unint64_t)v39 > a5;
          v41 = v40;
          v27 = v40 && v19 == 0;
          if (v27)
          {
            v42 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v20, "recordID"));
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordID"));
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)v82 = v54;
              *(_WORD *)&v82[8] = 2114;
              *(_QWORD *)&v82[10] = v55;
              _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Ending batch because an impossible batch was detected ICCloudContext. Alarm: %{public}@ AlarmTrigger: %{public}@", buf, 0x16u);

            }
LABEL_51:
            v49 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v20, "recordID"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordID"));
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v82 = v52;
              *(_WORD *)&v82[8] = 2112;
              *(_QWORD *)&v82[10] = v53;
              _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Adding Alarm/AlarmTrigger pair to batch: %@ %@", buf, 0x16u);

            }
            objc_msgSend(v15, "removeObjectsInRange:", 0, 2);
            v80[0] = v20;
            v80[1] = v24;
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 2));
            objc_msgSend(v18, "addObjectsFromArray:", v50);

            v19 = (unint64_t)v36;
          }
          else
          {
            if ((v41 & 1) == 0)
              goto LABEL_51;
            v48 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              v56 = (unint64_t)v39 <= a5;
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v20, "recordID"));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordID"));
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v82 = v56;
              *(_WORD *)&v82[4] = 2112;
              *(_QWORD *)&v82[6] = v57;
              *(_WORD *)&v82[14] = 2112;
              *(_QWORD *)&v82[16] = v58;
              _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Ending batch because Alarm/AlarmTrigger pair does not fit isCountOK: %d Alarm: %@ AlarmTrigger: %@", buf, 0x1Cu);

            }
            v27 = 1;
          }
          a6 = v38;
        }
        else
        {
          v43 = (unint64_t)&v31[v19];
          if (v19)
            v44 = 0;
          else
            v44 = v43 >= a6;
          v27 = v44;
          if (v44 || v43 < a6)
          {
            if (v27)
            {
              v46 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                sub_10067A870((uint64_t)v79, (uint64_t)v20);

            }
            v47 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              sub_10067A824((uint64_t)v78, (uint64_t)v20);

            objc_msgSend(v15, "removeObjectAtIndex:", 0);
            objc_msgSend(v18, "addObject:", v20);
            v19 = v43;
          }
          else
          {
            v45 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              sub_10067A8CC((uint64_t)v77, (uint64_t)v20);

            v27 = 1;
          }
        }

        goto LABEL_56;
      }
      if (objc_msgSend(v70, "count"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "firstObject"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recordID"));

        v26 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v82 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Adding record to delete batch: %@", buf, 0xCu);
        }

        objc_msgSend(v70, "removeObjectAtIndex:", 0);
        objc_msgSend(v72, "addObject:", v20);
        v27 = 0;
      }
      else
      {
        v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          sub_10067A7FC(&v75, v76);
        v27 = 1;
      }
LABEL_56:

      v51 = (char *)objc_msgSend(v18, "count");
      if (&v51[(_QWORD)objc_msgSend(v72, "count")] >= (char *)a5)
        break;
      if (v27)
        goto LABEL_65;
    }
    v59 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      sub_10067A7D4(&v73, v74);

LABEL_65:
    v60 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ic_map:", &stru_1007D86D8));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v82 = v63;
      *(_WORD *)&v82[8] = 2112;
      *(_QWORD *)&v82[10] = v72;
      _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "Finished batch with batchRecordsToSave:%@ batchRecordIDsToDelete:%@", buf, 0x16u);

    }
    v61 = objc_msgSend(v18, "copy");
    v62 = objc_msgSend(v72, "copy");
    v17 = v69;
    v68[2](v68, v69, v61, v62);

    v16 = v70;
  }

}

- (id)operationsToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!v10)
  {
    v18 = 0;
    if (v11)
      goto LABEL_3;
LABEL_5:
    v28 = 0;
    goto LABEL_6;
  }
  v16 = objc_msgSend((id)objc_opt_class(self, v14), "sortedRecords:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_msgSend(v17, "mutableCopy");

  if (!v11)
    goto LABEL_5;
LABEL_3:
  v19 = objc_msgSend((id)objc_opt_class(self, v14), "sortedRecords:", v11);
  v36 = v13;
  v20 = v12;
  v21 = v18;
  v22 = v11;
  v23 = v10;
  v24 = v15;
  v25 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "reverseObjectEnumerator"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allObjects"));
  v28 = objc_msgSend(v27, "mutableCopy");

  v15 = v24;
  v10 = v23;
  v11 = v22;
  v18 = v21;
  v12 = v20;
  v13 = v36;
LABEL_6:
  v29 = (void *)objc_opt_class(self, v14);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100030428;
  v37[3] = &unk_1007D8700;
  v37[4] = self;
  v38 = v12;
  v39 = v13;
  v30 = v15;
  v40 = v30;
  v31 = v13;
  v32 = v12;
  objc_msgSend(v29, "batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:", v18, v28, 100, 0x200000, v37);
  v33 = v40;
  v34 = v30;

  return v34;
}

- (id)operationToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  ICCloudContext *v38;
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
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];

  v10 = a3;
  v11 = a4;
  v37 = a5;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10067A918();

  v39 = v11;
  v40 = v10;
  v14 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v10, v11);
  v38 = self;
  -[ICCloudContext configureOperation:](self, "configureOperation:", v14);
  v36 = v12;
  objc_msgSend(v14, "setDatabase:", v12);
  v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543362;
    v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Creating modify operation %{public}@", buf, 0xCu);

  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordsToSave"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v23 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ic_loggingDescription"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_loggingDescription"));
          *(_DWORD *)buf = 138412546;
          v51 = v24;
          v52 = 2114;
          v53 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Will push %@ %{public}@", buf, 0x16u);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v19);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordIDsToDelete"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
        v32 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ic_loggingDescription"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_loggingDescription"));
          *(_DWORD *)buf = 138543618;
          v51 = v33;
          v52 = 2114;
          v53 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Will delete %{public}@ %{public}@", buf, 0x16u);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v28);
  }

  -[ICCloudContext addCallbackBlocksToModifyRecordsOperation:rootRecordIDsByShareID:](v38, "addCallbackBlocksToModifyRecordsOperation:rootRecordIDsByShareID:", v14, v37);
  return v14;
}

- (void)addCallbackBlocksToModifyRecordsOperation:(id)a3 rootRecordIDsByShareID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v6);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100030A58;
  v17[3] = &unk_1007D8728;
  v17[4] = self;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v6, "setPerRecordSaveBlock:", v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100030AEC;
  v14[3] = &unk_1007D8750;
  v14[4] = self;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v15 = v8;
  objc_msgSend(v6, "setPerRecordDeleteBlock:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100030B70;
  v12[3] = &unk_1007D8778;
  v12[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = v9;
  objc_msgSend(v6, "setPerRecordProgressBlock:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100030CB8;
  v10[3] = &unk_1007D87A0;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "setModifyRecordsCompletionBlock:", v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 context:(id)a6 onProcessingQueue:(BOOL)a7 error:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  ICCloudContext *v39;
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  ICCloudContext *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  void *v55;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v33 = a5;
  v16 = a6;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "database"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v18));

  if (!objc_msgSend(v19, "length"))
  {
    v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      sub_10067AA18();

  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1000228A0;
  v53 = sub_1000228B0;
  if (v16)
  {
    v21 = v16;
  }
  else if (v17)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v19, 1));
  }
  else
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext internalContextWithBatchFetchHelper](self, "internalContextWithBatchFetchHelper"));
  }
  v54 = v21;
  v23 = (void *)objc_opt_class(REMCDObject, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ckIdentifierFromRecordName:", v24));
  v55 = v25;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v50[5], "batchFetchHelper"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100031088;
  v41[3] = &unk_1007D8818;
  v27 = v17;
  v48 = &v49;
  v42 = v27;
  v43 = self;
  v28 = v15;
  v44 = v28;
  v29 = v19;
  v45 = v29;
  v30 = v14;
  v46 = v30;
  v31 = v33;
  v47 = v31;
  objc_msgSend(v26, "addCKIdentifiers:accountIdentifier:onCurrentQueue:dispatchBlock:", v34, v29, v9, v41);
  if (!v16)
  {
    objc_msgSend(v26, "flushOnCurrentQueue:", v9);
    v32 = (void *)v50[5];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10003144C;
    v35[3] = &unk_1007D8840;
    v36 = v29;
    v37 = v28;
    v38 = v27;
    v39 = self;
    v40 = &v49;
    objc_msgSend(v32, "performBlockAndWait:", v35);

  }
  _Block_object_dispose(&v49, 8);

}

- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 onProcessingQueue:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  ICCloudContext *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  ICCloudContext *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  BOOL v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  ICCloudContext *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  ICCloudContext *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  BOOL v61;
  uint64_t v62;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "database"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v16));

  if (!objc_msgSend(v17, "length"))
  {
    v18 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      sub_10067AA9C();

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v17, 1));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v13));

  v46 = (void *)v20;
  v45 = v20 != 0;
  if (v20)
    v21 = (void *)v20;
  else
    v21 = v13;
  v22 = v21;
  v24 = (void *)objc_opt_class(REMCDObject, v23);
  v44 = v13;
  v25 = v14;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recordName"));
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ckIdentifierFromRecordName:", v26));
  v28 = self;
  v29 = v8;
  v30 = (void *)v27;
  v62 = v27;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "batchFetchHelper"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100031830;
  v53[3] = &unk_1007D8868;
  v33 = v19;
  v54 = v33;
  v55 = v28;
  v34 = v28;
  v56 = v22;
  v35 = v17;
  v57 = v35;
  v58 = v12;
  v36 = v25;
  v59 = v36;
  v61 = v45;
  v37 = v44;
  v60 = v37;
  v38 = v12;
  v39 = v22;
  objc_msgSend(v32, "addCKIdentifiers:accountIdentifier:onCurrentQueue:dispatchBlock:", v31, v35, v29, v53);
  objc_msgSend(v32, "flushOnCurrentQueue:", v29);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000320E4;
  v47[3] = &unk_1007D8500;
  v48 = v35;
  v49 = v37;
  v50 = v36;
  v51 = v34;
  v52 = v33;
  v40 = v33;
  v41 = v36;
  v42 = v37;
  v43 = v35;
  objc_msgSend(v40, "performBlockAndWait:", v47);

}

- (void)modifyRecordsOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032228;
  block[3] = &unk_1007D7CE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)handleGenericPartialFailuresForError:(id)a3 operation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *i;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v31 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v7));

  if (!objc_msgSend(v8, "length"))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_10067AF38();

  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "userInfo"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100032B10;
  v41[3] = &unk_1007D8890;
  v44 = &v45;
  v13 = v10;
  v42 = v13;
  v14 = v11;
  v43 = v14;
  objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v41);
  if (*((_BYTE *)v46 + 24))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10067AED4();

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate"));
    objc_msgSend(v16, "didFailPushingExceededStorageQuotaForContext:accountID:", self, v8);

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v13;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(obj);
        -[ICCloudContext receivedZoneNotFound:operation:](self, "receivedZoneNotFound:operation:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), v6, v30);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
    }
    while (v17);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v14;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v23);
        v25 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit", v30));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ic_loggingDescription"));
          *(_DWORD *)buf = 138543618;
          v50 = v8;
          v51 = 2114;
          v52 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "User deleted zone in account ID %{public}@: %{public}@", buf, 0x16u);

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingToBeSaved](self, "accountZoneIDsNeedingToBeSaved"));
        objc_msgSend(v26, "ic_addZoneID:forAccountID:", v24, v8);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
        -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:", v24, objc_msgSend(v27, "databaseScope"), v8);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate"));
        objc_msgSend(v28, "cloudContext:userDidDeleteRecordZoneWithID:accountID:", self, v24, v8);

        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
    }
    while (v21);
  }

  _Block_object_dispose(&v45, 8);
}

+ (id)sortedRecords:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
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
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v40;
  void *v41;
  id v42;
  id obj;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v3 = a3;
  v53 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecordGraph topologicallySortRecords:withError:](CKRecordGraph, "topologicallySortRecords:withError:", v3, &v53));
  v5 = v53;
  v41 = v3;
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10067B020();

    v7 = v3;
    v4 = v7;
  }
  v40 = v5;
  v42 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v44 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAlarm ckRecordType](REMCDAlarm, "ckRecordType"));
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
          objc_msgSend(v17, "setObject:atIndexedSubscript:", v13, 0);
          objc_msgSend(v8, "addObject:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v8, "count") - 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordID"));
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v18, v19);

          continue;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordType"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAlarmTrigger ckRecordType](REMCDAlarmTrigger, "ckRecordType"));
        if ((objc_msgSend(v20, "isEqualToString:", v21) & 1) == 0)
        {

LABEL_17:
          objc_msgSend(v42, "addObject:", v13);
          continue;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAlarmTrigger alarmReferenceCKRecordType](REMCDAlarmTrigger, "alarmReferenceCKRecordType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v22));

        if (!v23)
          goto LABEL_17;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAlarmTrigger alarmReferenceCKRecordType](REMCDAlarmTrigger, "alarmReferenceCKRecordType"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v24));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recordID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v26));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v27, "integerValue")));
          objc_msgSend(v28, "addObject:", v13);

        }
        else
        {
          objc_msgSend(v42, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v10);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = v8;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(v42, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v31);
  }

  v34 = objc_msgSend(v42, "count");
  if (v34 != objc_msgSend(v41, "count"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Record counts[%lu] after sorting[%lu] in ICCloudContext were not equal"), objc_msgSend(v41, "count"), objc_msgSend(v42, "count")));
    objc_msgSend((id)objc_opt_class(a1, v36), "faultAndPromptToFileRadarWithICTap2RadarType:logMessage:", 2, v35);

  }
  v37 = objc_msgSend(v42, "copy");

  return v37;
}

+ (id)objectsByAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v14[5];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7);
        v16 = 0;
        v17 = &v16;
        v18 = 0x3032000000;
        v19 = sub_1000228A0;
        v20 = sub_1000228B0;
        v21 = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000333E0;
        v15[3] = &unk_1007D7AF8;
        v15[4] = v8;
        v15[5] = &v16;
        objc_msgSend(v9, "performBlockAndWait:", v15);

        if (objc_msgSend((id)v17[5], "length"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v17[5]));
          if (!v10)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v17[5]);
          }
          objc_msgSend(v10, "addObject:", v8);

        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100033418;
          v14[3] = &unk_1007D7A60;
          v14[4] = v8;
          objc_msgSend(v11, "performBlockAndWait:", v14);

        }
        _Block_object_dispose(&v16, 8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  return v4;
}

+ (id)objectsByDatabaseScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "rd_ckDatabaseScope", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12));

        if (!v13)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
        objc_msgSend(v13, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)recursivelyFixCrossZoneRelationship:(id)a3 perObjectHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  NSObject *v15;
  _BYTE *v16;
  _QWORD v17[4];
  NSObject *v18;
  char v19;
  _BYTE v20[7];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v16 = v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordID", v16));
        if (v14)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1000337E0;
          v17[3] = &unk_1007D88B8;
          v18 = v6;
          objc_msgSend(v13, "recursivelyFixCrossZoneRelationshipWithVisitedMap:perObjectHandler:", v7, v17);
          v15 = v18;
        }
        else
        {
          v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            sub_10067B11C(&v19, v16);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

}

+ (id)deduplicatedRecordsForCloudObjects:(id)a3
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
  void *v12;
  NSObject *v13;
  id v14;
  char v16;
  _BYTE v17[15];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[16];
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v3, "count")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
        if (v12)
        {
          if (objc_msgSend(v4, "containsObject:", v12))
          {
            v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              sub_10067B148((uint64_t)v22, (uint64_t)v12);
          }
          else
          {
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "newlyCreatedRecord"));
            if (v13)
            {
              objc_msgSend(v4, "addObject:", v12);
              objc_msgSend(v5, "addObject:", v13);
            }
          }
        }
        else
        {
          v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            sub_10067B11C(&v16, v17);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v5, "copy");
  return v14;
}

+ (BOOL)haveZoneIDsInAccountZoneIDs:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033AC4;
  v6[3] = &unk_1007D88E0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)errorsFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v16 = &__NSArray0__struct;
    goto LABEL_22;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v6, "isEqualToString:", CKErrorDomain))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 == (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

      v11 = objc_opt_class(NSDictionary, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        v13 = objc_opt_class(NSDictionary, v12);
        v14 = REMDynamicCast(v13, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allValues"));

      }
      else
      {
        v16 = &__NSArray0__struct;
      }

      goto LABEL_22;
    }
  }
  else
  {

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.reminders.cloud")))
  {

    goto LABEL_19;
  }
  v18 = objc_msgSend(v5, "code");

  if (v18 != (id)2)
  {
LABEL_19:
    v32 = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    goto LABEL_22;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Errors")));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorsFromError:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), (_QWORD)v28));
        objc_msgSend(v16, "addObjectsFromArray:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

LABEL_22:
  return v16;
}

+ (void)saveAndFaultIfFailWithContext:(id)a3 shouldTakeServerAsTruth:(BOOL)a4 logDescription:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  RDStoreControllerValidationPolicy *v15;
  unsigned __int8 v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v11 = objc_opt_class(RDStoreControllerManagedObjectContext, v10);
  v12 = REMDynamicCast(v11, v8);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)v13;
  if (!v6 || !v13)
  {
    v15 = 0;
    if ((objc_msgSend(v8, "ic_saveWithLogDescription:", CFSTR("%@"), v9) & 1) != 0)
      goto LABEL_11;
LABEL_10:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fail to save context for %@"), v9));
    objc_msgSend((id)objc_opt_class(a1, v19), "faultAndPromptToFileRadarWithICTap2RadarType:logMessage:", 3, v18);

    goto LABEL_11;
  }
  v15 = -[RDStoreControllerValidationPolicy initWithShouldValidateMoveAcrossSharedList:saveShouldContinueIfCustomValidationFailed:]([RDStoreControllerValidationPolicy alloc], "initWithShouldValidateMoveAcrossSharedList:saveShouldContinueIfCustomValidationFailed:", 0, 1);
  objc_msgSend(v14, "setValidationPolicy:", v15);
  v16 = objc_msgSend(v8, "ic_saveWithLogDescription:", CFSTR("%@"), v9);
  objc_msgSend(v14, "setValidationPolicy:", 0);
  if ((v16 & 1) == 0)
    goto LABEL_10;
  if (v15 && -[RDStoreControllerValidationPolicy customValidationFailed](v15, "customValidationFailed"))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10067B194();

  }
LABEL_11:

}

+ (void)addRunExclusivelyOperations:(id)a3 operationQueue:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033F80;
  v6[3] = &unk_1007D7A60;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "addBarrierBlock:", v6);

}

- (BOOL)partialError:(id)a3 containsErrorCode:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  BOOL v18;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  if (objc_msgSend(v5, "code") != (id)2)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      sub_10067B1F8();

  }
  v7 = objc_opt_class(NSDictionary, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));
  v10 = REMDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allValues"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "code", (_QWORD)v21) == (id)a4)
        {
          v18 = 1;
          goto LABEL_12;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_12:

  return v18;
}

- (void)addDependenciesForModifyRecordsOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operations"));
  v7 = objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(CKModifyRecordZonesOperation, v9);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0
          || (v16 = objc_opt_class(CKModifyRecordsOperation, v15),
              (objc_opt_isKindOfClass(v13, v16) & 1) != 0)
          || (v18 = objc_opt_class(CKFetchRecordZoneChangesOperation, v17),
              (objc_opt_isKindOfClass(v13, v18) & 1) != 0))
        {
          objc_msgSend(v4, "addDependency:", v13);
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

}

+ (void)faultAndPromptToFileRadarWithICTap2RadarType:(unint64_t)a3 title:(id)a4 description:(id)a5 logMessage:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    sub_10067B224();

  objc_msgSend(a1, "promptToFileRadarWithICTap2RadarType:title:description:logMessage:additionalFaultMessage:", a3, v12, v11, v10, 0);
}

+ (void)promptToFileRadarWithICTap2RadarType:(unint64_t)a3 title:(id)a4 description:(id)a5 logMessage:(id)a6 additionalFaultMessage:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v7 = a7;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (+[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
    objc_msgSend(v14, "tapToRadarThrottlingInterval");
    v16 = v15;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1008526E8);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100034928;
    v25[3] = &unk_1007D8948;
    v25[4] = &v26;
    v25[5] = a3;
    v25[6] = v16;
    sub_100034928((uint64_t)v25);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008526E8);
    if (*((_BYTE *)v27 + 24))
    {
      if (v7)
      {
        v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          sub_10067B224();

      }
      v18 = REMRadarUtilitiesAlertMessageDefault;
      if ((unint64_t)objc_msgSend(v11, "length") < 0x97)
        v19 = v11;
      else
        v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", 0, 150));
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("REM: %@"), v19));
      if ((unint64_t)objc_msgSend(v12, "length") < 0x12D)
        v22 = v12;
      else
        v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", 0, 300));
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v22, REMRadarUtilitiesBugDescriptionDefault));
      +[REMRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:](REMRadarUtilities, "promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:", v18, v21, v24);

    }
    _Block_object_dispose(&v26, 8);
  }

}

+ (void)faultAndPromptToFileRadarWithICTap2RadarType:(unint64_t)a3 logMessage:(id)a4
{
  objc_msgSend(a1, "faultAndPromptToFileRadarWithICTap2RadarType:title:description:logMessage:", a3, a4, &stru_1007FE210, a4);
}

+ (void)errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessaryForOperationQueue:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "operations"));
  v4 = objc_msgSend(v3, "count");
  if ((unint64_t)v4 >= 0x51)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Too many operations in ICCC operation queue. {count: %lu}"), v4));
    v6 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v6, "appendString:", v5);
    objc_msgSend(v6, "appendString:", CFSTR(", operations: "));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "ic_shortLoggingOperationName"));
          objc_msgSend(v6, "appendFormat:", CFSTR("%@,"), v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10067B288();

  }
}

- (void)errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  objc_msgSend(v3, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessaryForOperationQueue:", v4);

}

- (id)operationToSaveZonesIfNecessaryForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  ICCloudContext *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v38 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingToBeSaved](self, "accountZoneIDsNeedingToBeSaved"));
  v37 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ownerName"));
        v16 = objc_msgSend(v15, "isEqualToString:", CKCurrentUserDefaultName);

        if (v16)
          objc_msgSend(v5, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v11);
  }
  v36 = v9;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](v38, "operationQueue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "operations"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v45;
    do
    {
      v23 = 0;
      v39 = v21;
      do
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v23);
        v25 = objc_opt_class(CKModifyRecordZonesOperation, v20);
        if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
        {
          v26 = v24;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recordZonesToSave"));
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v29; j = (char *)j + 1)
              {
                if (*(_QWORD *)v41 != v30)
                  objc_enumerationMutation(v27);
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1)
                                                                                   + 8 * (_QWORD)j), "zoneID"));
                objc_msgSend(v5, "removeObject:", v32);

              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            }
            while (v29);
          }

          v21 = v39;
        }
        v23 = (char *)v23 + 1;
      }
      while (v23 != v21);
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v5, "count"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationToSaveZonesForZoneIDs:accountID:](v38, "operationToSaveZonesForZoneIDs:accountID:", v33, v37));

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)operationToSaveZonesForZoneIDs:(id)a3 accountID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v24;
  void *v25;
  id v27;
  id val;
  id obj;
  _QWORD v30[5];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id location;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v5 = a3;
  v27 = a4;
  v25 = v5;
  if (objc_msgSend(v27, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v10 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i));
          objc_msgSend(v6, "addObject:", v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v7);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v27));
    val = objc_msgSend(objc_alloc((Class)CKModifyRecordZonesOperation), "initWithRecordZonesToSave:recordZoneIDsToDelete:", v6, 0);
    -[ICCloudContext configureOperation:](self, "configureOperation:", val);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "privateCloudDatabase"));
    objc_msgSend(val, "setDatabase:", v11);

    objc_initWeak(&location, val);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = v6;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
          v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit", v24));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ic_loggingDescription"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(val, "ic_loggingDescription"));
            *(_DWORD *)buf = 138543618;
            v43 = v19;
            v44 = 2114;
            v45 = v20;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Will save zone %{public}@ %{public}@", buf, 0x16u);

          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v13);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10003539C;
    v30[3] = &unk_1007D8970;
    objc_copyWeak(&v32, &location);
    v30[4] = self;
    v31 = v27;
    objc_msgSend(val, "setModifyRecordZonesCompletionBlock:", v30);
    v21 = objc_alloc_init((Class)CKOperationGroup);
    objc_msgSend(v21, "setName:", CFSTR("SaveRecordZones"));
    objc_msgSend(v21, "setQuantity:", objc_msgSend(obj, "count"));
    objc_msgSend(v21, "setExpectedSendSize:", 1);
    objc_msgSend(v21, "setExpectedReceiveSize:", 1);
    objc_msgSend(val, "setGroup:", v21);
    v22 = val;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_10067B2EC();
    v22 = 0;
  }

  return v22;
}

- (void)contextDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *i;
  NSObject *v23;
  id v24;
  id v25;
  void *context;
  void *v27;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;
  __int128 *p_buf;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v4 = a3;
  if (!-[ICCloudContext isDisabled](self, "isDisabled")
    && !-[ICCloudContext isDisabledInternal](self, "isDisabledInternal")
    && -[ICCloudContext supportsCloudKitSyncing](self, "supportsCloudKitSyncing")
    && -[ICCloudContext isInternetReachable](self, "isInternetReachable")
    && -[ICCloudContext hasPassedBuddy](self, "hasPassedBuddy")
    && (-[ICCloudContext pendingAccountInitializerCompleteOnLaunch](self, "pendingAccountInitializerCompleteOnLaunch")
     || -[ICCloudContext isReadyToSyncWithActiveAccountAvailable:](self, "isReadyToSyncWithActiveAccountAvailable:", 1)))
  {
    context = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSDeletedObjectIDsKey));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSInsertedObjectIDsKey));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSUpdatedObjectIDsKey));

    v9 = NSManagedObjectContextTransactionAuthorKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

    v13 = objc_opt_class(NSString, v12);
    v14 = REMDynamicCast(v13, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (v16 && objc_msgSend((id)objc_opt_class(self, v15), "isNonUploadingTransactionAuthor:", v16))
    {
      v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "contextDidSave excludes author: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v18 = v11;
      v11 = v9;
      v9 = v28;
      v28 = v27;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      if (objc_msgSend(v27, "count"))
        objc_msgSend(v19, "unionSet:", v27);
      if (objc_msgSend(v28, "count"))
        objc_msgSend(v19, "unionSet:", v28);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v39 = 0x3032000000;
      v40 = sub_1000228A0;
      v41 = sub_1000228B0;
      v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v18 = v19;
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v20);
      }

      v23 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100035B4C;
      block[3] = &unk_1007D8998;
      block[4] = self;
      v30 = v6;
      v31 = v16;
      p_buf = &buf;
      v24 = v16;
      v25 = v6;
      dispatch_async(v23, block);

      _Block_object_dispose(&buf, 8);
      v6 = v27;
    }

    objc_autoreleasePoolPop(context);
  }

}

- (void)_addOperationToProcessBlockWithOperationName:(id)a3 processBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICCloudContext *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035F74;
  block[3] = &unk_1007D8410;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)addOperationToProcessObjectsWithOperationName:(id)a3 syncReason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100036560;
  v13[3] = &unk_1007D89E8;
  objc_copyWeak(&v17, &location);
  v11 = v8;
  v14 = v11;
  v15 = v9;
  v12 = v10;
  v16 = v12;
  -[ICCloudContext _addOperationToProcessBlockWithOperationName:processBlock:](self, "_addOperationToProcessBlockWithOperationName:processBlock:", v11, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)processPendingCloudObjects
{
  -[ICCloudContext processPendingCloudObjectsWithOperationName:](self, "processPendingCloudObjectsWithOperationName:", ICNSBlockOperationNameProcessObjectsForContextDidSave);
}

- (void)processPendingCloudObjectsWithOperationName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.processPendingCloudObjects[%@]}", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000367FC;
  v8[3] = &unk_1007D8A10;
  v9 = v4;
  v10 = (id)os_transaction_create("com.apple.remindd.cloudkit.processPendingCloudObjects");
  v6 = v10;
  v7 = v4;
  -[ICCloudContext addOperationToProcessObjectsWithOperationName:syncReason:completionHandler:](self, "addOperationToProcessObjectsWithOperationName:syncReason:completionHandler:", v7, 0, v8);

}

- (void)processPendingCloudObjectsWithOperationName:(id)a3 syncReason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  NSObject *v17;
  unsigned int v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  os_signpost_id_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  _QWORD block[5];
  id v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  void *v59;
  const __CFString *v60;
  const __CFString *v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  NSObject *v68;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v63 = v8;
    v64 = 2114;
    v65 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SYNC[COREDATA] START {operationName: %{public}@, syncReason: %{public}@}", buf, 0x16u);
  }

  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.sync.coredata}", buf, 2u);
  }

  v13 = (void *)os_transaction_create("com.apple.remindd.cloudkit.sync.coredata");
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100036FB4;
  v56[3] = &unk_1007D8A38;
  v14 = v10;
  v58 = v14;
  v15 = v13;
  v57 = v15;
  v16 = objc_retainBlock(v56);
  if (!-[ICCloudContext isReadyToSync](self, "isReadyToSync"))
  {
    if (-[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable"))
    {
      v18 = -[ICCloudContext pendingAccountInitializerCompleteOnLaunch](self, "pendingAccountInitializerCompleteOnLaunch");
      v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v18)
      {
        if (v19)
          sub_10067B498(self, v17);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext objectIDsToRetry](self, "objectIDsToRetry"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext objectIDsToProcess](self, "objectIDsToProcess"));
        objc_msgSend(v20, "unionSet:", v21);

        v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        -[ICCloudContext setObjectIDsToProcess:](self, "setObjectIDsToProcess:", v17);
      }
      else if (v19)
      {
        sub_10067B590(self, v17);
      }
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10067B610();
    }
    goto LABEL_30;
  }
  if (!-[ICCloudContext isInternetReachable](self, "isInternetReachable"))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10067B46C();
    goto LABEL_30;
  }
  if (-[ICCloudContext uploadSuspended](self, "uploadSuspended"))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10067B440();
LABEL_30:

    v35 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_10067B414();

    v37 = objc_msgSend((id)objc_opt_class(self, v36), "errorForDisabledCloudSyncing");
    v25 = objc_claimAutoreleasedReturnValue(v37);
    v68 = v25;
    v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1));
    ((void (*)(_QWORD *, NSObject *))v16[2])(v16, v26);
    goto LABEL_33;
  }
  v46 = v8;
  v47 = v9;
  v22 = objc_claimAutoreleasedReturnValue(+[REMSignpost sync](REMSignpost, "sync"));
  v23 = os_signpost_id_generate(v22);
  v24 = v22;
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "cloudkit.coredata", ", buf, 2u);
  }
  v44 = v23;

  v26 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[DABabysitter sharedBabysitter](DABabysitter, "sharedBabysitter"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tokenByRegisteringAccount:forOperationWithName:", self, CFSTR("SYNC[COREDATA]")));

  v29 = (void *)v28;
  if (v28)
  {
LABEL_27:
    v31 = v29;
    v32 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue", v44));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003705C;
    block[3] = &unk_1007D8AB0;
    block[4] = self;
    v49 = v46;
    v50 = v47;
    v51 = v26;
    v52 = v25;
    v55 = v45;
    v53 = v31;
    v54 = v16;
    v33 = v31;
    v34 = v25;
    v25 = v26;
    dispatch_async(v32, block);

    v8 = v46;
    v26 = v34;
    v9 = v47;
    goto LABEL_33;
  }
  if (isCloudContextSyncReasonUserInitiated(v47))
  {
    v30 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext waiterID](self, "waiterID"));
      *(_DWORD *)buf = 138543874;
      v63 = v46;
      v64 = 2114;
      v65 = v47;
      v66 = 2114;
      v67 = v42;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Bypassing babysitter against processPendingCloudObjects, which failed too many times, because sync was user initiated {operationName: %{public}@, syncReason: %{public}@, waiterID: %{public}@}", buf, 0x20u);

    }
    v29 = 0;
    goto LABEL_27;
  }
  v60 = CFSTR("identifier");
  v61 = CFSTR("SYNC[COREDATA]");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[REMError babySatErrorWithOperationName:](REMError, "babySatErrorWithOperationName:", CFSTR("SYNC[COREDATA]")));
  +[Analytics postEventWithName:payload:error:performAutoBugCaptureOnError:](_TtC19ReminderKitInternal9Analytics, "postEventWithName:payload:error:performAutoBugCaptureOnError:", CFSTR("SYNC[COREDATA]"), v38, v39, 1);
  v40 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext waiterID](self, "waiterID"));
    *(_DWORD *)buf = 138543874;
    v63 = v46;
    v64 = 2114;
    v65 = v47;
    v66 = 2114;
    v67 = v43;
    _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "Babysitting processPendingCloudObjects because it failed too many times {operationName: %{public}@, syncReason: %{public}@, waiterID: %{public}@}", buf, 0x20u);

  }
  v59 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
  ((void (*)(_QWORD *, void *))v16[2])(v16, v41);

  v8 = v46;
  v9 = v47;
LABEL_33:

}

- (void)addProcessLocalObjectsOperationToMergeLocalObjectsWithCompletionHandler:(id)a3
{
  id v4;
  __CFString *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = ICNSBlockOperationNameProcessLocalObjects;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037970;
  v7[3] = &unk_1007D8BB8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[ICCloudContext _addOperationToProcessBlockWithOperationName:processBlock:](self, "_addOperationToProcessBlockWithOperationName:processBlock:", v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_scheduleRetryMergeLocalObjects
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _UNKNOWN **v7;
  _UNKNOWN **v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  unsigned __int8 v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext retryCountsByOperationType](self, "retryCountsByOperationType"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Merge.Local")));
  v6 = (void *)v5;
  v7 = &off_100804548;
  if (v5)
    v7 = (_UNKNOWN **)v5;
  v8 = v7;

  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 67109120;
    LODWORD(v28) = objc_msgSend(v8, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MERGE.LOCAL: Scheduling retry, if we are within limit (currentRetryCount: %d).", (uint8_t *)&v27, 8u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext _systemBuildVersion](ICCloudContext, "_systemBuildVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v12 = objc_msgSend(v11, "mergeLocalObjectsMaximumRetryCount");
  if ((unint64_t)v12 > (int)objc_msgSend(v8, "intValue"))
  {
    objc_msgSend(v11, "mergeLocalObjectsRetryStartOverThrottleInterval");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cloudKitMergeLocalLastDateMaxRetryReached"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cloudKitMergeLocalLastBuildVersionMaxRetryReached"));
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v18, "timeIntervalSinceDate:", v16);
      if (v19 < v14 && v17)
      {
        v20 = objc_msgSend(v10, "isEqualToString:", v17);

        if ((v20 & 1) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ic_localDateWithSeconds"));
            v27 = 138412802;
            v28 = v26;
            v29 = 2112;
            v30 = v17;
            v31 = 2112;
            v32 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "MERGE.LOCAL: Maximum retry count previously reached, aborting {lastMaxRetry: {date: %@, build: %@}, currentBuild: %@}", (uint8_t *)&v27, 0x20u);

          }
          -[ICCloudContext setNeedsToMergeLocalObjects:](self, "setNeedsToMergeLocalObjects:", 0);
          -[ICCloudContext clearRetryCountForOperationType:](self, "clearRetryCountForOperationType:", CFSTR("Merge.Local"));
          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    -[ICCloudContext setNeedsToMergeLocalObjects:](self, "setNeedsToMergeLocalObjects:", 1);
    objc_msgSend(v11, "mergeLocalObjectsInitialRetryInterval");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[REMError retryLaterErrorWithInterval:](REMError, "retryLaterErrorWithInterval:"));
    -[ICCloudContext incrementOrClearRetryCountForOperationType:error:](self, "incrementOrClearRetryCountForOperationType:error:", CFSTR("Merge.Local"), v25);
    -[ICCloudContext startRetryTimerIfNecessaryWithError:](self, "startRetryTimerIfNecessaryWithError:", v25);

LABEL_18:
    goto LABEL_19;
  }
  v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    sub_10067B878();

  -[ICCloudContext setNeedsToMergeLocalObjects:](self, "setNeedsToMergeLocalObjects:", 0);
  -[ICCloudContext clearRetryCountForOperationType:](self, "clearRetryCountForOperationType:", CFSTR("Merge.Local"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v23, "setCloudKitMergeLocalLastDateMaxRetryReached:", v24);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  objc_msgSend(v15, "setCloudKitMergeLocalLastBuildVersionMaxRetryReached:", v10);
LABEL_19:

}

- (void)processLocalObjectMergeEligibleObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  NSObject *v15;
  _QWORD *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  ICCloudContext *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MERGE.LOCAL[COREDATA] START", buf, 2u);
  }

  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.merge.local.coredata}", buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000388DC;
  v24[3] = &unk_1007D8A38;
  v25 = (id)os_transaction_create("com.apple.remindd.cloudkit.merge.local.coredata");
  v26 = v8;
  v11 = v25;
  v12 = v8;
  v13 = objc_retainBlock(v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v15 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100038984;
  v19[3] = &unk_1007D8C08;
  v20 = v7;
  v21 = self;
  v22 = v14;
  v23 = v13;
  v16 = v13;
  v17 = v14;
  v18 = v7;
  dispatch_async(v15, v19);

}

+ (BOOL)_performLocalObjectMergeWithEligibleObjectIDs:(id)a3 cloudKitAccount:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSString *(__cdecl **v12)(SEL);
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  int *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v42;
  id v44;
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "setDaWasMigrated:", 0);
  v44 = a1;
  objc_msgSend(a1, "saveAndFaultIfFailWithContext:shouldTakeServerAsTruth:logDescription:", v11, 0, CFSTR("unset .daWasMigrated"));
  v12 = &NSStringFromSelector_ptr;
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckIdentifier"));
    *(_DWORD *)buf = 138543362;
    v52 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MERGE.LOCAL: Unsetting .daWasMigrated (accountIdentifier=%{public}@, flagSaved=1)", buf, 0xCu);

  }
  v42 = v10;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v9;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    v18 = &OBJC_IVAR___ICBatchFetchHelper__managedObjectContext;
    do
    {
      v19 = 0;
      v45 = v16;
      do
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v19);
        v21 = objc_autoreleasePoolPush();
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectWithID:", v20));
        v24 = objc_opt_class(v18 + 728, v23);
        v25 = REMDynamicCast(v24, v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if (objc_msgSend(v26, "isMergeableWithLocalObject"))
        {
          v27 = v11;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "existingLocalObjectToMergeWithPredicate:", 0));
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12[281], "cloudkit"));
          v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
          if (v28)
          {
            v31 = v17;
            if (v30)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectID"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectID"));
              *(_DWORD *)buf = 138543618;
              v52 = v32;
              v53 = 2114;
              v54 = v33;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "MERGE.LOCAL: ...found an existingLocalObjectToMerge (objectMID=%{public}@, localObjectMID=%{public}@)", buf, 0x16u);

              v12 = &NSStringFromSelector_ptr;
            }

            v34 = objc_msgSend(v26, "mergeWithLocalObject:", v28);
            v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12[281], "cloudkit"));
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v34));
              *(_DWORD *)buf = 138543362;
              v52 = v36;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "MERGE.LOCAL: ...mergeWithLocalObject (didMerge=%{public}@)", buf, 0xCu);

              v12 = &NSStringFromSelector_ptr;
            }

            v11 = v27;
            objc_msgSend(v27, "refreshObject:mergeChanges:", v28, 1);
            v17 = v31;
            v18 = &OBJC_IVAR___ICBatchFetchHelper__managedObjectContext;
          }
          else
          {
            if (v30)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectID"));
              *(_DWORD *)buf = 138543362;
              v52 = v37;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "MERGE.LOCAL: ...no matching existingLocalObjectToMerge (objectMID=%{public}@)", buf, 0xCu);

              v12 = &NSStringFromSelector_ptr;
            }

            v11 = v27;
          }
          objc_msgSend(v11, "refreshObject:mergeChanges:", v26, 1);

          v16 = v45;
        }

        objc_autoreleasePoolPop(v21);
        v19 = (char *)v19 + 1;
      }
      while (v16 != v19);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v16);
  }

  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12[281], "cloudkit"));
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "ckIdentifier"));
    *(_DWORD *)buf = 138543362;
    v52 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "MERGE.LOCAL: final step to clean up account and lists, then save... (accountIdentifier=%{public}@)", buf, 0xCu);

  }
  v40 = objc_autoreleasePoolPush();
  objc_msgSend(v42, "cleanUpAfterLocalObjectMerge");
  objc_autoreleasePoolPop(v40);
  if (a6)
    *a6 = 0;
  objc_msgSend(v44, "saveAndFaultIfFailWithContext:shouldTakeServerAsTruth:logDescription:", v11, 0, CFSTR("merged objects"));

  return 1;
}

- (void)processAllDirtyCloudObjectsWithSyncReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[6];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039358;
  block[3] = &unk_1007D8410;
  block[4] = self;
  block[5] = v7;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

- (void)retryProcessingCloudObjects
{
  NSObject *v3;
  void *v4;
  void *v5;
  _DWORD v6[2];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext objectIDsToRetry](self, "objectIDsToRetry"));
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Retrying to process %d cloud objects", (uint8_t *)v6, 8u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingSelectorDelayer](self, "processingSelectorDelayer"));
  objc_msgSend(v5, "requestFire");

}

- (void)processObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Processing %lu cloud objects, now going to fetch from CD and submit items to operation queue", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100039734;
  v14[3] = &unk_1007D8C70;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  -[ICCloudContext _processFetchedCloudObjectsWithObjectIDs:usingBlock:](self, "_processFetchedCloudObjectsWithObjectIDs:usingBlock:", v8, v14);

}

- (void)_processFetchedCloudObjectsWithObjectIDs:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext context](self, "context"));
  -[ICCloudContext _processFetchedCloudObjectsWithObjectIDs:withManagedObjectContext:usingBlock:](self, "_processFetchedCloudObjectsWithObjectIDs:withManagedObjectContext:usingBlock:", v7, v9, v6);

}

- (void)_processFetchedCloudObjectsWithObjectIDs:(id)a3 withManagedObjectContext:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICCloudContext *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000398F0;
  v15[3] = &unk_1007D8C08;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v13, "performBlockAndWait:", v15);

}

- (BOOL)_isRecognizedCloudObjectClass:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(v4, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext recognizedCloudObjectClasses](self, "recognizedCloudObjectClasses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

  if (v10)
  {
    LOBYTE(v11) = objc_msgSend(v10, "BOOLValue");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allValues"));

    v11 = (uint64_t)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v13);
          if ((objc_opt_isKindOfClass(v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i)) & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
        }
        v11 = (uint64_t)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_13:

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext recognizedCloudObjectClasses](self, "recognizedCloudObjectClasses"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v8);

  }
  return v11;
}

- (void)_processCloudObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  ICCloudContext *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext context](self, "context"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003A514;
    v17[3] = &unk_1007D8CE8;
    v18 = v8;
    v19 = v12;
    v20 = self;
    v21 = v11;
    v22 = v9;
    v23 = v10;
    v13 = v11;
    v14 = v12;
    objc_msgSend(v14, "performBlockAndWait:", v17);

  }
  else if (v10)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003A504;
    v24[3] = &unk_1007D8118;
    v25 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNSBlockOperation blockOperationWithBlock:](ICNSBlockOperation, "blockOperationWithBlock:", v24));
    objc_msgSend(v15, "setName:", ICNSBlockOperationNameProcessCompletion);
    objc_msgSend(v9, "addOperation:", v15);
    objc_msgSend((id)objc_opt_class(self, v16), "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessaryForOperationQueue:", v9);

  }
}

- (void)handleNotification:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v11;
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  void (**v38)(id, void *);
  uint8_t buf[4];
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v40;
  __int16 v41;
  void *v42;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v8);

  if (!-[ICCloudContext isReadyToSync](self, "isReadyToSync")
    || -[ICCloudContext isDisabled](self, "isDisabled")
    || -[ICCloudContext isDisabledInternal](self, "isDisabledInternal")
    || !-[ICCloudContext supportsCloudKitSyncing](self, "supportsCloudKitSyncing"))
  {
    v21 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10067B9B8(self, v21);

    if (v7)
    {
      v23 = objc_msgSend((id)objc_opt_class(self, v22), "errorForDisabledCloudSyncing");
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v7[2](v7, v24);

    }
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (_TtC7remindd36RDDebounceableCKDatabaseNotification *)objc_opt_class(v6, v10);
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptionID"));
      *(_DWORD *)buf = 138543618;
      v40 = v11;
      v41 = 2114;
      v42 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SYNC[APS] CONTINUE {notification.class: %{public}@, subscriptionID: %{public}@}", buf, 0x16u);

    }
    v14 = (char *)objc_msgSend(v6, "notificationType");
    if ((unint64_t)(v14 - 1) < 3)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class(v6, v17);
        v19 = NSStringFromClass(v18);
        v20 = (_TtC7remindd36RDDebounceableCKDatabaseNotification *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 138543362;
        v40 = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SYNC[APS] NOOP - Not handling CloudKit database notification %{public}@", buf, 0xCu);

      }
LABEL_23:

LABEL_24:
      if (v7)
        v7[2](v7, 0);
      goto LABEL_14;
    }
    if (v14 != (char *)4)
      goto LABEL_24;
    v25 = objc_opt_class(CKDatabaseNotification, v15);
    if ((objc_opt_isKindOfClass(v6, v25) & 1) == 0)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_10067BABC((uint64_t)v6, (uint64_t)v16);
      goto LABEL_23;
    }
    v26 = v6;
    v27 = objc_msgSend(v26, "databaseScope");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "notificationID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subscriptionOwnerUserRecordID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "recordName"));

    if (objc_msgSend(v30, "length"))
    {
      v31 = -[RDDebounceableCKDatabaseNotification initWithDatabaseScope:subscriptionOwnerUserRecordName:]([_TtC7remindd36RDDebounceableCKDatabaseNotification alloc], "initWithDatabaseScope:subscriptionOwnerUserRecordName:", v27, v30);
      v32 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "debugDescription"));
        *(_DWORD *)buf = 138543618;
        v40 = v31;
        v41 = 2114;
        v42 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "SYNC[APS] CONTINUE - Received CloudKit database notification {debounceableDatabaseNotification: %{public}@, notificationID: %{public}@}", buf, 0x16u);

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext apsNotificationHandlingDebouncer](self, "apsNotificationHandlingDebouncer"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v31));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10003B4C4;
      v36[3] = &unk_1007D8D38;
      v36[4] = self;
      v38 = v7;
      v37 = v28;
      objc_msgSend(v34, "fire:completion:", v35, v36);

    }
    else
    {
      v31 = (_TtC7remindd36RDDebounceableCKDatabaseNotification *)objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_ERROR))
        sub_10067BA38();
    }

  }
LABEL_14:

}

- (void)handleDatabaseNotification:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "databaseScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptionOwnerUserRecordName"));
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SYNC[APS] CONTINUE - Fired from APS debouncer to execute CKDatabaseNotification handler {databaseNotification: %{public}@}", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003BA3C;
  v15[3] = &unk_1007D8DB0;
  v15[4] = self;
  v16 = v9;
  v18 = v7;
  v19 = v8;
  v17 = v6;
  v12 = v7;
  v13 = v6;
  v14 = v9;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

}

- (void)_handleDatabaseNotification:(id)a3 database:(id)a4 accountID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  ICCloudContext *v29;
  __CFString *v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  _BOOL4 v41;
  id v42;

  v10 = a3;
  v26 = a4;
  v11 = a5;
  v12 = a6;
  v13 = CFSTR("PushNotification");
  if (v11)
  {
    v42 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:syncReason:](self, "setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:syncReason:", v14, v13));

  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_10067BB90();

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  }
  v17 = objc_msgSend(v15, "count");
  v18 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v37 = v10;
    v38 = 2114;
    v39 = v11;
    v40 = 1024;
    v41 = v17 != 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "...SYNC[APS] Handling CloudKit database notification, with potential debounced scopes from other notifications {databaseNotification: %{public}@, accountID: %{public}@, catchUpSync: %d}", buf, 0x1Cu);
  }
  v19 = v17 != 0;

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = v26;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003C144;
  v27[3] = &unk_1007D8E28;
  v28 = v20;
  v29 = self;
  v30 = v13;
  v31 = v15;
  v32 = v10;
  v33 = v12;
  v34 = v19;
  v22 = v12;
  v23 = v10;
  v24 = v15;
  v25 = v20;
  -[ICCloudContext fetchDatabaseChangesForDatabases:reason:cloudSchemaCatchUpSyncContextMap:completionHandler:](self, "fetchDatabaseChangesForDatabases:reason:cloudSchemaCatchUpSyncContextMap:completionHandler:", v21, v13, v24, v27);

}

- (void)validateAccountZoneIDsNeedingFetchChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingFetchChanges](self, "accountZoneIDsNeedingFetchChanges"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  objc_msgSend(v8, "minusSet:", v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003C668;
  v9[3] = &unk_1007D82D0;
  v9[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (void)fetchRecordZoneChangesWithReason:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[6];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003C818;
  v14[3] = &unk_1007D8C08;
  v14[4] = self;
  v14[5] = v10;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (void)fetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", a3));
  if (objc_msgSend(v10, "length"))
  {
    v16 = v10;
    v17 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  -[ICCloudContext fetchRecordZoneChangesForAccountZoneIDs:reason:cloudSchemaCatchUpSyncContextMap:completionHandler:](self, "fetchRecordZoneChangesForAccountZoneIDs:reason:cloudSchemaCatchUpSyncContextMap:completionHandler:", v14, v12, v15, v11);

}

- (void)fetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  ICCloudContext *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CA88;
  block[3] = &unk_1007D8E78;
  v19 = v10;
  v20 = self;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(v14, block);

}

- (void)addOperationsToFetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  ICCloudContext *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D16C;
  block[3] = &unk_1007D8E78;
  v19 = v10;
  v20 = self;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(v14, block);

}

- (id)operationsToFetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 cloudSchemaCatchUpSyncContextMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  unsigned int v15;
  char v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  _QWORD v35[4];
  id v36;
  ICCloudContext *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _BYTE *v42;
  char v43;
  _QWORD v44[5];
  id v45;
  _BYTE *v46;
  uint8_t v47[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v34 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v33 = v12;
  if (objc_msgSend(v10, "length"))
  {
    if (v10)
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v10));
    else
      v13 = 0;
    v15 = -[NSObject shouldPerformCloudSchemaCatchUpSync](v13, "shouldPerformCloudSchemaCatchUpSync");
    v16 = v15;
    if (v15)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2114;
        v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Account shouldPerformCloudSchemaCatchUpSync. Will set CKFetchRecordZoneChangesConfiguration.previousServerChangeToken = nil {accountID: %{public}@, reason: %{public}@, zoneIDs: %{public}@}", buf, 0x20u);
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v20 = objc_msgSend((id)objc_opt_class(self, v19), "objectsByDatabaseScope:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v54 = sub_1000228A0;
    v55 = sub_1000228B0;
    v56 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10003DCDC;
    v44[3] = &unk_1007D7FB0;
    v44[4] = self;
    v21 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext context](self, "context"));
    v45 = v21;
    v46 = buf;
    objc_msgSend(v21, "performBlockAndWait:", v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v10));
    v23 = objc_alloc_init((Class)CKOperationGroup);
    objc_msgSend(v23, "setName:", CFSTR("FetchRecordZoneChanges"));
    objc_msgSend(v23, "setExpectedSendSize:", 1);
    objc_msgSend(v23, "setExpectedReceiveSize:", 0);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10003DDFC;
    v35[3] = &unk_1007D8EC8;
    v24 = v22;
    v36 = v24;
    v37 = self;
    v25 = v10;
    v42 = buf;
    v38 = v25;
    v39 = v11;
    v43 = v16;
    v26 = v23;
    v40 = v26;
    v27 = v18;
    v41 = v27;
    objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v35);
    v28 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ic_loggingDescription"));
      *(_DWORD *)v47 = 138543874;
      v48 = v29;
      v49 = 2114;
      v50 = v25;
      v51 = 2114;
      v52 = v11;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Fetching record zone changes with operation group %{public}@ {accountID: %{public}@, reason: %{public}@}", v47, 0x20u);

    }
    v30 = v41;
    v14 = v27;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_10067BD3C();
    v14 = &__NSArray0__struct;
  }

  return v14;
}

- (id)operationToFetchRecordZoneChangesForZoneIDs:(id)a3 database:(id)a4 reason:(id)a5 ignoreServerChangeTokens:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  void *v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[16];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v6)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "databaseScope")));
      *(_DWORD *)buf = 138543874;
      v66 = v13;
      v67 = 2114;
      v68 = v11;
      v69 = 2114;
      v70 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will set CKFetchRecordZoneChangesConfiguration.previousServerChangeToken = nil {databaseScope: %{public}@, reason: %{public}@, zoneIDs: %{public}@}", buf, 0x20u);

    }
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v10));
  if (!objc_msgSend(v53, "length"))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_10067BDB4();

  }
  v48 = v11;
  v49 = v10;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v9;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
        v21 = objc_msgSend(v20, "isEqualToString:", CKRecordZoneDefaultName);

        if (v21)
        {
          v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v66 = v53;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Not trying to sync the default record zone in account ID %{public}@.", buf, 0xCu);
          }
        }
        else
        {
          v23 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
          v22 = v23;
          if (v6)
          {
            -[NSObject setPreviousServerChangeToken:](v23, "setPreviousServerChangeToken:", 0);
          }
          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:", v19, objc_msgSend(v10, "databaseScope"), v53));
            -[NSObject setPreviousServerChangeToken:](v22, "setPreviousServerChangeToken:", v24);

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
          -[NSObject setResultsLimit:](v22, "setResultsLimit:", objc_msgSend(v25, "resultsLimitPerSyncOperation"));

          -[NSObject setFetchNewestChangesFirst:](v22, "setFetchNewestChangesFirst:", 1);
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v22, v19);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v16);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "operations"));

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (!v28)
  {
LABEL_38:

LABEL_43:
    v46 = v51;
    v43 = v49;
    v44 = v48;
    v35 = -[ICCloudContext newOperationToFetchRecordZoneChangesWithZoneConfigurations:database:reason:](self, "newOperationToFetchRecordZoneChangesWithZoneConfigurations:database:reason:", v51, v49, v48);
    goto LABEL_44;
  }
  v30 = v28;
  v31 = *(_QWORD *)v55;
LABEL_25:
  v32 = 0;
  while (1)
  {
    if (*(_QWORD *)v55 != v31)
      objc_enumerationMutation(v27);
    v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v32);
    v34 = objc_opt_class(CKFetchRecordZoneChangesOperation, v29);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0)
      goto LABEL_36;
    v35 = v33;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "database"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v36));

    if (!objc_msgSend(v37, "length"))
    {
      v38 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        sub_10067BD68((uint64_t)v62, (uint64_t)v35);

    }
    if (+[NSString rem_isFirstString:equalToSecondString:](NSString, "rem_isFirstString:equalToSecondString:", v53, v37))
    {
      v40 = objc_opt_class(self, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "configurationsByRecordZoneID"));
      LOBYTE(v40) = objc_msgSend((id)v40, "isZoneConfigurations:subsetOfZoneConfigurations:", v51, v41);

      if ((v40 & 1) != 0)
        break;
    }

LABEL_36:
    if (v30 == (id)++v32)
    {
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      if (v30)
        goto LABEL_25;
      goto LABEL_38;
    }
  }

  if (!v35)
    goto LABEL_43;
  v42 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v43 = v49;
  v44 = v48;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543618;
    v66 = v53;
    v67 = 2114;
    v68 = v45;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Found existing operation with superset zone configuration in account ID %{public}@: %{public}@", buf, 0x16u);

  }
  v46 = v51;
LABEL_44:

  return v35;
}

+ (BOOL)isZoneConfigurations:(id)a3 subsetOfZoneConfigurations:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  __int128 v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];

  v27 = a3;
  v28 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allKeys"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v30;
    *(_QWORD *)&v9 = 138543362;
    v25 = v9;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12);
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v13, v25));
      if (!v14)
        break;
      v15 = (void *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v13));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "previousServerChangeToken"));

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "previousServerChangeToken"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "previousServerChangeToken"));
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) == 0)
        {

          break;
        }
      }
      else
      {
        v21 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_loggingDescription"));
          *(_DWORD *)buf = v25;
          v34 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "isZoneConfigurations: existingConfiguration %{public}@ with nil previousServerChangeToken", buf, 0xCu);

        }
      }
      objc_msgSend(v7, "removeObject:", v13);

      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  v23 = objc_msgSend(v7, "count") == 0;
  return v23;
}

- (id)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(id)a3 database:(id)a4 reason:(id)a5
{
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  ICCloudSchemaCatchUpSyncContext *v17;
  void *v18;
  void *v19;
  ICCloudSchemaCatchUpSyncContext *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD *v24;
  id v25;
  _QWORD *v26;
  id v27;
  _QWORD *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v38;
  id *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  ICCloudContext *v45;
  id v46;
  id v47;
  _QWORD *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  ICCloudContext *v52;
  _QWORD *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  ICCloudContext *v57;
  id v58;
  _QWORD *v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  _QWORD *v64;
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  _QWORD *v69;
  id v70;
  _QWORD v71[4];
  _QWORD v72[5];
  id v73;
  _BYTE *v74;
  id v75;
  id location;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  _BYTE v83[24];
  id v84;

  v40 = a3;
  v41 = a4;
  v42 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v41));
  if (!objc_msgSend(v9, "length"))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "ic_loggingDescription"));
      *(_DWORD *)v83 = 138543874;
      *(_QWORD *)&v83[4] = v38;
      *(_WORD *)&v83[12] = 2114;
      *(_QWORD *)&v83[14] = v9;
      *(_WORD *)&v83[22] = 2114;
      v84 = v42;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "accountID is nil or empty in newOperationToFetchRecordZoneChangesWithZoneConfigurations %{public}@, accountID: %{public}@, reason: %{public}@", v83, 0x20u);

    }
  }
  v11 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allKeys"));
  v13 = objc_msgSend(v11, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v12, v40);

  -[ICCloudContext configureOperation:](self, "configureOperation:", v13);
  objc_msgSend(v13, "setDatabase:", v41);
  objc_initWeak(&location, v13);
  objc_msgSend(v13, "setFetchAllChanges:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v15 = objc_msgSend(v14, "resultsLimitPerSyncOperation");

  *(_QWORD *)v83 = 0;
  *(_QWORD *)&v83[8] = v83;
  *(_QWORD *)&v83[16] = 0x2020000000;
  v84 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v9, 1));
  if (objc_msgSend(v9, "length"))
  {
    v17 = [ICCloudSchemaCatchUpSyncContext alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cloudSchemaCatchUpSyncSchedulingStateStorage"));
    v20 = -[ICCloudSchemaCatchUpSyncContext initWithAccountIdentifier:syncReason:schedulingStateStorage:managedObjectContext:](v17, "initWithAccountIdentifier:syncReason:schedulingStateStorage:managedObjectContext:", v9, v42, v19, v16);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v20, v9));
    objc_msgSend(v16, "setCloudSchemaCatchUpSyncContextsByAccountIdentifier:", v21);

  }
  objc_msgSend(v16, "setShouldSortChildrenAfterFetching:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v16, "setRecordIDsToSortChildrenAfterFetching:", v22);

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10003F060;
  v72[3] = &unk_1007D8F18;
  v74 = v83;
  v75 = v15;
  v72[4] = self;
  v23 = v9;
  v73 = v23;
  v24 = objc_retainBlock(v72);
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v71[3] = 0xBFF0000000000000;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10003F28C;
  v66[3] = &unk_1007D8F40;
  v69 = v71;
  v66[4] = self;
  v39 = &v70;
  objc_copyWeak(&v70, &location);
  v25 = v16;
  v67 = v25;
  v26 = v24;
  v68 = v26;
  objc_msgSend(v13, "setRecordWasChangedBlock:", v66);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10003F374;
  v61[3] = &unk_1007D8F68;
  v64 = v71;
  v61[4] = self;
  objc_copyWeak(&v65, &location);
  v27 = v25;
  v62 = v27;
  v28 = v26;
  v63 = v28;
  objc_msgSend(v13, "setRecordWithIDWasDeletedBlock:", v61);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10003F440;
  v55[3] = &unk_1007D8F90;
  v59 = v71;
  v29 = v27;
  v56 = v29;
  v57 = self;
  v30 = v23;
  v58 = v30;
  objc_copyWeak(&v60, &location);
  objc_msgSend(v13, "setRecordZoneChangeTokensUpdatedBlock:", v55);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10003F638;
  v50[3] = &unk_1007D8FB8;
  v53 = v71;
  v31 = v29;
  v51 = v31;
  v52 = self;
  objc_copyWeak(&v54, &location);
  objc_msgSend(v13, "setRecordZoneFetchCompletionBlock:", v50);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10003F7FC;
  v43[3] = &unk_1007D8FE0;
  v48 = v71;
  v32 = v31;
  v44 = v32;
  v45 = self;
  v33 = v30;
  v46 = v33;
  objc_copyWeak(&v49, &location);
  v47 = v42;
  objc_msgSend(v13, "setFetchRecordZoneChangesCompletionBlock:", v43);
  v34 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_loggingDescription", &v70));
    *(_DWORD *)buf = 138543874;
    v78 = v33;
    v79 = 2114;
    v80 = v35;
    v81 = 2114;
    v82 = v42;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Creating fetch changes operation in account ID %{public}@: %{public}@, syncReason: %{public}@", buf, 0x20u);

  }
  v36 = v13;
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v60);

  objc_destroyWeak(&v65);
  objc_destroyWeak(v39);
  _Block_object_dispose(v71, 8);

  _Block_object_dispose(v83, 8);
  objc_destroyWeak(&location);

  return v36;
}

- (void)fetchRecordZoneChangesOperation:(id)a3 completedFetchForZoneID:(id)a4 serverChangeToken:(id)a5 batchFetchHelper:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003FBF4;
  v20[3] = &unk_1007D8500;
  v20[4] = self;
  v21 = v12;
  v22 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext debug_replaceWithSimulatedCKErrorIfSetWithOriginalError:](self, "debug_replaceWithSimulatedCKErrorIfSetWithOriginalError:", a7));
  v23 = v13;
  v24 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v22;
  v19 = v12;
  objc_msgSend(v15, "addDispatchBlock:", v20);

}

- (void)fetchRecordZoneChangesOperationDidComplete:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004030C;
  block[3] = &unk_1007D7CE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasChangedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  ICCloudContext *v50;
  NSObject *v51;
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "database"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v17));

  if (objc_msgSend(v18, "length"))
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    v26 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      sub_10067BEE0();

    if (v15)
    {
LABEL_3:
      v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_loggingDescription"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_shortLoggingDescription"));
        *(_DWORD *)buf = 138544130;
        v54 = v18;
        v55 = 2114;
        v56 = v21;
        v57 = 2112;
        v58 = v15;
        v59 = 2114;
        v60 = v22;
        v23 = "[fetchRecordZoneChangesOperation:recordWasChangedWithRecordID:record:error:context:] Error fetching record"
              " for account ID %{public}@: %{public}@ %@ %{public}@";
        v24 = v20;
        v25 = 42;
LABEL_5:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  if (!v14)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_loggingDescription"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_shortLoggingDescription"));
    *(_DWORD *)buf = 138543874;
    v54 = v18;
    v55 = 2114;
    v56 = v21;
    v57 = 2114;
    v58 = v22;
    v23 = "[fetchRecordZoneChangesOperation:recordWasChangedWithRecordID:record:error:context:] Fetching record with nil "
          "record for account ID %{public}@: %{public}@ %{public}@";
    v24 = v20;
    v25 = 32;
    goto LABEL_5;
  }
  v27 = (void *)objc_opt_class(REMCDObject, v19);
  v44 = v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordName"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ckIdentifierFromRecordName:", v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parent"));
  if (v30)
  {
    v52[0] = v20;
    v31 = (void *)objc_opt_class(REMCDObject, v29);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parent"));
    v43 = v16;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "recordID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recordName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ckIdentifierFromRecordName:", v32));
    v52[1] = v33;
    v34 = v12;
    v35 = v15;
    v36 = v14;
    v37 = v30;
    v38 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 2));

    v39 = (void *)v38;
    v30 = v37;
    v14 = v36;
    v15 = v35;
    v12 = v34;

    v16 = v43;
  }
  else
  {
    v51 = v20;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "batchFetchHelper"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100040B04;
  v45[3] = &unk_1007D8500;
  v46 = v16;
  v47 = v18;
  v48 = v14;
  v49 = v12;
  v50 = self;
  objc_msgSend(v40, "addCKIdentifiers:accountIdentifier:dispatchBlock:", v39, v47, v45);

  v13 = v44;
LABEL_16:

}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 recordType:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  ICCloudContext *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "batchFetchHelper"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "database"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v15));

  if (!objc_msgSend(v16, "length"))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      sub_10067BFE4();

  }
  if (objc_msgSend(v12, "isEqualToString:", CKRecordTypeShare))
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10004101C;
    v34[3] = &unk_1007D7C40;
    v35 = v13;
    v36 = v16;
    v37 = v11;
    v38 = v10;
    v19 = v10;
    v20 = v11;
    v21 = v16;
    v22 = v13;
    objc_msgSend(v14, "addDispatchBlock:", v34);

    v23 = v35;
  }
  else
  {
    v24 = (void *)objc_opt_class(REMCDObject, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ckIdentifierFromRecordName:", v25));
    v39 = v26;
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004119C;
    v27[3] = &unk_1007D9008;
    v28 = v13;
    v29 = v16;
    v30 = v11;
    v31 = v10;
    v32 = self;
    v33 = v12;
    v23 = v10;
    v19 = v11;
    v20 = v16;
    v21 = v13;
    objc_msgSend(v14, "addCKIdentifiers:accountIdentifier:dispatchBlock:", v22, v20, v27);

  }
}

- (void)fetchRecordZoneChangesOperation:(id)a3 zoneID:(id)a4 accountID:(id)a5 changeTokenUpdated:(id)a6 batchFetchHelper:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  ICCloudContext *v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100041560;
  v19[3] = &unk_1007D8500;
  v20 = v13;
  v21 = a6;
  v22 = v12;
  v23 = self;
  v24 = v14;
  v15 = v14;
  v16 = v12;
  v17 = v21;
  v18 = v13;
  objc_msgSend(a7, "addDispatchBlock:", v19);

}

- (void)_performSortingChildrenObjectsAfterFetchingInBlockOfManagedObjectContext:(id)a3 fetchHasFullyCompleted:(BOOL)a4 accountID:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  unsigned int v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v7 = a3;
  v39 = a5;
  v8 = (unint64_t)objc_msgSend(v7, "shouldSortChildrenAfterFetching");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordIDsToSortChildrenAfterFetching"));
  objc_msgSend(v7, "setShouldSortChildrenAfterFetching:", 0);
  objc_msgSend(v7, "setRecordIDsToSortChildrenAfterFetching:", 0);
  if ((_DWORD)v8 && v9)
  {
    v30 = v8;
    v31 = a4;
    v32 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v9));
    v12 = objc_msgSend((id)objc_opt_class(self, v11), "_recordTypesToSortChildrenAfterFetch");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    v36 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v36)
    {
      v33 = *(_QWORD *)v45;
      v34 = v13;
      v35 = v10;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(v13);
          v37 = v14;
          v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v10, "count")));
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v17 = v10;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(_QWORD *)v41 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
                v23 = objc_autoreleasePoolPush();
                v24 = v7;
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v22, v15, v39, v7));
                v26 = v25;
                if (v25)
                {
                  objc_msgSend(v25, "sortChildrenObjects");
                  objc_msgSend(v16, "addObject:", v22);
                }

                objc_autoreleasePoolPop(v23);
                v7 = v24;
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
            }
            while (v19);
          }

          if (objc_msgSend(v16, "count"))
          {
            v27 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v49 = v16;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sorted children objects after fetching RecordZoneChanges {sortedRecordIDs: %{public}@}", buf, 0xCu);
            }

          }
          objc_msgSend(v17, "minusSet:", v16);

          v14 = v37 + 1;
          v10 = v35;
          v13 = v34;
        }
        while ((id)(v37 + 1) != v36);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v36);
    }

    v9 = v32;
    v8 = v30;
    if (objc_msgSend(v10, "count"))
    {
      v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        sub_10067C064();

    }
    a4 = v31;
  }
  if (!a4)
  {
    objc_msgSend(v7, "setShouldSortChildrenAfterFetching:", v8);
    if ((v8 & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      objc_msgSend(v7, "setRecordIDsToSortChildrenAfterFetching:", v28);

    }
    else
    {
      objc_msgSend(v7, "setRecordIDsToSortChildrenAfterFetching:", 0);
    }
  }

}

- (void)firePollingSyncRequest
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_100041AB8;
  activity_block[3] = &unk_1007D7A60;
  activity_block[4] = self;
  _os_activity_initiate((void *)&_mh_execute_header, "ICCloudContext Polling Timer Fired", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);
}

- (void)fetchDatabaseChangesWithReason:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100041CAC;
  v23[3] = &unk_1007D9030;
  v13 = v11;
  v24 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v23);

  v14 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100041DA0;
  v18[3] = &unk_1007D8E78;
  v18[4] = self;
  v19 = v13;
  v20 = v10;
  v21 = v8;
  v22 = v9;
  v15 = v9;
  v16 = v8;
  v17 = v13;
  dispatch_async(v14, v18);

}

- (void)fetchDatabaseChangesForDatabases:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  NSObject *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  id v28;
  id v29;
  id obj;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _QWORD *v39;
  _QWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v10 = a3;
  v28 = a4;
  v31 = a5;
  v29 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v11);

  v32 = objc_alloc_init((Class)CKOperationGroup);
  if (objc_msgSend(v28, "length"))
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FetchDatabaseChanges"), "stringByAppendingFormat:", CFSTR("-%@"), v28));
  else
    v12 = CFSTR("FetchDatabaseChanges");
  v27 = (__CFString *)v12;
  objc_msgSend(v32, "setName:");
  objc_msgSend(v32, "setQuantity:", objc_msgSend(v10, "count"));
  objc_msgSend(v32, "setExpectedSendSize:", 1);
  objc_msgSend(v32, "setExpectedReceiveSize:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_1000228A0;
  v45[4] = sub_1000228B0;
  v46 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_100042270;
        v40[3] = &unk_1007D9058;
        v40[4] = self;
        v40[5] = v45;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationToFetchDatabaseChangesForDatabase:cloudSchemaCatchUpSyncContextMap:completionHandler:](self, "operationToFetchDatabaseChangesForDatabase:cloudSchemaCatchUpSyncContextMap:completionHandler:", v17, v31, v40));
        objc_msgSend(v18, "setGroup:", v32);
        objc_msgSend(v13, "addObject:", v18);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v14);
  }

  if (v29)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100042320;
    v37[3] = &unk_1007D8190;
    v37[4] = self;
    v39 = v45;
    v38 = v29;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICNSBlockOperation blockOperationWithBlock:](ICNSBlockOperation, "blockOperationWithBlock:", v37));
    objc_msgSend(v19, "setName:", ICNSBlockOperationNameFetchDatabaseChangesCompletion);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v13;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "addDependency:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j));
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      }
      while (v21);
    }

    objc_msgSend(v20, "addObject:", v19);
  }
  v24 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543362;
    v48 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Fetching database changes with operation group %{public}@", buf, 0xCu);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  objc_msgSend(v26, "addOperations:waitUntilFinished:", v13, 0);

  -[ICCloudContext errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary](self, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
  _Block_object_dispose(v45, 8);

}

- (id)operationToFetchDatabaseChangesForDatabase:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id location;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;

  v8 = a3;
  v39 = a4;
  v9 = a5;
  v41 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v8));
  if (!objc_msgSend(v10, "length"))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10067C12C();

  }
  if (v10)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", v10));
  else
    v12 = 0;
  v37 = v12;
  if (objc_msgSend(v12, "shouldPerformCloudSchemaCatchUpSync"))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "databaseScope")));
      *(_DWORD *)buf = 138543618;
      v62 = v10;
      v63 = 2112;
      v64 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Account shouldPerformCloudSchemaCatchUpSync. Will create CKFetchDatabaseChangesOperation with nil previousServerChangeToken {accountID: %{public}@, databaseScope: %@}", buf, 0x16u);

    }
    v40 = 0;
  }
  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext serverChangeTokenForChangedZonesInDatabase:accountID:](self, "serverChangeTokenForChangedZonesInDatabase:accountID:", v8, v10));
  }
  v15 = objc_msgSend(objc_alloc((Class)CKFetchDatabaseChangesOperation), "initWithPreviousServerChangeToken:", v40);
  -[ICCloudContext configureOperation:](self, "configureOperation:", v15);
  objc_msgSend(v15, "setDatabase:", v41);
  objc_msgSend(v15, "setFetchAllChanges:", 1);
  objc_initWeak(&location, v15);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100042A44;
  v56[3] = &unk_1007D9080;
  v56[4] = self;
  objc_copyWeak(&v58, &location);
  v16 = v10;
  v57 = v16;
  objc_msgSend(v15, "setRecordZoneWithIDChangedBlock:", v56);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100042AA8;
  v53[3] = &unk_1007D9080;
  v53[4] = self;
  objc_copyWeak(&v55, &location);
  v17 = v16;
  v54 = v17;
  objc_msgSend(v15, "setRecordZoneWithIDWasDeletedBlock:", v53);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100042B0C;
  v50[3] = &unk_1007D90A8;
  v50[4] = self;
  objc_copyWeak(&v52, &location);
  v18 = v17;
  v51 = v18;
  objc_msgSend(v15, "setChangeTokenUpdatedBlock:", v50);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100042B70;
  v46[3] = &unk_1007D90D0;
  v46[4] = self;
  objc_copyWeak(&v49, &location);
  v38 = v18;
  v47 = v38;
  v19 = v9;
  v48 = v19;
  objc_msgSend(v15, "setFetchDatabaseChangesCompletionBlock:", v46);
  v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v36 = v19;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_loggingDescription", v19));
    *(_DWORD *)buf = 138543618;
    v62 = v38;
    v63 = 2114;
    v64 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Creating fetch database changes operation for account %{public}@, %{public}@", buf, 0x16u);

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "operations"));

  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v29 = objc_opt_class(CKAcceptSharesOperation, v24);
        if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
        {
          v30 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_loggingDescription"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ic_loggingDescription"));
            *(_DWORD *)buf = 138543618;
            v62 = v31;
            v63 = 2114;
            v64 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Database changes operation %{public}@ will wait for %{public}@", buf, 0x16u);

          }
          objc_msgSend(v15, "addDependency:", v28);
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    }
    while (v25);
  }

  v33 = v48;
  v34 = v15;

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v52);

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&location);
  return v34;
}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDChanged:(id)a4 accountID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  ICCloudContext *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100042CD4;
  v15[3] = &unk_1007D7C40;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)sharedZoneWasDeleted:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  ICCloudContext *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Shared zone was deleted for account ID %{public}@: %{public}@", buf, 0x16u);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100042F70;
  v12[3] = &unk_1007D90F8;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  -[ICCloudContext performAndWaitContextWithBatchFetchHelperForAccountID:block:](self, "performAndWaitContextWithBatchFetchHelperForAccountID:block:", v10, v12);

}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDWasDeleted:(id)a4 accountID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  ICCloudContext *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100043364;
  v15[3] = &unk_1007D7C40;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)fetchDatabaseChangesOperation:(id)a3 changeTokenUpdated:(id)a4 accountID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  ICCloudContext *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000436F8;
  v15[3] = &unk_1007D7C40;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)fetchDatabaseChangesOperation:(id)a3 finishedWithServerChangeToken:(id)a4 accountID:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
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
  ICCloudContext *v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100043950;
  v23[3] = &unk_1007D9120;
  v24 = v14;
  v25 = v13;
  v26 = v12;
  v27 = v15;
  v28 = self;
  v29 = v16;
  v18 = v15;
  v19 = v16;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  dispatch_async(v17, v23);

}

- (id)retryCountFetchDatabaseChangesOperationTypeForAccountID:(id)a3 dataScopeString:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKFetchDatabaseChangesOperation_%@_%@"), a3, a4);
}

- (void)loadZoneFetchState
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;

  if (qword_1008526F8 != -1)
    dispatch_once(&qword_1008526F8, &stru_1007D9140);
  v3 = objc_opt_new(NSMutableDictionary);
  -[ICCloudContext setAccountZoneIDsNeedingFetchChanges:](self, "setAccountZoneIDsNeedingFetchChanges:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CloudKitAccountZonesNeedingFetchChanges")));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100044088;
  v9[3] = &unk_1007D9168;
  v9[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = objc_opt_new(NSMutableDictionary);
  -[ICCloudContext setAccountZoneIDsFetchingChanges:](self, "setAccountZoneIDsFetchingChanges:", v6);

  v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingFetchChanges](self, "accountZoneIDsNeedingFetchChanges"));
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded zone fetch state: zonesNeedingFetchChanges=%{public}@", buf, 0xCu);

  }
}

- (void)saveZoneFetchState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  ICCloudContext *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingFetchChanges](self, "accountZoneIDsNeedingFetchChanges"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000442F0;
  v17[3] = &unk_1007D9190;
  v17[4] = self;
  v5 = v3;
  v18 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v17);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsFetchingChanges](self, "accountZoneIDsFetchingChanges"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100044374;
  v14 = &unk_1007D9190;
  v15 = self;
  v7 = v5;
  v16 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v11);

  v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit", v11, v12, v13, v14, v15));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving zone fetch state: zonesNeedingFetchChanges=%@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = objc_msgSend(v7, "copy");
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("CloudKitAccountZonesNeedingFetchChanges"));

}

- (void)clearZoneFetchState
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000444AC;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v3, block);

}

+ (id)zoneInfosFromZoneIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ZoneName"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ownerName"));
        v13 = objc_msgSend(v12, "isEqualToString:", CKCurrentUserDefaultName);

        if ((v13 & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ownerName"));
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("OwnerName"));

        }
        objc_msgSend(v4, "addObject:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)zoneIDsFromZoneInfos:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  NSString *v11;
  id v12;
  NSString *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v3, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v14 = CKCurrentUserDefaultName;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ZoneName"), v14));
        v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OwnerName")));
        if (!v11)
          v11 = v14;
        v12 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:databaseScope:", v10, v11, +[CKRecordZoneID ic_defaultDatabaseScopeForOwnerName:](CKRecordZoneID, "ic_defaultDatabaseScopeForOwnerName:", v11));
        objc_msgSend(v4, "addObject:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)subscriptionForDatabase:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = CKDatabaseScopeString(objc_msgSend(a3, "databaseScope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DatabaseSubscription-%@"), v4));

  v6 = objc_msgSend(objc_alloc((Class)CKDatabaseSubscription), "initWithSubscriptionID:", v5);
  v7 = objc_alloc_init((Class)CKNotificationInfo);
  objc_msgSend(v7, "setShouldSendContentAvailable:", 1);
  objc_msgSend(v6, "setNotificationInfo:", v7);

  return v6;
}

- (void)setupAPSConnection
{
  void *v3;
  unsigned int v4;
  id *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext apsConnection](self, "apsConnection"));

  if (!v3)
  {
    v4 = +[REMCloudContainer isSandboxEnvironment](REMCloudContainer, "isSandboxEnvironment");
    v5 = (id *)&APSEnvironmentDevelopment;
    if (!v4)
      v5 = (id *)&APSEnvironmentProduction;
    v6 = *v5;
    v7 = REMDaemonAPSNamedDelegatePort;
    v8 = objc_alloc((Class)APSConnection);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
    v10 = objc_msgSend(v8, "initWithEnvironmentName:namedDelegatePort:queue:", v6, v7, v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", REMAppBundleIdentifier));
      -[ICCloudContext setApsTopic:](self, "setApsTopic:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext apsTopic](self, "apsTopic"));
      v14 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      objc_msgSend(v10, "_setEnabledTopics:", v13);

      objc_msgSend(v10, "setDelegate:", self);
      -[ICCloudContext setApsConnection:](self, "setApsConnection:", v10);
    }

  }
}

- (void)updateSubscriptionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICSyncSettings sharedSettings](ICSyncSettings, "sharedSettings"));
  v6 = objc_msgSend(v5, "hasOptions:", 1);

  if ((v6 & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100044C20;
    v8[3] = &unk_1007D8140;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
  else
  {
    -[ICCloudContext setNeedsToUpdateSubscriptions:](self, "setNeedsToUpdateSubscriptions:", 0);
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)fetchSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000455A4;
  block[3] = &unk_1007D8410;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)saveSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045C4C;
  block[3] = &unk_1007D8410;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)loadSubscribedSubscriptionIDs
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userDefaults"));
  objc_msgSend(v4, "doubleForKey:", CFSTR("SubscriptionIDsLastModifiedDate"));
  v6 = v5;

  if (v6 <= 0.0)
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v6));
  v8 = (void *)v7;
  -[ICCloudContext setSubscribedSubscriptionIDsLastModifiedDate:](self, "setSubscribedSubscriptionIDsLastModifiedDate:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  objc_msgSend(v9, "persistedSubscriptionIDsValidityPeriod");
  v11 = v10;

  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext subscribedSubscriptionIDsLastModifiedDate](self, "subscribedSubscriptionIDsLastModifiedDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
    *(_DWORD *)buf = 138543874;
    v29 = v13;
    v30 = 2114;
    v31 = v14;
    v32 = 2114;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loaded subscribed subscription IDs last updated time from user defaults {timestamp: %{public}@, date: %{public}@, validityPeriod: %{public}@}", buf, 0x20u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext subscribedSubscriptionIDsLastModifiedDate](self, "subscribedSubscriptionIDsLastModifiedDate"));
  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
  v19 = v18;

  if (v19 <= v11)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userDefaults"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dictionaryForKey:", CFSTR("SubscriptionIDs")));

    v23 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Loaded subscribed subscription IDs from user defaults: %@", buf, 0xCu);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004678C;
    v26[3] = &unk_1007D9168;
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v24 = v27;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v26);
    v25 = objc_msgSend(v24, "copy");
    -[ICCloudContext setSubscribedSubscriptionIDsByAccountID:](self, "setSubscribedSubscriptionIDsByAccountID:", v25);

  }
  else
  {
    -[ICCloudContext clearSubscribedSubscriptionIDs](self, "clearSubscribedSubscriptionIDs");
  }
}

- (void)addSubscribedSubscriptionIDs:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Persisting subscribed subscription ID to user defaults {subscriptionID: %{public}@}", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext subscribedSubscriptionIDsByAccountID](self, "subscribedSubscriptionIDsByAccountID"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext subscribedSubscriptionIDsByAccountID](self, "subscribedSubscriptionIDsByAccountID"));
    v12 = objc_msgSend(v11, "mutableCopy");

  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v7));
  v14 = v13;
  if (!v13)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "setByAddingObject:", v6));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v7);

  if (!v13)
  v16 = objc_msgSend(v12, "copy");
  -[ICCloudContext setSubscribedSubscriptionIDsByAccountID:](self, "setSubscribedSubscriptionIDsByAccountID:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[ICCloudContext setSubscribedSubscriptionIDsLastModifiedDate:](self, "setSubscribedSubscriptionIDsLastModifiedDate:", v17);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100046AB8;
  v23[3] = &unk_1007D8E50;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v18 = v24;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "userDefaults"));

  v21 = objc_msgSend(v18, "copy");
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("SubscriptionIDs"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext subscribedSubscriptionIDsLastModifiedDate](self, "subscribedSubscriptionIDsLastModifiedDate"));
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "setDouble:forKey:", CFSTR("SubscriptionIDsLastModifiedDate"));

}

- (void)clearSubscribedSubscriptionIDs
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing subscribed subscription IDs", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userDefaults"));

  objc_msgSend(v6, "removeObjectForKey:", CFSTR("SubscriptionIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  -[ICCloudContext setSubscribedSubscriptionIDsByAccountID:](self, "setSubscribedSubscriptionIDsByAccountID:", v7);

  objc_msgSend(v6, "removeObjectForKey:", CFSTR("SubscriptionIDsLastModifiedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  -[ICCloudContext setSubscribedSubscriptionIDsLastModifiedDate:](self, "setSubscribedSubscriptionIDsLastModifiedDate:", v8);

  -[ICCloudContext setNeedsToUpdateSubscriptions:](self, "setNeedsToUpdateSubscriptions:", 1);
}

- (BOOL)isInForeground
{
  return 1;
}

- (void)updateCloudContextStateWithSyncOption:(int64_t)a3 syncReason:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[6];
  id v16;
  id v17;
  int64_t v18;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.updateCloudContextState}", buf, 2u);
  }

  v11 = (void *)os_transaction_create("com.apple.remindd.cloudkit.updateCloudContextState");
  v12 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046D74;
  block[3] = &unk_1007D9398;
  block[4] = v9;
  block[5] = self;
  v16 = v11;
  v17 = v8;
  v18 = a3;
  v13 = v11;
  v14 = v8;
  dispatch_async(v12, block);

}

- (void)updateCloudContextStateWithReason:(id)a3
{
  -[ICCloudContext updateCloudContextStateWithSyncOption:syncReason:withCompletionHandler:](self, "updateCloudContextStateWithSyncOption:syncReason:withCompletionHandler:", 0, a3, 0);
}

- (void)checkForLongLivedOperations
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004818C;
  v4[3] = &unk_1007D9030;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (id)_existingCloudDirtyToken
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("CloudDirtyUUIDKey")));

  return v6;
}

- (id)_markCloudAsDirtyAndReturnToken
{
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init((Class)NSUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Marking cloud as dirty {newToken: %{public}@}", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userDefaults"));
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("CloudDirtyUUIDKey"));

  return v5;
}

- (void)_clearCloudDirtyForToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userDefaults"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("CloudDirtyUUIDKey")));
  v9 = v8;
  if (v8 && !objc_msgSend(v8, "isEqual:", v4))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NOT clearing cloud dirty {currentToken: %{public}@, cloudDirtyToken: %{public}@}", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Clearing cloud dirty {currentToken: %{public}@, cloudDirtyToken: %{public}@}", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(v7, "removeObjectForKey:", CFSTR("CloudDirtyUUIDKey"));
  }

}

- (void)incrementRetryCountForOperationType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048B64;
  v7[3] = &unk_1007D7C68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)clearRetryCountForOperationType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICCloudContext *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048D60;
  v7[3] = &unk_1007D7C68;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)incrementOrClearRetryCountForOperationType:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6
    && !-[ICCloudContext shouldIgnoreErrorForBackoffTimer:operationType:](self, "shouldIgnoreErrorForBackoffTimer:operationType:", v6, v7))
  {
    -[ICCloudContext incrementRetryCountForOperationType:](self, "incrementRetryCountForOperationType:", v7);
  }
  else
  {
    -[ICCloudContext clearRetryCountForOperationType:](self, "clearRetryCountForOperationType:", v7);
  }

}

- (id)errorCodesToIgnoreForBackoffTimer
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_100804560, &off_100804578, 0);
}

- (BOOL)shouldIgnoreErrorForBackoffTimer:(id)a3 operationType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext retryCountsByOperationType](self, "retryCountsByOperationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (v9)
  {
    v10 = 0;
  }
  else if (objc_msgSend(v6, "code") == (id)2)
  {
    v12 = objc_opt_class(NSDictionary, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));
    v15 = REMDynamicCast(v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allValues"));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004907C;
    v21[3] = &unk_1007D9410;
    v21[4] = self;
    v22 = v7;
    v10 = objc_msgSend(v17, "ic_containsObjectPassingTest:", v21);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext errorCodesToIgnoreForBackoffTimer](self, "errorCodesToIgnoreForBackoffTimer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
    v10 = objc_msgSend(v18, "containsObject:", v19);

  }
  return v10;
}

- (void)startRetryTimerIfNecessaryWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100049124;
  v7[3] = &unk_1007D7C68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)retryOperationsIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create((void *)&_mh_execute_header, "CloudKit Retry", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049644;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v4 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004968C;
  v5[3] = &unk_1007D7A60;
  v5[4] = self;
  dispatch_async(v4, v5);

  os_activity_scope_leave(&state);
}

- (id)debug_replaceWithSimulatedCKErrorIfSetWithOriginalError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugSimulatedCKErrorCode"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DEBUG debugSimulatedCKErrorCode=%@, original=%@", (uint8_t *)&v14, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v8 = objc_msgSend(v7, "mutableCopy");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3.0));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CKErrorRetryAfterKey);

    v10 = objc_msgSend(v5, "integerValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, v10, v11));

  }
  else
  {
    v12 = v3;
  }

  return v12;
}

- (void)debug_retryAccountZoneIDsNeedingToBeSavedWithZoneID:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DEBUG retryAccountZoneIDsNeedingToBeSaved {zoneID=%@, accountID=%@}", (uint8_t *)&v14, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext accountZoneIDsNeedingToBeSaved](self, "accountZoneIDsNeedingToBeSaved"));
  objc_msgSend(v9, "ic_addZoneID:forAccountID:", v6, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3.0));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CKErrorRetryAfterKey);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 1, v12));

  -[ICCloudContext startRetryTimerIfNecessaryWithError:](self, "startRetryTimerIfNecessaryWithError:", v13);
}

- (void)saveServerChangeToken:(id)a3 forRecordZoneID:(id)a4 databaseScope:(int64_t)a5 accountID:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  ICCloudContext *v25;
  id v26;
  id v27;
  int64_t v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_loggingDescription"));
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = CFSTR("zone changes");
    v17 = CKDatabaseScopeString(a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543874;
    v30 = v16;
    v31 = 2114;
    v32 = v18;
    v33 = 2114;
    v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Saving server change token for %{public}@ %{public}@: %{public}@", buf, 0x20u);

  }
  if (v12)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext serverChangeTokenContext](self, "serverChangeTokenContext"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004AA14;
    v22[3] = &unk_1007D9530;
    v23 = v12;
    v24 = v20;
    v25 = self;
    v26 = v11;
    v28 = a5;
    v27 = v10;
    v21 = v20;
    -[NSObject performBlockAndWait:](v21, "performBlockAndWait:", v22);

  }
  else
  {
    v21 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10067CCDC();
  }

}

- (id)serverChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_1000228A0;
    v25 = sub_1000228B0;
    v26 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext serverChangeTokenContext](self, "serverChangeTokenContext"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004B0CC;
    v15[3] = &unk_1007D9558;
    v16 = v9;
    v11 = v10;
    v17 = v11;
    v19 = &v21;
    v20 = a4;
    v18 = v8;
    objc_msgSend(v11, "performBlockAndWait:", v15);
    v12 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10067CD68();

    v12 = 0;
  }

  return v12;
}

- (void)deleteServerChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  ICCloudContext *v22;
  int64_t v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  void *v27;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("zone changes");
    v14 = CKDatabaseScopeString(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2114;
    v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleting server change token for %{public}@ %{public}@", buf, 0x16u);

  }
  if (v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext serverChangeTokenContext](self, "serverChangeTokenContext"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004B36C;
    v18[3] = &unk_1007D9580;
    v19 = v9;
    v20 = v16;
    v22 = self;
    v23 = a4;
    v21 = v8;
    v17 = v16;
    -[NSObject performBlockAndWait:](v17, "performBlockAndWait:", v18);

  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10067CE68();
  }

}

- (void)deleteAllServerChangeTokens
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting all server change tokens", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004B510;
  v5[3] = &unk_1007D7C68;
  v5[4] = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext serverChangeTokenContext](self, "serverChangeTokenContext"));
  v4 = v6;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

- (void)deleteAllApplicationDataFromServerWithAccountID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting all server data", buf, 2u);
  }

  if (objc_msgSend(v6, "length"))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004B82C;
    v12[3] = &unk_1007D8410;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    -[ICCloudContext cancelEverythingWithCompletionHandler:](self, "cancelEverythingWithCompletionHandler:", v12);

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_10067CF58();

    v10 = ICGenericError();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
}

- (void)saveServerChangeToken:(id)a3 forChangedZonesInDatabase:(id)a4 accountID:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[ICCloudContext saveServerChangeToken:forRecordZoneID:databaseScope:accountID:](self, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:", v9, 0, objc_msgSend(a4, "databaseScope"), v8);

}

- (void)deleteServerChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4
{
  id v6;

  v6 = a4;
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:", 0, objc_msgSend(a3, "databaseScope"), v6);

}

- (id)serverChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:", 0, objc_msgSend(a3, "databaseScope"), v6));

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  BOOL v24;
  BOOL v25;
  dispatch_queue_global_t global_queue;
  NSObject *v27;
  NSObject *v28;
  objc_super v29;
  _QWORD v30[5];
  _QWORD block[6];

  if (off_100836070 == a6)
  {
    v11 = a5;
    v13 = objc_opt_class(NSNumber, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
    v15 = REMDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    v19 = objc_opt_class(NSNumber, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));

    v21 = REMDynamicCast(v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_msgSend(v22, "unsignedIntegerValue");

    if (v17)
      v24 = 1;
    else
      v24 = v23 == 0;
    if (!v24 || (v17 ? (v25 = v23 == 0) : (v25 = 0), v25))
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v27 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004BE00;
      block[3] = &unk_1007D9438;
      block[4] = self;
      block[5] = v23;
      dispatch_async(v27, block);

    }
    v28 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10004BED8;
    v30[3] = &unk_1007D7A60;
    v30[4] = self;
    dispatch_async(v28, v30);

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)ICCloudContext;
    v10 = a5;
    -[ICCloudContext observeValueForKeyPath:ofObject:change:context:](&v29, "observeValueForKeyPath:ofObject:change:context:", a3, a4, v10, a6);

  }
}

- (BOOL)shouldPollCloudKitWhenLaunchingAndBackgrounding
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BF98;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  if (qword_100852700 != -1)
    dispatch_once(&qword_100852700, block);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PollCloudKitWhenLaunchingAndBackgrounding"));

  return v5;
}

- (void)_accountsDidEnableOrDisable
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[ICCloudContext clearContainers](self, "clearContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  objc_msgSend(v3, "setCloudKitMergeLocalLastDateMaxRetryReached:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  objc_msgSend(v4, "setCloudKitMergeLocalLastBuildVersionMaxRetryReached:", 0);

  v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C110;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)accountsDidDisable
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICCC received accountsDidDisable from RDStoreController.", buf, 2u);
  }

  -[ICCloudContext _accountsDidEnableOrDisable](self, "_accountsDidEnableOrDisable");
  -[ICCloudContext removeStaleAccountStatus](self, "removeStaleAccountStatus");
  -[ICCloudContext removeStaleFetchDatabaseRetryMetadata](self, "removeStaleFetchDatabaseRetryMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext operationQueue](self, "operationQueue"));
  v5 = objc_msgSend(v4, "operationCount");

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICCC: Stopping all CloudKit operations after deleting CloudKit account", buf, 2u);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004C344;
    v7[3] = &unk_1007D7A60;
    v7[4] = self;
    -[ICCloudContext cancelEverythingWithCompletionHandler:](self, "cancelEverythingWithCompletionHandler:", v7);
  }
}

- (void)accountsDidEnable
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v6;
  id v7;
  void *v8;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v9;
  NSObject *v10;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v11;
  __int16 v12[8];
  _QWORD v13[4];
  id v14;
  id v15;
  id buf;
  _QWORD v17[5];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICCC received accountsDidEnable from RDStoreController.", (uint8_t *)&buf, 2u);
  }

  -[ICCloudContext _accountsDidEnableOrDisable](self, "_accountsDidEnableOrDisable");
  os_unfair_lock_lock(&self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004C5D8;
  v17[3] = &unk_1007D7A60;
  v17[4] = self;
  sub_10004C5D8((uint64_t)v17);
  os_unfair_lock_unlock(&self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);
  v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.accountsDidEnable.pending.RDAccountInitializerDidCompleteInitializeAllAccountsObserver}", (uint8_t *)&buf, 2u);
  }

  v5 = (void *)os_transaction_create("com.apple.remindd.cloudkit.accountsDidEnable.pending.RDAccountInitializerDidCompleteInitializeAllAccountsObserver");
  objc_initWeak(&buf, self);
  v6 = [RDAccountInitializerDidCompleteInitializeAllAccountsObserver alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004C638;
  v13[3] = &unk_1007D7C18;
  objc_copyWeak(&v15, &buf);
  v7 = v5;
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v9 = -[RDAccountInitializerDidCompleteInitializeAllAccountsObserver initWithHandler:queue:](v6, "initWithHandler:queue:", v13, v8);

  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ICCC: Observing DidCompleteInitializeAllAccountsNotification on accountsDidEnable.", (uint8_t *)v12, 2u);
  }

  -[RDAccountInitializerDidCompleteInitializeAllAccountsObserver observe](v9, "observe");
  os_unfair_lock_lock(&self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);
  v11 = v9;
  -[ICCloudContext setAccountInitializerDidCompleteOnAccountsDidChangeObserver:](self, "setAccountInitializerDidCompleteOnAccountsDidChangeObserver:", v11);
  os_unfair_lock_unlock(&self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);

}

- (void)didCompleteInitializeAllAccounts:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("error")));

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10067D07C();

LABEL_12:
      goto LABEL_16;
    }
  }
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ICCC: Calling -didCompleteInitializeAllAccounts:", (uint8_t *)&v15, 2u);
  }

  -[ICCloudContext observePrimaryCloudKitAccountPersonIDSaltChanges](self, "observePrimaryCloudKitAccountPersonIDSaltChanges");
  v11 = -[ICCloudContext isDisabled](self, "isDisabled");
  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext readinessLoggingDescription](self, "readinessLoggingDescription"));
      v15 = 138543362;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICCC still disabled after accountsDidChange and DidCompleteInitializeAllAccountsNotification, will retry UpdateCloudContext in a few seconds... {%{public}@}", (uint8_t *)&v15, 0xCu);

    }
    -[ICCloudContext setNeedsToUpdateCloudContextOnAccountsDidChange:](self, "setNeedsToUpdateCloudContextOnAccountsDidChange:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[REMError retryLaterErrorWithInterval:](REMError, "retryLaterErrorWithInterval:", 3.0));
    -[ICCloudContext startRetryTimerIfNecessaryWithError:](self, "startRetryTimerIfNecessaryWithError:", v8);
    goto LABEL_12;
  }
  if (v13)
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICCC: Now call UpdateCloudContext after accountsDidChange and RDAccountInitializer completed works.", (uint8_t *)&v15, 2u);
  }

  -[ICCloudContext setNeedsToUpdateCloudContextOnAccountsDidChange:](self, "setNeedsToUpdateCloudContextOnAccountsDidChange:", 0);
  -[ICCloudContext updateCloudContextStateWithSyncOption:syncReason:withCompletionHandler:](self, "updateCloudContextStateWithSyncOption:syncReason:withCompletionHandler:", 1, CFSTR("AccountsDidChange"), 0);
LABEL_16:

}

- (void)applicationWillEnterForeground
{
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cloud context received application will enter foreground notification", buf, 2u);
  }

  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CA84;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit", a3, a4));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Push connection established with iCloud", v5, 2u);
  }

}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v5;
  NSObject *v6;

  v5 = a5;
  v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10067D0E0();

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v35;

  v26 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = _os_activity_create((void *)&_mh_execute_header, "SYNC[APS]", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topic", v26));
    *(_DWORD *)buf = 138543362;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SYNC[APS] START {topic: %{public}@}", buf, 0xCu);

  }
  v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.sync.aps}", buf, 2u);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004CF38;
  v31[3] = &unk_1007D7A60;
  v12 = (id)os_transaction_create("com.apple.remindd.cloudkit.sync.aps");
  v32 = v12;
  v13 = objc_retainBlock(v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topic"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext apsTopic](self, "apsTopic"));
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKNotification notificationFromRemoteNotificationDictionary:](CKNotification, "notificationFromRemoteNotificationDictionary:", v17));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext _markCloudAsDirtyAndReturnToken](self, "_markCloudAsDirtyAndReturnToken"));
      v20 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004CFB8;
      block[3] = &unk_1007D9648;
      block[4] = self;
      v30 = v13;
      v28 = v18;
      v29 = v19;
      v21 = v19;
      dispatch_async(v20, block);

    }
    else
    {
      v24 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext apsTopic](self, "apsTopic"));
        sub_10067D144(v25, (uint64_t)buf, v24);
      }

      ((void (*)(_QWORD *))v13[2])(v13);
    }

  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topic"));
      sub_10067D190(v23, (uint64_t)buf, v22);
    }

    ((void (*)(_QWORD *))v13[2])(v13);
  }

  os_activity_scope_leave(&state);
}

- (void)setMigrationStateToDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 createZoneAccountIfFinishMigration:(BOOL)a5 accountID:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  dispatch_time_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  dispatch_time_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void (**v40)(id, id);
  _QWORD v41[4];
  void (**v42)(id, id);
  _QWORD v43[4];
  __CFString *v44;
  ICCloudContext *v45;
  NSObject *v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  BOOL v50;
  _QWORD v51[4];
  NSObject *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[4];
  _BYTE v66[10];
  __CFString *v67;
  const __CFString *v68;

  v8 = a5;
  v39 = a4;
  v9 = a3;
  v11 = (__CFString *)a6;
  v40 = (void (**)(id, id))a7;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_1000228A0;
  v63 = sub_1000228B0;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1000228A0;
  v57 = sub_1000228B0;
  v58 = 0;
  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("nil");
    *(_DWORD *)buf = 67109890;
    if (v11)
      v13 = v11;
    *(_DWORD *)v66 = v9;
    *(_WORD *)&v66[4] = 1024;
    *(_DWORD *)&v66[6] = v39;
    LOWORD(v67) = 1024;
    *(_DWORD *)((char *)&v67 + 2) = v8;
    HIWORD(v67) = 2114;
    v68 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Force-setting migration state {didChooseToMigrate: %d, didFinishMigration: %d, createZoneIfFinishMigration: %d, accountID = %{public}@", buf, 0x1Eu);
  }

  v14 = v9 && v8;
  if (v9 && v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext appleAccountUtilities](self, "appleAccountUtilities"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountStore"));

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accountWithIdentifier:", v11));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject displayAccount](v17, "displayAccount"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));

    if (!v19)
    {
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminders.cloud"), 0, 0));
      v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10067D2C0();

      v40[2](v40, v24);
      goto LABEL_30;
    }
    v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v66 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Force-setting migration state: display account: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v19 = v11;
  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v19));
  v21 = dispatch_group_create();
  v22 = v21;
  if (v14)
  {
    dispatch_group_enter(v21);
    v23 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v66 = CFSTR("Reminders");
      *(_WORD *)&v66[8] = 2114;
      v67 = v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Force-setting migration state: set %{public}@ zone for accountID: %{public}@", buf, 0x16u);
    }

    v24 = (__CFString *)objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", CFSTR("Reminders"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "privateCloudDatabase"));
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10004DB9C;
    v51[3] = &unk_1007D9670;
    v17 = v22;
    v52 = v17;
    objc_msgSend(v25, "saveRecordZone:completionHandler:", v24, v51);

    v26 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v17, v26))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminders.cloud"), 0, 0));
      v28 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_10067D318();

      v40[2](v40, v27);
      v11 = v19;
      goto LABEL_30;
    }

  }
  dispatch_group_enter(v22);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10004DC5C;
  v43[3] = &unk_1007D96C0;
  v11 = v19;
  v44 = v11;
  v45 = self;
  v50 = v14;
  v48 = &v59;
  v49 = &v53;
  v17 = v22;
  v46 = v17;
  v16 = v16;
  v47 = v16;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext fetchUserRecordOperationWithAccountID:completionHandler:](self, "fetchUserRecordOperationWithAccountID:completionHandler:", v11, v43));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "database"));
  objc_msgSend(v31, "addOperation:", v30);

  v32 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v17, v32))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminders.cloud"), 0, 0));
    v34 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_10067D2EC();

    v40[2](v40, v33);
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v60[5]));
    +[REMCDAccount writeMigrationStateTo:didChooseToMigrate:didFinishMigration:](REMCDAccount, "writeMigrationStateTo:didChooseToMigrate:didFinishMigration:", v60[5], v9, v39);
    v35 = v54[5];
    if (v35)
    {
      +[REMCDAccount writeMigrationStateTo:didChooseToMigrate:didFinishMigration:](REMCDAccount, "writeMigrationStateTo:didChooseToMigrate:didFinishMigration:", v35, v9, v39);
      objc_msgSend(v33, "addObject:", v54[5]);
    }
    v36 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v33, 0);
    -[ICCloudContext configureOperation:](self, "configureOperation:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "privateCloudDatabase"));
    objc_msgSend(v36, "setDatabase:", v37);

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10004E040;
    v41[3] = &unk_1007D8370;
    v42 = v40;
    objc_msgSend(v36, "setModifyRecordsCompletionBlock:", v41);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "database"));
    objc_msgSend(v38, "addOperation:", v36);

  }
  v24 = v44;
LABEL_30:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

}

- (void)migrationStateDidChange:(BOOL)a3 didFinishMigration:(BOOL)a4
{
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  v7 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E1DC;
  v8[3] = &unk_1007D96E8;
  v9 = a3;
  v10 = a4;
  v8[4] = self;
  dispatch_async(v7, v8);

}

- (void)adjustAPSNotificationDebouncerInterval
{
  id v3;
  _QWORD v4[5];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E388;
  v4[3] = &unk_1007D7FB0;
  v4[4] = self;
  v3 = -[ICCloudContext newBackgroundContext](self, "newBackgroundContext");
  v5 = v3;
  v6 = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v4);
  -[ICCloudContext adjustAPSNotificationDebouncerIntervalWithMigrationState:](self, "adjustAPSNotificationDebouncerIntervalWithMigrationState:", *((unsigned __int8 *)v8 + 24));

  _Block_object_dispose(&v7, 8);
}

- (void)adjustAPSNotificationDebouncerIntervalWithMigrationState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  int v11;
  double v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "apsDebouncerMigrationInProgressInterval");
  else
    objc_msgSend(v5, "apsDebouncerDefaultInterval");
  v8 = v7;
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting APS debouncer interval to %f", (uint8_t *)&v11, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext apsNotificationHandlingDebouncer](self, "apsNotificationHandlingDebouncer"));
  objc_msgSend(v10, "setDebouncingInterval:", v8);

}

- (id)setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:(id)a3 syncReason:(id)a4
{
  return -[ICCloudContext setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:syncReason:outBackgroundScheduledCatchUpSyncContextMap:](self, "setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:syncReason:outBackgroundScheduledCatchUpSyncContextMap:", a3, a4, 0);
}

- (id)setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:(id)a3 syncReason:(id)a4 outBackgroundScheduledCatchUpSyncContextMap:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  ICCloudSchemaCatchUpSyncContext *v19;
  NSObject *v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  unsigned int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];

  v8 = a3;
  v9 = a4;
  v32 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v10);

  if (!objc_msgSend(v8, "count"))
  {
    v33 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    goto LABEL_30;
  }
  v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v8, "count")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext icUserDefaults](self, "icUserDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudSchemaCatchUpSyncSchedulingStateStorage"));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = v8;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (!v13)
    goto LABEL_26;
  v14 = v13;
  v15 = *(_QWORD *)v37;
  do
  {
    v16 = 0;
    v34 = v14;
    do
    {
      if (*(_QWORD *)v37 != v15)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v17, 0, v31));
      v19 = -[ICCloudSchemaCatchUpSyncContext initWithAccountIdentifier:syncReason:schedulingStateStorage:managedObjectContext:]([ICCloudSchemaCatchUpSyncContext alloc], "initWithAccountIdentifier:syncReason:schedulingStateStorage:managedObjectContext:", v17, v9, v12, v18);
      if (!-[ICCloudSchemaCatchUpSyncContext shouldPerformCloudSchemaCatchUpSync](v19, "shouldPerformCloudSchemaCatchUpSync"))
      {
        v22 = v15;
        v23 = v12;
        v24 = v9;
        v25 = -[ICCloudSchemaCatchUpSyncContext isCloudSchemaCatchUpSyncNeeded](v19, "isCloudSchemaCatchUpSyncNeeded");
        v26 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v17;
            v42 = 2048;
            v43 = 20240715;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CloudSchemaCatchUpSync: Account needs to schedule a cloud schema catch up sync {accountID: %{public}@, runtimeCloudSchemaVersion: %lld}", buf, 0x16u);
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudSchemaCatchUpSyncController](self, "cloudSchemaCatchUpSyncController"));
          if (v28)
          {
            if (v32)
              objc_msgSend(v32, "setObject:forKey:", v19, v17);
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext cloudSchemaCatchUpSyncController](self, "cloudSchemaCatchUpSyncController"));
            objc_msgSend(v29, "scheduleBackgroundActivity");

            goto LABEL_23;
          }
          v27 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v17;
            v42 = 2048;
            v43 = 20240715;
            _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "CloudSchemaCatchUpSync: No ICCloudSchemaCatchUpSyncController given to the ICCloudContext, cannot schedule cloud schema catch up sync with system {accountID: %{public}@, runtimeCloudSchemaVersion: %lld}", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v41 = v17;
          v42 = 2048;
          v43 = 20240715;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "CloudSchemaCatchUpSync: Account does not need a cloud schema catch up sync {accountID: %{public}@, runtimeCloudSchemaVersion: %lld}", buf, 0x16u);
        }

LABEL_23:
        v9 = v24;
        v12 = v23;
        v15 = v22;
        v14 = v34;
        goto LABEL_24;
      }
      v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = -[ICCloudSchemaCatchUpSyncContext persistenceCloudSchemaVersion](v19, "persistenceCloudSchemaVersion");
        *(_DWORD *)buf = 138543874;
        v41 = v17;
        v42 = 2048;
        v43 = v21;
        v44 = 2048;
        v45 = 20240715;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CloudSchemaCatchUpSync: Account needs to perform cloud schema catch up sync {accountID: %{public}@, persistenceCloudSchemaVersion: %lld, runtimeCloudSchemaVersion: %lld}", buf, 0x20u);
      }

      objc_msgSend(v33, "setObject:forKey:", v19, v17);
LABEL_24:

      v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  }
  while (v14);
LABEL_26:

  if (objc_msgSend(v12, "schedulingState") != (id)1)
  {
    objc_msgSend(v12, "setSchedulingState:", 0);
    objc_msgSend(v12, "setLastScheduledDate:", 0);
  }

  v8 = v31;
LABEL_30:

  return v33;
}

- (void)didCompleteCloudSchemaCatchUpSyncWithContextMap:(id)a3 error:(id)a4 syncTypeLabel:(id)a5 debugLogLabel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  ICCloudContext *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EBC8;
  block[3] = &unk_1007D8500;
  v20 = v11;
  v21 = v10;
  v22 = self;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  dispatch_async(v14, block);

}

- (BOOL)retryPerformingCloudSchemaCatchUpSync
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _UNKNOWN **v7;
  _UNKNOWN **v8;
  void *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  unint64_t v24;
  _UNKNOWN **v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  unsigned int v31;
  _BYTE v32[128];

  v3 = objc_claimAutoreleasedReturnValue(-[ICCloudContext processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext retryCountsByOperationType](self, "retryCountsByOperationType"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CloudSchemaCatchUpSync")));
  v6 = (void *)v5;
  v7 = &off_100804548;
  if (v5)
    v7 = (_UNKNOWN **)v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v10 = objc_msgSend(v9, "cloudSchemaCatchUpSyncMaximumRetryCount");
  v11 = (int)objc_msgSend(v8, "intValue");
  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v13 = v12;
  if ((unint64_t)v10 <= v11)
  {
    v24 = v11;
    v25 = v8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_10067D3A8();

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext containersByAccountID](self, "containersByAccountID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v16;
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v14);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v21, 0, v24, v25, (_QWORD)v26));
          +[ICCloudSchemaCompatibilityUtils cloudSchemaCatchUpSyncDidCompleteWithAccountIdentifier:context:](ICCloudSchemaCompatibilityUtils, "cloudSchemaCatchUpSyncDidCompleteWithAccountIdentifier:context:", v21, v22);

        }
        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v18);
    }

    -[ICCloudContext clearRetryCountForOperationType:](self, "clearRetryCountForOperationType:", CFSTR("CloudSchemaCatchUpSync"));
    v11 = v24;
    v8 = v25;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v31 = objc_msgSend(v8, "intValue");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CloudSchemaCatchUpSync completed with error, will retry later (currentRetryCount: %d)", buf, 8u);
    }

    objc_msgSend(v9, "cloudSchemaCatchUpSyncInitialRetryInterval");
    v14 = (id)objc_claimAutoreleasedReturnValue(+[REMError retryLaterErrorWithInterval:](REMError, "retryLaterErrorWithInterval:"));
    -[ICCloudContext incrementOrClearRetryCountForOperationType:error:](self, "incrementOrClearRetryCountForOperationType:error:", CFSTR("CloudSchemaCatchUpSync"), v14);
    -[ICCloudContext startRetryTimerIfNecessaryWithError:](self, "startRetryTimerIfNecessaryWithError:", v14);
  }

  return (unint64_t)v10 > v11;
}

+ (id)babysittableWaiterID
{
  return CFSTR("ICCloudContext");
}

- (id)waiterID
{
  void *v2;

  v2 = (void *)objc_opt_class(self, a2);
  return _objc_msgSend(v2, "babysittableWaiterID");
}

- (RDStoreController)storeController
{
  return self->_storeController;
}

- (ICCloudContextDelegate)cloudContextDelegate
{
  return (ICCloudContextDelegate *)objc_loadWeakRetained((id *)&self->_cloudContextDelegate);
}

- (void)setCloudContextDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cloudContextDelegate, a3);
}

- (BOOL)fetchOperationsPending
{
  return self->_fetchOperationsPending;
}

- (BOOL)needsToUpdateSubscriptions
{
  return self->_needsToUpdateSubscriptions;
}

- (void)setNeedsToUpdateSubscriptions:(BOOL)a3
{
  self->_needsToUpdateSubscriptions = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (ICUserDefaults)icUserDefaults
{
  return self->_icUserDefaults;
}

- (void)setIcUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_icUserDefaults, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (REMAppleAccountUtilities)appleAccountUtilities
{
  return self->_appleAccountUtilities;
}

- (void)setAppleAccountUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountUtilities, a3);
}

- (ICCloudContextSyncMetrics)lastSyncMetrics
{
  return (ICCloudContextSyncMetrics *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastSyncMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)hasPassedBuddy
{
  return self->_hasPassedBuddy;
}

- (void)setHasPassedBuddy:(BOOL)a3
{
  self->_hasPassedBuddy = a3;
}

- (BOOL)isSystemAvailableForSyncing
{
  return self->_isSystemAvailableForSyncing;
}

- (void)setIsSystemAvailableForSyncing:(BOOL)a3
{
  self->_isSystemAvailableForSyncing = a3;
}

- (NSMutableSet)objectIDsToRetry
{
  return self->_objectIDsToRetry;
}

- (void)setObjectIDsToRetry:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToRetry, a3);
}

- (BOOL)hasRetryTimer
{
  return self->_hasRetryTimer;
}

- (void)setHasRetryTimer:(BOOL)a3
{
  self->_hasRetryTimer = a3;
}

- (NSTimer)retryTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)retryCountsByOperationType
{
  return self->_retryCountsByOperationType;
}

- (void)setRetryCountsByOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_retryCountsByOperationType, a3);
}

- (NSMutableDictionary)databaseScopeStringsNeedingRetryFetchChangesByAccountID
{
  return self->_databaseScopeStringsNeedingRetryFetchChangesByAccountID;
}

- (void)setDatabaseScopeStringsNeedingRetryFetchChangesByAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_databaseScopeStringsNeedingRetryFetchChangesByAccountID, a3);
}

- (BOOL)isDisabledInternal
{
  return self->_disabledInternal;
}

- (void)setDisabledInternal:(BOOL)a3
{
  self->_disabledInternal = a3;
}

- (BOOL)needsToProcessAllDirtyObjects
{
  return self->_needsToProcessAllDirtyObjects;
}

- (void)setNeedsToProcessAllDirtyObjects:(BOOL)a3
{
  self->_needsToProcessAllDirtyObjects = a3;
}

- (NSMutableSet)objectIDsToProcess
{
  return self->_objectIDsToProcess;
}

- (void)setObjectIDsToProcess:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToProcess, a3);
}

- (ICSelectorDelayer)processingSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setProcessingSelectorDelayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (ICSelectorDelayer)pollingSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPollingSelectorDelayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)didAddObservers
{
  return self->_didAddObservers;
}

- (void)setDidAddObservers:(BOOL)a3
{
  self->_didAddObservers = a3;
}

- (BOOL)isFetchingEnabled
{
  return self->_fetchingEnabled;
}

- (void)setFetchingEnabled:(BOOL)a3
{
  self->_fetchingEnabled = a3;
}

- (BOOL)syncDisabledByServer
{
  return self->_syncDisabledByServer;
}

- (void)setSyncDisabledByServer:(BOOL)a3
{
  self->_syncDisabledByServer = a3;
}

- (BOOL)uploadSuspended
{
  return self->_uploadSuspended;
}

- (void)setUploadSuspended:(BOOL)a3
{
  self->_uploadSuspended = a3;
}

- (BOOL)supportsCloudKitSyncing
{
  return self->_supportsCloudKitSyncing;
}

- (void)setSupportsCloudKitSyncing:(BOOL)a3
{
  self->_supportsCloudKitSyncing = a3;
}

- (BOOL)shouldUnregisterBuddy
{
  return self->_shouldUnregisterBuddy;
}

- (void)setShouldUnregisterBuddy:(BOOL)a3
{
  self->_shouldUnregisterBuddy = a3;
}

- (void)setContainersByAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_containersByAccountID, a3);
}

- (os_unfair_lock_s)containersByAccountIDLock
{
  return self->_containersByAccountIDLock;
}

- (void)setContainersByAccountIDLock:(os_unfair_lock_s)a3
{
  self->_containersByAccountIDLock = a3;
}

- (NSMutableDictionary)accountZoneIDsNeedingFetchChanges
{
  return self->_accountZoneIDsNeedingFetchChanges;
}

- (void)setAccountZoneIDsNeedingFetchChanges:(id)a3
{
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingFetchChanges, a3);
}

- (NSMutableDictionary)accountZoneIDsFetchingChanges
{
  return self->_accountZoneIDsFetchingChanges;
}

- (void)setAccountZoneIDsFetchingChanges:(id)a3
{
  objc_storeStrong((id *)&self->_accountZoneIDsFetchingChanges, a3);
}

- (NSMutableDictionary)accountZoneIDsNeedingToBeSaved
{
  return self->_accountZoneIDsNeedingToBeSaved;
}

- (void)setAccountZoneIDsNeedingToBeSaved:(id)a3
{
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingToBeSaved, a3);
}

- (NSDictionary)subscribedSubscriptionIDsByAccountID
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSubscribedSubscriptionIDsByAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSDate)subscribedSubscriptionIDsLastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSubscribedSubscriptionIDsLastModifiedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (BOOL)didCheckForLongLivedOperations
{
  return self->_didCheckForLongLivedOperations;
}

- (void)setDidCheckForLongLivedOperations:(BOOL)a3
{
  self->_didCheckForLongLivedOperations = a3;
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (NSString)apsTopic
{
  return self->_apsTopic;
}

- (void)setApsTopic:(id)a3
{
  objc_storeStrong((id *)&self->_apsTopic, a3);
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (_TtC7remindd37RDDebouncerWithCKDatabaseNotification)apsNotificationHandlingDebouncer
{
  return self->_apsNotificationHandlingDebouncer;
}

- (void)setApsNotificationHandlingDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_apsNotificationHandlingDebouncer, a3);
}

- (_TtC7remindd21RDDebouncerWithNumber)accountChangedNotificationHandlingDebouncer
{
  return self->_accountChangedNotificationHandlingDebouncer;
}

- (void)setAccountChangedNotificationHandlingDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangedNotificationHandlingDebouncer, a3);
}

- (BOOL)wasInternetReachable
{
  return self->_wasInternetReachable;
}

- (void)setWasInternetReachable:(BOOL)a3
{
  self->_wasInternetReachable = a3;
}

- (double)lastSyncSinceInternetReachable
{
  return self->_lastSyncSinceInternetReachable;
}

- (void)setLastSyncSinceInternetReachable:(double)a3
{
  self->_lastSyncSinceInternetReachable = a3;
}

- (DADBuddyStateObserver)buddyStateObserver
{
  return self->_buddyStateObserver;
}

- (void)setBuddyStateObserver:(id)a3
{
  objc_storeStrong((id *)&self->_buddyStateObserver, a3);
}

- (BOOL)pendingAccountInitializerCompleteOnLaunch
{
  return self->_pendingAccountInitializerCompleteOnLaunch;
}

- (void)setPendingAccountInitializerCompleteOnLaunch:(BOOL)a3
{
  self->_pendingAccountInitializerCompleteOnLaunch = a3;
}

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)accountInitializerDidCompleteOnLaunchObserver
{
  return self->_accountInitializerDidCompleteOnLaunchObserver;
}

- (void)setAccountInitializerDidCompleteOnLaunchObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountInitializerDidCompleteOnLaunchObserver, a3);
}

- (BOOL)needsToMergeLocalObjects
{
  return self->_needsToMergeLocalObjects;
}

- (void)setNeedsToMergeLocalObjects:(BOOL)a3
{
  self->_needsToMergeLocalObjects = a3;
}

- (BOOL)needsToUpdateCloudContextOnAccountsDidChange
{
  return self->_needsToUpdateCloudContextOnAccountsDidChange;
}

- (void)setNeedsToUpdateCloudContextOnAccountsDidChange:(BOOL)a3
{
  self->_needsToUpdateCloudContextOnAccountsDidChange = a3;
}

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)accountInitializerDidCompleteOnAccountsDidChangeObserver
{
  return self->_accountInitializerDidCompleteOnAccountsDidChangeObserver;
}

- (void)setAccountInitializerDidCompleteOnAccountsDidChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountInitializerDidCompleteOnAccountsDidChangeObserver, a3);
}

- (os_unfair_lock_s)accountInitializerDidCompleteOnAccountsDidChangeObserverLock
{
  return self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock;
}

- (void)setAccountInitializerDidCompleteOnAccountsDidChangeObserverLock:(os_unfair_lock_s)a3
{
  self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock = a3;
}

- (NSMutableDictionary)recognizedCloudObjectClasses
{
  return self->_recognizedCloudObjectClasses;
}

- (void)setRecognizedCloudObjectClasses:(id)a3
{
  objc_storeStrong((id *)&self->_recognizedCloudObjectClasses, a3);
}

- (RDAccountPersonIDSaltObserver)accountPersonIDSaltObserver
{
  return self->_accountPersonIDSaltObserver;
}

- (void)setAccountPersonIDSaltObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountPersonIDSaltObserver, a3);
}

- (NSNotificationCenter)unitTest_notificationCenter
{
  return self->_unitTest_notificationCenter;
}

- (void)setUnitTest_notificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_notificationCenter, a3);
}

- (ICCloudSchemaCatchUpSyncController)cloudSchemaCatchUpSyncController
{
  return self->_cloudSchemaCatchUpSyncController;
}

- (void)setCloudSchemaCatchUpSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncController, 0);
  objc_storeStrong((id *)&self->_unitTest_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountPersonIDSaltObserver, 0);
  objc_storeStrong((id *)&self->_recognizedCloudObjectClasses, 0);
  objc_storeStrong((id *)&self->_accountInitializerDidCompleteOnAccountsDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_accountInitializerDidCompleteOnLaunchObserver, 0);
  objc_storeStrong((id *)&self->_buddyStateObserver, 0);
  objc_storeStrong((id *)&self->_accountChangedNotificationHandlingDebouncer, 0);
  objc_storeStrong((id *)&self->_apsNotificationHandlingDebouncer, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsTopic, 0);
  objc_storeStrong((id *)&self->_subscribedSubscriptionIDsLastModifiedDate, 0);
  objc_storeStrong((id *)&self->_subscribedSubscriptionIDsByAccountID, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingToBeSaved, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsFetchingChanges, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingFetchChanges, 0);
  objc_storeStrong((id *)&self->_containersByAccountID, 0);
  objc_storeStrong((id *)&self->_pollingSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_processingSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_objectIDsToProcess, 0);
  objc_storeStrong((id *)&self->_databaseScopeStringsNeedingRetryFetchChangesByAccountID, 0);
  objc_storeStrong((id *)&self->_retryCountsByOperationType, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_objectIDsToRetry, 0);
  objc_storeStrong((id *)&self->_lastSyncMetrics, 0);
  objc_storeStrong((id *)&self->_appleAccountUtilities, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_icUserDefaults, 0);
  objc_destroyWeak((id *)&self->_cloudContextDelegate);
  objc_storeStrong((id *)&self->_storeController, 0);
}

+ (BOOL)conformsToRDICCloudContextCryptoStringProviding
{
  return 1;
}

+ (id)base64EncodedHMACStringFromString:(id)a3 usingSalt:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a4;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;

  String.base64EncodedHMACString(using:)(v9, v11, v5, v7);
  v13 = v12;
  sub_1000A71C8(v9, v11);
  swift_bridgeObjectRelease();
  if (v13)
  {
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

@end
