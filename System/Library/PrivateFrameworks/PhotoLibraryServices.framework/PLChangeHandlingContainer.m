@implementation PLChangeHandlingContainer

- (void)connectManagedObjectContext:(id)a3
{
  -[PLChangeNode connectManagedObjectContext:](self->_changeNode, "connectManagedObjectContext:", a3);
}

- (void)registerToReceiveCoreDataChanges:(id)a3
{
  -[PLCoreDataChangeMerger registerToReceiveCoreDataChanges:](self->_changeMerger, "registerToReceiveCoreDataChanges:", a3);
}

- (void)start
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  PLChangeHandlingContainer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412546;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p start", (uint8_t *)&v4, 0x16u);
  }

  -[PLPersistentHistoryChangeDistributor startObservingRemoteNotifications](self->_persistentHistoryChangeDistributor, "startObservingRemoteNotifications");
}

- (PLChangeHandlingContainer)initWithLibraryBundle:(id)a3 changePublisher:(id)a4 libraryServicesManager:(id)a5 persistentStoreCoordinator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PLChangeHandlingContainer *v14;
  void *v15;
  uint64_t v16;
  NSURL *libraryURL;
  NSObject *v18;
  NSURL *v19;
  PLCoreDataChangeMerger *v20;
  PLCoreDataChangeMerger *changeMerger;
  PLChangeNode *v22;
  PLChangeNode *changeNode;
  PLPersistentHistoryChangeDistributor *v24;
  PLPersistentHistoryChangeDistributor *persistentHistoryChangeDistributor;
  NSObject *v26;
  uint64_t v27;
  NSURL *v28;
  PLChangeHandlingContainer *v29;
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  PLChangeHandlingContainer *v35;
  __int16 v36;
  NSURL *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)PLChangeHandlingContainer;
  v14 = -[PLChangeHandlingContainer init](&v31, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "libraryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    libraryURL = v14->_libraryURL;
    v14->_libraryURL = (NSURL *)v16;

    PLChangeHandlingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v14->_libraryURL;
      *(_DWORD *)buf = 138412290;
      v33 = (uint64_t)v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Creating PLChangeHandlingContainer for library URL: %@", buf, 0xCu);
    }

    v20 = objc_alloc_init(PLCoreDataChangeMerger);
    changeMerger = v14->_changeMerger;
    v14->_changeMerger = v20;

    objc_storeStrong((id *)&v14->_changePublisher, a4);
    v22 = -[PLChangeNode initWithLibraryURL:changeMerger:changePublisher:libraryServicesManager:]([PLChangeNode alloc], "initWithLibraryURL:changeMerger:changePublisher:libraryServicesManager:", v14->_libraryURL, v14->_changeMerger, v14->_changePublisher, v12);
    changeNode = v14->_changeNode;
    v14->_changeNode = v22;

    v24 = -[PLPersistentHistoryChangeDistributor initWithPersistentStoreCoordinator:bundle:changeMerger:]([PLPersistentHistoryChangeDistributor alloc], "initWithPersistentStoreCoordinator:bundle:changeMerger:", v13, v10, v14->_changeMerger);
    persistentHistoryChangeDistributor = v14->_persistentHistoryChangeDistributor;
    v14->_persistentHistoryChangeDistributor = v24;

    PLPhotosObjectLifecycleGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_opt_class();
      v28 = v14->_libraryURL;
      *(_DWORD *)buf = 138412802;
      v33 = v27;
      v34 = 2048;
      v35 = v14;
      v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL:%@", buf, 0x20u);
    }

    v29 = v14;
  }

  return v14;
}

- (void)beginObservingChanges
{
  -[PLPersistentHistoryChangeDistributor beginObservingChanges](self->_persistentHistoryChangeDistributor, "beginObservingChanges");
}

- (void)pauseLaunchEventNotifications
{
  -[PLChangePublisher pauseLaunchEventNotifications](self->_changePublisher, "pauseLaunchEventNotifications");
}

- (void)disconnectManagedObjectContext:(id)a3
{
  -[PLChangeNode disconnectManagedObjectContext:](self->_changeNode, "disconnectManagedObjectContext:", a3);
}

- (void)stop
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  PLChangeHandlingContainer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412546;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p stop", (uint8_t *)&v4, 0x16u);
  }

  -[PLPersistentHistoryChangeDistributor stopObservingRemoteNotifications](self->_persistentHistoryChangeDistributor, "stopObservingRemoteNotifications");
  -[PLPersistentHistoryChangeDistributor invalidate](self->_persistentHistoryChangeDistributor, "invalidate");
  -[PLChangeNode invalidate](self->_changeNode, "invalidate");
  -[PLCoreDataChangeMerger invalidate](self->_changeMerger, "invalidate");
}

- (void)endObservingChanges
{
  -[PLPersistentHistoryChangeDistributor endObservingChanges](self->_persistentHistoryChangeDistributor, "endObservingChanges");
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PLChangeHandlingContainer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLChangeHandlingContainer;
  -[PLChangeHandlingContainer dealloc](&v4, sel_dealloc);
}

- (void)unpauseLaunchEventNotifications
{
  -[PLChangePublisher unpauseLaunchEventNotifications](self->_changePublisher, "unpauseLaunchEventNotifications");
}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5
{
  -[PLChangeNode publishRemoteChangeEvent:delayedSaveActionsDetail:reply:](self->_changeNode, "publishRemoteChangeEvent:delayedSaveActionsDetail:reply:", a3, a4, a5);
}

- (void)handleUnknownMergeEvent
{
  -[PLCoreDataChangeMerger handleUnknownMergeEvent](self->_changeMerger, "handleUnknownMergeEvent");
}

- (BOOL)isMergingCoalescedSaveNotification
{
  return -[PLCoreDataChangeMerger isMergingCoalescedSaveNotification](self->_changeMerger, "isMergingCoalescedSaveNotification");
}

- (NSDictionary)allDidSaveObjectIDsUserInfo
{
  return -[PLCoreDataChangeMerger allDidSaveObjectIDsUserInfo](self->_changeMerger, "allDidSaveObjectIDsUserInfo");
}

- (void)distributeChangesSinceLastCheckpoint
{
  -[PLPersistentHistoryChangeDistributor distributeNewTransactionsSinceLastToken](self->_persistentHistoryChangeDistributor, "distributeNewTransactionsSinceLastToken");
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_persistentHistoryChangeDistributor, 0);
  objc_storeStrong((id *)&self->_changePublisher, 0);
  objc_storeStrong((id *)&self->_changeMerger, 0);
  objc_storeStrong((id *)&self->_changeNode, 0);
}

@end
