@implementation RDStoreController

- (id)inMemoryPrimaryActiveCKAccountREMObjectID
{
  os_unfair_lock_s *p_ivarLock;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000857E8;
  v12 = sub_1000857F8;
  v13 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = objc_claimAutoreleasedReturnValue(-[RDStoreController l_primaryActiveCloudKitAccountREMObjectID](self, "l_primaryActiveCloudKitAccountREMObjectID"));
  v5 = (void *)v9[5];
  v9[5] = v4;

  os_unfair_lock_unlock(p_ivarLock);
  v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (id)storeForAccountIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_ivarLock;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000857E8;
  v16 = sub_1000857F8;
  v17 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000164AC;
  v9[3] = &unk_1007D7D08;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  sub_1000164AC((uint64_t)v9);
  os_unfair_lock_unlock(p_ivarLock);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)newBackgroundContextWithAuthor:(id)a3 enableQueryGenerationToken:(BOOL)a4
{
  id v6;
  RDStoreControllerManagedObjectContext *v7;
  id v8;
  void *v9;
  RDStoreControllerManagedObjectContext *v10;
  _QWORD v12[4];
  RDStoreControllerManagedObjectContext *v13;
  RDStoreController *v14;
  id v15;
  BOOL v16;

  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000155D8;
  v12[3] = &unk_1007DA7D8;
  v7 = -[RDStoreControllerManagedObjectContext initWithConcurrencyType:]([RDStoreControllerManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  v13 = v7;
  v14 = self;
  v15 = v6;
  v16 = a4;
  v8 = v6;
  -[RDStoreControllerManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

- (id)newBackgroundContextWithAuthor:(id)a3
{
  return -[RDStoreController newBackgroundContextWithAuthor:enableQueryGenerationToken:](self, "newBackgroundContextWithAuthor:enableQueryGenerationToken:", a3, 1);
}

- (NSMergePolicy)mergePolicy
{
  return self->_mergePolicy;
}

- (NSMapTable)l_accountStoreMap
{
  return self->_l_accountStoreMap;
}

- (REMObjectID)l_primaryActiveCloudKitAccountREMObjectID
{
  return self->_l_primaryActiveCloudKitAccountREMObjectID;
}

+ (id)managedObjectModel
{
  if (qword_100852890 != -1)
    dispatch_once(&qword_100852890, &stru_1007DA600);
  return (id)qword_100852888;
}

- (RDStoreController)init
{
  return -[RDStoreController initWithIsolatedReminderDataContainerURL:](self, "initWithIsolatedReminderDataContainerURL:", 0);
}

- (RDStoreController)initWithIsolatedReminderDataContainerURL:(id)a3
{
  return -[RDStoreController initWithIsolatedReminderDataContainerURL:accountStoreManagementDelegate:appleAccountUitilities:](self, "initWithIsolatedReminderDataContainerURL:accountStoreManagementDelegate:appleAccountUitilities:", a3, 0, 0);
}

- (RDStoreController)initWithIsolatedReminderDataContainerURL:(id)a3 accountStoreManagementDelegate:(id)a4 appleAccountUitilities:(id)a5
{
  id v9;
  id v10;
  id v11;
  RDStoreController *v12;
  RDStoreController *v13;
  uint64_t v14;
  REMDaemonUserDefaults *daemonUserDefaults;
  REMAppleAccountUtilities *v16;
  REMAppleAccountUtilities *appleAccountUtilities;
  RDAttachmentFileManager *v18;
  RDAttachmentFileManager *attachmentFileManager;
  uint64_t v20;
  NSMergePolicy *mergePolicy;
  uint64_t v22;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  RDCoreSpotlightDelegateManager *v24;
  RDCoreSpotlightDelegateManager *coreSpotlightDelegateManager;
  NSMutableSet *v26;
  NSMutableSet *cloudKitNetworkActivityObservers;
  id *v28;
  RDCoreSpotlightDelegateManager *v29;
  void *v30;
  unsigned int v31;
  ICCloudContext *v32;
  id v33;
  void *v34;
  RDAccountPropertiesNotifier *v35;
  void *v36;
  void *v37;
  void **v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  id location;
  _QWORD v45[6];
  objc_super v46;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v46.receiver = self;
  v46.super_class = (Class)RDStoreController;
  v12 = -[RDStoreController init](&v46, "init");
  v13 = v12;
  if (v12)
  {
    v12->_ivarLock._os_unfair_lock_opaque = 0;
    v12->_isInitializing = 1;
    v14 = objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
    daemonUserDefaults = v13->_daemonUserDefaults;
    v13->_daemonUserDefaults = (REMDaemonUserDefaults *)v14;

    objc_storeWeak((id *)&v13->_accountStoreManagementDelegate, v10);
    if (v11)
      v16 = (REMAppleAccountUtilities *)v11;
    else
      v16 = (REMAppleAccountUtilities *)objc_claimAutoreleasedReturnValue(+[REMAppleAccountUtilities sharedInstance](REMAppleAccountUtilities, "sharedInstance"));
    appleAccountUtilities = v13->_appleAccountUtilities;
    v13->_appleAccountUtilities = v16;

    if (v9)
      objc_storeStrong((id *)&v13->_isolatedReminderDataContainerURL, a3);
    v18 = -[RDAttachmentFileManager initWithDocumentsURLProvider:]([RDAttachmentFileManager alloc], "initWithDocumentsURLProvider:", v13);
    attachmentFileManager = v13->_attachmentFileManager;
    v13->_attachmentFileManager = v18;

    *(_WORD *)&v13->_supportsLocalInternalAccount = 257;
    v20 = objc_claimAutoreleasedReturnValue(+[RDMergePolicy defaultMergePolicy](_TtC7remindd13RDMergePolicy, "defaultMergePolicy"));
    mergePolicy = v13->_mergePolicy;
    v13->_mergePolicy = (NSMergePolicy *)v20;

    v22 = objc_claimAutoreleasedReturnValue(-[RDStoreController _makePersistentStoreCoordinator](v13, "_makePersistentStoreCoordinator"));
    persistentStoreCoordinator = v13->_persistentStoreCoordinator;
    v13->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v22;

    v24 = -[RDCoreSpotlightDelegateManager initWithIsolated:coordinator:]([RDCoreSpotlightDelegateManager alloc], "initWithIsolated:coordinator:", -[RDStoreController isolated](v13, "isolated"), v13->_persistentStoreCoordinator);
    coreSpotlightDelegateManager = v13->_coreSpotlightDelegateManager;
    v13->_coreSpotlightDelegateManager = v24;

    v26 = objc_opt_new(NSMutableSet);
    cloudKitNetworkActivityObservers = v13->_cloudKitNetworkActivityObservers;
    v13->_cloudKitNetworkActivityObservers = v26;

    os_unfair_lock_lock(&v13->_ivarLock);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10007E500;
    v45[3] = &unk_1007D7C68;
    v28 = v13;
    v45[4] = v28;
    v45[5] = v10;
    sub_10007E500((uint64_t)v45);
    os_unfair_lock_unlock(&v13->_ivarLock);

    if (objc_msgSend(v28, "supportsCoreSpotlightIndexing"))
    {
      objc_initWeak(&location, v28);
      v29 = v13->_coreSpotlightDelegateManager;
      v39 = _NSConcreteStackBlock;
      v40 = 3221225472;
      v41 = sub_10007E628;
      v42 = &unk_1007DA628;
      objc_copyWeak(&v43, &location);
      -[RDCoreSpotlightDelegateManager validateIndexVersionWithCompletionHandler:](v29, "validateIndexVersionWithCompletionHandler:", &v39);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    if ((objc_msgSend(v28, "isolated", v39, v40, v41, v42) & 1) == 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICSyncSettings sharedSettings](ICSyncSettings, "sharedSettings"));
      v31 = objc_msgSend(v30, "hasOptions:", 16);

      if (v31)
      {
        v32 = -[ICCloudContext initWithStoreController:]([ICCloudContext alloc], "initWithStoreController:", v28);
        v33 = v28[3];
        v28[3] = v32;

        objc_msgSend(v28[3], "setCloudContextDelegate:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v34, "addObserver:selector:name:object:", v28, "cloudContextHasPendingOperationsDidChange:", CFSTR("ICCloudContextHasPendingOperationsDidChangeNotification"), v28[3]);

        v35 = objc_alloc_init(RDAccountPropertiesNotifier);
        objc_msgSend(v28, "setAccountPropertiesNotifier:", v35);

      }
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v36, "addObserver:selector:name:object:", v28, "managedObjectContextDidSave:", NSManagedObjectContextDidSaveObjectIDsNotification, v13->_persistentStoreCoordinator);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
    objc_msgSend(v37, "startNotifier");
    v13->_isInitializing = 0;

  }
  return v13;
}

- (BOOL)hasPassedBuddyAndSystemDataMigrator
{
  id v3;
  unsigned __int8 v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  if ((+[DADBuddyStateObserver hasPassedBuddy](DADBuddyStateObserver, "hasPassedBuddy") & 1) != 0)
  {
    if (-[RDStoreController isolated](self, "isolated"))
      return 1;
    v3 = objc_alloc_init((Class)REMDatabaseMigrationContext);
    v4 = objc_msgSend(v3, "isDatabaseMigrated");

    if ((v4 & 1) != 0)
      return 1;
    v6 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v7 = "RDStoreController: System data migration has not finished";
      v8 = (uint8_t *)&v9;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v7 = "RDStoreController: We are still in buddy";
      v8 = (uint8_t *)&v10;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  RDStoreController *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL"));
    *(_DWORD *)buf = 134218498;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Deallocating RDStoreController {pointer: %p, isolatedReminderDataContainerURL: %@, defaultReminderDataContainerURL: %@}", buf, 0x20u);

  }
  v6.receiver = self;
  v6.super_class = (Class)RDStoreController;
  -[RDStoreController dealloc](&v6, "dealloc");
}

- (BOOL)isolated
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
  v3 = v2 != 0;

  return v3;
}

- (id)databaseDirectoryURLWithContainerURL:(id)a3
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Stores/"));
}

- (id)databaseBackupDirectoryURLWithContainerURL:(id)a3
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Stores-Backup/"));
}

- (id)databaseStagedMigrationDirectoryURLWithContainerURL:(id)a3
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Stores-StagedMigration/"));
}

+ (id)storeFileNameWithStoreName:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@.sqlite"), CFSTR("Data-"), a3);
}

+ (BOOL)isDummyStoreURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "storeFileNameWithStoreName:", CFSTR("local")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v5);
  return (char)v4;
}

- (id)storeURLWithName:(id)a3 withContainerURL:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseDirectoryURLWithContainerURL:](self, "databaseDirectoryURLWithContainerURL:", a4));
  v8 = objc_msgSend((id)objc_opt_class(self), "storeFileNameWithStoreName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", v9));
  return v10;
}

- (id)storeBackupURLWithFileName:(id)a3 withContainerURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseBackupDirectoryURLWithContainerURL:](self, "databaseBackupDirectoryURLWithContainerURL:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", v6));

  return v8;
}

- (id)invalidStoreBackupURLWithFileName:(id)a3 withContainerURL:(id)a4
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
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter rem_formatterWithTimeZone:](NSISO8601DateFormatter, "rem_formatterWithTimeZone:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate rem_now](NSDate, "rem_now"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLHostAllowedCharacterSet](NSCharacterSet, "URLHostAllowedCharacterSet"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingPathExtension"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@--%@.sqlite"), v14, v13));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseBackupDirectoryURLWithContainerURL:](self, "databaseBackupDirectoryURLWithContainerURL:", v6));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:", v15));

  return v17;
}

- (id)_reminderDataContainerURLForAccountIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  objc_class *v16;
  NSString *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
  if (v6
    && (v7 = (void *)v6,
        v8 = -[RDStoreController unittest_isTestingDataSeparation](self, "unittest_isTestingDataSeparation"),
        v7,
        (v8 & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController appleAccountUtilities](self, "appleAccountUtilities"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reminderDataContainerURLForAccountIdentifier:", v5));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = 0;
    v12 = objc_msgSend(v11, "rem_createDirectoryIfNecessaryAtURL:error:", v10, &v23);
    v13 = v23;
    if ((v12 & 1) == 0)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class(self);
        v17 = NSStringFromClass(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v18, v20));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
        *(_DWORD *)buf = 138544130;
        v25 = v21;
        v26 = 2114;
        v27 = v5;
        v28 = 2112;
        v29 = v10;
        v30 = 2112;
        v31 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {accountIdentifier: %{public}@, reminderDataContainerURL: %@, error: %@}", buf, 0x2Au);

      }
    }

  }
  return v10;
}

- (id)_makePersistentStoreCoordinator
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend((id)objc_opt_class(self), "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", v3);

  return v4;
}

- (BOOL)l_loadAccountStoresFromDiskDeletingFilesMarkedDeleted:(BOOL)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  BOOL v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id *v38;
  id v39;
  id v40;
  __int16 v41;
  unsigned __int8 v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;

  v6 = a4;
  v7 = a3;
  v9 = objc_autoreleasePoolPush();
  v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = +[RDPaths isDataSeparationEnabled](RDPaths, "isDataSeparationEnabled");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] Data-separation enabled: %d", buf, 8u);
  }

  -[RDStoreController l_loadPPTStoreStatus](self, "l_loadPPTStoreStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
  objc_msgSend(v11, "removeAllObjects");

  -[RDStoreController l_invalidateAccountStorageCaches:](self, "l_invalidateAccountStorageCaches:", CFSTR("loadAccountStoresFromDisk"));
  v42 = 0;
  v41 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _discoverReminderDataContainerURLs](self, "_discoverReminderDataContainerURLs"));
  v40 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_discoverAccountStoreURLsFromReminderDataContainerURLs:deletingFilesMarkedDeleted:storesDiscoveryStatesRef:error:](self, "l_discoverAccountStoreURLsFromReminderDataContainerURLs:deletingFilesMarkedDeleted:storesDiscoveryStatesRef:error:", v12, v7, &v41, &v40));
  v14 = v40;
  -[RDStoreController setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:](self, "setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:", v41);
  -[RDStoreController setContainsLargeDatabases:](self, "setContainsLargeDatabases:", HIBYTE(v41));
  -[RDStoreController setContainsOnlySmallDatabases:](self, "setContainsOnlySmallDatabases:", v42);
  if (v13)
  {
    v38 = a5;
    v15 = v9;
    v16 = objc_claimAutoreleasedReturnValue(-[RDStoreController _relocateMisplacedDataSeparationStoresAndFilesWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:](self, "_relocateMisplacedDataSeparationStoresAndFilesWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:", v13, v7));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v16, "allKeys"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _performDataSeparationMigrationIfNeededWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:](self, "_performDataSeparationMigrationIfNeededWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:", v16, v7));
    if (objc_msgSend(v19, "count"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allKeys"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20));
      objc_msgSend(v18, "unionSet:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController daemonUserDefaults](self, "daemonUserDefaults"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v22, "setLastDataSeparationMigrationDate:", v23);

    }
    v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v19, "count");
      v26 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134218240;
      v44 = v25;
      v45 = 2048;
      v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] Will load discovered stores from disk {migratedStoresFromLegacyLocation.count: %ld, totalStores.count: %ld}", buf, 0x16u);
    }

    v39 = v14;
    v27 = -[RDStoreController l_loadAccountStoresFromDiskAndValidateInBatchesWithStoreURLs:shouldDeleteInvalidStoresImmediately:error:](self, "l_loadAccountStoresFromDiskAndValidateInBatchesWithStoreURLs:shouldDeleteInvalidStoresImmediately:error:", v18, v6, &v39);
    v28 = v39;

    v14 = v28;
    v9 = v15;
    a5 = v38;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_100683BDC();
    v27 = 0;
  }

  -[RDStoreController l_loadDummyStoreIfNeeded](self, "l_loadDummyStoreIfNeeded");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "persistentStores"));
  v31 = objc_msgSend(v30, "count");

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
  v33 = objc_msgSend(v32, "count");

  if (v31 != v33)
  {
    v34 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_100683B70();

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "persistentStores"));
  -[RDStoreController l_performManualStoreMigrations:](self, "l_performManualStoreMigrations:", v36);

  objc_autoreleasePoolPop(v9);
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v27;
}

- (void)l_loadPPTStoreStatus
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  objc_class *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _dataSeparationIncompatible_defaultReminderDataContainerURL](self, "_dataSeparationIncompatible_defaultReminderDataContainerURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = 0;
  v6 = objc_msgSend(v5, "rem_createDirectoryIfNecessaryAtURL:error:", v4, &v22);
  v7 = v22;
  if ((v6 & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class(self);
      v16 = NSStringFromClass(v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v17 = NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v21, v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
      *(_DWORD *)buf = 138543874;
      v24 = v19;
      v25 = 2112;
      v26 = v4;
      v27 = 2112;
      v28 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {defaultReminderDataContainerURL: %@, error: %@}", buf, 0x20u);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths pptSentinelURLInContainerURL:](RDPaths, "pptSentinelURLInContainerURL:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((_DWORD)v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v24 = v9;
      v14 = "[loadPPTStoreStatus] Found ppt sentinel. Marking as PPTStore {pptSentinelURL: %{private}@}";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    }
  }
  else
  {
    if (!-[RDStoreController isPPTStore](self, "isPPTStore"))
    {
      v12 = 0;
      goto LABEL_14;
    }
    v13 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v24 = v9;
      v14 = "[loadPPTStoreStatus] Store was marked as PPT but sentinel is gone. Marking a non-PPTStore {pptSentinelURL: %{private}@}";
      goto LABEL_11;
    }
  }

LABEL_14:
  -[RDStoreController setIsPPTStore:](self, "setIsPPTStore:", v12);

}

- (id)_discoverReminderDataContainerURLs
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];

  v3 = objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
  if (v3
    && (v4 = (void *)v3,
        v5 = -[RDStoreController unittest_isTestingDataSeparation](self, "unittest_isTestingDataSeparation"),
        v4,
        (v5 & 1) == 0))
  {
    v19 = objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v19));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL"));
    objc_msgSend(v6, "addObject:", v7);

    if (-[RDStoreController hasPassedBuddyAndSystemDataMigrator](self, "hasPassedBuddyAndSystemDataMigrator"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController appleAccountUtilities](self, "appleAccountUtilities"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts"));

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v9;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v23;
        *(_QWORD *)&v12 = 138543618;
        v21 = v12;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v15), "identifier", v21, (_QWORD)v22));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _reminderDataContainerURLForAccountIdentifier:](self, "_reminderDataContainerURLForAccountIdentifier:", v16));
            v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v27 = v16;
              v28 = 2112;
              v29 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[discoverApplicationDocumentURLs] Queried application documents URL for account {accountIdentifier: %{public}@, reminderDataContainerURL: %@}", buf, 0x16u);
            }

            objc_msgSend(v6, "addObject:", v17);
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v13);
      }
      v19 = v10;
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(+[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL"));
      objc_msgSend(v6, "addObject:", v19);
      v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100683C3C();
    }

  }
  return v6;
}

- (id)l_discoverAccountStoreURLsFromReminderDataContainerURLs:(id)a3 deletingFilesMarkedDeleted:(BOOL)a4 storesDiscoveryStatesRef:(id *)a5 error:(id *)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  objc_class *v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  id v39;
  $EB925890EBEBD6850280D1FB85A9BD43 *v40;
  _BOOL4 v41;
  id v42;
  unsigned __int8 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];

  v41 = a4;
  v8 = a3;
  if (a5)
  {
    a5->var2 = 1;
    *(_WORD *)&a5->var0 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v39 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromApplicationDocumentsURLs] Scanning into {appDocumentsURLs: %{public}@}", buf, 0xCu);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v46;
    v40 = a5;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseDirectoryURLWithContainerURL:](self, "databaseDirectoryURLWithContainerURL:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v14)));
        v44 = 0;
        v16 = objc_msgSend(v9, "rem_createDirectoryIfNecessaryAtURL:error:", v15, &v44);
        v17 = v44;
        if ((v16 & 1) == 0)
        {
          v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v24 = (objc_class *)objc_opt_class(self);
            v25 = NSStringFromClass(v24);
            v36 = (void *)objc_claimAutoreleasedReturnValue(v25);
            v26 = NSStringFromSelector(a2);
            v34 = (void *)objc_claimAutoreleasedReturnValue(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v36, v34));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
            *(_DWORD *)buf = 138543874;
            v50 = v27;
            v51 = 2112;
            v52 = v15;
            v53 = 2112;
            v54 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {databaseDirectoryURL: %@, error: %@}", buf, 0x20u);

            a5 = v40;
          }

        }
        v43 = 0;
        if (objc_msgSend(v9, "rem_fileExistsAtURL:isDirectory:", v15, &v43))
          v19 = v43 == 0;
        else
          v19 = 1;
        if (v19)
        {
          v20 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
            *(_DWORD *)buf = 138412546;
            v50 = v29;
            v51 = 1024;
            LODWORD(v52) = v43;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromApplicationDocumentsURLs] Given appDocumentsURL is not an existing directory {databaseDirectoryURL: %@, isDirectory: %d}", buf, 0x12u);

            a5 = v40;
          }

        }
        v42 = 0;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_discoverAccountStoreURLsFromDatabaseDirectoryURL:deletingFilesMarkedDeleted:storesDiscoveryStatesRef:error:](self, "l_discoverAccountStoreURLsFromDatabaseDirectoryURL:deletingFilesMarkedDeleted:storesDiscoveryStatesRef:error:", v15, v41, a5, &v42));
        v22 = v42;
        if (v22)
        {
          v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
            *(_DWORD *)buf = 138412546;
            v50 = v35;
            v51 = 2114;
            v52 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromApplicationDocumentsURLs] Error getting store URLs from {databaseDirectoryURL: %@, error: %{public}@}", buf, 0x16u);

          }
          objc_msgSend(v38, "addObject:", v22);
          a5 = v40;
        }
        if (v21)
          objc_msgSend(v39, "addEntriesFromDictionary:", v21);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v12);
  }

  if (a6)
  {
    v30 = objc_msgSend(v38, "count");
    if (v30)
      v30 = (id)objc_claimAutoreleasedReturnValue(+[REMError errorFromErrors:](REMError, "errorFromErrors:", v38));
    *a6 = v30;
  }

  return v39;
}

- (id)l_discoverAccountStoreURLsFromDatabaseDirectoryURL:(id)a3 deletingFilesMarkedDeleted:(BOOL)a4 storesDiscoveryStatesRef:(id *)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v8;
  void *v9;
  NSString *(__cdecl **v10)(SEL);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  id v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  __CFString *v29;
  __CFString *v30;
  unsigned int v31;
  NSObject *v32;
  __CFString *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  const __CFString *v42;
  NSObject *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  char v58;
  NSObject *v59;
  __CFString *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  NSObject *v66;
  const __CFString *v67;
  void *v68;
  __CFString *v69;
  void *v70;
  id v71;
  unsigned int v72;
  id v73;
  id v74;
  NSObject *v75;
  NSObject *v76;
  id v77;
  const __CFString *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  id v82;
  const __CFString *v83;
  id v84;
  id v86;
  const __CFString *v87;
  __int128 v88;
  _BOOL4 v89;
  void *v90;
  id v92;
  void *v93;
  void *v94;
  id v96;
  NSObject *v97;
  unsigned int v98;
  void *v99;
  RDStoreController *v100;
  void *v101;
  void *v102;
  void *v103;
  unsigned int v104;
  void *v105;
  const __CFString *v106;
  const __CFString *v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  uint8_t buf[4];
  unint64_t v121;
  __int16 v122;
  const __CFString *v123;
  __int16 v124;
  _BYTE v125[10];
  void *v126;
  _BYTE v127[128];
  NSURLResourceKey v128;

  v6 = a4;
  v8 = a3;
  v100 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController daemonUserDefaults](self, "daemonUserDefaults"));
  v98 = objc_msgSend(v9, "debugSimulateSqliteFull");

  v10 = &NSStringFromSelector_ptr;
  v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100683D9C(v8, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v128 = NSURLFileSizeKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v128, 1));
  v119 = 0;
  v93 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v13, 1, &v119));
  v15 = (__CFString *)v119;

  v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_100683D08(v93, v14);

  v90 = v14;
  if (v14)
  {
    v89 = v6;
    v17 = objc_msgSend((id)objc_opt_class(v100), "storeFileNameWithStoreName:", CFSTR("local"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v92 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v19 = objc_msgSend((id)objc_opt_class(v100), "persistentStoreOptions");
    v99 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v20 = v14;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
    if (!v21)
      goto LABEL_74;
    v23 = v21;
    v109 = *(_QWORD *)v116;
    *(_QWORD *)&v22 = 134218754;
    v88 = v22;
    v96 = v20;
    v97 = v18;
    while (1)
    {
      v24 = 0;
      v108 = v23;
      do
      {
        if (*(_QWORD *)v116 != v109)
          objc_enumerationMutation(v20);
        v25 = *(__CFString **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString pathExtension](v25, "pathExtension", v88));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lowercaseString"));
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("sqlite"));

        if (v28)
        {
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v25, "lastPathComponent"));
          v30 = v29;
          if (v29 && (-[__CFString hasPrefix:](v29, "hasPrefix:", CFSTR("Data-")) & 1) != 0)
          {
            if ((-[__CFString isEqualToString:](v30, "isEqualToString:", v18) & 1) == 0)
            {
              v113 = 0;
              v114 = 0;
              v31 = -[__CFString getResourceValue:forKey:error:](v25, "getResourceValue:forKey:error:", &v114, NSURLFileSizeKey, &v113);
              v32 = v114;
              v33 = (__CFString *)v113;

              if (!v31 || !v32)
              {
                v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[282], "container"));
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v121 = (unint64_t)v30;
                  v122 = 2114;
                  v123 = v33;
                  _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to get file size {fileName: %{public}@, error: %{public}@}", buf, 0x16u);
                }

              }
              v112 = 0;
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:URL:options:error:](NSPersistentStoreCoordinator, "metadataForPersistentStoreOfType:URL:options:error:", NSSQLiteStoreType, v25, v99, &v112));
              v36 = v112;
              if (v98)
              {
                v37 = v35;
                v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 13));
                v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v38, NSSQLiteErrorDomain));

                v40 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 134060, v39);
                v10 = &NSStringFromSelector_ptr;
                v36 = v40;
                v35 = v37;
              }
              if (objc_msgSend(v36, "rem_isDiskFullSQLError"))
              {
                if (a5)
                  a5->var0 = 1;
                v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[282], "container"));
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v121 = (unint64_t)v30;
                  v122 = 2114;
                  v123 = v33;
                  _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to fetch store metadata for sqlite file due to disk full {fileName: %{public}@, error: %{public}@}", buf, 0x16u);
                }

                v10 = &NSStringFromSelector_ptr;
              }
              v42 = (const __CFString *)v36;

              if (!v35)
              {
                v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[282], "container"));
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v121 = (unint64_t)v30;
                  v122 = 2114;
                  v123 = v42;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to fetch store metadata for sqlite file {fileName: %{public}@, error: %{public}@}", buf, 0x16u);
                }

              }
              v106 = v42;
              v44 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("RDStoreControllerAccountIdentifier")));
              v45 = v35;
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", NSStoreModelVersionHashesKey));

              v47 = objc_opt_class(NSNumber);
              v105 = v45;
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("RDMarkedForDeletion")));
              v49 = REMDynamicCast(v47, v48);
              v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
              v51 = objc_msgSend(v50, "BOOLValue");

              v107 = v44;
              if (-[RDStoreController supportsLocalInternalAccount](v100, "supportsLocalInternalAccount"))
              {
                v104 = 0;
              }
              else
              {
                v52 = (void *)objc_claimAutoreleasedReturnValue(+[REMAccount localInternalAccountID](REMAccount, "localInternalAccountID"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "uuid"));
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "UUIDString"));
                v104 = -[__CFString isEqualToString:](v44, "isEqualToString:", v54);

              }
              v55 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URLByResolvingSymlinksInPath](v25, "URLByResolvingSymlinksInPath"));
              v10 = &NSStringFromSelector_ptr;
              v56 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                v101 = v55;
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "absoluteString"));
                *(_DWORD *)buf = 138413314;
                v121 = (unint64_t)v57;
                v122 = 2114;
                v123 = v107;
                v124 = 1024;
                *(_DWORD *)v125 = v46 != 0;
                *(_WORD *)&v125[4] = 1024;
                *(_DWORD *)&v125[6] = v51;
                LOWORD(v126) = 1024;
                *(_DWORD *)((char *)&v126 + 2) = v104 ^ 1;
                v10 = &NSStringFromSelector_ptr;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Considering sqlite store on disk... {storeURL: %@, accountIdentifier: %{public}@, initialized: %d, markedAsDeleted: %d, supported: %d}", buf, 0x28u);

                v55 = v101;
              }

              if (v46)
                v58 = 1;
              else
                v58 = v51;
              if ((v58 & 1) != 0)
              {
                v18 = v97;
                v15 = (__CFString *)v106;
                if (v51)
                {
                  objc_msgSend(v94, "addObject:", v55);
                  v20 = v96;
                  goto LABEL_58;
                }
                if (v104)
                {
                  v62 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                  v20 = v96;
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                  {
                    v102 = v55;
                    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "absoluteString"));
                    *(_DWORD *)buf = 138543874;
                    v121 = (unint64_t)v25;
                    v122 = 2114;
                    v123 = v107;
                    v124 = 2112;
                    *(_QWORD *)v125 = v63;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Unsupported storeURL. DELETING {store: %{public}@, accountIdentifier: %{public}@, storeURL: %@}", buf, 0x20u);

                    v55 = v102;
                  }

                  objc_msgSend(v94, "addObject:", v55);
LABEL_58:
                  v60 = (__CFString *)v107;
                }
                else
                {
                  v64 = (unint64_t)-[NSObject unsignedIntegerValue](v32, "unsignedIntegerValue");
                  v65 = v64;
                  if (a5 && v64 >= 0xA00000)
                    a5->var2 = 0;
                  v20 = v96;
                  if (v64 >> 21 >= 0x19)
                  {
                    if (a5)
                      a5->var1 = 1;
                    v66 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                    {
                      v103 = v55;
                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "absoluteString"));
                      *(_DWORD *)buf = v88;
                      v121 = v65;
                      v122 = 2114;
                      v123 = v25;
                      v124 = 2114;
                      *(_QWORD *)v125 = v107;
                      *(_WORD *)&v125[8] = 2112;
                      v126 = v70;
                      _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] WARNING that we're loading a large database exceeding 50MB, large database is suboptimal in every way {fileSize: %lu, store: %{public}@, accountIdentifier: %{public}@, storeURL: %@}", buf, 0x2Au);

                      v55 = v103;
                    }

                    v10 = &NSStringFromSelector_ptr;
                  }
                  v60 = (__CFString *)v107;
                  if (v107)
                    v67 = v107;
                  else
                    v67 = CFSTR("NullMetadataAccountIdentifier");
                  objc_msgSend(v92, "setObject:forKey:", v67, v55);
                }
              }
              else
              {
                v59 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                v20 = v96;
                v18 = v97;
                v15 = (__CFString *)v106;
                if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
                {
                  v68 = v55;
                  v69 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "absoluteString"));
                  *(_DWORD *)buf = 138543618;
                  v121 = (unint64_t)v30;
                  v122 = 2112;
                  v123 = v69;
                  _os_log_fault_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "[discoverAccountStoreURLsFromURL] The store sqlite file is neither initialized or marked as deleted -- probably corrupted. Will delete the file if <= 4096 bytes (i.e. empty) {fileName: %{public}@, storeURL: %@}", buf, 0x16u);

                  v55 = v68;
                }

                v60 = (__CFString *)v107;
                if (v32 && (unint64_t)-[NSObject unsignedIntegerValue](v32, "unsignedIntegerValue") <= 0x1000)
                  objc_msgSend(v94, "addObject:", v55);
              }

LABEL_36:
            }

            v23 = v108;
            goto LABEL_38;
          }
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[282], "container"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "absoluteString"));
            *(_DWORD *)buf = 138412546;
            v121 = (unint64_t)v61;
            v122 = 2114;
            v123 = v30;
            _os_log_fault_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "[discoverAccountStoreURLsFromURL] Found sqlite file that doesn't have the prefix RDPathComponentStoreFilePrefix {databaseDirectoryURL: %@, fileName: %{public}@}", buf, 0x16u);

          }
          goto LABEL_36;
        }
LABEL_38:
        v24 = (char *)v24 + 1;
      }
      while (v23 != v24);
      v71 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
      v23 = v71;
      if (!v71)
      {
LABEL_74:

        if (v89 && objc_msgSend(v94, "count"))
        {
          v110 = 0;
          v111 = 0;
          v72 = -[RDStoreController _removeFilesOfStoresAtURLs:outRemovedFileURLs:error:](v100, "_removeFilesOfStoresAtURLs:outRemovedFileURLs:error:", v94, &v111, &v110);
          v73 = v111;
          v74 = v110;
          v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[282], "container"));
          v76 = v75;
          if (v72)
          {
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              v77 = objc_msgSend(v94, "count");
              v78 = (const __CFString *)objc_msgSend(v73, "count");
              *(_DWORD *)buf = 134218240;
              v121 = (unint64_t)v77;
              v122 = 2048;
              v123 = v78;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Deleted store files marked for deletion in previous launches {removed.stores.count: %ld, removed.files.count: %ld}", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            v86 = objc_msgSend(v94, "count");
            v87 = (const __CFString *)objc_msgSend(v73, "count");
            *(_DWORD *)buf = 134218498;
            v121 = (unint64_t)v86;
            v122 = 2048;
            v123 = v87;
            v124 = 2114;
            *(_QWORD *)v125 = v74;
            _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to delete (some) store files marked for deletion in previous launches {storesToRemove.count: %ld, removed.files.count: %ld, error: %{public}@}", buf, 0x20u);
          }

          v80 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController accountStoreManagementDelegate](v100, "accountStoreManagementDelegate"));
          objc_msgSend(v80, "didRemoveStoreFilesOnInitWithURLs:", v73);

        }
        v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[282], "container"));
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v82 = objc_msgSend(v20, "count");
          v83 = (const __CFString *)objc_msgSend(v92, "count");
          v84 = objc_msgSend(v94, "count");
          *(_DWORD *)buf = 134218496;
          v121 = (unint64_t)v82;
          v122 = 2048;
          v123 = v83;
          v124 = 2048;
          *(_QWORD *)v125 = v84;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Finished discovering account identifiers on disk {file.count: %ld, storeURLs.count: %ld, deletedStores.count: %ld}", buf, 0x20u);
        }

        v79 = v93;
        goto LABEL_88;
      }
    }
  }
  v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  v79 = v93;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    sub_100683C9C();
  v92 = 0;
LABEL_88:

  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return v92;
}

- (id)_relocateMisplacedDataSeparationStoresAndFilesWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  if (-[RDStoreController hasPassedBuddyAndSystemDataMigrator](self, "hasPassedBuddyAndSystemDataMigrator")
    && objc_msgSend(v6, "count"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RDStoreController _relocateMisplacedDataSeparationStoresWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:](self, "_relocateMisplacedDataSeparationStoresWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:", v6, v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
    objc_msgSend(v9, "minusSet:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectsForKeys:notFoundMarker:", v12, CFSTR("NotFoundInStoreURLsMapAccountIdentifier")));

    -[RDStoreController _relocateMisplacedDataSeparationAccountAttachmentFilesWithRelocatedAccountIdentifiers:](self, "_relocateMisplacedDataSeparationAccountAttachmentFilesWithRelocatedAccountIdentifiers:", v13);
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (id)_relocateMisplacedDataSeparationStoresWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  unsigned int v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  NSObject *v47;
  __int128 v48;
  _BOOL4 v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  void *v53;
  NSObject *v54;
  os_log_t v55;
  unsigned int v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *log;
  void *v64;
  uint64_t v65;
  RDStoreController *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  NSObject *v79;
  __int16 v80;
  os_log_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  NSObject *v85;
  _BYTE v86[128];

  v49 = a4;
  v5 = a3;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v66 = self;
  v54 = objc_claimAutoreleasedReturnValue(-[RDStoreController _reminderDataContainerURLForAccountIdentifier:](self, "_reminderDataContainerURLForAccountIdentifier:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v54, "path"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByStandardizingPath"));

  v52 = objc_msgSend(v5, "mutableCopy");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v73;
    *(_QWORD *)&v9 = 138544386;
    v48 = v9;
    v65 = *(_QWORD *)v73;
    do
    {
      v12 = 0;
      v67 = v10;
      do
      {
        if (*(_QWORD *)v73 != v11)
          objc_enumerationMutation(v7);
        v13 = *(NSObject **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v12);
        v14 = objc_autoreleasePoolPush();
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v13, "path"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByStandardizingPath"));

        v17 = objc_claimAutoreleasedReturnValue(-[NSObject lastPathComponent](v13, "lastPathComponent"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v13));
        if (-[NSObject length](v17, "length")
          && objc_msgSend(v16, "length")
          && objc_msgSend(v18, "length")
          && !objc_msgSend(v18, "isEqualToString:", CFSTR("NullMetadataAccountIdentifier")))
        {
          v20 = v7;
          v19 = objc_claimAutoreleasedReturnValue(-[RDStoreController _reminderDataContainerURLForAccountIdentifier:](v66, "_reminderDataContainerURLForAccountIdentifier:", v18));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByStandardizingPath"));

          v68 = v22;
          if (objc_msgSend(v22, "length") && objc_msgSend(v64, "length"))
          {
            v11 = v65;
            v7 = v20;
            v10 = v67;
            if ((objc_msgSend(v16, "hasPrefix:", v68) & 1) == 0
              && objc_msgSend(v16, "hasPrefix:", v64))
            {
              v62 = v13;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseDirectoryURLWithContainerURL:](v66, "databaseDirectoryURLWithContainerURL:", v19));
              v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLByAppendingPathComponent:", v17));

              v25 = (void *)v24;
              if (objc_msgSend(v61, "rem_fileExistsAtURL:", v24))
              {
                v26 = v62;
                log = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                {
                  v55 = (os_log_t)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v62, "absoluteString"));
                  v59 = v25;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absoluteString"));
                  *(_DWORD *)buf = 138544130;
                  v77 = v18;
                  v78 = 2114;
                  v79 = v17;
                  v80 = 2112;
                  v81 = v55;
                  v82 = 2112;
                  v83 = v27;
                  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] There's already a store at the persona container with the same name, skipping this mis-located store at the default container {accountIdentifier: %{public}@, basename: %{public}@, misLocatedStoreURL: %@, relocateToStoreURL: %@}", buf, 0x2Au);

                  v25 = v59;
                  v26 = v62;

                }
              }
              else
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v62, "path"));
                v60 = v25;
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
                v71 = 0;
                v56 = +[RDSQLiteDBUtils copySQLiteFileAtPath:toPath:timeout:error:](RDSQLiteDBUtils, "copySQLiteFileAtPath:toPath:timeout:error:", v28, v29, &v71, 1.0);
                log = v71;

                v30 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                v31 = v30;
                v26 = v62;
                if (!v56 || log)
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v51 = objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v62, "absoluteString"));
                    v58 = v31;
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "absoluteString"));
                    *(_DWORD *)buf = v48;
                    v77 = v18;
                    v78 = 2114;
                    v79 = v17;
                    v80 = 2112;
                    v81 = v51;
                    v82 = 2112;
                    v83 = v33;
                    v84 = 2114;
                    v85 = log;
                    _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Failed to clone store located at default container to its correct container path {accountIdentifier: %{public}@, basename: %{public}@, misLocatedStoreURL: %@, relocateToStoreURL: %@, error: %{public}@}", buf, 0x34u);

                    v31 = v58;
                  }

                  v25 = v60;
                }
                else
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    v50 = objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v62, "absoluteString"));
                    v57 = v31;
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "absoluteString"));
                    *(_DWORD *)buf = 138544130;
                    v77 = v18;
                    v78 = 2114;
                    v79 = v17;
                    v80 = 2112;
                    v81 = v50;
                    v82 = 2112;
                    v83 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[relocateMisplacedStores] Successfully cloned store located at default container to its correct container path {accountIdentifier: %{public}@, basename: %{public}@, misLocatedStoreURL: %@, relocateToStoreURL: %@}", buf, 0x2Au);

                    v31 = v57;
                  }

                  objc_msgSend(v53, "addObject:", v62);
                  objc_msgSend(v52, "removeObjectForKey:", v62);
                  v25 = v60;
                  objc_msgSend(v52, "setObject:forKey:", v18, v60);
                }
              }

              v11 = v65;
              goto LABEL_24;
            }
          }
          else
          {
            v26 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container", v48));
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v77 = v18;
              v78 = 2112;
              v79 = v19;
              v80 = 2112;
              v81 = v54;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Unexpectedly nil container URL(s) path(s) {accountIdentifier: %{public}@, reminderDataContainerURL: %@, defaultReminderDataContainerURL: %@}", buf, 0x20u);
            }
            v11 = v65;
            v7 = v20;
            v10 = v67;
LABEL_24:

          }
          goto LABEL_12;
        }
        v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container", (_QWORD)v48));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v77 = v18;
          v78 = 2114;
          v79 = v17;
          v80 = 2112;
          v81 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Unexpectedly nil store basename/storeURLPath/accountIdentifier {accountIdentifier: %{public}@, basename: %{public}@, storeURL: %@}", buf, 0x20u);
        }
LABEL_12:

        objc_autoreleasePoolPop(v14);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
      v10 = v34;
    }
    while (v34);
  }

  if (v49 && objc_msgSend(v53, "count"))
  {
    v69 = 0;
    v70 = 0;
    v35 = -[RDStoreController _removeFilesOfStoresAtURLs:outRemovedFileURLs:error:](v66, "_removeFilesOfStoresAtURLs:outRemovedFileURLs:error:", v53, &v70, &v69);
    v36 = v70;
    v37 = v69;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allObjects"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForKey:", CFSTR("lastPathComponent")));

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "sortedArrayUsingSelector:", "caseInsensitiveCompare:"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("!(SELF ENDSWITH[c] 'shm') && !(SELF ENDSWITH[c] 'wal')")));
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "filteredArrayUsingPredicate:", v41));

    v43 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v44 = v43;
    if (v35)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_msgSend(v36, "count");
        *(_DWORD *)buf = 134218242;
        v77 = v45;
        v78 = 2112;
        v79 = v42;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[relocateMisplacedStores] Deleted store files and journals of mis-located stores {total: %ld, removeStoreNames: %@}", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(v36, "count");
      *(_DWORD *)buf = 138543874;
      v77 = v37;
      v78 = 2048;
      v79 = v47;
      v80 = 2112;
      v81 = v42;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Failed to delete (some) mis-located store files {error: %{public}@, totalRemoved: %ld, removedFileNames: %@}", buf, 0x20u);
    }

  }
  return v52;
}

- (void)_relocateMisplacedDataSeparationAccountAttachmentFilesWithRelocatedAccountIdentifiers:(id)a3
{
  id v5;
  RDAttachmentFileManager *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  _RDDefaultPostDataSeparationAttachmentFileManagerDocumentsURLProvider *v16;

  v5 = a3;
  v16 = objc_opt_new(_RDDefaultPostDataSeparationAttachmentFileManagerDocumentsURLProvider);
  v6 = -[RDAttachmentFileManager initWithDocumentsURLProvider:]([RDAttachmentFileManager alloc], "initWithDocumentsURLProvider:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("NullMetadataAccountIdentifier"), CFSTR("NotFoundInStoreURLsMapAccountIdentifier"), 0));
  objc_msgSend(v8, "minusSet:", v9);

  v10 = (objc_class *)objc_opt_class(self);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v12, v14));
  -[RDStoreController _moveAttachmentFilesFromAttachmentFileManager:toAttachmentFileManager:affectedAccountIdentifiers:logPrefix:](self, "_moveAttachmentFilesFromAttachmentFileManager:toAttachmentFileManager:affectedAccountIdentifiers:logPrefix:", v6, v7, v8, v15);

}

- (id)_performDataSeparationMigrationIfNeededWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v17;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RDFeatureFlagsObjCWrapper wrappedFeatureFlagsWithRawValue:](RDFeatureFlagsObjCWrapper, "wrappedFeatureFlagsWithRawValue:", CFSTR("dataSeparation")));
  if (objc_msgSend(v8, "isEnabled"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _migrateStoresToPostDataSeparationLocationsWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:](self, "_migrateStoresToPostDataSeparationLocationsWithDataSeparatedStoreURLsMap:deleteFilesMarkedDeleted:", v6, v4));

    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v9, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[performDataSeparationMigration] Stores migrated: %ld", buf, 0xCu);
    }

    if (objc_msgSend(v6, "count") || objc_msgSend(v9, "count"))
    {
      -[RDStoreController _migrateMLModelsToPostDataSeparationLocationIfNeeded](self, "_migrateMLModelsToPostDataSeparationLocationIfNeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v11));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
      objc_msgSend(v12, "addObjectsFromArray:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("NullMetadataAccountIdentifier"), 0));
      objc_msgSend(v12, "minusSet:", v14);

      -[RDStoreController _migrateAttachmentFilesToPostDataSeparationLocationsIfNeededWithAccountIdentifiers:](self, "_migrateAttachmentFilesToPostDataSeparationLocationsIfNeededWithAccountIdentifiers:", v12);
      -[RDStoreController _migrateBackupStoresToPostDataSeparationLocationIfNeeded](self, "_migrateBackupStoresToPostDataSeparationLocationIfNeeded");

    }
    -[RDStoreController _cleanUpPreDataSeparationDataContainerIfNeeded](self, "_cleanUpPreDataSeparationDataContainerIfNeeded");
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (id)_migrateStoresToPostDataSeparationLocationsWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  __int128 v18;
  NSString *(__cdecl **v19)(SEL);
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  unsigned int v30;
  NSString *(__cdecl **v31)(SEL);
  unsigned int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  unsigned int v53;
  id v54;
  NSObject *v55;
  void *v56;
  NSString *(__cdecl **v57)(SEL);
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  id v66;
  id v67;
  NSObject *v69;
  __int128 v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  NSMutableDictionary *v79;
  RDStoreController *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  NSMutableDictionary *v97;
  id v98;
  uint8_t buf[4];
  NSObject *v100;
  __int16 v101;
  NSObject *v102;
  __int16 v103;
  NSObject *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  NSObject *v108;
  _BYTE v109[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[REMPaths legacy_applicationDocumentsURL](REMPaths, "legacy_applicationDocumentsURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths reminderDataContainerURLWithAppDocumentsURL:](RDPaths, "reminderDataContainerURLWithAppDocumentsURL:", v9));
  if ((objc_msgSend(v8, "rem_fileExistsAtURL:", v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v10));
    v98 = 0;
    v80 = self;
    v76 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_discoverAccountStoreURLsFromReminderDataContainerURLs:deletingFilesMarkedDeleted:storesDiscoveryStatesRef:error:](self, "l_discoverAccountStoreURLsFromReminderDataContainerURLs:deletingFilesMarkedDeleted:storesDiscoveryStatesRef:error:", v11, v4, 0, &v98));
    v13 = v98;

    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100683E24(v10, (uint64_t)v13, v14);

    }
    if (objc_msgSend(v12, "count"))
    {
      v71 = v13;
      v73 = v10;
      v74 = v9;
      v77 = v7;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_1000822EC;
      v96[3] = &unk_1007DA650;
      v79 = objc_opt_new(NSMutableDictionary);
      v97 = v79;
      v75 = v6;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v96);
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v72 = v12;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
      v81 = v8;
      v19 = &NSStringFromSelector_ptr;
      if (v17)
      {
        v20 = v17;
        v21 = *(_QWORD *)v93;
        *(_QWORD *)&v18 = 138544386;
        v70 = v18;
        v85 = v16;
        v87 = *(_QWORD *)v93;
        do
        {
          v22 = 0;
          v83 = v20;
          do
          {
            if (*(_QWORD *)v93 != v21)
              objc_enumerationMutation(v16);
            v23 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)v22);
            v24 = objc_autoreleasePoolPush();
            v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
            if (-[NSObject length](v25, "length")
              && (objc_msgSend(v8, "rem_fileExistsAtURL:", v23) & 1) != 0)
            {
              v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v23));
              if (!-[NSObject length](v26, "length")
                || -[NSObject isEqualToString:](v26, "isEqualToString:", CFSTR("NullMetadataAccountIdentifier")))
              {
                v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19[282], "container", v70));
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
                  *(_DWORD *)buf = 138412546;
                  v100 = v28;
                  v101 = 2114;
                  v102 = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Found a store from legacy container path with nil acccount identifier {legacyStoreURL: %@, legacyStoreName: %{public}@}", buf, 0x16u);

                  goto LABEL_25;
                }
                goto LABEL_44;
              }
              if (objc_msgSend(v82, "containsObject:", v26))
              {
                v27 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v79, "objectForKey:", v26));
                v30 = objc_msgSend(v8, "rem_fileExistsAtURL:", v27);
                v31 = v19;
                v32 = v30;
                v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31[282], "container"));
                v34 = v33;
                if (v32)
                {
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v27, "absoluteString"));
                    *(_DWORD *)buf = 138544130;
                    v100 = v26;
                    v101 = 2114;
                    v102 = v25;
                    v103 = 2112;
                    v104 = v35;
                    v105 = 2112;
                    v106 = v36;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Found store at modern container path with the same account ID of the store at legacy container path, we're good and no need to clone {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);

                    v8 = v81;
                  }

                  objc_msgSend(v78, "addObject:", v23);
                  v19 = &NSStringFromSelector_ptr;
LABEL_25:
                  v16 = v85;
LABEL_44:

                  v21 = v87;
                  goto LABEL_45;
                }
                if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                {
                  v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v27, "absoluteString"));
                  *(_DWORD *)buf = 138544130;
                  v100 = v26;
                  v101 = 2114;
                  v102 = v25;
                  v103 = 2112;
                  v104 = v49;
                  v105 = 2112;
                  v106 = v50;
                  _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "[migrateStoresToDataSeparationLocations] Unexpectedly found store in our map with the same account ID of the store at legacy container path but file DOES NOT EXIST at modern container path {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);

                  v8 = v81;
                }

                v19 = &NSStringFromSelector_ptr;
              }
              v27 = objc_claimAutoreleasedReturnValue(-[RDStoreController _reminderDataContainerURLForAccountIdentifier:](v80, "_reminderDataContainerURLForAccountIdentifier:", v26, v70));
              v84 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseDirectoryURLWithContainerURL:](v80, "databaseDirectoryURLWithContainerURL:", v27));
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "URLByAppendingPathComponent:", v25));
              v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19[282], "container"));
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v27, "absoluteString"));
                *(_DWORD *)buf = 138544130;
                v100 = v26;
                v101 = 2114;
                v102 = v25;
                v103 = 2112;
                v104 = v38;
                v105 = 2112;
                v106 = v39;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Will proceed cloning this store at legacy container path to its modern container path because we did not find it any store with the same account ID at the modern container paths {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernDataContainerURL: %@}", buf, 0x2Au);

                v8 = v81;
                v19 = &NSStringFromSelector_ptr;
              }

              if (objc_msgSend(v8, "rem_fileExistsAtURL:", v86))
              {
                v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19[282], "container"));
                if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                {
                  v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "absoluteString"));
                  *(_DWORD *)buf = 138544130;
                  v100 = v26;
                  v101 = 2114;
                  v102 = v25;
                  v103 = 2112;
                  v104 = v41;
                  v105 = 2112;
                  v106 = v42;
                  _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "[migrateStoresToDataSeparationLocations] Unexpectedly found store at modern container path but account identifier DOES NOT EXIST in our store map {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);

                  v8 = v81;
                  goto LABEL_41;
                }
              }
              else
              {
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "path"));
                v91 = 0;
                v45 = +[RDSQLiteDBUtils copySQLiteFileAtPath:toPath:timeout:error:](RDSQLiteDBUtils, "copySQLiteFileAtPath:toPath:timeout:error:", v43, v44, &v91, 1.0);
                v40 = v91;

                if (!v45 || v40)
                {
                  v41 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                  v8 = v81;
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "absoluteString"));
                    *(_DWORD *)buf = v70;
                    v100 = v26;
                    v101 = 2114;
                    v102 = v25;
                    v103 = 2112;
                    v104 = v51;
                    v105 = 2112;
                    v106 = v52;
                    v107 = 2114;
                    v108 = v40;
                    _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Failed to clone store from legacy container path to its modern container path {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@, error: %{public}@}", buf, 0x34u);

                    v8 = v81;
                  }
LABEL_41:

                }
                else
                {
                  objc_msgSend(v77, "setObject:forKey:", v26, v86);
                  v46 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
                    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "absoluteString"));
                    *(_DWORD *)buf = 138544130;
                    v100 = v26;
                    v101 = 2114;
                    v102 = v25;
                    v103 = 2112;
                    v104 = v47;
                    v105 = 2112;
                    v106 = v48;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Successfully cloned store at legacy container path to its modern container path {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);

                  }
                  objc_msgSend(v78, "addObject:", v23);
                  v8 = v81;
                }
                v19 = &NSStringFromSelector_ptr;
              }
              v16 = v85;

              v20 = v83;
              goto LABEL_44;
            }
            v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19[282], "container", v70));
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
              *(_DWORD *)buf = 138412546;
              v100 = v29;
              v101 = 2114;
              v102 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Unexpected nil legacy store basename or legacy store file doesn't exist {legacyStoreURL: %@, legacyStoreName: %{public}@}", buf, 0x16u);

              v16 = v85;
            }
LABEL_45:

            objc_autoreleasePoolPop(v24);
            v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
        }
        while (v20);
      }

      v12 = v72;
      v10 = v73;
      v13 = v71;
      if (v76 && objc_msgSend(v78, "count"))
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController storeURLWithName:withContainerURL:](v80, "storeURLWithName:withContainerURL:", CFSTR("local"), v73));
        objc_msgSend(v78, "addObject:");
        v89 = 0;
        v90 = 0;
        v53 = -[RDStoreController _removeFilesOfStoresAtURLs:outRemovedFileURLs:error:](v80, "_removeFilesOfStoresAtURLs:outRemovedFileURLs:error:", v78, &v90, &v89);
        v54 = v90;
        v55 = v89;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allObjects"));
        v57 = v19;
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "valueForKey:", CFSTR("lastPathComponent")));

        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "sortedArrayUsingSelector:", "caseInsensitiveCompare:"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("!(SELF ENDSWITH[c] 'shm') && !(SELF ENDSWITH[c] 'wal')")));
        v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "filteredArrayUsingPredicate:", v60));

        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57[282], "container"));
        v63 = v62;
        if (v53)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v64 = objc_msgSend(v54, "count");
            *(_DWORD *)buf = 134218242;
            v100 = v64;
            v101 = 2112;
            v102 = v61;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Deleted store files and journals at legacy container path after migration {total: %ld, removeStoreNames: %@}", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v69 = objc_msgSend(v54, "count");
          *(_DWORD *)buf = 138543874;
          v100 = v55;
          v101 = 2048;
          v102 = v69;
          v103 = 2112;
          v104 = v61;
          _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Failed to delete (some) store files from legacy container path after migration {error: %{public}@, totalRemoved: %ld, removedFileNames: %@}", buf, 0x20u);
        }

        v8 = v81;
      }
      v7 = v77;
      v67 = v77;

      v9 = v74;
      v6 = v75;
    }
    else
    {
      v66 = v7;
    }

  }
  else
  {
    v65 = v7;
  }

  return v7;
}

- (void)_migrateBackupStoresToPostDataSeparationLocationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  _BOOL4 v12;
  objc_class *v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  NSString *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  _BOOL4 v25;
  objc_class *v26;
  NSString *v27;
  NSString *v28;
  void *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  objc_class *v34;
  NSString *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  char *aSelectora;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[REMPaths legacy_applicationDocumentsURL](REMPaths, "legacy_applicationDocumentsURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths reminderDataContainerURLWithAppDocumentsURL:](RDPaths, "reminderDataContainerURLWithAppDocumentsURL:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseBackupDirectoryURLWithContainerURL:](self, "databaseBackupDirectoryURLWithContainerURL:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseStagedMigrationDirectoryURLWithContainerURL:](self, "databaseStagedMigrationDirectoryURLWithContainerURL:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseBackupDirectoryURLWithContainerURL:](self, "databaseBackupDirectoryURLWithContainerURL:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseStagedMigrationDirectoryURLWithContainerURL:](self, "databaseStagedMigrationDirectoryURLWithContainerURL:", v7));
  if (objc_msgSend(v3, "rem_fileExistsAtURL:", v5))
  {
    v50 = 0;
    v10 = objc_msgSend(v3, "moveItemAtURL:toURL:error:", v5, v8, &v50);
    v44 = v50;
    v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v13 = (objc_class *)objc_opt_class(self);
        v14 = NSStringFromClass(v13);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v15 = NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v39 = v9;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v41, v37));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
        *(_DWORD *)buf = 138543618;
        v52 = v16;
        v53 = 2112;
        v54 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Moved Stores-Backup from legacy contanier to the post-data-separation default container {modernStoresBackupDirURL: %@}", buf, 0x16u);

        v9 = v39;
      }
    }
    else if (v12)
    {
      v18 = (objc_class *)objc_opt_class(self);
      v19 = NSStringFromClass(v18);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v20 = NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v42 = v8;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v40, v38));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "absoluteString"));
      *(_DWORD *)buf = 138543874;
      v52 = v21;
      v53 = 2112;
      v54 = v22;
      v55 = 2114;
      v56 = v44;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to move Stores-Backup from legacy contanier to the post-data-separation default container {modernStoresBackupDirURL: %@, error: %{public}@}", buf, 0x20u);

      v8 = v42;
    }

  }
  if (objc_msgSend(v3, "rem_fileExistsAtURL:", v6))
  {
    v49 = 0;
    v23 = objc_msgSend(v3, "moveItemAtURL:toURL:error:", v6, v9, &v49);
    v45 = v49;
    v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        v26 = (objc_class *)objc_opt_class(self);
        v27 = NSStringFromClass(v26);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v28 = NSStringFromSelector(a2);
        aSelectora = (char *)objc_claimAutoreleasedReturnValue(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v43, aSelectora));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
        *(_DWORD *)buf = 138543618;
        v52 = v29;
        v53 = 2112;
        v54 = v30;
        v31 = "[%{public}@] Moved Stores-StagedMigration from legacy contanier to the post-data-separation default contai"
              "ner {modernStoresStagedMigrationDirURL: %@}";
        v32 = v24;
        v33 = 22;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);

      }
    }
    else if (v25)
    {
      v34 = (objc_class *)objc_opt_class(self);
      v35 = NSStringFromClass(v34);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v36 = NSStringFromSelector(a2);
      aSelectora = (char *)objc_claimAutoreleasedReturnValue(v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v43, aSelectora));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
      *(_DWORD *)buf = 138543874;
      v52 = v29;
      v53 = 2112;
      v54 = v30;
      v55 = 2114;
      v56 = v45;
      v31 = "[%{public}@] Failed to move Stores-StagedMigration from legacy contanier to the post-data-separation default"
            " container {modernStoresStagedMigrationDirURL: %@, error: %{public}@}";
      v32 = v24;
      v33 = 32;
      goto LABEL_14;
    }

  }
}

- (void)_migrateMLModelsToPostDataSeparationLocationIfNeeded
{
  void *v4;
  NSString *(__cdecl **v5)(SEL);
  NSObject *v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSObject *v16;
  RDStoreController *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  unsigned __int8 v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  NSString *v28;
  RDStoreController *v29;
  const char *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  NSString *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  void *v43;
  NSObject *v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  NSString *v48;
  void *v49;
  NSObject *v50;
  RDStoreController *v51;
  const char *v52;
  NSObject *v53;
  unsigned __int8 v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  objc_class *v58;
  NSString *v59;
  void *v60;
  NSString *v61;
  RDStoreController *v62;
  const char *v63;
  void *v64;
  NSObject *v65;
  unsigned __int8 v66;
  NSObject *v67;
  objc_class *v68;
  NSString *v69;
  void *v70;
  NSString *v71;
  void *v72;
  NSObject *v73;
  objc_class *v74;
  NSString *v75;
  void *v76;
  NSString *v77;
  RDStoreController *v78;
  const char *v79;
  void *v80;
  NSObject *v81;
  objc_class *v82;
  NSString *v83;
  NSString *v84;
  const char *v85;
  void *v86;
  objc_class *v87;
  NSString *v88;
  NSString *v89;
  RDStoreController *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint8_t buf[4];
  NSObject *v96;
  __int16 v97;
  NSObject *v98;
  __int16 v99;
  NSObject *v100;
  __int16 v101;
  NSObject *v102;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = &NSStringFromSelector_ptr;
  v6 = objc_claimAutoreleasedReturnValue(+[REMPaths _legacy_mlModelURL](REMPaths, "_legacy_mlModelURL"));
  if ((objc_msgSend(v4, "rem_fileExistsAtURL:", v6) & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMPaths mlModelURL](REMPaths, "mlModelURL"));
    if (objc_msgSend(v4, "rem_fileExistsAtURL:", v7))
    {
      v8 = objc_msgSend(v4, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v7, 0);
      v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (!v8)
      {
        if (v10)
        {
          v45 = (objc_class *)objc_opt_class(self);
          v46 = NSStringFromClass(v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          v48 = NSStringFromSelector(a2);
          v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
          v50 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v47, v49));
          v51 = self;
          v52 = a2;
          v53 = objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v7, "absoluteString"));
          *(_DWORD *)buf = 138543618;
          v96 = v50;
          v97 = 2112;
          v98 = v53;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] ML models already exist and non-empty at modern location, don't overwrite it with the legacy copy {modernMLModelURL: %@}", buf, 0x16u);

          a2 = v52;
          self = v51;
          v5 = &NSStringFromSelector_ptr;

        }
        goto LABEL_21;
      }
      if (v10)
      {
        v11 = (objc_class *)objc_opt_class(self);
        v12 = NSStringFromClass(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v13, v15));
        v17 = self;
        v18 = a2;
        v19 = objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v7, "absoluteString"));
        *(_DWORD *)buf = 138543618;
        v96 = v16;
        v97 = 2112;
        v98 = v19;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] ML model directory exists at modern location but is empty or not a directory, removing before proceeding {modernMLModelURL: %@}", buf, 0x16u);

        a2 = v18;
        self = v17;
        v5 = &NSStringFromSelector_ptr;

      }
      v94 = 0;
      objc_msgSend(v4, "removeItemAtURL:error:", v7, &v94);
      v20 = v94;
      if (v20)
      {
        v21 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v74 = (objc_class *)objc_opt_class(self);
          v75 = NSStringFromClass(v74);
          v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
          v77 = NSStringFromSelector(a2);
          v78 = self;
          v79 = a2;
          v80 = (void *)objc_claimAutoreleasedReturnValue(v77);
          v81 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v76, v80));
          *(_DWORD *)buf = 138543618;
          v96 = v81;
          v97 = 2114;
          v98 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Could not remove the the empty dir or existing file at the modern ML model location before proceeding {error: %{public}@}", buf, 0x16u);

          a2 = v79;
          self = v78;
          v5 = &NSStringFromSelector_ptr;

        }
      }

    }
    v93 = 0;
    v22 = objc_msgSend(v4, "moveItemAtURL:toURL:error:", v6, v7, &v93);
    v9 = v93;
    v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v24 = v23;
    if ((v22 & 1) == 0)
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_36;
      }
      v39 = (objc_class *)objc_opt_class(self);
      v40 = NSStringFromClass(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v44 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v41, v43));
      *(_DWORD *)buf = 138544130;
      v96 = v44;
      v97 = 2112;
      v98 = v6;
      v99 = 2112;
      v100 = v7;
      v101 = 2114;
      v102 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to move ML models to modern location {legacyMLModelURL: %@, modernMLModelURL: %@, error: %{public}@}", buf, 0x2Au);

      goto LABEL_34;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class(self);
      v26 = NSStringFromClass(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = NSStringFromSelector(a2);
      v29 = self;
      v30 = a2;
      v31 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v27, v31));
      *(_DWORD *)buf = 138543874;
      v96 = v32;
      v97 = 2112;
      v98 = v6;
      v99 = 2112;
      v100 = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully moved ML models to modern location {legacyMLModelURL: %@, modernMLModelURL: %@}", buf, 0x20u);

      a2 = v30;
      self = v29;
      v5 = &NSStringFromSelector_ptr;

    }
LABEL_21:

    if (!objc_msgSend(v4, "rem_fileExistsAtURL:", v6))
      goto LABEL_28;
    v92 = 0;
    v54 = objc_msgSend(v4, "removeItemAtURL:error:", v6, &v92);
    v55 = v92;
    v56 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v57 = v56;
    if ((v54 & 1) != 0)
    {
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

LABEL_28:
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5[293], "_legacy_temporaryMLModelURL"));
        if (objc_msgSend(v4, "rem_fileExistsAtURL:", v9))
        {
          v91 = 0;
          v66 = objc_msgSend(v4, "removeItemAtURL:error:", v9, &v91);
          v24 = v91;
          v67 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          v44 = v67;
          if ((v66 & 1) == 0)
          {
            if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              goto LABEL_34;
            v87 = (objc_class *)objc_opt_class(self);
            v88 = NSStringFromClass(v87);
            v70 = (void *)objc_claimAutoreleasedReturnValue(v88);
            v89 = NSStringFromSelector(a2);
            v72 = (void *)objc_claimAutoreleasedReturnValue(v89);
            v73 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v70, v72));
            *(_DWORD *)buf = 138543874;
            v96 = v73;
            v97 = 2112;
            v98 = v9;
            v99 = 2114;
            v100 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove temporary ML models at legacy location {legacyTempMLModelURL: %@, error: %{public}@}", buf, 0x20u);
            goto LABEL_32;
          }
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v68 = (objc_class *)objc_opt_class(self);
            v69 = NSStringFromClass(v68);
            v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
            v71 = NSStringFromSelector(a2);
            v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
            v73 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v70, v72));
            *(_DWORD *)buf = 138543618;
            v96 = v73;
            v97 = 2112;
            v98 = v9;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed temporary ML models at legacty location {legacyTempMLModelURL: %@}", buf, 0x16u);
LABEL_32:

          }
LABEL_34:

          goto LABEL_35;
        }
LABEL_36:

        goto LABEL_37;
      }
      v58 = (objc_class *)objc_opt_class(self);
      v59 = NSStringFromClass(v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      v61 = NSStringFromSelector(a2);
      v62 = self;
      v63 = a2;
      v64 = (void *)objc_claimAutoreleasedReturnValue(v61);
      v65 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v60, v64));
      *(_DWORD *)buf = 138543618;
      v96 = v65;
      v97 = 2112;
      v98 = v6;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed ML models at legacty location {legacyMLModelURL: %@}", buf, 0x16u);

      a2 = v63;
      self = v62;
      v5 = &NSStringFromSelector_ptr;
    }
    else
    {
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v82 = (objc_class *)objc_opt_class(self);
      v83 = NSStringFromClass(v82);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v83);
      v84 = NSStringFromSelector(a2);
      v90 = self;
      v85 = a2;
      v86 = (void *)objc_claimAutoreleasedReturnValue(v84);
      v65 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v60, v86));
      *(_DWORD *)buf = 138543874;
      v96 = v65;
      v97 = 2112;
      v98 = v6;
      v99 = 2114;
      v100 = v55;
      _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove ML models at legacy location {legacyMLModelURL: %@, error: %{public}@}", buf, 0x20u);

      a2 = v85;
      self = v90;
    }

    goto LABEL_27;
  }
  v7 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (objc_class *)objc_opt_class(self);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = NSStringFromSelector(a2);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v35, v37));
    v38 = objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v6, "absoluteString"));
    *(_DWORD *)buf = 138543618;
    v96 = v9;
    v97 = 2112;
    v98 = v38;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] No ML models found at legacy location {legacyMLModelURL: %@}", buf, 0x16u);

    goto LABEL_36;
  }
LABEL_37:

}

- (void)_migrateAttachmentFilesToPostDataSeparationLocationsIfNeededWithAccountIdentifiers:(id)a3
{
  id v5;
  _RDPreDataSeparationAttachmentFileManagerDocumentsURLProvider *v6;
  RDAttachmentFileManager *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  NSString *v28;
  NSString *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;

  v5 = a3;
  v6 = objc_opt_new(_RDPreDataSeparationAttachmentFileManagerDocumentsURLProvider);
  v7 = -[RDAttachmentFileManager initWithDocumentsURLProvider:]([RDAttachmentFileManager alloc], "initWithDocumentsURLProvider:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (objc_class *)objc_opt_class(self);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v12, v14));
  -[RDStoreController _moveAttachmentFilesFromAttachmentFileManager:toAttachmentFileManager:affectedAccountIdentifiers:logPrefix:](self, "_moveAttachmentFilesFromAttachmentFileManager:toAttachmentFileManager:affectedAccountIdentifiers:logPrefix:", v7, v8, v5, v15);

  -[RDStoreController _migrateImageDeduplicationSentinelFileIfNeededWithPreMigrationAttachmentFileManager:dataSeparationAttachmentFileManager:](self, "_migrateImageDeduplicationSentinelFileIfNeededWithPreMigrationAttachmentFileManager:dataSeparationAttachmentFileManager:", v7, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForDefaultFilesDirectory](v7, "URLForDefaultFilesDirectory"));
  if (objc_msgSend(v9, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v16, 0))
  {
    v30 = 0;
    v17 = objc_msgSend(v9, "removeItemAtURL:error:", v16, &v30);
    v18 = v30;
    v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v20 = v19;
    if ((v17 & 1) != 0)
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        goto LABEL_8;
      }
      v21 = (objc_class *)objc_opt_class(self);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v23, v25));
      *(_DWORD *)buf = 138543362;
      v32 = v26;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed empty pre-migration 'Files' directory", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v27 = (objc_class *)objc_opt_class(self);
      v28 = NSStringFromClass(v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v29 = NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v23, v25));
      *(_DWORD *)buf = 138543618;
      v32 = v26;
      v33 = 2114;
      v34 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove empty pre-migration 'Files' directory {error: %{public}@}", buf, 0x16u);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_moveAttachmentFilesFromAttachmentFileManager:(id)a3 toAttachmentFileManager:(id)a4 affectedAccountIdentifiers:(id)a5 logPrefix:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  unsigned __int8 v35;
  NSObject *v36;
  __int128 v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  NSObject *v56;
  __int16 v57;
  NSObject *v58;
  __int16 v59;
  NSObject *v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v10;
  v39 = v12;
  v14 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v15 = v11;
  v16 = (void *)v14;
  obj = v15;
  v44 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v50;
    *(_QWORD *)&v17 = 138544130;
    v37 = v17;
    v40 = v13;
    v41 = (void *)v14;
    v38 = v9;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(obj);
        v19 = *(NSObject **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v18);
        v20 = objc_autoreleasePoolPush();
        v21 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v19);
        if (v21)
        {
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLForAccountFileDirectory:", v21));
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLForAccountFileDirectory:", v21));
          if ((objc_msgSend(v16, "rem_fileExistsAtURL:", v22) & 1) != 0)
          {
            if (!objc_msgSend(v16, "rem_fileExistsAtURL:", v23))
              goto LABEL_17;
            if (objc_msgSend(v16, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v23, 1))
            {
              v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v54 = v39;
                v55 = 2114;
                v56 = v19;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] File attachment directory exists but is empty or not directory with given toAttachmentFileManager, removing before proceeding {accountIdentifier: %{public}@}", buf, 0x16u);
              }

              v48 = 0;
              objc_msgSend(v16, "removeItemAtURL:error:", v23, &v48);
              v25 = v48;
              if (v25)
              {
                v26 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v54 = v39;
                  v55 = 2114;
                  v56 = v19;
                  v57 = 2114;
                  v58 = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Could not remove the the empty dir or existing file at the toAttachmentFileManager location before proceeding {accountIdentifier: %{public}@, error: %{public}@}", buf, 0x20u);
                }

                v16 = v41;
              }

LABEL_17:
              v27 = objc_claimAutoreleasedReturnValue(-[NSObject URLByDeletingLastPathComponent](v23, "URLByDeletingLastPathComponent", v37));
              if (v27)
              {
                v46 = 0;
                objc_msgSend(v16, "rem_createDirectoryIfNecessaryAtURL:error:", v27, &v46);
                v28 = v46;
                if (v28)
                {
                  v29 = v28;
                  v30 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v54 = v39;
                    v55 = 2112;
                    v56 = v27;
                    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to create container files directory given by the toAttachmentFileManager {destinationContainerFilesDirectoryURL: %@}", buf, 0x16u);
                  }

                  goto LABEL_37;
                }
              }
              v45 = 0;
              v31 = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v22, v23, &v45);
              v32 = v45;
              v33 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
              v34 = v33;
              if ((v31 & 1) != 0)
              {
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v54 = v39;
                  v55 = 2114;
                  v56 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sucessfully moved file attachment directory to target location given by the toAttachmentFileManager {accountIdentifier: %{public}@}", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544386;
                v54 = v39;
                v55 = 2114;
                v56 = v19;
                v57 = 2112;
                v58 = v22;
                v59 = 2112;
                v60 = v23;
                v61 = 2114;
                v62 = v32;
                _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to move file attachment directory given by the fromAttachmentFileManager to target location given by the toAttachmentFileManager {accountIdentifier: %{public}@, fromAccountFileDirectoryURL: %@, toAccountFileDirectoryURL: %@, error: %{public}@}", buf, 0x34u);
              }

              v9 = v38;
            }
            else
            {
              v47 = 0;
              v35 = objc_msgSend(v16, "removeItemAtURL:error:", v22, &v47);
              v27 = v47;
              v36 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
              v29 = v36;
              if ((v35 & 1) != 0)
              {
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v54 = v39;
                  v55 = 2114;
                  v56 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] File attachment directory already exist and non-empty with given fromAttachmentFileManager, successfully removed source copy {accountIdentifier: %{public}@}", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v37;
                v54 = v39;
                v55 = 2112;
                v56 = v19;
                v57 = 2112;
                v58 = v22;
                v59 = 2114;
                v60 = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%{public}@] File attachment directory already exist and non-empty with given fromAttachmentFileManager, but failed to remove the source copy {accountIdentifier: %@, fromAccountFileDirectoryURL: %@, error: %{public}@}", buf, 0x2Au);
              }
LABEL_37:

            }
            v13 = v40;
            v16 = v41;
          }
          else
          {
            v27 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              v54 = v39;
              v55 = 2114;
              v56 = v19;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}@] No need to move file attachments of given fromAttachmentFileManager as the source directory is not found {accountIdentifier: %{public}@}", buf, 0x16u);
            }
          }

          goto LABEL_40;
        }
        v22 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v54 = v39;
          v55 = 2114;
          v56 = v19;
          _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "[%{public}@] Account identifier is not a UUID {accountIdentifier: %{public}@}", buf, 0x16u);
        }
LABEL_40:

        objc_autoreleasePoolPop(v20);
        v18 = (char *)v18 + 1;
      }
      while (v44 != v18);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    }
    while (v44);
  }

}

- (void)_migrateImageDeduplicationSentinelFileIfNeededWithPreMigrationAttachmentFileManager:(id)a3 dataSeparationAttachmentFileManager:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *(__cdecl **v9)(SEL);
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  NSString *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  NSObject *v42;
  objc_class *v43;
  NSString *v44;
  NSString *v45;
  objc_class *v46;
  NSString *v47;
  NSString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v54;
  id obj;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  id v70;
  _QWORD v71[2];
  _BYTE v72[128];

  v57 = a3;
  v54 = a4;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RDImageDeduplicationActivityObjC SentinelFileName](_TtC7remindd32RDImageDeduplicationActivityObjC, "SentinelFileName"));
  v71[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDSavedImageDeduplicationActivityObjC SentinelFileName](_TtC7remindd37RDSavedImageDeduplicationActivityObjC, "SentinelFileName"));
  v71[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));

  obj = v7;
  v58 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v58)
  {
    v8 = *(_QWORD *)v62;
    v9 = &NSStringFromSelector_ptr;
    v51 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v58; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[123], "defaultManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "URLForDefaultFilesDirectory"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", v11));
        if ((objc_msgSend(v12, "rem_fileExistsAtURL:", v14) & 1) != 0)
        {
          v56 = v13;
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "URLForDefaultFilesDirectory"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v11));
          if (objc_msgSend(v12, "rem_fileExistsAtURL:", v16))
          {
            v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = (objc_class *)objc_opt_class(self);
              v19 = NSStringFromClass(v18);
              v49 = (void *)objc_claimAutoreleasedReturnValue(v19);
              v20 = NSStringFromSelector(a2);
              v21 = v16;
              v22 = (void *)objc_claimAutoreleasedReturnValue(v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v49, v22));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absoluteString"));
              *(_DWORD *)buf = 138543874;
              v66 = v23;
              v67 = 2114;
              v68 = v11;
              v69 = 2112;
              v70 = v24;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Post-migration '%{public}@' sentinel file already exists, removing pre-migration copy {postMigrationImageDedupSentinelFileURL: %@}", buf, 0x20u);

              v9 = &NSStringFromSelector_ptr;
              v16 = v21;

              v8 = v51;
            }

            v60 = 0;
            objc_msgSend(v12, "removeItemAtURL:error:", v14, &v60);
            v25 = v60;
            if (v25)
            {
              v26 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v27 = (objc_class *)objc_opt_class(self);
                v28 = NSStringFromClass(v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
                v30 = NSStringFromSelector(a2);
                v50 = v16;
                v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v29, v31));
                *(_DWORD *)buf = 138543874;
                v66 = v32;
                v67 = 2114;
                v68 = v11;
                v69 = 2114;
                v70 = v25;
                v33 = v26;
                v34 = "[%{public}@] Could not remove pre-migration  '%{public}@' sentinel file {error: %{public}@}";
                goto LABEL_20;
              }
LABEL_23:

            }
            v13 = v56;
            goto LABEL_25;
          }
          v59 = 0;
          v41 = objc_msgSend(v12, "moveItemAtURL:toURL:error:", v14, v16, &v59);
          v25 = v59;
          v42 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          v26 = v42;
          if ((v41 & 1) != 0)
          {
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              v43 = (objc_class *)objc_opt_class(self);
              v44 = NSStringFromClass(v43);
              v29 = (void *)objc_claimAutoreleasedReturnValue(v44);
              v45 = NSStringFromSelector(a2);
              v50 = v16;
              v31 = (void *)objc_claimAutoreleasedReturnValue(v45);
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v29, v31));
              *(_DWORD *)buf = 138543618;
              v66 = v32;
              v67 = 2114;
              v68 = v11;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sucessfully moved '%{public}@' sentinel file to post-migration location", buf, 0x16u);
              goto LABEL_21;
            }
          }
          else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v46 = (objc_class *)objc_opt_class(self);
            v47 = NSStringFromClass(v46);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v47);
            v48 = NSStringFromSelector(a2);
            v50 = v16;
            v31 = (void *)objc_claimAutoreleasedReturnValue(v48);
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v29, v31));
            *(_DWORD *)buf = 138543874;
            v66 = v32;
            v67 = 2114;
            v68 = v11;
            v69 = 2114;
            v70 = v25;
            v33 = v26;
            v34 = "[%{public}@] Failed to move '%{public}@' sentinel file to post-migration location {error: %{public}@}";
LABEL_20:
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x20u);
LABEL_21:

            v16 = v50;
            v9 = &NSStringFromSelector_ptr;

          }
          v8 = v51;
          goto LABEL_23;
        }
        v15 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v35 = (objc_class *)objc_opt_class(self);
          v36 = NSStringFromClass(v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          v38 = NSStringFromSelector(a2);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v37, v39));
          *(_DWORD *)buf = 138543874;
          v66 = v40;
          v67 = 2114;
          v68 = v11;
          v69 = 2112;
          v70 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] No pre-migration '%{public}@' sentinel file found {preMigrationImageDedupSentinelFileURL: %@}", buf, 0x20u);

          v9 = &NSStringFromSelector_ptr;
        }
LABEL_25:

      }
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v58);
  }

}

- (void)_cleanUpPreDataSeparationDataContainerIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  const char *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  NSString *v32;
  void *v33;
  objc_class *v34;
  NSString *v35;
  NSString *v36;
  id v37;
  const char *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMPaths legacy_applicationDocumentsURL](REMPaths, "legacy_applicationDocumentsURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths reminderDataContainerURLWithAppDocumentsURL:](RDPaths, "reminderDataContainerURLWithAppDocumentsURL:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseDirectoryURLWithContainerURL:](self, "databaseDirectoryURLWithContainerURL:", v6));
  if (objc_msgSend(v4, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v7, 1))
  {
    v40 = 0;
    v8 = objc_msgSend(v4, "removeItemAtURL:error:", v7, &v40);
    v9 = v40;
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v11 = v10;
    if ((v8 & 1) != 0)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        goto LABEL_8;
      }
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v37 = v9;
      v14 = a2;
      v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = NSStringFromSelector(v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v15, v17));
      *(_DWORD *)buf = 138543362;
      v42 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed empty pre-migration 'Stores' directory", buf, 0xCu);

      a2 = v14;
      v9 = v37;
    }
    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v29 = (objc_class *)objc_opt_class(self);
      v30 = NSStringFromClass(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = NSStringFromSelector(a2);
      v38 = a2;
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v31, v33));
      *(_DWORD *)buf = 138543618;
      v42 = v18;
      v43 = 2114;
      v44 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove empty pre-migration 'Stores' directory {error: %{public}@}", buf, 0x16u);

      a2 = v38;
    }

    goto LABEL_7;
  }
LABEL_8:
  if (objc_msgSend(v4, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v6, 1))
  {
    v39 = 0;
    v19 = objc_msgSend(v4, "removeItemAtURL:error:", v6, &v39);
    v20 = v39;
    v21 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v22 = v21;
    if ((v19 & 1) != 0)
    {
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      v23 = (objc_class *)objc_opt_class(self);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v25, v27));
      *(_DWORD *)buf = 138543362;
      v42 = v28;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed empty pre-migration 'Container_v1' directory", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v34 = (objc_class *)objc_opt_class(self);
      v35 = NSStringFromClass(v34);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v36 = NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v25, v27));
      *(_DWORD *)buf = 138543618;
      v42 = v28;
      v43 = 2114;
      v44 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove empty pre-migration 'Container_v1' directory {error: %{public}@}", buf, 0x16u);
    }

    goto LABEL_14;
  }
LABEL_15:

}

- (BOOL)l_loadAccountStoresFromDiskAndValidateInBatchesWithStoreURLs:(id)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  RDStoreController *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v31;
  int *v32;
  void *v33;
  RDStoreController *v34;
  char v35;
  id v36;
  _BOOL4 v37;
  unint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  id v42;
  unint64_t v43;
  void *context;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  _BYTE v58[4];
  int v59;
  _BYTE v60[128];

  v31 = a5;
  v37 = a4;
  v6 = a3;
  v34 = self;
  v38 = -[RDStoreController _persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:](self, "_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:", objc_msgSend(v6, "count"));
  v43 = qword_100836AE0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v6, "count")));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = v6;
  v42 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v42)
  {
    v39 = 0;
    v41 = *(_QWORD *)v47;
    v32 = &v59;
    v9 = 1;
    v35 = 1;
    v10 = v34;
    v33 = v7;
    v36 = v8;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v47 != v41)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v11);
        context = objc_autoreleasePoolPush();
        objc_msgSend(v7, "addObject:", v13);
        v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          sub_100683EB8((uint64_t)v58, v13);
        v15 = v9;
        v16 = (unint64_t)v11 + v9;

        v17 = ((unint64_t)v11 + v9) / v43;
        if (v12 == v16 / v43 * v43 || (id)v16 == objc_msgSend(v8, "count"))
        {
          v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container", v31, v32));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = objc_msgSend(v8, "count");
            *(_DWORD *)buf = 134218496;
            v51 = v16;
            v52 = 2048;
            v53 = v17;
            v54 = 2048;
            v55 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[loadAccountStoresFromDisk] Flusing batch {idx: %ld, batch: %ld, storeURLs.count: %ld}", buf, 0x20u);
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
          v45 = 0;
          v21 = -[RDStoreController l_loadBatchOfAccountStoresFromDiskAndValidateWithStoreURLs:processedStoreIdentifiers:shouldDeleteInvalidStoresImmediately:connectionPoolMaxSize:error:](v10, "l_loadBatchOfAccountStoresFromDiskAndValidateWithStoreURLs:processedStoreIdentifiers:shouldDeleteInvalidStoresImmediately:connectionPoolMaxSize:error:", v20, v40, v37, v38, &v45);
          v22 = v45;

          v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          v24 = v23;
          if (v21)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("lastPathComponent")));
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](v10, "l_accountStoreMap"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "keyEnumerator"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allObjects"));
              *(_DWORD *)buf = 134218754;
              v51 = v17;
              v52 = 2048;
              v53 = v43;
              v54 = 2114;
              v55 = v25;
              v56 = 2114;
              v57 = v28;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] Loaded accounts from disk {batch: %ld, batchSize: %ld, urls: %{public}@, accountIdentifiers: %{public}@}", buf, 0x2Au);

              v10 = v34;
              v7 = v33;

            }
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("lastPathComponent")));
              *(_DWORD *)buf = 134218754;
              v51 = v17;
              v52 = 2048;
              v53 = v43;
              v54 = 2114;
              v55 = v29;
              v56 = 2114;
              v57 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[loadAccountStoresFromDisk] Failed to load accountStoreFromDisk. {batch: %ld, batchSize: %ld, urls: %{public}@, error: %{public}@}", buf, 0x2Au);

            }
            v35 = 0;
            v24 = v39;
            v39 = v22;
          }
          v8 = v36;

          objc_msgSend(v7, "removeAllObjects");
        }
        v9 = v15;
        ++v12;
        objc_autoreleasePoolPop(context);
        v11 = (char *)v11 + 1;
      }
      while (v42 != v11);
      v9 = (uint64_t)v11 + v15;
      v42 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v42);
  }
  else
  {
    v39 = 0;
    v35 = 1;
  }

  if (v31)
    *v31 = objc_retainAutorelease(v39);

  return v35 & 1;
}

- (BOOL)l_loadBatchOfAccountStoresFromDiskAndValidateWithStoreURLs:(id)a3 processedStoreIdentifiers:(id)a4 shouldDeleteInvalidStoresImmediately:(BOOL)a5 connectionPoolMaxSize:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  BOOL v27;
  id v28;
  void *v29;
  _BOOL4 v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  NSString *v41;
  void *v42;

  v30 = a5;
  v10 = a3;
  v11 = a4;
  v41 = NSPersistentStoreConnectionPoolMaxSizeKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6));
  v42 = v12;
  v13 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));

  v37 = 0;
  v32 = v10;
  v29 = (void *)v13;
  v27 = -[RDStoreController l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:](self, "l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:", v10, v13, 0, &v37);
  v28 = v37;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentStores"));

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
        if (v22)
        {
          if ((objc_msgSend(v11, "containsObject:", v22) & 1) == 0)
          {
            objc_msgSend(v14, "addObject:", v21);
            objc_msgSend(v11, "addObject:", v22);
          }
        }
        else
        {
          v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v21;
            _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "[loadAccountStoresFromDisk] Loaded an account store with no store identifier, can't add to store controller {store: %{public}@}", buf, 0xCu);
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v18);
  }

  v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134217984;
    v39 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] candidates stores to validate... {candidateStores.count: %ld}", buf, 0xCu);
  }

  -[RDStoreController l_addValidatedStoresToAccountStoreMapWithStores:shouldDeleteInvalidStoresImmediately:](self, "l_addValidatedStoresToAccountStoreMapWithStores:shouldDeleteInvalidStoresImmediately:", v14, v30);
  if (a7)
    *a7 = objc_retainAutorelease(v28);

  return v27;
}

- (void)l_loadDummyStoreIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStores"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _dataSeparationIncompatible_defaultReminderDataContainerURL](self, "_dataSeparationIncompatible_defaultReminderDataContainerURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController storeURLWithName:withContainerURL:](self, "storeURLWithName:withContainerURL:", CFSTR("local"), v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v27 = 0;
    v10 = -[RDStoreController l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:](self, "l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:", v9, 0, 0, &v27);
    v11 = v27;

    if ((v10 & 1) == 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100684008();

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v26 = 0;
      v14 = objc_msgSend(v13, "removeItemAtURL:error:", v7, &v26);
      v15 = v26;

      if ((v14 & 1) == 0)
      {
        v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_100683FA8();

      }
      v30 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
      v25 = v15;
      v18 = -[RDStoreController l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:](self, "l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:", v17, 0, 1, &v25);
      v19 = v25;

      if ((v18 & 1) == 0)
      {
        v20 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_100683F48();

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "persistentStoreForURL:", v7));

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
        objc_msgSend(v23, "setObject:forKey:", v22, CFSTR("local"));

        v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v22;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadDummyStoreIfNeeded] Re-created and loaded local store {store: %{public}@}", buf, 0xCu);
        }
      }
      else
      {
        v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_100683F08(v24);
      }

    }
  }
}

- (void)l_addValidatedStoresToAccountStoreMapWithStores:(id)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  _BOOL4 v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _QWORD v52[5];
  id v53;
  NSObject *v54;
  id v55;
  uint64_t *v56;
  unsigned __int8 v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  NSObject *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  id v69;
  id v70;
  uint8_t v71[128];
  uint8_t buf[4];
  _BYTE v73[18];
  __int16 v74;
  NSObject *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  uint64_t v79;
  _BYTE v80[128];

  v37 = a4;
  v69 = 0;
  v70 = 0;
  v68 = 0;
  v38 = a3;
  -[RDStoreController _validateAccountStores:outValidStoresByAccountIDs:outInvalidStores:outLocalAccountStores:](self, "_validateAccountStores:outValidStoresByAccountIDs:outInvalidStores:outLocalAccountStores:");
  v45 = v70;
  v39 = v69;
  v40 = v68;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v39));
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allKeys"));
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v65;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v5);
        v7 = objc_autoreleasePoolPush();
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", v6));
        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));

          if (v10)
          {
            v11 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.RDStoreController.addValidatedStoresToAccountStoreMapWithStores"));
            v12 = objc_msgSend(v41, "containsObject:", v8);
            v58 = 0;
            v59 = &v58;
            v60 = 0x3032000000;
            v61 = sub_1000857E8;
            v62 = sub_1000857F8;
            v13 = v8;
            v63 = v13;
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472;
            v52[2] = sub_100085800;
            v52[3] = &unk_1007DA678;
            v56 = &v58;
            v52[4] = self;
            v14 = v10;
            v53 = v14;
            v15 = v13;
            v54 = v15;
            v57 = v12;
            v16 = v11;
            v55 = v16;
            objc_msgSend(v16, "performBlockAndWait:", v52);
            v17 = v14;
            v18 = v59[5];
            if (v18 == v17)
            {
              v19 = v15;

              v18 = v59[5];
              v17 = v19;
            }
            objc_msgSend(v42, "addObject:", v18);
            v8 = v17;

            v20 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v8, "identifier"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v59[5], "identifier"));
              v27 = v59[5];
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)v73 = v6;
              *(_WORD *)&v73[8] = 2114;
              *(_QWORD *)&v73[10] = v25;
              v74 = 2112;
              v75 = v8;
              v76 = 2114;
              v77 = v26;
              v78 = 2112;
              v79 = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[addValidatedStoresToAccountStoreMapWithStores] Found duplicated stores for the same account, treating one of them as invalid {accountID: %{public}@, valid: storeid=%{public}@ %@, invalid: storeid=%{public}@ %@}", buf, 0x34u);

            }
            _Block_object_dispose(&v58, 8);

          }
          v21 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URL](v8, "URL"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)v73 = v6;
            *(_WORD *)&v73[8] = 2112;
            *(_QWORD *)&v73[10] = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[addValidatedStoresToAccountStoreMapWithStores] Adding valid store to accountStoreMap {accountID: %{public}@, store.URL: %@}", buf, 0x16u);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
          objc_msgSend(v24, "setObject:forKey:", v8, v6);

        }
        else
        {
          v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v73 = v6;
            _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[addValidatedStoresToAccountStoreMapWithStores] Impossible: Unexpected nil store from validStoresByAccountIDs map {accountID: %{public}@}", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v7);
        v5 = (char *)v5 + 1;
      }
      while (v46 != v5);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
    }
    while (v46);
  }

  if (objc_msgSend(v42, "count") && objc_msgSend(v40, "count"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v42));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v40));
    objc_msgSend(v28, "intersectSet:", v29);

    v51 = 0;
    -[RDStoreController _backupInvalidStores:outBackUpFailedStores:](self, "_backupInvalidStores:outBackUpFailedStores:", v28, &v51);
    v30 = v51;
    if (objc_msgSend(v30, "count"))
      objc_msgSend(v42, "minusSet:", v30);

  }
  if (objc_msgSend(v42, "count"))
  {
    v31 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v42, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v73 = v37;
      *(_WORD *)&v73[4] = 2048;
      *(_QWORD *)&v73[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[addValidatedStoresToAccountStoreMapWithStores] Processing invalid stores, either to delete immediately or mark as deleted {shouldDeleteInvalidStoresImmediately: %d, count: %ld}", buf, 0x12u);
    }

    if (v37)
    {
      -[RDStoreController l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:](self, "l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:", v42);
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v33 = v42;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(_QWORD *)v48 != v35)
              objc_enumerationMutation(v33);
            -[RDStoreController l_markAccountStoreDeletedAndDeleteData:deletedObjectIDs:error:](self, "l_markAccountStoreDeletedAndDeleteData:deletedObjectIDs:error:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), 0, 0);
          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
        }
        while (v34);
      }

    }
  }

}

- (void)_validateAccountStores:(id)a3 outValidStoresByAccountIDs:(id *)a4 outInvalidStores:(id *)a5 outLocalAccountStores:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  RDStoreController *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _dataSeparationIncompatible_defaultReminderDataContainerURL](self, "_dataSeparationIncompatible_defaultReminderDataContainerURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController storeURLWithName:withContainerURL:](self, "storeURLWithName:withContainerURL:", CFSTR("local"), v12));
  v14 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.RDStoreController.validateAccounts"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100085B24;
  v34[3] = &unk_1007DA6A0;
  v15 = v8;
  v35 = v15;
  v31 = v13;
  v36 = v31;
  v16 = v9;
  v37 = v16;
  v17 = v14;
  v38 = v17;
  v18 = v11;
  v39 = v18;
  v19 = v10;
  v40 = v19;
  v41 = self;
  objc_msgSend(v17, "performBlockAndWait:", v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
  v21 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v30 = v17;
    v22 = v12;
    v23 = objc_msgSend(v15, "count");
    v24 = v16;
    v25 = v18;
    v26 = v15;
    v27 = a6;
    v28 = objc_msgSend(v20, "count");
    v29 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 134218754;
    v43 = v23;
    v12 = v22;
    v17 = v30;
    v44 = 2048;
    v45 = v28;
    a6 = v27;
    v15 = v26;
    v18 = v25;
    v16 = v24;
    v46 = 2048;
    v47 = v29;
    v48 = 2114;
    v49 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[_validateAccountStores] Validate results {input.count: %ld, valid.count: %ld, invalid.count: %ld, valid.accountIDs: %{public}@}", buf, 0x2Au);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v16);
  if (a5)
    *a5 = objc_retainAutorelease(v19);
  if (a6)
    *a6 = objc_retainAutorelease(v18);

}

- (id)_deduplicateStore:(id)a3 withStore:(id)a4 isLocalAccountType:(BOOL)a5 managedObjectContext:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[RDStoreController _deduplicateLocalAccountStore:withStore:managedObjectContext:](self, "_deduplicateLocalAccountStore:withStore:managedObjectContext:", v10, v11, v12));
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v16 = objc_msgSend(v14, "caseInsensitiveCompare:", v15);

    if (v16 == (id)-1)
      v13 = v10;
    else
      v13 = v11;
  }
  v17 = v13;

  return v17;
}

- (id)_deduplicateLocalAccountStore:(id)a3 withStore:(id)a4 managedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  id v30;
  id v31;

  v7 = a3;
  v8 = a4;
  v31 = v7;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[REMChangeTracking lastTransactionTimestampWithManagedObjectContext:affectedStores:](REMChangeTracking, "lastTransactionTimestampWithManagedObjectContext:affectedStores:", v9, v10));

  v30 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[REMChangeTracking lastTransactionTimestampWithManagedObjectContext:affectedStores:](REMChangeTracking, "lastTransactionTimestampWithManagedObjectContext:affectedStores:", v9, v12));

  v14 = v8;
  v15 = v14;
  if (objc_msgSend(v11, "compare:", v13) == (id)-1)
  {
    v15 = v7;

  }
  v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v20 = 138544386;
    v21 = v15;
    v22 = 2114;
    v23 = v17;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v18;
    v28 = 2114;
    v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[_deduplicateLocalAccountStore] {storeToDrop: %{public}@, store1: {id=%{public}@, lastEdit=%{public}@}, store2: {id=%{public}@, lastEdit=%{public}@}", (uint8_t *)&v20, 0x34u);

  }
  return v15;
}

- (void)l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  unsigned int v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];

  v4 = a3;
  if (-[RDStoreController isInitializing](self, "isInitializing"))
  {
    v28 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
          v31 = 0;
          v12 = objc_msgSend(v11, "removePersistentStore:error:", v10, &v31);
          v13 = v31;

          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
          v15 = (void *)v14;
          if (v12)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (v16)
          {
            v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v37 = v15;
              v38 = 2114;
              v39 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[removeFromPersistentStoreCoordinatorAndDeleteImmediately] Failed to remove store from PSC {storeURL: %@, error: %{public}@}", buf, 0x16u);
            }
          }
          else
          {
            -[NSObject addObject:](v28, "addObject:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController accountStoreManagementDelegate](self, "accountStoreManagementDelegate"));
            objc_msgSend(v17, "didRemoveInvalidPersistentStoreOnInitWithStore:", v10);

            v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v15;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[removeFromPersistentStoreCoordinatorAndDeleteImmediately] Removed store from PSC {storeURL: %@}", buf, 0xCu);
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v7);
    }

    v29 = 0;
    v30 = 0;
    v20 = -[RDStoreController _removeFilesOfStoresAtURLs:outRemovedFileURLs:error:](self, "_removeFilesOfStoresAtURLs:outRemovedFileURLs:error:", v28, &v30, &v29);
    v21 = v30;
    v22 = v29;
    v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v25 = -[NSObject count](v28, "count");
        *(_DWORD *)buf = 134217984;
        v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[removeFromPersistentStoreCoordinatorAndDeleteImmediately] Deleted store files immeidately {count: %ld}", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_100684068();
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController accountStoreManagementDelegate](self, "accountStoreManagementDelegate"));
    objc_msgSend(v26, "didRemoveStoreFilesOnInitWithURLs:", v21);

    v4 = v27;
  }
  else
  {
    v28 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      sub_1006840C8(self, v28);
  }

}

- (void)l_performManualStoreMigrations:(id)a3
{
  id v3;
  NSString *(__cdecl **v4)(SEL);
  NSObject *v5;
  _TtC7remindd60RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels *v6;
  _TtC7remindd53RDStoreControllerMigrator_AutoConvertSharedInlineTags *v7;
  _TtC7remindd58RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts *v8;
  _TtC7remindd47RDStoreControllerMigrator_IsPinnedByCurrentUser *v9;
  _TtC7remindd73RDStoreControllerMigrator_MostRecentTargetTemplateIdentifierByCurrentUser *v10;
  void *v11;
  _TtC7remindd53RDStoreControllerMigrator_RemoveObsoleteDueDateDeltas *v12;
  _TtC7remindd50RDStoreControllerMigrator_ResetReminderCountsCache *v13;
  _TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  _BOOL4 v24;
  NSString *(__cdecl **v25)(SEL);
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  unsigned __int8 v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  _TtC7remindd56RDStoreControllerMigrator_AccountIdentifierHashtagLabels *v42;
  RDStoreControllerMigrator_RemoveOrphanedLists *v43;
  RDStoreControllerMigrator_CKParentReminderIdentifier *v44;
  id v45;
  RDStoreControllerMigrator_DisplayDate *v46;
  uint64_t v47;
  void *v48;
  RDStoreControllerMigrator_JSONProperties *v49;
  id v50;
  RDStoreControllerMigrator_PopulateDefaultValues *v51;
  RDStoreControllerMigrator_AccountIdentifierMetadata *obja;
  id obj;
  _QWORD v55[4];
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  _BYTE v71[16];
  _BYTE v72[128];
  _QWORD v73[15];

  v3 = a3;
  v4 = &NSStringFromSelector_ptr;
  v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v68 = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MIGRATE STORES] BEGIN {stores.count: %ld}", buf, 0xCu);
  }

  v45 = objc_alloc_init((Class)NSMutableArray);
  obja = objc_alloc_init(RDStoreControllerMigrator_AccountIdentifierMetadata);
  v73[0] = obja;
  v51 = objc_alloc_init(RDStoreControllerMigrator_PopulateDefaultValues);
  v73[1] = v51;
  v49 = objc_alloc_init(RDStoreControllerMigrator_JSONProperties);
  v73[2] = v49;
  v46 = objc_alloc_init(RDStoreControllerMigrator_DisplayDate);
  v73[3] = v46;
  v44 = objc_alloc_init(RDStoreControllerMigrator_CKParentReminderIdentifier);
  v73[4] = v44;
  v43 = objc_alloc_init(RDStoreControllerMigrator_RemoveOrphanedLists);
  v73[5] = v43;
  v42 = objc_alloc_init(_TtC7remindd56RDStoreControllerMigrator_AccountIdentifierHashtagLabels);
  v73[6] = v42;
  v6 = objc_alloc_init(_TtC7remindd60RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels);
  v73[7] = v6;
  v7 = objc_alloc_init(_TtC7remindd53RDStoreControllerMigrator_AutoConvertSharedInlineTags);
  v73[8] = v7;
  v8 = objc_alloc_init(_TtC7remindd58RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts);
  v73[9] = v8;
  v9 = objc_alloc_init(_TtC7remindd47RDStoreControllerMigrator_IsPinnedByCurrentUser);
  v73[10] = v9;
  v10 = objc_alloc_init(_TtC7remindd73RDStoreControllerMigrator_MostRecentTargetTemplateIdentifierByCurrentUser);
  v73[11] = v10;
  v11 = v3;
  v12 = objc_alloc_init(_TtC7remindd53RDStoreControllerMigrator_RemoveObsoleteDueDateDeltas);
  v73[12] = v12;
  v13 = objc_alloc_init(_TtC7remindd50RDStoreControllerMigrator_ResetReminderCountsCache);
  v73[13] = v13;
  v14 = objc_alloc_init(_TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders);
  v73[14] = v14;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 15));

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v63;
    v47 = *(_QWORD *)v63;
    do
    {
      v18 = 0;
      v50 = v16;
      do
      {
        if (*(_QWORD *)v63 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URL"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
        if (v20)
        {
          v22 = objc_msgSend((id)objc_opt_class(self), "isDummyStoreURL:", v20);
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4[282], "container"));
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (v22)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138412546;
              v68 = v20;
              v69 = 2114;
              v70 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "RDStoreControllerMigrator: [MIGRATE STORE] Skipping local dummy store {storeURL: %@, fileName: %{public}@}", buf, 0x16u);
            }
          }
          else
          {
            v25 = v4;
            if (v24)
            {
              *(_DWORD *)buf = 138412546;
              v68 = v20;
              v69 = 2114;
              v70 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "RDStoreControllerMigrator: [MIGRATE STORE] BEGIN {storeURL: %@, fileName: %{public}@}", buf, 0x16u);
            }

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metadata"));
            v23 = objc_msgSend(v26, "mutableCopy");

            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v27 = v48;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v59;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v59 != v30)
                    objc_enumerationMutation(v27);
                  objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), "migrateStoreIfNeeded:metadata:", v19, v23);
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
              }
              while (v29);
            }

            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metadata"));
            v33 = -[NSObject isEqualToDictionary:](v23, "isEqualToDictionary:", v32);

            if ((v33 & 1) == 0)
            {
              v34 = -[NSObject copy](v23, "copy");
              objc_msgSend(v19, "setMetadata:", v34);

              objc_msgSend(v45, "addObject:", v19);
            }
            v4 = v25;
            v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25[282], "container"));
            v17 = v47;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v68 = v20;
              v69 = 2114;
              v70 = v21;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "RDStoreControllerMigrator: [MIGRATE STORE] END {storeURL: %@, fileName: %{public}@}", buf, 0x16u);
            }

            v16 = v50;
          }
        }
        else
        {
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4[282], "container"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_10068414C((uint64_t)v71, (uint64_t)v19);
        }

        v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v45, "count"))
  {
    v36 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    objc_msgSend(v36, "setPersistentStoreCoordinator:", v37);

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100086FE4;
    v55[3] = &unk_1007D7C68;
    v56 = v36;
    v57 = v45;
    v38 = v36;
    objc_msgSend(v38, "performBlockAndWait:", v55);

  }
  v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4[282], "container"));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = objc_msgSend(v45, "count");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "valueForKey:", CFSTR("URL")));
    *(_DWORD *)buf = 134218242;
    v68 = v40;
    v69 = 2114;
    v70 = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "RDStoreControllerMigrator: [MIGRATE STORES] END {updatedStoreURLs.count: %ld, updatedStoreURLs: %{public}@}", buf, 0x16u);

  }
}

- (BOOL)_removeFilesOfStoresAtURLs:(id)a3 outRemovedFileURLs:(id *)a4 error:(id *)a5
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id *v35;
  id obj;
  void *v38;
  uint64_t v39;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];

  v35 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v47 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v5;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  v7 = 0;
  if (!v41)
  {
    v46 = 1;
    goto LABEL_43;
  }
  v46 = 1;
  v39 = *(_QWORD *)v55;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v55 != v39)
        objc_enumerationMutation(obj);
      v45 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "URLByDeletingLastPathComponent", v35));
      v43 = (void *)v9;
      v44 = v8;
      if (!v9)
      {
        v15 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v45;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[_removeFilesOfStoresAtURLs] Unexpected nil store directory URL {store.url: %@}", buf, 0xCu);
        }

        v12 = 0;
        goto LABEL_14;
      }
      v10 = (void *)v9;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", v9));
      if (v11)
      {
        v12 = v11;
        v13 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
          *(_DWORD *)buf = 138543618;
          v60 = v14;
          v61 = 2112;
          v62 = v45;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[_removeFilesOfStoresAtURLs] Obtained store directory content cached for {storeDir: %{public}@, store.url: %@}", buf, 0x16u);

        }
LABEL_14:
        v16 = v7;
        goto LABEL_15;
      }
      v53 = v7;
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v10, &__NSArray0__struct, 0, &v53));
      v16 = v53;

      v29 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      v30 = v29;
      if (v12)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
          *(_DWORD *)buf = 138543618;
          v60 = v31;
          v61 = 2112;
          v62 = v45;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[_removeFilesOfStoresAtURLs] Obtained store directory content from {storeDir: %{public}@, store.url: %@}", buf, 0x16u);

        }
        objc_msgSend(v38, "setObject:forKey:", v12, v10);
      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
          *(_DWORD *)buf = 138543874;
          v60 = v32;
          v61 = 2112;
          v62 = v45;
          v63 = 2114;
          v64 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[_removeFilesOfStoresAtURLs] Failed to get store directory content from {storeDir: %{public}@, store.url: %@, error: %{public}@}", buf, 0x20u);

        }
        v12 = 0;
      }
LABEL_15:
      v42 = (void *)v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _urlsToDeleteFromFileURLs:matchingStoreURL:](self, "_urlsToDeleteFromFileURLs:matchingStoreURL:", v12, v45));
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v50;
        v7 = v16;
        do
        {
          v21 = 0;
          v22 = v7;
          do
          {
            if (*(_QWORD *)v50 != v20)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v21);
            v48 = v22;
            v24 = objc_msgSend(v6, "removeItemAtURL:error:", v23, &v48);
            v7 = v48;

            v25 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            v26 = v25;
            if (v24)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
                *(_DWORD *)buf = 138543618;
                v60 = v27;
                v61 = 2112;
                v62 = v45;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[_removeFilesOfStoresAtURLs] Removed store file {filename: %{public}@, storeUrl: %@}", buf, 0x16u);

              }
              objc_msgSend(v47, "addObject:", v23);
            }
            else
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
                *(_DWORD *)buf = 138543874;
                v60 = v28;
                v61 = 2112;
                v62 = v45;
                v63 = 2114;
                v64 = v7;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[_removeFilesOfStoresAtURLs] Failed to remove store file at {filename: %{public}@, storeUrl: %@, error: %{public}@}", buf, 0x20u);

              }
              v46 = 0;
            }
            v21 = (char *)v21 + 1;
            v22 = v7;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v19);
      }
      else
      {
        v7 = v16;
      }

      v8 = v44 + 1;
    }
    while ((id)(v44 + 1) != v41);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    v41 = v33;
  }
  while (v33);
LABEL_43:

  if (v35)
    *v35 = objc_retainAutorelease(v47);
  if (a5)
    *a5 = objc_retainAutorelease(v7);

  return v46 & 1;
}

- (id)_urlsToDeleteFromFileURLs:(id)a3 matchingStoreURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URLByStandardizingPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v6));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v9 = (void *)v8;
  if (v5 && v8)
  {
    v20 = v6;
    v21 = v5;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14), "URLByStandardizingPath", v20, v21, (_QWORD)v22));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
          if ((objc_msgSend(v16, "hasPrefix:", v9) & 1) != 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
            v18 = objc_msgSend(v17, "isEqualToString:", v9);

            if ((v18 & 1) == 0)
              objc_msgSend(v7, "addObject:", v15);
          }
          else
          {

          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v6 = v20;
    v5 = v21;
  }

  return v7;
}

- (void)_backupInvalidStores:(id)a3 outBackUpFailedStores:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  RDStoreController *v14;
  SEL v15;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100087978;
  v11[3] = &unk_1007DA6C8;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v12 = v10;
  v13 = v8;
  v14 = self;
  v15 = a2;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  if (a4)
    *a4 = objc_retainAutorelease(v10);

}

- (void)_performStagedLightweightMigrationIfNeededForAccountStoresWithURLs:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController accountStoreManagementDelegate](self, "accountStoreManagementDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RDStagedLightweightCoreDataMigrationCoordinator createCoordinatorForMigratingReminderDataWithClientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation:](_TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator, "createCoordinatorForMigratingReminderDataWithClientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation:", v9));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15);
        v17 = objc_autoreleasePoolPush();
        -[RDStoreController _performStagedLightweightMigrationIfNeededForAccountStoreWithURL:persistentStoreDescriptionOptionsOverride:migrationCoordinator:](self, "_performStagedLightweightMigrationIfNeededForAccountStoreWithURL:persistentStoreDescriptionOptionsOverride:migrationCoordinator:", v16, v7, v10, (_QWORD)v18);
        objc_autoreleasePoolPop(v17);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (void)_performStagedLightweightMigrationIfNeededForAccountStoreWithURL:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 migrationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableSet *v14;
  NSObject *v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSMutableSet *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSMutableSet *v53;
  NSObject *v54;
  NSMutableSet *v55;
  NSObject *v56;
  id v57;
  void *v58;
  id v59;
  NSMutableSet *v60;
  NSString *(__cdecl **v61)(SEL);
  NSObject *v62;
  NSObject *v63;
  NSMutableSet *v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  NSMutableSet *v75;
  NSObject *v76;
  NSMutableSet *v77;
  NSMutableSet *v78;
  NSObject *v79;
  objc_class *v80;
  NSString *v81;
  NSString *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  NSMutableSet *v87;
  NSObject *v88;
  id v89;
  unsigned int v90;
  void *v91;
  NSMutableSet *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *log;
  id obj;
  void *v100;
  NSMutableSet *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  uint8_t v118[128];
  uint8_t buf[4];
  NSObject *v120;
  __int16 v121;
  NSMutableSet *v122;
  __int16 v123;
  NSObject *v124;
  __int16 v125;
  id v126;
  __int16 v127;
  void *v128;
  uint64_t v129;
  _QWORD v130[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v103 = v11;
  if (objc_msgSend(v11, "fileExistsAtPath:", v12)
    && objc_msgSend(v10, "shouldPerformStagedLightweightMigrationForStoreAtStoreURL:", v8))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByDeletingLastPathComponent"));
    v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByDeletingLastPathComponent"));

    if (!v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[REMLogStore stagedLightweightCoreDataMigration](REMLogStore, "stagedLightweightCoreDataMigration"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100684458();
      goto LABEL_62;
    }
    v15 = objc_claimAutoreleasedReturnValue(-[RDStoreController databaseStagedMigrationDirectoryURLWithContainerURL:](self, "databaseStagedMigrationDirectoryURLWithContainerURL:", v14));
    v115 = 0;
    v16 = objc_msgSend(v103, "rem_createDirectoryIfNecessaryAtURL:error:", v15, &v115);
    v96 = v115;
    if ((v16 & 1) == 0)
    {
      log = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class(self);
        v25 = NSStringFromClass(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v26, v28));
        v30 = v15;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "localizedDescription"));
        *(_DWORD *)buf = 138544130;
        v120 = v29;
        v121 = 2112;
        v122 = v14;
        v123 = 2112;
        v124 = v30;
        v125 = 2112;
        v126 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {reminderDataContainerURL: %@, databaseBackupDirectoryURL: %@, error: %@}", buf, 0x2Au);

        v15 = v30;
      }
      goto LABEL_61;
    }
    -[NSObject setRd_isExcludedFromBackup:](v15, "setRd_isExcludedFromBackup:", 1);
    v93 = v15;
    log = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v17 = objc_claimAutoreleasedReturnValue(-[NSObject URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:"));
    v92 = v14;
    v95 = (void *)v17;
    v90 = +[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall");
    if (v90)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[RDStoreController databaseBackupDirectoryURLWithContainerURL:](self, "databaseBackupDirectoryURLWithContainerURL:", v14));
      v114 = 0;
      v19 = objc_msgSend(v103, "rem_createDirectoryIfNecessaryAtURL:error:", v18, &v114);
      v20 = v114;
      if ((v19 & 1) == 0)
      {
        v21 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v80 = (objc_class *)objc_opt_class(self);
          v81 = NSStringFromClass(v80);
          v102 = (void *)objc_claimAutoreleasedReturnValue(v81);
          v82 = NSStringFromSelector(a2);
          v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
          v84 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v102, v83));
          v85 = v12;
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription"));
          *(_DWORD *)buf = 138544130;
          v120 = v84;
          v121 = 2112;
          v122 = v92;
          v123 = 2112;
          v124 = v18;
          v125 = 2112;
          v126 = v86;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {reminderDataContainerURL: %@, databaseBackupDirectoryURL: %@, error: %@}", buf, 0x2Au);

          v12 = v85;
          v14 = v92;

        }
      }
      -[NSObject setRd_isExcludedFromBackup:](v18, "setRd_isExcludedFromBackup:", 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController storeBackupURLWithFileName:withContainerURL:](self, "storeBackupURLWithFileName:withContainerURL:", log, v14));
      v22 = v95;
      v130[0] = v94;
      v130[1] = v95;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v130, 2));

    }
    else
    {
      v129 = v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v129, 1));
      v94 = 0;
      v22 = (void *)v17;
    }
    v91 = v12;
    v100 = v10;
    v32 = objc_claimAutoreleasedReturnValue(+[REMLogStore stagedLightweightCoreDataMigration](REMLogStore, "stagedLightweightCoreDataMigration"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      v34 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v90));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "path"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
      *(_DWORD *)buf = 138544386;
      v120 = log;
      v121 = 2112;
      v122 = v33;
      v123 = 2114;
      v124 = v34;
      v125 = 2112;
      v126 = v35;
      v127 = 2112;
      v128 = v36;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating clones of store before performing staged lightweight migration for store. {fileName: %{public}@, storeUrl: %@, isInternalInstall: %{public}@, storeBackupURL: %@, storeCloneURL: %@}", buf, 0x34u);

    }
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v37 = v23;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
    obj = v37;
    if (v38)
    {
      v39 = v38;
      v89 = v9;
      v40 = 0;
      v41 = *(_QWORD *)v111;
      v42 = v8;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v111 != v41)
            objc_enumerationMutation(obj);
          v44 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));
          if (objc_msgSend(v103, "fileExistsAtPath:", v45))
          {
            v46 = objc_alloc((Class)NSSet);
            v117 = v44;
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v117, 1));
            v48 = objc_msgSend(v46, "initWithArray:", v47);
            v109 = 0;
            -[RDStoreController _removeFilesOfStoresAtURLs:outRemovedFileURLs:error:](self, "_removeFilesOfStoresAtURLs:outRemovedFileURLs:error:", v48, 0, &v109);
            v49 = v109;

            v8 = v42;
            if (v49)
              goto LABEL_26;
          }
          v50 = objc_autoreleasePoolPush();
          v108 = 0;
          objc_msgSend(v100, "cloneStoreAtSourceStoreURL:destinationStoreURL:error:", v8, v44, &v108);
          v49 = v108;
          objc_autoreleasePoolPop(v50);
          if (v49)
          {
LABEL_26:
            v51 = objc_claimAutoreleasedReturnValue(+[REMLogStore stagedLightweightCoreDataMigration](REMLogStore, "stagedLightweightCoreDataMigration"));
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              v55 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
              v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));
              *(_DWORD *)buf = 138544130;
              v120 = log;
              v121 = 2112;
              v122 = v55;
              v123 = 2112;
              v124 = v56;
              v125 = 2114;
              v126 = v49;
              _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Failed to create clone of store before performing staged lightweight migration for store. {fileName: %{public}@, storeURL: %@, destinationStoreURL: %@, error: %{public}@}", buf, 0x2Au);

              v8 = v42;
            }

            v52 = v49;
            v40 = v52;
          }
          else
          {
            v52 = objc_claimAutoreleasedReturnValue(+[REMLogStore stagedLightweightCoreDataMigration](REMLogStore, "stagedLightweightCoreDataMigration"));
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
              v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));
              *(_DWORD *)buf = 138543874;
              v120 = log;
              v121 = 2112;
              v122 = v53;
              v123 = 2112;
              v124 = v54;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Created clone of store before performing staged lightweight migration for store. {fileName: %{public}@, storeURL: %@, destinationStoreURL: %@}", buf, 0x20u);

            }
          }

          v43 = (char *)v43 + 1;
        }
        while (v39 != v43);
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
        v39 = v57;
      }
      while (v57);

      v9 = v89;
      v10 = v100;
      v12 = v91;
      v15 = v93;
      if (v40)
        goto LABEL_60;
    }
    else
    {

      v12 = v91;
      v15 = v93;
    }
    v58 = objc_autoreleasePoolPush();
    v107 = 0;
    objc_msgSend(v10, "performStagedLightweightMigrationForStoreAtStoreURL:persistentStoreDescriptionOptionsOverride:postMigrationDataUpdatesTransactionAuthor:error:", v95, v9, RDStagedLightweightMigrationAuthor, &v107);
    v59 = v107;
    objc_autoreleasePoolPop(v58);
    v60 = objc_opt_new(NSMutableSet);
    v61 = &NSStringFromSelector_ptr;
    v62 = objc_claimAutoreleasedReturnValue(+[REMLogStore stagedLightweightCoreDataMigration](REMLogStore, "stagedLightweightCoreDataMigration"));
    v63 = v62;
    if (v59)
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
      {
        v77 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
        v78 = v60;
        v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "path"));
        *(_DWORD *)buf = 138544130;
        v120 = log;
        v121 = 2112;
        v122 = v77;
        v123 = 2112;
        v124 = v79;
        v125 = 2114;
        v126 = v59;
        _os_log_fault_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_FAULT, "Failed to perform staged lightweight migration on store clone. {fileName: %{public}@, storeURL: %@, storeCloneURL: %@, error: %{public}@}", buf, 0x2Au);

        v60 = v78;
        v61 = &NSStringFromSelector_ptr;
      }

      -[NSMutableSet addObject:](v60, "addObject:", v8);
      goto LABEL_52;
    }
    v101 = v60;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v64 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "path"));
      *(_DWORD *)buf = 138543874;
      v120 = log;
      v121 = 2112;
      v122 = v64;
      v123 = 2112;
      v124 = v65;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Performed staged lightweight migration on store clone. Will replace store with store clone. {fileName: %{public}@, storeURL: %@, storeCloneURL: %@}", buf, 0x20u);

    }
    v66 = objc_autoreleasePoolPush();
    v67 = objc_alloc((Class)NSSet);
    v116 = v8;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v116, 1));
    v69 = objc_msgSend(v67, "initWithArray:", v68);
    v106 = 0;
    -[RDStoreController _removeFilesOfStoresAtURLs:outRemovedFileURLs:error:](self, "_removeFilesOfStoresAtURLs:outRemovedFileURLs:error:", v69, 0, &v106);
    v70 = v106;

    objc_autoreleasePoolPop(v66);
    if (v70
      || (v105 = 0,
          objc_msgSend(v10, "cloneStoreAtSourceStoreURL:destinationStoreURL:error:", v95, v8, &v105),
          (v70 = v105) != 0))
    {
      v71 = objc_claimAutoreleasedReturnValue(+[REMLogStore stagedLightweightCoreDataMigration](REMLogStore, "stagedLightweightCoreDataMigration"));
      v15 = v93;
      v60 = v101;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
      {
        v87 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
        v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "path"));
        *(_DWORD *)buf = 138544130;
        v120 = log;
        v121 = 2112;
        v122 = v87;
        v123 = 2112;
        v124 = v88;
        v125 = 2114;
        v126 = v70;
        _os_log_fault_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_FAULT, "Failed to replace store with store clone. {fileName: %{public}@, storeURL: %@, storeCloneURL: %@, error: %{public}@}", buf, 0x2Au);

        v15 = v93;
        v60 = v101;
      }

      v61 = &NSStringFromSelector_ptr;
      if ((v90 & 1) != 0)
        goto LABEL_51;
    }
    else
    {
      v15 = v93;
      v61 = &NSStringFromSelector_ptr;
      v60 = v101;
    }
    -[NSMutableSet addObject:](v60, "addObject:", v95);
LABEL_51:

LABEL_52:
    if (-[NSMutableSet count](v60, "count"))
    {
      v104 = 0;
      -[RDStoreController _removeFilesOfStoresAtURLs:outRemovedFileURLs:error:](self, "_removeFilesOfStoresAtURLs:outRemovedFileURLs:error:", v60, 0, &v104);
      v72 = v104;
      v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61[282], "stagedLightweightCoreDataMigration"));
      v74 = v73;
      if (v72)
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          sub_1006844C8();
      }
      else if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        v75 = v60;
        v76 = objc_claimAutoreleasedReturnValue(-[NSMutableSet valueForKey:](v60, "valueForKey:", CFSTR("lastPathComponent")));
        *(_DWORD *)buf = 138543618;
        v120 = v76;
        v121 = 2112;
        v122 = v75;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Deleted stores. {storeFileNamesToDelete: %{public}@, storeURLsToDelete: %@}", buf, 0x16u);

        v60 = v75;
      }

    }
    v40 = 0;
LABEL_60:

    v14 = v92;
LABEL_61:

LABEL_62:
  }

}

- (unint64_t)_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:(unint64_t)a3
{
  unint64_t v4;
  NSObject *v5;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;

  if (a3 >= 5)
    v4 = 2;
  else
    v4 = 3;
  v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134218240;
    v8 = a3;
    v9 = 2048;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount] {totalStoreCount: %ld, result: %ld}", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (NSArray)validPersistentStores
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000857E8;
  v10 = sub_1000857F8;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  os_unfair_lock_lock(&self->_ivarLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100089030;
  v5[3] = &unk_1007D9B40;
  v5[4] = self;
  v5[5] = &v6;
  sub_100089030((uint64_t)v5);
  os_unfair_lock_unlock(&self->_ivarLock);
  v3 = objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)accountIdentifierForStoreID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_ivarLock;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000857E8;
  v16 = sub_1000857F8;
  v17 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100089244;
  v9[3] = &unk_1007D7FB0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  sub_100089244((uint64_t)v9);
  os_unfair_lock_unlock(p_ivarLock);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)storesForAccountTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  RDStoreController *v19;
  id v20;
  id v21;
  const __CFString *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount fetchRequest](REMCDAccount, "fetchRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type IN %@"), v4));
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(v6, "setResultType:", 2);
  objc_msgSend(v6, "setReturnsDistinctResults:", 1);
  v22 = CFSTR("identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  objc_msgSend(v6, "setPropertiesToFetch:", v8);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100089588;
  v16[3] = &unk_1007D8500;
  v17 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.RDStoreController.storesForAccounts"));
  v18 = v6;
  v19 = self;
  v9 = v5;
  v20 = v9;
  v21 = v4;
  v10 = v4;
  v11 = v6;
  v12 = v17;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v13 = v21;
  v14 = v9;

  return v14;
}

+ (id)persistentStoreOptions
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089870;
  block[3] = &unk_1007D9EE0;
  block[4] = a1;
  if (qword_1008528A0 != -1)
    dispatch_once(&qword_1008528A0, block);
  return (id)qword_100852898;
}

- (BOOL)createAccountStoresWithIdentifiers:(id)a3 didAddNewStores:(BOOL *)a4 error:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_ivarLock;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000857E8;
  v22 = sub_1000857F8;
  v23 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100089B50;
  v13[3] = &unk_1007DA6F0;
  v15 = &v24;
  v13[4] = self;
  v10 = v8;
  v16 = &v18;
  v17 = a4;
  v14 = v10;
  sub_100089B50(v13);
  os_unfair_lock_unlock(p_ivarLock);

  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v11 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

- (BOOL)l_createAccountStoresWithIdentifiers:(id)a3 didAddNewStores:(BOOL *)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned __int8 v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  NSObject *v49;
  BOOL v50;
  NSObject *v51;
  id v53;
  unsigned __int8 v54;
  NSObject *v55;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  NSString *v74;
  void *v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  NSObject *v79;
  __int16 v80;
  unint64_t v81;
  _BYTE v82[128];

  v6 = a3;
  if (-[RDStoreController hasPassedBuddyAndSystemDataMigrator](self, "hasPassedBuddyAndSystemDataMigrator"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[RDStoreController appleAccountUtilities](self, "appleAccountUtilities"));
    v8 = -[NSObject unsafeUntilSystemReady_allICloudACAccounts](v7, "unsafeUntilSystemReady_allICloudACAccounts");
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138543618;
      v77 = v6;
      v78 = 2112;
      v79 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Attempt to create new store before buddy/system-data-migrator is passed, stores are ALWAYS stored into default container path {accountIdentifiers: %{public}@, callStack: %@}", buf, 0x16u);

    }
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v6, "count")));
  v10 = objc_alloc_init((Class)NSMutableArray);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  v60 = v10;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v15));

        if (v17)
        {
          v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v77 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[createAccountStoresWithIdentifiers] Identifier already loaded -- skipping {identifier: %{public}@}", buf, 0xCu);
          }
        }
        else
        {
          v18 = objc_claimAutoreleasedReturnValue(-[RDStoreController _reminderDataContainerURLForAccountIdentifier:](self, "_reminderDataContainerURLForAccountIdentifier:", v15));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController storeURLWithName:withContainerURL:](self, "storeURLWithName:withContainerURL:", v20, v18));

          v22 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v77 = v15;
            v78 = 2112;
            v79 = v18;
            v80 = 2112;
            v81 = (unint64_t)v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Path to create account store {accountIdentifier: %{public}@, reminderDataContainerURL: %@, storeURL: %@}", buf, 0x20u);
          }

          objc_msgSend(v62, "setObject:forKeyedSubscript:", v15, v21);
          v10 = v60;
          objc_msgSend(v60, "addObject:", v15);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v10, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
    v24 = objc_msgSend(v23, "count");

    v25 = -[RDStoreController _persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:](self, "_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:", (char *)v24 + (_QWORD)objc_msgSend(v10, "count"));
    v26 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134218496;
      v77 = v27;
      v78 = 2048;
      v79 = v24;
      v80 = 2048;
      v81 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Add persistentStores BEGIN {identifiersToAdd.count: %ld, accountStoreMap.count: %ld, connectionPoolMaxSize: %ld}", buf, 0x20u);
    }

    v74 = NSPersistentStoreConnectionPoolMaxSizeKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25));
    v75 = v28;
    v29 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "allKeys"));
    v68 = 0;
    v55 = v29;
    v54 = -[RDStoreController l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:](self, "l_createOrLoadAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:isCreatingStores:error:", v30, v29, 1, &v68);
    v53 = v68;

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "persistentStores"));

    v59 = v32;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v65;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(v59);
          v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v36);
          v38 = objc_autoreleasePoolPush();
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "URL"));
          if (v39)
          {
            v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", v39));
            if (v40)
            {
              v41 = (void *)v40;
              v63 = 0;
              v42 = -[RDStoreController l_setAccountIdentifier:intoMetadataOfCreatedStore:error:](self, "l_setAccountIdentifier:intoMetadataOfCreatedStore:error:", v40, v37, &v63);
              v43 = v63;
              if ((v42 & 1) == 0)
              {
                v44 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v77 = v41;
                  v78 = 2112;
                  v79 = v43;
                  v80 = 2112;
                  v81 = (unint64_t)v37;
                  _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[createAccountStoresWithIdentifiers] Failed to set account identifier into metata {identifier: %{public}@, error: %@, store: %@}", buf, 0x20u);
                }

              }
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
              objc_msgSend(v45, "setObject:forKey:", v37, v41);

              objc_msgSend(v58, "addObject:", v37);
            }
          }

          objc_autoreleasePoolPop(v38);
          v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      }
      while (v34);
    }

    v46 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
      v48 = objc_msgSend(v47, "count");
      v49 = objc_msgSend(v58, "count");
      *(_DWORD *)buf = 134218498;
      v77 = v48;
      v78 = 2048;
      v79 = v49;
      v80 = 2114;
      v81 = (unint64_t)v53;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Add persistentStores END {accountStoreMap.count: %ld, newStores.count: %ld, lastError: %{public}@}", buf, 0x20u);

    }
    -[RDStoreController l_performManualStoreMigrations:](self, "l_performManualStoreMigrations:", v58);
    v10 = v60;
    if (a5)
      *a5 = objc_retainAutorelease(v53);
    v50 = v54;
    if (a4)
      *a4 = 1;

    v51 = v55;
  }
  else
  {
    v51 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] No account is missing. No need to load missing accounts", buf, 2u);
    }
    v50 = 1;
  }

  return v50;
}

- (BOOL)l_createOrLoadAccountStoresWithURLs:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 isCreatingStores:(BOOL)a5 error:(id *)a6
{
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  char *v37;
  id v38;
  uint64_t v39;
  void *k;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  BOOL v50;
  id v53;
  id v55;
  id v56;
  char *aSelectora;
  id obj;
  id obja;
  void *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _BYTE *v66;
  uint64_t *v67;
  uint64_t *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  char v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90[128];
  uint8_t v91[4];
  uint64_t v92;
  __int16 v93;
  id v94;
  __int16 v95;
  id v96;
  uint8_t v97[128];
  _BYTE buf[24];
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  void *v103;
  _BYTE v104[128];

  v7 = a3;
  v55 = a4;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v87 != v9)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i), "URLByDeletingLastPathComponent"));
        v85 = 0;
        v12 = objc_msgSend(v62, "rem_createDirectoryIfNecessaryAtURL:error:", v11, &v85);
        v13 = v85;
        if ((v12 & 1) == 0)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = (objc_class *)objc_opt_class(self);
            v16 = NSStringFromClass(v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            v18 = NSStringFromSelector(a2);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v17, v19));
            v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v11;
            *(_WORD *)&buf[22] = 2112;
            v99 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {directoryURL: %@, error: %@}", buf, 0x20u);

          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
    }
    while (v8);
  }

  v22 = objc_alloc((Class)NSMutableDictionary);
  v23 = objc_msgSend((id)objc_opt_class(self), "persistentStoreOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  aSelectora = (char *)objc_msgSend(v22, "initWithDictionary:", v24);

  if (v55)
    objc_msgSend(aSelectora, "addEntriesFromDictionary:", v55);
  v53 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", aSelectora);
  v102 = NSPersistentHistoryTrackingEntitiesToInclude;
  v103 = &__NSArray0__struct;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
  objc_msgSend(v53, "setObject:forKeyedSubscript:", v25, NSPersistentHistoryTrackingKey);

  -[RDStoreController _performStagedLightweightMigrationIfNeededForAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:](self, "_performStagedLightweightMigrationIfNeededForAccountStoresWithURLs:persistentStoreDescriptionOptionsOverride:", obj, v53);
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v99 = sub_1000857E8;
  v100 = sub_1000857F8;
  v101 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v56 = obj;
  v26 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
  if (v26)
  {
    obja = *(id *)v74;
    while (2)
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(id *)v74 != obja)
          objc_enumerationMutation(v56);
        v28 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "persistentStores"));
        v31 = objc_msgSend(v30, "count");

        if ((unint64_t)v31 >= 0xF)
        {
          if (!a5)
          {
            v47 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              sub_1006845CC();

            *((_BYTE *)v82 + 24) = 0;
            v48 = objc_claimAutoreleasedReturnValue(+[REMError tooManyLoadedStoresError](REMError, "tooManyLoadedStoresError"));
            v49 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v48;

            goto LABEL_41;
          }
          v32 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v91 = 134218240;
            v92 = 15;
            v93 = 2048;
            v94 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "[createOrLoadAccountStores] WARNING We are now loading more stores than the maximum limit. Allowed though because we have passed the initial load-from-disk stage. {limit: %ld, loaded.count: %ld}", v91, 0x16u);
          }

        }
        v33 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
          *(_DWORD *)v91 = 138543874;
          v92 = (uint64_t)v34;
          v93 = 2112;
          v94 = v28;
          v95 = 2114;
          v96 = v55;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[createOrLoadAccountStores] Will add store {fileName: %{public}@, storeURL: %@, optionsOverride: %{public}@}", v91, 0x20u);

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentStoreDescription persistentStoreDescriptionWithURL:](NSPersistentStoreDescription, "persistentStoreDescriptionWithURL:", v28));
        objc_msgSend(v36, "setType:", NSSQLiteStoreType);
        objc_msgSend(v36, "setShouldMigrateStoreAutomatically:", 1);
        objc_msgSend(v36, "setShouldInferMappingModelAutomatically:", 1);
        objc_msgSend(v36, "setConfiguration:", 0);
        objc_msgSend(v36, "setOption:forKey:", &off_100804818, NSPersistentStoreConnectionPoolMaxSizeKey);
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v37 = aSelectora;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v70;
          do
          {
            for (k = 0; k != v38; k = (char *)k + 1)
            {
              if (*(_QWORD *)v70 != v39)
                objc_enumerationMutation(v37);
              v41 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)k);
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v41));
              objc_msgSend(v36, "setOption:forKey:", v42, v41);

            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
          }
          while (v38);
        }

        objc_msgSend(v36, "setShouldAddStoreAsynchronously:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_10008AC74;
        v63[3] = &unk_1007DA718;
        v44 = v36;
        v64 = v44;
        v45 = v35;
        v65 = v45;
        v66 = buf;
        v67 = &v81;
        v68 = &v77;
        objc_msgSend(v43, "addPersistentStoreWithDescription:completionHandler:", v44, v63);

        if (-[RDStoreController supportsCoreSpotlightIndexing](self, "supportsCoreSpotlightIndexing"))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](self, "coreSpotlightDelegateManager"));
          objc_msgSend(v46, "createAndAttachCoreSpotlightDelegateForStoreWithDescription:", v44);

        }
      }
      v26 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
      if (v26)
        continue;
      break;
    }
  }
LABEL_41:

  if (-[RDStoreController isInitializing](self, "isInitializing") && *((_BYTE *)v78 + 24))
    -[RDStoreController setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:](self, "setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:", 1);
  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v50 = *((_BYTE *)v82 + 24) != 0;
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v81, 8);
  return v50;
}

- (BOOL)l_setAccountIdentifier:(id)a3 intoMetadataOfCreatedStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v10 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", RDStoreControllerCreateAccountStoreAuthor);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008AF68;
  v15[3] = &unk_1007DA740;
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v17 = v12;
  v19 = &v21;
  v13 = v10;
  v18 = v13;
  v20 = a5;
  objc_msgSend(v13, "performBlockAndWait:", v15);
  LOBYTE(a5) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)a5;
}

- (void)l_activateCoreSpotlightDelegates
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](self, "coreSpotlightDelegateManager"));
  objc_msgSend(v2, "activateCoreSpotlightDelegates");

}

- (BOOL)removeAccountStoresWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1000857E8;
  v29 = sub_1000857F8;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000857E8;
  v19 = sub_1000857F8;
  v20 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008B1FC;
  v10[3] = &unk_1007DA768;
  v12 = &v21;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v13 = &v25;
  v14 = &v15;
  sub_10008B1FC(v10);
  os_unfair_lock_unlock(&self->_ivarLock);

  if (v26[5])
    -[RDStoreController _postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:](self, "_postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:");
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v8;
}

- (BOOL)l_removeAccountStoresWithIdentifiers:(id)a3 deletedObjectIDs:(id *)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  unsigned int v16;
  id v17;
  void *v18;
  NSObject *v19;
  id *v21;
  id *v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v21 = a4;
  v22 = a5;
  v6 = a3;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v25 = 0;
    v26 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap", v21, v22));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138543618;
            v34 = v11;
            v35 = 2112;
            v36 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[removeAccountStoresWithIdentifiers] Going to remove store for account {accountIdentifier: %{public}@, store: %@}", buf, 0x16u);
          }

          v27 = v9;
          v28 = 0;
          v16 = -[RDStoreController l_markAccountStoreDeletedAndDeleteData:deletedObjectIDs:error:](self, "l_markAccountStoreDeletedAndDeleteData:deletedObjectIDs:error:", v13, &v28, &v27);
          v14 = v28;
          v17 = v27;

          if (v16)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
            objc_msgSend(v18, "removeObjectForKey:", v11);

            v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v34 = v11;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[removeAccountStoresWithIdentifiers] Successfully removed store for account {accountIdentifier: %{public}@}", buf, 0xCu);
            }
          }
          else
          {
            ++v25;
            v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v34 = v11;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[removeAccountStoresWithIdentifiers] Failed to remove store for account {accountIdentifier: %{public}@}", buf, 0xCu);
            }
          }

          if (v14)
            objc_msgSend(v23, "addObjectsFromArray:", v14);
          v9 = v17;
        }
        else if (v15)
        {
          *(_DWORD *)buf = 138543362;
          v34 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[removeAccountStoresWithIdentifiers] Tried to remove store for unknown account -- skipping {accountIdentifier: %{public}@}", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v8);
  }
  else
  {
    v25 = 0;
    v9 = 0;
  }

  if (objc_msgSend(v23, "count"))
    -[RDStoreController l_invalidateAccountStorageCaches:](self, "l_invalidateAccountStorageCaches:", CFSTR("removeAccountStoresWithIdentifiers"));
  if (v21)
    *v21 = objc_retainAutorelease(v23);
  if (v22)
    *v22 = objc_retainAutorelease(v9);

  return v25 == 0;
}

- (BOOL)l_markAccountStoreDeletedAndDeleteData:(id)a3 deletedObjectIDs:(id *)a4 error:(id *)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  id v25;
  unsigned __int8 v26;
  id v27;
  unsigned __int8 v28;
  NSObject *v29;
  void *v30;
  uint64_t *v31;
  BOOL v32;
  void *v34;
  char v35;
  void *v37;
  void *v38;
  id v39;
  RDStoreController *v40;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  __int128 *p_buf;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t v67[4];
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  _BYTE v73[128];
  id v74;
  __int128 buf;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;

  v6 = a3;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = sub_1000857E8;
  v65 = sub_1000857F8;
  v66 = 0;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v40 = self;
  v7 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", RDStoreControllerDeleteAccountStoreAuthor);
  v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Marking account store as deleted {store: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v76 = 0x3032000000;
  v77 = sub_1000857E8;
  v78 = sub_1000857F8;
  v79 = 0;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10008BD80;
  v56[3] = &unk_1007DA790;
  v44 = v6;
  v57 = v44;
  p_buf = &buf;
  v58 = v7;
  v60 = &v61;
  v42 = v58;
  objc_msgSend(v58, "performBlockAndWait:", v56);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40)
    && (v9 = objc_alloc((Class)NSUUID),
        (v39 = objc_msgSend(v9, "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))) != 0))
  {
    v35 = 0;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1006846AC((uint64_t)&buf + 8, (uint64_t)v44, v10);

    v39 = 0;
    v35 = 1;
  }
  if (-[RDStoreController supportsCoreSpotlightIndexing](v40, "supportsCoreSpotlightIndexing"))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 138412290;
      v68 = v44;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Deleting spotlight indices {store: %@}", v67, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](v40, "coreSpotlightDelegateManager"));
    v74 = v44;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v74, 1));
    objc_msgSend(v12, "stopCoreSpotlightDelegatesForStores:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](v40, "coreSpotlightDelegateManager"));
    objc_msgSend(v14, "deleteIndicesForStore:", v44);

  }
  if (a4)
    v43 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  else
    v43 = 0;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "managedObjectModel"));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "entities"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v20 = objc_autoreleasePoolPush();
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superentity"));
          v23 = v22 == 0;

          if (v23)
          {
            v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v67 = 138412546;
              v68 = v21;
              v69 = 2112;
              v70 = v44;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Going to delete objects for entity {entity: %@, store: %@}", v67, 0x16u);
            }

            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_10008BE9C;
            v46[3] = &unk_1007D87F0;
            v47 = v21;
            v48 = v44;
            v25 = v42;
            v49 = v25;
            v51 = &v61;
            v50 = v43;
            objc_msgSend(v25, "performBlockAndWait:", v46);

          }
        }

        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
    }
    while (v16);
  }

  if (!v62[5])
  {
    if ((v35 & 1) == 0)
    {
      v45 = 0;
      v26 = -[RDStoreController purgeFilesForAccountWithAccountID:error:](v40, "purgeFilesForAccountWithAccountID:error:", v39, &v45);
      v27 = v45;
      if (v27)
        v28 = 0;
      else
        v28 = v26;
      if ((v28 & 1) != 0)
      {
        v29 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v67 = 138543618;
          v68 = v39;
          v69 = 2112;
          v70 = v44;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Purged account files for {accountID: %{public}@, store: %@}", v67, 0x16u);
        }
      }
      else
      {
        v29 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v62[5], "localizedDescription"));
          *(_DWORD *)v67 = 138412802;
          v68 = v34;
          v69 = 2114;
          v70 = v39;
          v71 = 2112;
          v72 = v44;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[markAccountStoreDeleted] Errors purging account files {error: %@, accountID: %{public}@, store: %@}", v67, 0x20u);

        }
      }

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController accountStoreManagementDelegate](v40, "accountStoreManagementDelegate"));
    objc_msgSend(v30, "didMarkForDeletingOnNextLanuchWithPersistentStore:deletedObjectIDs:", v44, v43);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v43);
  v31 = v62;
  if (a5)
  {
    *a5 = objc_retainAutorelease((id)v62[5]);
    v31 = v62;
  }
  v32 = v31[5] == 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v61, 8);

  return v32;
}

- (void)_postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  id v8;

  if (a3)
  {
    v7 = NSDeletedObjectIDsKey;
    v8 = a3;
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));

    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("RDStoreControllerDidRemoveAccountStoresNotification"), self, v5);
  }
}

- (id)fileIOWorkerQueue
{
  if (qword_1008528B0 != -1)
    dispatch_once(&qword_1008528B0, &stru_1007DA7B0);
  return (id)qword_1008528A8;
}

- (id)URLForAttachmentDirectory:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForAttachmentDirectory:accountID:", v7, v6));

  return v9;
}

- (id)URLForAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLForAttachmentFile:accountID:fileName:sha512Sum:", v13, v12, v11, v10));

  return v15;
}

- (id)extractSha512Sum:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v6 = objc_msgSend((id)objc_opt_class(v5), "extractSha512Sum:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)updateAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6 fileURL:(id)a7 keepSource:(BOOL)a8 error:(id *)a9
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v9 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  LOBYTE(v9) = objc_msgSend(v20, "updateAttachmentFile:accountID:fileName:sha512Sum:fileURL:keepSource:error:", v19, v18, v17, v16, v15, v9, a9);

  return v9;
}

- (BOOL)purgeFilesForAccountWithAccountID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  LOBYTE(a4) = objc_msgSend(v7, "purgeFilesForAccountWithAccountID:error:", v6, a4);

  return (char)a4;
}

- (id)purgeAttachmentFilesWithAttachmentIDs:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "purgeAttachmentFilesWithAttachmentIDs:accountID:error:", v9, v8, a5));

  return v11;
}

- (id)purgeAttachmentFilesWithSha512SumsAndExtensions:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "purgeAttachmentFilesWithSha512SumsAndExtensions:accountID:error:", v9, v8, a5));

  return v11;
}

- (id)attachmentIDsFromAttachmentDirectoryWithAccountID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController attachmentFileManager](self, "attachmentFileManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachmentIDsFromAttachmentDirectoryWithAccountID:error:", v6, a4));

  return v8;
}

- (void)reindexAllSearchableItems
{
  os_unfair_lock_s *p_ivarLock;
  void *v4;

  if (-[RDStoreController supportsCoreSpotlightIndexing](self, "supportsCoreSpotlightIndexing"))
  {
    p_ivarLock = &self->_ivarLock;
    os_unfair_lock_lock(&self->_ivarLock);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](self, "coreSpotlightDelegateManager"));
    objc_msgSend(v4, "reindexAllSearchableItems");

    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  void *v5;
  id v6;

  v6 = a3;
  if (-[RDStoreController supportsCoreSpotlightIndexing](self, "supportsCoreSpotlightIndexing"))
  {
    p_ivarLock = &self->_ivarLock;
    os_unfair_lock_lock(&self->_ivarLock);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](self, "coreSpotlightDelegateManager"));
    objc_msgSend(v5, "reindexSearchableItemsWithIdentifiers:", v6);

    os_unfair_lock_unlock(p_ivarLock);
  }

}

- (BOOL)invalidateStoreConnectionsWithError:(id *)a3
{
  _BOOL4 v5;
  _QWORD v7[6];

  v5 = -[RDStoreController isolated](self, "isolated");
  if (v5)
  {
    os_unfair_lock_lock(&self->_ivarLock);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008C858;
    v7[3] = &unk_1007D9438;
    v7[4] = self;
    v7[5] = a3;
    sub_10008C858((uint64_t)v7);
    os_unfair_lock_unlock(&self->_ivarLock);
    LOBYTE(v5) = a3 == 0;
  }
  return v5;
}

- (void)requestFreeSpaceToLoadAccountStoresWithQueue:(id)a3 completionBlock:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  id v31;
  unsigned int v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  unint64_t v48;
  _QWORD block[4];
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  unint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  id v64;
  NSURLResourceKey v65;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _dataSeparationIncompatible_defaultReminderDataContainerURL](self, "_dataSeparationIncompatible_defaultReminderDataContainerURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController databaseDirectoryURLWithContainerURL:](self, "databaseDirectoryURLWithContainerURL:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v65 = NSURLFileSizeKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
  v57 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, v11, 1, &v57));
  v13 = v57;

  v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
    v17 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138478339;
    v60 = (unint64_t)v16;
    v61 = 2048;
    v62 = (uint64_t)v17;
    v63 = 2112;
    v64 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[RDStoreController requestFreeSpaceToLoadAccountStores] Files from URL {url: %{private}@, count: %ld, error: %@}", buf, 0x20u);

    v6 = v15;
  }

  if (v12)
  {
    v18 = objc_msgSend((id)objc_opt_class(self), "storeFileNameWithStoreName:", CFSTR("local"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v20 = v12;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v21)
    {
      v22 = v21;
      v41 = v12;
      v42 = v10;
      v43 = v9;
      v44 = v8;
      v45 = v7;
      v46 = v6;
      v48 = 0;
      v23 = *(_QWORD *)v54;
      v47 = v19;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v54 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pathExtension", v41, v42, v43, v44, v45, v46));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lowercaseString"));
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("sqlite"));

          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastPathComponent"));
            v30 = v29;
            if (v29
              && objc_msgSend(v29, "hasPrefix:", CFSTR("Data-"))
              && (objc_msgSend(v30, "isEqualToString:", v19) & 1) == 0)
            {
              v51 = 0;
              v52 = 0;
              v32 = objc_msgSend(v25, "getResourceValue:forKey:error:", &v52, NSURLFileSizeKey, &v51);
              v33 = v52;
              v31 = v51;

              if (!v32 || !v33)
              {
                v34 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastPathComponent"));
                  *(_DWORD *)buf = 138543618;
                  v60 = (unint64_t)v37;
                  v61 = 2114;
                  v62 = (uint64_t)v31;
                  _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "[RDStoreController requestFreeSpaceToLoadAccountStores] Failed to get file size {file: %{public}@, error: %{public}@}", buf, 0x16u);

                }
              }
              v35 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastPathComponent"));
                *(_DWORD *)buf = 138412546;
                v60 = (unint64_t)v36;
                v61 = 2112;
                v62 = (uint64_t)v33;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[RDStoreController requestFreeSpaceToLoadAccountStores] File size is {file: %@, size: %@}", buf, 0x16u);

              }
              v48 += objc_msgSend(v33, "unsignedIntValue");

              v19 = v47;
            }
            else
            {
              v31 = v13;
            }

            v13 = v31;
          }
          v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        v38 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        v22 = v38;
      }
      while (v38);

      if (v48)
      {
        v39 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        v7 = v45;
        v6 = v46;
        v9 = v43;
        v8 = v44;
        v12 = v41;
        v10 = v42;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v60 = v48 << (v48 < 0x7FFFFFFFFFFFFFFFLL);
          v61 = 2048;
          v62 = 2;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[RDStoreController requestFreeSpaceToLoadAccountStores] Trying to request free space (multiplied) {space: %llu, multiplier: %llu}", buf, 0x16u);
        }

        +[RDDiskSpaceUtils requestFreeSpace:atPath:effortLevel:queue:completionBlock:](RDDiskSpaceUtils, "requestFreeSpace:atPath:effortLevel:queue:completionBlock:", v48 << (v48 < 0x7FFFFFFFFFFFFFFFLL), v43, 1, v46, v45);
        goto LABEL_35;
      }
      v7 = v45;
      v6 = v46;
      v9 = v43;
      v8 = v44;
      v12 = v41;
      v10 = v42;
    }
    else
    {

    }
  }
  v40 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[RDStoreController requestFreeSpaceToLoadAccountStores] Aborted requesting free space, dispatch to call completion directly", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CE90;
  block[3] = &unk_1007D8118;
  v50 = v7;
  dispatch_async(v6, block);

LABEL_35:
}

- (BOOL)notificationContainsInternalChangesOnly:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudContext](self, "cloudContext"));
  v6 = objc_msgSend(v5, "notificationContainsCloudContextInternalChangesOnly:", v4);

  if ((v6 & 1) != 0)
    v7 = 1;
  else
    v7 = -[RDStoreController notificationContainsChangeTrackingChangesOnly:](self, "notificationContainsChangeTrackingChangesOnly:", v4);

  return v7;
}

- (BOOL)notificationContainsChangeTrackingChangesOnly:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = NSManagedObjectContextTransactionAuthorKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  v6 = objc_opt_class(NSString);
  v7 = REMDynamicCast(v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "isEqualToString:", REMNSPersistentHistoryTrackingAuthor);
  else
    v10 = 0;

  return v10;
}

- (void)startObservingCloudKitNetworkActivityWithObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudKitNetworkActivityObservers](self, "cloudKitNetworkActivityObservers"));
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudKitNetworkActivityObservers](self, "cloudKitNetworkActivityObservers"));
    objc_msgSend(v6, "addObject:", v9);

    objc_sync_exit(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudContext](self, "cloudContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "hasPendingOperations")));

    -[RDStoreController _notifyCloudKitNetworkActivityObservers:](self, "_notifyCloudKitNetworkActivityObservers:", v8);
    v4 = v9;
  }

}

- (void)_cleanUpCloudKitNetworkActivityObservers
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudKitNetworkActivityObservers](self, "cloudKitNetworkActivityObservers", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isObsolete"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudKitNetworkActivityObservers](self, "cloudKitNetworkActivityObservers"));
          objc_msgSend(v10, "removeObject:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_notifyCloudKitNetworkActivityObservers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudKitNetworkActivityObservers](self, "cloudKitNetworkActivityObservers"));
  objc_sync_enter(v5);
  -[RDStoreController _cleanUpCloudKitNetworkActivityObservers](self, "_cleanUpCloudKitNetworkActivityObservers");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudKitNetworkActivityObservers](self, "cloudKitNetworkActivityObservers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "updateNetworkActivityWithValue:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)cloudContextHasPendingOperationsDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _UNKNOWN **v11;
  _UNKNOWN **v12;

  v4 = a3;
  v5 = objc_opt_class(NSNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("operationCount")));
  v8 = REMDynamicCast(v5, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)v9;
  v11 = &off_100804830;
  if (v9)
    v11 = (_UNKNOWN **)v9;
  v12 = v11;

  -[RDStoreController _notifyCloudKitNetworkActivityObservers:](self, "_notifyCloudKitNetworkActivityObservers:", v12);
}

- (void)cloudContext:(id)a3 didFetchUserRecord:(id)a4 accountID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didFetchUserRecord: %@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008D514;
  v13[3] = &unk_1007D7CE0;
  v14 = v7;
  v15 = v8;
  v16 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.RDStoreController.ckFetchUser"));
  v10 = v16;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "performBlockAndWait:", v13);

}

- (void)cloudContext:(id)a3 receivedZoneNotFound:(id)a4 accountID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
    *(_DWORD *)buf = 138543618;
    v18 = v10;
    v19 = 2114;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received an error that a zone (%{public}@) wasn't found. Re-uploading everything for that zone for accountID %{public}@.", buf, 0x16u);

  }
  if (v8)
  {
    v11 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.RDStoreController.ckZoneNotFound"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008D740;
    v13[3] = &unk_1007D7CE0;
    v14 = v7;
    v15 = v8;
    v16 = v11;
    v12 = v11;
    -[NSObject performBlock:](v12, "performBlock:", v13);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100684804(v7, v12);
  }

}

- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Shared zone was deleted for account ID %{public}@: %{public}@", buf, 0x16u);

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008DA44;
  v14[3] = &unk_1007D7CE0;
  v15 = v7;
  v16 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.RDStoreController.ckSharedZoneWasDeleted"));
  v17 = v8;
  v11 = v8;
  v12 = v16;
  v13 = v7;
  objc_msgSend(v12, "performBlockAndWait:", v14);

}

- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  RDStoreController *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "userDidDeleteRecordZoneWithID: %{public}@, accountID:%{public}@", buf, 0x16u);
  }

  if (!v8)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100684884(v7, v13);
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext appZoneID](ICCloudContext, "appZoneID"));
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    v12 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.RDStoreController.ckDeleteZone"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008DED8;
    v14[3] = &unk_1007D7CE0;
    v15 = v8;
    v16 = v12;
    v17 = self;
    v13 = v12;
    -[NSObject performBlockAndWait:](v13, "performBlockAndWait:", v14);

LABEL_8:
  }

}

- (BOOL)deleteCloudObjectIfFullyPushed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) != 0)
  {
LABEL_14:
    v14 = 1;
    goto LABEL_20;
  }
  if ((objc_msgSend(v4, "hasSuccessfullyPushedLatestVersionToCloud") & 1) != 0
    || (objc_msgSend(v4, "markedForDeletion") & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsToBeDeletedBeforeThisObject", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(REMCDObject);
          v12 = REMDynamicCast(v11, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          if (v13
            && !-[RDStoreController deleteCloudObjectIfFullyPushed:](self, "deleteCloudObjectIfFullyPushed:", v13))
          {

            goto LABEL_19;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "deleteFromLocalDatabase");
    goto LABEL_14;
  }
  v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100684964(v4);

LABEL_19:
  v14 = 0;
LABEL_20:

  return v14;
}

- (void)didFailPushingExceededStorageQuotaForContext:(id)a3 accountID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didFailPushingExceededStorageQuotaForContext: %@, accountID: %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)managedObjectContextDidSave:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *m;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  uint64_t v92;
  _BYTE v93[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSDeletedObjectIDsKey));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", NSInsertedObjectIDsKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUpdatedObjectIDsKey));

  v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    v57 = v5;
    v58 = v3;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v83 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
          v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Deleted object {managedObjectID: %@}", buf, 0xCu);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
      }
      while (v12);
    }

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v17 = v61;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v79 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)j);
          v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Inserted object {managedObjectID: %@}", buf, 0xCu);
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      }
      while (v19);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v24 = v60;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(_QWORD *)v75 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)k);
          v30 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v29;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Updated object {managedObjectID: %@}", buf, 0xCu);
          }

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
      }
      while (v26);
    }

    v5 = v57;
    v3 = v58;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v31 = v5;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v71;
    while (2)
    {
      for (m = 0; m != v33; m = (char *)m + 1)
      {
        if (*(_QWORD *)v71 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)m), "entity"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject entity](REMCDAccount, "entity"));
        v38 = objc_msgSend(v36, "isEqual:", v37);

        if ((v38 & 1) != 0)
        {
          v39 = v31;
          goto LABEL_56;
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
      if (v33)
        continue;
      break;
    }
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v39 = v61;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v67;
LABEL_40:
    v43 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v42)
        objc_enumerationMutation(v39);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v43), "entity"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject entity](REMCDAccount, "entity"));
      v46 = objc_msgSend(v44, "isEqual:", v45);

      if ((v46 & 1) != 0)
        goto LABEL_56;
      if (v41 == (id)++v43)
      {
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
        if (v41)
          goto LABEL_40;
        break;
      }
    }
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v39 = v60;
  v47 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v63;
LABEL_48:
    v50 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v49)
        objc_enumerationMutation(v39);
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v50), "entity"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject entity](REMCDAccount, "entity"));
      v53 = objc_msgSend(v51, "isEqual:", v52);

      if ((v53 & 1) != 0)
        break;
      if (v48 == (id)++v50)
      {
        v48 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
        if (v48)
          goto LABEL_48;
        goto LABEL_57;
      }
    }
LABEL_56:

    os_unfair_lock_lock(&self->_ivarLock);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStorageCacheByObjectIDs](self, "l_accountStorageCacheByObjectIDs"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "keyEnumerator"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "allObjects"));
    v39 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("managedObjectContextDidSave(REMCDAccount-changed) {self: %p, keys: %@}"), self, v56));

    -[RDStoreController l_invalidateAccountStorageCaches:](self, "l_invalidateAccountStorageCaches:", v39);
    os_unfair_lock_unlock(&self->_ivarLock);
  }
LABEL_57:

}

- (id)observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  RDAccountPersonIDSaltObserver *v22;
  void *v23;
  RDAccountPersonIDSaltObserver *v24;
  RDAccountPersonIDSaltObserver *v25;
  void *v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  uint8_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t v50[8];
  uint8_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudContext](self, "cloudContext"));
  v12 = objc_msgSend(v11, "hasPassedBuddy");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController cloudContext](self, "cloudContext"));
  v14 = objc_msgSend(v13, "isSystemAvailableForSyncing");

  if ((v12 & v14 & 1) != 0)
  {
    v15 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.remindd.RDStoreController.observePrimaryCloudKitAccountPersonIDSaltChanges"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController appleAccountUtilities](self, "appleAccountUtilities"));
    *(_QWORD *)v50 = 0;
    v51 = v50;
    v52 = 0x3032000000;
    v53 = sub_1000857E8;
    v54 = sub_1000857F8;
    v55 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = sub_1000857E8;
    v48 = sub_1000857F8;
    v49 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10008EEA0;
    v34[3] = &unk_1007D8B00;
    v17 = v15;
    v35 = v17;
    v18 = v16;
    v36 = v18;
    v37 = v50;
    v38 = &v44;
    v39 = &v40;
    -[NSObject performBlockAndWait:](v17, "performBlockAndWait:", v34);
    if (*((_QWORD *)v51 + 5) && !*((_BYTE *)v41 + 24))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[REMAccount objectIDWithUUID:](REMAccount, "objectIDWithUUID:"));
      v24 = [RDAccountPersonIDSaltObserver alloc];
      v25 = -[RDAccountPersonIDSaltObserver initWithAccountObjectID:accountType:initialSaltValue:callbackQueue:successHandler:errorHandler:](v24, "initWithAccountObjectID:accountType:initialSaltValue:callbackQueue:successHandler:errorHandler:", v23, _auto_REMAccountTypeForPrimaryCloudKit(), v45[5], v8, v9, v10);
      v22 = v25;
      if (!v25
        || (v26 = (void *)objc_claimAutoreleasedReturnValue(-[RDAccountPersonIDSaltObserver uuid](v25, "uuid")),
            v27 = v26 == 0,
            v26,
            v27))
      {
        v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_100684A14();
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController accountPropertiesNotifier](self, "accountPropertiesNotifier"));
        objc_msgSend(v28, "observeWithObserver:", v22);

        v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[RDAccountPersonIDSaltObserver uuid](v22, "uuid"));
          *(_DWORD *)buf = 138412546;
          v57 = v30;
          v58 = 2112;
          v59 = v23;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Created an RDAccountPersonIDSaltObserver and added to accountPropertiesNotifier {observerID: %@, accountObjID: %@}", buf, 0x16u);

        }
      }

    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)*((_QWORD *)v51 + 5);
        v21 = *((unsigned __int8 *)v41 + 24);
        *(_DWORD *)buf = 138543618;
        v57 = v20;
        v58 = 1024;
        LODWORD(v59) = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not creating an RDAccountPersonIDSaltObserver because primary cloudkit account is not available. Notifying caller explicitly to handle RDAccountPersonIDSaltObserver.AccountAbsentError... {accountID: %{public}@, inactive: %d}", buf, 0x12u);
      }

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10008EF30;
      v32[3] = &unk_1007D8118;
      v33 = v10;
      dispatch_async(v8, v32);
      v22 = 0;
      v23 = v33;
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(v50, 8);
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not creating an RDAccountPersonIDSaltObserver because the system is not ready to retrieve the primary cloudkit account", v50, 2u);
    }
    v22 = 0;
  }

  return v22;
}

- (void)unobservePrimaryCloudKitAccountPersonIDSaltChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController accountPropertiesNotifier](self, "accountPropertiesNotifier"));
  objc_msgSend(v5, "unobserveWithObserver:", v4);

  v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Removed RDAccountPersonIDSaltObserver from accountPropertiesNotifier {observerID: %@}", (uint8_t *)&v8, 0xCu);

  }
}

+ (id)entityNamesToIncludeFromTracking
{
  if (qword_1008528C0 != -1)
    dispatch_once(&qword_1008528C0, &stru_1007DA7F8);
  return (id)qword_1008528B8;
}

- (void)_populateCountForEntity:(Class)a3 withinCDAccount:(id)a4 statsAccumulator:(id)a5 errorAccumulator:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = NSStringFromClass(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("account"), v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v13));
  objc_msgSend(v15, "setPredicate:", v14);
  objc_msgSend(v15, "setResultType:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v24 = 0;
  v17 = objc_msgSend(v16, "countForFetchRequest:error:", v15, &v24);
  v18 = v24;

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "debugDescription"));
    objc_msgSend(v11, "addObject:", v19);
LABEL_5:

    goto LABEL_6;
  }
  if (v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v19));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("account[%@].%@.count"), v20, v13));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, v21);

    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)supportsAccountUtils
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsAlarmEngine
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsAppStoreRating
{
  return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsTimelineEngine
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsAssignmentNotificationEngine
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsHashtagLabelUpdater
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsStalePinnedListsEventHandler
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsTemplateOperation
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsGroceryOperation
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsCoreSpotlightIndexing
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](self, "coreSpotlightDelegateManager"));
  if (objc_msgSend(v3, "enableCoreSpotlightIndexing"))
    v4 = !-[RDStoreController isPPTStore](self, "isPPTStore");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)supportsSyncingToCloudKit
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsCloudSchemaCatchUpSyncBackgroundScheduling
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController daemonUserDefaults](self, "daemonUserDefaults"));
  v4 = objc_msgSend(v3, "debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling");

  if ((v4 & 1) != 0)
    return 1;
  else
    return -[RDStoreController supportsSyncingToCloudKit](self, "supportsSyncingToCloudKit");
}

- (BOOL)supportsApplicationShortcuts
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsSuggestedAttributes
{
  if (self->_supportsSuggestedAttributes)
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
  else
    return 0;
}

- (BOOL)supportsWidgetRefresh
{
  return 1;
}

- (BOOL)supportsSyncActivityNotificationEngine
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (BOOL)supportsSharedInlineTagAutoConvertEngine
{
  if (-[RDStoreController isolated](self, "isolated"))
    return 0;
  else
    return !-[RDStoreController isPPTStore](self, "isPPTStore");
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (RDAccountPropertiesNotifier)accountPropertiesNotifier
{
  return self->_accountPropertiesNotifier;
}

- (void)setAccountPropertiesNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountPropertiesNotifier, a3);
}

- (RDAttachmentFileManager)attachmentFileManager
{
  return self->_attachmentFileManager;
}

- (NSURL)isolatedReminderDataContainerURL
{
  return self->_isolatedReminderDataContainerURL;
}

- (void)setIsolatedReminderDataContainerURL:(id)a3
{
  objc_storeStrong((id *)&self->_isolatedReminderDataContainerURL, a3);
}

- (RDAccountUtils)accountUtils
{
  return self->_accountUtils;
}

- (void)setAccountUtils:(id)a3
{
  objc_storeStrong((id *)&self->_accountUtils, a3);
}

- (REMAppleAccountUtilities)appleAccountUtilities
{
  return self->_appleAccountUtilities;
}

- (void)setAppleAccountUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountUtilities, a3);
}

- (BOOL)hasFailedLoadingAccountStoresFromDiskDueToDiskFull
{
  return self->_hasFailedLoadingAccountStoresFromDiskDueToDiskFull;
}

- (void)setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:(BOOL)a3
{
  self->_hasFailedLoadingAccountStoresFromDiskDueToDiskFull = a3;
}

- (BOOL)containsLargeDatabases
{
  return self->_containsLargeDatabases;
}

- (void)setContainsLargeDatabases:(BOOL)a3
{
  self->_containsLargeDatabases = a3;
}

- (BOOL)containsOnlySmallDatabases
{
  return self->_containsOnlySmallDatabases;
}

- (void)setContainsOnlySmallDatabases:(BOOL)a3
{
  self->_containsOnlySmallDatabases = a3;
}

- (RDStoreControllerAccountStoreManagementDelegate)accountStoreManagementDelegate
{
  return (RDStoreControllerAccountStoreManagementDelegate *)objc_loadWeakRetained((id *)&self->_accountStoreManagementDelegate);
}

- (void)setAccountStoreManagementDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accountStoreManagementDelegate, a3);
}

- (BOOL)supportsLocalInternalAccount
{
  return self->_supportsLocalInternalAccount;
}

- (void)setSupportsLocalInternalAccount:(BOOL)a3
{
  self->_supportsLocalInternalAccount = a3;
}

- (void)setSupportsSuggestedAttributes:(BOOL)a3
{
  self->_supportsSuggestedAttributes = a3;
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (REMDaemonUserDefaults)daemonUserDefaults
{
  return self->_daemonUserDefaults;
}

- (void)setDaemonUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_daemonUserDefaults, a3);
}

- (void)setMergePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mergePolicy, a3);
}

- (void)setL_accountStoreMap:(id)a3
{
  objc_storeStrong((id *)&self->_l_accountStoreMap, a3);
}

- (NSMapTable)l_accountStorageCacheByObjectIDs
{
  return self->_l_accountStorageCacheByObjectIDs;
}

- (void)setL_accountStorageCacheByObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_l_accountStorageCacheByObjectIDs, a3);
}

- (NSMapTable)l_accountExternalIdentifiersToObjectIDsMap
{
  return self->_l_accountExternalIdentifiersToObjectIDsMap;
}

- (void)setL_accountExternalIdentifiersToObjectIDsMap:(id)a3
{
  objc_storeStrong((id *)&self->_l_accountExternalIdentifiersToObjectIDsMap, a3);
}

- (NSHashTable)l_allGenericAccountsObjectIDs
{
  return self->_l_allGenericAccountsObjectIDs;
}

- (void)setL_allGenericAccountsObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_l_allGenericAccountsObjectIDs, a3);
}

- (RDCoreSpotlightDelegateManager)coreSpotlightDelegateManager
{
  return self->_coreSpotlightDelegateManager;
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (void)setIsInitializing:(BOOL)a3
{
  self->_isInitializing = a3;
}

- (BOOL)isPPTStore
{
  return self->_isPPTStore;
}

- (void)setIsPPTStore:(BOOL)a3
{
  self->_isPPTStore = a3;
}

- (NSMutableSet)cloudKitNetworkActivityObservers
{
  return self->_cloudKitNetworkActivityObservers;
}

- (void)setCloudKitNetworkActivityObservers:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitNetworkActivityObservers, a3);
}

- (void)setL_primaryActiveCloudKitAccountREMObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_l_primaryActiveCloudKitAccountREMObjectID, a3);
}

- (BOOL)unittest_isTestingDataSeparation
{
  return self->_unittest_isTestingDataSeparation;
}

- (void)setUnittest_isTestingDataSeparation:(BOOL)a3
{
  self->_unittest_isTestingDataSeparation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_l_primaryActiveCloudKitAccountREMObjectID, 0);
  objc_storeStrong((id *)&self->_cloudKitNetworkActivityObservers, 0);
  objc_storeStrong((id *)&self->_coreSpotlightDelegateManager, 0);
  objc_storeStrong((id *)&self->_l_allGenericAccountsObjectIDs, 0);
  objc_storeStrong((id *)&self->_l_accountExternalIdentifiersToObjectIDsMap, 0);
  objc_storeStrong((id *)&self->_l_accountStorageCacheByObjectIDs, 0);
  objc_storeStrong((id *)&self->_l_accountStoreMap, 0);
  objc_storeStrong((id *)&self->_mergePolicy, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaults, 0);
  objc_destroyWeak((id *)&self->_accountStoreManagementDelegate);
  objc_storeStrong((id *)&self->_appleAccountUtilities, 0);
  objc_storeStrong((id *)&self->_accountUtils, 0);
  objc_storeStrong((id *)&self->_isolatedReminderDataContainerURL, 0);
  objc_storeStrong((id *)&self->_attachmentFileManager, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_accountPropertiesNotifier, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

- (void)updateInMemoryPrimaryActiveCKAccountREMObjectIDIfNecessary:(id)a3
{
  id v4;
  _QWORD v5[6];

  v4 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008FCD4;
  v5[3] = &unk_1007D7C68;
  v5[4] = self;
  v5[5] = v4;
  sub_10008FCD4((uint64_t)v5);
  os_unfair_lock_unlock(&self->_ivarLock);

}

- (id)accountStoragesForAccountObjectIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000857E8;
  v14 = sub_1000857F8;
  v15 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v5 = v4;
  v6 = objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoragesForAccountObjectIDs:](self, "l_accountStoragesForAccountObjectIDs:", v5));
  v7 = (void *)v11[5];
  v11[5] = v6;

  os_unfair_lock_unlock(&self->_ivarLock);
  v8 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v8;
}

- (void)setAccountStorages:(id)a3 forAccountObjectIDs:(id)a4
{
  os_unfair_lock_s *p_ivarLock;
  id v7;
  id v8;

  p_ivarLock = &self->_ivarLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_ivarLock);
  -[RDStoreController l_setAccountStorages:forAccountObjectIDs:](self, "l_setAccountStorages:forAccountObjectIDs:", v8, v7);

  os_unfair_lock_unlock(p_ivarLock);
}

- (id)accountStoragesForAccountExternalIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  RDStoreController *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000857E8;
  v16 = sub_1000857F8;
  v17 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008FF7C;
  v8[3] = &unk_1007D7FB0;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  sub_10008FF7C((uint64_t)v8);
  os_unfair_lock_unlock(&self->_ivarLock);

  v6 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v6;
}

- (void)setAccountStorages:(id)a3 forAccountExternalIdentifiers:(id)a4
{
  id v5;
  _QWORD v6[6];

  v5 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100090168;
  v6[3] = &unk_1007D7C68;
  v6[4] = v5;
  v6[5] = self;
  sub_100090168((uint64_t)v6);
  os_unfair_lock_unlock(&self->_ivarLock);

}

- (id)accountStoragesForAllGenericAccounts
{
  os_unfair_lock_s *p_ivarLock;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000857E8;
  v11 = sub_1000857F8;
  v12 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000903D0;
  v6[3] = &unk_1007D9B40;
  v6[4] = self;
  v6[5] = &v7;
  sub_1000903D0((uint64_t)v6);
  os_unfair_lock_unlock(p_ivarLock);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setAccountStoragesForAllGenericAccountsWithStorages:(id)a3
{
  id v4;
  _QWORD v5[6];

  v4 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100090650;
  v5[3] = &unk_1007D7C68;
  v5[4] = v4;
  v5[5] = self;
  sub_100090650((uint64_t)v5);
  os_unfair_lock_unlock(&self->_ivarLock);

}

- (id)l_accountStoragesForAccountObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStorageCacheByObjectIDs](self, "l_accountStorageCacheByObjectIDs", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyEnumerator"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v4, "containsObject:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStorageCacheByObjectIDs](self, "l_accountStorageCacheByObjectIDs"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));

          objc_msgSend(v5, "addObject:", v14);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)l_setAccountStorages:(id)a3 forAccountObjectIDs:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "externalIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStorageCacheByObjectIDs](self, "l_accountStorageCacheByObjectIDs"));
      objc_msgSend(v11, "setObject:forKey:", v9, v8);

      if (v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountExternalIdentifiersToObjectIDsMap](self, "l_accountExternalIdentifiersToObjectIDsMap"));
        objc_msgSend(v12, "setObject:forKey:", v8, v10);

      }
      ++v7;
    }
    while (v7 < (unint64_t)objc_msgSend(v6, "count"));
  }

}

- (void)l_invalidateAccountStorageCaches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStorageCacheByObjectIDs](self, "l_accountStorageCacheByObjectIDs"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountExternalIdentifiersToObjectIDsMap](self, "l_accountExternalIdentifiersToObjectIDsMap"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_allGenericAccountsObjectIDs](self, "l_allGenericAccountsObjectIDs"));
  objc_msgSend(v7, "removeAllObjects");

  v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Account storage invocation caches invalidated {reason: %{public}@}", (uint8_t *)&v9, 0xCu);
  }

}

- (id)_dataSeparationIncompatible_defaultReminderDataContainerURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL"));
  v5 = v4;

  return v5;
}

- (BOOL)nukeDataWithError:(id *)a3
{
  os_unfair_lock_s *p_ivarLock;
  char v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000857E8;
  v23 = sub_1000857F8;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000857E8;
  v17 = sub_1000857F8;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v12 = 1;
  p_ivarLock = &self->_ivarLock;
  v11 = 0x2020000000;
  os_unfair_lock_lock(&self->_ivarLock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100090E94;
  v8[3] = &unk_1007DA820;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v19;
  v8[7] = &v13;
  sub_100090E94((uint64_t)v8);
  os_unfair_lock_unlock(p_ivarLock);
  if (v20[5])
    -[RDStoreController _postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:](self, "_postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:");
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v6;
}

- (void)purgeDeletedObjectsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000913A0;
  v7[3] = &unk_1007D8140;
  v8 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.RDStoreController.purgeDeleted"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlock:", v7);

}

- (id)status:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *(__cdecl **v7)(SEL);
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RDStoreController *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSString *(__cdecl *v23)(SEL);
  void *v24;
  void *v25;
  NSString *(__cdecl *v26)(SEL);
  void *v27;
  void *v28;
  void *v29;
  NSString *(__cdecl *v30)(SEL);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *(__cdecl *v38)(SEL);
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  NSString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  os_unfair_lock_t lock;
  id obj;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  RDStoreController *v89;
  _BOOL4 v90;
  id v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];

  v90 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyEnumerator"));

  obj = v6;
  v7 = &NSStringFromSelector_ptr;
  v93 = v4;
  v91 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
  if (v91)
  {
    v88 = *(_QWORD *)v99;
    v89 = self;
    do
    {
      for (i = 0; i != v91; i = (char *)i + 1)
      {
        if (*(_QWORD *)v99 != v88)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[167], "stringWithFormat:", CFSTR("accountStore.%@"), v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
        v15 = v14;
        if (v90)
        {
          v16 = self;
          v92 = v13;
          v17 = objc_opt_class(NSNumber);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "options"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", NSPersistentStoreConnectionPoolMaxSizeKey));
          v20 = REMDynamicCast(v17, v19);
          v87 = objc_claimAutoreleasedReturnValue(v20);

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController appleAccountUtilities](v16, "appleAccountUtilities"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "applicationDocumentsURLForAccountIdentifier:", v9));

          v85 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController _reminderDataContainerURLForAccountIdentifier:](v16, "_reminderDataContainerURLForAccountIdentifier:", v9));
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[RDStagedLightweightCoreDataMigrationCoordinator stagedMigrationsInfoForPersistentStoreAt:](_TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator, "stagedMigrationsInfoForPersistentStoreAt:", v15));
          v23 = v7[167];
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringWithFormat:", CFSTR("{storeID: %@, URL: %@, connectionPoolMaxSize: %@}"), v92, v24, v87, lock));
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v25, v10);

          v26 = v7[167];
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringWithFormat:", CFSTR("%@"), v27));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[167], "stringWithFormat:", CFSTR("%@.applicationDocumentsURL"), v10));
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v28, v29);

          v30 = v7[167];
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "absoluteString"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v31));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[167], "stringWithFormat:", CFSTR("%@.reminderDataContainerURL"), v10));
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v32, v33);

          v4 = v93;
          v34 = &__NSArray0__struct;
          if (v86)
            v34 = v86;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[167], "stringWithFormat:", CFSTR("%@"), v34));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[167], "stringWithFormat:", CFSTR("%@.stagedMigrations"), v10));
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v35, v36);

          v13 = v92;
          v37 = (void *)v87;

        }
        else
        {
          v38 = v7[167];
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringWithFormat:", CFSTR("{storeID: %@, URL: %@}"), v13, v37));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v10);
        }

        self = v89;
        v7 = &NSStringFromSelector_ptr;
      }
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
    }
    while (v91);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountExternalIdentifiersToObjectIDsMap](self, "l_accountExternalIdentifiersToObjectIDsMap"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "keyEnumerator"));

  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(_QWORD *)v95 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("accountExternalIDsMap.%@"), v45));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountExternalIdentifiersToObjectIDsMap](self, "l_accountExternalIdentifiersToObjectIDsMap"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKey:", v45));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "description"));
        objc_msgSend(v93, "setObject:forKeyedSubscript:", v49, v46);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    }
    while (v42);
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStorageCacheByObjectIDs](self, "l_accountStorageCacheByObjectIDs"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "keyEnumerator"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "allObjects"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "description"));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v53, CFSTR("accountStorageCache.keys"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_allGenericAccountsObjectIDs](self, "l_allGenericAccountsObjectIDs"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allObjects"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "description"));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v56, CFSTR("accountStorageCache.hasAllGenericAccounts"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), +[RDPaths isDataSeparationEnabled](RDPaths, "isDataSeparationEnabled")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v57, CFSTR("dataSeparationEnabled"));

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "absoluteString"));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v59, CFSTR("defaultReminderDataContainerURL"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths defaultApplicationDocumentsURL](RDPaths, "defaultApplicationDocumentsURL"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "absoluteString"));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v61, CFSTR("defaultApplicationDocumentsURL"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController isolated](self, "isolated")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v62, CFSTR("isolated"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "absoluteString"));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v64, CFSTR("isolatedReminderDataContainerURL"));

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_primaryActiveCloudKitAccountREMObjectID](self, "l_primaryActiveCloudKitAccountREMObjectID"));
  v66 = v65;
  if (v65)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "description"));
    objc_msgSend(v93, "setObject:forKeyedSubscript:", v67, CFSTR("primaryActiveCKAccountID"));

  }
  else
  {
    v68 = objc_msgSend(v93, "setObject:forKeyedSubscript:", CFSTR("Nil"), CFSTR("primaryActiveCKAccountID"));
  }
  v69 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), rem_currentRuntimeVersion(v68));
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v70, CFSTR("remCurrentRuntimeVersion"));

  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsAccountUtils](self, "supportsAccountUtils")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v71, CFSTR("supportsAccountUtils"));

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsAlarmEngine](self, "supportsAlarmEngine")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v72, CFSTR("supportsAlarmEngine"));

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsTimelineEngine](self, "supportsTimelineEngine")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v73, CFSTR("supportsTimelineEngine"));

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsAssignmentNotificationEngine](self, "supportsAssignmentNotificationEngine")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v74, CFSTR("supportsAssignmentNotificationEngine"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsCoreSpotlightIndexing](self, "supportsCoreSpotlightIndexing")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v75, CFSTR("supportsCoreSpotlightIndexing"));

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsSyncingToCloudKit](self, "supportsSyncingToCloudKit")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v76, CFSTR("supportsSyncingToCloudKit"));

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsApplicationShortcuts](self, "supportsApplicationShortcuts")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v77, CFSTR("supportsApplicationShortcuts"));

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsLocalInternalAccount](self, "supportsLocalInternalAccount")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v78, CFSTR("supportsLocalInternalAccount"));

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsSuggestedAttributes](self, "supportsSuggestedAttributes")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v79, CFSTR("supportsSuggestedAttributes"));

  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsSyncActivityNotificationEngine](self, "supportsSyncActivityNotificationEngine")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v80, CFSTR("supportsSyncActivityNotificationEngine"));

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[RDStoreController supportsSharedInlineTagAutoConvertEngine](self, "supportsSharedInlineTagAutoConvertEngine")));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v81, CFSTR("supportsSharedInlineTagAutoConvertEngine"));

  os_unfair_lock_unlock(lock);
  return v93;
}

- (id)containerStats
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  id v26;
  NSString *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  os_unfair_lock_t lock;
  id obj;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyEnumerator"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("accountStore.%@"), v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_accountStoreMap](self, "l_accountStoreMap"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v9));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URL"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "absoluteString"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{storeID: %@, URL: %@}"), v13, v17));
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v18, v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v6);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "absoluteString"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v20, CFSTR("defaultReminderDataContainerURL"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController isolatedReminderDataContainerURL](self, "isolatedReminderDataContainerURL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absoluteString"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v22, CFSTR("isolatedReminderDataContainerURL"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreController l_primaryActiveCloudKitAccountREMObjectID](self, "l_primaryActiveCloudKitAccountREMObjectID"));
  v24 = v23;
  if (v23)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v25, CFSTR("primaryActiveCKAccountID"));

  }
  else
  {
    v26 = objc_msgSend(v39, "setObject:forKeyedSubscript:", CFSTR("Nil"), CFSTR("primaryActiveCKAccountID"));
  }
  v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), rem_currentRuntimeVersion(v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v28, CFSTR("remCurrentRuntimeVersion"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100092490;
  v40[3] = &unk_1007D7C40;
  v40[4] = self;
  v41 = -[RDStoreController newBackgroundContextWithAuthor:](self, "newBackgroundContextWithAuthor:", CFSTR("com.apple.RDStoreController.containerStats"));
  v30 = v29;
  v42 = v30;
  v31 = v39;
  v43 = v31;
  v32 = v41;
  objc_msgSend(v32, "performBlockAndWait:", v40);
  if (objc_msgSend(v30, "count"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "componentsJoinedByString:", CFSTR("; ")));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("ERRORS"));

  }
  os_unfair_lock_unlock(lock);
  v34 = v43;
  v35 = v31;

  return v35;
}

- (void)unittest_setEnableCoreSpotlightIndexing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RDStoreController coreSpotlightDelegateManager](self, "coreSpotlightDelegateManager"));
  objc_msgSend(v4, "setEnableCoreSpotlightIndexing:", v3);

}

- (int64_t)unittest_countKeysInAccountStoreMap
{
  os_unfair_lock_s *p_ivarLock;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100092A84;
  v6[3] = &unk_1007D7AF8;
  v6[4] = self;
  v6[5] = &v7;
  sub_100092A84((uint64_t)v6);
  os_unfair_lock_unlock(p_ivarLock);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)unittest_setIsTestingDataSeparation:(BOOL)a3
{
  -[RDStoreController setUnittest_isTestingDataSeparation:](self, "setUnittest_isTestingDataSeparation:", a3);
}

- (void)unittest_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  id v5;

  p_ivarLock = &self->_ivarLock;
  v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  -[RDStoreController l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:](self, "l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:", v5);

  os_unfair_lock_unlock(p_ivarLock);
}

+ (void)unittest_setLoadAndValidateAccountStoresBatchSize:(unint64_t)a3
{
  qword_100836AE0 = a3;
}

@end
