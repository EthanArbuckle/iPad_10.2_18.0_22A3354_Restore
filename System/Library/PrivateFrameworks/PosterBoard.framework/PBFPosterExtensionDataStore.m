@implementation PBFPosterExtensionDataStore

+ (int64_t)minimumDataStoreVersion
{
  return 59;
}

+ (int64_t)dataStoreVersion
{
  return 61;
}

+ (int64_t)defaultMaximumPosterConfigurationCount
{
  return 200;
}

+ (id)galleryCacheURLForBaseURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  objc_msgSend(v4, "pbf_galleryCacheURLForBaseURL:version:", v5, objc_msgSend(a1, "dataStoreVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dataStoreExtensionContainerURLForBaseURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  objc_msgSend(v4, "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v5, objc_msgSend(a1, "dataStoreVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PBFPosterExtensionDataStore)initWithURL:(id)a3 runtimeAssertionProvider:(id)a4 extensionProvider:(id)a5 observer:(id)a6 wasMigrationJustPerformed:(BOOL)a7 applicationStateMonitor:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  PBFPosterExtensionDataStore *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  BSAtomicFlag *invalidationFlag;
  uint64_t v30;
  BSAtomicFlag *isPrewarmingFlag;
  uint64_t Serial;
  OS_dispatch_queue *notificationQueue;
  uint64_t v34;
  OS_dispatch_queue *clientSnapshotRequestQueue;
  uint64_t v36;
  BSAtomicFlag *extensionsInputIsValidAtomicFlag;
  PBFPosterExtensionDataStoreAssertionManager *v38;
  PBFPosterExtensionDataStoreAssertionManager *assertionManager;
  uint64_t v40;
  NSMutableSet *stateLock_activePathAssertions;
  uint64_t v42;
  NSMutableDictionary *activePosterLock_roleToActivePosterConfiguration;
  NSNumber *stateLock_wasMigrationJustPerformed;
  PBFPosterExtensionDataStoreMigrator *v45;
  unint64_t v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  BOOL v51;
  id v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  PBFPosterExtensionDataStore *v56;
  uint64_t v57;
  NSURL *baseURL;
  uint64_t v59;
  NSMutableDictionary *stateLock_descriptorsForExtensionBundleIdentifier;
  uint64_t v61;
  NSMutableDictionary *stateLock_staticDescriptorsForExtensionBundleIdentifier;
  uint64_t v63;
  uint64_t v64;
  NSURL *URL;
  uint64_t v66;
  NSURL *extensionStoreCoordinatorContainerURL;
  uint64_t v68;
  NSURL *galleryCacheURL;
  void *v70;
  PBFPosterExtensionDataStoreSQLiteDatabase *v71;
  PBFPosterExtensionDataStoreSQLiteDatabase *database;
  PBFPosterSnapshotManager *v73;
  PBFPosterSnapshotManager *snapshotManager;
  PBFComplicationSnapshotService *v75;
  PBFComplicationSnapshotService *complicationSnapshotService;
  PBFProactivePosterSwitchNotifier *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  os_signpost_id_t spid;
  id v90;
  _BOOL4 v91;
  id v92;
  id v93;
  id v94;
  objc_super v95;
  uint8_t buf[4];
  id v97;
  __int16 v98;
  _BOOL4 v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v91 = a7;
  v102 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v92 = a8;
  v18 = v14;
  NSClassFromString(CFSTR("NSURL"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v83), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA065E8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v84), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA0664CLL);
  }

  v19 = v16;
  if (v19)
  {
    NSClassFromString(CFSTR("PFPosterExtensionProvider"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterExtensionProviderClass]"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:].cold.4();
      objc_msgSend(objc_retainAutorelease(v87), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA06778);
    }
  }

  v20 = v15;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v85), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA066B0);
  }
  v21 = v20;
  if ((objc_msgSend(v20, "conformsToProtocol:", &unk_1EF9EC398) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v86), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA06714);
  }

  v95.receiver = self;
  v95.super_class = (Class)PBFPosterExtensionDataStore;
  v22 = -[PBFPosterExtensionDataStore init](&v95, sel_init);
  if (!v22)
    goto LABEL_43;
  v90 = v17;
  PBFLogDataStore();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_generate(v23);

  PBFLogDataStore();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  spid = v24;
  v27 = v24 - 1;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 138543618;
    v97 = v18;
    v98 = 1024;
    v99 = v91;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u", buf, 0x12u);
  }

  objc_storeStrong((id *)&v22->_applicationStateMonitor, a8);
  objc_storeStrong((id *)&v22->_runtimeAssertionProvider, a4);
  objc_storeStrong((id *)&v22->_extensionProvider, a5);
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
  invalidationFlag = v22->_invalidationFlag;
  v22->_invalidationFlag = (BSAtomicFlag *)v28;

  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
  isPrewarmingFlag = v22->_isPrewarmingFlag;
  v22->_isPrewarmingFlag = (BSAtomicFlag *)v30;

  *(_QWORD *)&v22->_extensionProvidingLock._os_unfair_lock_opaque = 0;
  v22->_activePosterLock._os_unfair_lock_opaque = 0;
  Serial = BSDispatchQueueCreateSerial();
  notificationQueue = v22->_notificationQueue;
  v22->_notificationQueue = (OS_dispatch_queue *)Serial;

  v34 = BSDispatchQueueCreateSerial();
  clientSnapshotRequestQueue = v22->_clientSnapshotRequestQueue;
  v22->_clientSnapshotRequestQueue = (OS_dispatch_queue *)v34;

  v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 1);
  extensionsInputIsValidAtomicFlag = v22->_extensionsInputIsValidAtomicFlag;
  v22->_extensionsInputIsValidAtomicFlag = (BSAtomicFlag *)v36;

  v38 = objc_alloc_init(PBFPosterExtensionDataStoreAssertionManager);
  assertionManager = v22->_assertionManager;
  v22->_assertionManager = v38;

  -[PBFPosterExtensionDataStoreAssertionManager addObserver:](v22->_assertionManager, "addObserver:", v22);
  v40 = objc_opt_new();
  stateLock_activePathAssertions = v22->_stateLock_activePathAssertions;
  v22->_stateLock_activePathAssertions = (NSMutableSet *)v40;

  v42 = objc_opt_new();
  activePosterLock_roleToActivePosterConfiguration = v22->_activePosterLock_roleToActivePosterConfiguration;
  v22->_activePosterLock_roleToActivePosterConfiguration = (NSMutableDictionary *)v42;

  v22->_stateLock_maximumPosterConfigurationCount = objc_msgSend((id)objc_opt_class(), "defaultMaximumPosterConfigurationCount");
  if (v91)
  {
    stateLock_wasMigrationJustPerformed = v22->_stateLock_wasMigrationJustPerformed;
    v22->_stateLock_wasMigrationJustPerformed = (NSNumber *)MEMORY[0x1E0C9AAB0];

  }
  v45 = -[PBFPosterExtensionDataStoreMigrator initWithBaseURL:]([PBFPosterExtensionDataStoreMigrator alloc], "initWithBaseURL:", v18);
  if (-[PBFPosterExtensionDataStoreMigrator isDataStoreUpToDateForCurrentVersion](v45, "isDataStoreUpToDateForCurrentVersion"))
  {
LABEL_23:
    v93 = 0;
    v51 = -[PBFPosterExtensionDataStoreMigrator validateDataStoreIntegrity:](v45, "validateDataStoreIntegrity:", &v93);
    v52 = v93;
    v53 = v52;
    if (!v51)
    {
      if (a9 && v52)
        *a9 = objc_retainAutorelease(v52);
      PBFLogDataStore();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v50 = v92;
      if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        *(_DWORD *)buf = 138543874;
        v97 = v18;
        v98 = 1024;
        v99 = v91;
        v100 = 2114;
        v101 = v53;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v55, OS_SIGNPOST_INTERVAL_END, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u -- could not validate data store integrity: %{public}@", buf, 0x1Cu);
      }

      goto LABEL_33;
    }
    v88 = v52;
    if (MEMORY[0x1D17A3148]("-[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:]"))-[PBFPosterExtensionDataStoreMigrator markDataStoreArchivesAsPurgable](v45, "markDataStoreArchivesAsPurgable");
    else
      -[PBFPosterExtensionDataStoreMigrator removeArchivedDataStores](v45, "removeArchivedDataStores");
    -[PBFPosterExtensionDataStoreMigrator removeDataStoresBeforeCurrentDataStoreVersion](v45, "removeDataStoresBeforeCurrentDataStoreVersion");

    v57 = objc_msgSend(v18, "copy");
    baseURL = v22->_baseURL;
    v22->_baseURL = (NSURL *)v57;

    v59 = objc_opt_new();
    stateLock_descriptorsForExtensionBundleIdentifier = v22->_stateLock_descriptorsForExtensionBundleIdentifier;
    v22->_stateLock_descriptorsForExtensionBundleIdentifier = (NSMutableDictionary *)v59;

    v61 = objc_opt_new();
    stateLock_staticDescriptorsForExtensionBundleIdentifier = v22->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
    v22->_stateLock_staticDescriptorsForExtensionBundleIdentifier = (NSMutableDictionary *)v61;

    v63 = objc_msgSend((id)objc_opt_class(), "dataStoreVersion");
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v22->_baseURL, v63);
    v64 = objc_claimAutoreleasedReturnValue();
    URL = v22->_URL;
    v22->_URL = (NSURL *)v64;

    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v22->_baseURL, v63);
    v66 = objc_claimAutoreleasedReturnValue();
    extensionStoreCoordinatorContainerURL = v22->_extensionStoreCoordinatorContainerURL;
    v22->_extensionStoreCoordinatorContainerURL = (NSURL *)v66;

    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_galleryCacheURLForBaseURL:version:", v22->_baseURL, v63);
    v68 = objc_claimAutoreleasedReturnValue();
    galleryCacheURL = v22->_galleryCacheURL;
    v22->_galleryCacheURL = (NSURL *)v68;

    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v22->_baseURL, v63);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:]([PBFPosterExtensionDataStoreSQLiteDatabase alloc], "initWithURL:options:error:", v70, 1, a9);
    database = v22->_database;
    v22->_database = v71;

    if (!v22->_database)
    {
      PBFLogDataStore();
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = v81;
      v50 = v92;
      if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
      {
        *(_DWORD *)buf = 138543618;
        v97 = v18;
        v98 = 1024;
        v99 = v91;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v82, OS_SIGNPOST_INTERVAL_END, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u -- failed to setup database", buf, 0x12u);
      }

      goto LABEL_34;
    }
    v73 = -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:]([PBFPosterSnapshotManager alloc], "initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:", v22->_runtimeAssertionProvider, v22, v22, v22->_applicationStateMonitor);
    snapshotManager = v22->_snapshotManager;
    v22->_snapshotManager = v73;

    -[PBFPosterSnapshotManager addObserver:](v22->_snapshotManager, "addObserver:", v22);
    -[PBFPosterSnapshotManager addBehaviorAssertionObserver:](v22->_snapshotManager, "addBehaviorAssertionObserver:", v22);
    if (v90)
      -[PBFPosterExtensionDataStore addObserver:](v22, "addObserver:");
    v75 = objc_alloc_init(PBFComplicationSnapshotService);
    complicationSnapshotService = v22->_complicationSnapshotService;
    v22->_complicationSnapshotService = v75;

    -[PBFPosterExtensionDataStore _setupExtensionEnvironment](v22, "_setupExtensionEnvironment");
    -[PBFPosterExtensionDataStore _setupExtensionProvider](v22, "_setupExtensionProvider");
    -[PBFPosterExtensionDataStore _setupGalleryEnvironment](v22, "_setupGalleryEnvironment");
    v77 = objc_alloc_init(PBFProactivePosterSwitchNotifier);
    -[PBFPosterExtensionDataStore addObserver:](v22, "addObserver:", v77);
    PBFLogDataStore();
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = v78;
    if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
    {
      *(_DWORD *)buf = 138543618;
      v97 = v18;
      v98 = 1024;
      v99 = v91;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v79, OS_SIGNPOST_INTERVAL_END, spid, "initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:error", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u", buf, 0x12u);
    }

    v17 = v90;
LABEL_43:
    v56 = v22;
    v50 = v92;
    goto LABEL_44;
  }
  v94 = 0;
  v46 = -[PBFPosterExtensionDataStoreMigrator migrateDataStoreToCurrentVersion:](v45, "migrateDataStoreToCurrentVersion:", &v94);
  v47 = v94;
  if (!PBFPosterExtensionDataStoreMigratorResultIsFailure(v46))
  {

    goto LABEL_23;
  }
  if (a9 && v47)
    *a9 = objc_retainAutorelease(v47);
  PBFLogDataStore();
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v48;
  v50 = v92;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_DWORD *)buf = 138543874;
    v97 = v18;
    v98 = 1024;
    v99 = v91;
    v100 = 2114;
    v101 = v47;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v49, OS_SIGNPOST_INTERVAL_END, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u -- could not setup data store: %{public}@", buf, 0x1Cu);
  }

LABEL_33:
LABEL_34:
  v56 = 0;
  v17 = v90;
LABEL_44:

  return v56;
}

- (void)cancel
{
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    -[PBFPosterExtensionDataStorePrewarmHelper invalidate](self->_prewarmer, "invalidate");
    -[PFPosterExtensionProvider cancel](self->_extensionProvider, "cancel");
    -[PBFPosterSnapshotManager cancelAllRequests](self->_snapshotManager, "cancelAllRequests");
    -[PBFPosterExtensionDataStoreSQLiteDatabase cancel](self->_database, "cancel");
  }
}

- (void)invalidate
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSHashTable *v7;
  NSObject *notificationQueue;
  NSHashTable *v9;
  NSHashTable *observers;
  PBFPosterExtensionDataStore *v11;
  BSInvalidatable *foregroundKeepDatabaseAliveAssertion;
  PBFPosterExtensionDataStoreSQLiteDatabase *database;
  PFPosterExtensionProvider *extensionProvider;
  NSURL *URL;
  NSURL *extensionStoreCoordinatorContainerURL;
  NSURL *galleryCacheURL;
  PBFPosterSnapshotManager *snapshotManager;
  PBFComplicationSnapshotService *complicationSnapshotService;
  PBFPosterExtensionDataStoreAssertionManager *assertionManager;
  PBFGalleryConfiguration *stateLock_configuration;
  NSMutableDictionary *stateLock_descriptorsForExtensionBundleIdentifier;
  NSMutableDictionary *stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  NSMutableDictionary *stateLock_staticDescriptorsForExtensionBundleIdentifier;
  PRSPosterGalleryLayout *stateLock_suggestedLayout;
  PRSwitcherConfiguration *stateLock_switcherConfiguration;
  NSObject *v27;
  NSObject *v28;
  _QWORD block[4];
  NSHashTable *v30;
  uint8_t buf[16];

  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    PBFLogDataStore();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    PBFLogDataStore();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "invalidate", ", buf, 2u);
    }

    v7 = self->_observers;
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PBFPosterExtensionDataStore_invalidate__block_invoke;
    block[3] = &unk_1E86F2518;
    v9 = v7;
    v30 = v9;
    dispatch_async(notificationQueue, block);
    observers = self->_observers;
    self->_observers = 0;

    -[PBFPosterExtensionDataStorePrewarmHelper invalidate](self->_prewarmer, "invalidate");
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_roleToRoleCoordinator, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_0);
    v11 = self;
    objc_sync_enter(v11);
    -[BSInvalidatable invalidate](v11->_foregroundKeepDatabaseAliveAssertion, "invalidate");
    foregroundKeepDatabaseAliveAssertion = v11->_foregroundKeepDatabaseAliveAssertion;
    v11->_foregroundKeepDatabaseAliveAssertion = 0;

    objc_sync_exit(v11);
    -[PBFPosterExtensionDataStoreSQLiteDatabase invalidate](v11->_database, "invalidate");
    database = v11->_database;
    v11->_database = 0;

    -[PFPosterExtensionProvider removeObserver:](v11->_extensionProvider, "removeObserver:", v11);
    -[PFPosterExtensionProvider cancel](v11->_extensionProvider, "cancel");
    extensionProvider = v11->_extensionProvider;
    v11->_extensionProvider = 0;

    -[PBFPosterSnapshotManager removeObserver:](v11->_snapshotManager, "removeObserver:", v11);
    -[PBFPosterSnapshotManager invalidate](v11->_snapshotManager, "invalidate");
    os_unfair_lock_lock(&v11->_stateLock);
    -[PBFGalleryController removeObserver:](v11->_galleryController, "removeObserver:", v11);
    -[PBFGalleryController invalidate](v11->_galleryController, "invalidate");
    -[PBFComplicationSnapshotService invalidate](v11->_complicationSnapshotService, "invalidate");
    -[PBFPosterExtensionDataStoreAssertionManager removeObserver:](v11->_assertionManager, "removeObserver:", v11);
    -[PBFPosterExtensionDataStoreAssertionManager invalidate](v11->_assertionManager, "invalidate");
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v11->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_120);
    URL = v11->_URL;
    v11->_URL = 0;

    extensionStoreCoordinatorContainerURL = v11->_extensionStoreCoordinatorContainerURL;
    v11->_extensionStoreCoordinatorContainerURL = 0;

    galleryCacheURL = v11->_galleryCacheURL;
    v11->_galleryCacheURL = 0;

    snapshotManager = v11->_snapshotManager;
    v11->_snapshotManager = 0;

    complicationSnapshotService = v11->_complicationSnapshotService;
    v11->_complicationSnapshotService = 0;

    assertionManager = v11->_assertionManager;
    v11->_assertionManager = 0;

    stateLock_configuration = v11->_stateLock_configuration;
    v11->_stateLock_configuration = 0;

    stateLock_descriptorsForExtensionBundleIdentifier = v11->_stateLock_descriptorsForExtensionBundleIdentifier;
    v11->_stateLock_descriptorsForExtensionBundleIdentifier = 0;

    stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = v11->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
    v11->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = 0;

    stateLock_staticDescriptorsForExtensionBundleIdentifier = v11->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
    v11->_stateLock_staticDescriptorsForExtensionBundleIdentifier = 0;

    stateLock_suggestedLayout = v11->_stateLock_suggestedLayout;
    v11->_stateLock_suggestedLayout = 0;

    stateLock_switcherConfiguration = v11->_stateLock_switcherConfiguration;
    v11->_stateLock_switcherConfiguration = 0;

    os_unfair_lock_unlock(&v11->_stateLock);
    PBFLogDataStore();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v28, OS_SIGNPOST_INTERVAL_END, v4, "invalidate", ", buf, 2u);
    }

  }
}

uint64_t __41__PBFPosterExtensionDataStore_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

uint64_t __41__PBFPosterExtensionDataStore_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

uint64_t __41__PBFPosterExtensionDataStore_invalidate__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)_setupGalleryEnvironment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "unable to create gallery cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (id)dataFreshnessForComponents:(id)a3
{
  return -[PBFPosterExtensionDataStore dataFreshnessForComponents:refreshStrategy:](self, "dataFreshnessForComponents:refreshStrategy:", a3, 2);
}

- (id)dataFreshnessForComponents:(id)a3 refreshStrategy:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  PBFDataComponentObjectEntity *v12;
  PBFGalleryController *galleryController;
  PBFDataRefreshContext *v14;
  void *v15;
  PBFDataRefreshContext *v16;
  PBFDataComponentObjectEntity *v17;
  os_unfair_lock_t lock;
  void *v21;
  id obj;
  PBFMutableDataFreshnessState *v23;
  _QWORD v24[4];
  PBFDataComponentObjectEntity *v25;
  void *v26;
  id v27;
  PBFMutableDataFreshnessState *v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = objc_alloc_init(PBFMutableDataFreshnessState);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("PBFDataComponentGallery"), lock))
        {
          v12 = [PBFDataComponentObjectEntity alloc];
          galleryController = self->_galleryController;
          v14 = [PBFDataRefreshContext alloc];
          -[PBFGalleryController lastUpdateDate](self->_galleryController, "lastUpdateDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[PBFDataRefreshContext initWithComponent:now:lastRefreshDate:userInfo:](v14, "initWithComponent:now:lastRefreshDate:userInfo:", CFSTR("PBFDataComponentGallery"), v6, v15, 0);
          v17 = -[PBFDataComponentObjectEntity initWithComponent:object:context:](v12, "initWithComponent:object:context:", CFSTR("PBFDataComponentGallery"), galleryController, v16);

          -[PBFMutableDataFreshnessState track:](v23, "track:", v17);
LABEL_11:

          continue;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PBFDataComponentStaticDescriptors")) & 1) != 0
          || objc_msgSend(v11, "isEqualToString:", CFSTR("PBFDataComponentDynamicDescriptors")))
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __74__PBFPosterExtensionDataStore_dataFreshnessForComponents_refreshStrategy___block_invoke;
          v24[3] = &unk_1E86F2670;
          v25 = v21;
          v26 = v11;
          v27 = v6;
          v29 = a4;
          v28 = v23;
          -[PBFPosterExtensionDataStore _stateLock_enumerateExtensionStoreCoordinators:](self, "_stateLock_enumerateExtensionStoreCoordinators:", v24);

          v17 = v25;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(lock);
  return v23;
}

void __74__PBFPosterExtensionDataStore_dataFreshnessForComponents_refreshStrategy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PBFDataComponentObjectEntity *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterExtensionInfoPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pbf_supportsGallery");

  if ((v6 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "stringArrayForKey:", CFSTR("ShowSamplePoster")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v3),
        v8,
        v7,
        v9))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("PBFDataComponentStaticDescriptors")))
    {
      objc_msgSend(v4, "posterExtensionInfoPlist");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pbf_staticDescriptorIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {

        goto LABEL_7;
      }
      objc_msgSend(v19, "staticDescriptorStoreCoordinatorsWithError:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
LABEL_7:
        +[PBFDataRefreshContext staticDescriptorsRefreshContextForNow:extension:](PBFDataRefreshContext, "staticDescriptorsRefreshContextForNow:extension:", *(_QWORD *)(a1 + 48), v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_12;
        goto LABEL_11;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("PBFDataComponentDynamicDescriptors")))
    {
      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v19, "lastRefreshDescriptorDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFDataRefreshContext dynamicDescriptorsRefreshContextForNow:extension:lastRefreshDate:refreshStrategy:](PBFDataRefreshContext, "dynamicDescriptorsRefreshContextForNow:extension:lastRefreshDate:refreshStrategy:", v15, v4, v16, *(_QWORD *)(a1 + 64));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
LABEL_11:
        v17 = *(void **)(a1 + 56);
        v18 = -[PBFDataComponentObjectEntity initWithComponent:object:context:]([PBFDataComponentObjectEntity alloc], "initWithComponent:object:context:", *(_QWORD *)(a1 + 40), v19, v14);
        objc_msgSend(v17, "track:", v18);

      }
    }
  }
LABEL_12:

}

- (void)prewarmWithCompletion:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  NSNumber *v5;
  NSNumber *stateLock_wasMigrationJustPerformed;
  uint64_t v7;
  uint64_t v8;
  id v9;

  p_stateLock = &self->_stateLock;
  v9 = a3;
  os_unfair_lock_lock(p_stateLock);
  if (-[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot](self, "_stateLock_hasBeenUnlockedSinceBoot")
    && (v5 = self->_stateLock_wasMigrationJustPerformed) != 0
    && -[NSNumber BOOLValue](v5, "BOOLValue"))
  {
    stateLock_wasMigrationJustPerformed = self->_stateLock_wasMigrationJustPerformed;
    self->_stateLock_wasMigrationJustPerformed = 0;

    v7 = 2;
    v8 = 3;
  }
  else
  {
    v7 = 10;
    v8 = 1;
  }
  os_unfair_lock_unlock(p_stateLock);
  -[PBFPosterExtensionDataStore executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:cleanupOldResources:completion:](self, "executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:cleanupOldResources:completion:", CFSTR("prewarm"), v8, v7, 1, 0, v9);

}

- (void)overnightUpdateWithCompletion:(id)a3
{
  -[PBFPosterExtensionDataStore executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:cleanupOldResources:completion:](self, "executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:cleanupOldResources:completion:", CFSTR("overnight"), 3, 2, 2, 1, a3);
}

- (void)executeUpdate:(id)a3 refreshStrategy:(int64_t)a4 galleryUpdateOptions:(unint64_t)a5 powerLogReason:(int64_t)a6 cleanupOldResources:(BOOL)a7 completion:(id)a8
{
  void (**v13)(id, void *);
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
  uint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  PBFPosterExtensionDataStorePrewarmHelper *v42;
  PBFPosterExtensionDataStorePrewarmHelper **p_prewarmer;
  PBFPosterExtensionDataStorePrewarmHelper *prewarmer;
  PBFPosterExtensionDataStorePrewarmHelper *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  PBFPosterExtensionDataStorePrewarmHelper *v54;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v56;
  char *spid;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  void (**v68)(id, void *);
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  void (**v73)(id, void *);
  id v74[5];
  _QWORD v75[4];
  id v76;
  id location;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  unint64_t v83;
  __int16 v84;
  void *v85;
  uint64_t v86;
  const __CFString *v87;
  _QWORD v88[2];
  uint64_t v89;
  const __CFString *v90;
  uint64_t v91;
  _QWORD v92[4];

  v62 = a7;
  v92[1] = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v13 = (void (**)(id, void *))a8;
  if ((PBFCurrentDeviceClassSupported() & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_keynoteModeEnabled"))
    {
      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v89 = *MEMORY[0x1E0CB2D68];
        v90 = CFSTR("Keynote mode is enabled; we aren't going to prewarm anything.  We are already warm enough, thank you.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pbf_generalErrorWithCode:userInfo:", 6, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v16);
LABEL_37:

        goto LABEL_38;
      }
      goto LABEL_38;
    }
    v59 = (void *)a6;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "substringToIndex:", 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v15, v64);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    PBFDescriptorRefreshStrategyToString(a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromPBFPosterExtensionDataStoreGalleryConfigurationOptions(a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromPBFPowerLogReason((uint64_t)v59);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("(%@)-(%@)-(%@)-(%@)"), v16, v21, v22, v23);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v88[0] = CFSTR("PBFDataComponentStaticDescriptors");
    v88[1] = CFSTR("PBFDataComponentDynamicDescriptors");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary allKeys](self->_roleToRoleCoordinator, "allKeys");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "bs_containsObjectPassingTest:", &__block_literal_global_148))
    {
      objc_msgSend(v24, "arrayByAddingObject:", CFSTR("PBFDataComponentGallery"));
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v25;
    }
    -[PBFPosterExtensionDataStore dataFreshnessForComponents:refreshStrategy:](self, "dataFreshnessForComponents:refreshStrategy:", v24, a4);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBFLogPrewarm();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v79 = v16;
      _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) Checking data freshness...", buf, 0xCu);
    }

    PBFLogPrewarm();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dumpFreshnessStateToLogCategory:type:", v27, 16);

    if (objc_msgSend(v61, "isFresh"))
    {
      PBFLogPrewarm();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v79 = v16;
        _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarm bailed; data is still fresh",
          buf,
          0xCu);
      }

      if (v13)
        v13[2](v13, 0);
      goto LABEL_36;
    }
    os_unfair_lock_lock(&self->_stateLock);
    v29 = -[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot](self, "_stateLock_hasBeenUnlockedSinceBoot");
    os_unfair_lock_unlock(&self->_stateLock);
    PBFLogPrewarm();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (!v29)
    {
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v79 = v16;
        _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarm bailed; keybag locked",
          buf,
          0xCu);
      }

      if (v13)
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v86 = *MEMORY[0x1E0CB2D68];
        v87 = CFSTR("Keybag is locked");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "pbf_generalErrorWithCode:userInfo:", 7, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v50);

      }
      goto LABEL_36;
    }
    if (v31)
    {
      *(_DWORD *)buf = 138543362;
      v79 = v16;
      _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) Checking if prewarm already in progress...", buf, 0xCu);
    }

    PBFLogDataStore();
    v32 = objc_claimAutoreleasedReturnValue();
    spid = (char *)os_signpost_id_generate(v32);

    objc_initWeak(&location, self);
    if (-[BSAtomicFlag setFlag:](self->_isPrewarmingFlag, "setFlag:", 1))
    {
      PBFLogDataStore();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        PBFDescriptorRefreshStrategyToString(a4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v79 = v64;
        v80 = 2114;
        v81 = v35;
        v82 = 2048;
        v83 = a5;
        v84 = 2048;
        v85 = v59;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v34, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:completion:", "updateDescription: %{public}@ refreshStrategy: %{public}@ galleryUpdateOptions: %lu powerLogReason: %lu", buf, 0x2Au);

      }
      PBFLogPrewarm();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v79 = v16;
        v80 = 2114;
        v81 = v58;
        _os_log_impl(&dword_1CB9FA000, v36, OS_LOG_TYPE_DEFAULT, "(%{public}@) no prewarm in progress; beginning prewarm: %{public}@",
          buf,
          0x16u);
      }

      runtimeAssertionProvider = self->_runtimeAssertionProvider;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prewarm session '%@/%@' initiated from XPC"), v15, v64);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_155;
      v75[3] = &unk_1E86F26D8;
      v39 = v16;
      v76 = v39;
      -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](runtimeAssertionProvider, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", v37, v38, v75);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore buildPrewarmPlanWithIdentifier:refreshStrategy:galleryUpdateOptions:powerLogReason:cleanupOldResources:prewarmDisplayContext:](self, "buildPrewarmPlanWithIdentifier:refreshStrategy:galleryUpdateOptions:powerLogReason:cleanupOldResources:prewarmDisplayContext:", v39, a4, a5, v59, v62, v40);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = -[PBFPosterExtensionDataStorePrewarmHelper initWithPlan:]([PBFPosterExtensionDataStorePrewarmHelper alloc], "initWithPlan:", v41);
      v63 = (void *)v41;
      prewarmer = self->_prewarmer;
      p_prewarmer = &self->_prewarmer;
      *p_prewarmer = v42;

      v45 = *p_prewarmer;
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159;
      v69[3] = &unk_1E86F2700;
      v70 = v39;
      objc_copyWeak(v74, &location);
      v46 = v56;
      v71 = v46;
      v74[1] = spid;
      v72 = v64;
      v74[2] = (id)a4;
      v74[3] = (id)a5;
      v74[4] = v59;
      v73 = v13;
      -[PBFPosterExtensionDataStorePrewarmHelper executePrewarmWithExecutor:completion:](v45, "executePrewarmWithExecutor:completion:", 0, v69);

      objc_destroyWeak(v74);
      v47 = v76;
    }
    else
    {
      if (!v13)
      {
LABEL_35:
        objc_destroyWeak(&location);
LABEL_36:

        goto LABEL_37;
      }
      -[PBFPosterExtensionDataStorePrewarmHelper plan](self->_prewarmer, "plan");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "identifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      PBFLogPrewarm();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v79 = v16;
        v80 = 2114;
        v81 = v52;
        _os_log_impl(&dword_1CB9FA000, v53, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarm already in progress (%{public}@) -- tacking on completion handler and moving on with our lives.", buf, 0x16u);
      }

      v54 = self->_prewarmer;
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_161;
      v65[3] = &unk_1E86F2728;
      v66 = v16;
      v47 = v52;
      v67 = v47;
      v68 = v13;
      -[PBFPosterExtensionDataStorePrewarmHelper appendCompletionObserver:](v54, "appendCompletionObserver:", v65);

    }
    goto LABEL_35;
  }
  if (v13)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v91 = *MEMORY[0x1E0CB2D68];
    v92[0] = CFSTR("This platform is not currently supported.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, &v91, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pbf_generalErrorWithCode:userInfo:", 7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v16);
    goto LABEL_37;
  }
LABEL_38:

}

uint64_t __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D7FC90], "proactiveGallerySupportedForRole:", a2);
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_155()
{
  NSObject *v0;

  PBFLogPrewarm();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_155_cold_1();

}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *WeakRetained;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (!v6)
    {
      PBFLogPrewarm();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159_cold_1();
      goto LABEL_9;
    }
LABEL_7:
    PBFLogPrewarm();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159_cold_2();
LABEL_9:

    goto LABEL_10;
  }
  PBFLogPrewarm();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159_cold_3();

  if (v6)
    goto LABEL_7;
LABEL_10:
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
    objc_msgSend(WeakRetained[29], "invalidate");
    v12 = WeakRetained[29];
    WeakRetained[29] = 0;

    objc_msgSend(WeakRetained[28], "setFlag:", 0);
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    PBFLogDataStore();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 72);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v16 = *(_QWORD *)(a1 + 48);
      PBFDescriptorRefreshStrategyToString(*(_QWORD *)(a1 + 80));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 88);
      v19 = *(_QWORD *)(a1 + 96);
      v25 = 138544130;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v19;
      v20 = "updateDescription: %{public}@ refreshStrategy: %{public}@ galleryUpdateOptions: %lu powerLogReason: %lu";
LABEL_19:
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v14, OS_SIGNPOST_INTERVAL_END, v15, "executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:completion:", v20, (uint8_t *)&v25, 0x2Au);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    PBFLogDataStore();
    v21 = objc_claimAutoreleasedReturnValue();
    v14 = v21;
    v15 = *(_QWORD *)(a1 + 72);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v22 = *(_QWORD *)(a1 + 48);
      PBFDescriptorRefreshStrategyToString(*(_QWORD *)(a1 + 80));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 88);
      v24 = *(_QWORD *)(a1 + 96);
      v25 = 138544130;
      v26 = v22;
      v27 = 2114;
      v28 = v17;
      v29 = 2048;
      v30 = v23;
      v31 = 2048;
      v32 = v24;
      v20 = "updateDescription: %{public}@ refreshStrategy: %{public}@ galleryUpdateOptions: %lu powerLogReason: %lu; dat"
            "a store invalidated before prewarm finished";
      goto LABEL_19;
    }
  }

}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_161(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PBFLogPrewarm();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@->%{public}@) appending prewarm finished w/ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3
{
  return -[PBFPosterSnapshotManager acquireSnapshotterInUseAssertionWithReason:](self->_snapshotManager, "acquireSnapshotterInUseAssertionWithReason:", a3);
}

- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4
{
  return -[PBFPosterSnapshotManager acquireSnapshotterDisabledAssertionForProvider:withReason:](self->_snapshotManager, "acquireSnapshotterDisabledAssertionForProvider:withReason:", a3, a4);
}

- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4
{
  return -[PBFPosterSnapshotManager acquireEditingSessionAssertionForProvider:withReason:](self->_snapshotManager, "acquireEditingSessionAssertionForProvider:withReason:", a3, a4);
}

- (id)activeEditingSessionAssertionExtensionIdentifiers
{
  return -[PBFPosterSnapshotManager activeEditingSessionAssertionExtensionIdentifiers](self->_snapshotManager, "activeEditingSessionAssertionExtensionIdentifiers");
}

- (void)addBehaviorAssertionObserver:(id)a3
{
  -[PBFPosterSnapshotManager addBehaviorAssertionObserver:](self->_snapshotManager, "addBehaviorAssertionObserver:", a3);
}

- (void)removeBehaviorAssertionObserver:(id)a3
{
  -[PBFPosterSnapshotManager removeBehaviorAssertionObserver:](self->_snapshotManager, "removeBehaviorAssertionObserver:", a3);
}

- (void)setMaximumPosterConfigurationCount:(int64_t)a3
{
  os_unfair_lock_s *p_stateLock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_stateLock_maximumPosterConfigurationCount != a3)
  {
    self->_stateLock_maximumPosterConfigurationCount = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSDictionary keyEnumerator](self->_roleToRoleCoordinator, "keyEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setMaximumNumberOfPosters:", a3);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  os_unfair_lock_unlock(p_stateLock);
}

- (int64_t)maximumPosterConfigurationCount
{
  os_unfair_lock_s *p_stateLock;
  int64_t v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = -[PBFPosterExtensionDataStore _stateLock_maximumPosterConfigurationCount](self, "_stateLock_maximumPosterConfigurationCount");
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (int64_t)_stateLock_maximumPosterConfigurationCount
{
  return self->_stateLock_maximumPosterConfigurationCount;
}

- (NSArray)knownExtensions
{
  return (NSArray *)-[PFPosterExtensionProvider knownPosterExtensions](self->_extensionProvider, "knownPosterExtensions");
}

- (BOOL)_extensionsInputIsValid
{
  return -[BSAtomicFlag getFlag](self->_extensionsInputIsValidAtomicFlag, "getFlag");
}

- (void)updateExtensionsAndNotifyWhenComplete:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  NSMutableArray *stateLock_updateExtensionCompletionBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD);

  v11 = (void (**)(_QWORD))a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0
    && -[PFPosterExtensionProvider reloadExtensions](self->_extensionProvider, "reloadExtensions"))
  {
    stateLock_updateExtensionCompletionBlocks = self->_stateLock_updateExtensionCompletionBlocks;
    if (!stateLock_updateExtensionCompletionBlocks)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_stateLock_updateExtensionCompletionBlocks;
      self->_stateLock_updateExtensionCompletionBlocks = v6;

      stateLock_updateExtensionCompletionBlocks = self->_stateLock_updateExtensionCompletionBlocks;
    }
    v8 = (void *)objc_msgSend(v11, "copy");
    v9 = _Block_copy(v8);
    -[NSMutableArray addObject:](stateLock_updateExtensionCompletionBlocks, "addObject:", v9);

    os_unfair_lock_unlock(p_stateLock);
    goto LABEL_8;
  }
  os_unfair_lock_unlock(&self->_stateLock);
  v10 = v11;
  if (v11)
  {
    v11[2](v11);
LABEL_8:
    v10 = v11;
  }

}

- (id)posterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_stateLock;
  void *v8;
  void *v9;
  id v10;
  void *v12;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore posterDescriptorsForExtensionBundleIdentifier:error:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA083A4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore posterDescriptorsForExtensionBundleIdentifier:error:].cold.1();
    goto LABEL_15;
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:](self, "_stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_stateLock);
  if (a4 && !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2218, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

- (id)staticPosterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_stateLock;
  void *v8;
  void *v9;
  id v10;
  void *v12;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore staticPosterDescriptorsForExtensionBundleIdentifier:error:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA08544);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore staticPosterDescriptorsForExtensionBundleIdentifier:error:].cold.1();
    goto LABEL_15;
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_knownStaticPosterDescriptorsForExtensionBundleIdentifier:](self, "_stateLock_knownStaticPosterDescriptorsForExtensionBundleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_stateLock);
  if (a4 && !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2218, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

- (void)reloadPosterDescriptorsForExtensionBundleIdentifier:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = v8;
  NSClassFromString(CFSTR("NSString"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA086E8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA0874CLL);
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:].cold.2();
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->_stateLock);
  v11 = -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:](self, "_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:", v14, CFSTR("External Client Refresh Request"), 3, 8, v9, v10);
  os_unfair_lock_unlock(&self->_stateLock);

}

- (BOOL)deletePosterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  os_unfair_lock_s *p_stateLock;
  void *v10;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore deletePosterDescriptorsForExtensionBundleIdentifier:error:].cold.1();
LABEL_14:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA088ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore deletePosterDescriptorsForExtensionBundleIdentifier:error:].cold.1();
    goto LABEL_14;
  }

  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    v7 = -[PBFPosterExtensionDataStore _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:](self, "_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:", v6, 1, a4);
    os_unfair_lock_unlock(p_stateLock);
  }

  return v7;
}

- (void)updateGallery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v10 = v6;
  NSClassFromString(CFSTR("PRSPosterGalleryLayout"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore updateGallery:completion:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA08A48);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterGalleryLayoutClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore updateGallery:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA08AACLL);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore updateGallery:completion:].cold.2();
    goto LABEL_13;
  }
  -[PBFGalleryController updateGallery:completion:](self->_galleryController, "updateGallery:completion:", v10, v7);

}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  PBFPosterSnapshotManager *snapshotManager;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if (v11)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:].cold.3();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA08E88);
    }
  }

  v12 = v8;
  if (v12)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:].cold.2();
LABEL_18:
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA08E24);
    }
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:].cold.1();
    goto LABEL_18;
  }
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_currentGalleryConfiguration](self, "_stateLock_currentGalleryConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_stateLock);
  +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15 = (void *)objc_opt_new();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke;
    v30[3] = &unk_1E86F2750;
    v16 = v11;
    v31 = v16;
    v17 = v12;
    v32 = v17;
    v33 = v15;
    v34 = v14;
    v18 = v15;
    objc_msgSend(v13, "enumeratePreviews:", v30);
    objc_msgSend(v18, "bs_map:", &__block_literal_global_178);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy_;
    v28[4] = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier %@/%@"), v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore acquireSnapshotterInUseAssertionWithReason:](self, "acquireSnapshotterInUseAssertionWithReason:", v21);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    snapshotManager = self->_snapshotManager;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke_181;
    v25[3] = &unk_1E86F27B8;
    v27 = v28;
    v26 = v10;
    -[PBFPosterSnapshotManager prewarmSnapshotsForRequests:completion:](snapshotManager, "prewarmSnapshotsForRequests:completion:", v20, v25);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "posterDescriptorLookupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterDescriptorPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (a1[4])
  {
    objc_msgSend(v5, "serverIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", a1[4]);
    v11 = v10;
    if (v7)
    {
      if ((v10 & 1) == 0)
      {

        goto LABEL_12;
      }
      objc_msgSend(v6, "descriptorIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", a1[5]);

      if (!v13)
        goto LABEL_13;
LABEL_10:
      v16 = (void *)a1[6];
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:](PBFPosterSnapshotRequest, "snapshotRequestForPreview:context:", v17, a1[7]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v8);
LABEL_12:

      goto LABEL_13;
    }

    if (v11)
      goto LABEL_10;
  }
  else
  {
    if (!v7)
      goto LABEL_10;
    objc_msgSend(v5, "descriptorIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", a1[5]);

    if (v15)
      goto LABEL_10;
  }
LABEL_13:

}

id __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "requestWithLoadFromCacheIfAvailable:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithIntention:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithPowerLogReason:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke_181(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (void)fetchPosterSnapshotsForRequest:(id)a3 completion:(id)a4
{
  -[PBFPosterSnapshotManager fetchPosterSnapshotsForRequest:completion:](self->_snapshotManager, "fetchPosterSnapshotsForRequest:completion:", a3, a4);
}

- (void)fetchPosterSnapshotsWithClientRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v10 = v6;
  NSClassFromString(CFSTR("PRSPosterSnapshotRequest"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore fetchPosterSnapshotsWithClientRequest:completion:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA09234);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterSnapshotRequestClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore fetchPosterSnapshotsWithClientRequest:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA09298);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore fetchPosterSnapshotsWithClientRequest:completion:].cold.2();
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_fetchPosterSnapshotsWithClientRequest:completion:](self, "_stateLock_fetchPosterSnapshotsWithClientRequest:completion:", v10, v7);
  os_unfair_lock_unlock(&self->_stateLock);

}

- (void)_stateLock_fetchPosterSnapshotsWithClientRequest:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  dispatch_time_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  PBFPosterSnapshotRequest *v86;
  void *v87;
  id v88;
  PBFPosterSnapshotRequest *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  uint64_t v100;
  PBFPosterSnapshotManager *snapshotManager;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  void *v111;
  dispatch_queue_t queue;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  dispatch_group_t group;
  PBFPosterExtensionDataStore *v128;
  _QWORD v129[5];
  _QWORD block[7];
  _QWORD v131[4];
  NSObject *v132;
  id v133;
  id v134;
  id v135;
  id v136;
  _QWORD *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[4];
  id v147;
  _QWORD v148[8];
  _QWORD v149[4];
  id v150;
  id v151;
  id v152;
  NSObject *v153;
  PBFPosterExtensionDataStore *v154;
  id v155;
  _QWORD *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  id v162;
  id v163;
  _QWORD v164[5];
  _QWORD v165[4];
  dispatch_queue_t v166;
  id v167;
  _QWORD v168[4];
  dispatch_group_t v169;
  _QWORD *v170;
  _QWORD *v171;
  _QWORD aBlock[4];
  id v173;
  id v174;
  _QWORD *v175;
  _QWORD *v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  void *(*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  id v182;
  _QWORD v183[5];
  id v184;
  _QWORD v185[5];
  id v186;
  _QWORD v187[5];
  id v188;
  _BYTE v189[128];
  uint64_t v190;
  void *v191;
  uint64_t v192;
  const __CFString *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  uint64_t v198;
  const __CFString *v199;
  uint64_t v200;
  _QWORD v201[3];

  v201[1] = *MEMORY[0x1E0C80C00];
  v117 = a3;
  v7 = a4;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v113 = v7;
    v9 = self->_clientSnapshotRequestQueue;
    v128 = self;
    -[PBFPosterExtensionDataStore _stateLock_switcherConfiguration](self, "_stateLock_switcherConfiguration");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    objc_msgSend(v117, "orientation");
    if (BSInterfaceOrientationIsValid())
    {
      v11 = objc_msgSend(v117, "orientation");
    }
    else
    {
      +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "pbf_interfaceOrientation");

    }
    +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v115, "displayContextWithUpdatedInterfaceOrientation:", v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v115 = (void *)v13;
    }
    v187[0] = 0;
    v187[1] = v187;
    v187[2] = 0x3032000000;
    v187[3] = __Block_byref_object_copy_;
    v187[4] = __Block_byref_object_dispose_;
    v188 = (id)objc_opt_new();
    v185[0] = 0;
    v185[1] = v185;
    v185[2] = 0x3032000000;
    v185[3] = __Block_byref_object_copy_;
    v185[4] = __Block_byref_object_dispose_;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore acquireSnapshotterInUseAssertionWithReason:](v128, "acquireSnapshotterInUseAssertionWithReason:", v14);
    v186 = (id)objc_claimAutoreleasedReturnValue();

    v183[0] = 0;
    v183[1] = v183;
    v183[2] = 0x3032000000;
    v183[3] = __Block_byref_object_copy_;
    v183[4] = __Block_byref_object_dispose_;
    v184 = 0;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    v177 = 0;
    v178 = &v177;
    v179 = 0x3032000000;
    v180 = __Block_byref_object_copy__186;
    v181 = __Block_byref_object_dispose__187;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke;
    aBlock[3] = &unk_1E86F27E0;
    v109 = v15;
    v173 = v109;
    v16 = v113;
    v174 = v16;
    v175 = v187;
    v176 = v185;
    v182 = _Block_copy(aBlock);
    v168[0] = MEMORY[0x1E0C809B0];
    v168[1] = 3221225472;
    v168[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2;
    v168[3] = &unk_1E86F2808;
    v170 = v183;
    v171 = v187;
    group = v10;
    v169 = group;
    v17 = _Block_copy(v168);
    v165[0] = MEMORY[0x1E0C809B0];
    v165[1] = 3221225472;
    v165[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3;
    v165[3] = &unk_1E86F2880;
    queue = v9;
    v166 = queue;
    v110 = v17;
    v167 = v110;
    v125 = _Block_copy(v165);
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_7;
    v164[3] = &unk_1E86F28A8;
    v164[4] = v128;
    v111 = _Block_copy(v164);
    objc_msgSend(v117, "requestOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D7F770]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v19, "BOOLValue");

    if ((_DWORD)v17)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F660]), "initWithPosterRequest:", v117);
      v21 = objc_msgSend(v20, "variant");
      v22 = objc_msgSend(v20, "configurationType");
      v23 = objc_msgSend(v20, "options");
      objc_msgSend(v20, "imageScaleRelativeToScreen");
      v25 = v24;
      objc_msgSend(v20, "focusModeUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v20, "maxCount");
      v28 = _UIUserInterfaceStyleFromPRSPosterSnapshotRequestOptions(v23);
      v163 = 0;
      v162 = 0;
      v161 = 0;
      +[PBFFocusSnapshotPreferredConfigurationArbiter determineDesiredConfigurations:preferredConfiguration:snapshotDefinition:fromSwitcherConfiguration:configurationType:variantType:options:andFocusModeUUID:maxCount:](PBFFocusSnapshotPreferredConfigurationArbiter, "determineDesiredConfigurations:preferredConfiguration:snapshotDefinition:fromSwitcherConfiguration:configurationType:variantType:options:andFocusModeUUID:maxCount:", &v163, &v162, &v161, v114, v22, v21, v23, v26, v27);
      v29 = v163;
      v123 = v162;
      v30 = v161;
      objc_msgSend(v115, "displayContextWithUpdatedUserInterfaceStyle:", PBFUserInterfaceStyleFromUIUserInterfaceStyle(v28));
      v126 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend(v29, "count");
      if (v31)
      {
        v149[0] = MEMORY[0x1E0C809B0];
        v149[1] = 3221225472;
        v149[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_8;
        v149[3] = &unk_1E86F28F8;
        v150 = v114;
        v157 = v21;
        v151 = v30;
        v152 = v126;
        v153 = group;
        v154 = v128;
        v156 = v183;
        v155 = v125;
        v158 = v22;
        v159 = v23;
        v160 = v25;
        objc_msgSend(v29, "enumerateObjectsUsingBlock:", v149);

        v32 = v150;
      }
      else
      {
        v47 = objc_alloc(MEMORY[0x1E0D7F6B0]);
        v32 = (void *)objc_msgSend(v47, "initWithSnapshots:", MEMORY[0x1E0C9AA60]);
        (*((void (**)(id, void *, _QWORD))v16 + 2))(v16, v32, 0);
      }

      if (!v31)
        goto LABEL_23;
LABEL_22:
      dispatch_group_leave(group);
      v48 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_220;
      block[3] = &unk_1E86F2968;
      block[4] = &v177;
      block[5] = v183;
      block[6] = v187;
      dispatch_group_notify(group, queue, block);
      v49 = dispatch_time(0, 0x6FC23B000);
      v129[0] = v48;
      v129[1] = 3221225472;
      v129[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_221;
      v129[3] = &unk_1E86F2990;
      v129[4] = &v177;
      dispatch_after(v49, queue, v129);
LABEL_23:

      _Block_object_dispose(&v177, 8);
      _Block_object_dispose(v183, 8);

      _Block_object_dispose(v185, 8);
      _Block_object_dispose(v187, 8);

      v7 = v113;
      goto LABEL_24;
    }
    objc_msgSend(v117, "requestOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0D7F768];
    objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0D7F768]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v117, "requestOptions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKey:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;

    }
    else
    {
      v39 = *MEMORY[0x1E0D7F7A8];
    }

    v121 = objc_msgSend(v117, "variantType");
    v118 = objc_msgSend(v117, "configurationType");
    if (v118 == -1)
    {
      objc_msgSend(v117, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v41 == 0;

    }
    else
    {
      v40 = 0;
    }
    v42 = objc_msgSend(v117, "options");
    v43 = _UIUserInterfaceStyleFromPRSPosterSnapshotRequestOptions(v42);
    v119 = v42;
    objc_msgSend(v117, "requestOptions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0D7F778]);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v117, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v117, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v118)
      {
        if (v118 != 1)
        {
          v46 = 0;
          goto LABEL_34;
        }
        objc_msgSend(v114, "activeConfiguration");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_path");
        v51 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v114, "selectedConfiguration");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_path");
        v51 = objc_claimAutoreleasedReturnValue();
      }
      v46 = (void *)v51;

    }
    if ((v119 & 0x80) != 0 && v46)
    {
      (*((void (**)(void *, void *))v111 + 2))(v111, v46);
      v52 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)v52;
    }
LABEL_34:
    v124 = v46;
    if (v121 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D7FB50], "loadHomeScreenConfigurationForPath:error:", v46, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "selectedAppearanceType") == 3)
      {
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v46);
        objc_msgSend(v114, "_childPosterConfigurationForConfiguration:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "_path");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = v53;

        if (!v120)
        {
          v56 = v178[5];
          v57 = (void *)MEMORY[0x1E0CB35C8];
          v200 = *MEMORY[0x1E0CB2D68];
          v201[0] = CFSTR("SPI requires a configuration type or path specified.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v201, &v200, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v56 + 16))(v56, 0, v59);
          v60 = 0;
LABEL_66:
          v126 = v115;
          goto LABEL_67;
        }
      }
      else
      {
        v120 = 0;
      }

      v61 = v108;
    }
    else
    {
      v120 = 0;
      v61 = v108;
    }
    if (v46)
      v62 = 1;
    else
      v62 = v40;
    if ((v62 & 1) == 0)
    {
      v65 = v178[5];
      v66 = (void *)MEMORY[0x1E0CB35C8];
      v198 = *MEMORY[0x1E0CB2D68];
      v199 = CFSTR("SPI requires a configuration type or path specified.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v65 + 16))(v65, 0, v59);
LABEL_65:
      v60 = 0;
      v122 = v120;
      goto LABEL_66;
    }
    if (v61)
    {
      PBFSnapshotDefinitionForIdentifier(v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        PBFSnapshotDefinitionForIdentifier(v108);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = v64;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v58 = 0;
      }
LABEL_60:

      v71 = v124;
      if (v58)
      {
        if (v43)
        {
          objc_msgSend(v115, "displayContextWithUpdatedUserInterfaceStyle:", PBFUserInterfaceStyleFromUIUserInterfaceStyle(v43));
          v126 = (void *)objc_claimAutoreleasedReturnValue();

          v71 = v124;
          if (v40)
          {
LABEL_63:
            dispatch_group_enter(group);
            objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "bounds");
            v74 = v73;
            v76 = v75;
            v78 = v77;
            v80 = v79;

            v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:", v74, v76, v78, v80);
            v148[0] = MEMORY[0x1E0C809B0];
            v148[1] = 3221225472;
            v148[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_211;
            v148[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
            *(double *)&v148[4] = v74;
            *(double *)&v148[5] = v76;
            *(double *)&v148[6] = v78;
            *(double *)&v148[7] = v80;
            objc_msgSend(v81, "imageWithActions:", v148);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            (*((void (**)(void *, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, void *, void *, double))v125 + 2))(v125, 0, 0, v121, v118, v119, v59, v126, v39);
            v60 = 1;
            v122 = v120;
            goto LABEL_67;
          }
        }
        else
        {
          v126 = v115;
          if (v40)
            goto LABEL_63;
        }
        if (v120)
          v71 = v120;
        v84 = v71;
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadConfiguredPropertiesForPath:error:", v84, 0);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "identity");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v84;
        LOBYTE(v84) = objc_msgSend(v85, "type") == 3;

        if ((v84 & 1) != 0)
        {
          v86 = [PBFPosterSnapshotRequest alloc];
          objc_msgSend(v116, "serverIdentity");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "provider");
          v88 = (id)objc_claimAutoreleasedReturnValue();
          v89 = -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:](v86, "initWithPath:provider:configuredProperties:definitions:context:", v116, v88, v107, v58, v126);
          -[PBFPosterSnapshotRequest requestWithLoadFromCacheIfAvailable:](v89, "requestWithLoadFromCacheIfAvailable:", (v119 & 0x40) == 0);
          v90 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "requestWithPowerLogReason:", 3);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v58;
        }
        else
        {
          -[PBFPosterExtensionDataStore _stateLock_currentGalleryConfiguration](v128, "_stateLock_currentGalleryConfiguration");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "descriptorIdentifier");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "identity");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "provider");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "posterSnapshotRequestsForExtensionBundleIdentifier:context:", v94, v126);
          v89 = (PBFPosterSnapshotRequest *)objc_claimAutoreleasedReturnValue();

          v146[0] = MEMORY[0x1E0C809B0];
          v146[1] = 3221225472;
          v146[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_215;
          v146[3] = &unk_1E86F2940;
          v88 = v92;
          v147 = v88;
          -[PBFPosterSnapshotRequest bs_firstObjectPassingTest:](v89, "bs_firstObjectPassingTest:", v146);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "definitions");
          v91 = (id)objc_claimAutoreleasedReturnValue();
          v122 = v95;

          if (!v95)
          {
            v102 = v178[5];
            v103 = (void *)MEMORY[0x1E0CB35C8];
            v190 = *MEMORY[0x1E0CB2D68];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to find descriptorIdentifier %@ within gallery"), v88);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v191 = v104;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v102 + 16))(v102, 0, v106);

            v60 = 0;
            v122 = v120;
            v96 = v88;
LABEL_86:

            v58 = v91;
            v59 = v116;
LABEL_67:

            if (!v60)
              goto LABEL_23;
            goto LABEL_22;
          }
          v90 = v147;
        }

        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v96 = v91;
        v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v142, v189, 16);
        if (v97)
        {
          v98 = *(_QWORD *)v143;
          do
          {
            for (i = 0; i != v97; ++i)
            {
              if (*(_QWORD *)v143 != v98)
                objc_enumerationMutation(v96);
              v100 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
              dispatch_group_enter(group);
              snapshotManager = v128->_snapshotManager;
              v131[0] = MEMORY[0x1E0C809B0];
              v131[1] = 3221225472;
              v131[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3_219;
              v131[3] = &unk_1E86F28D0;
              v137 = v183;
              v132 = group;
              v136 = v125;
              v133 = v124;
              v91 = v120;
              v134 = v91;
              v138 = v121;
              v139 = v118;
              v140 = v119;
              v141 = v39;
              v135 = v126;
              -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:](snapshotManager, "fetchPosterSnapshotForRequest:definition:completion:", v122, v100, v131);

            }
            v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v142, v189, 16);
          }
          while (v97);
          v60 = 1;
          v87 = v107;
          v107 = v116;
          v116 = v96;
        }
        else
        {
          v60 = 1;
          v87 = v107;
          v107 = v116;
          v116 = v96;
          v91 = v120;
        }
        goto LABEL_86;
      }
      goto LABEL_64;
    }
    if (v121 == 1)
    {
      +[PBFPosterSnapshotDefinition switcherUnlockedSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherUnlockedSnapshotDefinition");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v196 = v63;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v196, 1);
      v67 = objc_claimAutoreleasedReturnValue();
LABEL_59:
      v58 = (void *)v67;
      goto LABEL_60;
    }
    if ((unint64_t)(v121 + 1) <= 1)
    {
      +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotWithComplicationsDefinition");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v195 = v63;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v195, 1);
      v67 = objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    }
    if (v46)
    {
      objc_msgSend(v46, "identity");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v68, "type") == 1)
      {

LABEL_58:
        +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotWithComplicationsDefinition");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = v63;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1);
        v67 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      objc_msgSend(v46, "identity");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "type") == 2;

      if (v70)
        goto LABEL_58;
    }
LABEL_64:
    v82 = v178[5];
    v83 = (void *)MEMORY[0x1E0CB35C8];
    v192 = *MEMORY[0x1E0CB2D68];
    v193 = CFSTR("SPI Requires a snapshot definition to exist");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v82 + 16))(v82, 0, v59);
    goto LABEL_65;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v8);

  }
LABEL_24:

}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "setFlag:", 1))
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v11, v5);
    v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v7);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
    objc_sync_exit(v7);

    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      objc_msgSend(v8, "invalidate");
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;

    }
  }

}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v28 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65250]), "initWithUIImage:error:", v11, &v28);
  v15 = v28;
  v16 = v15;
  if (v14)
  {
    v27 = v15;
    v17 = a6;
    v18 = v12;
    v19 = objc_msgSend(v11, "imageOrientation");
    v20 = objc_alloc(MEMORY[0x1E0D7F6A0]);
    objc_msgSend(MEMORY[0x1E0D7F650], "makeWithOther:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    v12 = v18;
    v23 = (void *)objc_msgSend(v20, "initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:", v21, v22, v18, v13, a5, v17);

    v24 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v24);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v23);
    objc_sync_exit(v24);

    v16 = v27;
LABEL_5:

    goto LABEL_6;
  }
  if (v15)
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v26 = v15;
    v23 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v26;
    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, double a9)
{
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;

  v17 = a2;
  v18 = a3;
  v19 = a7;
  v20 = a8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_4;
  block[3] = &unk_1E86F2858;
  v32 = a4;
  v33 = a6;
  v27 = v18;
  v28 = v17;
  v29 = v19;
  v30 = v20;
  v34 = a9;
  v21 = *(NSObject **)(a1 + 32);
  v31 = *(id *)(a1 + 40);
  v35 = a5;
  v22 = v20;
  v23 = v19;
  v24 = v17;
  v25 = v18;
  dispatch_async(v21, block);

}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + 72) == 1)
  {
    v2 = *(id *)(a1 + 32);
    v3 = *(id *)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 56);
    v6 = *(id *)(a1 + 64);
    BSDispatchMain();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_5(uint64_t a1)
{
  PBFHomeScreenPreviewImageBuilder *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;

  v2 = objc_alloc_init(PBFHomeScreenPreviewImageBuilder);
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D7FB50], "loadHomeScreenConfigurationForPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(double *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_6;
  v9[3] = &unk_1E86F2830;
  v12 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 88);
  -[PBFHomeScreenPreviewImageBuilder homeScreenImageForConfiguration:unlockedPosterSnapshot:displayContext:imageScaleRelativeToScreen:options:completion:](v2, "homeScreenImageForConfiguration:unlockedPosterSnapshot:displayContext:imageScaleRelativeToScreen:options:completion:", v4, v5, v6, v8, v9, v7);

}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_6(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a2, a1[4], a1[5], a1[7], a1[8]);
}

id __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend(v6, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v5, 0, &v11);
  objc_msgSend(v11, "pathOfLatestVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v3;
  v9 = v7;

  return v9;
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 32);
  v26[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:withinSwitcherConfiguration:variant:snapshotDefinitions:displayContext:](PBFPosterSnapshotRequest, "snapshotRequestForConfiguration:withinSwitcherConfiguration:variant:snapshotDefinitions:displayContext:", v3, v5, v4, v6, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
  if (v7)
  {
    v11 = *(void **)(a1 + 56);
    v12 = *(void **)(*(_QWORD *)(a1 + 64) + 56);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9;
    v16[3] = &unk_1E86F28D0;
    v22 = *(_QWORD *)(a1 + 80);
    v13 = *(_QWORD *)(a1 + 40);
    v16[1] = 3221225472;
    v17 = v11;
    v21 = *(id *)(a1 + 72);
    v18 = v3;
    v19 = v10;
    v23 = *(_OWORD *)(a1 + 88);
    v24 = *(_QWORD *)(a1 + 104);
    v25 = *(_QWORD *)(a1 + 112);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v12, "fetchPosterSnapshotForRequest:definition:completion:", v7, v13, v16);

    v14 = v17;
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v3, "_path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double))(v15 + 16))(v15, v14, v10, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 112));
  }

}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    PBFLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9_cold_1();

  }
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD, _QWORD, id, _QWORD, double))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v5, *(_QWORD *)(a1 + 56), *(double *)(a1 + 104));

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_211(double *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v5 = a2;
  objc_msgSend(v3, "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  objc_msgSend(v5, "fillRect:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_215(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3_219(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    PBFLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9_cold_1();

  }
  if (v5)
    (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 104));
  else
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_220(_QWORD *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  if (v2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    }
    else
    {
      v3 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
      objc_sync_enter(v3);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F6B0]), "initWithSnapshots:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
      objc_sync_exit(v3);

      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) + 16))();
    }
    v5 = *(_QWORD *)(a1[4] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_221(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2221, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

- (void)fetchGallerySnapshotForConfiguration:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PBFPosterSnapshotRequest *v12;
  void *v13;
  PBFPosterSnapshotRequest *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PBFPosterSnapshotDefinition gallerySnapshotDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotDefinition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PBFPosterSnapshotRequest alloc];
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:](v12, "initWithConfiguration:definitions:context:", v10, v13, v9);

  -[PBFPosterSnapshotRequest requestWithPowerLogReason:](v14, "requestWithPowerLogReason:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:](self->_snapshotManager, "fetchPosterSnapshotForRequest:definition:completion:", v15, v11, v8);
}

- (void)fetchSwitcherSnapshotForConfiguration:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PBFPosterSnapshotRequest *v12;
  void *v13;
  PBFPosterSnapshotRequest *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PBFPosterSnapshotDefinition switcherSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherSnapshotDefinition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PBFPosterSnapshotRequest alloc];
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:](v12, "initWithConfiguration:definitions:context:", v10, v13, v9);

  -[PBFPosterSnapshotRequest requestWithPowerLogReason:](v14, "requestWithPowerLogReason:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:](self->_snapshotManager, "fetchPosterSnapshotForRequest:definition:completion:", v15, v11, v8);
}

- (void)fetchHomeScreenAssociatedPosterConfigurationForConfigurationUUID:(id)a3 completion:(id)a4
{
  os_unfair_lock_s *p_stateLock;
  void (**v7)(id, id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  id v11;

  p_stateLock = &self->_stateLock;
  v7 = (void (**)(id, id, _QWORD))a4;
  v8 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_switcherConfiguration](self, "_stateLock_switcherConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_childPosterConfigurationForConfigurationUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_path");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  v7[2](v7, v11, 0);

}

- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  os_unfair_lock_s *p_stateLock;
  id v9;
  id v10;
  id v11;

  p_stateLock = &self->_stateLock;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_updatePosterConfigurationMatchingUUID:updates:completion:](self, "_stateLock_updatePosterConfigurationMatchingUUID:updates:completion:", v11, v10, v9);

  os_unfair_lock_unlock(p_stateLock);
}

- (void)updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5
{
  os_unfair_lock_s *p_stateLock;
  id v9;
  id v10;
  id v11;

  p_stateLock = &self->_stateLock;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_updatePosterConfiguration:updates:completion:](self, "_stateLock_updatePosterConfiguration:updates:completion:", v11, v10, v9);

  os_unfair_lock_unlock(p_stateLock);
}

- (void)createTemporaryPosterConfigurationForPosterMatchingUUID:(id)a3 andApplyUpdates:(id)a4 completion:(id)a5
{
  os_unfair_lock_s *p_stateLock;
  id v9;
  id v10;
  id v11;

  p_stateLock = &self->_stateLock;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID:andApplyUpdates:completion:](self, "_stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID:andApplyUpdates:completion:", v11, v10, v9);

  os_unfair_lock_unlock(p_stateLock);
}

- (void)_stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID:(id)a3 andApplyUpdates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
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
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[2];
  const __CFString *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (!objc_msgSend(v9, "count"))
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v61[0] = CFSTR("configurationUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = *MEMORY[0x1E0CB2D68];
      v62[0] = v21;
      v62[1] = CFSTR("No updates to execute?");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v22);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v55 = 0;
    v56 = 0;
    -[PBFPosterExtensionDataStore _stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:](self, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v8, &v56, &v55);
    v11 = v56;
    v12 = v55;
    if (!v12)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v59 = CFSTR("configurationUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v13);
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v11, "extensionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore activeEditingSessionAssertionExtensionIdentifiers](self, "activeEditingSessionAssertionExtensionIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v13);

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v57[0] = CFSTR("configurationUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = *MEMORY[0x1E0CB2D68];
      v58[0] = v17;
      v58[1] = CFSTR("Active edit session is ongoing.  Cannot fulfill PRSPosterUpdate requests while editing sessions have UI presented.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v19);
LABEL_18:

      goto LABEL_19;
    }
    v40 = v13;
    v45 = v11;
    v43 = v12;
    objc_msgSend(v12, "pathOfLatestVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v19);
    v26 = (void *)MEMORY[0x1E0D7F8D0];
    objc_msgSend(v19, "role");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "temporaryPathForRole:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "identity");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0D7F8E8];
    objc_msgSend(v28, "contentsURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v29;
    objc_msgSend(v30, "pathWithContainerURL:identity:", v31, v29);
    v32 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v32, "instanceURL");
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v46 = (void *)v32;
    LOBYTE(v32) = objc_msgSend((id)v32, "ensureContentsURLIsReachableAndReturnError:", &v54);
    v35 = v54;
    v41 = (void *)v33;
    if ((v32 & 1) != 0)
    {
      objc_msgSend(v34, "removeItemAtURL:error:", v33, 0);
      objc_msgSend(v19, "instanceURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v35;
      v37 = objc_msgSend(v34, "copyItemAtURL:toURL:error:", v36, v33, &v53);
      v39 = v53;

      if ((v37 & 1) != 0)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __125__PBFPosterExtensionDataStore__stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID_andApplyUpdates_completion___block_invoke;
        v47[3] = &unk_1E86F29B8;
        v48 = v28;
        v52 = v10;
        v49 = v34;
        v50 = v46;
        v38 = v44;
        v51 = v44;
        -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:](self, "_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:", v9, v50, 0, v47);

        v35 = v39;
        v11 = v45;
LABEL_17:

        v12 = v43;
        v13 = v40;
        goto LABEL_18;
      }
      objc_msgSend(v28, "invalidate");
      v35 = v39;
      (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v39);
    }
    else
    {
      objc_msgSend(v28, "invalidate");
      (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v35);
    }
    v38 = v44;
    v11 = v45;
    goto LABEL_17;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v11);
LABEL_20:

  }
}

void __125__PBFPosterExtensionDataStore__stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID_andApplyUpdates_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PBFPosterConfigurationUpdateResult *v24;
  void *v25;
  void *v26;
  PBFPosterConfigurationUpdateResult *v27;
  id v28;

  v28 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v28)
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "contentsURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeItemAtURL:error:", v10, 0);

      v11 = *(void **)(a1 + 40);
      objc_msgSend(v28, "incomingPosterConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentsURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "contentsURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "copyItemAtURL:toURL:error:", v14, v15, 0);

    }
    v16 = objc_alloc(MEMORY[0x1E0D7FA60]);
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "pbf_posterUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serverIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "incomingPosterConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configuredProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v16, "initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:", v17, v18, v20, v22, 0);

    v24 = [PBFPosterConfigurationUpdateResult alloc];
    objc_msgSend(v28, "incomingAssocPosterConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postersToDelete");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PBFPosterConfigurationUpdateResult initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:](v24, "initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:", v23, v25, v26);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "invalidate");

  }
}

- (void)_stateLock_updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "pbf_posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (objc_msgSend(v8, "_path"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isServerPosterPath"),
        v12,
        (v13 & 1) != 0))
  {
    objc_msgSend(v8, "role");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "posterCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v16;
    objc_msgSend(v16, "posterWithUUID:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serverIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serverIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "isEqual:", v21))
    {
      -[PBFPosterExtensionDataStore _stateLock_updatePosterConfigurationMatchingUUID:updates:completion:](self, "_stateLock_updatePosterConfigurationMatchingUUID:updates:completion:", v11, v9, v10);
      v22 = 0;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D68];
      v32[0] = CFSTR("Poster Configuration specified is not the most up to date version; please re-run your command after you've received a more up to date poster");
      v31[0] = v24;
      v31[1] = CFSTR("version");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v19, "version"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v27;
      v31[2] = CFSTR("supplement");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v19, "supplement"));
      v29 = v17;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v29;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D68];
    v34[0] = CFSTR("Invalid configuration specified");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v22)
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v22);

}

- (void)_stateLock_updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
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
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  const __CFString *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v28 = 0;
      v29 = 0;
      -[PBFPosterExtensionDataStore _stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:](self, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v8, &v29, &v28);
      v11 = v29;
      v12 = v28;
      if (v12)
      {
        objc_msgSend(v11, "extensionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterExtensionDataStore activeEditingSessionAssertionExtensionIdentifiers](self, "activeEditingSessionAssertionExtensionIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if (v15)
        {
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v30[0] = CFSTR("configurationUUID");
          objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30[1] = *MEMORY[0x1E0CB2D68];
          v31[0] = v17;
          v31[1] = CFSTR("Active edit session is ongoing.  Cannot fulfill PRSPosterUpdate requests while editing sessions have UI presented.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v19);
        }
        else
        {
          objc_msgSend(v12, "pathOfLatestVersion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __99__PBFPosterExtensionDataStore__stateLock_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke;
          v26[3] = &unk_1E86F29E0;
          v27 = v10;
          -[PBFPosterExtensionDataStore _stateLock_applyUpdatesAndIngestConfiguration:toPath:powerLogReason:completion:](self, "_stateLock_applyUpdatesAndIngestConfiguration:toPath:powerLogReason:completion:", v9, v19, 3, v26);

        }
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v32 = CFSTR("configurationUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v13);
      }

      goto LABEL_14;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v34[0] = CFSTR("configurationUUID");
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = *MEMORY[0x1E0CB2D68];
    v35[0] = v21;
    v35[1] = CFSTR("No updates to execute?");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v22);
    v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v11);
LABEL_14:

    goto LABEL_15;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_15:

}

uint64_t __99__PBFPosterExtensionDataStore__stateLock_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_stateLock_applyUpdatesAndIngestConfiguration:(id)a3 toPath:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  id v29;
  os_signpost_id_t v30;
  PBFPosterExtensionDataStore *v31;
  int64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  PBFPosterExtensionDataStore *v39;
  id v40;
  os_signpost_id_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v13);

    }
  }
  else
  {
    v31 = self;
    v32 = a5;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "substringToIndex:", 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PBFLogDataStore();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    PBFLogDataStore();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138543874;
      v48 = v11;
      v49 = 2114;
      v50 = v10;
      v51 = 2114;
      v52 = v16;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "_stateLock_applyUpdatesAndIngestConfiguration", "path: %{public}@ ; updates: %{public}@; id %{public}@",
        buf,
        0x20u);
    }
    v30 = v18;

    PBFLogDataStore();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v48 = v16;
      v49 = 2114;
      v50 = v11;
      _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] BEGIN POSTER UPDATES FOR PATH %{public}@", buf, 0x16u);
    }
    v33 = v11;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v10;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          PBFLogDataStore();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v48 = v16;
            v49 = 2114;
            v50 = v27;
            _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] POSTER UPDATE: %{public}@", buf, 0x16u);
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v24);
    }

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke;
    v35[3] = &unk_1E86F2A70;
    v36 = v16;
    v41 = v30;
    v11 = v33;
    v37 = v33;
    v38 = v22;
    v39 = v31;
    v40 = v12;
    v29 = v16;
    -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:](v31, "_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:", v38, v37, v32, v35);

    v10 = v34;
  }

}

void __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  _QWORD block[4];
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  const __CFString *v111;
  uint64_t v112;
  const __CFString *v113;
  _BYTE v114[128];
  uint64_t v115;
  const __CFString *v116;
  uint8_t buf[4];
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  uint64_t v122;
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v94 = a2;
  v7 = a3;
  v93 = a4;
  PBFLogDataStore();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v118 = v9;
    _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] receiving update result", buf, 0xCu);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v107;
    do
    {
      v14 = v10;
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v107 != v13)
          objc_enumerationMutation(v14);
        v16 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
        PBFLogDataStore();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v118 = v18;
          v119 = 2114;
          v120 = v16;
          _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] result: %{public}@", buf, 0x16u);
        }

      }
      v10 = v14;
      v12 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
    }
    while (v12);
  }

  PBFLogDataStore();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = a1;
  v22 = *(_QWORD *)(a1 + 72);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v24 = *(_QWORD *)(a1 + 40);
    v23 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v118 = v24;
    v119 = 2114;
    v120 = v23;
    v121 = 2114;
    v122 = v25;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v20, OS_SIGNPOST_INTERVAL_END, v22, "_stateLock_applyUpdatesAndIngestConfiguration", "path: %{public}@ ; updates: %{public}@, id %{public}@",
      buf,
      0x20u);
  }

  v26 = v94;
  if (v94)
  {
    v27 = objc_msgSend(v10, "count");
    v28 = objc_msgSend(*(id *)(a1 + 48), "count");
    PBFLogDataStore();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v27 == v28)
    {
      if (v30)
      {
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v118 = v31;
        _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing update results for updates", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "identity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_opt_new();
      objc_msgSend(v94, "roleCoordinatorChanges");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        objc_msgSend(v94, "roleCoordinatorChanges");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "mutableCopy");

        PBFLogDataStore();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = *(_QWORD *)(v21 + 32);
          *(_DWORD *)buf = 138543618;
          v118 = v39;
          v119 = 2114;
          v120 = v37;
          _os_log_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] role coordinator changes received: %{public}@", buf, 0x16u);
        }
        v33 = (void *)v37;
      }
      else
      {
        v92 = v10;
        objc_msgSend(v32, "role");
        v44 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "incomingPosterConfiguration");
        v45 = objc_claimAutoreleasedReturnValue();
        +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v44, v45);
        v46 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v46);
        PBFLogDataStore();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = *(_QWORD *)(v21 + 32);
          *(_DWORD *)buf = 138543618;
          v118 = v48;
          v119 = 2114;
          v120 = v46;
          _os_log_impl(&dword_1CB9FA000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating poster: %{public}@", buf, 0x16u);
        }
        v91 = (void *)v46;

        objc_msgSend(v94, "incomingAssocPosterConfiguration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          objc_msgSend(v94, "incomingAssocPosterConfiguration");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v50, "incomingPosterType") == 5)
          {
            +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v44, v50);
            v51 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (objc_msgSend(v50, "incomingPosterType") != 4)
            {
              v82 = v45;
              PBFLogDataStore();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                v84 = *(_QWORD *)(v21 + 32);
                *(_DWORD *)buf = 138543362;
                v118 = v84;
                _os_log_impl(&dword_1CB9FA000, v83, OS_LOG_TYPE_DEFAULT, "[%{public}@] bailing; issue with assoc poster",
                  buf,
                  0xCu);
              }

              v85 = *(_QWORD *)(v21 + 64);
              v86 = (void *)MEMORY[0x1E0CB35C8];
              v115 = *MEMORY[0x1E0CB2D68];
              v116 = CFSTR("Associated poster configuration has incorrect PRIncomingPosterType; should be AssociatedNew/AssociatedUpdate but is something else that we do not handle for this.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v87);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, id, void *))(v85 + 16))(v85, 0, v92, v88);

              v10 = v92;
              v41 = v93;
              v77 = v82;
              goto LABEL_59;
            }
            +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v44, v50);
            v51 = objc_claimAutoreleasedReturnValue();
          }
          v55 = (void *)v51;
          objc_msgSend(v33, "addObject:", v51);

        }
        v89 = (void *)v45;
        v90 = v32;
        v38 = v44;
        v56 = v33;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        objc_msgSend(v94, "postersToDelete");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v103;
          do
          {
            for (j = 0; j != v59; ++j)
            {
              if (*(_QWORD *)v103 != v60)
                objc_enumerationMutation(v57);
              v62 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
              PBFLogDataStore();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                v64 = *(_QWORD *)(v21 + 32);
                *(_DWORD *)buf = 138543618;
                v118 = v64;
                v119 = 2114;
                v120 = (uint64_t)v62;
                _os_log_impl(&dword_1CB9FA000, v63, OS_LOG_TYPE_DEFAULT, "[%{public}@] poster to delete: %{public}@", buf, 0x16u);
              }

              objc_msgSend(v62, "pbf_posterUUID");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              +[PBFPosterRoleCoordinatorChange removePosterFromRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "removePosterFromRole:matchingUUID:", v38, v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "addObject:", v66);

            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
          }
          while (v59);
        }

        v10 = v92;
        v33 = v56;
        v32 = v90;
        v26 = v94;
      }

      v67 = *(void **)(v21 + 56);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterUpdate for %@"), v32);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 0;
      LOBYTE(v67) = objc_msgSend(v67, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v33, 0, 1, v68, 0, &v101);
      v44 = v101;

      if ((v67 & 1) != 0)
      {
        v69 = v26;
        v70 = *(void **)(v21 + 56);
        objc_msgSend(*(id *)(v21 + 40), "serverIdentity");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "posterUUID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "_stateLock_posterConfigurationPathForUUID:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        PBFLogDataStore();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = *(_QWORD *)(v21 + 32);
          *(_DWORD *)buf = 138543618;
          v118 = v75;
          v119 = 2114;
          v120 = (uint64_t)v73;
          _os_log_impl(&dword_1CB9FA000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully performed updates; new path: %{public}@",
            buf,
            0x16u);
        }

        v76 = *(NSObject **)(*(_QWORD *)(v21 + 56) + 200);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_250;
        block[3] = &unk_1E86F2A48;
        v96 = *(id *)(v21 + 32);
        v97 = *(id *)(v21 + 48);
        v98 = v73;
        v100 = *(id *)(v21 + 64);
        v99 = v10;
        v77 = v73;
        dispatch_async(v76, block);

        v41 = v93;
        v26 = v69;
      }
      else
      {
        v41 = v93;
        if (v44)
        {
          v77 = v44;
        }
        else
        {
          v78 = (void *)MEMORY[0x1E0CB35C8];
          v112 = *MEMORY[0x1E0CB2D68];
          v113 = CFSTR("The update was rejected for a reason which defies explanation");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "pbf_generalErrorWithCode:userInfo:", 0, v79);
          v80 = objc_claimAutoreleasedReturnValue();

          v77 = v80;
        }
        PBFLogDataStore();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_2();

        (*(void (**)(void))(*(_QWORD *)(v21 + 64) + 16))();
      }
LABEL_59:

      goto LABEL_60;
    }
    if (v30)
    {
      v42 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v118 = v42;
      _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] firing completion handler; updates were rejected because there were some missing updates",
        buf,
        0xCu);
    }

    v43 = *(_QWORD *)(a1 + 64);
    v41 = v93;
    if (v93)
    {
      (*(void (**)(uint64_t, _QWORD, id, id))(v43 + 16))(v43, 0, v10, v93);
    }
    else
    {
      v52 = (void *)MEMORY[0x1E0CB35C8];
      v110 = *MEMORY[0x1E0CB2D68];
      v111 = CFSTR("The update was rejected because some results did not come in for some updates");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "pbf_generalErrorWithCode:userInfo:", 0, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id, void *))(v43 + 16))(v43, 0, v10, v54);

    }
  }
  else
  {
    PBFLogDataStore();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v93;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_1();

    (*(void (**)(_QWORD, _QWORD, id, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, v10, v93);
  }
LABEL_60:

}

uint64_t __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_250(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PBFLogDataStore();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1CB9FA000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] firing completion handler for updates %{public}@", (uint8_t *)&v9, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "bs_containsObjectPassingTest:", &__block_literal_global_253))
  {
    PBFLogDataStore();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0D7FB50], "loadAmbientWidgetLayoutForPath:error:", *(_QWORD *)(a1 + 48), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] ambient identifiers: %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

BOOL __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_251(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 9;
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:(id)a3 toPath:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v16;
  void *v17;
  PFPosterExtensionInstanceProvider *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  PFPosterExtensionInstanceProvider *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  PBFRuntimeAssertionProviding *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  PBFRuntimeAssertionProviding *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  id v53;
  id v54;
  char v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  unint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  BOOL v142;
  void *v143;
  void *v144;
  char v145;
  char v146;
  int v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  const __CFString *v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  BOOL v170;
  int v171;
  id v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  int v184;
  id v185;
  void *v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  void *v196;
  PBFPosterConfigurationUpdateResult *v197;
  void *v198;
  PBFPosterConfigurationUpdateResult *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  uint64_t v209;
  id v210;
  void *v211;
  void *v212;
  id v213;
  id v214;
  void *v215;
  void *v216;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  __CFString *v223;
  unint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  void *v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  uint64_t v240;
  uint64_t v241;
  unint64_t v242;
  void *v243;
  int v244;
  void *v245;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  uint64_t v254;
  id obj;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  id v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  id v271;
  id v272;
  void *v273;
  void *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  void *v279;
  void *v280;
  uint64_t *v281;
  void *v283;
  id v284;
  void *v285;
  void *v286;
  id v287;
  void *v288;
  void *v289;
  void *v290;
  id v291;
  id v292;
  id v293;
  id v294;
  id v295;
  id v296;
  id v297;
  id v298;
  id v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  id v304;
  id v305;
  id v306;
  id v307;
  _QWORD aBlock[4];
  id v309;
  PFPosterExtensionInstanceProvider *v310;
  id v311;
  uint64_t *v312;
  uint64_t *v313;
  uint64_t *v314;
  uint64_t *v315;
  _QWORD *v316;
  uint64_t v317;
  id *v318;
  uint64_t v319;
  uint64_t (*v320)(uint64_t, uint64_t);
  void (*v321)(uint64_t);
  id v322;
  uint64_t v323;
  uint64_t *v324;
  uint64_t v325;
  uint64_t (*v326)(uint64_t, uint64_t);
  void (*v327)(uint64_t);
  id v328;
  id v329;
  uint64_t v330;
  uint64_t *v331;
  uint64_t v332;
  uint64_t (*v333)(uint64_t, uint64_t);
  void (*v334)(uint64_t);
  id v335;
  uint64_t v336;
  uint64_t *v337;
  uint64_t v338;
  uint64_t (*v339)(uint64_t, uint64_t);
  void (*v340)(uint64_t);
  id v341;
  _QWORD v342[5];
  id v343;
  uint64_t v344;
  const __CFString *v345;
  uint64_t v346;
  const __CFString *v347;
  uint64_t v348;
  const __CFString *v349;
  uint64_t v350;
  const __CFString *v351;
  const __CFString *v352;
  const __CFString *v353;
  uint64_t v354;
  const __CFString *v355;
  uint64_t v356;
  const __CFString *v357;
  uint64_t v358;
  const __CFString *v359;
  uint64_t v360;
  const __CFString *v361;
  uint64_t v362;
  const __CFString *v363;
  uint64_t v364;
  const __CFString *v365;
  uint64_t v366;
  const __CFString *v367;
  uint64_t v368;
  const __CFString *v369;
  _BYTE v370[128];
  uint64_t v371;
  const __CFString *v372;
  uint64_t v373;
  const __CFString *v374;
  _QWORD v375[2];
  _QWORD v376[4];

  v376[2] = *MEMORY[0x1E0C80C00];
  v291 = a3;
  v9 = a4;
  v10 = a6;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v11);

    }
    goto LABEL_213;
  }
  objc_msgSend(v9, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[path identity] type] == PFServerPosterTypeConfiguration"));
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:].cold.4();
    objc_msgSend(objc_retainAutorelease(v204), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA0F6DCLL);
  }
  v14 = v291;
  NSClassFromString(CFSTR("NSArray"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v205), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA0F740);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v206), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA0F7A4);
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion != nil"));
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v207), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA0F808);
  }
  v285 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v9);
  objc_msgSend(v9, "identity");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "role");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "provider");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v342[0] = 0;
  v342[1] = v342;
  v342[2] = 0x3032000000;
  v342[3] = __Block_byref_object_copy_;
  v342[4] = __Block_byref_object_dispose_;
  runtimeAssertionProvider = self->_runtimeAssertionProvider;
  objc_msgSend(CFSTR("applyUpdates:toPath:powerLogReason:completion: ->"), "stringByAppendingString:", v289);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFRuntimeAssertionProviding acquirePosterUpdateRuntimeAssertionForReason:target:](runtimeAssertionProvider, "acquirePosterUpdateRuntimeAssertionForReason:target:", v16, v17);
  v343 = (id)objc_claimAutoreleasedReturnValue();

  v336 = 0;
  v337 = &v336;
  v338 = 0x3032000000;
  v339 = __Block_byref_object_copy_;
  v340 = __Block_byref_object_dispose_;
  v341 = 0;
  v330 = 0;
  v331 = &v330;
  v332 = 0x3032000000;
  v333 = __Block_byref_object_copy_;
  v334 = __Block_byref_object_dispose_;
  v335 = 0;
  v18 = self->_instanceCollection;
  -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v289);
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFPosterExtensionProvider instanceProvider](self->_extensionProvider, "instanceProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v329 = 0;
  objc_msgSend(v20, "acquireInstanceForExtension:reason:error:", v288, CFSTR("PosterUpdates"), &v329);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v287 = v329;

  v323 = 0;
  v324 = &v323;
  v325 = 0x3032000000;
  v326 = __Block_byref_object_copy_;
  v327 = __Block_byref_object_dispose_;
  v328 = 0;
  v22 = &v317;
  v317 = 0;
  v318 = (id *)&v317;
  v319 = 0x3032000000;
  v320 = __Block_byref_object_copy_;
  v321 = __Block_byref_object_dispose_;
  v322 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PBFPosterExtensionDataStore__stateLock_convertPosterUpdatesToRoleCoordinatorChanges_toPath_powerLogReason_completion___block_invoke;
  aBlock[3] = &unk_1E86F2A98;
  v311 = v10;
  v284 = v21;
  v309 = v284;
  v23 = v18;
  v310 = v23;
  v312 = &v323;
  v313 = &v317;
  v314 = &v336;
  v315 = &v330;
  v316 = v342;
  v24 = _Block_copy(aBlock);
  if (v287 || !v288)
  {
    v28 = v287;
    if (!v287)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v375[0] = *MEMORY[0x1E0CB2D50];
      v375[1] = CFSTR("provider");
      v376[0] = CFSTR("Unable to build up a new extension instance to service applying updates");
      objc_msgSend(v290, "provider");
      v30 = objc_claimAutoreleasedReturnValue();
      v22 = (uint64_t *)v30;
      v31 = CFSTR("(null provider)");
      if (v30)
        v31 = (const __CFString *)v30;
      v376[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v376, v375, 2);
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pbf_dataStoreErrorWithCode:userInfo:", -2211, v283);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v28);
    v281 = v22;
    if (!v287)
      goto LABEL_211;
    goto LABEL_212;
  }
  -[NSDictionary objectForKey:](self->_roleToRoleCoordinator, "objectForKey:", v286);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "posterCollection");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = (uint64_t *)v25;
  objc_msgSend((id)objc_opt_class(), "supportedAttributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "attributesForPoster:ofTypes:", v285, v26);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  v307 = 0;
  objc_msgSend(v284, "pr_assetUpdaterWithError:", &v307);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v307;
  v278 = v27;
  if (v27)
  {
    (*((void (**)(void *, _QWORD, _QWORD, id))v24 + 2))(v24, 0, 0, v27);
    goto LABEL_210;
  }
  if (!v280 || (objc_msgSend(v280, "isValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2211, MEMORY[0x1E0C9AA70]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v45);
    goto LABEL_209;
  }
  objc_msgSend(v280, "auditToken");
  v276 = objc_claimAutoreleasedReturnValue();
  if (!v276)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2210, MEMORY[0x1E0C9AA70]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v46);
    goto LABEL_208;
  }
  objc_msgSend(v280, "target");
  v277 = objc_claimAutoreleasedReturnValue();
  if (!v277)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2209, MEMORY[0x1E0C9AA70]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v47);
    goto LABEL_207;
  }
  v32 = self->_runtimeAssertionProvider;
  objc_msgSend(CFSTR("applyUpdates:toPath:powerLogReason:completion: update for "), "stringByAppendingString:", v289);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFRuntimeAssertionProviding acquirePosterUpdateRuntimeAssertionForReason:target:](v32, "acquirePosterUpdateRuntimeAssertionForReason:target:", v33, v277);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v337[5];
  v337[5] = v34;

  v36 = self->_runtimeAssertionProvider;
  objc_msgSend(CFSTR("applyUpdates:toPath:powerLogReason:completion: entitled update for %@"), "stringByAppendingString:", v289);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFRuntimeAssertionProviding acquirePosterUpdateMemoryAssertionForReason:target:auditToken:posterProviderBundleIdentifier:](v36, "acquirePosterUpdateMemoryAssertionForReason:target:auditToken:posterProviderBundleIdentifier:", v37, v277, v276, v289);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v331[5];
  v331[5] = v38;

  -[PBFPosterExtensionDataStore _stateLock_switcherConfiguration](self, "_stateLock_switcherConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_childPosterConfigurationForConfiguration:", v285);
  v273 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v273, "_path");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "serverIdentity");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v286);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "_path");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v271 = v42;
  objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v286);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "_path");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v266 = (void *)objc_opt_new();
  v306 = 0;
  objc_msgSend(v285, "loadConfiguredPropertiesWithError:", &v306);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v306;
  v259 = v44;
  if (v44)
  {
    (*((void (**)(void *, _QWORD, _QWORD, id))v24 + 2))(v24, 0, 0, v44);
    v264 = 0;
    v261 = v271;
    goto LABEL_206;
  }
  v48 = (void *)objc_msgSend(v43, "mutableCopy");
  v49 = v48;
  v252 = v43;
  if (v48)
  {
    v272 = v48;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FB40], "defaultConfiguredPropertiesForRole:", v286);
    v272 = (id)objc_claimAutoreleasedReturnValue();
  }

  v50 = (void *)objc_msgSend(v279, "mutableCopy");
  v51 = v50;
  if (v50)
    v260 = v50;
  else
    v260 = (id)objc_opt_new();

  objc_msgSend(v14, "bs_firstObjectPassingTest:", &__block_literal_global_280);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  v253 = (void *)objc_opt_new();
  v305 = 0;
  v52 = objc_msgSend(v270, "copyContentsOfConfiguration:error:", v285, &v305);
  v53 = v305;
  v54 = v53;
  if ((v52 & 1) == 0)
  {
    v190 = v53;
    if (!v53)
    {
      v191 = (void *)MEMORY[0x1E0CB35C8];
      v373 = *MEMORY[0x1E0CB2D68];
      v374 = CFSTR("Unable to copy contents of existing poster into temporary poster");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v374, &v373, 1);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "pbf_generalErrorWithCode:userInfo:", 7, v267);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v190);
LABEL_189:
    v264 = 0;
    v261 = v271;
    if (!v54)
      goto LABEL_203;
    goto LABEL_205;
  }

  if (!v273)
    goto LABEL_37;
  v304 = 0;
  v55 = objc_msgSend(v268, "copyContentsOfConfiguration:error:", v273, &v304);
  v56 = v304;
  v54 = v56;
  if ((v55 & 1) == 0)
  {
    v190 = v56;
    if (!v56)
    {
      v192 = (void *)MEMORY[0x1E0CB35C8];
      v371 = *MEMORY[0x1E0CB2D68];
      v372 = CFSTR("Unable to copy contents of existing assoc poster into temporary poster");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v372, &v371, 1);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "pbf_generalErrorWithCode:userInfo:", 7, v267);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v190);
    goto LABEL_189;
  }

LABEL_37:
  v267 = (void *)objc_opt_new();
  v302 = 0u;
  v303 = 0u;
  v300 = 0u;
  v301 = 0u;
  obj = v14;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v300, v370, 16);
  if (!v57)
  {
    v264 = 0;
    v261 = v271;
    goto LABEL_192;
  }
  v264 = 0;
  v258 = *(_QWORD *)v301;
  v246 = *MEMORY[0x1E0CB2D68];
  v241 = *MEMORY[0x1E0D7FC10];
  v240 = *MEMORY[0x1E0D7F750];
  v254 = *MEMORY[0x1E0D7F758];
  v256 = *MEMORY[0x1E0D7FC30];
  v234 = *MEMORY[0x1E0D7FC18];
  v261 = v271;
LABEL_39:
  v275 = 0;
  v257 = v57;
  while (2)
  {
    if (*(_QWORD *)v301 != v258)
      objc_enumerationMutation(obj);
    v274 = *(void **)(*((_QWORD *)&v300 + 1) + 8 * v275);
    v58 = objc_msgSend(v274, "type");
    v59 = v58;
    v54 = 0;
    v60 = 1;
    switch(v58)
    {
      case 0:
        goto LABEL_53;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 8:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
        if (objc_msgSend(v286, "isEqual:", v254))
        {
          v61 = v274;
          v62 = v61;
          if (v59 == 3)
          {
            v63 = objc_alloc(MEMORY[0x1E0D7F6B8]);
            objc_msgSend(v62, "payload");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (v273)
              v65 = objc_msgSend(v63, "_initWithUpdateType:payload:", 4, v64);
            else
              v65 = objc_msgSend(v63, "_initWithUpdateType:payload:", 5, v64);
            v66 = (void *)v65;

          }
          else
          {
            v66 = v61;
          }
          v299 = 0;
          v60 = objc_msgSend(v272, "applyUpdate:error:", v66, &v299);
          v54 = v299;

LABEL_53:
          if (!v60 || v54)
            goto LABEL_195;
          if (v59 <= 0xF)
          {
            if (((1 << v59) & 0xE078) != 0)
            {
              objc_msgSend(v272, "homeScreenConfiguration");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = (void *)objc_msgSend(v67, "copy");
              objc_msgSend(v260, "setObject:forKeyedSubscript:", v68, v256);
LABEL_58:

              goto LABEL_59;
            }
            if (v59 == 12)
            {
              objc_msgSend(v272, "ambientConfiguration");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = (void *)objc_msgSend(v67, "copy");
              objc_msgSend(v260, "setObject:forKeyedSubscript:", v68, v234);
              goto LABEL_58;
            }
          }
LABEL_59:
          objc_msgSend(MEMORY[0x1E0D7F6E8], "successfulUpdateResultForUpdate:", v274);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "addObject:", v69);

          if (v257 != ++v275)
            continue;
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v300, v370, 16);
          if (!v57)
          {
LABEL_192:

            goto LABEL_199;
          }
          goto LABEL_39;
        }
        v193 = (void *)MEMORY[0x1E0CB35C8];
        v368 = v246;
        v369 = CFSTR("This attribute is incompatible with this role");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v369, &v368, 1);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v194);
        v195 = objc_claimAutoreleasedReturnValue();
LABEL_194:
        v54 = (id)v195;

LABEL_195:
        if (!v54)
        {
LABEL_196:
          objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 7, 0);
          v54 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0D7F6E8], "failedUpdateResultForUpdate:error:", v274, v54);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "addObject:", v196);

        if (v54)
        {
          (*((void (**)(void *, _QWORD, void *, id))v24 + 2))(v24, 0, v267, v54);
          goto LABEL_204;
        }
LABEL_199:
        if (v247)
        {
          v197 = [PBFPosterConfigurationUpdateResult alloc];
          v198 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v9);
          v199 = -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:](v197, "initWithConfiguration:updates:changes:", v198, obj, v253);
        }
        else
        {
          v200 = objc_alloc(MEMORY[0x1E0D7FA60]);
          objc_msgSend(v9, "identity");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v201, "posterUUID");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identity");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          v198 = (void *)objc_msgSend(v200, "initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:", v265, v202, v203, v272, v260);

          v199 = -[PBFPosterConfigurationUpdateResult initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:]([PBFPosterConfigurationUpdateResult alloc], "initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:", v198, v264, v266);
        }
        v190 = v199;

        (*((void (**)(void *, void *, void *, _QWORD))v24 + 2))(v24, v190, v267, 0);
        v54 = 0;
LABEL_203:

LABEL_204:
LABEL_205:

        v43 = v252;
LABEL_206:

        v47 = v273;
LABEL_207:

        v46 = (void *)v277;
LABEL_208:

        v45 = (void *)v276;
LABEL_209:

LABEL_210:
        v28 = v279;
LABEL_211:

LABEL_212:
        _Block_object_dispose(&v317, 8);

        _Block_object_dispose(&v323, 8);
        _Block_object_dispose(&v330, 8);

        _Block_object_dispose(&v336, 8);
        _Block_object_dispose(v342, 8);

LABEL_213:
        return;
      case 6:
        v242 = v58;
        objc_msgSend(v274, "payload");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_opt_class();
        __BSSafeCast(v70, v71);
        v248 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v248)
        {
          v109 = (void *)MEMORY[0x1E0CB35C8];
          v354 = v246;
          v355 = CFSTR("Home Screen Apperance payload was invalid");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v355, &v354, 1);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v110);
          v54 = (id)objc_claimAutoreleasedReturnValue();
          v60 = 0;

          goto LABEL_162;
        }
        objc_msgSend(v272, "homeScreenConfiguration");
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (void *)objc_msgSend(v231, "mutableCopy");
        v73 = v72;
        if (v72)
        {
          v235 = v72;
        }
        else
        {
          v115 = (void *)MEMORY[0x1E0D7FA88];
          objc_msgSend(v9, "identity");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "provider");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "role");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "defaultHomeScreenConfigurationForProvider:role:", v117, v118);
          v235 = (id)objc_claimAutoreleasedReturnValue();

        }
        v224 = objc_msgSend(v248, "updatedAppearanceType") - 1;
        if (v224 < 4)
          objc_msgSend(v235, "setSelectedAppearanceType:", v224);
        objc_msgSend(v248, "solidColorAppearance");
        v229 = (void *)objc_claimAutoreleasedReturnValue();

        if (v229)
        {
          objc_msgSend(v231, "solidColorAppearance");
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = objc_alloc(MEMORY[0x1E0D7FAC0]);
          objc_msgSend(v248, "solidColorAppearance");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "color");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "UIColor");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = (void *)objc_msgSend(v119, "initWithColor:", v122);

          objc_msgSend(v221, "colorPickerConfiguration");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = (void *)objc_msgSend(v123, "copy");
          v125 = v124;
          if (v124)
            v126 = v124;
          else
            v126 = objc_alloc_init(MEMORY[0x1E0D7FA58]);
          v128 = v126;

          objc_msgSend(v128, "setSelectedColor:", v226);
          v129 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB70]), "initWithColor:colorPickerConfiguration:", v226, v128);
          objc_msgSend(v235, "setSolidColorAppearance:", v129);

        }
        objc_msgSend(v248, "gradientColorAppearance");
        v227 = (void *)objc_claimAutoreleasedReturnValue();

        if (v227)
        {
          objc_msgSend(v231, "gradientAppearance");
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_alloc(MEMORY[0x1E0D7FAC0]);
          objc_msgSend(v248, "gradientColorAppearance");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "color");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "UIColor");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v222 = (void *)objc_msgSend(v130, "initWithColor:", v133);

          objc_msgSend(v219, "colorPickerConfiguration");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = (void *)objc_msgSend(v134, "copy");
          v136 = v135;
          if (v135)
            v137 = v135;
          else
            v137 = objc_alloc_init(MEMORY[0x1E0D7FA58]);
          v138 = v137;

          objc_msgSend(v138, "setSelectedColor:", v222);
          v139 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB10]), "initWithColor:colorPickerConfiguration:", v222, v138);
          objc_msgSend(v235, "setGradientAppearance:", v139);

        }
        objc_msgSend(v248, "homeProviderIdentifier");
        v140 = (id)objc_claimAutoreleasedReturnValue();
        if (!v140)
          goto LABEL_118;
        objc_msgSend(v248, "homeProviderIdentifier");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = v141 == 0;

        if (!v142)
        {
          objc_msgSend(v273, "_path");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v218, "identity");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "provider");
          v220 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v248, "homeProviderIdentifier");
          v223 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v223);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v143) = v144 == 0;

          if ((_DWORD)v143)
          {
            v151 = (void *)MEMORY[0x1E0CB35C8];
            v352 = CFSTR("providerIdentifier");
            v152 = CFSTR("(null)");
            if (v223)
              v152 = v223;
            v353 = v152;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v353, &v352, 1);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v153);
            v140 = (id)objc_claimAutoreleasedReturnValue();
            v147 = 0;
            goto LABEL_150;
          }
          objc_msgSend(v248, "homeProviderUpdateSessionInfo");
          v217 = objc_claimAutoreleasedReturnValue();
          if (v273
            && ((v145 = objc_msgSend(v220, "isEqual:", v223), !v223) ? (v146 = 1) : (v146 = v145), (v146 & 1) == 0))
          {
            objc_msgSend(v266, "addObject:", v273);
            objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v286);
            v216 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v216, "_path");
            v158 = objc_claimAutoreleasedReturnValue();

            v261 = 0;
            v262 = (void *)v158;
          }
          else
          {
            v216 = v268;
          }
          -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "objectForKey:", v223);
          v269 = (void *)objc_claimAutoreleasedReturnValue();

          v297 = 0;
          -[PFPosterExtensionInstanceProvider acquireInstanceForExtension:reason:error:](v23, "acquireInstanceForExtension:reason:error:", v269, CFSTR("PosterUpdates"), &v297);
          v160 = objc_claimAutoreleasedReturnValue();
          v161 = v297;
          v162 = (void *)v324[5];
          v324[5] = v160;

          if (v161)
          {
            v163 = 0;
            v140 = v161;
          }
          else
          {
            v164 = (void *)v324[5];
            v296 = 0;
            objc_msgSend(v164, "pr_assetUpdaterWithError:", &v296);
            v213 = (id)objc_claimAutoreleasedReturnValue();
            v140 = v296;
            v163 = v213;
          }
          objc_storeStrong(v318 + 5, v163);
          if (!v161)

          v147 = 0;
          if (!v262 || v140)
            goto LABEL_149;
          v165 = v318[5];
          v295 = 0;
          -[PBFPosterExtensionDataStore _stateLock_prepareReloadConfigurationOperationForExtension:path:locationInUse:sessionInfo:powerLogReason:assetUpdater:error:](self, "_stateLock_prepareReloadConfigurationOperationForExtension:path:locationInUse:sessionInfo:powerLogReason:assetUpdater:error:", v223, v262, 0, v217, a5, v165, &v295);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = v295;
          if (v214)
          {
            v166 = v214;
            goto LABEL_147;
          }
          objc_msgSend((id)v324[5], "pr_addRefreshConfigurationOperation:waitUntilFinished:", v215, 1);
          objc_msgSend(v215, "error");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = v169 == 0;

          if (!v170)
          {
            objc_msgSend(v215, "error");
            v166 = (id)objc_claimAutoreleasedReturnValue();
LABEL_147:
            v140 = v166;
            v147 = 0;
LABEL_148:
            -[PFPosterExtensionInstanceProvider relinquishExtensionInstance:reason:](v23, "relinquishExtensionInstance:reason:", v324[5], CFSTR("PosterUpdates"));
            objc_msgSend(v318[5], "invalidate");

LABEL_149:
            v153 = (void *)v217;
            v268 = v216;
LABEL_150:

            goto LABEL_151;
          }
          objc_msgSend(v215, "postRefreshPosterConfiguration");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v212, "contentsURL");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "preRefreshPosterConfiguration");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "contentsURL");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = objc_msgSend(v174, "isEqual:", v176);

          if (v177)
          {
            v178 = (void *)MEMORY[0x1E0CB35C8];
            v350 = v246;
            v351 = CFSTR("Home Screen Poster rejected this update");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v351, &v350, 1);
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v178, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v179);
            v180 = objc_claimAutoreleasedReturnValue();
            goto LABEL_177;
          }
          if (v212)
          {
            v179 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v212);
            if (!v261)
            {
              v181 = (void *)MEMORY[0x1E0D7F8E0];
              objc_msgSend(v290, "descriptorIdentifier");
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              v183 = (void *)objc_opt_new();
              objc_msgSend(v181, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v223, v182, v286, v183, 0, 0);
              v261 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v286);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v294 = 0;
            v184 = objc_msgSend(v211, "copyContentsOfConfiguration:error:", v179, &v294);
            v140 = v294;
            if (v184)
            {
              v210 = v211;

              objc_msgSend(v210, "_path");
              v209 = objc_claimAutoreleasedReturnValue();

              v185 = objc_alloc(MEMORY[0x1E0D7FA60]);
              objc_msgSend(v261, "posterUUID");
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "pbf_posterUUID");
              v263 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D7FAE0], "defaultConfiguredPropertiesForRole:", v286);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              v188 = objc_msgSend(v185, "initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:", v209, v186, v263, v261, v187, 0);

              v264 = (void *)v188;
            }
            else
            {
              v209 = (uint64_t)v262;
              v210 = v216;
            }

            v147 = 1;
            v262 = (void *)v209;
            v216 = v210;
          }
          else
          {
            v189 = (void *)MEMORY[0x1E0CB35C8];
            v348 = v246;
            v349 = CFSTR("Home Screen Poster returned no configuration");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v349, &v348, 1);
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v189, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v179);
            v180 = objc_claimAutoreleasedReturnValue();
LABEL_177:
            v140 = (id)v180;
            v147 = 0;
          }

          goto LABEL_148;
        }
        v140 = 0;
LABEL_118:
        v147 = 0;
LABEL_151:
        objc_msgSend(v272, "setHomeScreenConfiguration:", v235);
        if (v224 < 4)
          v171 = 1;
        else
          v171 = v147;
        if (v229)
          v171 = 1;
        if (v227)
          v171 = 1;
        v54 = v140;
        if (v140)
          v60 = 0;
        else
          v60 = v171;

LABEL_162:
        goto LABEL_163;
      case 7:
        objc_msgSend(v274, "payload");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_opt_class();
        __BSSafeCast(v74, v75);
        v249 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v249
          || (objc_msgSend(v249, "switcherProviderUpdateSessionInfo"),
              v76 = (void *)objc_claimAutoreleasedReturnValue(),
              v77 = v76 == 0,
              v76,
              v77))
        {
          v102 = (void *)MEMORY[0x1E0CB35C8];
          v346 = v246;
          v347 = CFSTR("Home Screen Apperance payload was invalid for updating lock screen");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v347, &v346, 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v103);
          v104 = (id)objc_claimAutoreleasedReturnValue();
          v244 = 0;
          goto LABEL_100;
        }
        objc_msgSend(v249, "switcherProviderUpdateSessionInfo");
        v236 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identity");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "provider");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v293 = 0;
        -[PBFPosterExtensionDataStore _stateLock_prepareReloadConfigurationOperationForExtension:path:locationInUse:sessionInfo:powerLogReason:assetUpdater:error:](self, "_stateLock_prepareReloadConfigurationOperationForExtension:path:locationInUse:sessionInfo:powerLogReason:assetUpdater:error:", v79, v9, 0, v236, a5, v280, &v293);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = v293;

        if (v232)
        {
          v81 = v232;
LABEL_98:
          v104 = v81;
          v244 = 0;
          goto LABEL_99;
        }
        objc_msgSend(v284, "pr_addRefreshConfigurationOperation:waitUntilFinished:", v80, 1);
        objc_msgSend(v80, "error");
        v127 = (void *)objc_claimAutoreleasedReturnValue();

        if (v127)
        {
          objc_msgSend(v80, "error");
          v81 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_98;
        }
        objc_msgSend(v80, "postRefreshPosterConfiguration");
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v230, "contentsURL");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "preRefreshPosterConfiguration");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "contentsURL");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = objc_msgSend(v245, "isEqual:", v155);

        if (v156)
        {
          v157 = (void *)MEMORY[0x1E0CB35C8];
          v344 = v246;
          v345 = CFSTR("Lock Screen Poster rejected this update");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v345, &v344, 1);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v228);
          v104 = (id)objc_claimAutoreleasedReturnValue();
          v244 = 0;
        }
        else
        {
          v228 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v230);
          objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v286);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          v292 = 0;
          v244 = objc_msgSend(v225, "copyContentsOfConfiguration:error:", v228, &v292);
          v104 = v292;
          if (v244)
          {
            v172 = v225;

            objc_msgSend(v172, "_path");
            v173 = objc_claimAutoreleasedReturnValue();

            v265 = (void *)v173;
          }
          else
          {
            v172 = v270;
          }

          v270 = v172;
        }

LABEL_99:
        v103 = (void *)v236;
LABEL_100:

        v54 = v104;
        v60 = v244;
        goto LABEL_53;
      case 9:
      case 12:
        if (!objc_msgSend(v286, "isEqual:", v240))
        {
          v208 = (void *)MEMORY[0x1E0CB35C8];
          v366 = v246;
          v367 = CFSTR("This attribute is incompatible with this role");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v367, &v366, 1);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v208, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v194);
          v195 = objc_claimAutoreleasedReturnValue();
          goto LABEL_194;
        }
        v298 = 0;
        v60 = objc_msgSend(v272, "applyUpdate:error:", v274, &v298);
        v54 = v298;
        goto LABEL_53;
      case 10:
        v242 = v58;
        objc_msgSend(v274, "payload");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_opt_class();
        __BSSafeCast(v93, v94);
        v251 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v251, "propertyListRoot");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "objectForKey:", CFSTR("chargerIdentifier"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "supportedAttributes");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v97, "containsObject:", v241);

        if ((v98 & 1) == 0)
        {
          v107 = (void *)MEMORY[0x1E0CB35C8];
          v364 = v246;
          v365 = CFSTR("This attribute is incompatible with this role");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v365, &v364, 1);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v99);
          v108 = objc_claimAutoreleasedReturnValue();
LABEL_89:
          v54 = (id)v108;
          v101 = 0;
          goto LABEL_144;
        }
        if (!v251 || !v96)
        {
          v114 = (void *)MEMORY[0x1E0CB35C8];
          v362 = v246;
          v363 = CFSTR("Charger identifier payload was invalid");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v363, &v362, 1);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v99);
          v108 = objc_claimAutoreleasedReturnValue();
          goto LABEL_89;
        }
        objc_msgSend(v279, "objectForKey:", v241);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v99, "isAssociatedWithChargerIdentifier:", v96) & 1) != 0)
        {
          v100 = (void *)MEMORY[0x1E0CB35C8];
          v360 = v246;
          v361 = CFSTR("Charger identifier already associated with poster");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v361, &v360, 1);
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v238);
          v54 = (id)objc_claimAutoreleasedReturnValue();
          v101 = 0;

        }
        else
        {
          v148 = (void *)objc_msgSend(v99, "mutableCopy");
          v149 = v148;
          if (v148)
            v150 = v148;
          else
            v150 = (id)objc_opt_new();
          v239 = v150;

          objc_msgSend(v239, "associateWithChargerIdentifier:", v96);
          v233 = (void *)objc_msgSend(v239, "copy");
          if (v247)
          {
            objc_msgSend(v285, "pbf_posterUUID");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterRoleCoordinatorChange assignAttributeToPosterWithinRole:matchingUUID:attribute:](PBFPosterRoleCoordinatorChange, "assignAttributeToPosterWithinRole:matchingUUID:attribute:", v286, v167, v233);
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v253, "addObject:", v168);

          }
          else
          {
            objc_msgSend(v260, "setObject:forKeyedSubscript:", v233, v241);
          }

          v54 = 0;
          v101 = 1;

        }
LABEL_144:

        v60 = v101 != 0;
LABEL_163:
        v59 = v242;
        goto LABEL_53;
      case 11:
        v82 = v58;
        objc_msgSend(v274, "payload");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_opt_class();
        __BSSafeCast(v83, v84);
        v250 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v250, "propertyListRoot");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectForKey:", CFSTR("chargerIdentifier"));
        v243 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "supportedAttributes");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v86, "containsObject:", v241);

        if ((v87 & 1) == 0)
        {
          v105 = (void *)MEMORY[0x1E0CB35C8];
          v358 = v246;
          v359 = CFSTR("This attribute is incompatible with this role");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v359, &v358, 1);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v88);
          v106 = objc_claimAutoreleasedReturnValue();
LABEL_86:
          v112 = (void *)v106;
          v113 = 0;
          goto LABEL_87;
        }
        if (!v250 || !v243)
        {
          v111 = (void *)MEMORY[0x1E0CB35C8];
          v356 = v246;
          v357 = CFSTR("Charger identifier payload was invalid");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v357, &v356, 1);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v88);
          v106 = objc_claimAutoreleasedReturnValue();
          goto LABEL_86;
        }
        objc_msgSend(v279, "objectForKey:", v241);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v88, "isAssociatedWithChargerIdentifier:", v243))
        {
          v237 = v88;
          v89 = (void *)objc_msgSend(v88, "mutableCopy");
          objc_msgSend(v89, "disassociateFromChargerIdentifier:", v243);
          v90 = (void *)objc_msgSend(v89, "copy");
          if (v247)
          {
            objc_msgSend(v285, "pbf_posterUUID");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterRoleCoordinatorChange assignAttributeToPosterWithinRole:matchingUUID:attribute:](PBFPosterRoleCoordinatorChange, "assignAttributeToPosterWithinRole:matchingUUID:attribute:", v286, v91, v90);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v253, "addObject:", v92);

          }
          else
          {
            objc_msgSend(v260, "setObject:forKeyedSubscript:", v90, v241);
          }

          v112 = 0;
          v113 = 1;
          v88 = v237;
        }
        else
        {
          v113 = 0;
          v112 = 0;
        }
LABEL_87:

        v59 = v82;
        v54 = v112;
        v60 = v113;
        goto LABEL_53;
      default:
        goto LABEL_196;
    }
  }
}

uint64_t __120__PBFPosterExtensionDataStore__stateLock_convertPosterUpdatesToRoleCoordinatorChanges_toPath_powerLogReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "relinquishExtensionInstance:reason:", v2, CFSTR("PosterUpdates"));
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "relinquishExtensionInstance:reason:", v3, CFSTR("PosterUpdates"));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v4)
    objc_msgSend(v4, "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "invalidate");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "invalidate");
}

uint64_t __120__PBFPosterExtensionDataStore__stateLock_convertPosterUpdatesToRoleCoordinatorChanges_toPath_powerLogReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateNecessitatesPosterUpdate");
}

- (id)providerForPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterExtensionDataStore providerForExtensionIdentifier:](self, "providerForExtensionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)providerForExtensionIdentifier:(id)a3
{
  PFPosterExtensionProvider *extensionProvider;
  id v4;
  void *v5;
  void *v6;

  extensionProvider = self->_extensionProvider;
  v4 = a3;
  -[PFPosterExtensionProvider extensionForIdentifier](extensionProvider, "extensionForIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)acquireExtensionInstance:(id)a3 reason:(id)a4 error:(id *)a5
{
  return (id)-[PFPosterExtensionProvider acquireInstanceForExtensionWithIdentifier:reason:error:](self->_extensionProvider, "acquireInstanceForExtensionWithIdentifier:reason:error:", a3, a4, a5);
}

- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4
{
  -[PFPosterExtensionProvider relinquishExtensionInstanceWithIdentifier:reason:](self->_extensionProvider, "relinquishExtensionInstanceWithIdentifier:reason:", a3, a4);
}

- (id)defaultInstanceForExtensionIdentifier:(id)a3
{
  return (id)-[PFPosterExtensionProvider defaultInstanceOfProvider:error:](self->_extensionProvider, "defaultInstanceOfProvider:error:", a3, 0);
}

- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:](self, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pbf_posterSnapshotCoordinatorForIdentity:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pbf_enumerateSnapshotCoordinators:(id)a3
{
  id v4;
  os_unfair_lock_s *p_extensionProvidingLock;
  NSMutableDictionary *extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  p_extensionProvidingLock = &self->_extensionProvidingLock;
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke;
  v8[3] = &unk_1E86F2B08;
  v9 = v4;
  v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_extensionProvidingLock);

}

void __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke_2;
  v6[3] = &unk_1E86F2AE0;
  v7 = *(id *)(a1 + 32);
  v8 = a4;
  objc_msgSend(a3, "pbf_enumerateSnapshotCoordinators:", v6);

}

uint64_t __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    **(_BYTE **)(a1 + 40) = 1;
  }
  return result;
}

- (id)pbf_posterExtensionStoreCoordinatorForProviderIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_extensionProvidingLock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    if (!a4)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v17[0] = CFSTR("providerIdentifier was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_7;
  }
  p_extensionProvidingLock = &self->_extensionProvidingLock;
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  -[NSMutableDictionary objectForKey:](self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_extensionProvidingLock);
  if (a4 && !v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("providerIdentifier");
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    *a4 = v11;

  }
LABEL_9:

  return v8;
}

- (id)pbf_posterExtensionStoreCoordinatorsForRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__PBFPosterExtensionDataStore_pbf_posterExtensionStoreCoordinatorsForRole___block_invoke;
  v23[3] = &unk_1E86F2B30;
  v7 = v4;
  v24 = v7;
  objc_msgSend(v6, "bs_filter:", v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_324);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_opt_new();
    os_unfair_lock_lock(&self->_extensionProvidingLock);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          -[NSMutableDictionary objectForKey:](self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bs_safeAddObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v13);
    }

    os_unfair_lock_unlock(&self->_extensionProvidingLock);
    v17 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

uint64_t __75__PBFPosterExtensionDataStore_pbf_posterExtensionStoreCoordinatorsForRole___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "supportedRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __75__PBFPosterExtensionDataStore_pbf_posterExtensionStoreCoordinatorsForRole___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterExtensionBundleIdentifier");
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 completion:(id)a5
{
  -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:](self, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", a3, a4, *MEMORY[0x1E0D7FC58], a5);
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  id v16;
  __CFString *v17;
  uint64_t v18;
  id v19;
  id v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  id v47;
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
  NSObject *v61;
  id v62;
  id v63;
  objc_class *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void (**v68)(_QWORD, _QWORD, _QWORD);
  void *v69;
  id v70;
  void *v71;
  void *v73;
  void (**v74)(void);
  void (**v75)(void *, id);
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  __CFString *v82;
  _BYTE *v83;
  id v84;
  _QWORD v85[4];
  void (**v86)(void);
  id v87;
  _QWORD aBlock[6];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  _BYTE buf[24];
  PBFPosterExtensionDataStore *v96;
  __int128 v97;
  __int16 v98;
  void *v99;
  void *v100;
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  const __CFString *v105;
  _QWORD v106[4];

  v106[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA10944);
  }
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
  v15 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA109A8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.7();
    objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA10A0CLL);
  }

  v16 = v12;
  NSClassFromString(CFSTR("NSString"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA10A70);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.6();
    objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA10AD4);
  }

  v17 = (__CFString *)v11;
  if (v17)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.5();
      objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA10B38);
    }
  }

  -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v16);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    os_unfair_lock_lock(&self->_stateLock);
    v89 = 0;
    v90 = &v89;
    v91 = 0x3032000000;
    v92 = __Block_byref_object_copy_;
    v93 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v16);
    v94 = (id)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    aBlock[3] = &unk_1E86F2B98;
    aBlock[4] = self;
    aBlock[5] = &v89;
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_2;
    v85[3] = &unk_1E86F2BC0;
    v74 = _Block_copy(aBlock);
    v86 = v74;
    v70 = v14;
    v87 = v70;
    v75 = (void (**)(void *, id))_Block_copy(v85);
    v84 = 0;
    -[PBFPosterExtensionDataStore pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:](self, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v15, &v84);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v84;
    v20 = v19;
    if (!v76)
    {
      if (!v19)
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v103[0] = CFSTR("providerIdentifier");
        v103[1] = CFSTR("posterDescriptorIdentifier");
        v31 = CFSTR("(null descriptorIdentifier)");
        if (v17)
          v31 = v17;
        v104[0] = v15;
        v104[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v32);
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      v75[2](v75, v20);
      goto LABEL_34;
    }
    if (!v17)
    {
      v25 = v19;
      goto LABEL_26;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v96 = (PBFPosterExtensionDataStore *)__Block_byref_object_copy_;
    *(_QWORD *)&v97 = __Block_byref_object_dispose_;
    *((_QWORD *)&v97 + 1) = 0;
    v81[0] = v18;
    v81[1] = 3221225472;
    v81[2] = __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_3;
    v81[3] = &unk_1E86F2BE8;
    v21 = v17;
    v82 = v21;
    v83 = buf;
    objc_msgSend(v76, "enumerateDescriptorStoreCoordinators:", v81);
    v22 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v22)
    {
      v23 = (void *)v90[5];
      objc_msgSend(v22, "pathOfLatestVersion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0;
      LOBYTE(v23) = objc_msgSend(v23, "copyContentsOfPath:error:", v24, &v80);
      v25 = v80;

      if ((v23 & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identityOfLatestVersion");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 1;
        goto LABEL_24;
      }
      v75[2](v75, v25);
    }
    else
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v101[0] = CFSTR("providerIdentifier");
      v101[1] = CFSTR("posterDescriptorIdentifier");
      v102[0] = v15;
      v102[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "pbf_dataStoreErrorWithCode:userInfo:", -2218, v34);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v75[2](v75, v25);
    }
    v73 = 0;
    v26 = 0;
LABEL_24:

    _Block_object_dispose(buf, 8);
    if (!v26)
    {
      v20 = v25;
LABEL_33:

LABEL_34:
      _Block_object_dispose(&v89, 8);

      goto LABEL_35;
    }
    if (v73)
    {
LABEL_27:
      objc_msgSend(v77, "defaultAttributesForNewPosterFromProvider:", v15);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)objc_msgSend(v37, "mutableCopy");

      v38 = objc_alloc(MEMORY[0x1E0D7FA60]);
      objc_msgSend((id)v90[5], "_path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FAE0], "defaultConfiguredPropertiesForRole:", v16);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v38, "initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:", v39, 0, v73, v40, v71);

      objc_msgSend(v41, "trackTemporaryState:", v90[5]);
      v42 = v41;
      v43 = v25;
      v68 = v14;
      v69 = v42;
      +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v16);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v67;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0;
      -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContext](self, "_buildRoleCoordinatorTransitionContext");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0;
      v46 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v44, &v79, 0, CFSTR("posterCreation"), v45, &v78);
      v47 = v79;
      v20 = v78;

      if (v46)
      {
        v74[2]();
        objc_msgSend(v47, "objectForKeyedSubscript:", v16);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (!v48)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleDiffInspector != nil"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = MEMORY[0x1E0C81028];
          v62 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v63 = (id)objc_claimAutoreleasedReturnValue();
            v64 = (objc_class *)objc_opt_class();
            NSStringFromClass(v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            *(_QWORD *)&buf[4] = v63;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v65;
            *(_WORD *)&buf[22] = 2048;
            v96 = self;
            LOWORD(v97) = 2114;
            *(_QWORD *)((char *)&v97 + 2) = CFSTR("PBFPosterExtensionDataStore.m");
            WORD5(v97) = 1024;
            HIDWORD(v97) = 2159;
            v98 = 2114;
            v99 = v60;
            _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v60), "UTF8String");
          v66 = _bs_set_crash_log_message();
          -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.4(v66);
        }
        v50 = (void *)objc_msgSend(v48, "newCollection");
        objc_msgSend(v69, "destinationUUID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "posterWithUUID:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "_path");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, id))v70 + 2))(v70, v53, v20);

      }
      else
      {
        v75[2](v75, v20);
      }

      v14 = v68;
      goto LABEL_33;
    }
LABEL_26:
    v35 = (void *)MEMORY[0x1E0D7F8E0];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v15, v17, v16, v36, 0, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  v27 = (void *)MEMORY[0x1E0CB35C8];
  v105 = CFSTR("roleIdentifier");
  v106[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v29);

LABEL_35:
}

void __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
}

void __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

}

void __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "descriptorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = v8;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore refreshPosterConfigurationMatchingUUID:sessionInfo:completion:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA10EF4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore refreshPosterConfigurationMatchingUUID:sessionInfo:completion:].cold.1();
    goto LABEL_9;
  }

  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_enqueueRefreshPosterConfigurationMatchingUUID:sessionInfo:powerLogReason:completion:](self, "_stateLock_enqueueRefreshPosterConfigurationMatchingUUID:sessionInfo:powerLogReason:completion:", v12, v9, 3, v10);
  os_unfair_lock_unlock(&self->_stateLock);

}

- (id)posterConfigurations
{
  return -[PBFPosterExtensionDataStore posterConfigurationsForRole:error:](self, "posterConfigurationsForRole:error:", *MEMORY[0x1E0D7FC58], 0);
}

- (id)posterConfigurationsForRole:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PBFPosterExtensionDataStore posterCollectionForRole:error:](self, "posterCollectionForRole:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedPosters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_341);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __65__PBFPosterExtensionDataStore_posterConfigurationsForRole_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_path");
}

- (id)posterCollectionForRole:(id)a3 error:(id *)a4
{
  __CFString *v6;
  os_unfair_lock_s *p_stateLock;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "posterCollection");
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    if (v6)
      v11 = v6;
    else
      v11 = CFSTR("(null role identifier)");
    v14 = CFSTR("roleIdentifier");
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);

  return a4;
}

- (id)posterConfigurationsForExtension:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_stateLock;
  NSDictionary *roleToRoleCoordinator;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  roleToRoleCoordinator = self->_roleToRoleCoordinator;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke;
  v15 = &unk_1E86F2C78;
  v16 = v4;
  v17 = v5;
  v8 = v5;
  v9 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](roleToRoleCoordinator, "enumerateKeysAndObjectsUsingBlock:", &v12);
  os_unfair_lock_unlock(p_stateLock);
  v10 = (void *)objc_msgSend(v8, "copy", v12, v13, v14, v15);

  return v10;
}

void __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(a3, "posterCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedPosters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke_2;
  v7[3] = &unk_1E86F2C50;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "pbf_posterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v7, "_path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (id)activePosterForRole:(id)a3 assocPoster:(id *)a4 error:(id *)a5
{
  __CFString *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  os_unfair_lock_s *p_activePosterLock;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  const __CFString *v29;
  const __CFString *v30;
  uint8_t buf[4];
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  PBFLogDataStore();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  PBFLogDataStore();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v8;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "activePosterForRole", "role: %{public}@", buf, 0xCu);
  }

  -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    p_activePosterLock = &self->_activePosterLock;
    os_unfair_lock_lock(&self->_activePosterLock);
    objc_msgSend(v13, "posterCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_activePosterLock_roleToActivePosterConfiguration, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_activePosterLock);
    if (!a5 || v16)
    {
      if (a4 && v16)
      {
        objc_msgSend(v15, "associatedPosterForPoster:", v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("(null role identifier)");
      if (v8)
        v18 = v8;
      v19 = *MEMORY[0x1E0CB2D68];
      v27[0] = CFSTR("roleIdentifier");
      v27[1] = v19;
      v28[0] = v18;
      v28[1] = CFSTR("No active poster could be determined for role");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    PBFLogRoleCoordinator();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[PBFPosterExtensionDataStore activePosterForRole:assocPoster:error:].cold.1();

    if (!a5)
    {
      v16 = 0;
      goto LABEL_21;
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    if (v8)
      v23 = v8;
    else
      v23 = CFSTR("(null role identifier)");
    v29 = CFSTR("roleIdentifier");
    v30 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v15);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:
  PBFLogDataStore();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v8;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v25, OS_SIGNPOST_INTERVAL_END, v10, "activePosterForRole", "role: %{public}@", buf, 0xCu);
  }

  return v16;
}

- (id)selectedPosterForRole:(id)a3 error:(id *)a4
{
  __CFString *v6;
  os_unfair_lock_s *p_stateLock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "posterCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedPoster");
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    if (v6)
      v12 = v6;
    else
      v12 = CFSTR("(null role identifier)");
    v15 = CFSTR("roleIdentifier");
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);

  return a4;
}

- (BOOL)updateSelectedPosterUUID:(id)a3 role:(id)a4 from:(id)a5 error:(id *)a6
{
  uint64_t (*v11)(uint64_t, uint64_t);
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_unfair_lock_s *p_stateLock;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  const __CFString *v30;
  int v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  NSObject *v42;
  NSObject *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  os_signpost_id_t v52;
  id v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  void *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  void *v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  const __CFString *v67;
  const __CFString *v68;
  _QWORD v69[2];
  _QWORD v70[5];

  v70[2] = *MEMORY[0x1E0C80C00];
  v11 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v12 = (__CFString *)a4;
  v53 = a5;
  if (v11)
  {
    PBFLogDataStore();
    v13 = objc_claimAutoreleasedReturnValue();
    v52 = os_signpost_id_generate(v13);

    PBFLogDataStore();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v53;
      *(_WORD *)&buf[22] = 2114;
      v64 = v11;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v52, "updateSelectedPosterUUID:role:from:", "role: %{public}@ bundleIdentifier: %{public}@ configurationUUID: %{public}@", buf, 0x20u);
    }

    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      if (!a6)
        goto LABEL_44;
      v29 = (void *)MEMORY[0x1E0CB35C8];
      if (v12)
        v30 = v12;
      else
        v30 = CFSTR("(null role identifier)");
      v67 = CFSTR("roleIdentifier");
      v68 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:

LABEL_44:
      os_unfair_lock_unlock(p_stateLock);
      PBFLogDataStore();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2114;
        v64 = v11;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v43, OS_SIGNPOST_INTERVAL_END, v52, "updateSelectedPosterUUID:role:from:", "role: %{public}@ bundleIdentifier: %{public}@ configurationUUID: %{public}@", buf, 0x20u);
      }

      v28 = *((_BYTE *)v56 + 24) != 0;
      _Block_object_dispose(&v55, 8);
      goto LABEL_48;
    }
    objc_msgSend(v17, "posterCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "posterWithUUID:", v11);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_activeChargerIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[__CFString isEqual:](v12, "isEqual:", *MEMORY[0x1E0D7FC00]);
    if (v50)
      v21 = v20;
    else
      v21 = 0;
    if (v21 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D7F6B8], "posterUpdateAssociateWithChargerIdentifier:");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v64 = __Block_byref_object_copy_;
        v65 = __Block_byref_object_dispose_;
        v66 = 0;
        v62 = v48;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __72__PBFPosterExtensionDataStore_updateSelectedPosterUUID_role_from_error___block_invoke;
        v54[3] = &unk_1E86F2CA0;
        v54[4] = buf;
        v54[5] = &v55;
        -[PBFPosterExtensionDataStore _stateLock_updatePosterConfiguration:updates:completion:](self, "_stateLock_updatePosterConfiguration:updates:completion:", v51, v22, v54);

        if (a6)
        {
          v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v23)
            *a6 = objc_retainAutorelease(v23);
        }
        _Block_object_dispose(buf, 8);

      }
    }
    else
    {
      if (!v51)
      {
        if (a6)
        {
          v32 = (void *)MEMORY[0x1E0CB35C8];
          if (v12)
            v33 = v12;
          else
            v33 = CFSTR("(null role identifier)");
          v60[0] = CFSTR("roleIdentifier");
          v60[1] = CFSTR("configurationUUID");
          v61[0] = v33;
          objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v11);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v61[1] = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v34);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_42;
      }
      objc_msgSend(v19, "selectedPoster");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore activePosterConfigurationForRole:assocPoster:](self, "activePosterConfigurationForRole:assocPoster:", v12, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v48, "isEqual:", v51);
      if ((v31 & objc_msgSend(v48, "isEqual:", v47)) == 1)
      {
        *((_BYTE *)v56 + 24) = 1;
      }
      else
      {
        -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContextWithDesiredActivePosterUUID:role:](self, "_buildRoleCoordinatorTransitionContextWithDesiredActivePosterUUID:role:", v11, v12);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v31 & 1) != 0
          || -[__CFString isEqual:](v12, "isEqual:", *MEMORY[0x1E0D7FC58])
          && (objc_msgSend(v51, "loadFocusConfigurationWithError:", 0),
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              v36 = v35 == 0,
              v35,
              !v36))
        {
          v45 = 0;
        }
        else
        {
          +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v12, v11);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v38 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ from %@"), v39, v53);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v45, 0, 0, v40, v46, a6);
        *((_BYTE *)v56 + 24) = v41;

      }
    }

LABEL_42:
    goto LABEL_43;
  }
  if (a6)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    if (v12)
      v25 = v12;
    else
      v25 = CFSTR("(null role identifier)");
    v69[0] = CFSTR("roleIdentifier");
    v69[1] = CFSTR("configurationUUID");
    v70[0] = v25;
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v27);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v28 = 0;
LABEL_48:

  return v28;
}

void __72__PBFPosterExtensionDataStore_updateSelectedPosterUUID_role_from_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;

  v6 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
  if (!v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

- (BOOL)executeDataStoreUpdateWithChanges:(id)a3 diffs:(id *)a4 options:(unint64_t)a5 reason:(id)a6 error:(id *)a7
{
  os_unfair_lock_s *p_stateLock;
  id v13;
  id v14;

  p_stateLock = &self->_stateLock;
  v13 = a6;
  v14 = a3;
  os_unfair_lock_lock(p_stateLock);
  LOBYTE(a7) = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v14, a4, a5, v13, 0, a7);

  os_unfair_lock_unlock(p_stateLock);
  return (char)a7;
}

- (BOOL)deletePosterConfigurationsMatchingUUID:(id)a3 error:(id *)a4
{
  id v7;
  os_unfair_lock_s *p_stateLock;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_posterWithUUID:error:](self, "_stateLock_posterWithUUID:error:", v7, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7 && v9)
  {
    +[PBFPosterDataStoreEventBuilder posterDeleted:](PBFPosterDataStoreEventBuilder, "posterDeleted:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_opt_new();
    v17 = v15;

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("origin"));

    objc_msgSend(v11, "buildWithError:", a4);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
    {
      v24 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PBFPosterExtensionDataStore _stateLock_processEvents:context:error:](self, "_stateLock_processEvents:context:error:", v22, 0, a4);

    }
    else
    {
      v18 = 0;
    }

    goto LABEL_13;
  }
  if (a4)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v25 = CFSTR("configurationUUID");
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v17);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  v18 = 0;
LABEL_14:
  os_unfair_lock_unlock(p_stateLock);

  return v18;
}

- (BOOL)togglePosterConfigurationHiddenMatchingUUID:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_stateLock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_posterWithUUID:error:](self, "_stateLock_posterWithUUID:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 && v8)
  {
    objc_msgSend(v8, "loadConfiguredPropertiesWithError:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "ambientConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setHidden:", objc_msgSend(v13, "hidden") ^ 1);
    objc_msgSend(v11, "setAmbientConfiguration:", v13);
    v14 = (void *)objc_opt_new();
    +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:forPosterWithinRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "updateConfiguredProperties:forPosterWithinRole:matchingUUID:", v11, *MEMORY[0x1E0D7FC00], v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContext](self, "_buildRoleCoordinatorTransitionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v14, 0, 0, CFSTR("toggledHidden"), v16, 0);

  }
  else
  {
    if (a4)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFSTR("configurationUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);

  return v17;
}

- (void)duplicatePosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v12 = v7;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore duplicatePosterConfigurationMatchingUUID:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA124B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore duplicatePosterConfigurationMatchingUUID:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA1251CLL);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterExtensionDataStore.m"), 2408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_duplicatePosterConfigurationMatchingUUID:completion:](self, "_stateLock_duplicatePosterConfigurationMatchingUUID:completion:", v12, v8);
  os_unfair_lock_unlock(&self->_stateLock);

}

- (void)_stateLock_duplicatePosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  const char *aSelector;
  void (**v32)(id, _QWORD, void *);
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v9);

    }
  }
  else
  {
    aSelector = a2;
    v32 = v8;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[NSDictionary keyEnumerator](self->_roleToRoleCoordinator, "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
        -[NSDictionary objectForKey:](self->_roleToRoleCoordinator, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "posterCollection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "posterWithUUID:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          break;

        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v12)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v20 = v15;
      objc_msgSend(v16, "posterCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "posterWithUUID:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterRoleCoordinatorChange duplicatePosterWithinRole:matchingUUID:toUUID:](PBFPosterRoleCoordinatorChange, "duplicatePosterWithinRole:matchingUUID:toUUID:", v20, v7, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v26, 0, 0, v27, 0, &v33);
        v28 = v33;

        v8 = v32;
        if (v32)
        {
          if (v28)
            v29 = 0;
          else
            v29 = v24;
          ((void (**)(id, void *, void *))v32)[2](v32, v29, v28);
        }

        goto LABEL_24;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v39 = CFSTR("configurationID");
      v40 = CFSTR("role");
      v41[0] = v7;
      v22 = CFSTR("(null role)");
      if (v20)
        v22 = v20;
    }
    else
    {
LABEL_12:

      v19 = 0;
      v20 = 0;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v39 = CFSTR("configurationID");
      v40 = CFSTR("role");
      v41[0] = v7;
      v22 = CFSTR("(null role)");
    }
    v8 = v32;
    v41[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v39, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v24);
LABEL_24:

  }
}

- (id)exportPosterConfigurationMatchingUUID:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_stateLock;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore exportPosterConfigurationMatchingUUID:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA12B00);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore exportPosterConfigurationMatchingUUID:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA12B64);
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v19 = 0;
  v20 = 0;
  -[PBFPosterExtensionDataStore _stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:](self, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v6, &v20, &v19);
  v8 = v20;
  v9 = v19;
  os_unfair_lock_unlock(p_stateLock);
  if (v8 && v9)
  {
    +[PBFPosterConfigurationStoreArchiver archiveConfigurationStoreWithCoordinator:error:](PBFPosterConfigurationStoreArchiver, "archiveConfigurationStoreWithCoordinator:error:", v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v21[0] = CFSTR("providerIdentifier");
    objc_msgSend(v8, "extensionIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("(null)");
    v21[1] = CFSTR("configurationUUID");
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PBFPosterSnapshotManager *snapshotManager;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  PBFPosterSnapshotRequest *v44;
  PBFPosterSnapshotRequest *v45;
  __CFString *v46;
  void *v47;
  const char *aSelector;
  os_unfair_lock_t lock;
  os_unfair_lock_t locka;
  os_unfair_lock_t lockb;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  void (**v60)(id, _QWORD, id);
  id v61;
  id v62;
  id v63;
  id v64;
  os_unfair_lock_t v65;
  uint64_t v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  v9 = v7;
  NSClassFromString(CFSTR("NSData"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore importPosterConfigurationFromArchiveData:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA13188);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDataClass]"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore importPosterConfigurationFromArchiveData:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA131ECLL);
  }

  v63 = 0;
  v64 = 0;
  +[PBFPosterConfigurationStoreArchiver unarchiveConfigurationStoreArchiveData:manifest:error:](PBFPosterConfigurationStoreArchiver, "unarchiveConfigurationStoreArchiveData:manifest:error:", v9, &v64, &v63);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v64;
  v12 = v63;
  if (v10)
  {
    objc_msgSend(v11, "extensionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    -[PBFPosterExtensionDataStore pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:](self, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v13, &v62);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v62;

    if (!v14 || v56)
    {
      if (v56)
      {
        v19 = v56;
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v69 = CFSTR("providerIdentifier");
        objc_msgSend(v11, "extensionIdentifier");
        v28 = objc_claimAutoreleasedReturnValue();
        v70[0] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v29);
        v19 = (id)objc_claimAutoreleasedReturnValue();

        v12 = (id)v28;
      }

      v8[2](v8, 0, v19);
      goto LABEL_23;
    }
    v55 = v14;
    objc_msgSend(v11, "role");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((PFPosterRoleIsValid() & 1) == 0)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      if (v15)
        v25 = v15;
      else
        v25 = CFSTR("()");
      v67 = CFSTR("role");
      v68 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v26);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v8[2](v8, 0, v19);
      goto LABEL_22;
    }
    aSelector = a2;
    lock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v15, v10);
    v53 = objc_claimAutoreleasedReturnValue();
    v66 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v17 = v15;
    v18 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v16, 0, 0, CFSTR("importPoster"), 0, &v61);
    v19 = v61;

    if (v18)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v17);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "posterCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "destinationUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v20;
      objc_msgSend(v20, "posterWithUUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(lock);
      v15 = v17;
      v54 = v22;
      if (!v19)
      {
        v44 = [PBFPosterSnapshotRequest alloc];
        objc_msgSend(v22, "_path");
        locka = (os_unfair_lock_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pbf_posterProvider");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "configuredPropertiesForPoster:", v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions](PBFPosterSnapshotDefinition, "defaultConfigurationDefinitions");
        v46 = v15;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:](v44, "initWithPath:provider:configuredProperties:definitions:context:", locka, v31, v32, v33, v34);

        -[PBFPosterSnapshotRequest requestWithLoadFromCacheIfAvailable:](v45, "requestWithLoadFromCacheIfAvailable:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "requestWithPowerLogReason:", 6);
        lockb = (os_unfair_lock_t)objc_claimAutoreleasedReturnValue();

        NSStringFromSelector(aSelector);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterExtensionDataStore acquireSnapshotterInUseAssertionWithReason:](self, "acquireSnapshotterInUseAssertionWithReason:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        snapshotManager = self->_snapshotManager;
        v65 = lockb;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __83__PBFPosterExtensionDataStore_importPosterConfigurationFromArchiveData_completion___block_invoke;
        v57[3] = &unk_1E86F2CC8;
        v57[4] = self;
        v54 = v54;
        v58 = v54;
        v59 = v37;
        v60 = v8;
        v40 = v37;
        v15 = v46;
        v41 = v40;
        -[PBFPosterSnapshotManager prewarmSnapshotsForRequests:completion:](snapshotManager, "prewarmSnapshotsForRequests:completion:", v39, v57);

        v14 = v55;
        v30 = (void *)v53;
        v23 = v47;
        goto LABEL_21;
      }
      v23 = v47;
    }
    else
    {
      os_unfair_lock_unlock(lock);
      v54 = 0;
      v23 = 0;
      v52 = 0;
      v15 = v17;
    }
    v8[2](v8, 0, v19);
    v14 = v55;
    v30 = (void *)v53;
LABEL_21:

LABEL_22:
LABEL_23:

    v12 = v19;
    goto LABEL_24;
  }
  v8[2](v8, 0, v12);
LABEL_24:

}

uint64_t __83__PBFPosterExtensionDataStore_importPosterConfigurationFromArchiveData_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidAddConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidUpdateConfigurations");
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, 0);

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PBFPosterSnapshotRequest *v18;
  void *v19;
  void *v20;
  PBFPosterSnapshotRequest *v21;
  void *v22;
  void *v23;
  PBFPosterSnapshotManager *snapshotManager;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  void (**v41)(_QWORD, _QWORD);
  id v42;
  _QWORD v43[4];
  id v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore refreshSnapshotForPosterConfigurationMatchUUID:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA136B8);
  }
  v9 = (void (**)(_QWORD, _QWORD))v8;
  v10 = v7;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore refreshSnapshotForPosterConfigurationMatchUUID:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA1371CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore refreshSnapshotForPosterConfigurationMatchUUID:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA13780);
  }

  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_fetchPosterConfigurations](self, "_stateLock_fetchPosterConfigurations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke;
  v43[3] = &unk_1E86F2CF0;
  v12 = v10;
  v44 = v12;
  objc_msgSend(v11, "bs_firstObjectPassingTest:", v43);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_stateLock);
  if (v13)
  {
    os_unfair_lock_lock(&self->_stateLock);
    v42 = 0;
    -[PBFPosterExtensionDataStore _stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:](self, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v12, 0, &v42);
    v14 = v42;
    os_unfair_lock_unlock(&self->_stateLock);
    if (v14)
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore acquireSnapshotterInUseAssertionWithReason:](self, "acquireSnapshotterInUseAssertionWithReason:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v13);
      v18 = [PBFPosterSnapshotRequest alloc];
      +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions](PBFPosterSnapshotDefinition, "defaultConfigurationDefinitions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:](v18, "initWithConfiguration:definitions:context:", v17, v19, v20);

      -[PBFPosterSnapshotRequest requestWithPowerLogReason:](v21, "requestWithPowerLogReason:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "requestWithLoadFromCacheIfAvailable:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      snapshotManager = self->_snapshotManager;
      v45 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke_2;
      v38[3] = &unk_1E86F2D18;
      v38[4] = self;
      v39 = v17;
      v40 = v16;
      v41 = v9;
      v26 = v16;
      v27 = v17;
      -[PBFPosterSnapshotManager prewarmSnapshotsForRequests:completion:](snapshotManager, "prewarmSnapshotsForRequests:completion:", v25, v38);

    }
    else
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v46 = CFSTR("configurationUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v9[2](v9, v34);
      v23 = 0;
      v14 = (id)v34;
    }

  }
  else
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v48 = CFSTR("configurationUUID");
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v30);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, id))v9)[2](v9, v14);
  }

}

uint64_t __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_notifyObserversDidUpdateConfiguration:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidUpdateSnapshotForConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)ingestSnapshotCollection:(id)a3 forPosterConfigurationUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  NSClassFromString(CFSTR("PRSPosterSnapshotCollection"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA13C14);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterSnapshotCollectionClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA13C78);
  }

  v11 = v9;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA13CDCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA13D40);
  }

  PBFLogDataStore();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  PBFLogDataStore();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v11;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ingestSnapshotCollection:forPosterConfigurationUUID:", "configurationUUID: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_fetchPosterConfigurations](self, "_stateLock_fetchPosterConfigurations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __89__PBFPosterExtensionDataStore_ingestSnapshotCollection_forPosterConfigurationUUID_error___block_invoke;
  v31[3] = &unk_1E86F2CF0;
  v18 = v11;
  v32 = v18;
  objc_msgSend(v17, "bs_firstObjectPassingTest:", v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_stateLock);
  if (v19)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v19);
    if (-[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:](self->_snapshotManager, "ingestSnapshotCollection:forConfiguration:error:", v10, v20, a5))
    {
      -[PBFPosterExtensionDataStore _notifyObserversDidUpdateSnapshotForConfiguration:](self, "_notifyObserversDidUpdateSnapshotForConfiguration:", v20);
    }
    PBFLogDataStore();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v22, OS_SIGNPOST_INTERVAL_END, v13, "ingestSnapshotCollection:forPosterConfigurationUUID:", "configurationUUID: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    if (a5)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v33 = CFSTR("configurationUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    PBFLogDataStore();
    v26 = objc_claimAutoreleasedReturnValue();
    v20 = v26;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v20, OS_SIGNPOST_INTERVAL_END, v13, "ingestSnapshotCollection:forPosterConfigurationUUID:", "configurationUUID: %{public}@", buf, 0xCu);
    }
  }

}

uint64_t __89__PBFPosterExtensionDataStore_ingestSnapshotCollection_forPosterConfigurationUUID_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)fetchPosterConfigurationsSortedByUseForRole:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  void *v6;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_fetchPosterConfigurationsSortedByUse:forRole:](self, "_stateLock_fetchPosterConfigurationsSortedByUse:forRole:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_stateLock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSDictionary allValues](self->_roleToRoleCoordinator, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "posterCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "posterWithUUID:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x1E0D7FB48];
          objc_msgSend(v12, "_path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invalidateModelObjectCacheForPath:", v14);

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_stateLock);
}

- (id)_stateLock_prepareReloadConfigurationOperationForExtension:(id)a3 path:(id)a4 locationInUse:(BOOL)a5 sessionInfo:(id)a6 powerLogReason:(int64_t)a7 assetUpdater:(id)a8 error:(id *)a9
{
  uint64_t v12;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  PBFPosterExtensionReloadConfigurationOperation *v19;
  PFPosterExtensionInstanceProvider *v20;
  id v21;
  PFPosterExtensionInstanceProvider *v22;
  void *v23;
  uint64_t v24;
  PFPosterExtensionInstanceProvider *v25;
  uint64_t v26;
  id v28;
  void *v29;
  BOOL v30;
  int v31;
  const __CFString *v32;
  void *v33;
  id v34;
  void *v35;
  int64_t v36;
  unsigned int v37;
  void *v38;
  _QWORD v39[4];
  PFPosterExtensionInstanceProvider *v40;
  id v41;
  id v42;
  id v43;
  const __CFString *v44;
  _QWORD v45[2];

  v12 = a5;
  v45[1] = *MEMORY[0x1E0C80C00];
  v15 = (__CFString *)a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if ((objc_msgSend(v18, "isValid") & 1) != 0)
    {
      v20 = 0;
      v21 = 0;
    }
    else
    {
      v37 = v12;
      v20 = self->_instanceCollection;
      -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v15);
      v24 = objc_claimAutoreleasedReturnValue();

      v43 = 0;
      v38 = (void *)v24;
      -[PFPosterExtensionInstanceProvider acquireInstanceForExtension:reason:error:](v20, "acquireInstanceForExtension:reason:error:", v24, CFSTR("ReloadConfiguration"), &v43);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (PFPosterExtensionInstanceProvider *)v43;
      if (v25)
      {
        v22 = v25;
        if (a9)
          *a9 = objc_retainAutorelease(v25);

        v19 = 0;
        goto LABEL_12;
      }
      v36 = a7;
      v42 = 0;
      objc_msgSend(v21, "pr_assetUpdaterWithError:", &v42);
      v26 = objc_claimAutoreleasedReturnValue();
      v28 = v42;

      v29 = v28;
      if (v28)
        v30 = 1;
      else
        v30 = v26 == 0;
      v31 = !v30;
      if (a9 && (v31 & 1) == 0)
      {
        if (v29)
        {
          *a9 = objc_retainAutorelease(v29);
        }
        else
        {
          v35 = (void *)MEMORY[0x1E0CB35C8];
          if (v15)
            v32 = v15;
          else
            v32 = CFSTR("(null)");
          v44 = CFSTR("extensionIdentifier");
          v45[0] = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v33);
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a9 = v34;

          v29 = 0;
        }
      }

      if (!v31)
      {
        v19 = 0;
        goto LABEL_14;
      }
      v18 = (id)v26;
      v12 = v37;
      a7 = v36;
    }
    v19 = -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]([PBFPosterExtensionReloadConfigurationOperation alloc], "initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:", v18, v17, v16, v12, self->_runtimeAssertionProvider, self->_snapshotManager, 90.0, a7);
    if (!v20)
    {
LABEL_13:
      v26 = (uint64_t)v18;
LABEL_14:

      v18 = (id)v26;
      goto LABEL_16;
    }
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __155__PBFPosterExtensionDataStore__stateLock_prepareReloadConfigurationOperationForExtension_path_locationInUse_sessionInfo_powerLogReason_assetUpdater_error___block_invoke;
    v39[3] = &unk_1E86F2D40;
    v20 = v20;
    v40 = v20;
    v21 = v21;
    v41 = v21;
    -[PBFPosterExtensionReloadConfigurationOperation addCompletionObserver:](v19, "addCompletionObserver:", v39);

    v22 = v40;
LABEL_12:

    goto LABEL_13;
  }
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v19 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_16:

  return v19;
}

uint64_t __155__PBFPosterExtensionDataStore__stateLock_prepareReloadConfigurationOperationForExtension_path_locationInUse_sessionInfo_powerLogReason_assetUpdater_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relinquishExtensionInstance:reason:", *(_QWORD *)(a1 + 40), CFSTR("ReloadConfiguration"));
}

- (void)_stateLock_enqueueRefreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  PFPosterExtensionProvider *v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id location;
  _QWORD aBlock[4];
  id v85;
  PFPosterExtensionProvider *v86;
  id v87;
  id v88;
  void (**v89)(id, _QWORD, void *);
  id v90;
  _QWORD v91[4];
  PFPosterExtensionProvider *v92;
  id v93;
  id v94;
  void (**v95)(id, _QWORD, void *);
  uint64_t *v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  id obj;
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;
  const __CFString *v110;
  _QWORD v111[2];
  _QWORD v112[2];
  const __CFString *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  const __CFString *v119;
  _QWORD v120[3];

  v120[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (!-[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot](self, "_stateLock_hasBeenUnlockedSinceBoot"))
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v119 = CFSTR("posterUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, &v119, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pbf_dataStoreErrorWithCode:userInfo:", -2205, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v13[2](v13, 0, v27);
      goto LABEL_42;
    }
    v103 = 0;
    v104 = &v103;
    v105 = 0x3032000000;
    v106 = __Block_byref_object_copy_;
    v107 = __Block_byref_object_dispose_;
    v108 = 0;
    obj = 0;
    v102 = 0;
    -[PBFPosterExtensionDataStore _stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:](self, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v11, &v102, &obj);
    v15 = v102;
    objc_storeStrong(&v108, obj);
    v16 = (void *)v104[5];
    if (v16)
    {
      if (v15)
      {
        objc_msgSend(v16, "identityOfLatestVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v15, "extensionIdentifier");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterExtensionDataStore activeEditingSessionAssertionExtensionIdentifiers](self, "activeEditingSessionAssertionExtensionIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsObject:", v75);

          if (v19)
          {
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v111[0] = *MEMORY[0x1E0CB2D68];
            v111[1] = CFSTR("posterUUID");
            v112[0] = CFSTR("Edit session is ongoing; update configurations is disabled for this extension until edit is finished");
            objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v112[1] = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v22);
            v23 = (id)objc_claimAutoreleasedReturnValue();

            v13[2](v13, 0, v23);
            goto LABEL_39;
          }
          v74 = self->_extensionProvider;
          objc_msgSend(v11, "UUIDString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringByAppendingFormat:", CFSTR("-%@"), v38);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          v100 = 0;
          -[PFPosterExtensionProvider acquireInstanceForExtensionWithIdentifier:reason:error:](v74, "acquireInstanceForExtensionWithIdentifier:reason:error:", v75, v73, &v100);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v100;
          if (v23)
          {
            v13[2](v13, 0, v23);
LABEL_38:

LABEL_39:
            goto LABEL_41;
          }
          v99 = 0;
          objc_msgSend(v72, "pr_assetUpdaterWithError:", &v99);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v99;
          if (v71)
          {
            -[PFPosterExtensionProvider relinquishExtensionInstanceWithIdentifier:reason:](v74, "relinquishExtensionInstanceWithIdentifier:reason:", v75, v73);
            v13[2](v13, 0, v71);
LABEL_37:

            goto LABEL_38;
          }
          v66 = v39;
          v40 = (void *)MEMORY[0x1E0D7F8E8];
          objc_msgSend(v15, "containerURL");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "pathWithProviderURL:identity:", v41, v17);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = 0;
          if (!v12 || objc_msgSend(v12, "isEmpty"))
          {
            objc_msgSend(v72, "pr_refreshConfigurationOperations");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = MEMORY[0x1E0C809B0];
            v97[0] = MEMORY[0x1E0C809B0];
            v97[1] = 3221225472;
            v97[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke;
            v97[3] = &unk_1E86F2D68;
            v98 = v70;
            objc_msgSend(v42, "bs_firstObjectPassingTest:", v97);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (v67)
            {
              v91[0] = v43;
              v91[1] = 3221225472;
              v91[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2;
              v91[3] = &unk_1E86F2D90;
              v95 = v13;
              v96 = &v103;
              v92 = v74;
              v93 = v75;
              v94 = v73;
              objc_msgSend(v67, "addCompletionObserver:", v91);

              v44 = v95;
LABEL_36:

              v39 = v66;
              goto LABEL_37;
            }
          }
          -[PBFPosterExtensionDataStore _stateLock_switcherConfiguration](self, "_stateLock_switcherConfiguration");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "selectedConfiguration");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "_path");
          v65 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "serverIdentity");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "posterUUID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v45;
          if ((objc_msgSend(v63, "isEqual:", v11) & 1) != 0)
          {

          }
          else
          {
            objc_msgSend(v45, "activeConfiguration");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "_path");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "serverIdentity");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "posterUUID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v47, "isEqual:", v11);

            if ((v59 & 1) == 0)
            {
              v49 = 0;
LABEL_27:
              v90 = 0;
              -[PBFPosterExtensionDataStore _stateLock_prepareReloadConfigurationOperationForExtension:path:locationInUse:sessionInfo:powerLogReason:assetUpdater:error:](self, "_stateLock_prepareReloadConfigurationOperationForExtension:path:locationInUse:sessionInfo:powerLogReason:assetUpdater:error:", v75, v70, v49, v12, a5, v66, &v90);
              v50 = objc_claimAutoreleasedReturnValue();
              v51 = v90;
              v52 = v51;
              v67 = (void *)v50;
              if (v51 || !v50)
              {
                v57 = v51;
                if (!v51)
                {
                  v58 = (void *)MEMORY[0x1E0CB35C8];
                  v109 = *MEMORY[0x1E0CB2D68];
                  v110 = CFSTR("Unable to create reloadConfigurationOperation");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
                  self = (PBFPosterExtensionDataStore *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "pbf_dataStoreErrorWithCode:userInfo:", -2222, self);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v13[2](v13, 0, v57);
                if (!v52)
                {

                }
                -[PFPosterExtensionProvider relinquishExtensionInstanceWithIdentifier:reason:](v74, "relinquishExtensionInstanceWithIdentifier:reason:", v75, v73);
              }
              else
              {
                v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
                v54 = MEMORY[0x1E0C809B0];
                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                aBlock[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_3;
                aBlock[3] = &unk_1E86F2DB8;
                v52 = v53;
                v85 = v52;
                v89 = v13;
                v86 = v74;
                v87 = v75;
                v88 = v73;
                v55 = _Block_copy(aBlock);
                objc_initWeak(&location, self);
                v77[0] = v54;
                v77[1] = 3221225472;
                v77[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_4;
                v77[3] = &unk_1E86F2E58;
                objc_copyWeak(&v82, &location);
                v56 = v55;
                v81 = v56;
                v78 = v17;
                v79 = v70;
                v80 = v11;
                objc_msgSend(v67, "addCompletionObserver:", v77);
                objc_msgSend(v72, "pr_addRefreshConfigurationOperation:waitUntilFinished:", v67, 0);

                objc_destroyWeak(&v82);
                objc_destroyWeak(&location);

              }
              v44 = v62;
              goto LABEL_36;
            }
          }
          objc_msgSend(v72, "extension");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "posterExtensionInfoPlist");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "pf_wantsLocation");

          goto LABEL_27;
        }
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v113 = CFSTR("posterUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v11);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v36);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v13[2](v13, 0, v76);
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v115 = CFSTR("posterUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v11);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v13[2](v13, 0, v17);
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v117 = CFSTR("posterUUID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v13[2](v13, 0, v17);
    }
LABEL_41:

    _Block_object_dispose(&v103, 8);
    goto LABEL_42;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v14);

  }
LABEL_42:

}

uint64_t __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "preRefreshPosterConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
    v7 = objc_msgSend(v3, "hasUniqueSessionInfo") ^ 1;
  else
    v7 = 0;

  return v7;
}

uint64_t __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "pathOfLatestVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  return objc_msgSend(*(id *)(a1 + 32), "relinquishExtensionInstanceWithIdentifier:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17A3580]();
  if (objc_msgSend(*(id *)(a1 + 32), "setFlag:", 1))
  {
    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "relinquishExtensionInstanceWithIdentifier:reason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v6);

}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v8 = WeakRetained;
  if (v6)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else if (v5 && WeakRetained)
  {
    objc_msgSend(v5, "postRefreshPosterConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && a1[4])
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_5;
      v24[3] = &unk_1E86F2DE0;
      v25 = v10;
      v26 = a1[4];
      v29 = a1[7];
      v27 = a1[5];
      v28 = a1[6];
      objc_msgSend(v5, "invalidateAssertionsWithCompletion:", v24);

      v12 = v25;
    }
    else
    {
      objc_msgSend(v5, "preRefreshPosterConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isServerPosterPath"))
      {
        v15 = (void *)v8[7];
        objc_msgSend(v12, "serverIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cancelRequestedSnapshotsForIdentity:", v16);

      }
      objc_msgSend(MEMORY[0x1E0D7FB50], "loadConfiguredPropertiesForPath:error:", a1[5], 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0D7FA60]);
      objc_msgSend(a1[4], "posterUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:", v9, v19, a1[4], v17, 0);

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_389;
      v21[3] = &unk_1E86F2E30;
      v22 = v5;
      v23 = a1[7];
      objc_msgSend(v8, "_ingestRefreshPosterConfiguration:completion:", v20, v21);

    }
  }
  else
  {
    v13 = (void (**)(id, _QWORD, void *))a1[7];
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v14);

  }
}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("posterUUID");
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PBFLogPosterContents();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_ERROR, "updated configuration isn't new but fails to match the previous descriptor : new=%@ previous=%@ error:%{public}@", (uint8_t *)&v9, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_389(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2_390;
    v8[3] = &unk_1E86F2E08;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    objc_msgSend(v7, "invalidateAssertionsWithCompletion:", v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2_390(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_ingestRefreshPosterConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  __CFString *v10;
  os_unfair_lock_s *p_stateLock;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[3];
  _QWORD v58[3];
  void *v59;
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    objc_msgSend(v7, "sourceIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "provider");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("(null extensionBundleIdentifier)");
    if (v13)
      v15 = (__CFString *)v13;
    v10 = v15;

    -[PBFPosterExtensionDataStore activeEditingSessionAssertionExtensionIdentifiers](self, "activeEditingSessionAssertionExtensionIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v10);

    if (v17)
    {
      os_unfair_lock_unlock(&self->_stateLock);
      PBFLogRoleCoordinator();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:].cold.2();

      if (!v8)
        goto LABEL_38;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D68];
      v64[0] = CFSTR("extensionBundleIdentifier");
      v64[1] = v20;
      v65[0] = v10;
      v65[1] = CFSTR("Editing session is in progress;  cannot ingest this path.  Aborting.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v22);
      goto LABEL_37;
    }
    objc_msgSend(v7, "sourceIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "role");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destinationUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("(null role)");
    if (v22)
      v24 = v22;
    v25 = v24;
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v26;
    if (v26)
    {
      v52 = v25;
      objc_msgSend(v26, "posterCollection");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "posterWithUUID:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v50 = v21;
        +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v22, v7);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v49;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        v30 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v28, 0, 0, v29, 0, &v56);
        v31 = v56;

        if (v30)
        {
          objc_msgSend(v53, "posterCollection");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "orderedPosters");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __76__PBFPosterExtensionDataStore__ingestRefreshPosterConfiguration_completion___block_invoke;
          v54[3] = &unk_1E86F2E80;
          v55 = v50;
          objc_msgSend(v33, "bs_firstObjectPassingTest:", v54);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          os_unfair_lock_unlock(p_stateLock);
          objc_msgSend(v34, "_path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *))v8)[2](v8, v35, v31);

          v21 = v50;
          v36 = v51;
          v25 = v52;
        }
        else
        {
          os_unfair_lock_unlock(p_stateLock);
          PBFLogRoleCoordinator();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:].cold.4();

          v21 = v50;
          v36 = v51;
          v25 = v52;
          if (v8)
          {
            if (!v31)
            {
              v45 = (void *)MEMORY[0x1E0CB35C8];
              v57[0] = *MEMORY[0x1E0CB2D68];
              v57[1] = CFSTR("role");
              v58[0] = CFSTR("Role Coordinator could not execute refresh poster configuration");
              v58[1] = v52;
              v57[2] = CFSTR("posterUUID");
              objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v23);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v58[2] = v46;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v45;
              v21 = v50;
              objc_msgSend(v48, "pbf_dataStoreErrorWithCode:userInfo:", -2222, v47);
              v31 = (id)objc_claimAutoreleasedReturnValue();

              v25 = v52;
            }
            v8[2](v8, 0, v31);
          }
        }

      }
      else
      {
        os_unfair_lock_unlock(&self->_stateLock);
        PBFLogRoleCoordinator();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:].cold.4();

        v25 = v52;
        if (!v8)
        {
          v36 = v51;
          goto LABEL_35;
        }
        v41 = (void *)MEMORY[0x1E0CB35C8];
        v60[0] = *MEMORY[0x1E0CB2D68];
        v60[1] = CFSTR("role");
        v61[0] = CFSTR("Poster w/ UUID could not be found");
        v61[1] = v52;
        v60[2] = CFSTR("posterUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v23);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v61[2] = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v43);
        v31 = (id)objc_claimAutoreleasedReturnValue();

        v25 = v52;
        v8[2](v8, 0, v31);
        v36 = v51;
      }

    }
    else
    {
      os_unfair_lock_unlock(&self->_stateLock);
      PBFLogRoleCoordinator();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:].cold.3();

      if (!v8)
        goto LABEL_36;
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v62[0] = *MEMORY[0x1E0CB2D68];
      v62[1] = CFSTR("role");
      v63[0] = CFSTR("RoleCoordinator not setup for role");
      v63[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pbf_generalErrorWithCode:userInfo:", 1, v39);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v8[2](v8, 0, v36);
    }
LABEL_35:

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  PBFLogRoleCoordinator();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:].cold.1(a2, v9);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);
LABEL_38:

  }
}

BOOL __76__PBFPosterExtensionDataStore__ingestRefreshPosterConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL8 v8;

  objc_msgSend(a2, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = objc_msgSend(v4, "version");
    v8 = v7 > objc_msgSend(*(id *)(a1 + 32), "version");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_stateLock_fetchPosterConfigurations
{
  return -[PBFPosterExtensionDataStore _stateLock_fetchPosterConfigurationsSortedByUse:forRole:](self, "_stateLock_fetchPosterConfigurationsSortedByUse:forRole:", 0, *MEMORY[0x1E0D7FC58]);
}

- (id)_stateLock_fetchPosterConfigurationsSortedByUse:(BOOL)a3 forRole:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v4 = a3;
  v6 = a4;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PBFPosterExtensionDataStoreSQLiteDatabase sortedPosterUUIDsForRole:error:](self->_database, "sortedPosterUUIDsForRole:error:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v11 = v10;

    v12 = (void *)objc_opt_new();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke;
    v22[3] = &unk_1E86F2EA8;
    v14 = v11;
    v23 = v14;
    v15 = v12;
    v24 = v15;
    -[PBFPosterExtensionDataStore _stateLock_enumerateConfigurationStoreCoordinators:](self, "_stateLock_enumerateConfigurationStoreCoordinators:", v22);
    if (v4)
    {
      -[PBFPosterExtensionDataStore _stateLock_lastUseDatesForPosterCollection](self, "_stateLock_lastUseDatesForPosterCollection");
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_2;
      v20[3] = &unk_1E86F2ED0;
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      objc_msgSend(v15, "sortUsingComparator:", v20);

    }
    else
    {
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_3;
      v18[3] = &unk_1E86F2ED0;
      v19 = v14;
      objc_msgSend(v15, "sortUsingComparator:", v18);
      v16 = v19;
    }

    v7 = (void *)objc_msgSend(v15, "copy");
  }

  return v7;
}

void __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "identityOfLatestVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D7F8E8];
    objc_msgSend(v11, "containerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathWithProviderURL:identity:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "posterUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

    if ((_DWORD)v9)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  }
}

uint64_t __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "serverIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v6, "serverIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "posterUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  v20 = objc_msgSend(v12, "compare:", v19);
  return v20;
}

uint64_t __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v7, "serverIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "posterUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "indexOfObject:", v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v10, "compare:", v15);
  return v16;
}

- (id)_stateLock_lastUseDatesForPosterCollection
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
    return MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PBFPosterExtensionDataStore__stateLock_lastUseDatesForPosterCollection__block_invoke;
  v6[3] = &unk_1E86F2EF8;
  v5 = v4;
  v7 = v5;
  -[PBFPosterExtensionDataStore _stateLock_enumerateConfigurationStoreCoordinators:](self, "_stateLock_enumerateConfigurationStoreCoordinators:", v6);

  return v5;
}

void __73__PBFPosterExtensionDataStore__stateLock_lastUseDatesForPosterCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "providerInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("kConfigurationLastUseDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v8, "posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v7);

}

- (void)_stateLock_findStoreCoordinatorsForUUID:(id)a3 extensionStoreCoordinator:(id *)a4 configurationStoreCoordinator:(id *)a5
{
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
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

  v8 = a3;
  if ((unint64_t)a4 | (unint64_t)a5
    && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __127__PBFPosterExtensionDataStore__stateLock_findStoreCoordinatorsForUUID_extensionStoreCoordinator_configurationStoreCoordinator___block_invoke;
    v9[3] = &unk_1E86F2F20;
    v10 = v8;
    v11 = &v19;
    v12 = &v13;
    -[PBFPosterExtensionDataStore _stateLock_enumerateConfigurationStoreCoordinators:](self, "_stateLock_enumerateConfigurationStoreCoordinators:", v9);
    if (a4)
      *a4 = objc_retainAutorelease((id)v20[5]);
    if (a5)
      *a5 = objc_retainAutorelease((id)v14[5]);

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);

  }
}

void __127__PBFPosterExtensionDataStore__stateLock_findStoreCoordinatorsForUUID_extensionStoreCoordinator_configurationStoreCoordinator___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v8 = a3;
  objc_msgSend(v8, "posterUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", a1[4]);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)_stateLock_enumerateConfigurationStoreCoordinators:(id)a3
{
  NSMutableDictionary *stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke;
    v6[3] = &unk_1E86F2B08;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

void __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[3];
  char v17;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "configurationStoreCoordinatorsWithError:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke_2;
  v11[3] = &unk_1E86F2F48;
  v13 = *(id *)(a1 + 32);
  v10 = v8;
  v12 = v10;
  v14 = v16;
  v15 = a4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  _Block_object_dispose(v16, 8);
}

uint64_t __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a3 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }
  return result;
}

- (PRSwitcherConfiguration)switcherConfiguration
{
  os_unfair_lock_s *p_stateLock;
  void *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_switcherConfiguration](self, "_stateLock_switcherConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_stateLock);
  return (PRSwitcherConfiguration *)v4;
}

- (BOOL)canPersistNewPosterConfiguration
{
  PBFPosterExtensionDataStore *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = -[PBFPosterExtensionDataStore _stateLock_canPersistNewPosterConfiguration](v2, "_stateLock_canPersistNewPosterConfiguration");
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)_stateLock_canPersistNewPosterConfiguration
{
  BOOL v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
    return 0;
  -[PBFPosterExtensionDataStore _stateLock_switcherConfiguration](self, "_stateLock_switcherConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[PBFPosterExtensionDataStore _stateLock_maximumPosterConfigurationCount](self, "_stateLock_maximumPosterConfigurationCount");
  v3 = v7 >= 0 && v6 < v7;

  return v3;
}

- (BOOL)updateDataStoreForIncomingFocusModeChange:(id)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t spid;
  id *v31;
  unint64_t v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  NSObject *v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isWallpaperModificationAllowed");

  PBFLogDataStore();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    v11 = os_signpost_id_generate(v9);

    PBFLogDataStore();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v32 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "updateDataStoreForIncomingFocusModeChange:", "newFocusModeIdentifier: %{public}@", buf, 0xCu);
    }

    PBFLogDataStore();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "Incoming focus mode change: %@", buf, 0xCu);
    }
    spid = v11;
    v31 = a4;

    os_unfair_lock_lock(&self->_stateLock);
    -[PBFPosterExtensionDataStore _activityModeForFocusUUID:](self, "_activityModeForFocusUUID:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    PBFLogDataStore();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[PBFPosterExtensionDataStore _activeActivity](self, "_activeActivity");
      v16 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v16;
      v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "Beginning transition from activity mode: %@ to activity mode: %@", buf, 0x16u);

    }
    -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContextForActivity:](self, "_buildRoleCoordinatorTransitionContextForActivity:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTransitionFromIncomingFocusModeChange:", 1);
    v18 = *MEMORY[0x1E0D7FC58];
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC58]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "determineActivePosterConfigurationForContext:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore activePosterConfigurationForRole:assocPoster:](self, "activePosterConfigurationForRole:assocPoster:", v18, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 && (BSEqualObjects() & 1) == 0)
    {
      PBFLogDataStore();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v34 = v10;
        v35 = 2112;
        v36 = v20;
        v37 = 2112;
        v38 = v21;
        _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "Executing incoming focus mode transition to %{public}@, new active poster configuration: %@ does not match current active poster configuration: %@", buf, 0x20u);
      }

      -[NSObject pbf_posterUUID](v20, "pbf_posterUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDesiredActiveConfiguration:forRole:", v25, v18);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateDataStoreForIncomingFocusModeChange:%@"), v6, spid);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", 0, 0, 0, v22, v17, v31);
    }
    else
    {
      PBFLogDataStore();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v10;
        v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, "Incoming focus mode transition to activity mode %@; already setup for configuration %@",
          buf,
          0x16u);
      }
      v23 = 1;
    }

    os_unfair_lock_unlock(&self->_stateLock);
    PBFLogDataStore();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v23;
      _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "Finished transitioning to new Incoming focus mode change: %{BOOL}u", buf, 8u);
    }

    PBFLogDataStore();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v28, OS_SIGNPOST_INTERVAL_END, spid, "updateDataStoreForIncomingFocusModeChange:", "newFocusModeIdentifier: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring incoming focus mode change because MDM blocks wallpaper changes", buf, 2u);
    }
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (BOOL)updateDataStoreForIncomingAvailableFocusModeChange:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  const char *aSelector;
  PBFPosterExtensionDataStore *v33;
  id *v34;
  void *v35;
  id v36;
  void *v37;
  __CFString *v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  _BYTE v49[128];
  _QWORD v50[2];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v38 = (__CFString *)(id)*MEMORY[0x1E0D7FC58];
  -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v34 = a4;
    objc_msgSend(v8, "posterCollection");
    v10 = objc_claimAutoreleasedReturnValue();
    v35 = v9;
    v36 = v7;
    aSelector = a2;
    v33 = self;
    if (objc_msgSend(v7, "count"))
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[NSObject orderedPosters](v10, "orderedPosters");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(obj);
          v19 = *(NSObject **)(*((_QWORD *)&v41 + 1) + 8 * i);
          -[NSObject configuredPropertiesForPoster:](v10, "configuredPropertiesForPoster:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "focusConfiguration");
          v21 = objc_claimAutoreleasedReturnValue();
          -[NSObject activityUUID](v21, "activityUUID");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = objc_msgSend(v40, "containsObject:", v22);
            PBFLogDataStore();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
            if (v23)
            {
              if (v25)
              {
                *(_DWORD *)buf = 138412546;
                v46 = v21;
                v47 = 2112;
                v48 = v19;
                _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "Focus mode %@ available for %@", buf, 0x16u);
              }
            }
            else
            {
              if (v25)
              {
                *(_DWORD *)buf = 138412546;
                v46 = v21;
                v47 = 2112;
                v48 = v19;
                _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "Focus mode %@ unavailable for %@; updating poster",
                  buf,
                  0x16u);
              }

              v26 = objc_msgSend(v20, "mutableCopy");
              v24 = v26;
              if (v26)
              {
                -[NSObject setFocusConfiguration:](v26, "setFocusConfiguration:", 0);
                -[NSObject pbf_posterUUID](v19, "pbf_posterUUID");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:forPosterWithinRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "updateConfiguredProperties:forPosterWithinRole:matchingUUID:", v24, v38, v27);
                v28 = objc_claimAutoreleasedReturnValue();

                PBFLogDataStore();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  v46 = v28;
                  _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_INFO, "Queueing up change: %{public}@", buf, 0xCu);
                }

                objc_msgSend(v37, "bs_safeAddObject:", v28);
              }
              else
              {
                PBFLogDataStore();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v46 = v19;
                  v47 = 2114;
                  v48 = v22;
                  _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "Configured properties is invalid; bailing on incoming available focus mode change for poster %{publi"
                    "c}@ / %{public}@",
                    buf,
                    0x16u);
                }
              }

            }
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v37, "count"))
    {
      os_unfair_lock_lock(&v33->_stateLock);
      NSStringFromSelector(aSelector);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](v33, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v37, 0, 0, v30, 0, v34);

      os_unfair_lock_unlock(&v33->_stateLock);
    }
    else
    {
      v14 = 1;
    }
    v9 = v35;

    v7 = v36;
  }
  else
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v50[0] = *MEMORY[0x1E0CB2D68];
      v50[1] = CFSTR("role");
      v12 = CFSTR("(null role)");
      if (v38)
        v12 = v38;
      v51[0] = CFSTR("RoleCoordinator not setup for role");
      v51[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 1, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    PBFLogRoleCoordinator();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore updateDataStoreForIncomingAvailableFocusModeChange:error:].cold.1();
    v14 = 0;
  }

  return v14;
}

- (BOOL)updateDataStoreForIncomingActiveChargerIdentifierUpdate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  os_unfair_lock_s *p_stateLock;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t spid;
  void *v43;
  NSObject *v44;
  void *v45;
  id *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PBFLogDataStore();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  PBFLogDataStore();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_activeChargerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!BSEqualStrings())
  {
    +[PBFPosterDataStoreEventBuilder activeChargerIdentifierDidUpdate:from:](PBFPosterDataStoreEventBuilder, "activeChargerIdentifierDidUpdate:from:", v6, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v51 = 0;
    -[NSObject buildWithError:](v15, "buildWithError:", &v51);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v51;
    if (!v17)
    {
      os_unfair_lock_unlock(&self->_stateLock);
      PBFLogDataStore();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 138543362;
        v54 = v6;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v31, OS_SIGNPOST_INTERVAL_END, v8, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
      }

      v32 = v50;
      if (a4)
      {
        if (!v50)
        {
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v57 = *MEMORY[0x1E0CB2D68];
          v58[0] = CFSTR("Unable to build PBFPosterDataStoreEvent");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v34);
          v32 = (id)objc_claimAutoreleasedReturnValue();

        }
        v32 = objc_retainAutorelease(v32);
        LOBYTE(v16) = 0;
        *a4 = v32;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
      goto LABEL_36;
    }
    spid = v8;
    v43 = v13;
    v44 = v15;
    v46 = a4;
    v18 = (id)*MEMORY[0x1E0D7FC00];
    -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContextForChargerIdentifier:](self, "_buildRoleCoordinatorTransitionContextForChargerIdentifier:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v18);
    v20 = objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore activePosterConfigurationForRole:assocPoster:](self, "activePosterConfigurationForRole:assocPoster:", v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pbf_posterUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDesiredActiveConfiguration:forRole:", v22, v18);

    v45 = (void *)v20;
    v23 = (void *)v20;
    v24 = v19;
    objc_msgSend(v23, "determineActivePosterConfigurationForContext:", v19);
    v47 = v21;
    v48 = v17;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      PBFLogDataStore();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v54 = v6;
        _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "Incoming charger id update to %{public}@ did not find a matching configuration", buf, 0xCu);
      }
      v28 = v18;
      v15 = v44;
      v13 = v43;
      goto LABEL_28;
    }
    v25 = BSEqualObjects();
    PBFLogDataStore();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      v28 = v18;
      v15 = v44;
      v13 = v43;
      if (v27)
      {
        *(_DWORD *)buf = 138543618;
        v54 = v6;
        v55 = 2114;
        v56 = v47;
        v29 = "Incoming charger id update to %{public}@ sticking with current active poster configuration: %{public}@";
LABEL_26:
        _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      }
    }
    else
    {
      v28 = v18;
      v15 = v44;
      v13 = v43;
      if (v27)
      {
        *(_DWORD *)buf = 138543618;
        v54 = v6;
        v55 = 2114;
        v56 = v49;
        v29 = "Executing charger id update to %{public}@ to new active poster configuration: %{public}@";
        goto LABEL_26;
      }
    }

    objc_msgSend(v49, "pbf_posterUUID", spid);
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDesiredActiveConfiguration:forRole:", v35, v28);
    v17 = v48;
LABEL_28:

    PBFLogDataStore();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v6;
      _os_log_impl(&dword_1CB9FA000, v36, OS_LOG_TYPE_DEFAULT, "Transitioning to new active charger identifier: %{public}@", buf, 0xCu);
    }

    v52 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v28);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PBFPosterExtensionDataStore _stateLock_processEvents:roles:context:error:](self, "_stateLock_processEvents:roles:context:error:", v37, v38, v24, v46);

    if (v16)
      objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setActiveChargerIdentifier:", v6);
    os_unfair_lock_unlock(p_stateLock);
    PBFLogDataStore();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v6;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v40, OS_SIGNPOST_INTERVAL_END, spid, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
    }

    v17 = v48;
    v32 = v50;
LABEL_36:

    goto LABEL_37;
  }
  os_unfair_lock_unlock(&self->_stateLock);
  PBFLogDataStore();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v15, OS_SIGNPOST_INTERVAL_END, v8, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
  }
  LOBYTE(v16) = 0;
LABEL_37:

  return v16;
}

- (void)processIncomingPosterConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("PRIncomingPosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore processIncomingPosterConfiguration:completion:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA177E8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRIncomingPosterConfigurationClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore processIncomingPosterConfiguration:completion:].cold.1();
    goto LABEL_9;
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PBFPosterExtensionDataStore_processIncomingPosterConfiguration_completion___block_invoke;
  v12[3] = &unk_1E86F2F70;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  PBFDispatchAsyncWithString(CFSTR("processIncomingPosterConfiguration"), QOS_CLASS_USER_INTERACTIVE, v12);

}

void __77__PBFPosterExtensionDataStore_processIncomingPosterConfiguration_completion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
  objc_msgSend(*(id *)(a1 + 32), "_stateLock_processIncomingPosterConfiguration:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
}

- (void)_stateLock_processIncomingPosterConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *notificationQueue;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  const __CFString *v49;
  id v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "role");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    switch(objc_msgSend(v7, "incomingPosterType"))
    {
      case 0:
        if (v8)
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v51 = *MEMORY[0x1E0CB2D68];
          v52 = CFSTR("PRIncomingPosterConfiguration has the wrong incomingPosterType");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          notificationQueue = self->_notificationQueue;
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_2;
          v42[3] = &unk_1E86F2F98;
          v43 = v28;
          v44 = v8;
          v12 = v28;
          dispatch_async(notificationQueue, v42);

          v16 = v44;
          goto LABEL_16;
        }
        goto LABEL_17;
      case 1:
      case 4:
        +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v9, v7);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 2:
      case 5:
        +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v9, v7);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v12 = (id)v11;
        goto LABEL_8;
      case 3:
        if (!v8)
          goto LABEL_17;
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v53 = *MEMORY[0x1E0CB2D68];
        v54[0] = CFSTR("Please use duplicatePosterConfigurationMatchingUUID:");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = self->_notificationQueue;
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke;
        v45[3] = &unk_1E86F2F98;
        v46 = v32;
        v47 = v8;
        v12 = v32;
        dispatch_async(v33, v45);

        v16 = v47;
        goto LABEL_16;
      default:
        v12 = 0;
LABEL_8:
        v50 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v15 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](self, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v13, 0, 0, v14, 0, &v41);
        v16 = v41;

        if (v15)
        {
          if (!v8)
            goto LABEL_16;
          -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "posterCollection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "destinationUUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "posterWithUUID:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = self->_notificationQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_4;
          block[3] = &unk_1E86F2E08;
          v37 = v8;
          v35 = v20;
          v16 = v16;
          v36 = v16;
          v22 = v20;
          dispatch_async(v21, block);

        }
        else
        {
          if (!v8)
            goto LABEL_16;
          if (!v16)
          {
            v23 = (void *)MEMORY[0x1E0CB35C8];
            v48 = *MEMORY[0x1E0CB2D68];
            v49 = CFSTR("Unable to process incoming configuration");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2222, v24);
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          v25 = self->_notificationQueue;
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_3;
          v38[3] = &unk_1E86F2F98;
          v40 = v8;
          v16 = v16;
          v39 = v16;
          dispatch_async(v25, v38);

          v22 = v40;
        }

LABEL_16:
        break;
    }
    goto LABEL_17;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v9);
LABEL_17:

  }
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)updateFocusModeForActivePosterChange
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_updateFocusModeForActivePosterChange](self, "_stateLock_updateFocusModeForActivePosterChange");
  os_unfair_lock_unlock(p_stateLock);
}

- (void)_stateLock_updateFocusModeForActivePosterChange
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  os_signpost_id_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
    return;
  PBFLogDataStore();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  PBFLogDataStore();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_stateLock_updateFocusModeForActivePosterChange", ", buf, 2u);
  }

  v8 = *MEMORY[0x1E0D7FC58];
  -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC58]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore activePosterConfigurationForRole:assocPoster:](self, "activePosterConfigurationForRole:assocPoster:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore _activeActivity](self, "_activeActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  objc_msgSend(v10, "configuredPropertiesForPoster:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "focusConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PBFLogPosterContents();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v45 = v11;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v12;
    _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "[Transitioning to newly active poster] %@ with focusConfiguration: %@ from current active activity: %@", buf, 0x20u);
  }

  if (v14)
  {
    objc_msgSend(v14, "activityUUID");
    v16 = objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore _activityModeForFocusUUID:](self, "_activityModeForFocusUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (BSEqualObjects() & 1) == 0)
    {
      -[PBFPosterExtensionDataStore _updateActiveActivity:active:reason:](self, "_updateActiveActivity:active:reason:", v17, 1, CFSTR("PosterBoard is transitioning to a newly active poster which so happens to have this activity."));
      PBFLogPosterContents();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v17;
        v19 = "[Transitioning to newly active poster] and turning on linked focus activity: %@";
        goto LABEL_26;
      }
    }
    else
    {
      PBFLogPosterContents();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v17;
        v19 = "[Transitioning to newly active poster] and linked focus activity: %@ has already been turned on";
LABEL_26:
        _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }

LABEL_28:
    goto LABEL_29;
  }
  if (v12)
  {
    v34 = v4 - 1;
    v35 = v11;
    v36 = v9;
    v37 = v4;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v38, "orderedPosters");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v38, "configuredPropertiesForPoster:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "focusConfiguration");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "activityUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "activityUniqueIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqual:", v28);

          if (v29)
          {
            -[PBFPosterExtensionDataStore _updateActiveActivity:active:reason:](self, "_updateActiveActivity:active:reason:", 0, 0, CFSTR("PosterBoard is transitioning to a newly active poster with no associated focus."));
            PBFLogPosterContents();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v12;
              _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "[Transitioning to newly active poster] without linked focus activity. Turning off focus activity: %@ because it is linked to another poster.", buf, 0xCu);
            }

            PBFLogDataStore();
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = v32;
            v14 = 0;
            v11 = v35;
            v9 = v36;
            if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v33, OS_SIGNPOST_INTERVAL_END, v37, "_stateLock_updateFocusModeForActivePosterChange", ", buf, 2u);
            }

            goto LABEL_38;
          }

        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v22)
          continue;
        break;
      }
    }

    PBFLogPosterContents();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v12;
      _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, "[Transitioning to newly active poster] without linked focus activity. Leaving focus activity: %@ on because it is not linked to another poster.", buf, 0xCu);
    }
    v9 = v36;
    v4 = v37;
    v14 = 0;
    v11 = v35;
    v7 = v34;
    goto LABEL_28;
  }
LABEL_29:
  PBFLogDataStore();
  v30 = objc_claimAutoreleasedReturnValue();
  v20 = v30;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v20, OS_SIGNPOST_INTERVAL_END, v4, "_stateLock_updateFocusModeForActivePosterChange", ", buf, 2u);
  }
LABEL_38:

}

- (void)processEvents:(id)a3 context:(id)a4 QOS:(unsigned int)a5 reason:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__PBFPosterExtensionDataStore_processEvents_context_QOS_reason_completion___block_invoke;
  v18[3] = &unk_1E86F2FC0;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  PBFDispatchAsyncWithString(a6, (dispatch_qos_class_t)a5, v18);

}

void __75__PBFPosterExtensionDataStore_processEvents_context_QOS_reason_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 188));
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v9 = 0;
  v5 = objc_msgSend(v2, "_stateLock_processEvents:context:error:", v3, v4, &v9);
  v6 = v9;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 188));
  if ((v5 & 1) == 0 && !v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D68];
    v11[0] = CFSTR("events processing was not successful, but no error was issued");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pbf_generalErrorWithCode:userInfo:", 0, v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(a1[7] + 16))();

}

- (id)updateDataStoreForSwitcherConfiguration:(id)a3 reason:(id)a4 error:(id *)a5
{
  return -[PBFPosterExtensionDataStore updateDataStoreForSwitcherConfiguration:options:reason:error:](self, "updateDataStoreForSwitcherConfiguration:options:reason:error:", a3, 0, a4, a5);
}

- (id)updateDataStoreForSwitcherConfiguration:(id)a3 options:(unint64_t)a4 reason:(id)a5 error:(id *)a6
{
  os_unfair_lock_s *p_stateLock;
  id v11;
  id v12;
  void *v13;

  p_stateLock = &self->_stateLock;
  v11 = a5;
  v12 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:](self, "_stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:", v12, a4, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  return v13;
}

- (void)_transitionToNewSwitcherConfigurationIfNeededForReason:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_stateLock;
  id v7;

  p_stateLock = &self->_stateLock;
  v7 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _transitionToNewSwitcherConfigurationIfNeededForReason:error:](self, "_transitionToNewSwitcherConfigurationIfNeededForReason:error:", v7, a4);

  os_unfair_lock_unlock(p_stateLock);
}

- (id)_stateLock_updateDataStoreForSwitcherConfiguration:(id)a3 options:(unint64_t)a4 reason:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  PRSwitcherConfiguration *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t m;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  PBFPosterExtensionDataStore *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  NSObject *v117;
  int v118;
  const __CFString *v119;
  _BOOL4 v120;
  PRSwitcherConfiguration *stateLock_switcherConfiguration;
  void *v123;
  void *v124;
  id v126;
  char v127;
  unint64_t v128;
  id *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  PBFPosterExtensionDataStore *v135;
  uint64_t v136;
  uint64_t v137;
  id obj;
  id obja;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _QWORD v148[5];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint8_t v164[128];
  uint8_t buf[4];
  uint64_t v166;
  __int16 v167;
  uint64_t v168;
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v143 = *MEMORY[0x1E0D7FC58];
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (!v13)
    {
      v12 = 0;
LABEL_104:

      goto LABEL_105;
    }
    v128 = a4;
    v129 = a6;
    v130 = (void *)v13;
    -[PBFPosterExtensionDataStore _stateLock_switcherConfiguration](self, "_stateLock_switcherConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    v135 = self;
    -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "configurations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bs_mapNoNulls:", &__block_literal_global_433);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "configurations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bs_mapNoNulls:", &__block_literal_global_434);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "desiredActiveConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activeConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    v26 = objc_msgSend(v23, "isEqual:", v24);

    objc_msgSend(v25, "selectedConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v15;
    objc_msgSend(v15, "selectedConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    v140 = v22;
    v131 = (void *)v20;
    v30 = objc_msgSend(v22, "isEqualToArray:", v20);
    objc_msgSend(v25, "posterConfigurationsNeedingFocusConfigurationDeleted");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v31, "count");

    objc_msgSend(v25, "posterConfigurationsNeedingFocusConfigurationUpdates");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v32, "count");

    objc_msgSend(v25, "posterConfigurationsNeedingHomeScreenConfigurationUpdates");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v33, "count");

    objc_msgSend(v25, "incomingPosterConfigurations");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    v133 = v25;
    objc_msgSend(v25, "incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    v127 = v29;
    if (v29 && v26 && v30 && !v137 && !v136 && !v134 && !v35 && !v37)
    {
      v38 = v132;
      v12 = v132;
      v10 = v25;
      v14 = v130;
LABEL_103:

      goto LABEL_104;
    }
    if (v35
      && !-[PBFPosterExtensionDataStore _stateLock_canPersistNewPosterConfiguration](v135, "_stateLock_canPersistNewPosterConfiguration"))
    {
      v38 = v132;
      objc_msgSend(v132, "configurations");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v108, "count");

      v110 = -[PBFPosterExtensionDataStore _stateLock_maximumPosterConfigurationCount](v135, "_stateLock_maximumPosterConfigurationCount");
      PBFLogDataStore();
      v111 = objc_claimAutoreleasedReturnValue();
      v10 = v25;
      v14 = v130;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v166 = v109;
        v167 = 2048;
        v168 = v110;
        _os_log_impl(&dword_1CB9FA000, v111, OS_LOG_TYPE_DEFAULT, "refusing to ingest a new poster configuration because there are %lu existing configurations (limit: %li)", buf, 0x16u);
      }

      if (v129)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2206, 0);
        *v129 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v132;
      goto LABEL_103;
    }
    v142 = (void *)objc_opt_new();
    v10 = v25;
    if ((v30 & 1) == 0)
    {
      objc_msgSend(v132, "collection");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "orderedPosterUUIDs");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v25, "configurations");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "bs_mapNoNulls:", &__block_literal_global_436);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "orderedSetWithArray:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_msgSend(v40, "count");
      if (v45 == objc_msgSend(v44, "count") && (objc_msgSend(v40, "isEqual:", v44) & 1) == 0)
      {
        +[PBFPosterRoleCoordinatorChange reorderPostersForRole:sortedPosterUUIDs:](PBFPosterRoleCoordinatorChange, "reorderPostersForRole:sortedPosterUUIDs:", v143, v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "addObject:", v46);

      }
    }
    v126 = v11;
    if (v35)
    {
      v159 = 0u;
      v160 = 0u;
      v157 = 0u;
      v158 = 0u;
      objc_msgSend(v25, "incomingPosterConfigurations");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v158;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v158 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
            switch(objc_msgSend(v52, "incomingPosterType"))
            {
              case 0:
              case 3:
              case 4:
              case 5:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported incoming poster: %@"), v52);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  -[PBFPosterExtensionDataStore _stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:].cold.2();
                objc_msgSend(objc_retainAutorelease(v123), "UTF8String");
                _bs_set_crash_log_message();
                __break(0);
                JUMPOUT(0x1CBA19398);
              case 1:
                +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v143, v52);
                v53 = objc_claimAutoreleasedReturnValue();
                goto LABEL_32;
              case 2:
                +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v143, v52);
                v53 = objc_claimAutoreleasedReturnValue();
LABEL_32:
                v54 = (void *)v53;
                objc_msgSend(v142, "addObject:", v53);

                break;
              default:
                continue;
            }
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
        }
        while (v49);
      }

    }
    if (v37)
    {
      objc_msgSend(v133, "incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = 0u;
      v154 = 0u;
      v155 = 0u;
      v156 = 0u;
      objc_msgSend(v55, "keyEnumerator");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
      if (!v57)
        goto LABEL_51;
      v58 = v57;
      v59 = *(_QWORD *)v154;
      while (1)
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v154 != v59)
            objc_enumerationMutation(v56);
          objc_msgSend(v55, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * j));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "incomingPosterType");
          if (v62 == 4)
          {
            +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v143, v61);
            v63 = objc_claimAutoreleasedReturnValue();
LABEL_48:
            v64 = (void *)v63;
            objc_msgSend(v142, "addObject:", v63);

            goto LABEL_49;
          }
          if (v62 == 5)
          {
            +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v143, v61);
            v63 = objc_claimAutoreleasedReturnValue();
            goto LABEL_48;
          }
          if (v62 < 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported assoc incoming poster: %@"), v61);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[PBFPosterExtensionDataStore _stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:].cold.1();
            objc_msgSend(objc_retainAutorelease(v124), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1CBA193F4);
          }
LABEL_49:

        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
        if (!v58)
        {
LABEL_51:

          break;
        }
      }
    }
    if ((v30 & 1) == 0)
    {
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      obj = v131;
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v150;
        do
        {
          for (k = 0; k != v66; ++k)
          {
            if (*(_QWORD *)v150 != v67)
              objc_enumerationMutation(obj);
            v69 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * k);
            v148[0] = MEMORY[0x1E0C809B0];
            v148[1] = 3221225472;
            v148[2] = __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_441;
            v148[3] = &unk_1E86F2CF0;
            v148[4] = v69;
            v70 = objc_msgSend(v140, "bs_containsObjectPassingTest:", v148);
            objc_msgSend(v69, "serverIdentity");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "provider");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v141, "containsObject:", v72);

            if ((v70 & 1) == 0 && v73)
            {
              objc_msgSend(v69, "serverIdentity");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "posterUUID");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              +[PBFPosterRoleCoordinatorChange removePosterFromRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "removePosterFromRole:matchingUUID:", v143, v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "addObject:", v76);

            }
          }
          v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
        }
        while (v66);
      }

      v10 = v133;
      v11 = v126;
    }
    if (v137 || v136 || v134)
    {
      v77 = (void *)objc_opt_new();
      objc_msgSend(v10, "posterConfigurationsNeedingHomeScreenConfigurationUpdates");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "keyEnumerator");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "allObjects");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addObjectsFromArray:", v80);

      objc_msgSend(v10, "posterConfigurationsNeedingFocusConfigurationUpdates");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "keyEnumerator");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "allObjects");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addObjectsFromArray:", v83);

      objc_msgSend(v10, "posterConfigurationsNeedingFocusConfigurationDeleted");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "allObjects");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addObjectsFromArray:", v85);

      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      obja = v77;
      v86 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v144, v161, 16);
      if (v86)
      {
        v87 = v86;
        v88 = *(_QWORD *)v145;
        do
        {
          for (m = 0; m != v87; ++m)
          {
            if (*(_QWORD *)v145 != v88)
              objc_enumerationMutation(obja);
            v90 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * m);
            objc_msgSend(v10, "posterConfigurationsNeedingHomeScreenConfigurationUpdates");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "objectForKey:", v90);
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "posterConfigurationsNeedingFocusConfigurationUpdates");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "objectForKey:", v90);
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "posterConfigurationsNeedingFocusConfigurationDeleted");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend(v95, "containsObject:", v90);

            objc_msgSend(v90, "loadConfiguredPropertiesWithError:", 0);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = (void *)objc_msgSend(v97, "mutableCopy");

            if ((v96 & 1) != 0 || v94)
            {
              if (v96)
                v99 = 0;
              else
                v99 = v94;
              objc_msgSend(v98, "setFocusConfiguration:", v99);
            }
            if (v92)
              objc_msgSend(v98, "setHomeScreenConfiguration:", v92);
            objc_msgSend(v90, "pbf_posterUUID");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:forPosterWithinRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "updateConfiguredProperties:forPosterWithinRole:matchingUUID:", v98, v143, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "addObject:", v101);

          }
          v87 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v144, v161, 16);
        }
        while (v87);
      }

      v11 = v126;
    }
    v38 = v132;
    v102 = v135;
    if ((v127 & 1) != 0)
    {
LABEL_96:
      objc_msgSend(v10, "desiredActiveConfiguration");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContext](v102, "_buildRoleCoordinatorTransitionContext");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "setTransitionFromIncomingFocusModeChange:", objc_msgSend(v10, "activeConfigurationDueToIncomingFocusModeChange"));
      objc_msgSend(v114, "pbf_posterUUID");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "setDesiredActiveConfiguration:forRole:", v116, v143);

      PBFLogDataStore();
      v117 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        v118 = objc_msgSend(v10, "activeConfigurationDueToIncomingFocusModeChange");
        v119 = CFSTR("NO");
        if (v118)
          v119 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v166 = (uint64_t)v114;
        v167 = 2112;
        v168 = (uint64_t)v119;
        _os_log_impl(&dword_1CB9FA000, v117, OS_LOG_TYPE_DEFAULT, "_updateDataStoreForSwitcherConfiguration created context with desiredActiveConfiguration: %@ dueToIncomingFocusModeChange: %@", buf, 0x16u);
      }

      v120 = -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:](v135, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v142, 0, v128, v11, v115, v129);
      stateLock_switcherConfiguration = (PRSwitcherConfiguration *)v132;
      v14 = v130;
      if (v120)
        stateLock_switcherConfiguration = v135->_stateLock_switcherConfiguration;
      v12 = stateLock_switcherConfiguration;

      goto LABEL_103;
    }
    objc_msgSend(v10, "selectedConfiguration");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)MEMORY[0x1E0D7FB50];
    objc_msgSend(v103, "_path");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "loadFocusConfigurationForPath:error:", v105, 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      PBFLogDataStore();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v166 = (uint64_t)v103;
        _os_log_impl(&dword_1CB9FA000, v107, OS_LOG_TYPE_DEFAULT, "Making poster %@ with paired focus mode the new selected configuration- this should never occur!", buf, 0xCu);
      }
    }
    else
    {
      if (!v103)
      {
LABEL_95:

        goto LABEL_96;
      }
      objc_msgSend(v10, "selectedConfiguration");
      v107 = objc_claimAutoreleasedReturnValue();
      -[NSObject pbf_posterUUID](v107, "pbf_posterUUID");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v143, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "addObject:", v113);

      v102 = v135;
    }

    goto LABEL_95;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_105:

  return v12;
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_path");
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_path");
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_435(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbf_posterUUID");
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_441(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (id)_buildRoleCoordinatorTransitionContextForActivity:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "pbf_activeChargerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContextForActiveFocusMode:chargerIdentifier:](self, "_buildRoleCoordinatorTransitionContextForActiveFocusMode:chargerIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_buildRoleCoordinatorTransitionContextForChargerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBFPosterExtensionDataStore _activeActivity](self, "_activeActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContextForActiveFocusMode:chargerIdentifier:](self, "_buildRoleCoordinatorTransitionContextForActiveFocusMode:chargerIdentifier:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildRoleCoordinatorTransitionNotingInitialUpdate
{
  void *v2;

  -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContext](self, "_buildRoleCoordinatorTransitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInitialUpdate:", 1);
  return v2;
}

- (id)_buildRoleCoordinatorTransitionContext
{
  void *v3;
  void *v4;
  void *v5;

  -[PBFPosterExtensionDataStore _activeActivity](self, "_activeActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_activeChargerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContextForActiveFocusMode:chargerIdentifier:](self, "_buildRoleCoordinatorTransitionContextForActiveFocusMode:chargerIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildRoleCoordinatorTransitionContextWithDesiredActivePosterUUID:(id)a3 role:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContext](self, "_buildRoleCoordinatorTransitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 && v7)
    objc_msgSend(v8, "setDesiredActiveConfiguration:forRole:", v6, v7);

  return v9;
}

- (id)_buildRoleCoordinatorTransitionContextForActiveFocusMode:(id)a3 chargerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_activePosterLock;
  void *v10;
  NSObject *v11;
  void *v12;
  PBFPosterRoleCoordinatorGenericTransitionContext *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  v8 = (void *)-[NSMutableDictionary copy](self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "copy");
  os_unfair_lock_unlock(&self->_extensionProvidingLock);
  p_activePosterLock = &self->_activePosterLock;
  os_unfair_lock_lock(&self->_activePosterLock);
  v10 = (void *)-[NSMutableDictionary copy](self->_activePosterLock_roleToActivePosterConfiguration, "copy");
  os_unfair_lock_unlock(p_activePosterLock);
  PBFLogDataStore();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "activityUniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "Creating transitionContext with activeActivity: %@", (uint8_t *)&v15, 0xCu);

  }
  v13 = -[PBFPosterRoleCoordinatorGenericTransitionContext initWithActiveFocusMode:activeChargerIdentifier:extensionStoreCoordinators:currentActivePosterForRole:]([PBFPosterRoleCoordinatorGenericTransitionContext alloc], "initWithActiveFocusMode:activeChargerIdentifier:extensionStoreCoordinators:currentActivePosterForRole:", v6, v7, v8, v10);

  return v13;
}

- (BOOL)_stateLock_executeDataStoreUpdateWithChanges:(id)a3 diffs:(id *)a4 options:(unint64_t)a5 reason:(id)a6 context:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  PBFPosterRoleProcessor *v22;
  PBFPosterExtensionDataStoreSQLiteDatabase *database;
  void *v24;
  PBFPosterRoleProcessor *v25;
  void *v26;
  void *v27;
  void *v28;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v41;
  id v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  const __CFString *v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (!v16)
    {
      -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContext](self, "_buildRoleCoordinatorTransitionContext");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "pbf_transitionContextIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "substringToIndex:", 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    PBFLogDataStore();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v55 = v20;
      v56 = 2114;
      v57 = v15;
      _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@} executing data store update for reason: %{public}@", buf, 0x16u);
    }

    if (!self->_database)
    {
      if (!a8)
      {
        v17 = 0;
        goto LABEL_24;
      }
      v44 = v20;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D68];
      v53 = CFSTR("Database is nil when trying to initialize Poster role processor");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v25 = (PBFPosterRoleProcessor *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pbf_generalErrorWithCode:userInfo:", 1, v25);
      v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

      v20 = v44;
LABEL_24:

      goto LABEL_25;
    }
    v43 = v14;
    v44 = v20;
    v42 = v15;
    v22 = [PBFPosterRoleProcessor alloc];
    database = self->_database;
    -[NSDictionary allValues](self->_roleToRoleCoordinator, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:](v22, "initWithDataStorage:roleCoordinators:", database, v24);

    -[PBFPosterRoleProcessor addObserver:](v25, "addObserver:", self);
    if (a5)
    {
      v50 = CFSTR("updateOptions");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }
    runtimeAssertionProvider = self->_runtimeAssertionProvider;
    objc_msgSend(CFSTR("dataStoreUpdate-"), "stringByAppendingString:", v44);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke;
    v48[3] = &unk_1E86F26D8;
    v32 = v44;
    v49 = v32;
    -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](runtimeAssertionProvider, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", v30, v31, v48);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("executeDataStoreUpdateWithChanges-%@"), "stringByAppendingString:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    -[PBFPosterRoleProcessor processChanges:context:reason:userInfo:error:](v25, "processChanges:context:reason:userInfo:error:", v43, v16, v34, v27, &v47);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v47;

    v17 = v35 != 0;
    if (v35)
    {
      if (a4)
      {
        objc_msgSend(v35, "collectionDiffsPerRole");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (!a8)
        goto LABEL_20;
    }
    else
    {
      PBFLogDataStore();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:].cold.1();

      if (!a8)
        goto LABEL_20;
    }
    *a8 = objc_retainAutorelease(v36);
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:]");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke_456;
    v45[3] = &unk_1E86F2518;
    v38 = v33;
    v46 = v38;
    PBFDispatchAsyncWithString(v37, QOS_CLASS_DEFAULT, v45);

    PBFLogDataStore();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v32;
      _os_log_impl(&dword_1CB9FA000, v39, OS_LOG_TYPE_DEFAULT, "(%{public}@} Fin.", buf, 0xCu);
    }

    v15 = v42;
    v14 = v43;
    goto LABEL_23;
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v17 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_25:

  return v17;
}

void __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBFLogDataStore();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PosterBoard runtime assertion invalidated: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke_456(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:(id)a3 roleCoordinator:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PBFPosterExtensionDataStoreAssertionManager *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  char v53;
  unint64_t v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  PBFPosterExtensionDataStoreAssertionManager *v70;
  id v71;
  os_signpost_id_t spid;
  id v73;
  id v74;
  unint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  PBFPosterExtensionDataStore *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint8_t buf[4];
  id v110;
  __int16 v111;
  unint64_t v112;
  __int16 v113;
  id v114;
  __int16 v115;
  id v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
    goto LABEL_54;
  PBFLogDataStore();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  PBFLogDataStore();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v75 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543618;
    v110 = v9;
    v111 = 2114;
    v112 = (unint64_t)v10;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:", "roleCoordinator: %{public}@ context: %{public}@", buf, 0x16u);
  }
  spid = v12;

  objc_msgSend(v9, "role");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("Configuration Used in Switcher"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("In use by home screen poster"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("User-Selected Configuration"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("Active Configuration"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initialCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v8, "newCollection");
  v20 = self->_assertionManager;
  v88 = self;
  v86 = v15;
  -[PBFPosterExtensionDataStore activePosterConfigurationForRole:assocPoster:](self, "activePosterConfigurationForRole:assocPoster:", v15, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v9;
  v76 = v10;
  objc_msgSend(v9, "determineActivePosterConfigurationForContext:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedPoster");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectedPoster");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke;
  v97[3] = &unk_1E86F30B8;
  v77 = v8;
  v98 = v8;
  v87 = v16;
  v99 = v87;
  v74 = v18;
  v100 = v74;
  v25 = v17;
  v101 = v25;
  v79 = v23;
  v102 = v79;
  v85 = v84;
  v103 = v85;
  v78 = v24;
  v104 = v78;
  v26 = v22;
  v105 = v26;
  v80 = v21;
  v106 = v80;
  v27 = v82;
  v107 = v27;
  v28 = v19;
  v108 = v28;
  v81 = v26;
  if (!-[PBFPosterExtensionDataStoreAssertionManager executeTransaction:](v20, "executeTransaction:", v97))
  {
    v83 = v25;
    PBFLogDataStore();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v86;
      v110 = v86;
      _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "Role %{public}@ had no changes... moving on...", buf, 0xCu);
      v10 = v76;
      v9 = v73;
    }
    else
    {
      v10 = v76;
      v9 = v73;
      v31 = v86;
    }
    goto LABEL_50;
  }
  v71 = v27;
  if (v26)
    v29 = v26;
  else
    v29 = 0;
  -[PBFPosterExtensionDataStore markPosterConfigurationAsActive:forRole:](v88, "markPosterConfigurationAsActive:forRole:", v29, v86);
  v32 = -[PBFPosterExtensionDataStoreAssertionManager numberOfAssertionsForReason:](v88->_assertionManager, "numberOfAssertionsForReason:", v87);
  objc_msgSend(v28, "orderedPosters");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  PBFLogDataStore();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  v70 = v20;
  if (v32 == v34)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = v86;
      v111 = 2048;
      v112 = v32;
      _os_log_impl(&dword_1CB9FA000, v36, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfOrderedPostersAssertionsForReason %lu", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
  {
    -[PBFPosterExtensionDataStore _stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:].cold.3();
  }

  -[PBFPosterExtensionDataStoreAssertionManager inUsePosterPathIdentitiesForReason:](v88->_assertionManager, "inUsePosterPathIdentitiesForReason:", v87);
  v30 = objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend(v28, "orderedPosters");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v94 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "_path");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "serverIdentity");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[NSObject containsObject:](v30, "containsObject:", v43);

        if ((v44 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[inUsePosterPathIdentitiesForReason containsObject:[[inUseSwitcherConfiguration _path] serverIdentity]]"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PBFPosterExtensionDataStore _stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:].cold.2();
          objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1CBA1A7F4);
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
    }
    while (v39);
  }

  v83 = v25;
  -[PBFPosterExtensionDataStoreAssertionManager inUsePosterPathIdentitiesForReason:](v88->_assertionManager, "inUsePosterPathIdentitiesForReason:", v25);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend(v28, "associatedPosters");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v90 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "_path");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "serverIdentity");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v45, "containsObject:", v52);

        if ((v53 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[inUseAssocPosterPathIdentitiesForReason containsObject:[[inUseHomeScreenConfiguration _path] serverIdentity]]"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PBFPosterExtensionDataStore _stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:].cold.1();
          objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1CBA1A858);
        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
    }
    while (v48);
  }

  v54 = -[PBFPosterExtensionDataStoreAssertionManager numberOfAssertionsForReason:](v88->_assertionManager, "numberOfAssertionsForReason:", v71);
  PBFLogDataStore();
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v54 < 2)
  {
    v31 = v86;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v110 = v86;
      v111 = 2048;
      v112 = v54;
      v113 = 2114;
      v114 = v80;
      v115 = 2114;
      v116 = v81;
      _os_log_impl(&dword_1CB9FA000, v56, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfActivePosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }
  else
  {
    v31 = v86;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      v110 = v86;
      v111 = 2048;
      v112 = v54;
      v113 = 2114;
      v114 = v80;
      v115 = 2114;
      v116 = v81;
      _os_log_fault_impl(&dword_1CB9FA000, v56, OS_LOG_TYPE_FAULT, "Role %{public}@ numberOfActivePosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }

  v57 = -[PBFPosterExtensionDataStoreAssertionManager numberOfAssertionsForReason:](v88->_assertionManager, "numberOfAssertionsForReason:", v85);
  if (v57
    && (objc_msgSend(v28, "selectedPoster"), v58 = (void *)objc_claimAutoreleasedReturnValue(), v58, v58))
  {
    PBFLogDataStore();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v110 = v31;
      v111 = 2048;
      v112 = v57;
      v113 = 2114;
      v114 = v79;
      v115 = 2114;
      v116 = v78;
      _os_log_impl(&dword_1CB9FA000, v59, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfInUseSelectedPosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }
  else
  {
    PBFLogDataStore();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      v110 = v31;
      v111 = 2048;
      v112 = v57;
      v113 = 2114;
      v114 = v79;
      v115 = 2114;
      v116 = v78;
      _os_log_fault_impl(&dword_1CB9FA000, v59, OS_LOG_TYPE_FAULT, "Role %{public}@ numberOfInUseSelectedPosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }

  v60 = -[PBFPosterExtensionDataStoreAssertionManager numberOfAssertionsForReason:](v88->_assertionManager, "numberOfAssertionsForReason:", v83);
  objc_msgSend(v28, "associatedPosterUUIDs");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");

  PBFLogDataStore();
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v60 != v62)
  {
    v9 = v73;
    v20 = v70;
    if (!os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      goto LABEL_49;
    objc_msgSend(v28, "associatedPosterUUIDs");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v110 = v31;
    v111 = 2048;
    v112 = v60;
    v113 = 2114;
    v114 = v65;
    _os_log_fault_impl(&dword_1CB9FA000, v64, OS_LOG_TYPE_FAULT, "Role %{public}@ numberOfInUseAssocPostersInUseAssertions %lu; associatedPosterUUIDs: %{public}@",
      buf,
      0x20u);
    goto LABEL_47;
  }
  v9 = v73;
  v20 = v70;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v28, "associatedPosterUUIDs");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v110 = v31;
    v111 = 2048;
    v112 = v60;
    v113 = 2114;
    v114 = v65;
    _os_log_impl(&dword_1CB9FA000, v64, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfInUseAssocPostersInUseAssertions %lu; associatedPosterUUIDs: %{public}@",
      buf,
      0x20u);
LABEL_47:

  }
LABEL_49:

  v10 = v76;
  v8 = v77;
  v27 = v71;
LABEL_50:

  PBFLogDataStore();
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
  {
    *(_DWORD *)buf = 138543618;
    v110 = v9;
    v111 = 2114;
    v112 = (unint64_t)v10;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v67, OS_SIGNPOST_INTERVAL_END, spid, "_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:", "roleCoordinator: %{public}@ context: %{public}@", buf, 0x16u);
  }

LABEL_54:
}

uint64_t __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removedPosters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_2;
  v77[3] = &unk_1E86F3048;
  v6 = v3;
  v78 = v6;
  v79 = *(id *)(a1 + 40);
  objc_msgSend(v4, "bs_each:", v77);

  objc_msgSend(*(id *)(a1 + 32), "addedPosters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v5;
  v74[1] = 3221225472;
  v74[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_3;
  v74[3] = &unk_1E86F3048;
  v8 = v6;
  v75 = v8;
  v76 = *(id *)(a1 + 40);
  objc_msgSend(v7, "bs_each:", v74);

  objc_msgSend(*(id *)(a1 + 32), "updatedPosters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v5;
  v70[1] = 3221225472;
  v70[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_4;
  v70[3] = &unk_1E86F3070;
  v71 = *(id *)(a1 + 48);
  v10 = v8;
  v72 = v10;
  v73 = *(id *)(a1 + 40);
  objc_msgSend(v9, "bs_each:", v70);

  objc_msgSend(*(id *)(a1 + 32), "removedAssocPosters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v5;
  v67[1] = 3221225472;
  v67[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_5;
  v67[3] = &unk_1E86F3048;
  v12 = v10;
  v68 = v12;
  v69 = *(id *)(a1 + 56);
  objc_msgSend(v11, "bs_each:", v67);

  objc_msgSend(*(id *)(a1 + 32), "addedAssocPosters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v5;
  v64[1] = 3221225472;
  v64[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_6;
  v64[3] = &unk_1E86F3048;
  v14 = v12;
  v65 = v14;
  v66 = *(id *)(a1 + 56);
  objc_msgSend(v13, "bs_each:", v64);

  objc_msgSend(*(id *)(a1 + 32), "updatedAssocPosters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v5;
  v60[1] = 3221225472;
  v60[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_7;
  v60[3] = &unk_1E86F3070;
  v61 = *(id *)(a1 + 48);
  v16 = v14;
  v62 = v16;
  v63 = *(id *)(a1 + 56);
  objc_msgSend(v15, "bs_each:", v60);

  if ((objc_msgSend(*(id *)(a1 + 32), "selectedPostersAreEqual") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "_path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serverIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidateInUseAssertionForIdentity:reason:", v18, *(_QWORD *)(a1 + 72));

    objc_msgSend(*(id *)(a1 + 80), "_path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serverIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "acquireInUseAssertionForIdentity:reason:", v20, *(_QWORD *)(a1 + 72));

  }
  v21 = BSEqualObjects();
  v22 = *(void **)(a1 + 96);
  if (v21)
  {
    if (v22)
      goto LABEL_10;
  }
  else if (v22)
  {
    objc_msgSend(v22, "_path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serverIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidateInUseAssertionForIdentity:reason:", v24, *(_QWORD *)(a1 + 104));

  }
  v25 = *(void **)(a1 + 88);
  if (v25)
  {
    objc_msgSend(v25, "_path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "serverIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "acquireInUseAssertionForIdentity:reason:", v27, *(_QWORD *)(a1 + 104));

  }
LABEL_10:
  v28 = objc_msgSend(v16, "numberOfAssertionsForReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 112), "orderedPosters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v28 != v30)
  {
    objc_msgSend(v16, "inUsePosterPathIdentitiesForReason:", *(_QWORD *)(a1 + 40));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 112), "orderedPosters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bs_mapNoNulls:", &__block_literal_global_458);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)objc_msgSend(v31, "mutableCopy");
    v51 = (void *)v36;
    objc_msgSend(v37, "minusSet:", v36);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v38 = v37;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v57;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v57 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(v16, "invalidateInUseAssertionForIdentity:reason:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v42++), *(_QWORD *)(a1 + 40));
        }
        while (v40 != v42);
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
      }
      while (v40);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(*(id *)(a1 + 112), "orderedPosters");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v80, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v53;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v53 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v47), "_path");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "serverIdentity");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v31, "containsObject:", v49) & 1) == 0)
            objc_msgSend(v16, "acquireInUseAssertionForIdentity:reason:", v49, *(_QWORD *)(a1 + 40));

          ++v47;
        }
        while (v45 != v47);
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v80, 16);
      }
      while (v45);
    }

  }
  return 1;
}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_path");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateInUseAssertionForIdentity:reason:", v4, *(_QWORD *)(a1 + 40));

}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_path");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquireInUseAssertionForIdentity:reason:", v4, *(_QWORD *)(a1 + 40));

}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v4, "pbf_posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterWithUUID:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)a1[5];
  objc_msgSend(v12, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateInUseAssertionForIdentity:reason:", v8, a1[6]);

  v9 = (void *)a1[5];
  objc_msgSend(v4, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "serverIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "acquireInUseAssertionForIdentity:reason:", v11, a1[6]);

}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_path");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateInUseAssertionForIdentity:reason:", v4, *(_QWORD *)(a1 + 40));

}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_path");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquireInUseAssertionForIdentity:reason:", v4, *(_QWORD *)(a1 + 40));

}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_7(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v4, "pbf_posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedPosterForUUID:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)a1[5];
  objc_msgSend(v12, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateInUseAssertionForIdentity:reason:", v8, a1[6]);

  v9 = (void *)a1[5];
  objc_msgSend(v4, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "serverIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "acquireInUseAssertionForIdentity:reason:", v11, a1[6]);

}

id __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "_path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_stateLock_pushUpdateNotificationsForRole:(id)a3 diff:(id)a4 previouslyActiveConfiguration:(id)a5 newActiveConfiguration:(id)a6 options:(unint64_t)a7 reason:(id)a8 context:(id)a9
{
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  _BOOL8 v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  int v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t n;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  uint64_t v89;
  int v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  PBFPosterSnapshotManager *v100;
  void (**v101)(void *, uint64_t, uint64_t, _QWORD *);
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t ii;
  uint64_t v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  PBFPosterSnapshotManager *v115;
  uint64_t v116;
  _BOOL4 v117;
  uint64_t v118;
  int v119;
  int v120;
  void *v121;
  os_signpost_id_t spid;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  int obj;
  id obja;
  uint64_t v134;
  int v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  id v141;
  void *v142;
  PBFPosterExtensionDataStore *v143;
  id v144;
  _QWORD block[5];
  id v146;
  id v147;
  _QWORD v148[5];
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD aBlock[4];
  PBFPosterSnapshotManager *v159;
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  id v177;
  id v178;
  char v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  uint8_t v190[128];
  uint8_t buf[4];
  id v192;
  __int16 v193;
  id v194;
  __int16 v195;
  _BYTE v196[10];
  unint64_t v197;
  _BYTE v198[10];
  __int16 v199;
  id v200;
  uint64_t v201;

  v201 = *MEMORY[0x1E0C80C00];
  v144 = a3;
  v141 = a4;
  v129 = a5;
  v130 = a6;
  v127 = a8;
  v14 = a9;
  v143 = self;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
    goto LABEL_176;
  v125 = v14;
  objc_msgSend(v14, "pbf_transitionContextIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "substringToIndex:", 7);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  PBFLogDataStore();
  v17 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v17);

  PBFLogDataStore();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138544642;
    v192 = v144;
    v193 = 2114;
    v194 = v129;
    v195 = 2114;
    *(_QWORD *)v196 = v130;
    *(_WORD *)&v196[8] = 2048;
    v197 = a7;
    *(_WORD *)v198 = 2114;
    *(_QWORD *)&v198[2] = v127;
    v199 = 2114;
    v200 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, spid, "pushUpdateNotificationsForRole", "role: '%{public}@'; previousActivePosterConfiguration:'%{public}@' newlyActivatedConfiguration:'%{public}@'; optio"
      "ns:'%lu' reason:'%{public}@'; context:'%{public}@';",
      buf,
      0x3Eu);
  }

  PBFLogDataStore();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v192 = v142;
    v193 = 2114;
    v194 = v144;
    _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to issue update notifications for role %{public}@", buf, 0x16u);
  }

  v123 = (void *)objc_msgSend(v141, "newCollection");
  objc_msgSend(v123, "selectedPoster");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addedPosters");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "updatedPosters");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "removedPosters");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  obj = objc_msgSend(v141, "selectedPostersAreEqual");
  v135 = BSEqualObjects();
  v21 = !objc_msgSend(v141, "orderedPostersAreEqual")
     || !objc_msgSend(v141, "associatedPostersAreEqual")
     || objc_msgSend(v124, "count") != 0;
  v117 = v21;
  v118 = objc_msgSend(v128, "count");
  v116 = objc_msgSend(v126, "count");
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  v22 = (void *)objc_msgSend(v141, "newCollection");
  objc_msgSend(v22, "orderedPosters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v180, v190, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v181;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v181 != v25)
          objc_enumerationMutation(v23);
        v27 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * i);
        v28 = (void *)objc_msgSend(v141, "newCollection");
        objc_msgSend(v28, "associatedPosterForPoster:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          objc_msgSend(v140, "setObject:forKey:", v29, v27);

      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v180, v190, 16);
    }
    while (v24);
  }

  v137 = *MEMORY[0x1E0D7FC58];
  if (objc_msgSend(v144, "isEqual:"))
  {
    if ((objc_msgSend(v141, "isEqual") & obj & v135) == 1
      && (objc_msgSend(v125, "isInitialUpdate") & 1) == 0
      && v143->_stateLock_switcherConfiguration)
    {
      PBFLogDataStore();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* update switcher model for role %{public}@", buf, 0x16u);
      }

      goto LABEL_44;
    }
    PBFLogDataStore();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "(%{public}@) preparing to update switcher model for role %{public}@", buf, 0x16u);
    }

    v179 = 0;
    -[PBFPosterExtensionDataStore _stateLock_buildSwitcherConfigurationWithContext:outMutated:](v143, "_stateLock_buildSwitcherConfigurationWithContext:outMutated:", v125, &v179);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v125, "isInitialUpdate") & 1) != 0 || !v143->_stateLock_switcherConfiguration)
    {
      objc_msgSend(v123, "orderedPosters");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");

      PBFLogDataStore();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_DEFAULT, "(%{public}@) Initializing switcher model for role %{public}@", buf, 0x16u);
      }

      objc_storeStrong((id *)&v143->_stateLock_switcherConfiguration, v32);
      if (v179)
        v39 = 1;
      else
        v39 = v37 == 0;
      -[PBFPosterExtensionDataStore _notifyObserversDidInitializeWithSwitcherConfiguration:withChanges:](v143, "_notifyObserversDidInitializeWithSwitcherConfiguration:withChanges:", v143->_stateLock_switcherConfiguration, v39);
      PBFLogDataStore();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      v35 = "(%{public}@) Initialized switcher model for role %{public}@";
    }
    else
    {
      objc_storeStrong((id *)&v143->_stateLock_switcherConfiguration, v32);
      PBFLogDataStore();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v33, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updated switcher model for role %{public}@", buf, 0x16u);
      }

      -[PBFPosterExtensionDataStore _notifyObserversDidUpdateSwitcherConfiguration:](v143, "_notifyObserversDidUpdateSwitcherConfiguration:", v32);
      PBFLogDataStore();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      v35 = "(%{public}@) Notified observers for updated switcher configuration for role %{public}@";
    }
    _os_log_impl(&dword_1CB9FA000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);
LABEL_43:

LABEL_44:
    if ((obj & 1) != 0)
    {
      PBFLogDataStore();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v40, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping notify of updated selected configuration for role %{public}@", buf, 0x16u);
      }
    }
    else
    {
      -[PRSwitcherConfiguration homeScreenPosterConfigurationForPosterConfiguration:](v143->_stateLock_switcherConfiguration, "homeScreenPosterConfigurationForPosterConfiguration:", v121);
      v40 = objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore _notifyObserversDidUpdateSelectedConfiguration:associatedConfiguration:reason:](v143, "_notifyObserversDidUpdateSelectedConfiguration:associatedConfiguration:reason:", v121, v40, v127);
      PBFLogDataStore();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v41, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did notify of updated selected configuration for role %{public}@", buf, 0x16u);
      }

    }
    PBFLogDataStore();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    if ((v135 & 1) != 0)
    {
      if (v43)
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v42, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify of updated active configuration for role %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v43)
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v42, OS_LOG_TYPE_DEFAULT, "(%{public}@) preparing to update last activated date for role %{public}@", buf, 0x16u);
      }

      objc_msgSend(v130, "_path");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "serverIdentity");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "posterUUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v178 = 0;
      -[PBFPosterExtensionDataStore _stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:](v143, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v46, 0, &v178);
      v42 = v178;
      -[NSObject providerInfo](v42, "providerInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v47, "mutableCopy");
      v49 = v48;
      if (v48)
      {
        v50 = v48;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v50 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, CFSTR("kConfigurationLastUseDateKey"));

      v177 = 0;
      v52 = -[NSObject setProviderInfo:error:](v42, "setProviderInfo:error:", v50, &v177);
      v53 = v177;
      PBFLogDataStore();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v52)
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v192 = v142;
          v193 = 2114;
          v194 = v46;
          v195 = 2114;
          *(_QWORD *)v196 = v144;
          _os_log_impl(&dword_1CB9FA000, v55, OS_LOG_TYPE_DEFAULT, "(%{public}@) Success updating last activated date for poster %{public}@ in role %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v192 = v142;
        v193 = 2114;
        v194 = v46;
        v195 = 2114;
        *(_QWORD *)v196 = v144;
        *(_WORD *)&v196[8] = 2114;
        v197 = (unint64_t)v53;
        _os_log_error_impl(&dword_1CB9FA000, v55, OS_LOG_TYPE_ERROR, "(%{public}@) FAILED updating last activated date for poster %{public}@ in role %{public}@: %{public}@", buf, 0x2Au);
      }

      PBFLogDataStore();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v56, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for updated active configuration for role %{public}@", buf, 0x16u);
      }

      objc_msgSend(v123, "associatedPosterForPoster:", v130);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore _notifyObserversDidUpdateActiveConfiguration:associatedConfiguration:reason:](v143, "_notifyObserversDidUpdateActiveConfiguration:associatedConfiguration:reason:", v130, v57, v127);
      PBFLogDataStore();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v58, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for updated active configuration for role %{public}@", buf, 0x16u);
      }

    }
  }
  if (objc_msgSend(v124, "count"))
  {
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v59 = v124;
    v60 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v173, v189, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v174;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v174 != v61)
            objc_enumerationMutation(v59);
          v63 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * j);
          PBFLogDataStore();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v192 = v142;
            v193 = 2114;
            v194 = v63;
            v195 = 2114;
            *(_QWORD *)v196 = v144;
            _os_log_impl(&dword_1CB9FA000, v64, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for updated configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

          -[PBFPosterExtensionDataStore _notifyObserversDidUpdateConfiguration:](v143, "_notifyObserversDidUpdateConfiguration:", v63);
          PBFLogDataStore();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v192 = v142;
            v193 = 2114;
            v194 = v63;
            v195 = 2114;
            *(_QWORD *)v196 = v144;
            _os_log_impl(&dword_1CB9FA000, v65, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for updated configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

        }
        v60 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v173, v189, 16);
      }
      while (v60);
    }
  }
  else
  {
    PBFLogDataStore();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v59, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for specific updated configurations for role %{public}@", buf, 0x16u);
    }
  }

  if (objc_msgSend(v128, "count") || (objc_msgSend(v141, "isEqual") & 1) == 0)
  {
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v66 = v128;
    v67 = -[NSObject countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v169, v188, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v170;
      do
      {
        for (k = 0; k != v67; ++k)
        {
          if (*(_QWORD *)v170 != v68)
            objc_enumerationMutation(v66);
          v70 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * k);
          PBFLogDataStore();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v192 = v142;
            v193 = 2114;
            v194 = v70;
            v195 = 2114;
            *(_QWORD *)v196 = v144;
            _os_log_impl(&dword_1CB9FA000, v71, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for added configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

          -[PBFPosterExtensionDataStore _notifyObserversDidAddConfiguration:](v143, "_notifyObserversDidAddConfiguration:", v70);
          PBFLogDataStore();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v192 = v142;
            v193 = 2114;
            v194 = v70;
            v195 = 2114;
            *(_QWORD *)v196 = v144;
            _os_log_impl(&dword_1CB9FA000, v72, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for added configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

        }
        v67 = -[NSObject countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v169, v188, 16);
      }
      while (v67);
    }
  }
  else
  {
    PBFLogDataStore();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v66, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for added configurations for role %{public}@", buf, 0x16u);
    }
  }

  if (objc_msgSend(v126, "count"))
  {
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v73 = v126;
    v74 = -[NSObject countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v165, v187, 16);
    if (v74)
    {
      v75 = *(_QWORD *)v166;
      do
      {
        for (m = 0; m != v74; ++m)
        {
          if (*(_QWORD *)v166 != v75)
            objc_enumerationMutation(v73);
          v77 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * m);
          PBFLogDataStore();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v192 = v142;
            v193 = 2114;
            v194 = v77;
            v195 = 2114;
            *(_QWORD *)v196 = v144;
            _os_log_impl(&dword_1CB9FA000, v78, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for deleted configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

          -[PBFPosterExtensionDataStore _notifyObserversDidDeleteConfiguration:](v143, "_notifyObserversDidDeleteConfiguration:", v77);
          PBFLogDataStore();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v192 = v142;
            v193 = 2114;
            v194 = v77;
            v195 = 2114;
            *(_QWORD *)v196 = v144;
            _os_log_impl(&dword_1CB9FA000, v79, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for deleted configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

        }
        v74 = -[NSObject countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v165, v187, 16);
      }
      while (v74);
    }
  }
  else
  {
    PBFLogDataStore();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v73, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for deleted configurations for role %{public}@", buf, 0x16u);
    }
  }

  if (objc_msgSend(v140, "count") && objc_msgSend(v144, "isEqual:", v137))
  {
    PBFLogDataStore();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v192 = v142;
      v193 = 2114;
      v194 = v140;
      v195 = 2114;
      *(_QWORD *)v196 = v144;
      _os_log_impl(&dword_1CB9FA000, v80, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for changes to associated posters %{public}@ for role %{public}@", buf, 0x20u);
    }

    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    objc_msgSend(v140, "keyEnumerator");
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = -[NSObject countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v161, v186, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v162;
      do
      {
        for (n = 0; n != v82; ++n)
        {
          if (*(_QWORD *)v162 != v83)
            objc_enumerationMutation(v81);
          v85 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * n);
          objc_msgSend(v140, "objectForKey:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v86)
          {
            PBFLogDataStore();
            v87 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v192 = v142;
              v193 = 2114;
              v194 = v86;
              v195 = 2114;
              *(_QWORD *)v196 = v144;
              _os_log_impl(&dword_1CB9FA000, v87, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for updated associated poster %{public}@ for role %{public}@", buf, 0x20u);
            }

            -[PBFPosterExtensionDataStore _notifyObserversDidUpdateConfiguration:homeScreenAssociatedConfiguration:](v143, "_notifyObserversDidUpdateConfiguration:homeScreenAssociatedConfiguration:", v85, v86);
            PBFLogDataStore();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v192 = v142;
              v193 = 2114;
              v194 = v86;
              v195 = 2114;
              *(_QWORD *)v196 = v144;
              _os_log_impl(&dword_1CB9FA000, v88, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for updated associated poster %{public}@ for role %{public}@", buf, 0x20u);
            }

          }
        }
        v82 = -[NSObject countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v161, v186, 16);
      }
      while (v82);
    }
  }
  else
  {
    PBFLogDataStore();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v81, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for changes to associated posters for role %{public}@", buf, 0x16u);
    }
  }

  v119 = obj ^ 1;
  v120 = v135 ^ 1;
  if (objc_msgSend(MEMORY[0x1E0D7FC90], "proactiveGallerySupportedForRole:", v144))
  {
    if (((v120 | v119) & 1) != 0 || objc_msgSend(v128, "count"))
      goto LABEL_140;
    v89 = objc_msgSend(v126, "count");
    v90 = v117;
    if (v89)
      v90 = 1;
    if ((v90 | (v116 != 0 || v118 != 0)) == 1)
    {
LABEL_140:
      PBFLogDataStore();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v91, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushing updated poster configurations for role %{public}@", buf, 0x16u);
      }

      -[PBFPosterExtensionDataStore _stateLock_pushPosterConfigurationsToProactiveWithCompletion:](v143, "_stateLock_pushPosterConfigurationsToProactiveWithCompletion:", 0);
      -[PBFPosterExtensionDataStore _notifyObserversDidUpdateConfigurations](v143, "_notifyObserversDidUpdateConfigurations");
    }
    else
    {
      PBFLogDataStore();
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v192 = v142;
        v193 = 2114;
        v194 = v144;
        _os_log_impl(&dword_1CB9FA000, v114, OS_LOG_TYPE_DEFAULT, "(%{public}@) DID NOT push updated poster configurations for role %{public}@", buf, 0x16u);
      }

    }
  }
  if (((objc_msgSend(v144, "isEqual:", v137) ^ 1 | v135) & 1) == 0
    && (objc_msgSend(v125, "pbf_transitionFromIncomingFocusModeChange") & 1) == 0
    && objc_msgSend(v144, "isEqual:", v137))
  {
    PBFLogDataStore();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v92, OS_LOG_TYPE_DEFAULT, "(%{public}@) will update focus mode for active poster change for role %{public}@", buf, 0x16u);
    }

    -[PBFPosterExtensionDataStore _stateLock_updateFocusModeForActivePosterChange](v143, "_stateLock_updateFocusModeForActivePosterChange");
    PBFLogDataStore();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v93, OS_LOG_TYPE_DEFAULT, "(%{public}@) did update focus mode for active poster change for role %{public}@", buf, 0x16u);
    }

  }
  if (!(a7 & 1 | ((objc_msgSend(v144, "isEqual:", v137) & 1) == 0))
    && (objc_msgSend(v141, "isEqual") & 1) == 0
    && objc_msgSend(v144, "isEqual:", v137)
    && (objc_msgSend(v125, "isInitialUpdate") & 1) == 0)
  {
    PBFLogDataStore();
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v192 = v142;
      v193 = 2114;
      v194 = v144;
      _os_log_impl(&dword_1CB9FA000, v94, OS_LOG_TYPE_DEFAULT, "(%{public}@) will prewarm snapshots for role %{public}@", buf, 0x16u);
    }

    v95 = (void *)objc_opt_new();
    objc_msgSend(v141, "addedPosters");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "unionSet:", v96);

    objc_msgSend(v141, "addedAssocPosters");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "unionSet:", v97);

    objc_msgSend(v141, "updatedPosters");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "unionSet:", v98);

    objc_msgSend(v141, "updatedAssocPosters");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "unionSet:", v99);

    +[PBFGenericDisplayContext mainScreenDisplayContextsForKnownOrientations](PBFGenericDisplayContext, "mainScreenDisplayContextsForKnownOrientations");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v143->_snapshotManager;
    objc_initWeak((id *)buf, v143);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke;
    aBlock[3] = &unk_1E86F30E0;
    objc_copyWeak(&v160, (id *)buf);
    v115 = v100;
    v159 = v115;
    v101 = (void (**)(void *, uint64_t, uint64_t, _QWORD *))_Block_copy(aBlock);
    v102 = dispatch_group_create();
    dispatch_group_enter(v102);
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    obja = v95;
    v103 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v154, v185, 16);
    if (v103)
    {
      v134 = *(_QWORD *)v155;
      do
      {
        v104 = 0;
        v138 = v103;
        do
        {
          if (*(_QWORD *)v155 != v134)
            objc_enumerationMutation(obja);
          v139 = v104;
          v105 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * v104);
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          v153 = 0u;
          v106 = v136;
          v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v150, v184, 16);
          if (v107)
          {
            v108 = *(_QWORD *)v151;
            do
            {
              for (ii = 0; ii != v107; ++ii)
              {
                if (*(_QWORD *)v151 != v108)
                  objc_enumerationMutation(v106);
                v110 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * ii);
                dispatch_group_enter(v102);
                v148[0] = MEMORY[0x1E0C809B0];
                v148[1] = 3221225472;
                v148[2] = __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_2;
                v148[3] = &unk_1E86F3108;
                objc_copyWeak(&v149, (id *)buf);
                v148[4] = v105;
                v101[2](v101, v105, v110, v148);
                dispatch_group_leave(v102);
                objc_destroyWeak(&v149);
              }
              v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v150, v184, 16);
            }
            while (v107);
          }

          v104 = v139 + 1;
        }
        while (v139 + 1 != v138);
        v103 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v154, v185, 16);
      }
      while (v103);
    }

    dispatch_group_leave(v102);
    objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
    v111 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_3;
    block[3] = &unk_1E86F3130;
    block[4] = v143;
    v146 = v142;
    v147 = v144;
    dispatch_group_notify(v102, v111, block);

    objc_destroyWeak(&v160);
    objc_destroyWeak((id *)buf);

  }
  PBFLogDataStore();
  v112 = objc_claimAutoreleasedReturnValue();
  v113 = v112;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v112))
  {
    *(_DWORD *)buf = 138544898;
    v192 = v144;
    v193 = 2114;
    v194 = v125;
    v195 = 1024;
    *(_DWORD *)v196 = v119;
    *(_WORD *)&v196[4] = 1024;
    *(_DWORD *)&v196[6] = v120;
    LOWORD(v197) = 1024;
    *(_DWORD *)((char *)&v197 + 2) = v117;
    HIWORD(v197) = 1024;
    *(_DWORD *)v198 = v118 != 0;
    *(_WORD *)&v198[4] = 1024;
    *(_DWORD *)&v198[6] = v116 != 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v113, OS_SIGNPOST_INTERVAL_END, spid, "pushUpdateNotificationsForRole", "role: '%{public}@'; context:'%{public}@'; didUpdateSelectedConfiguration:'%{BOOL}u' didUpdateActiveConfiguration:'"
      "%{BOOL}u' configurationsWereUpdate:'%{BOOL}u' configurationsWereAdded:'%{BOOL}u' configurationsWereDeleted:'%{BOOL}u'",
      buf,
      0x34u);
  }

  v14 = v125;
LABEL_176:

}

void __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  PBFPosterSnapshotRequest *v11;
  void *v12;
  PBFPosterSnapshotRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = [PBFPosterSnapshotRequest alloc];
    +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions](PBFPosterSnapshotDefinition, "defaultConfigurationDefinitions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:](v11, "initWithConfiguration:definitions:context:", v7, v12, v8);

    -[PBFPosterSnapshotRequest requestWithIntention:](v13, "requestWithIntention:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestWithPowerLogReason:", 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(void **)(a1 + 32);
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "prewarmSnapshotsForRequests:completion:", v17, v9);

  }
}

void __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_notifyObserversDidUpdateSnapshotForConfiguration:", *(_QWORD *)(a1 + 32));
    WeakRetained = v5;
  }

}

void __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidUpdateConfigurations");
  PBFLogDataStore();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1CB9FA000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) did finish prewarming snapshots for role %{public}@; did additional push for updated configurations ("
      "because we've always done this, but its probably not needed)",
      (uint8_t *)&v5,
      0x16u);
  }

}

- (BOOL)_stateLock_processEvents:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedRoles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[PBFPosterExtensionDataStore _stateLock_processEvents:roles:context:error:](self, "_stateLock_processEvents:roles:context:error:", v9, v10, v8, a5);

  return (char)a5;
}

- (BOOL)_stateLock_processEvents:(id)a3 roles:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  PBFPosterRoleProcessor *v24;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    if (!v12)
    {
      -[PBFPosterExtensionDataStore _buildRoleCoordinatorTransitionContext](self, "_buildRoleCoordinatorTransitionContext");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v36 = v10;
    objc_msgSend(v12, "pbf_transitionContextIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "substringToIndex:", 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = v11;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v18);
          -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), v35);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bs_safeAddObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v20);
    }

    v24 = -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:]([PBFPosterRoleProcessor alloc], "initWithDataStorage:roleCoordinators:", self->_database, v17);
    -[PBFPosterRoleProcessor addObserver:](v24, "addObserver:", self);
    runtimeAssertionProvider = self->_runtimeAssertionProvider;
    objc_msgSend(CFSTR("processEvents-"), "stringByAppendingString:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke;
    v39[3] = &unk_1E86F26D8;
    v40 = v16;
    v29 = v16;
    -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](runtimeAssertionProvider, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", v26, v27, v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v36;
    -[PBFPosterRoleProcessor processEvents:context:reason:userInfo:error:](v24, "processEvents:context:reason:userInfo:error:", v36, v12, CFSTR("processEvents"), 0, a6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31 != 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionDataStore _stateLock_processEvents:roles:context:error:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v28;
    v37[1] = 3221225472;
    v37[2] = __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke_471;
    v37[3] = &unk_1E86F2518;
    v38 = v30;
    v33 = v30;
    PBFDispatchAsyncWithString(v32, QOS_CLASS_DEFAULT, v37);

    v11 = v35;
  }

  return v13;
}

void __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBFLogDataStore();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PosterBoard runtime assertion invalidated: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke_471(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_stateLock_initialRoleCoordinatorSetup
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

uint64_t __69__PBFPosterExtensionDataStore__stateLock_initialRoleCoordinatorSetup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reapEverythingExceptLatestVersion");
}

- (id)_stateLock_switcherConfiguration
{
  NSObject *v3;
  PRSwitcherConfiguration *stateLock_switcherConfiguration;
  PRSwitcherConfiguration *v6;
  PRSwitcherConfiguration *v7;
  uint8_t v8[16];

  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    PBFLogPosterContents();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "(_stateLock_switcherConfiguration...) Can't get switcher configuration: DataStore is invalidated.", v8, 2u);
    }

    return 0;
  }
  else
  {
    stateLock_switcherConfiguration = self->_stateLock_switcherConfiguration;
    if (!stateLock_switcherConfiguration)
    {
      -[PBFPosterExtensionDataStore _stateLock_buildSwitcherConfigurationWithContext:outMutated:](self, "_stateLock_buildSwitcherConfigurationWithContext:outMutated:", 0, 0);
      v6 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
      v7 = self->_stateLock_switcherConfiguration;
      self->_stateLock_switcherConfiguration = v6;

      stateLock_switcherConfiguration = self->_stateLock_switcherConfiguration;
    }
    return stateLock_switcherConfiguration;
  }
}

- (id)_stateLock_buildSwitcherConfigurationWithContext:(id)a3 outMutated:(BOOL *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PRSwitcherConfiguration *stateLock_switcherConfiguration;
  PRSwitcherConfiguration *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  const __CFString *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  char v39;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    PBFLogPosterContents();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(_stateLock_buildSwitcherConfigurationWithContext...) Can't build switcher configuration: DataStore is invalidated.", buf, 2u);
    }
    v8 = 0;
  }
  else
  {
    v9 = *MEMORY[0x1E0D7FC58];
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC58]);
    v10 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      -[NSObject posterCollection](v10, "posterCollection");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject orderedPosters](v11, "orderedPosters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bs_map:", &__block_literal_global_477);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v14;
      objc_msgSend(v14, "bs_mapNoNulls:", &__block_literal_global_479);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore _stateLock_lastUseDatesForPosterCollection](self, "_stateLock_lastUseDatesForPosterCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke_3;
      v46[3] = &unk_1E86F31F8;
      v42 = v16;
      v47 = v42;
      v44 = v15;
      objc_msgSend(v15, "sortedArrayUsingComparator:", v46);
      v17 = objc_claimAutoreleasedReturnValue();
      stateLock_switcherConfiguration = self->_stateLock_switcherConfiguration;
      if (stateLock_switcherConfiguration)
        -[PRSwitcherConfiguration selectedConfiguration](stateLock_switcherConfiguration, "selectedConfiguration");
      else
        -[NSObject selectedPoster](v11, "selectedPoster");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_stateLock_switcherConfiguration;
      if (v19)
        -[PRSwitcherConfiguration activeConfiguration](v19, "activeConfiguration");
      else
        -[PBFPosterExtensionDataStore activePosterConfigurationForRole:assocPoster:](self, "activePosterConfigurationForRole:assocPoster:", v9, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore activePosterConfigurationForRole:assocPoster:](self, "activePosterConfigurationForRole:assocPoster:", v9, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (void *)v21;
      else
        v23 = (void *)v20;
      v24 = v23;

      -[NSObject selectedPoster](v11, "selectedPoster");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PBFLogPosterContents();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v20;
        _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) currentActiveConfiguration: %{public}@", buf, 0xCu);
      }

      PBFLogPosterContents();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v24;
        _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) activeConfiguration: %{public}@", buf, 0xCu);
      }

      PBFLogPosterContents();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v25;
        _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) selectedConfiguration: %{public}@", buf, 0xCu);
      }

      if (!v25)
      {
        -[NSObject fallbackSelectedForSortedConfigurations:reverse:](v11, "fallbackSelectedForSortedConfigurations:reverse:", v17, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          PBFLogPosterContents();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) No selected configuration, no configuration to fallback to. Get ready for a bumpy ride.", buf, 2u);
          }

          v25 = 0;
        }
      }
      v41 = (void *)v20;
      if (v6)
      {
        -[NSObject determineActivePosterConfigurationForContext:](v7, "determineActivePosterConfigurationForContext:", v6, v20);
        v30 = objc_claimAutoreleasedReturnValue();

        v24 = (id)v30;
      }
      v31 = (void *)v17;
      PBFLogPosterContents();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v24;
        _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) determined activeConfiguration: %{public}@", buf, 0xCu);
      }

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FA90]), "_initWithCollection:activeConfiguration:", v11, v24);
      objc_msgSend(v8, "setActiveConfigurationDueToIncomingFocusModeChange:", objc_msgSend(v6, "pbf_transitionFromIncomingFocusModeChange"));
      PBFLogPosterContents();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_msgSend(v6, "pbf_transitionFromIncomingFocusModeChange");
        v35 = CFSTR("NO");
        if (v34)
          v35 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        v49 = (uint64_t)v8;
        v50 = 2112;
        v51 = v35;
        _os_log_impl(&dword_1CB9FA000, v33, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) generated switcher configuration: %{public}@, transitionFromIncomingFocusModeChange: %@", buf, 0x16u);
      }

      PBFLogPosterContents();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v15;
        _os_log_impl(&dword_1CB9FA000, v36, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) posterConfigurations: %{public}@", buf, 0xCu);
      }

      PBFLogPosterContents();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v24;
        _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) activeConfiguration: %{public}@", buf, 0xCu);
      }

      if (a4)
      {
        objc_msgSend(v8, "selectedConfiguration");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = BSEqualObjects();

        if ((v39 & 1) == 0)
          *a4 = 1;
      }

    }
    else
    {
      PBFLogPosterContents();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[PBFPosterExtensionDataStore _stateLock_buildSwitcherConfigurationWithContext:outMutated:].cold.1(v11);
      v8 = 0;
    }

  }
  return v8;
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_path");
}

id __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D7FAD8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "_initWithPath:", v3);

  return v4;
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v6, "_path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "serverIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "posterUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  v22 = objc_msgSend(v13, "compare:", v21);
  return v22;
}

- (void)fetchGalleryConfigurationWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[PBFPosterExtensionDataStore enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:](self, "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", a3, 3, a4);
}

- (void)enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  PBFLogGallery();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446210;
    v11 = "-[PBFPosterExtensionDataStore enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:]";
    _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}s) Queuing up a new gallery update...", (uint8_t *)&v10, 0xCu);
  }

  -[PBFGalleryController enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:](self->_galleryController, "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", a3, a4, v8);
}

- (void)checkForGalleryUpdatesAndPrewarmSnapshots
{
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  os_signpost_id_t v9;

  +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogDataStore();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PBFPosterExtensionDataStore_checkForGalleryUpdatesAndPrewarmSnapshots__block_invoke;
  v7[3] = &unk_1E86F22F0;
  v8 = v3;
  v9 = v5;
  v7[4] = self;
  v6 = v3;
  PBFDispatchAsyncWithString(CFSTR("checkForGalleryUpdates"), QOS_CLASS_USER_INITIATED, v7);

}

void __72__PBFPosterExtensionDataStore_checkForGalleryUpdatesAndPrewarmSnapshots__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  const char *v61;
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  PBFLogDataStore();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "checkForGalleryUpdatesAndPrewarmSnapshots:", ", buf, 2u);
  }

  v5 = *(void **)(a1 + 32);
  v62[0] = CFSTR("PBFDataComponentGallery");
  v62[1] = CFSTR("PBFDataComponentStaticDescriptors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataFreshnessForComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isFresh");
  v9 = *(id **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9, "currentGalleryConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prewarmGallerySnapshotsWithCompletion:", 0);

    PBFLogDataStore();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 48);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
LABEL_44:
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v12, OS_SIGNPOST_INTERVAL_END, v13, "checkForGalleryUpdatesAndPrewarmSnapshots:", ", buf, 2u);
      goto LABEL_45;
    }
    goto LABEL_45;
  }
  objc_msgSend(v9[11], "currentGalleryConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    PBFLogGallery();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v61 = "-[PBFPosterExtensionDataStore checkForGalleryUpdatesAndPrewarmSnapshots]_block_invoke";
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}s) No gallery found; queuing up a new gallery update...",
        buf,
        0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", 2, 0, 0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(v16 + 120);
  os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 188));
  if (v17)
  {
    v51 = v7;
    objc_msgSend(*(id *)(a1 + 32), "currentGalleryConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v18, "sectionIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v18;
    objc_msgSend(v18, "itemsForSectionWithIdentifier:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v21;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (!v22)
      goto LABEL_40;
    v23 = v22;
    v24 = *(_QWORD *)v56;
    v52 = *(_QWORD *)v56;
    v53 = a1;
    while (1)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "posterDescriptorLookupInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "posterDescriptorPath");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "type");

        if (v29 != 3)
        {
          objc_msgSend(v26, "posterDescriptorExtension");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "descriptorIdentifier");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v27)
            v33 = v30 == 0;
          else
            v33 = 1;
          if (!v33 && v31 != 0)
          {
            objc_msgSend(MEMORY[0x1E0DC3870], "pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:", v30, v31, *(_QWORD *)(a1 + 40));
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
            {
              objc_msgSend(v27, "identity");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "type");

              if (v37 == 2)
              {
                objc_msgSend(v30, "posterExtensionInfoPlist");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "pbf_posterBoardPosterDescriptorHeroGalleryOptionsForStaticDescriptorIdentifier:", v32);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              }
              objc_msgSend(v27, "identity");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "type");

              if (v41 == 1)
              {
                objc_msgSend(MEMORY[0x1E0D7FB48], "modelObjectCacheForPath:", v27);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "galleryOptions");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v42;
                if (v42)
                {
                  v44 = v42;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0D7FB50], "loadPosterDescriptorGalleryOptionsForPath:error:", v27, 0);
                  v44 = (id)objc_claimAutoreleasedReturnValue();
                }
                v39 = v44;

LABEL_35:
              }
              else
              {
                v39 = 0;
              }
              objc_msgSend(v39, "galleryAssetLookupInfo");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "posterExtensionBundle");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              a1 = v53;
              v47 = (id)objc_msgSend(v45, "pbf_imageFromBundle:displayContext:error:", v46, *(_QWORD *)(v53 + 40), 0);

              v24 = v52;
            }
          }

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (!v23)
      {
LABEL_40:

        objc_msgSend(*(id *)(a1 + 32), "currentGalleryConfiguration");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "prewarmGallerySnapshotsWithCompletion:", 0);

        v7 = v51;
        break;
      }
    }
  }
  PBFLogDataStore();
  v49 = objc_claimAutoreleasedReturnValue();
  v12 = v49;
  v13 = *(_QWORD *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    goto LABEL_44;
  }
LABEL_45:

}

- (void)pushToProactiveWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PBFPosterExtensionDataStore_pushToProactiveWithCompletion___block_invoke;
  v6[3] = &unk_1E86F3220;
  v7 = v4;
  v5 = v4;
  -[PBFPosterExtensionDataStore _stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:](self, "_stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:", CFSTR("DataStore XPC call"), 1, v6);
  os_unfair_lock_unlock(&self->_stateLock);

}

uint64_t __61__PBFPosterExtensionDataStore_pushToProactiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)pushPosterDescriptorsToProactiveForReason:(id)a3 completion:(id)a4
{
  id v6;
  __CFString *v7;
  const __CFString *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = (__CFString *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("(No reason given)");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PBFPosterExtensionDataStore_pushPosterDescriptorsToProactiveForReason_completion___block_invoke;
  v10[3] = &unk_1E86F3220;
  v11 = v6;
  v9 = v6;
  -[PBFPosterExtensionDataStore _stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:](self, "_stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:", v8, 1, v10);

  os_unfair_lock_unlock(&self->_stateLock);
}

uint64_t __84__PBFPosterExtensionDataStore_pushPosterDescriptorsToProactiveForReason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)fetchPosterSuggestionsForFocusModeWithUUID:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PBFPosterSnapshotManager *v16;
  void *v17;
  PBFPosterSnapshotManager *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  PBFPosterSnapshotManager *v25;
  PBFPosterExtensionDataStore *v26;
  id v27;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0CF8E28];
  v11 = a3;
  v12 = [v10 alloc];
  if (objc_msgSend(v11, "length"))
    v13 = 0;
  else
    v13 = 6;
  v14 = (void *)objc_msgSend(v12, "initWithType:uuid:", v13, v11);

  -[PBFPosterExtensionDataStore currentGalleryConfiguration](self, "currentGalleryConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_snapshotManager;
  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke;
  v22[3] = &unk_1E86F3298;
  v26 = self;
  v27 = v9;
  v23 = v15;
  v24 = v8;
  v25 = v16;
  v18 = v16;
  v19 = v8;
  v20 = v15;
  v21 = v9;
  objc_msgSend(v17, "fetchFaceSuggestionsForFocusMode:completion:", v14, v22);

}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PBFPosterSnapshotRequest *v21;
  void *v22;
  PBFPosterSnapshotRequest *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  id obj;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *group;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  void *v47;
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!a2 || a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_2;
    v57[3] = &unk_1E86F3248;
    v58 = *(id *)(a1 + 32);
    objc_msgSend(a2, "bs_mapNoNulls:", v57);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v54 != v10)
            objc_enumerationMutation(v7);
          +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:](PBFPosterSnapshotRequest, "snapshotRequestForPreview:context:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i), *(_QWORD *)(a1 + 40));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "requestWithPowerLogReason:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v13);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v9);
    }
    v33 = v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    group = dispatch_group_create();
    dispatch_group_enter(group);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v7;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v37)
    {
      v35 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v50 != v35)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          dispatch_group_enter(group);
          objc_msgSend(v15, "posterDescriptorLookupInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "posterDescriptorPath");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "posterDescriptorLookupInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "posterDescriptorExtension");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "posterExtensionBundleIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D7FAE0], "pbf_configuredPropertiesForPreview:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PBFPosterSnapshotDefinition gallerySnapshotDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotDefinition");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = [PBFPosterSnapshotRequest alloc];
          v59 = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:](v21, "initWithPath:provider:configuredProperties:definitions:context:", v39, v38, v19, v22, *(_QWORD *)(a1 + 40));

          objc_msgSend(v15, "previewUniqueIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterSnapshotRequest requestWithPreviewIdentifier:](v23, "requestWithPreviewIdentifier:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "requestWithLoadFromCacheIfAvailable:", 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "requestWithPowerLogReason:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = *(void **)(a1 + 48);
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3;
          v45[3] = &unk_1E86F3270;
          v46 = v36;
          v47 = v15;
          v48 = group;
          objc_msgSend(v28, "fetchPosterSnapshotForRequest:definition:completion:", v27, v20, v45);

        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      }
      while (v37);
    }

    dispatch_group_leave(group);
    v29 = *(void **)(a1 + 64);
    v30 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 200);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_493;
    block[3] = &unk_1E86F2F70;
    v42 = obj;
    v43 = v36;
    v44 = v29;
    v31 = v36;
    v32 = obj;
    dispatch_group_notify(group, v30, block);

  }
}

id __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "posterBoardRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewForItem:section:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PBFLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3_cold_1();

  }
  if (v5)
  {
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
    objc_sync_exit(v8);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_493(_QWORD *a1)
{
  PBFFocusPosterSuggestionData *v2;

  v2 = -[PBFFocusPosterSuggestionData initWithPreviews:previewsToSnapshotsMapTable:]([PBFFocusPosterSuggestionData alloc], "initWithPreviews:previewsToSnapshotsMapTable:", a1[4], a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

- (PBFGalleryConfiguration)currentGalleryConfiguration
{
  void *v3;
  os_unfair_lock_s *p_stateLock;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    -[PBFPosterExtensionDataStore _stateLock_currentGalleryConfiguration](self, "_stateLock_currentGalleryConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_stateLock);
  }
  return (PBFGalleryConfiguration *)v3;
}

- (id)_stateLock_currentGalleryConfiguration
{
  PBFGalleryConfiguration *v3;
  void *v4;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v3 = self->_stateLock_configuration;
    if (!v3)
    {
      if (!self->_stateLock_suggestedLayout)
      {
        -[PBFGalleryController currentGalleryConfiguration](self->_galleryController, "currentGalleryConfiguration");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterExtensionDataStore _stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:](self, "_stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:", v4, 0, 0);

      }
      v3 = self->_stateLock_configuration;
    }
  }
  return v3;
}

- (void)fetchCurrentGalleryConfiguration:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  if (v5)
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__PBFPosterExtensionDataStore_fetchCurrentGalleryConfiguration___block_invoke;
    v7[3] = &unk_1E86F2F98;
    v7[4] = self;
    v8 = v5;
    PBFDispatchAsyncWithString(v6, QOS_CLASS_USER_INITIATED, v7);

  }
}

void __64__PBFPosterExtensionDataStore_fetchCurrentGalleryConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentGalleryConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)galleryController:(id)a3 didUpdateCurrentGalleryConfiguration:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__PBFPosterExtensionDataStore_galleryController_didUpdateCurrentGalleryConfiguration___block_invoke;
    v7[3] = &unk_1E86F2540;
    v7[4] = self;
    v8 = v5;
    PBFDispatchAsyncWithString(CFSTR("galleryController:didUpdateCurrentGalleryConfiguration:"), QOS_CLASS_DEFAULT, v7);

  }
}

void __86__PBFPosterExtensionDataStore_galleryController_didUpdateCurrentGalleryConfiguration___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
  objc_msgSend(*(id *)(a1 + 32), "_stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:", *(_QWORD *)(a1 + 40), 0, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
}

- (void)snapshotManager:(id)a3 didUpdateSnapshotForPath:(id)a4 forDefinition:(id)a5
{
  id v7;
  id v8;
  NSObject *notificationQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PBFPosterExtensionDataStore_snapshotManager_didUpdateSnapshotForPath_forDefinition___block_invoke;
  block[3] = &unk_1E86F3130;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(notificationQueue, block);

}

void __86__PBFPosterExtensionDataStore_snapshotManager_didUpdateSnapshotForPath_forDefinition___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1[4] + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSnapshotForPath:forDefinition:", a1[4], a1[5], a1[6], (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)assertionProviderDidRelinquishInUseAssertion:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag", a3) & 1) == 0)
  {
    -[PBFPosterExtensionDataStore enumerateExtensionStoreCoordinators:](self, "enumerateExtensionStoreCoordinators:", &__block_literal_global_500);
    PBFLogDataStore();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "Relinquished in use assertion", v5, 2u);
    }

    -[PFPosterExtensionProvider cancel](self->_extensionProvider, "cancel");
  }
}

uint64_t __76__PBFPosterExtensionDataStore_assertionProviderDidRelinquishInUseAssertion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "purgeSnapshotCache");
}

- (void)assertionProviderDidAcquireInUseAssertion:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag", a3) & 1) == 0)
  {
    PBFLogDataStore();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "Acquired in use assertion", v5, 2u);
    }

    -[PFPosterExtensionProvider start](self->_extensionProvider, "start");
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PBFPosterExtensionDataStore_addObserver___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

uint64_t __43__PBFPosterExtensionDataStore_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag");
  if ((result & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 96);
      *(_QWORD *)(v5 + 96) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    }
    return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PBFPosterExtensionDataStore_removeObserver___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

uint64_t __46__PBFPosterExtensionDataStore_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_notifyObserversDidUpdateExtensions
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PBFPosterExtensionDataStore__notifyObserversDidUpdateExtensions__block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

void __66__PBFPosterExtensionDataStore__notifyObserversDidUpdateExtensions__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStoreDidUpdateExtensions:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidInitializeWithSwitcherConfiguration:(id)a3 withChanges:(BOOL)a4
{
  id v6;
  NSObject *notificationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PBFPosterExtensionDataStore__notifyObserversDidInitializeWithSwitcherConfiguration_withChanges___block_invoke;
  block[3] = &unk_1E86F32E0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(notificationQueue, block);

}

void __98__PBFPosterExtensionDataStore__notifyObserversDidInitializeWithSwitcherConfiguration_withChanges___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didInitializeWithSwitcherConfiguration:withChanges:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidInitializeRoles:(id)a3 roleToPosterCollection:(id)a4
{
  id v6;
  id v7;
  NSObject *notificationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PBFPosterExtensionDataStore__notifyObserversDidInitializeRoles_roleToPosterCollection___block_invoke;
  block[3] = &unk_1E86F3130;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(notificationQueue, block);

}

void __89__PBFPosterExtensionDataStore__notifyObserversDidInitializeRoles_roleToPosterCollection___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1[4] + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didInitializeActivePosters:posterCollections:", a1[4], a1[5], a1[6], (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateActivePosterForRoles:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateActivePosterForRoles___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateActivePosterForRoles___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:activePostersWereUpdatedForRoles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdatePosterCollectionsForRoles:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterCollectionsForRoles___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __82__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterCollectionsForRoles___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:posterCollectionsWereUpdatedForRoles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateSwitcherConfiguration:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PBFPosterExtensionDataStore__notifyObserversDidUpdateSwitcherConfiguration___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __78__PBFPosterExtensionDataStore__notifyObserversDidUpdateSwitcherConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSwitcherConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateGalleryConfiguration:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateGalleryConfiguration___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateGalleryConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateGalleryConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __102__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdatePosterDescriptorsForExtensionBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateConfigurations
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfigurations__block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

void __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfigurations__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStoreDidUpdateConfigurations:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateConfiguration:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidAddConfiguration:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PBFPosterExtensionDataStore__notifyObserversDidAddConfiguration___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __67__PBFPosterExtensionDataStore__notifyObserversDidAddConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didAddConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidDeleteConfiguration:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PBFPosterExtensionDataStore__notifyObserversDidDeleteConfiguration___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __70__PBFPosterExtensionDataStore__notifyObserversDidDeleteConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didDeleteConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateSelectedConfiguration:(id)a3 associatedConfiguration:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *notificationQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  notificationQueue = self->_notificationQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __109__PBFPosterExtensionDataStore__notifyObserversDidUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke;
  v15[3] = &unk_1E86F3308;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(notificationQueue, v15);

}

void __109__PBFPosterExtensionDataStore__notifyObserversDidUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1[4] + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSelectedConfiguration:associatedConfiguration:reason:", a1[4], a1[5], a1[6], a1[7], (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateActiveConfiguration:(id)a3 associatedConfiguration:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *notificationQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  notificationQueue = self->_notificationQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__PBFPosterExtensionDataStore__notifyObserversDidUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke;
  v15[3] = &unk_1E86F3308;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(notificationQueue, v15);

}

void __107__PBFPosterExtensionDataStore__notifyObserversDidUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1[4] + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateActiveConfiguration:associatedConfiguration:reason:", a1[4], a1[5], a1[6], a1[7], (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateConfiguration:(id)a3 homeScreenAssociatedConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *notificationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration_homeScreenAssociatedConfiguration___block_invoke;
  block[3] = &unk_1E86F3130;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(notificationQueue, block);

}

void __104__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration_homeScreenAssociatedConfiguration___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1[4] + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:posterConfiguration:didUpdateAssociatedHomeScreenPosterConfigurationTo:", a1[4], a1[5], a1[6], (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_notifyObserversDidUpdateSnapshotForConfiguration:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PBFPosterExtensionDataStore__notifyObserversDidUpdateSnapshotForConfiguration___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __81__PBFPosterExtensionDataStore__notifyObserversDidUpdateSnapshotForConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "getFlag") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSnapshotForConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (id)posterWithUUID:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_stateLock;
  id v7;
  void *v8;

  p_stateLock = &self->_stateLock;
  v7 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_posterWithUUID:error:](self, "_stateLock_posterWithUUID:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  return v8;
}

- (id)_stateLock_posterWithUUID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSDictionary objectEnumerator](self->_roleToRoleCoordinator, "objectEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "posterCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "posterWithUUID:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v6 = 0;
    }

  }
  return v6;
}

- (void)updateSnapshotsForGallery:(id)a3 intention:(unint64_t)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PBFPosterExtensionDataStore *v18;
  id v19;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v18 = self;
  v34 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v19 = a6;
  v9 = (void *)objc_opt_new();
  +[PBFGenericDisplayContext mainScreenDisplayContextsForKnownOrientations](PBFGenericDisplayContext, "mainScreenDisplayContextsForKnownOrientations");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(v22, "posterSnapshotRequestsForContext:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10), v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "requestWithIntention:", a4);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "requestWithPowerLogReason:", a5);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v17);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v13);
        }

        ++v10;
      }
      while (v10 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }
  -[PBFPosterSnapshotManager prewarmSnapshotsForRequests:completion:](v18->_snapshotManager, "prewarmSnapshotsForRequests:completion:", v9, v19, v18);

}

- (void)_stateLock_updateExtensions:(id)a3 refreshDescriptors:(int64_t)a4 powerLogReason:(int64_t)a5 galleryUpdateOptions:(unint64_t)a6 queuedUpOperations:(id *)a7
{
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v22;
  id v23;
  NSSet *stateLock_fromExtensions;
  NSSet *v25;
  NSSet *v26;
  NSSet *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  __CFString *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  BOOL v69;
  id v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t m;
  __CFString *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  _BOOL4 v86;
  int v87;
  BOOL v88;
  __CFString *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  uint64_t n;
  void *v100;
  void *v101;
  void *v102;
  PBFDataComponentObjectEntity *v103;
  __CFString *v104;
  int v105;
  uint64_t v106;
  void *v107;
  __CFString *v108;
  NSObject *v109;
  NSObject *v110;
  _BOOL4 v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  _BOOL4 v119;
  NSObject *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  char v134;
  void *v135;
  uint64_t v136;
  void *v137;
  __CFString *v138;
  __CFString *v139;
  __CFString *v140;
  void *v141;
  void *v142;
  NSObject *v143;
  PBFDataComponentObjectEntity *v144;
  __CFString *v145;
  NSObject *v146;
  int v147;
  uint64_t v148;
  void *v149;
  __CFString *v150;
  __CFString *v151;
  NSObject *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  NSObject *v156;
  _BOOL4 v157;
  void *v158;
  void *v159;
  uint64_t v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  id v168;
  id v169;
  void *v170;
  void *v171;
  uint64_t v172;
  id v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  NSObject *v181;
  NSObject *v182;
  void *v183;
  _BOOL4 v184;
  id v185;
  NSObject *v186;
  NSObject *v187;
  NSObject *v188;
  uint64_t v189;
  NSObject *v190;
  id v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t ii;
  void *v196;
  NSObject *v197;
  NSObject *v198;
  NSObject *v199;
  void *v200;
  void *v201;
  os_signpost_id_t spid;
  void *v203;
  void *v204;
  void *v205;
  _BOOL4 stateLock_initialRoleCoordinatorSetupPerformed;
  unint64_t v207;
  void *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  BOOL v214;
  int v215;
  void *v216;
  void *v217;
  void *v218;
  _BOOL4 v219;
  id v220;
  char v221;
  void *v223;
  __CFString *v224;
  id v225;
  id v226;
  void *v227;
  void *v228;
  id obj;
  void *v230;
  uint64_t v231;
  void *v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  __CFString *v238;
  void *v239;
  void *v240;
  __CFString *v241;
  void *v242;
  PBFPosterExtensionDataStore *v243;
  _QWORD v244[5];
  id v245;
  void *v246;
  _QWORD block[5];
  id v248;
  id v249[2];
  _QWORD v250[4];
  NSObject *v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  id v256;
  id v257;
  _QWORD v258[4];
  id v259;
  _QWORD v260[4];
  id v261;
  uint64_t v262;
  uint64_t v263;
  void (*v264)(_QWORD *, void *);
  void *v265;
  id v266;
  NSObject *v267;
  id v268;
  id v269;
  id v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  id v275;
  _QWORD v276[4];
  id v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  id v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  id v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  uint8_t v296[128];
  uint8_t buf[4];
  void *v298;
  __int16 v299;
  _BYTE v300[10];
  __CFString *v301;
  _BYTE v302[10];
  __int16 v303;
  __CFString *v304;
  __int16 v305;
  int64_t v306;
  __int16 v307;
  id v308;
  _BYTE v309[128];
  _BYTE v310[128];
  _BYTE v311[128];
  _BYTE v312[128];
  void *v313;
  _BYTE v314[128];
  uint64_t v315;

  v315 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v204 = (void *)a6;
    v211 = v9;
    stateLock_initialRoleCoordinatorSetupPerformed = self->_stateLock_initialRoleCoordinatorSetupPerformed;
    PBFLogPosterContents();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    PBFLogPosterContents();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    spid = v11;
    v207 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "updateExtensions", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    v209 = v14;
    objc_msgSend(v14, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "substringToIndex:", 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("updateExtensions/%@"), v17);
    v242 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSAtomicFlag setFlag:](self->_extensionsInputIsValidAtomicFlag, "setFlag:", objc_msgSend(v211, "count") != 0);
    v18 = objc_msgSend(v211, "count");
    PBFLogPosterContents();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v298 = v242;
        v299 = 2112;
        *(_QWORD *)v300 = v211;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@) PosterBoard extensions updated %@", buf, 0x16u);
      }

      runtimeAssertionProvider = self->_runtimeAssertionProvider;
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFRuntimeAssertionProviding acquirePosterUpdateRuntimeAssertionForReason:target:](runtimeAssertionProvider, "acquirePosterUpdateRuntimeAssertionForReason:target:", CFSTR("updateExtensions"), v22);
      v210 = objc_claimAutoreleasedReturnValue();

      v23 = v211;
      stateLock_fromExtensions = self->_stateLock_fromExtensions;
      if (stateLock_fromExtensions)
      {
        v25 = stateLock_fromExtensions;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v25 = (NSSet *)(id)objc_claimAutoreleasedReturnValue();

      }
      v26 = (NSSet *)objc_msgSend(v23, "copy");
      v27 = self->_stateLock_fromExtensions;
      self->_stateLock_fromExtensions = v26;

      if ((PBFCurrentDeviceClassSupported() & 1) != 0)
      {
        v234 = v25;
      }
      else
      {
        -[NSSet bs_filter:](v25, "bs_filter:", &__block_literal_global_538);
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "bs_filter:", &__block_literal_global_541);
        v29 = objc_claimAutoreleasedReturnValue();

        v234 = (void *)v28;
        v23 = (id)v29;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v292 = 0u;
      v293 = 0u;
      v294 = 0u;
      v295 = 0u;
      v30 = v23;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v292, v314, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v293;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v293 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v292 + 1) + 8 * i);
            objc_msgSend(v35, "posterExtensionBundleIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v239, "setObject:forKey:", v35, v36);

            PBFLogPosterContents();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v298 = v242;
              v299 = 2114;
              *(_QWORD *)v300 = v35;
              _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_DEFAULT, "(%{public}@) Extension: %{public}@", buf, 0x16u);
            }

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v292, v314, 16);
        }
        while (v32);
      }

      PBFLogDataStore();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v298 = v242;
        _os_log_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_DEFAULT, "(%{public}@) Starting _updateExtensions", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("posterExtensionBundleIdentifier"), 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v313 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v313, 1);
      v40 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "allObjects");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "sortedArrayUsingDescriptors:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v234;
      objc_msgSend(v234, "allObjects");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = (void *)v40;
      objc_msgSend(v44, "sortedArrayUsingDescriptors:", v40);
      v45 = objc_claimAutoreleasedReturnValue();

      v218 = (void *)objc_opt_new();
      v217 = (void *)objc_opt_new();
      v227 = (void *)objc_opt_new();
      v232 = v42;
      v203 = (void *)v45;
      objc_msgSend(v42, "differenceFromArray:withOptions:usingEquivalenceTest:", v45, 0, &__block_literal_global_549);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v243 = self;
      v205 = v46;
      v228 = v30;
      if (objc_msgSend(v46, "hasChanges"))
      {
        v291 = 0u;
        v290 = 0u;
        v289 = 0u;
        v288 = 0u;
        objc_msgSend(v46, "removals");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v288, v312, 16);
        v219 = v48 != 0;
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v289;
          do
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(_QWORD *)v289 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v288 + 1) + 8 * j);
              objc_msgSend(v52, "object");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "posterExtensionBundleIdentifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v52, "object");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v287 = 0;
              v56 = -[PBFPosterExtensionDataStore _stateLock_cleanupAfterDeletedExtension:error:](v243, "_stateLock_cleanupAfterDeletedExtension:error:", v55, &v287);
              v57 = (__CFString *)v287;

              PBFLogDataStore();
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = v58;
              if (v56)
              {
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v298 = v242;
                  v299 = 2114;
                  *(_QWORD *)v300 = v54;
                  _os_log_impl(&dword_1CB9FA000, v59, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully cleaned up environment for extension '%{public}@'", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v298 = v242;
                v299 = 2114;
                *(_QWORD *)v300 = v54;
                *(_WORD *)&v300[8] = 2114;
                v301 = v57;
                _os_log_error_impl(&dword_1CB9FA000, v59, OS_LOG_TYPE_ERROR, "(%{public}@) Error cleanup up environment for extension '%{public}@': %{public}@", buf, 0x20u);
              }

              objc_msgSend(v239, "removeObjectForKey:", v54);
              objc_msgSend(v52, "object");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v227, "addObject:", v60);

              PBFLogDataStore();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v52, "object");
                v62 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v298 = v242;
                v299 = 2114;
                *(_QWORD *)v300 = v62;
                _os_log_impl(&dword_1CB9FA000, v61, OS_LOG_TYPE_DEFAULT, "(%{public}@) _updateExtensions is removing: %{public}@", buf, 0x16u);

              }
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v288, v312, 16);
          }
          while (v49);
        }

        v286 = 0u;
        v285 = 0u;
        v284 = 0u;
        v283 = 0u;
        objc_msgSend(v205, "insertions");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v283, v311, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v284;
          do
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v284 != v66)
                objc_enumerationMutation(v63);
              objc_msgSend(*(id *)(*((_QWORD *)&v283 + 1) + 8 * k), "object");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v282 = 0;
              v69 = -[PBFPosterExtensionDataStore _stateLock_setupEnvironmentForExtension:wasUpdated:error:](v243, "_stateLock_setupEnvironmentForExtension:wasUpdated:error:", v68, 0, &v282);
              v70 = v282;
              if (v69)
              {
                PBFLogPosterContents();
                v71 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v298 = v242;
                  v299 = 2112;
                  *(_QWORD *)v300 = v68;
                  _os_log_impl(&dword_1CB9FA000, v71, OS_LOG_TYPE_DEFAULT, "(%{public}@) _updateExtensions is adding: %@", buf, 0x16u);
                }

                objc_msgSend(v218, "addObject:", v68);
              }
              else
              {
                PBFLogDataStore();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v298 = v242;
                  v299 = 2114;
                  *(_QWORD *)v300 = v70;
                  _os_log_error_impl(&dword_1CB9FA000, v72, OS_LOG_TYPE_ERROR, "(%{public}@) Error setting up environment for extension: %{public}@", buf, 0x16u);
                }

              }
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v283, v311, 16);
          }
          while (v65);
          v219 = 1;
        }
        v43 = v234;

        PBFLogDataStore();
        v73 = objc_claimAutoreleasedReturnValue();
        self = v243;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v298 = v242;
          _os_log_impl(&dword_1CB9FA000, v73, OS_LOG_TYPE_DEFAULT, "(%{public}@) _updateExtensions had insertions/deletions!", buf, 0xCu);
        }

      }
      else
      {
        v219 = 0;
      }
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      obj = v43;
      v237 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v278, v310, 16);
      if (v237)
      {
        v235 = *(_QWORD *)v279;
        do
        {
          for (m = 0; m != v237; ++m)
          {
            if (*(_QWORD *)v279 != v235)
              objc_enumerationMutation(obj);
            v75 = *(__CFString **)(*((_QWORD *)&v278 + 1) + 8 * m);
            -[__CFString posterExtensionBundleIdentifier](v75, "posterExtensionBundleIdentifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v276[0] = MEMORY[0x1E0C809B0];
            v276[1] = 3221225472;
            v276[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_550;
            v276[3] = &unk_1E86F2B30;
            v77 = v76;
            v277 = v77;
            objc_msgSend(v232, "bs_firstObjectPassingTest:", v276);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v77);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "providerInfoObjectForKey:", CFSTR("StaticPersistentIdentifier"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "providerInfoObjectForKey:", CFSTR("PersistentIdentifier"));
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "persistentIdentifier");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "posterExtensionInfoPlist");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "pbf_staticDescriptorIdentifiers");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v83, "count"))
              v84 = _LSPersistentIdentifierCompare() == 0;
            else
              v84 = 0;

            objc_msgSend(v78, "posterExtensionInfoPlist");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "pbf_supportsDynamicDescriptors")
               && objc_msgSend(v78, "pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:", 0)&& _LSPersistentIdentifierCompare() == 0;

            v87 = objc_msgSend(v78, "isEqual:", v75);
            if (v84 || v86 || !v87)
            {
              v275 = 0;
              v88 = -[PBFPosterExtensionDataStore _stateLock_updateEnvironmentForExtension:fromExtension:error:](v243, "_stateLock_updateEnvironmentForExtension:fromExtension:error:", v78, v75, &v275);
              v89 = (__CFString *)v275;
              if (v88)
              {
                objc_msgSend(v217, "addObject:", v78);
                PBFLogDataStore();
                v90 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v298 = v242;
                  v299 = 2114;
                  *(_QWORD *)v300 = v77;
                  *(_WORD *)&v300[8] = 2114;
                  v301 = v89;
                  _os_log_impl(&dword_1CB9FA000, v90, OS_LOG_TYPE_DEFAULT, "(%@) Successfuly updated extension %{public}@:\t%{public}@ ", buf, 0x20u);
                }
                v219 = 1;
              }
              else
              {
                PBFLogDataStore();
                v91 = objc_claimAutoreleasedReturnValue();
                v90 = v91;
                if (v89)
                {
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412802;
                    v298 = v242;
                    v299 = 2114;
                    *(_QWORD *)v300 = v77;
                    *(_WORD *)&v300[8] = 2114;
                    v301 = v89;
                    _os_log_error_impl(&dword_1CB9FA000, v90, OS_LOG_TYPE_ERROR, "(%@) Error updating extension %{public}@:\t%{public}@ ", buf, 0x20u);
                  }
                }
                else if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  v298 = v242;
                  v299 = 2114;
                  *(_QWORD *)v300 = v77;
                  *(_WORD *)&v300[8] = 2114;
                  v301 = v75;
                  *(_WORD *)v302 = 2114;
                  *(_QWORD *)&v302[2] = v78;
                  _os_log_impl(&dword_1CB9FA000, v90, OS_LOG_TYPE_DEFAULT, "(%@) Extension %{public}@ is the same  (%{public}@ vs %{public}@).  So that's nice.", buf, 0x2Au);
                }
              }

            }
            self = v243;
          }
          v237 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v278, v310, 16);
        }
        while (v237);
      }

      if (self->_stateLock_updatingExtensions)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we can't handle multiple concurrent global updates yet"));
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:].cold.4();
        objc_msgSend(objc_retainAutorelease(v200), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1CBA23D20);
      }
      self->_stateLock_updatingExtensions = 1;
      v214 = -[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot](self, "_stateLock_hasBeenUnlockedSinceBoot");
      v92 = (void *)-[NSMutableDictionary mutableCopy](self->_stateLock_staticDescriptorsForExtensionBundleIdentifier, "mutableCopy");
      v93 = v92;
      if (v92)
      {
        v226 = v92;
      }
      else
      {
        v226 = (id)objc_opt_new();

      }
      v94 = (void *)-[NSMutableDictionary mutableCopy](self->_stateLock_descriptorsForExtensionBundleIdentifier, "mutableCopy");
      v95 = v94;
      if (v94)
      {
        v96 = v94;
      }
      else
      {
        v96 = (id)objc_opt_new();

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = (void *)objc_opt_new();
      v271 = 0u;
      v272 = 0u;
      v273 = 0u;
      v274 = 0u;
      v98 = v228;
      v220 = v98;
      v225 = v96;
      v230 = v97;
      v233 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v271, v309, 16);
      if (!v233)
      {
        v212 = 0;
        v221 = 0;
        v215 = 0;
        goto LABEL_166;
      }
      v212 = 0;
      v221 = 0;
      v215 = 0;
      v231 = *(_QWORD *)v272;
      while (1)
      {
        for (n = 0; n != v233; ++n)
        {
          if (*(_QWORD *)v272 != v231)
            objc_enumerationMutation(v98);
          v100 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * n);
          objc_msgSend(v100, "posterExtensionBundleIdentifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          if (v102)
          {
            +[PBFDataRefreshContext staticDescriptorsRefreshContextForNow:extension:](PBFDataRefreshContext, "staticDescriptorsRefreshContextForNow:extension:", v97, v100);
            v236 = objc_claimAutoreleasedReturnValue();
            v103 = -[PBFDataComponentObjectEntity initWithComponent:object:context:]([PBFDataComponentObjectEntity alloc], "initWithComponent:object:context:", CFSTR("PBFDataComponentStaticDescriptors"), v102, v236);
            -[PBFDataComponentObjectEntity determineRefreshState](v103, "determineRefreshState");
            v104 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v105 = -[__CFString needsRefresh](v104, "needsRefresh");
            v241 = v104;
            -[__CFString refreshReason](v104, "refreshReason");
            v106 = objc_claimAutoreleasedReturnValue();
            v107 = (void *)v106;
            v108 = CFSTR("NULL REFRESH REASON");
            if (v106)
              v108 = (__CFString *)v106;
            v238 = v108;

            PBFLogDataStore();
            v109 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v298 = v242;
              v299 = 2114;
              *(_QWORD *)v300 = v101;
              *(_WORD *)&v300[8] = 2114;
              v301 = v241;
              _os_log_impl(&dword_1CB9FA000, v109, OS_LOG_TYPE_DEFAULT, "(%{public}@) refresh state for %{public}@ static descriptors: %{public}@", buf, 0x20u);
            }

            PBFLogDataStore();
            v110 = objc_claimAutoreleasedReturnValue();
            v111 = os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);
            if (v105)
            {
              if (v111)
              {
                *(_DWORD *)buf = 138543874;
                v298 = v242;
                v299 = 2114;
                *(_QWORD *)v300 = v101;
                *(_WORD *)&v300[8] = 2114;
                v301 = v238;
                _os_log_impl(&dword_1CB9FA000, v110, OS_LOG_TYPE_DEFAULT, "(%{public}@) Static descriptors for %{public}@ are not up to date; proceeding with update for reason %{public}@",
                  buf,
                  0x20u);
              }

              objc_msgSend(v226, "objectForKeyedSubscript:", v101);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = v112;
              v114 = (void *)MEMORY[0x1E0C9AA60];
              if (!v112)
                v112 = (void *)MEMORY[0x1E0C9AA60];
              objc_msgSend(v112, "bs_mapNoNulls:", &__block_literal_global_556);
              v115 = objc_claimAutoreleasedReturnValue();
              v116 = (void *)v115;
              if (v115)
                v117 = (void *)v115;
              else
                v117 = v114;
              v118 = v117;

              v270 = 0;
              v119 = -[PBFPosterExtensionDataStore _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:](self, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:", v101, a5, &v270);
              v110 = v270;
              PBFLogDataStore();
              v120 = objc_claimAutoreleasedReturnValue();
              v121 = v120;
              if (v119)
              {
                v223 = v118;
                if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v298 = v242;
                  v299 = 2114;
                  *(_QWORD *)v300 = v101;
                  _os_log_impl(&dword_1CB9FA000, v121, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updated static descriptors for %{public}@", buf, 0x16u);
                }

                objc_msgSend(v102, "posterStaticDescriptorLatestVersionPaths");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "allObjects");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v123, "sortedArrayUsingSelector:", sel_compareDescriptorIdentifiers_);
                v124 = objc_claimAutoreleasedReturnValue();
                v125 = (void *)v124;
                v126 = (void *)MEMORY[0x1E0C9AA60];
                if (v124)
                  v127 = v124;
                else
                  v127 = MEMORY[0x1E0C9AA60];
                objc_msgSend(v226, "setObject:forKeyedSubscript:", v127, v101);

                objc_msgSend(v226, "objectForKeyedSubscript:", v101);
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "bs_mapNoNulls:", &__block_literal_global_561);
                v129 = objc_claimAutoreleasedReturnValue();
                v130 = (void *)v129;
                if (v129)
                  v131 = (void *)v129;
                else
                  v131 = v126;
                v132 = v131;

                v262 = MEMORY[0x1E0C809B0];
                v263 = 3221225472;
                v264 = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_562;
                v265 = &unk_1E86F3438;
                v118 = v223;
                v266 = v223;
                v121 = v132;
                v267 = v121;
                v268 = v216;
                v269 = v101;
                PFPosterRoleEnumerateValidRolesForCurrentDeviceClass();

                v215 = 1;
                self = v243;
                v98 = v220;
              }
              else
              {
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v298 = v242;
                  v299 = 2114;
                  *(_QWORD *)v300 = v101;
                  *(_WORD *)&v300[8] = 2114;
                  v301 = (__CFString *)v110;
                  _os_log_error_impl(&dword_1CB9FA000, v121, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to update static descriptors for %{public}@; error: %{public}@",
                    buf,
                    0x20u);
                }
                self = v243;
              }

              v96 = v225;
            }
            else if (v111)
            {
              *(_DWORD *)buf = 138543618;
              v298 = v242;
              v299 = 2114;
              *(_QWORD *)v300 = v101;
              _os_log_impl(&dword_1CB9FA000, v110, OS_LOG_TYPE_DEFAULT, "(%{public}@) Static descriptors do not need updating for %{public}@; bailing",
                buf,
                0x16u);
            }

            objc_msgSend(v100, "posterExtensionInfoPlist");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v133, "pbf_supportsDynamicDescriptors"))
            {
              v134 = objc_msgSend(v100, "pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:", 0);

              if ((v134 & 1) != 0)
              {
                objc_msgSend(v102, "lastRefreshDescriptorDate");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "lastRefreshDescriptorReason");
                v136 = objc_claimAutoreleasedReturnValue();
                v137 = (void *)v136;
                v138 = CFSTR("Never been refreshed");
                if (v136)
                  v138 = (__CFString *)v136;
                v224 = v138;

                objc_msgSend(v230, "timeIntervalSinceDate:", v135);
                v140 = v139;
                if (v214)
                {
                  v141 = v135;
                  objc_msgSend(v102, "lastRefreshDescriptorDate");
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PBFDataRefreshContext dynamicDescriptorsRefreshContextForNow:extension:lastRefreshDate:refreshStrategy:](PBFDataRefreshContext, "dynamicDescriptorsRefreshContextForNow:extension:lastRefreshDate:refreshStrategy:", v230, v100, v142, a4);
                  v143 = objc_claimAutoreleasedReturnValue();

                  v144 = -[PBFDataComponentObjectEntity initWithComponent:object:context:]([PBFDataComponentObjectEntity alloc], "initWithComponent:object:context:", CFSTR("PBFDataComponentDynamicDescriptors"), v102, v143);
                  -[PBFDataComponentObjectEntity determineRefreshState](v144, "determineRefreshState");
                  v145 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  PBFLogDataStore();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    v298 = v242;
                    v299 = 2114;
                    *(_QWORD *)v300 = v101;
                    *(_WORD *)&v300[8] = 2114;
                    v301 = v145;
                    _os_log_impl(&dword_1CB9FA000, v146, OS_LOG_TYPE_DEFAULT, "(%{public}@) refresh state for %{public}@ dynamic descriptors: %{public}@", buf, 0x20u);
                  }

                  v147 = -[__CFString needsRefresh](v145, "needsRefresh");
                  -[__CFString refreshReason](v145, "refreshReason");
                  v148 = objc_claimAutoreleasedReturnValue();
                  v149 = (void *)v148;
                  v150 = CFSTR("NULL REFRESH REASON");
                  if (v148)
                    v150 = (__CFString *)v148;
                  v151 = v150;

                  if (v147)
                  {
                    -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:](v243, "_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:", v101, v151, a5, 4, 0, 0);
                    v152 = objc_claimAutoreleasedReturnValue();
                    v96 = v225;
                    v153 = v212;
                    if (!v212)
                      v153 = (void *)objc_opt_new();
                    v212 = v153;
                    objc_msgSend(v153, "bs_safeAddObject:", v152);
                  }
                  else
                  {
                    objc_msgSend(v100, "posterExtensionInfoPlist");
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    v160 = objc_msgSend(v159, "pbf_refreshDescriptorsFrequency");

                    PBFLogDataStore();
                    v152 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
                    {
                      RefreshDescriptorsFrequencyToDebugString(v160);
                      v161 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544898;
                      v298 = v242;
                      v299 = 2112;
                      *(_QWORD *)v300 = v101;
                      *(_WORD *)&v300[8] = 2112;
                      v301 = v151;
                      *(_WORD *)v302 = 2048;
                      *(_QWORD *)&v302[2] = v140;
                      v303 = 2114;
                      v304 = v224;
                      v305 = 2048;
                      v306 = a4;
                      v307 = 2114;
                      v308 = v161;
                      _os_log_impl(&dword_1CB9FA000, v152, OS_LOG_TYPE_DEFAULT, "(%{public}@) Avoiding update for %@; reason for no update: %@ (last updated %f ago / reason '%{p"
                        "ublic}@'); refreshDescriptorsStategy: %ld; extension refresh frequency: %{public}@",
                        buf,
                        0x48u);

                    }
                    v96 = v225;
                  }

                  self = v243;
                  v158 = (void *)v236;
                  v135 = v141;
                  v98 = v220;
                }
                else
                {
                  PBFLogDataStore();
                  v143 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138544130;
                    v298 = v242;
                    v299 = 2114;
                    *(_QWORD *)v300 = v101;
                    *(_WORD *)&v300[8] = 2048;
                    v301 = v140;
                    *(_WORD *)v302 = 2114;
                    *(_QWORD *)&v302[2] = v224;
                    _os_log_impl(&dword_1CB9FA000, v143, OS_LOG_TYPE_DEFAULT, "(%{public}@) Avoiding dynamic poster descriptors update for %{public}@; keybag is locked. (%f ago/"
                      " reason: '%{public}@')",
                      buf,
                      0x2Au);
                  }
                  v158 = (void *)v236;
                }

                objc_msgSend(v96, "objectForKeyedSubscript:", v101);
                v162 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v162)
                {
                  objc_msgSend(v102, "dynamicPosterDescriptorLatestVersionPaths");
                  v163 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v163, "count"))
                  {
                    objc_msgSend(v163, "allObjects");
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v164, "sortedArrayUsingSelector:", sel_compareDescriptorIdentifiers_);
                    v165 = v135;
                    v166 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "setObject:forKeyedSubscript:", v166, v101);

                    v135 = v165;
                    v98 = v220;

                    v221 = 1;
                  }

                }
LABEL_161:
                v97 = v230;

                goto LABEL_162;
              }
            }
            else
            {

            }
            objc_msgSend(v96, "objectForKey:", v101);
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = objc_msgSend(v154, "count");

            PBFLogDataStore();
            v156 = objc_claimAutoreleasedReturnValue();
            v157 = os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT);
            if (v155)
            {
              v158 = (void *)v236;
              if (v157)
              {
                *(_DWORD *)buf = 138543618;
                v298 = v242;
                v299 = 2114;
                *(_QWORD *)v300 = v101;
                _os_log_impl(&dword_1CB9FA000, v156, OS_LOG_TYPE_DEFAULT, "(%{public}@) Dynamic descriptors disabled for %{public}@; terminating them.",
                  buf,
                  0x16u);
              }

              objc_msgSend(v102, "teardownAllDynamicDescriptors");
              objc_msgSend(v96, "removeObjectForKey:", v101);
              v221 = 1;
            }
            else
            {
              v158 = (void *)v236;
              if (v157)
              {
                *(_DWORD *)buf = 138543618;
                v298 = v242;
                v299 = 2114;
                *(_QWORD *)v300 = v101;
                _os_log_impl(&dword_1CB9FA000, v156, OS_LOG_TYPE_DEFAULT, "(%{public}@) Dynamic descriptors disabled for %{public}@; no descriptors present, moving on.",
                  buf,
                  0x16u);
              }

            }
            goto LABEL_161;
          }
LABEL_162:

        }
        v233 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v271, v309, 16);
        if (!v233)
        {
LABEL_166:

          v167 = v215;
          if ((!stateLock_initialRoleCoordinatorSetupPerformed || ((v219 | v215) & 1) != 0 || (v221 & 1) != 0)
            && ((v221 & 1) == 0 ? (v168 = 0) : (v168 = v96),
                (v215 & 1) == 0 ? (v169 = 0) : (v169 = v226),
                -[PBFPosterExtensionDataStore _stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:](self, "_stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:", 0, v168, v169), !stateLock_initialRoleCoordinatorSetupPerformed))
          {
            -[PBFPosterExtensionDataStore _stateLock_initialRoleCoordinatorSetup](self, "_stateLock_initialRoleCoordinatorSetup");
            self->_stateLock_initialRoleCoordinatorSetupPerformed = 1;
            v20 = v210;
            if ((v215 & 1) != 0)
              -[PBFPosterExtensionDataStore _stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:](self, "_stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:", CFSTR("Extensions were updated (static/initialRoleCoordinatorSetup)"), 1, 0);
            self->_stateLock_updatingExtensions = 0;
          }
          else
          {
            self->_stateLock_updatingExtensions = 0;
            v20 = v210;
            if (v219)
            {
              objc_msgSend((id)objc_opt_class(), "supportedRoles");
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v203);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = MEMORY[0x1E0C809B0];
              v260[0] = MEMORY[0x1E0C809B0];
              v260[1] = 3221225472;
              v260[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_569;
              v260[3] = &unk_1E86F2B30;
              v173 = v170;
              v261 = v173;
              objc_msgSend(v171, "bs_filter:", v260);
              v174 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v232);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              v258[0] = v172;
              v258[1] = 3221225472;
              v258[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_570;
              v258[3] = &unk_1E86F2B30;
              v176 = v173;
              v259 = v176;
              objc_msgSend(v175, "bs_filter:", v258);
              v177 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v174, "isEqual:", v177) & 1) == 0)
              {
                +[PBFPosterDataStoreEventBuilder extensionsUpdatedFrom:to:supportedRoles:](PBFPosterDataStoreEventBuilder, "extensionsUpdatedFrom:to:supportedRoles:", v174, v177, v176);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                v257 = 0;
                objc_msgSend(v178, "buildWithError:", &v257);
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                v180 = v257;

                PBFLogDataStore();
                v181 = objc_claimAutoreleasedReturnValue();
                v182 = v181;
                if (v180)
                {
                  if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                    -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:].cold.3();

                }
                else
                {
                  if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v298 = v242;
                    v299 = 2114;
                    *(_QWORD *)v300 = v179;
                    _os_log_impl(&dword_1CB9FA000, v182, OS_LOG_TYPE_DEFAULT, "(%{public}@) successfully built data store event for updated extensions: %{public}@", buf, 0x16u);
                  }

                  objc_msgSend(v216, "bs_safeAddObject:", v179);
                }

              }
              v20 = v210;
              v97 = v230;
              v167 = v215;
            }
          }
          if (objc_msgSend(v216, "count"))
          {
            v183 = (void *)objc_msgSend(v216, "copy");
            v256 = 0;
            v184 = -[PBFPosterExtensionDataStore _stateLock_processEvents:context:error:](self, "_stateLock_processEvents:context:error:", v183, 0, &v256);
            v185 = v256;

            PBFLogDataStore();
            v186 = objc_claimAutoreleasedReturnValue();
            v187 = v186;
            if (v184)
            {
              if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v298 = v242;
                _os_log_impl(&dword_1CB9FA000, v187, OS_LOG_TYPE_DEFAULT, "(%{public}@) successfully issued data store events for updated extensions", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
            {
              -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:].cold.2();
            }

            v20 = v210;
            v97 = v230;
          }
          -[PBFPosterExtensionDataStore _notifyObserversDidUpdateExtensions](self, "_notifyObserversDidUpdateExtensions");
          PBFLogDataStore();
          v188 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
          {
            v189 = objc_msgSend(v212, "count");
            *(_DWORD *)buf = 138413314;
            v298 = v242;
            v299 = 1024;
            *(_DWORD *)v300 = v221 & 1;
            v20 = v210;
            *(_WORD *)&v300[4] = 1024;
            *(_DWORD *)&v300[6] = v167;
            v97 = v230;
            LOWORD(v301) = 1024;
            *(_DWORD *)((char *)&v301 + 2) = v219;
            HIWORD(v301) = 2048;
            *(_QWORD *)v302 = v189;
            _os_log_impl(&dword_1CB9FA000, v188, OS_LOG_TYPE_DEFAULT, "(%@) Finished updating extensions; dynamic updated? %{BOOL}u -- static updated? %{BOOL}u -- extensions upd"
              "ated? %{BOOL}u -- queued up dynamic descriptors updates: %lu",
              buf,
              0x28u);
          }

          if (objc_msgSend(v212, "count"))
          {
            if (a7)
              *a7 = (id)objc_msgSend(v212, "copy");
            v190 = dispatch_group_create();
            v252 = 0u;
            v253 = 0u;
            v254 = 0u;
            v255 = 0u;
            v191 = v212;
            v192 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v252, v296, 16);
            if (v192)
            {
              v193 = v192;
              v194 = *(_QWORD *)v253;
              do
              {
                for (ii = 0; ii != v193; ++ii)
                {
                  if (*(_QWORD *)v253 != v194)
                    objc_enumerationMutation(v191);
                  v196 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * ii);
                  dispatch_group_enter(v190);
                  v250[0] = MEMORY[0x1E0C809B0];
                  v250[1] = 3221225472;
                  v250[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_571;
                  v250[3] = &unk_1E86F3460;
                  v251 = v190;
                  objc_msgSend(v196, "addCompletionObserver:", v250);

                }
                v193 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v252, v296, 16);
              }
              while (v193);
            }

            objc_initWeak((id *)buf, self);
            dispatch_get_global_queue(21, 0);
            v197 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_573;
            block[3] = &unk_1E86F34B0;
            objc_copyWeak(v249, (id *)buf);
            block[4] = self;
            v249[1] = v204;
            v248 = v209;
            dispatch_group_notify(v190, v197, block);

            objc_destroyWeak(v249);
            objc_destroyWeak((id *)buf);

            v20 = v210;
            v98 = v220;
            v96 = v225;
            v97 = v230;
          }
          else if ((-[BSAtomicFlag getFlag](self->_isPrewarmingFlag, "getFlag") & 1) == 0)
          {
            v244[0] = MEMORY[0x1E0C809B0];
            v244[1] = 3221225472;
            v244[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4_579;
            v244[3] = &unk_1E86F3488;
            v244[4] = self;
            v246 = v204;
            v245 = v209;
            -[PBFPosterExtensionDataStore _stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:](self, "_stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:", CFSTR("Extensions were updated - no updates"), 0, v244);

          }
          -[NSObject invalidate](v20, "invalidate");
          PBFLogPosterContents();
          v198 = objc_claimAutoreleasedReturnValue();
          v199 = v198;
          if (v207 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v198))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v199, OS_SIGNPOST_INTERVAL_END, spid, "updateExtensions", ", buf, 2u);
          }

          goto LABEL_216;
        }
      }
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:].cold.1();
LABEL_216:
    v9 = v211;

  }
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "posterExtensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(&unk_1E8741AA8, "containsObject:", v2);

  return v3;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "posterExtensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(&unk_1E8741AC0, "containsObject:", v2);

  return v3;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_547(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "posterExtensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterExtensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_550(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "posterExtensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_555(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D7FAF0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "_initWithPath:", v3);

  return v4;
}

id __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_560(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D7FAF0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "_initWithPath:", v3);

  return v4;
}

void __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_562(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3;
  v16[3] = &unk_1E86F3410;
  v6 = v3;
  v17 = v6;
  objc_msgSend(v4, "bs_filter:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[5];
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4;
  v14[3] = &unk_1E86F3410;
  v13 = v6;
  v15 = v13;
  objc_msgSend(v8, "bs_filter:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") || objc_msgSend(v7, "count"))
  {
    v10 = (void *)a1[6];
    +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:role:from:to:](PBFPosterDataStoreEventBuilder, "staticDescriptorsUpdatedForProvider:role:from:to:", a1[7], v13, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buildWithError:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bs_safeAddObject:", v12);

  }
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_569(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "supportedRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_570(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "supportedRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_571(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_573(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  uint64_t v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
    if ((objc_msgSend(WeakRetained[28], "getFlag") & 1) == 0)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3_576;
      v4[3] = &unk_1E86F3488;
      v3 = *(_QWORD *)(a1 + 56);
      v4[4] = WeakRetained;
      v6 = v3;
      v5 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:", CFSTR("Extensions were updated - updated reload descriptors"), 0, v4);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
  }

}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3_576(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishUpdateExtensionUpdateWithOptions:updateExtensionSession:pushToProactiveError:didUpdateProactiveDescriptors:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a3, a2);
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4_579(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishUpdateExtensionUpdateWithOptions:updateExtensionSession:pushToProactiveError:didUpdateProactiveDescriptors:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a3, a2);
}

- (void)_finishUpdateExtensionUpdateWithOptions:(unint64_t)a3 updateExtensionSession:(id)a4 pushToProactiveError:(id)a5 didUpdateProactiveDescriptors:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a4, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringToIndex:", 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("finishUpdateExtension/%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    PBFLogDataStore();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStore _finishUpdateExtensionUpdateWithOptions:updateExtensionSession:pushToProactiveError:didUpdateProactiveDescriptors:].cold.1();
  }
  else if (a6)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke;
    v16[3] = &unk_1E86F34D8;
    v17 = v14;
    -[PBFPosterExtensionDataStore enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:](self, "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", a3, 4, v16);
    v15 = v17;
  }
  else
  {
    PBFLogDataStore();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v14;
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "(%@)Finished dynamic descriptors update; push was identical to previous pushes, bailing.",
        buf,
        0xCu);
    }
  }

}

void __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  PBFLogDataStore();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138412546;
    v12 = v10;
    v13 = 1024;
    v14 = a4;
    _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "(%@)Finished dynamic descriptors update; did update? %{BOOL}u",
      (uint8_t *)&v11,
      0x12u);
  }

}

- (BOOL)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:(id)a3 reason:(int64_t)a4 error:(id *)a5
{
  __CFString *v8;
  char v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  NSObject *v46;
  void *v47;
  char v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  char v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  const __CFString *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  id *v82;
  void *v83;
  id v84;
  os_signpost_id_t v85;
  void *v86;
  __CFString *v87;
  unint64_t v88;
  id obj;
  NSObject *v90;
  char v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  __CFString *v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id v112;
  id v113;
  uint64_t v114;
  void *v115;
  uint8_t buf[4];
  __CFString *v117;
  __int16 v118;
  id v119;
  uint64_t v120;
  const __CFString *v121;
  uint64_t v122;
  void *v123;
  _BYTE v124[128];
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  _QWORD v128[4];

  v128[1] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    PBFLogPosterContents();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    PBFLogPosterContents();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      v117 = v8;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
    }

    -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v88 = v11 - 1;
        +[PBFPowerLogger logUpdate:reason:inServiceOfBundleIdentifier:](PBFPowerLogger, "logUpdate:reason:inServiceOfBundleIdentifier:", 0, a4, v8);
        objc_msgSend(v17, "teardownAllStaticDescriptorStoreCoordinators");
        objc_msgSend(v16, "posterExtensionInfoPlist");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0C99E40];
        objc_msgSend(v18, "pbf_staticDescriptorIdentifiers");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          v22 = v20;
        else
          v22 = MEMORY[0x1E0C9AA60];
        objc_msgSend(v19, "orderedSetWithArray:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "supportedRoles");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = MEMORY[0x1E0C809B0];
        v111[1] = 3221225472;
        v111[2] = __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke;
        v111[3] = &unk_1E86F3500;
        v25 = v18;
        v112 = v25;
        v26 = v24;
        v113 = v26;
        objc_msgSend(v23, "bs_filter:", v111);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "count"))
        {
          v84 = v26;
          v85 = v11;
          v82 = a5;
          v86 = v16;
          v87 = v8;
          v90 = objc_opt_new();
          v107 = 0u;
          v108 = 0u;
          v109 = 0u;
          v110 = 0u;
          v83 = v27;
          obj = v27;
          v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
          if (!v97)
          {
            v91 = 0;
            goto LABEL_72;
          }
          v91 = 0;
          v96 = *(_QWORD *)v108;
          v95 = *MEMORY[0x1E0CB2D68];
          v92 = v17;
          v98 = v25;
          while (1)
          {
            for (i = 0; i != v97; ++i)
            {
              if (*(_QWORD *)v108 != v96)
                objc_enumerationMutation(obj);
              v29 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
              objc_msgSend(v25, "pbf_roleForStaticDescriptorIdentifier:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = 0;
              objc_msgSend(v17, "createStaticDescriptorStoreCoordinatorForIdentifier:role:error:", v29, v30, &v106);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v106;
              if (v31)
              {
                objc_msgSend(v31, "posterUUID");
                v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v105 = 0;
                objc_msgSend(v31, "addNewVersionWithContents:error:", 0, &v105);
                v33 = objc_claimAutoreleasedReturnValue();
                v34 = (unint64_t)v105;

                objc_msgSend(v31, "pathForIdentity:", v33);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (id)v34;
                if (!(v33 | v34))
                {
                  v36 = (void *)MEMORY[0x1E0CB35C8];
                  v122 = v95;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("descriptor store w/ posterUUID %@ already existed"), v99);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v123 = v37;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3333, v38);
                  v32 = (id)objc_claimAutoreleasedReturnValue();

                  v25 = v98;
                  v17 = v92;
                }

                v91 = 1;
                if (v35)
                {
                  if (v32)
                    goto LABEL_23;
                  goto LABEL_26;
                }
              }
              else
              {
                v99 = 0;
              }
              v39 = (void *)MEMORY[0x1E0CB35C8];
              v120 = v95;
              v121 = CFSTR("Unable to create new static descriptor path");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3330, v40);
              v41 = objc_claimAutoreleasedReturnValue();

              v35 = 0;
              v32 = (id)v41;
              if (v41)
              {
LABEL_23:
                -[NSObject addObject:](v90, "addObject:", v32);
                goto LABEL_42;
              }
LABEL_26:
              v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FA80]), "_initWithPath:", v35);
              objc_msgSend(v25, "pbf_displayNameLocalizationKeyForStaticDescriptorIdentifier:", v29);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = v42;
              objc_msgSend(v42, "setDisplayNameLocalizationKey:");
              objc_msgSend(v25, "pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:", v29);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = 0;
              v44 = objc_msgSend(MEMORY[0x1E0D7FB50], "storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:", v35, v43, &v104);
              v45 = v104;
              if ((v44 & 1) == 0)
              {
                PBFLogPosterContents();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v117 = v99;
                  v118 = 2114;
                  v119 = v45;
                  _os_log_error_impl(&dword_1CB9FA000, v46, OS_LOG_TYPE_ERROR, "Could not update proactive gallery options for static descriptor ingestion poster uuid %{public}@: %{public}@", buf, 0x16u);
                }

              }
              objc_msgSend(v25, "pbf_posterBoardPosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:", v29);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = 0;
              v48 = objc_msgSend(MEMORY[0x1E0D7FB50], "storePosterDescriptorGalleryOptions:posterDescriptorGalleryOptions:error:", v35, v47, &v103);
              v49 = v103;

              if ((v48 & 1) == 0)
              {
                PBFLogPosterContents();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v117 = v99;
                  v118 = 2114;
                  v119 = v49;
                  _os_log_error_impl(&dword_1CB9FA000, v50, OS_LOG_TYPE_ERROR, "Could not update posterboard gallery options for static descriptor ingestion poster uuid %{public}@: %{public}@", buf, 0x16u);
                }

              }
              objc_msgSend(v98, "pbf_userInfoForStaticDescriptorIdentifier:", v29);
              v51 = objc_claimAutoreleasedReturnValue();
              v52 = (void *)v51;
              if (v51)
                v53 = v51;
              else
                v53 = MEMORY[0x1E0C9AA70];
              v102 = 0;
              v54 = objc_msgSend(v35, "storeUserInfo:error:", v53, &v102);
              v32 = v102;

              if ((v54 & 1) == 0)
              {
                PBFLogPosterContents();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v117 = v99;
                  v118 = 2114;
                  v119 = v32;
                  _os_log_error_impl(&dword_1CB9FA000, v55, OS_LOG_TYPE_ERROR, "Could not update userInfo for static descriptor ingestion poster uuid %{public}@: %{public}@", buf, 0x16u);
                }

              }
              v17 = v92;
              v25 = v98;
LABEL_42:

            }
            v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
            if (!v97)
            {
LABEL_72:

              v69 = v90;
              v16 = v86;
              v8 = v87;
              if (-[NSObject count](v90, "count"))
              {
                objc_msgSend(v17, "teardownAllStaticDescriptorStoreCoordinators");
                PBFLogPosterContents();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
                  -[PBFPosterExtensionDataStore _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:].cold.3();

                if (v82)
                {
                  v71 = (void *)MEMORY[0x1E0CB35C8];
                  v114 = *MEMORY[0x1E0CB2F70];
                  v72 = -[NSObject copy](v90, "copy");
                  v115 = v72;
                  v91 = 1;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v73);
                  *v82 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v91 = 1;
                }
              }
              objc_msgSend(obj, "array");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v100[0] = MEMORY[0x1E0C809B0];
              v100[1] = 3221225472;
              v100[2] = __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke_591;
              v100[3] = &unk_1E86F3528;
              v75 = v17;
              v101 = v75;
              objc_msgSend(v74, "bs_mapNoNulls:", v100);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              if (v76)
                v77 = v76;
              else
                v77 = (void *)MEMORY[0x1E0C9AA60];
              objc_msgSend(v75, "providerInfoSetObject:forKey:", v77, CFSTR("kProactiveStaticPosterDescriptorOrdering"));
              objc_msgSend(v86, "persistentIdentifier");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "providerInfoSetObject:forKey:", v78, CFSTR("StaticPersistentIdentifier"));

              PBFLogPosterContents();
              v79 = objc_claimAutoreleasedReturnValue();
              v80 = v79;
              if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
              {
                *(_DWORD *)buf = 138543362;
                v117 = v87;
                _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v80, OS_SIGNPOST_INTERVAL_END, v85, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
              }

              v27 = v83;
              v26 = v84;
              goto LABEL_86;
            }
          }
        }
        objc_msgSend(v17, "providerInfoSetObject:forKey:", 0, CFSTR("kProactiveStaticPosterDescriptorOrdering"));
        objc_msgSend(v16, "persistentIdentifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "providerInfoSetObject:forKey:", v66, CFSTR("StaticPersistentIdentifier"));

        PBFLogPosterContents();
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = v67;
        if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
        {
          *(_DWORD *)buf = 138543362;
          v117 = v8;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v68, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
        }
        v91 = 0;
        v69 = v68;
LABEL_86:

        v9 = v91;
        goto LABEL_87;
      }
      PBFLogPosterContents();
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_DWORD *)buf = 138543362;
        v117 = v8;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v62, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
      }

      PBFLogPosterContents();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:].cold.2();

      if (a5)
      {
        v64 = (void *)MEMORY[0x1E0CB35C8];
        if (v8)
          v65 = v8;
        else
          v65 = &stru_1E86FC5B8;
        v125 = CFSTR("extensionBundleIdentifier");
        v126 = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v25);
        v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_87:

        goto LABEL_88;
      }
      v9 = 0;
    }
    else
    {
      PBFLogPosterContents();
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v56;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_DWORD *)buf = 138543362;
        v117 = v8;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v57, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
      }

      PBFLogPosterContents();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:].cold.1();

      if (!a5)
      {
        v9 = 0;
LABEL_89:

        goto LABEL_90;
      }
      v59 = (void *)MEMORY[0x1E0CB35C8];
      if (v8)
        v60 = v8;
      else
        v60 = CFSTR("(null extensionBundleIdentifier)");
      v127 = CFSTR("extensionBundleIdentifier");
      v128[0] = v60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, &v127, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v17);
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_88:

    goto LABEL_89;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_90:

  return v9 & 1;
}

uint64_t __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "pbf_roleForStaticDescriptorIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3);

  return v4;
}

id __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke_591(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "staticDescriptorStoreCoordinatorForIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_stateLock_cleanupAfterDeletedExtension:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    objc_msgSend(v6, "posterExtensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotManager cancelRequestedSnapshotsForExtensionBundleIdentifier:](self->_snapshotManager, "cancelRequestedSnapshotsForExtensionBundleIdentifier:", v8);
    -[NSMutableDictionary objectForKey:](self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reapEverythingExceptLatestVersion");
    v7 = -[PBFPosterExtensionDataStore _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:](self, "_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:", v8, 0, a4);

  }
  return v7;
}

- (BOOL)_stateLock_setupEnvironmentForExtension:(id)a3 wasUpdated:(BOOL *)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  PBFPosterExtensionStoreCoordinator *v32;
  PBFPosterExtensionStoreCoordinator *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  os_signpost_id_t v41;
  os_signpost_id_t v42;
  id v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    PBFLogPosterContents();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    PBFLogPosterContents();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      objc_msgSend(v8, "posterExtensionBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v15;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v8, "posterExtensionBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (!a4)
        goto LABEL_10;
      goto LABEL_9;
    }
    -[PBFPosterExtensionDataStore extensionStoreCoordinatorContainerURL](self, "extensionStoreCoordinatorContainerURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
    {
      v41 = v11;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PFFileProtectionNoneAttributes();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v25 = objc_msgSend(v23, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 0, v24, &v43);
      v40 = v43;

      PBFLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25)
      {
        v28 = v40;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v16;
          _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "Successfully created extension store coordinator container for provider '%{public}@", buf, 0xCu);
        }
      }
      else
      {
        v28 = v40;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[PBFPosterExtensionDataStore _stateLock_setupEnvironmentForExtension:wasUpdated:error:].cold.1();
      }

      v11 = v41;
      if (v28)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v28);
        PBFLogPosterContents();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          objc_msgSend(v8, "posterExtensionBundleIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v31;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v30, OS_SIGNPOST_INTERVAL_END, v41, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);

        }
        v9 = 0;
        goto LABEL_14;
      }
    }
    v32 = -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:]([PBFPosterExtensionStoreCoordinator alloc], "initWithContainerURL:extensionIdentifier:", v17, v16);
    v33 = v32;
    if (v32)
    {
      -[PBFPosterExtensionStoreCoordinator setupEnvironmentIfNecessary](v32, "setupEnvironmentIfNecessary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
LABEL_32:
        if (a5)
          *a5 = objc_retainAutorelease(v34);
        PBFLogPosterContents();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          objc_msgSend(v8, "posterExtensionBundleIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v37;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v36, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);

        }
        v9 = 0;
        v17 = v33;
        goto LABEL_14;
      }
    }
    else
    {
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D68];
      v45 = CFSTR("Unable to setup extension store coordinator");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v42 = v11;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v39);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v42;
      if (v34)
        goto LABEL_32;
    }
    -[PBFPosterExtensionStoreCoordinator reapEverythingExceptLatestVersion](v33, "reapEverythingExceptLatestVersion");
    os_unfair_lock_lock(&self->_extensionProvidingLock);
    -[NSMutableDictionary setObject:forKey:](self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "setObject:forKey:", v33, v16);
    os_unfair_lock_unlock(&self->_extensionProvidingLock);
    -[NSMutableDictionary setObject:forKey:](self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "setObject:forKey:", v33, v16);

    v17 = v33;
    if (!a4)
    {
LABEL_10:
      PBFLogPosterContents();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        objc_msgSend(v8, "posterExtensionBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v20;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v19, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);

      }
      v9 = v17 != 0;
LABEL_14:

      goto LABEL_16;
    }
LABEL_9:
    *a4 = 0;
    goto LABEL_10;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (BOOL)_stateLock_updateEnvironmentForExtension:(id)a3 fromExtension:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  __CFString *v30;
  NSObject *v31;
  NSObject *v32;
  __CFString *v33;
  int v35;
  __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      LOBYTE(v10) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    PBFLogDataStore();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    PBFLogDataStore();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      objc_msgSend(v8, "posterExtensionBundleIdentifier");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v16;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "_stateLock_updateEnvironmentForExtension", "provider identifier: %{public}@", (uint8_t *)&v35, 0xCu);

    }
    objc_msgSend(v8, "posterExtensionBundleIdentifier");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBFLogPosterContents();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138543362;
        v36 = v17;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "Updating Extension %{public}@", (uint8_t *)&v35, 0xCu);
      }

      objc_msgSend(v9, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if ((v23 & 1) != 0)
      {
        PBFLogDataStore();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v35 = 138543874;
          v36 = v17;
          v37 = 2114;
          v38 = v9;
          v39 = 2114;
          v40 = v8;
          _os_log_debug_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEBUG, "Extension process for %{public}@ is unchanged; (%{public}@ vs %{public}@)",
            (uint8_t *)&v35,
            0x20u);
        }
      }
      else
      {
        PBFLogPosterContents();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v35 = 138543874;
          v36 = v17;
          v37 = 2114;
          v38 = v9;
          v39 = 2114;
          v40 = v8;
          _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "Extension process for %{public}@ HAS changed; (%{public}@ vs %{public}@)",
            (uint8_t *)&v35,
            0x20u);
        }
      }

      v10 = v23 ^ 1;
      PBFLogPosterContents();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138543618;
        v36 = v17;
        v37 = 1024;
        LODWORD(v38) = v10;
        _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "Updated Extension %{public}@: %{BOOL}u", (uint8_t *)&v35, 0x12u);
      }

      PBFLogDataStore();
      v32 = objc_claimAutoreleasedReturnValue();
      v29 = v32;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        objc_msgSend(v8, "posterExtensionBundleIdentifier");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v33;
        v37 = 1024;
        LODWORD(v38) = v10;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v29, OS_SIGNPOST_INTERVAL_END, v12, "_stateLock_updateEnvironmentForExtension", "provider identifier: %{public}@; didUpdate: %{BOOL}u",
          (uint8_t *)&v35,
          0x12u);

      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _stateLock_updateEnvironmentForExtension:fromExtension:error:].cold.1();

      if (a5)
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        if (v17)
          v26 = v17;
        else
          v26 = &stru_1E86FC5B8;
        v41 = CFSTR("extensionBundleIdentifier");
        v42[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v27);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      PBFLogDataStore();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        objc_msgSend(v8, "posterExtensionBundleIdentifier");
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v30;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v29, OS_SIGNPOST_INTERVAL_END, v12, "_stateLock_updateEnvironmentForExtension", "provider identifier: %{public}@", (uint8_t *)&v35, 0xCu);

      }
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

- (id)_stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_stateLock_descriptorsForExtensionBundleIdentifier, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_stateLock_knownStaticPosterDescriptorsForExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_stateLock_staticDescriptorsForExtensionBundleIdentifier, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_stateLock_extensionBundleIdentifierForConfigurationUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__PBFPosterExtensionDataStore__stateLock_extensionBundleIdentifierForConfigurationUUID___block_invoke;
    v7[3] = &unk_1E86F3550;
    v8 = v4;
    v9 = &v10;
    -[PBFPosterExtensionDataStore _stateLock_enumerateConfigurationStoreCoordinators:](self, "_stateLock_enumerateConfigurationStoreCoordinators:", v7);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

void __88__PBFPosterExtensionDataStore__stateLock_extensionBundleIdentifierForConfigurationUUID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(a3, "posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(v12, "extensionIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

- (void)enumerateExtensionStoreCoordinators:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_enumerateExtensionStoreCoordinators:](self, "_stateLock_enumerateExtensionStoreCoordinators:", v5);

  os_unfair_lock_unlock(p_stateLock);
}

- (id)extensionStoreCoordinators
{
  os_unfair_lock_s *p_stateLock;
  void *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinators](self, "_stateLock_extensionStoreCoordinators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (id)_stateLock_extensionStoreCoordinators
{
  void *v3;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[NSMutableDictionary allValues](self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_stateLock_enumerateExtensionStoreCoordinators:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    -[NSMutableDictionary allValues](self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__PBFPosterExtensionDataStore__stateLock_enumerateExtensionStoreCoordinators___block_invoke;
    v6[3] = &unk_1E86F3578;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

uint64_t __78__PBFPosterExtensionDataStore__stateLock_enumerateExtensionStoreCoordinators___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_stateLock_posterConfigurationPathForUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__PBFPosterExtensionDataStore__stateLock_posterConfigurationPathForUUID___block_invoke;
    v7[3] = &unk_1E86F3550;
    v8 = v4;
    v9 = &v10;
    -[PBFPosterExtensionDataStore _stateLock_enumerateConfigurationStoreCoordinators:](self, "_stateLock_enumerateConfigurationStoreCoordinators:", v7);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

void __73__PBFPosterExtensionDataStore__stateLock_posterConfigurationPathForUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(v11, "pathOfLatestVersion");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

- (BOOL)_stateLock_hasBeenUnlockedSinceBoot
{
  void *v4;
  uint64_t (*v5)(void);
  NSNumber *v6;
  NSNumber *stateLock_hasBeenUnlockedSinceBoot;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  if (-[NSNumber BOOLValue](self->_stateLock_hasBeenUnlockedSinceBoot, "BOOLValue"))
    return 1;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v5 = (uint64_t (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v12 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v8[3] = &unk_1E86F2990;
    v8[4] = &v9;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v8);
    v5 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v5)
    -[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot].cold.1();
  objc_msgSend(v4, "numberWithInt:", v5());
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stateLock_hasBeenUnlockedSinceBoot = self->_stateLock_hasBeenUnlockedSinceBoot;
  self->_stateLock_hasBeenUnlockedSinceBoot = v6;

  return -[NSNumber BOOLValue](self->_stateLock_hasBeenUnlockedSinceBoot, "BOOLValue");
}

+ (FCActivityManager)sharedActivityManager
{
  return (FCActivityManager *)objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
}

- (id)_activityModeForFocusUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PBFPosterExtensionDataStore__activityModeForFocusUUID___block_invoke;
  v9[3] = &unk_1E86F2420;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __57__PBFPosterExtensionDataStore__activityModeForFocusUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "activityUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_activeActivity
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "sharedActivityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateActiveActivity:(id)a3 active:(BOOL)a4 reason:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PBFLogDataStore();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[PBFPosterExtensionDataStore _activeActivity](self, "_activeActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "Telling FCActivityManager to change active activity from %@ to %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "sharedActivityManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActivity:active:reason:", v8, v6, v9);

}

- (id)activePosterConfigurationForRole:(id)a3 assocPoster:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  os_unfair_lock_lock(&self->_activePosterLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activePosterLock_roleToActivePosterConfiguration, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_activePosterLock);
  if (a4 && v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pbf_posterUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "associatedPosterForUUID:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)activePosterConfigurations
{
  os_unfair_lock_s *p_activePosterLock;
  void *v4;

  p_activePosterLock = &self->_activePosterLock;
  os_unfair_lock_lock(&self->_activePosterLock);
  v4 = (void *)-[NSMutableDictionary copy](self->_activePosterLock_roleToActivePosterConfiguration, "copy");
  os_unfair_lock_unlock(p_activePosterLock);
  return v4;
}

- (BOOL)markPosterConfigurationAsActive:(id)a3 forRole:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_activePosterLock;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  NSMutableDictionary *activePosterLock_roleToActivePosterConfiguration;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_activePosterLock = &self->_activePosterLock;
  os_unfair_lock_lock(&self->_activePosterLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activePosterLock_roleToActivePosterConfiguration, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isEqual:", v6) & 1) != 0)
  {
    PBFLogRoleCoordinator();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "Bailed; Will not transition Active poster from %{public}@ -> %{public}@",
        (uint8_t *)&v15,
        0x16u);
    }
    v12 = 0;
  }
  else
  {
    activePosterLock_roleToActivePosterConfiguration = self->_activePosterLock_roleToActivePosterConfiguration;
    if (v6)
      -[NSMutableDictionary setObject:forKeyedSubscript:](activePosterLock_roleToActivePosterConfiguration, "setObject:forKeyedSubscript:", v6, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](activePosterLock_roleToActivePosterConfiguration, "removeObjectForKey:", v7);
    PBFLogRoleCoordinator();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "Transitioned Active poster from %{public}@ -> %{public}@", (uint8_t *)&v15, 0x16u);
    }
    v12 = 1;
  }

  os_unfair_lock_unlock(p_activePosterLock);
  return v12;
}

- (id)posterDescriptorsForOperation:(id)a3
{
  id v4;
  os_unfair_lock_s *p_stateLock;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    if ((objc_msgSend(v4, "isCancelled") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "extensionBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore _stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:](self, "_stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = (void *)MEMORY[0x1E0C9AA60];
      if (v8)
        v10 = (void *)v8;
      v6 = v10;

    }
    os_unfair_lock_unlock(p_stateLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier:(id)a3 preReloadDescriptors:(id)a4 postReloadDescriptors:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  __CFString *v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  __CFString *v53;
  void *v54;
  __CFString *v55;
  __CFString *v56;
  NSObject *v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  BOOL v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  PBFPosterExtensionDataStore *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  char v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t m;
  uint64_t v107;
  void *v108;
  __CFString *v109;
  void *v110;
  int v111;
  __CFString *v112;
  BOOL v113;
  NSObject *v114;
  id v115;
  void *v116;
  void *v117;
  char v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t n;
  void *v130;
  void *v131;
  uint64_t v132;
  __int128 v134;
  void *v136;
  char v137;
  NSObject *log;
  uint64_t v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  __CFString *v149;
  void *v150;
  __CFString *v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  id obj;
  void *v160;
  _QWORD v161[4];
  id v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _QWORD v167[4];
  id v168;
  id v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  id v178;
  id v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  const __CFString *v200;
  const __CFString *v201;
  uint8_t v202[128];
  uint8_t buf[4];
  __CFString *v204;
  __int16 v205;
  const __CFString *v206;
  __int16 v207;
  __CFString *v208;
  _BYTE v209[128];
  _BYTE v210[128];
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v153 = (const __CFString *)a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  v195 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v192, v210, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v193;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v193 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i);
        objc_msgSend(v16, "descriptorIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "setObject:forKey:", v16, v17);

        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", v16);
        objc_msgSend(v10, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v192, v210, 16);
    }
    while (v13);
  }
  v136 = v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  obj = v9;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v209, 16);
  v158 = v19;
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v189;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v189 != v22)
          objc_enumerationMutation(obj);
        v24 = *(__CFString **)(*((_QWORD *)&v188 + 1) + 8 * v23);
        -[__CFString descriptorIdentifier](v24, "descriptorIdentifier");
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (!v25)
        {
          PBFLogPosterContents();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v204 = v24;
            v30 = v28;
            v31 = "dropping replacement descriptor that is missing its descriptorIdentifier : %@";
            v32 = 12;
            goto LABEL_22;
          }
LABEL_23:

          goto LABEL_24;
        }
        if (!-[__CFString length](v25, "length"))
        {
          PBFLogPosterContents();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v204 = v24;
            v205 = 2112;
            v206 = v153;
            v207 = 2112;
            v208 = v26;
            v30 = v28;
            v31 = "dropping replacement descriptor %@ for provider %@; its descriptorIdentifier's length is less than 1 : %@";
            v32 = 32;
LABEL_22:
            _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
          }
          goto LABEL_23;
        }
        objc_msgSend(v19, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          PBFLogPosterContents();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "objectForKey:", v26);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v204 = v26;
            v205 = 2112;
            v206 = v29;
            v207 = 2112;
            v208 = v24;
            _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "multiple paths returned for descriptorIdentifier='%@' : dropping previous=%@ in favor of %@", buf, 0x20u);

            v19 = v158;
          }
          goto LABEL_23;
        }
        objc_msgSend(v19, "setObject:forKey:", v24, v26);
LABEL_24:

        ++v23;
      }
      while (v21 != v23);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v209, 16);
      v21 = v33;
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  v35 = v11;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v184, v202, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v185;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v185 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * j);
        objc_msgSend(v40, "descriptorIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v40, v41);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v184, v202, 16);
    }
    while (v37);
  }

  v42 = (__CFString *)v153;
  -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v153);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v157)
  {
    if (a6)
    {
      v76 = (void *)MEMORY[0x1E0CB35C8];
      v200 = CFSTR("extensionBundleIdentifier");
      if (v153)
        v77 = v153;
      else
        v77 = CFSTR("(null extensionBundleIdentifier)");
      v201 = v77;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v78);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v74 = 0;
LABEL_133:
    v75 = 0;
    goto LABEL_135;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(obj, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = 0u;
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  objc_msgSend(v19, "allKeys");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v180, v199, 16);
  if (!v143)
  {

    v137 = 0;
LABEL_80:
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    objc_msgSend(v34, "allKeys");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v174, v198, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v175;
      do
      {
        for (k = 0; k != v81; ++k)
        {
          if (*(_QWORD *)v175 != v82)
            objc_enumerationMutation(v79);
          v84 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * k);
          objc_msgSend(v34, "objectForKeyedSubscript:", v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKey:", v84);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v86)
          {

          }
          else
          {
            objc_msgSend(v160, "objectForKey:", v84);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v87)
              objc_msgSend(v43, "setObject:forKey:", v85, v84);
          }

          v19 = v158;
        }
        v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v174, v198, 16);
      }
      while (v81);
    }

    objc_msgSend(v43, "allValues");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_msgSend(v88, "copy");

    v90 = self;
    v42 = (__CFString *)v153;
    -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v153);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v74)
      goto LABEL_129;
    v91 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v160, "allKeys");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setWithArray:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v93;
    if (v93)
    {
      v95 = v93;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v95 = (id)objc_claimAutoreleasedReturnValue();
    }
    v148 = v95;
    v96 = v137;

    v97 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v43, "allKeys");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setWithArray:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (v99)
    {
      v101 = v99;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v101 = (id)objc_claimAutoreleasedReturnValue();
    }
    v102 = v101;
    v90 = self;

    v146 = v89;
    v152 = v102;
    if ((objc_msgSend(v148, "isEqual:", v102) & 1) == 0)
    {
      v172 = 0u;
      v173 = 0u;
      v170 = 0u;
      v171 = 0u;
      v155 = v148;
      v103 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
      if (v103)
      {
        v104 = v103;
        v105 = *(_QWORD *)v171;
        do
        {
          for (m = 0; m != v104; ++m)
          {
            if (*(_QWORD *)v171 != v105)
              objc_enumerationMutation(v155);
            v107 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * m);
            if ((objc_msgSend(v102, "containsObject:", v107) & 1) == 0)
            {
              objc_msgSend(v160, "objectForKey:", v107);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "serverIdentity");
              v109 = (__CFString *)objc_claimAutoreleasedReturnValue();

              -[__CFString posterUUID](v109, "posterUUID");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v169 = 0;
              v111 = objc_msgSend(v157, "teardownDynamicDescriptorStoreCoordinatorForPosterUUID:error:", v110, &v169);
              v112 = (__CFString *)v169;

              if (v111)
                v113 = v112 == 0;
              else
                v113 = 0;
              if (!v113)
              {
                PBFLogPosterContents();
                v114 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v204 = v109;
                  v205 = 2112;
                  v206 = v112;
                  _os_log_error_impl(&dword_1CB9FA000, v114, OS_LOG_TYPE_ERROR, "failed to remove descriptor from extension store coordinator '%@': %@", buf, 0x16u);
                }

              }
              v96 = 1;
              v102 = v152;
            }
          }
          v104 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
        }
        while (v104);
      }
      v137 = v96;

      v42 = (__CFString *)v153;
      v90 = self;
    }
    v167[0] = MEMORY[0x1E0C809B0];
    v167[1] = 3221225472;
    v167[2] = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke;
    v167[3] = &unk_1E86F35A0;
    v115 = v157;
    v168 = v115;
    objc_msgSend(obj, "bs_mapNoNulls:", v167);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "providerInfoObjectForKey:", CFSTR("kProactiveDynamicPosterDescriptorOrdering"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v116, "isEqualToArray:", v117);

    v156 = v116;
    if ((v118 & 1) != 0)
    {
      if ((v137 & 1) == 0)
      {
        v74 = 0;
        v19 = v158;
        v119 = v116;
LABEL_128:
        v89 = v146;

LABEL_129:
        if ((v137 & 1) != 0)
        {

          -[PBFPosterExtensionDataStore _notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier:](v90, "_notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier:", v42);
          v75 = -[PBFPosterExtensionDataStore _stateLock_issueDescriptorUpdatedEventsForExtension:preUpdate:postUpdate:error:](v90, "_stateLock_issueDescriptorUpdatedEventsForExtension:preUpdate:postUpdate:error:", v42, v136, v74, a6);
          goto LABEL_135;
        }
        -[NSMutableDictionary objectForKeyedSubscript:](v90->_stateLock_descriptorsForExtensionBundleIdentifier, "objectForKeyedSubscript:", v42);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend(v131, "count");

        if (!v132)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v90->_stateLock_descriptorsForExtensionBundleIdentifier, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v42);

        goto LABEL_133;
      }
    }
    else
    {
      objc_msgSend(v115, "providerInfoSetObject:forKey:", v116, CFSTR("kProactiveDynamicPosterDescriptorOrdering"));
      v137 = 1;
    }
    v120 = (void *)-[NSMutableDictionary copy](v90->_stateLock_descriptorsForExtensionBundleIdentifier, "copy");
    v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v120);
    objc_msgSend(v115, "dynamicPosterDescriptorLatestVersionPaths");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "allObjects");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "sortedArrayUsingSelector:", sel_compareDescriptorIdentifiers_);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setObject:forKeyedSubscript:", v124, v42);

    v144 = (void *)objc_msgSend(v121, "copy");
    v74 = (void *)objc_opt_new();
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v150 = v121;
    objc_msgSend(v121, "objectForKeyedSubscript:", v42);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v163, v196, 16);
    if (v126)
    {
      v127 = v126;
      v128 = *(_QWORD *)v164;
      do
      {
        for (n = 0; n != v127; ++n)
        {
          if (*(_QWORD *)v164 != v128)
            objc_enumerationMutation(v125);
          v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * n));
          objc_msgSend(v74, "addObject:", v130);

        }
        v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v163, v196, 16);
      }
      while (v127);
    }

    v161[0] = MEMORY[0x1E0C809B0];
    v161[1] = 3221225472;
    v161[2] = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_2;
    v161[3] = &unk_1E86F35F0;
    v162 = obj;
    objc_msgSend(v74, "sortUsingComparator:", v161);
    v90 = self;
    -[PBFPosterExtensionDataStore _stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:](self, "_stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:", 0, v144, 0);

    v42 = (__CFString *)v153;
    v119 = v156;
    v19 = v158;
    goto LABEL_128;
  }
  v141 = v44;
  v46 = 0;
  v137 = 0;
  v47 = *(_QWORD *)v181;
  *(_QWORD *)&v45 = 138412290;
  v134 = v45;
  v140 = *(_QWORD *)v181;
  do
  {
    v48 = 0;
    do
    {
      v149 = v46;
      if (*(_QWORD *)v181 != v47)
        objc_enumerationMutation(v141);
      v49 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * v48);
      objc_msgSend(v158, "objectForKey:", v49, v134);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "objectForKey:", v49);
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", v49);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString role](v50, "role");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v49;
      v179 = 0;
      v151 = v53;
      objc_msgSend(v157, "dynamicDescriptorStoreCoordinatorForIdentifier:role:createIfNil:error:");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (__CFString *)v179;
      v145 = v54;
      v147 = (void *)v52;
      if (!v55)
      {
        -[__CFString serverIdentity](v50, "serverIdentity");
        v142 = objc_claimAutoreleasedReturnValue();
        if (v142)
        {
          if (v51
            && (-[__CFString identity](v51, "identity"),
                v60 = (void *)objc_claimAutoreleasedReturnValue(),
                v61 = objc_msgSend(v60, "isEqual:", v142),
                v60,
                v61))
          {
            v56 = v51;
            if (v154)
            {
              objc_msgSend(v154, "descriptorIdentifier");
              v62 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKey:", v154, v62);
              v63 = (void *)v62;
              v59 = 0;
              v46 = v149;
              goto LABEL_53;
            }
            PBFLogPosterContents();
            log = objc_claimAutoreleasedReturnValue();
            v47 = v140;
            v46 = v149;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v134;
              v204 = v51;
              _os_log_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_DEFAULT, "skipping non-updated descriptor that was deleted during the update callout : %@", buf, 0xCu);
            }
            v59 = 0;
LABEL_60:
            v63 = log;
          }
          else
          {
            PBFLogPosterContents();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v204 = v50;
              v205 = 2112;
              v206 = v51;
              _os_log_error_impl(&dword_1CB9FA000, v64, OS_LOG_TYPE_ERROR, "returned descriptor isn't new but fails to match a previous descriptor : new=%@ previous=%@", buf, 0x16u);
            }
            v56 = v51;

            objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2214, 0);
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v59 = 8;
            v63 = v149;
LABEL_53:
            v47 = v140;
          }

          v58 = (void *)v142;
          goto LABEL_62;
        }
        -[__CFString contentsURL](v50, "contentsURL");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = 0;
        objc_msgSend(v54, "addNewVersionWithContents:error:", v65, &v178);
        v66 = objc_claimAutoreleasedReturnValue();
        v46 = (__CFString *)v178;

        log = v66;
        if (v46)
        {
          v56 = v51;
          PBFLogPosterContents();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v204 = v151;
            v205 = 2112;
            v206 = v46;
            _os_log_error_impl(&dword_1CB9FA000, v67, OS_LOG_TYPE_ERROR, "bailing update: failed to save updated descriptor '%@' with error: %@", buf, 0x16u);
          }

          v59 = 8;
        }
        else
        {
          v68 = v66;
          v56 = v51;
          v69 = (void *)MEMORY[0x1E0D7F8E8];
          objc_msgSend(v157, "containerURL");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "pathWithProviderURL:identity:", v70, v68);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v71, "descriptorIdentifier");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKey:", v71, v72);

          v59 = 0;
          v137 = 1;
          v46 = v149;
        }
        v47 = v140;
        goto LABEL_60;
      }
      v56 = v51;
      PBFLogPosterContents();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v204 = v151;
        v205 = 2112;
        v206 = v55;
        _os_log_error_impl(&dword_1CB9FA000, v57, OS_LOG_TYPE_ERROR, "bailing update: descriptor '%@' cannot create a descriptorStoreCoordinator for reason: %@", buf, 0x16u);
      }

      v46 = v55;
      v58 = v149;
      v59 = 8;
LABEL_62:

      if (v59)
        goto LABEL_69;
      ++v48;
    }
    while (v143 != v48);
    v73 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v180, v199, 16);
    v143 = v73;
  }
  while (v73);
LABEL_69:

  v19 = v158;
  if (!v46)
    goto LABEL_80;
  if (a6)
    *a6 = objc_retainAutorelease(v46);

  v74 = 0;
  v75 = 0;
  v42 = (__CFString *)v153;
LABEL_135:

  return v75;
}

id __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dynamicDescriptorStoreCoordinatorForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_3;
  v25[3] = &unk_1E86F35C8;
  v26 = v5;
  v9 = v5;
  objc_msgSend(v8, "bs_firstObjectPassingTest:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "indexOfObject:", v10);

  v12 = *(void **)(a1 + 32);
  v20 = v7;
  v21 = 3221225472;
  v22 = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_4;
  v23 = &unk_1E86F35C8;
  v24 = v6;
  v13 = v6;
  objc_msgSend(v12, "bs_firstObjectPassingTest:", &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "indexOfObject:", v14, v20, v21, v22, v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "compare:", v17);

  return v18;
}

uint64_t __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

uint64_t __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (BOOL)_stateLock_issueDescriptorUpdatedEventsForExtension:(id)a3 preUpdate:(id)a4 postUpdate:(id)a5 error:(id *)a6
{
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  NSObject *v30;
  _BOOL4 v31;
  BOOL v32;
  PBFPosterExtensionDataStore *v34;
  id *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id obj;
  uint64_t v40;
  id v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  NSObject *v50;
  __int16 v51;
  NSObject *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((BSEqualArrays() & 1) == 0 && -[NSObject length](v10, "length"))
  {
    v35 = a6;
    v36 = (void *)objc_opt_new();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = self;
    -[NSDictionary keyEnumerator](self->_roleToRoleCoordinator, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v40)
    {
      v13 = *(_QWORD *)v46;
      v14 = MEMORY[0x1E0C809B0];
      v37 = *(_QWORD *)v46;
      v38 = v12;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v46 != v13)
            objc_enumerationMutation(obj);
          v16 = *(NSObject **)(*((_QWORD *)&v45 + 1) + 8 * v15);
          v44[0] = v14;
          v44[1] = 3221225472;
          v44[2] = __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke;
          v44[3] = &unk_1E86F3618;
          v44[4] = v16;
          objc_msgSend(v11, "bs_mapNoNulls:", v44);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = v14;
          v43[1] = 3221225472;
          v43[2] = __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke_2;
          v43[3] = &unk_1E86F3618;
          v43[4] = v16;
          objc_msgSend(v12, "bs_mapNoNulls:", v43);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "count") || objc_msgSend(v17, "count")) && (BSEqualArrays() & 1) == 0)
          {
            v20 = v11;
            v21 = v10;
            +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:role:from:to:](PBFPosterDataStoreEventBuilder, "descriptorsUpdatedForProvider:role:from:to:", v10, v16, v17, v18);
            v19 = objc_claimAutoreleasedReturnValue();
            v42 = 0;
            -[NSObject buildWithError:](v19, "buildWithError:", &v42);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v42;
            PBFLogDataStore();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v23 || !v22)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v50 = v16;
                v51 = 2114;
                v52 = v21;
                v53 = 2114;
                v54 = v23;
                _os_log_error_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_ERROR, "Error building PBFPosterDataStoreEvent for role %{public}@ extension %{public}@ reloadDescriptors: %{public}@", buf, 0x20u);
              }

            }
            else
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v50 = v16;
                v51 = 2114;
                v52 = v21;
                _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "Built PBFPosterDataStoreEvent for role %{public}@ extension %{public}@ reloadDescriptors", buf, 0x16u);
              }

              objc_msgSend(v36, "addObject:", v22);
            }

            v10 = v21;
            v11 = v20;
            v13 = v37;
            v12 = v38;
            v14 = MEMORY[0x1E0C809B0];
          }
          else
          {
            PBFLogDataStore();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v50 = v16;
              v51 = 2114;
              v52 = v10;
              _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "Skipping building PBFPosterDataStoreEvent for role %{public}@ extension %{public}@ reloadDescriptors: no posters for role", buf, 0x16u);
            }
          }

          ++v15;
        }
        while (v40 != v15);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v40);
    }

    v26 = objc_msgSend(v36, "count");
    PBFLogDataStore();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543362;
        v50 = v10;
        _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "Issuing PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors", buf, 0xCu);
      }

      v41 = 0;
      v29 = -[PBFPosterExtensionDataStore _stateLock_processEvents:context:error:](v34, "_stateLock_processEvents:context:error:", v36, 0, &v41);
      v27 = v41;
      PBFLogDataStore();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v29 && !v27)
      {
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          v50 = v10;
          _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "Successfully issued PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors", buf, 0xCu);
        }

        v32 = 1;
        goto LABEL_40;
      }
      if (v31)
      {
        *(_DWORD *)buf = 138543618;
        v50 = v10;
        v51 = 2114;
        v52 = v27;
        _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "Failed to process PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors: %{public}@", buf, 0x16u);
      }

      if (v35)
      {
        v27 = objc_retainAutorelease(v27);
        v32 = 0;
        *v35 = v27;
LABEL_40:

        goto LABEL_41;
      }
    }
    else if (v28)
    {
      *(_DWORD *)buf = 138543362;
      v50 = v10;
      _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "Bailing PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors; no events generated",
        buf,
        0xCu);
    }
    v32 = 0;
    goto LABEL_40;
  }
  v32 = 0;
LABEL_41:

  return v32;
}

id __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

id __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:(id)a3 reason:(id)a4 powerLogReason:(int64_t)a5 postEnqueueGalleryUpdateOptions:(unint64_t)a6 sessionInfo:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, PFPosterExtensionProvider *);
  PFPosterExtensionProvider *v19;
  PBFPosterExtensionReloadDescriptorsOperation *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  PFPosterExtensionProvider *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  PFPosterExtensionProvider *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  PFPosterExtensionProvider *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  PFPosterExtensionProvider *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  PFPosterExtensionProvider *v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  void (**v79)(id, _QWORD, PFPosterExtensionProvider *);
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD *v87;
  id v88[3];
  _QWORD aBlock[4];
  PFPosterExtensionProvider *v90;
  id v91;
  id v92;
  void (**v93)(id, _QWORD, PFPosterExtensionProvider *);
  _BYTE *v94;
  _QWORD *v95;
  _QWORD v96[5];
  id v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id location;
  id v104;
  id v105;
  uint8_t v106[4];
  id v107;
  __int16 v108;
  void *v109;
  _BYTE buf[24];
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  const __CFString *v114;
  void *v115;
  _QWORD v116[2];
  _QWORD v117[2];
  const __CFString *v118;
  id v119;
  const __CFString *v120;
  _QWORD v121[4];

  v121[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = (void (**)(id, _QWORD, PFPosterExtensionProvider *))a8;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v21 = v15;
    NSClassFromString(CFSTR("NSString"));
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:].cold.1();
      objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA28F5CLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:].cold.4();
      objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA28FC0);
    }

    v22 = v21;
    v76 = v22;
    if (!-[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot](self, "_stateLock_hasBeenUnlockedSinceBoot"))
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v120 = CFSTR("providerIdentifier");
      v121[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, &v120, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pbf_dataStoreErrorWithCode:userInfo:", -2205, v28);
      v75 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();

      v18[2](v18, 0, v75);
      v20 = 0;
LABEL_59:

      goto LABEL_60;
    }
    v75 = self->_extensionProvider;
    -[PFPosterExtensionProvider extensionForIdentifier](v75, "extensionForIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v22);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      objc_msgSend(v74, "posterExtensionInfoPlist");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "pbf_supportsDynamicDescriptors");

      if ((v25 & 1) != 0)
      {
        NSStringFromSelector(a2);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = 0;
        -[PFPosterExtensionProvider acquireInstanceForExtensionWithIdentifier:reason:error:](v75, "acquireInstanceForExtensionWithIdentifier:reason:error:", v76, v73, &v105);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (PFPosterExtensionProvider *)v105;
        if (v26)
        {
          if (v18)
            v18[2](v18, 0, v26);
          v20 = 0;
        }
        else
        {
          v104 = 0;
          objc_msgSend(v72, "pr_assetUpdaterWithError:", &v104);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (PFPosterExtensionProvider *)v104;
          if (v70 || !v71)
          {
            PBFLogReloadDescriptors();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:].cold.3(a2, (uint64_t)v70, v40);

            if (v18)
              v18[2](v18, 0, v70);
            -[PFPosterExtensionProvider relinquishExtensionInstanceWithIdentifier:reason:](v75, "relinquishExtensionInstanceWithIdentifier:reason:", v76, v73);
            v20 = 0;
          }
          else
          {
            objc_msgSend(v72, "pr_reloadDescriptorOperations");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            PBFLogReloadDescriptors();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v76;
              _os_log_impl(&dword_1CB9FA000, v34, OS_LOG_TYPE_DEFAULT, "Preparing reloadDescriptors operation for bundle identifier %{public}@", buf, 0xCu);
            }

            PBFLogReloadDescriptors();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v68;
              _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "Existing operations: %{public}@", buf, 0xCu);
            }

            -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v76);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69)
            {
              objc_initWeak(&location, self);
              if (v17 && !objc_msgSend(v17, "isEmpty"))
                goto LABEL_46;
              v100[0] = MEMORY[0x1E0C809B0];
              v100[1] = 3221225472;
              v100[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke;
              v100[3] = &unk_1E86F3640;
              v36 = v76;
              v101 = v36;
              v102 = 0;
              objc_msgSend(v68, "bs_firstObjectPassingTest:", v100);
              v20 = (PBFPosterExtensionReloadDescriptorsOperation *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                PBFLogReloadDescriptors();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v17, "identifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v36;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v38;
                  _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_DEFAULT, "Found a matching operation for %{public}@ / %{public}@; adding completion",
                    buf,
                    0x16u);

                }
                v77[0] = MEMORY[0x1E0C809B0];
                v77[1] = 3221225472;
                v77[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_620;
                v77[3] = &unk_1E86F36E0;
                v79 = v18;
                objc_copyWeak(&v80, &location);
                v78 = v36;
                -[PBFPosterExtensionReloadDescriptorsOperation addCompletionObserver:](v20, "addCompletionObserver:", v77);

                objc_destroyWeak(&v80);
                v39 = v79;
              }
              else
              {
LABEL_46:
                PBFLogReloadDescriptors();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v17, "identifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v76;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v46;
                  *(_WORD *)&buf[22] = 2114;
                  v111 = (uint64_t (*)(uint64_t, uint64_t))v68;
                  _os_log_impl(&dword_1CB9FA000, v45, OS_LOG_TYPE_DEFAULT, "Found no matching operation for %{public}@ / %{public}@ / %{public}@", buf, 0x20u);

                }
                objc_msgSend(v72, "extension");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "posterExtensionBundleIdentifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CFSTR("PBFPosterExtensionReloadDescriptorsOperation reloadDescriptors for "), "stringByAppendingString:", v48);
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3032000000;
                v111 = __Block_byref_object_copy_;
                v112 = __Block_byref_object_dispose_;
                runtimeAssertionProvider = self->_runtimeAssertionProvider;
                objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBFRuntimeAssertionProviding acquirePosterUpdateRuntimeAssertionForReason:target:](runtimeAssertionProvider, "acquirePosterUpdateRuntimeAssertionForReason:target:", v66, v50);
                v113 = (id)objc_claimAutoreleasedReturnValue();

                v98[0] = 0;
                v98[1] = v98;
                v98[2] = 0x3032000000;
                v98[3] = __Block_byref_object_copy_;
                v98[4] = __Block_byref_object_dispose_;
                objc_msgSend(v69, "extensionIdentifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBFPosterExtensionDataStore acquireSnapshotterDisabledAssertionForProvider:withReason:](self, "acquireSnapshotterDisabledAssertionForProvider:withReason:", v51, v66);
                v99 = (id)objc_claimAutoreleasedReturnValue();

                -[PBFPosterExtensionDataStore _stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:](self, "_stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:", v76);
                v52 = objc_claimAutoreleasedReturnValue();
                v53 = (void *)v52;
                v54 = (void *)MEMORY[0x1E0C9AA60];
                if (v52)
                  v54 = (void *)v52;
                v65 = v54;

                v20 = -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:]([PBFPosterExtensionReloadDescriptorsOperation alloc], "initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:", v71, v76, v17, v65, self->_runtimeAssertionProvider, a5, 90.0);
                v96[0] = 0;
                v96[1] = v96;
                v96[2] = 0x3042000000;
                v96[3] = __Block_byref_object_copy__610;
                v96[4] = __Block_byref_object_dispose__611;
                objc_initWeak(&v97, v20);
                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                aBlock[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_612;
                aBlock[3] = &unk_1E86F3668;
                v93 = v18;
                v94 = buf;
                v95 = v98;
                v90 = v75;
                v55 = v76;
                v91 = v55;
                v92 = v73;
                v56 = _Block_copy(aBlock);
                v81[0] = MEMORY[0x1E0C809B0];
                v81[1] = 3221225472;
                v81[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2;
                v81[3] = &unk_1E86F36B8;
                objc_copyWeak(v88, &location);
                v64 = v56;
                v86 = v64;
                v82 = v69;
                v67 = v66;
                v83 = v67;
                v57 = v55;
                v84 = v57;
                v87 = v96;
                v58 = v72;
                v85 = v58;
                v88[1] = (id)a6;
                v88[2] = (id)a5;
                -[PBFPosterExtensionReloadDescriptorsOperation addCompletionObserver:](v20, "addCompletionObserver:", v81);
                PBFLogReloadDescriptors();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v17, "identifier");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v106 = 138543618;
                  v107 = v57;
                  v108 = 2114;
                  v109 = v60;
                  _os_log_impl(&dword_1CB9FA000, v59, OS_LOG_TYPE_DEFAULT, "Queuing operation for %{public}@ / %{public}@", v106, 0x16u);

                }
                objc_msgSend(v58, "pr_addReloadDescriptorOperation:", v20);

                objc_destroyWeak(v88);
                _Block_object_dispose(v96, 8);
                objc_destroyWeak(&v97);

                _Block_object_dispose(v98, 8);
                _Block_object_dispose(buf, 8);

                v39 = v67;
              }

              objc_destroyWeak(&location);
            }
            else
            {
              v41 = (void *)MEMORY[0x1E0CB35C8];
              v114 = CFSTR("providerIdentifier");
              v115 = v76;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v42);
              v43 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();

              if (v18)
                v18[2](v18, 0, v43);
              PBFLogReloadDescriptors();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:].cold.2(a2, (uint64_t)v43, v44);

              -[PFPosterExtensionProvider relinquishExtensionInstanceWithIdentifier:reason:](v75, "relinquishExtensionInstanceWithIdentifier:reason:", v76, v73);
              v20 = 0;
            }

          }
        }

        goto LABEL_57;
      }
      PBFLogReloadDescriptors();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v76;
        _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "Extension %{public}@ doesn't support dynamic descriptors.", buf, 0xCu);
      }

      if (!v18)
      {
        v20 = 0;
LABEL_58:

        goto LABEL_59;
      }
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v116[0] = *MEMORY[0x1E0CB2D68];
      v116[1] = CFSTR("providerIdentifier");
      v117[0] = CFSTR("does not support dynamic descriptors");
      v117[1] = v76;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
      v26 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v26);
      v33 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v33);

    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v118 = CFSTR("providerIdentifier");
      v119 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v30);
      v26 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();

      if (v18)
        v18[2](v18, 0, v26);
    }
    v20 = 0;
LABEL_57:

    goto LABEL_58;
  }
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v19 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, 0, v19);

  }
  v20 = 0;
LABEL_60:

  return v20;
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "extensionBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
      v5 = objc_msgSend(*(id *)(a1 + 40), "hasUniqueSessionInfo") ^ 1;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_612(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17A3580]();
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v12, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "invalidate");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "invalidate");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "relinquishExtensionInstanceWithIdentifier:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v6);

}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[5];
  __int128 v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];

  v51[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 80));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v11 = *(_QWORD *)(a1 + 64);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D68];
    v51[0] = CFSTR("Data store invalidated before operation could finish.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pbf_generalErrorWithCode:userInfo:", 3, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v14);

    goto LABEL_28;
  }
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", PBFGeneralErrorDomain))
      v10 = objc_msgSend(v6, "code") == 4;
    else
      v10 = 0;

    objc_msgSend(v6, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", PBFPosterExtensionDataStoreErrorDomain))
      v26 = objc_msgSend(v6, "code") == -2204;
    else
      v26 = 0;

    PBFLogReloadDescriptors();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v10 || v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v47 = v5;
        v48 = 2114;
        v49 = v6;
        _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "Cancelled %{public}@: %{public}@", buf, 0x16u);
      }

      if (!v5)
        goto LABEL_27;
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "updateLastRefreshDescriptorDateWithReason:", *(_QWORD *)(a1 + 40));
      if (!v5)
        goto LABEL_27;
    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_618;
    v40[3] = &unk_1E86F2F98;
    v42 = *(id *)(a1 + 64);
    v41 = v6;
    objc_msgSend(v5, "invalidateAssertionsWithCompletion:", v40);

    goto LABEL_28;
  }
  os_unfair_lock_lock(WeakRetained + 47);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(v16, "preRefreshPosterDescriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postRefreshPosterDescriptors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v19 = -[os_unfair_lock_s _stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier:preReloadDescriptors:postReloadDescriptors:error:](v8, "_stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier:preReloadDescriptors:postReloadDescriptors:error:", v15, v17, v18, &v45);
  v20 = v45;

  os_unfair_lock_unlock(v8 + 47);
  objc_msgSend(*(id *)(a1 + 32), "updateLastRefreshDescriptorDateWithReason:", *(_QWORD *)(a1 + 40));
  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "extension");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "persistentIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "providerInfoSetObject:forKey:", v23, CFSTR("PersistentIdentifier"));

  if (v20)
  {
    PBFLogReloadDescriptors();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_1();
  }
  else
  {
    if (!v19 || (objc_msgSend(*(id *)&v8[56]._os_unfair_lock_opaque, "getFlag") & 1) != 0)
      goto LABEL_25;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ finished refresh and found new descriptors"), *(_QWORD *)(a1 + 48));
    v24 = objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_617;
    v43[3] = &unk_1E86F3690;
    v43[4] = v8;
    v44 = *(_OWORD *)(a1 + 88);
    -[os_unfair_lock_s pushPosterDescriptorsToProactiveForReason:completion:](v8, "pushPosterDescriptorsToProactiveForReason:completion:", v24, v43);
  }

LABEL_25:
  if (!v5)
  {
LABEL_27:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_28;
  }
  v29 = *(_QWORD *)(a1 + 48);
  v39 = 0;
  -[os_unfair_lock_s posterDescriptorsForExtensionBundleIdentifier:error:](v8, "posterDescriptorsForExtensionBundleIdentifier:error:", v29, &v39);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v39;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_619;
  v35[3] = &unk_1E86F2E08;
  v32 = *(id *)(a1 + 64);
  v37 = v31;
  v38 = v32;
  v36 = v30;
  v33 = v31;
  v34 = v30;
  objc_msgSend(v5, "invalidateAssertionsWithCompletion:", v35);

LABEL_28:
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_617(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), 0);
  return result;
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_618(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_619(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_620(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = *(_QWORD *)(a1 + 32);
    v13 = 0;
    objc_msgSend(WeakRetained, "posterDescriptorsForExtensionBundleIdentifier:error:", v9, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;

    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v10, v11);

  }
}

- (BOOL)_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:(id)a3 waitForPushToProactive:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  dispatch_time_t v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  _BYTE *v41;
  BOOL v42;
  id obj;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t v54[4];
  id v55;
  _BYTE buf[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  _QWORD v61[4];

  v6 = a4;
  v61[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    PBFLogDataStore();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@ waitForPushToProactive:%{BOOL}u", buf, 0x12u);
    }

    v11 = (void *)objc_opt_new();
    v38 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "supportedRoles");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "staticDescriptorStoreCoordinatorsWithError:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "count"))
      {
        objc_msgSend(v13, "posterStaticDescriptorLatestVersionPaths");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke;
        v49[3] = &unk_1E86F3438;
        v50 = v14;
        v51 = v8;
        v52 = v38;
        v53 = v11;
        v15 = v14;
        objc_msgSend(v37, "enumerateObjectsUsingBlock:", v49);

      }
      objc_msgSend(v13, "dynamicDescriptorStoreCoordinatorsWithError:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_3;
        v44[3] = &unk_1E86F3438;
        v45 = v13;
        v46 = v8;
        v47 = v38;
        v48 = v11;
        objc_msgSend(v37, "enumerateObjectsUsingBlock:", v44);

      }
      if (objc_msgSend(v11, "count"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v57 = __Block_byref_object_copy_;
        v58 = __Block_byref_object_dispose_;
        v59 = 0;
        obj = 0;
        -[PBFPosterExtensionDataStore _stateLock_processEvents:roles:context:error:](self, "_stateLock_processEvents:roles:context:error:", v11, v38, 0, &obj);
        objc_storeStrong(&v59, obj);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          PBFLogDataStore();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[PBFPosterExtensionDataStore _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:].cold.2();
        }
        else
        {
          objc_msgSend(v13, "teardownAllStaticDescriptorStoreCoordinators");
          objc_msgSend(v13, "teardownAllDynamicDescriptors");
          objc_msgSend(v13, "removeLastRefreshDescriptorDate");
          objc_msgSend(v13, "deleteProviderInfo");
          v20 = (void *)-[NSMutableDictionary mutableCopy](self->_stateLock_descriptorsForExtensionBundleIdentifier, "mutableCopy");
          v21 = v20;
          if (v20)
            v22 = v20;
          else
            v22 = objc_opt_new();
          v17 = v22;

          -[NSObject removeObjectForKey:](v17, "removeObjectForKey:", v8);
          v23 = (void *)-[NSMutableDictionary mutableCopy](self->_stateLock_staticDescriptorsForExtensionBundleIdentifier, "mutableCopy");
          v24 = v23;
          if (v23)
            v25 = v23;
          else
            v25 = (id)objc_opt_new();
          v26 = v25;

          objc_msgSend(v26, "removeObjectForKey:", v8);
          PBFLogDataStore();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v54 = 138543362;
            v55 = v8;
            _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@; did successfully remove descriptors",
              v54,
              0xCu);
          }

          -[PBFPosterExtensionDataStore _stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:](self, "_stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:", 0, v17, v26);
        }

        v28 = dispatch_group_create();
        v29 = v28;
        if (v6)
          dispatch_group_enter(v28);
        objc_msgSend(CFSTR("deleteDescriptors ran for "), "stringByAppendingString:", v8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_625;
        v39[3] = &unk_1E86F3730;
        v42 = v6;
        v41 = buf;
        v31 = v29;
        v40 = v31;
        -[PBFPosterExtensionDataStore _stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:](self, "_stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:", v30, 1, v39);
        if (v6)
        {
          v32 = dispatch_time(0, 120000000000);
          dispatch_group_wait(v31, v32);
        }
        v33 = *(_QWORD *)&buf[8];
        if (a5)
        {
          v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v34)
          {
            *a5 = objc_retainAutorelease(v34);
            v33 = *(_QWORD *)&buf[8];
          }
        }
        v9 = *(_QWORD *)(v33 + 40) == 0;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      PBFLogDataStore();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:].cold.1();

      if (!a5)
      {
        v9 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v60 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No extension store coordinator tracked for %@"), v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 1, v16);
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_40;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_41:

  return v9;
}

void __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compareDescriptorIdentifiers_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_2;
  v10[3] = &unk_1E86F3708;
  v9 = v3;
  v11 = v9;
  objc_msgSend(v5, "bs_mapNoNulls:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:role:from:to:](PBFPosterDataStoreEventBuilder, "staticDescriptorsUpdatedForProvider:role:from:to:", *(_QWORD *)(a1 + 40), v9, v6, MEMORY[0x1E0C9AA60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildWithError:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
      objc_msgSend(*(id *)(a1 + 56), "bs_safeAddObject:", v8);
    }

  }
}

id __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", v3);
  else
    v5 = 0;

  return v5;
}

void __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dynamicPosterDescriptorLatestVersionPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compareDescriptorIdentifiers_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_4;
  v11[3] = &unk_1E86F3708;
  v10 = v3;
  v12 = v10;
  objc_msgSend(v6, "bs_mapNoNulls:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:role:from:to:](PBFPosterDataStoreEventBuilder, "descriptorsUpdatedForProvider:role:from:to:", *(_QWORD *)(a1 + 40), v10, v7, MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildWithError:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
    }

  }
}

id __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", v3);
  else
    v5 = 0;

  return v5;
}

void __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_625(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (*(_BYTE *)(a1 + 48))
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    v5 = v6;
  }

}

- (void)_stateLock_pushPosterDescriptorsToProactiveForReason:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  PBFPosterExtensionDataStore *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void (**v56)(id, _QWORD, void *);
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id obj;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  PBFPosterExtensionDataStore *v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[5];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[5];
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  uint8_t v87[128];
  uint8_t buf[4];
  id v89;
  uint64_t v90;
  const __CFString *v91;
  uint64_t v92;
  const __CFString *v93;
  uint64_t v94;
  _QWORD v95[3];

  v6 = a4;
  v95[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (!v6)
    {
      if (-[BSAtomicFlag getFlag](self->_isPrewarmingFlag, "getFlag"))
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v94 = *MEMORY[0x1E0CB2D68];
        v95[0] = CFSTR("Prewarm is ongoing and force was not specified. At end of prewarm, a push to proactive will occur.");
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = (const __CFString **)v95;
        v14 = &v94;
      }
      else if (self->_stateLock_initialRoleCoordinatorSetupPerformed)
      {
        if (!self->_stateLock_updatingExtensions)
          goto LABEL_15;
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v90 = *MEMORY[0x1E0CB2D68];
        v91 = CFSTR("Extensions are currently being updated; will be called after extensions finish updating.");
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v91;
        v14 = &v90;
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v92 = *MEMORY[0x1E0CB2D68];
        v93 = CFSTR("initial role coordinator setup has not been performed.");
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v93;
        v14 = &v92;
      }
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 7, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v9)
          v9[2](v9, 0, v16);

        goto LABEL_36;
      }
    }
LABEL_15:
    v55 = v6;
    v56 = v9;
    PBFLogGallery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v89 = v8;
      _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "Data Store begin _pushPosterDescriptorsToProactiveForReason:'%{public}@'; begin",
        buf,
        0xCu);
    }
    v57 = v8;

    v58 = (void *)objc_opt_new();
    v18 = (void *)objc_opt_new();
    v19 = MEMORY[0x1E0C809B0];
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke;
    v85[3] = &unk_1E86F3758;
    v20 = v18;
    v86 = v20;
    -[PBFPosterExtensionDataStore _stateLock_enumerateExtensionStoreCoordinators:](self, "_stateLock_enumerateExtensionStoreCoordinators:", v85);
    -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v54 = v20;
    objc_msgSend(v20, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortedArrayUsingSelector:", sel_compare_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v23;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v24)
    {
      v25 = v24;
      v67 = self;
      v68 = *(_QWORD *)v82;
      v59 = v21;
      do
      {
        v26 = 0;
        v60 = v25;
        do
        {
          if (*(_QWORD *)v82 != v68)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v26);
          objc_msgSend(v21, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "posterExtensionInfoPlist");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "pbf_supportsGallery");

          if ((v30 & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
                v31 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v31, "stringArrayForKey:", CFSTR("ShowSamplePoster")),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                v33 = objc_msgSend(v32, "containsObject:", v27),
                v32,
                v31,
                v33))
          {
            objc_msgSend(v28, "supportedRoles");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "bs_containsObjectPassingTest:", &__block_literal_global_634);

            if (v35)
            {
              objc_msgSend(v28, "posterExtensionContainerBundleIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:](self, "_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:", v27);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "providerInfoObjectForKey:", CFSTR("kProactiveDynamicPosterDescriptorOrdering"));
              v38 = self;
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "providerInfoObjectForKey:", CFSTR("kProactiveStaticPosterDescriptorOrdering"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v19;
              -[NSMutableDictionary objectForKeyedSubscript:](v38->_stateLock_descriptorsForExtensionBundleIdentifier, "objectForKeyedSubscript:", v27);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v78[0] = v40;
              v78[1] = 3221225472;
              v78[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3;
              v78[3] = &unk_1E86F37A0;
              v78[4] = v27;
              v43 = v36;
              v79 = v43;
              v44 = v42;
              v80 = v44;
              v63 = v41;
              objc_msgSend(v41, "bs_mapNoNulls:", v78);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v39;
              v66 = v37;
              v62 = v44;
              if (v39)
              {
                v75[0] = v40;
                v75[1] = 3221225472;
                v75[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_638;
                v75[3] = &unk_1E86F37C8;
                v76 = v39;
                v77 = v44;
                objc_msgSend(v45, "sortedArrayUsingComparator:", v75);
                v46 = objc_claimAutoreleasedReturnValue();

                v45 = (void *)v46;
              }
              -[NSMutableDictionary objectForKeyedSubscript:](v67->_stateLock_staticDescriptorsForExtensionBundleIdentifier, "objectForKeyedSubscript:", v27);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v72[0] = v40;
              v72[1] = 3221225472;
              v72[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_2_640;
              v72[3] = &unk_1E86F37A0;
              v72[4] = v27;
              v49 = v43;
              v73 = v49;
              v50 = v48;
              v74 = v50;
              objc_msgSend(v47, "bs_mapNoNulls:", v72);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              if (v64)
              {
                v69[0] = v40;
                v69[1] = 3221225472;
                v69[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3_643;
                v69[3] = &unk_1E86F37C8;
                v70 = v64;
                v71 = v50;
                objc_msgSend(v51, "sortedArrayUsingComparator:", v69);
                v52 = objc_claimAutoreleasedReturnValue();

                v51 = (void *)v52;
              }
              v53 = (void *)objc_opt_new();
              objc_msgSend(v53, "addObjectsFromArray:", v51);
              objc_msgSend(v53, "addObjectsFromArray:", v45);
              if (objc_msgSend(v53, "count"))
                objc_msgSend(v58, "setObject:forKey:", v53, v27);

              self = v67;
              v19 = MEMORY[0x1E0C809B0];
              v21 = v59;
              v25 = v60;
            }
          }

          ++v26;
        }
        while (v25 != v26);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      }
      while (v25);
    }

    v8 = v57;
    v10 = v58;
    v9 = v56;
    -[PBFGalleryController pushUpdatedPosterDescriptors:reason:force:completion:](self->_galleryController, "pushUpdatedPosterDescriptors:reason:force:completion:", v58, v57, v55, v56);

    goto LABEL_35;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v10);
LABEL_35:

  }
LABEL_36:

}

void __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "extensionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D7FC90], "proactiveGallerySupportedForRole:", a2);
}

id __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FC90], "proactiveGallerySupportedForRole:", v4))
  {
    objc_msgSend(MEMORY[0x1E0D7FB50], "loadAmbientConfigurationForPath:error:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "galleryDisplayBehavior") == 1)
    {
      PBFLogGallery();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v3;
        _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "Skipping descriptor when pushing to proactive, gallery display behavior is hidden: %@", (uint8_t *)&v17, 0xCu);
      }

      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "descriptorIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("DYNAMIC"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D7FB50], "loadProactiveGalleryOptions:error:", v3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "posterBoardRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F688]), "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", v9, a1[4], a1[5], v11);
      v12 = (void *)a1[6];
      objc_msgSend(v3, "serverIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "posterUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v15, v7);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_638(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "indexOfObject:", v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  return v15;
}

id __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_2_640(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FC90], "proactiveGallerySupportedForRole:", v4))
  {
    objc_msgSend(v3, "descriptorIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("STATIC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7FB50], "loadProactiveGalleryOptions:error:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterBoardRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F688]), "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", v6, a1[4], a1[5], v8);
    v10 = (void *)a1[6];
    objc_msgSend(v3, "serverIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v13, v9);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3_643(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "indexOfObject:", v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  return v15;
}

- (void)_stateLock_updateGalleryWithSuggestedLayout:(id)a3 descriptorsByExtensionBundleIdentifier:(id)a4 staticDescriptorsByExtensionBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v16;
  void *v17;
  char v18;
  PRSPosterGalleryLayout *v19;
  PRSPosterGalleryLayout *stateLock_suggestedLayout;
  NSObject *v21;
  PRSPosterGalleryLayout *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *stateLock_descriptorsForExtensionBundleIdentifier;
  NSObject *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  uint64_t v28;
  id v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *stateLock_staticDescriptorsForExtensionBundleIdentifier;
  NSObject *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *v34;
  id v35;
  void *v36;
  _BOOL4 v37;
  _BOOL4 v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  PBFGalleryConfiguration *v43;
  PBFGalleryConfiguration *stateLock_configuration;
  PBFGalleryConfiguration *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  id v50;
  unint64_t v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
    goto LABEL_39;
  PBFLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  PBFLogPosterContents();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v51 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "updateGallery", ", buf, 2u);
  }

  runtimeAssertionProvider = self->_runtimeAssertionProvider;
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](runtimeAssertionProvider, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", CFSTR("updateGallery"), v16, &__block_literal_global_646);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_new();
  if (!v8 || self->_stateLock_suggestedLayout && (objc_msgSend(v8, "isEqual:") & 1) != 0)
  {
    v18 = 0;
    if (!v9)
      goto LABEL_18;
    goto LABEL_13;
  }
  v19 = (PRSPosterGalleryLayout *)objc_msgSend(v8, "copy");
  stateLock_suggestedLayout = self->_stateLock_suggestedLayout;
  self->_stateLock_suggestedLayout = v19;

  PBFLogPosterContents();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = self->_stateLock_suggestedLayout;
    *(_DWORD *)buf = 138412290;
    v58 = v22;
    _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "gallery updated with suggestedLayout=%@", buf, 0xCu);
  }

  v18 = 1;
  if (v9)
  {
LABEL_13:
    if (!-[NSMutableDictionary count](self->_stateLock_descriptorsForExtensionBundleIdentifier, "count")
      || (objc_msgSend(v9, "isEqual:", self->_stateLock_descriptorsForExtensionBundleIdentifier) & 1) == 0)
    {
      v23 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");
      stateLock_descriptorsForExtensionBundleIdentifier = self->_stateLock_descriptorsForExtensionBundleIdentifier;
      self->_stateLock_descriptorsForExtensionBundleIdentifier = v23;

      PBFLogPosterContents();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_stateLock_descriptorsForExtensionBundleIdentifier;
        *(_DWORD *)buf = 138412290;
        v58 = v26;
        _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "gallery updated with dynamic descriptors=%@", buf, 0xCu);
      }

      v18 = 1;
    }
  }
LABEL_18:
  v27 = self->_stateLock_descriptorsForExtensionBundleIdentifier;
  v28 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_647;
  v55[3] = &unk_1E86F3810;
  v29 = v17;
  v56 = v29;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", v55);
  if (v10
    && (!-[NSMutableDictionary count](self->_stateLock_staticDescriptorsForExtensionBundleIdentifier, "count")
     || (objc_msgSend(v10, "isEqual:", self->_stateLock_staticDescriptorsForExtensionBundleIdentifier) & 1) == 0))
  {
    v30 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");
    stateLock_staticDescriptorsForExtensionBundleIdentifier = self->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
    self->_stateLock_staticDescriptorsForExtensionBundleIdentifier = v30;

    PBFLogPosterContents();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = self->_stateLock_descriptorsForExtensionBundleIdentifier;
      *(_DWORD *)buf = 138412290;
      v58 = v33;
      _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_DEFAULT, "gallery updated with static descriptors=%@", buf, 0xCu);
    }

    v18 = 1;
  }
  v34 = self->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
  v53[0] = v28;
  v53[1] = 3221225472;
  v53[2] = __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_649;
  v53[3] = &unk_1E86F3810;
  v35 = v29;
  v54 = v35;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v34, "enumerateKeysAndObjectsUsingBlock:", v53);
  -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v36, "count")
    || !-[NSMutableDictionary count](self->_stateLock_descriptorsForExtensionBundleIdentifier, "count")
    || !self->_stateLock_staticDescriptorsForExtensionBundleIdentifier)
  {
    v37 = 1;
    if ((v18 & 1) == 0)
      goto LABEL_28;
LABEL_30:
    v38 = 0;
    goto LABEL_31;
  }
  v37 = self->_stateLock_suggestedLayout == 0;
  if ((v18 & 1) != 0)
    goto LABEL_30;
LABEL_28:
  v38 = self->_stateLock_configuration != 0;
LABEL_31:
  if (!v37 && !v38)
  {
    v49 = v12;
    v50 = v8;
    PBFLogPosterContents();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v39, OS_LOG_TYPE_DEFAULT, "gallery update received; pushing out new gallery object",
        buf,
        2u);
    }

    v40 = (void *)-[PRSPosterGalleryLayout copy](self->_stateLock_suggestedLayout, "copy");
    v41 = (void *)-[NSMutableDictionary copy](self->_stateLock_descriptorsForExtensionBundleIdentifier, "copy");
    v42 = (void *)-[NSMutableDictionary copy](self->_stateLock_staticDescriptorsForExtensionBundleIdentifier, "copy");
    v43 = -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:]([PBFGalleryConfiguration alloc], "initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:", v40, v41, v42, v36);
    stateLock_configuration = self->_stateLock_configuration;
    self->_stateLock_configuration = v43;
    v45 = v43;

    -[PBFGalleryConfiguration setSnapshotProvider:](v45, "setSnapshotProvider:", self->_snapshotManager);
    -[PBFGalleryConfiguration setComplicationSnapshotProvider:](v45, "setComplicationSnapshotProvider:", self->_complicationSnapshotService);
    -[PBFPosterExtensionDataStore extensionProvider](self, "extensionProvider");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFGalleryConfiguration setExtensionProvider:](v45, "setExtensionProvider:", v46);

    -[PBFPosterExtensionDataStore _notifyObserversDidUpdateGalleryConfiguration:](self, "_notifyObserversDidUpdateGalleryConfiguration:", v45);
    v12 = v49;
    v8 = v50;
  }
  objc_msgSend(v52, "invalidate", v49, v50);
  PBFLogPosterContents();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v48, OS_SIGNPOST_INTERVAL_END, v12, "updateGallery", ", buf, 2u);
  }

LABEL_39:
}

void __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  PBFLogPrewarm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_cold_1();

}

uint64_t __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_647(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

uint64_t __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_649(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)_stateLock_cleanupStaleSnapshotsNotWithinGallery:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  -[PBFPosterExtensionDataStore _stateLock_extensionStoreCoordinators](self, "_stateLock_extensionStoreCoordinators");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogPosterContents();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "Dispatching stale snapshot cleanup...", buf, 2u);
  }

  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke;
  v15[3] = &unk_1E86F2F70;
  v16 = v7;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v7;
  PBFDispatchAsyncWithString(v11, QOS_CLASS_DEFAULT, v15);

}

void __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  os_signpost_id_t spid;
  unint64_t v29;
  id v30;
  id obj;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  PBFLogPosterContents();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  PBFLogPosterContents();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v29 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "_cleanupStaleSnapshotsForOldGallery", ", buf, 2u);
  }
  spid = v3;

  PBFLogPosterContents();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "Stale snapshot cleanup begin", buf, 2u);
  }

  v7 = (void *)objc_opt_new();
  +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_651;
  v49[3] = &unk_1E86F3838;
  v30 = v8;
  v50 = v30;
  v51 = *(id *)(a1 + 32);
  v34 = v7;
  v52 = v34;
  PBFSnapshotDefinitionEnumerateSupportedOrientationsForCurrentDeviceClass(v49);
  v32 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = *(id *)(a1 + 40);
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v10, "extensionIdentifier", spid);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_opt_new();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_2;
        v42[3] = &unk_1E86F3888;
        v43 = v34;
        v13 = v12;
        v44 = v13;
        objc_msgSend(v10, "enumerateDescriptorStoreCoordinators:", v42);
        v14 = objc_msgSend(v13, "count");
        PBFLogPosterContents();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          v37 = i;
          if (v16)
          {
            *(_DWORD *)buf = 138543362;
            v54 = v11;
            _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "Cleaned up stale gallery snapshots for provider %{public}@: ", buf, 0xCu);
          }

          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v36 = v13;
          v17 = v13;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v39 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
                PBFLogPosterContents();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v54 = v11;
                  v55 = 2114;
                  v56 = v22;
                  _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_DEFAULT, "--%{public}@: %{public}@", buf, 0x16u);
                }

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
            }
            while (v19);
          }

          objc_msgSend(v32, "unionSet:", v17);
          v13 = v36;
          i = v37;
        }
        else
        {
          if (v16)
          {
            *(_DWORD *)buf = 138543362;
            v54 = v11;
            _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "No stale gallery snapshots for provider %{public}@; proceeding",
              buf,
              0xCu);
          }

        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v35);
  }

  PBFLogPosterContents();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v32;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v25, OS_SIGNPOST_INTERVAL_END, spid, "_cleanupStaleSnapshotsForOldGallery", "snapshotURLs reaped: %{public}@", buf, 0xCu);
  }

  v26 = *(_QWORD *)(a1 + 48);
  if (v26)
    (*(void (**)(void))(v26 + 16))();
  PBFLogPosterContents();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "Stale snapshot cleanup finished", buf, 2u);
  }

}

void __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_651(id *a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(a1[4], "displayContextWithUpdatedInterfaceOrientation:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "snapshotURLsForContext:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "unionSet:", v3);

}

void __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  objc_msgSend(v6, "snapshotURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_3;
  v7[3] = &unk_1E86F3860;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "objectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "reapSnapshotsMatchingURLs:", v4);
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v4);

}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)_stateLock_pushPosterConfigurationsToProactiveWithCompletion:(id)a3
{
  id v4;
  PRSwitcherConfiguration *v5;
  PRSwitcherConfiguration *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PRSwitcherConfiguration *v11;
  PBFPosterExtensionDataStore *v12;
  id v13;

  v4 = a3;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v6 = self->_stateLock_switcherConfiguration;
    -[PRSwitcherConfiguration configurations](v6, "configurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke;
    v9[3] = &unk_1E86F2FC0;
    v10 = v7;
    v11 = v6;
    v12 = self;
    v13 = v4;
    v5 = v6;
    v8 = v7;
    PBFDispatchAsyncWithString(CFSTR("pushPosterConfigurationsToProactive"), QOS_CLASS_UTILITY, v9);

    goto LABEL_5;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v5 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, PRSwitcherConfiguration *))v4 + 2))(v4, v5);
LABEL_5:

  }
}

void __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;
  _QWORD v10[4];
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_2;
  v10[3] = &unk_1E86F38D8;
  v3 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "bs_mapNoNulls:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v2;
    v6[1] = 3221225472;
    v6[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_5;
    v6[3] = &unk_1E86F3900;
    v7 = *(id *)(a1 + 56);
    objc_copyWeak(&v8, &location);
    objc_msgSend(v5, "posterBoardDidUpdateConfigurations:completion:", v4, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

id __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
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
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;

  v3 = a2;
  objc_msgSend(v3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v7, "isEqual:", v3);

    objc_msgSend(*(id *)(a1 + 32), "activeConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v8, "isEqual:", v3);

    objc_msgSend(v3, "loadSuggestionMetadataWithError:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "suggestedComplicationsByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadComplicationLayoutWithError:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inlineComplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v6;
    v40 = v11;
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ATXComplicationFromPRSWidget(v12, v14);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v10, "complications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v39 = v10;
    v49[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_3;
    v49[3] = &unk_1E86F38B0;
    v18 = v9;
    v50 = v18;
    objc_msgSend(v16, "bs_map:", v49);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sidebarComplications");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v17;
    v47[1] = 3221225472;
    v47[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_4;
    v47[3] = &unk_1E86F38B0;
    v48 = v18;
    v38 = v18;
    objc_msgSend(v19, "bs_map:", v47);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "loadFocusConfigurationWithError:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activityUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "loadTitleStyleConfigurationWithError:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeFontConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "effectiveTitleColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "effectiveTimeNumberingSystem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "serverIdentity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "posterUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "suggestedGalleryItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc(MEMORY[0x1E0CF9040]);
    if (v46)
      v33 = v46;
    else
      v33 = (void *)MEMORY[0x1E0C9AA60];
    if (v20)
      v34 = v20;
    else
      v34 = (void *)MEMORY[0x1E0C9AA60];
    v6 = v44;
    v15 = (void *)objc_msgSend(v32, "initWithExtensionBundleIdentifier:active:selected:inlineComplication:complications:landscapeComplications:modeUUID:font:color:numberingSystem:posterUUID:galleryItem:", v44, v41, v43, v42, v33, v34, v37, v23, v25, v26, v30, v31);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ATXComplicationFromPRSWidget(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ATXComplicationFromPRSWidget(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBFLogPosterContents();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "- [ATXFaceSuggestionClient posterBoardDidUpdateConfigurations:completion:] -- Error? %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", 10, 6, 0);

}

- (id)buildExtensionProvider
{
  return objc_alloc_init(MEMORY[0x1E0D7F8C8]);
}

- (void)_setupExtensionProvider
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

uint64_t __54__PBFPosterExtensionDataStore__setupExtensionProvider__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99EA0];
  v3 = a2;
  objc_msgSend(v2, "pbf_ignoredExtensionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

- (void)_setupExtensionEnvironment
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_stateLock;
  NSMutableDictionary *stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PBFPosterExtensionStoreCoordinator *v22;
  PBFPosterExtensionStoreCoordinator *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  NSObject *v35;
  NSObject *v36;
  id v37;
  os_unfair_lock_s *v38;
  void *v39;
  unint64_t v40;
  os_signpost_id_t v41;
  PBFPosterExtensionDataStore *v42;
  os_unfair_lock_t lock;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;
  const __CFString *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  PBFLogRoleCoordinator();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  PBFLogRoleCoordinator();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_setupExtensionEnvironment", ", buf, 2u);
  }

  -[PBFPosterExtensionDataStore extensionStoreCoordinatorContainerURL](self, "extensionStoreCoordinatorContainerURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  if (!stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier)
  {
    v38 = &self->_stateLock;
    v40 = v4 - 1;
    v41 = v4;
    v12 = (NSMutableDictionary *)objc_opt_new();
    v13 = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
    self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = v12;

    v53 = 0;
    v39 = v9;
    objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, 0, 5, &v53);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v53;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v14;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (!v48)
      goto LABEL_22;
    v15 = *(_QWORD *)v50;
    lock = &self->_extensionProvidingLock;
    v44 = *MEMORY[0x1E0CB2D68];
    v45 = *(_QWORD *)v50;
    v46 = v8;
    v42 = self;
    while (1)
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v8, "filePathURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLByAppendingPathComponent:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:]([PBFPosterExtensionStoreCoordinator alloc], "initWithContainerURL:extensionIdentifier:", v20, v21);
        v23 = v22;
        if (v22)
        {
          -[PBFPosterExtensionStoreCoordinator setupEnvironmentIfNecessary](v22, "setupEnvironmentIfNecessary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            goto LABEL_12;
        }
        else
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v58 = v44;
          v59 = CFSTR("Unable to setup extension store coordinator");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
LABEL_12:
            PBFLogPosterContents();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v55 = v20;
              v56 = 2114;
              v57 = v24;
              _os_log_error_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_ERROR, "Error setting up extension file system environment at URL '%{public}@': %{public}@", buf, 0x16u);
            }
            goto LABEL_20;
          }
        }
        -[PBFPosterExtensionStoreCoordinator posterStaticDescriptorLatestVersionPaths](v23, "posterStaticDescriptorLatestVersionPaths");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "allObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sortedArrayUsingSelector:", sel_compareDescriptorIdentifiers_);
        v25 = objc_claimAutoreleasedReturnValue();

        -[PBFPosterExtensionStoreCoordinator dynamicPosterDescriptorLatestVersionPaths](v23, "dynamicPosterDescriptorLatestVersionPaths");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "allObjects");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sortedArrayUsingSelector:", sel_compareDescriptorIdentifiers_);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        self = v42;
        if (objc_msgSend(v32, "count"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](v42->_stateLock_descriptorsForExtensionBundleIdentifier, "setObject:forKeyedSubscript:", v32, v21);
        v15 = v45;
        if (-[NSObject count](v25, "count"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](v42->_stateLock_staticDescriptorsForExtensionBundleIdentifier, "setObject:forKeyedSubscript:", v25, v21);
        -[NSMutableDictionary setObject:forKey:](v42->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "setObject:forKey:", v23, v21);
        os_unfair_lock_lock(lock);
        -[NSMutableDictionary setObject:forKey:](v42->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "setObject:forKey:", v23, v21);
        os_unfair_lock_unlock(lock);

        v8 = v46;
LABEL_20:

      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      if (!v48)
      {
LABEL_22:

        stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
        v7 = v40;
        v4 = v41;
        p_stateLock = v38;
        v9 = v39;
        break;
      }
    }
  }
  v33 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "mutableCopy");
  os_unfair_lock_unlock(p_stateLock);
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier = v33;

  os_unfair_lock_unlock(&self->_extensionProvidingLock);
  PBFLogRoleCoordinator();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v36, OS_SIGNPOST_INTERVAL_END, v4, "_setupExtensionEnvironment", ", buf, 2u);
  }

}

- (void)_stateLock_setupRoleCoordinatorsIfNeeded
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  __objc2_class **v18;
  char v19;
  int v20;
  void *v21;
  PBFPosterExtensionDataStoreSQLiteDatabase *database;
  id v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSDictionary *roleToRoleCoordinator;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  os_signpost_id_t spid;
  uint64_t v36;
  int64_t stateLock_maximumPosterConfigurationCount;
  void *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  PBFPosterExtensionDataStore *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint8_t *v49;
  uint8_t buf[8];
  uint8_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[4];
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v45 = self;
    PBFLogRoleCoordinator();
    v3 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v3);

    PBFLogRoleCoordinator();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v34 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "setupRoleCoordinatorsIfNeeded", ", buf, 2u);
    }

    if (!v45->_roleToRoleCoordinator)
    {
      stateLock_maximumPosterConfigurationCount = v45->_stateLock_maximumPosterConfigurationCount;
      v43 = (void *)-[NSSet copy](v45->_stateLock_fromExtensions, "copy");
      v38 = (void *)objc_opt_new();
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend((id)objc_opt_class(), "supportedRoles");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v44)
      {
        v41 = *MEMORY[0x1E0D7FC58];
        v42 = *(_QWORD *)v61;
        v39 = *MEMORY[0x1E0D7FC00];
        v36 = *MEMORY[0x1E0D7FC50];
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v61 != v42)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v6);
            v8 = (void *)objc_opt_new();
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v9 = v43;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
            if (v10)
            {
              v11 = *(_QWORD *)v57;
              do
              {
                for (i = 0; i != v10; ++i)
                {
                  if (*(_QWORD *)v57 != v11)
                    objc_enumerationMutation(v9);
                  v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                  objc_msgSend(v13, "supportedRoles", v34);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = objc_msgSend(v14, "containsObject:", v7);

                  if (v15)
                  {
                    objc_msgSend(v13, "posterExtensionBundleIdentifier");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "addObject:", v16);

                  }
                }
                v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
              }
              while (v10);
            }

            v17 = objc_msgSend(v7, "isEqual:", v41);
            v18 = off_1E86F0CC8;
            if ((v17 & 1) != 0
              || (v19 = objc_msgSend(v7, "isEqual:", v39), v18 = off_1E86F0B50, (v19 & 1) != 0)
              || (v20 = objc_msgSend(v7, "isEqual:", v36), v18 = off_1E86F0CB0, v20))
            {
              v21 = (void *)objc_msgSend(objc_alloc(*v18), "initWithStorage:modelCoordinatorProvider:providers:", v45->_database, v45, v8);
            }
            else
            {
              v21 = 0;
            }
            objc_msgSend(v21, "setDelegate:", v45, v34);
            *(_QWORD *)buf = 0;
            v51 = buf;
            v52 = 0x3032000000;
            v53 = __Block_byref_object_copy_;
            v54 = __Block_byref_object_dispose_;
            v55 = 0;
            database = v45->_database;
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __71__PBFPosterExtensionDataStore__stateLock_setupRoleCoordinatorsIfNeeded__block_invoke;
            v47[3] = &unk_1E86F3968;
            v49 = buf;
            v23 = v21;
            v48 = v23;
            v46 = 0;
            v24 = -[PBFPosterExtensionDataStoreSQLiteDatabase performChanges:error:](database, "performChanges:error:", v47, &v46);
            v25 = v46;
            v26 = v25;
            if (!v23 || *((_QWORD *)v51 + 5) || v25 || !v24)
            {
              PBFLogRoleCoordinator();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = (void *)*((_QWORD *)v51 + 5);
                if (!v28)
                  v28 = v26;
                *(_DWORD *)v64 = 138543618;
                v65 = v7;
                v66 = 2114;
                v67 = v28;
                _os_log_error_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_ERROR, "Failed to setup role coordinator for role '%{public}@': %{public}@", v64, 0x16u);
              }
            }
            else
            {
              objc_msgSend(v23, "setMaximumNumberOfPosters:", stateLock_maximumPosterConfigurationCount);
              objc_msgSend(v23, "role");
              v27 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setObject:forKey:", v23, v27);
            }

            _Block_object_dispose(buf, 8);
            ++v6;
          }
          while (v6 != v44);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          v44 = v29;
        }
        while (v29);
      }

      v30 = objc_msgSend(v38, "copy");
      roleToRoleCoordinator = v45->_roleToRoleCoordinator;
      v45->_roleToRoleCoordinator = (NSDictionary *)v30;

    }
    PBFLogRoleCoordinator();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v34 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v33, OS_SIGNPOST_INTERVAL_END, spid, "setupRoleCoordinatorsIfNeeded", ", buf, 2u);
    }

  }
}

BOOL __71__PBFPosterExtensionDataStore__stateLock_setupRoleCoordinatorsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setupRoleIfNecessaryWithStorage:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0;
}

- (BOOL)resetRole:(id)a3 error:(id *)a4
{
  __CFString *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_unfair_lock_s *p_stateLock;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v22;
  void *v23;
  uint8_t buf[4];
  __CFString *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (a4)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v26[0] = *MEMORY[0x1E0CB2D68];
        v26[1] = CFSTR("role");
        v19 = CFSTR("(null role)");
        if (v6)
          v19 = v6;
        v27[0] = CFSTR("RoleCoordinator not setup for role");
        v27[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pbf_generalErrorWithCode:userInfo:", 1, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      PBFLogRoleCoordinator();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore resetRole:error:].cold.1();
      v7 = 0;
      goto LABEL_28;
    }
    PBFLogRoleCoordinator();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v6;
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "Executing reset of role %{public}@", buf, 0xCu);
    }

    +[PBFPosterDataStoreEventBuilder resetRole:](PBFPosterDataStoreEventBuilder, "resetRole:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v10, "buildWithError:", &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;

    if (v11)
    {
      p_stateLock = &self->_stateLock;
      os_unfair_lock_lock(&self->_stateLock);
      v23 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PBFPosterExtensionDataStore _stateLock_processEvents:context:error:](self, "_stateLock_processEvents:context:error:", v14, 0, a4);

      os_unfair_lock_unlock(p_stateLock);
      PBFLogRoleCoordinator();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v25 = v6;
          _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "Reset of role %{public}@; role coordinator finished with success",
            buf,
            0xCu);
        }
        v7 = 1;
        goto LABEL_27;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore resetRole:error:].cold.3();
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      PBFLogRoleCoordinator();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore resetRole:error:].cold.2();
    }
    v7 = 0;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_29:

  return v7;
}

- (void)posterExtensionProvider:(id)a3 updatedExtensionsFrom:(id)a4 to:(id)a5
{
  id v6;
  void *v7;
  NSMutableArray *stateLock_updateExtensionCompletionBlocks;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a5;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    os_unfair_lock_lock(&self->_stateLock);
    -[PBFPosterExtensionDataStore _stateLock_executeExtensionUpdate:](self, "_stateLock_executeExtensionUpdate:", v6);
    v7 = (void *)-[NSMutableArray copy](self->_stateLock_updateExtensionCompletionBlocks, "copy");
    stateLock_updateExtensionCompletionBlocks = self->_stateLock_updateExtensionCompletionBlocks;
    self->_stateLock_updateExtensionCompletionBlocks = 0;

    os_unfair_lock_unlock(&self->_stateLock);
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionDataStore posterExtensionProvider:updatedExtensionsFrom:to:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __80__PBFPosterExtensionDataStore_posterExtensionProvider_updatedExtensionsFrom_to___block_invoke;
      v10[3] = &unk_1E86F2518;
      v11 = v7;
      PBFDispatchAsyncWithString(v9, QOS_CLASS_USER_INITIATED, v10);

    }
  }

}

void __80__PBFPosterExtensionDataStore_posterExtensionProvider_updatedExtensionsFrom_to___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_stateLock_executeExtensionUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t stateLock_initialRoleCoordinatorSetupPerformed;
  NSObject *v10;
  _BOOL4 v11;
  NSNumber *stateLock_wasMigrationJustPerformed;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_assert_owner(&self->_stateLock);
    if (-[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot](self, "_stateLock_hasBeenUnlockedSinceBoot"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringForKey:", CFSTR("stashedBuildVersionString"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016F8]), "initWithString:", v6);
      v8 = objc_alloc_init(MEMORY[0x1E0D016F8]);
      if (-[NSNumber BOOLValue](self->_stateLock_wasMigrationJustPerformed, "BOOLValue")
        || (objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
      {
        PBFLogDataStore();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = -[NSNumber BOOLValue](self->_stateLock_wasMigrationJustPerformed, "BOOLValue");
          v18[0] = 67109376;
          v18[1] = v11;
          v19 = 1024;
          v20 = objc_msgSend(v7, "isEqual:", v8) ^ 1;
          _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "Overriding refresh strategy to PBFDescriptorRefreshStrategyRefreshAlways because %{BOOL}u or the stashed build version is mismatched: %{BOOL}u", (uint8_t *)v18, 0xEu);
        }

        stateLock_wasMigrationJustPerformed = self->_stateLock_wasMigrationJustPerformed;
        self->_stateLock_wasMigrationJustPerformed = 0;

        stateLock_initialRoleCoordinatorSetupPerformed = 3;
      }
      else
      {
        stateLock_initialRoleCoordinatorSetupPerformed = self->_stateLock_initialRoleCoordinatorSetupPerformed;
      }

    }
    else
    {
      stateLock_initialRoleCoordinatorSetupPerformed = 0;
    }
    -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:](self, "_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:", v4, stateLock_initialRoleCoordinatorSetupPerformed, 4, 2, 0);
    if (-[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot](self, "_stateLock_hasBeenUnlockedSinceBoot"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringForKey:", CFSTR("stashedBuildVersionString"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016F8]), "initWithString:", v14);
      v16 = objc_alloc_init(MEMORY[0x1E0D016F8]);
      if ((objc_msgSend(v16, "isEqual:", v15) & 1) == 0)
      {
        objc_msgSend(v16, "stringRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("stashedBuildVersionString"));

      }
    }
  }

}

- (BOOL)_forceExtensionUpdate:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = MEMORY[0x1D17A3148]("-[PBFPosterExtensionDataStore _forceExtensionUpdate:]");
  if (v5)
  {
    os_unfair_lock_lock(&self->_stateLock);
    -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:](self, "_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:", v4, 2, 4, 2, 0);
    os_unfair_lock_unlock(&self->_stateLock);
  }

  return v5;
}

- (void)roleProcessor:(id)a3 transactionFinished:(id)a4 success:(BOOL)a5 results:(id)a6 error:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id *p_isa;
  uint64_t v22;
  const __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  char v41;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  _BOOL4 v48;
  int v49;
  const __CFString *v50;
  uint64_t v51;
  NSObject *v52;
  _BOOL4 v53;
  __CFString *v54;
  id v55;
  id v56;
  id obj;
  __CFString *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  PBFPosterExtensionDataStore *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  const __CFString *v75;
  _BYTE v76[128];
  uint64_t v77;

  v9 = a5;
  v77 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  os_unfair_lock_assert_owner(&self->_stateLock);
  objc_msgSend(v11, "shortIdentifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reason");
  v63 = self;
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_msgSend(v11, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("updateOptions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v11, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("updateOptions"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v18, "unsignedIntegerValue");

    }
    else
    {
      v61 = 0;
    }

    objc_msgSend(v11, "context");
    v14 = objc_claimAutoreleasedReturnValue();
    PBFLogDataStore();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v9)
    {
      v55 = v13;
      v56 = v11;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = v67;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@} notifying roles of changes", buf, 0xCu);
      }

      v62 = objc_opt_new();
      v58 = (__CFString *)objc_opt_new();
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v12, "affectedRoles");
      obj = (id)objc_claimAutoreleasedReturnValue();
      p_isa = (id *)&v63->super.isa;
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v65)
      {
        v59 = *(_QWORD *)v69;
        v60 = v12;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v69 != v59)
              objc_enumerationMutation(obj);
            v23 = *(const __CFString **)(*((_QWORD *)&v68 + 1) + 8 * v22);
            PBFLogDataStore();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v73 = v67;
              v74 = 2114;
              v75 = v23;
              _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@} notifying %{public}@ of changes", buf, 0x16u);
            }

            objc_msgSend(p_isa[33], "objectForKey:", v23);
            v25 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "collectionDiffsPerRole");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKey:", v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = (void *)objc_msgSend(v27, "newCollection");
            if ((-[NSObject isInitialUpdate](v14, "isInitialUpdate") & 1) != 0
              || (objc_msgSend(v27, "isEqual") & 1) == 0)
            {
              objc_msgSend(v28, "orderedPosters");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "array");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v30, v23);

            }
            if (-[NSObject isInitialUpdate](v14, "isInitialUpdate"))
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAB8]), "initWithCollection:newCollection:", 0, v28);
            else
              v31 = 0;
            PBFLogDataStore();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v73 = v67;
              v74 = 2114;
              v75 = v23;
              _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_DEFAULT, "(%{public}@} Updating active path assertions for role %{public}@ ", buf, 0x16u);
            }

            if (-[NSObject isInitialUpdate](v14, "isInitialUpdate"))
              v33 = v31;
            else
              v33 = v27;
            v66 = (void *)v25;
            v34 = v25;
            v35 = v14;
            objc_msgSend(p_isa, "_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:", v33, v34, v14);
            objc_msgSend(v12, "preCommitActivePosterConfigurationForRole");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKey:", v23);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(p_isa, "activePosterConfigurationForRole:assocPoster:", v23, 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            PBFLogDataStore();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v73 = v67;
              v74 = 2114;
              v75 = v23;
              _os_log_impl(&dword_1CB9FA000, v39, OS_LOG_TYPE_DEFAULT, "(%{public}@} Issuing update notifications for role %{public}@ ", buf, 0x16u);
            }

            if (v31)
              v40 = v31;
            else
              v40 = v27;
            objc_msgSend(p_isa, "_stateLock_pushUpdateNotificationsForRole:diff:previouslyActiveConfiguration:newActiveConfiguration:options:reason:context:", v23, v40, v37, v38, v61, v64, v35);
            -[NSObject bs_setSafeObject:forKey:](v62, "bs_setSafeObject:forKey:", v38, v23);
            v41 = BSEqualObjects();
            PBFLogDataStore();
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
            if ((v41 & 1) != 0)
            {
              if (!v43)
                goto LABEL_39;
              *(_DWORD *)buf = 138543618;
              v73 = v67;
              v74 = 2114;
              v75 = v23;
              v44 = v42;
              v45 = "(%{public}@} Aborting update of active configurations for %{public}@; no change needed";
            }
            else
            {
              if (!v43)
                goto LABEL_39;
              *(_DWORD *)buf = 138543618;
              v73 = v67;
              v74 = 2114;
              v75 = v23;
              v44 = v42;
              v45 = "(%{public}@} Updating active configurations for %{public}@ ";
            }
            _os_log_impl(&dword_1CB9FA000, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 0x16u);
LABEL_39:

            ++v22;
            v12 = v60;
            p_isa = (id *)&v63->super.isa;
            v14 = v35;
          }
          while (v65 != v22);
          v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        }
        while (v65);
      }

      v20 = v62;
      v46 = -[NSObject count](v62, "count");
      PBFLogDataStore();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
      if (v46)
      {
        if (v48)
        {
          *(_DWORD *)buf = 138543618;
          v73 = v67;
          v74 = 2114;
          v75 = (const __CFString *)v62;
          _os_log_impl(&dword_1CB9FA000, v47, OS_LOG_TYPE_DEFAULT, "(%{public}@} Pushing out active poster for roles update %{public}@", buf, 0x16u);
        }

        objc_msgSend(p_isa, "_notifyObserversDidUpdateActivePosterForRoles:", v62);
      }
      else
      {
        if (v48)
        {
          v49 = -[NSObject isInitialUpdate](v14, "isInitialUpdate");
          v50 = CFSTR("no changes");
          if (v49)
            v50 = CFSTR("isInitialUpdate");
          *(_DWORD *)buf = 138543618;
          v73 = v67;
          v74 = 2114;
          v75 = v50;
          _os_log_impl(&dword_1CB9FA000, v47, OS_LOG_TYPE_DEFAULT, "(%{public}@} *NOT* pushing out active poster for roles update; %{public}@",
            buf,
            0x16u);
        }

      }
      v13 = v55;
      v11 = v56;
      v51 = -[__CFString count](v58, "count");
      PBFLogDataStore();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
      if (v51)
      {
        if (v53)
        {
          *(_DWORD *)buf = 138543618;
          v73 = v67;
          v74 = 2114;
          v75 = v58;
          _os_log_impl(&dword_1CB9FA000, v52, OS_LOG_TYPE_DEFAULT, "(%{public}@} Pushing out updated poster collections for roles update %{public}@", buf, 0x16u);
        }

        v54 = v58;
        -[PBFPosterExtensionDataStore _notifyObserversDidUpdatePosterCollectionsForRoles:](v63, "_notifyObserversDidUpdatePosterCollectionsForRoles:", v58);
      }
      else
      {
        if (v53)
        {
          *(_DWORD *)buf = 138543362;
          v73 = v67;
          _os_log_impl(&dword_1CB9FA000, v52, OS_LOG_TYPE_DEFAULT, "(%{public}@} *NOT* pushing out updated poster collections for roles update; no updated poster collections",
            buf,
            0xCu);
        }

        v54 = v58;
      }

    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:].cold.1();
    }

    goto LABEL_61;
  }
  PBFLogDataStore();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v73 = v67;
    _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@} Data store invalidated. Role Processor is bailing.", buf, 0xCu);
  }
LABEL_61:

}

- (void)assertionManager:(id)a3 identityIsNowMarkedAsInUse:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  PBFLogDataStore();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "Path '%@', is now marked as inuse", (uint8_t *)&v6, 0xCu);
  }

}

- (void)assertionManager:(id)a3 identityIsNowMarkedAsNOTInUse:(id)a4
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  PBFPosterExtensionDataStoreSQLiteDatabase *database;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[PBFPosterSnapshotManager cancelRequestedSnapshotsForIdentity:](self->_snapshotManager, "cancelRequestedSnapshotsForIdentity:", v5);
  PBFLogDataStore();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v31 = v5;
    v9 = "Successfully cleaned up snapshots after path: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v31 = v5;
    v9 = "Nothing to clean up for after cancelling snapshots for path: %@";
  }
  _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_7:

  objc_msgSend(v5, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore knownExtensions](self, "knownExtensions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke;
  v28[3] = &unk_1E86F2B30;
  v13 = v10;
  v29 = v13;
  v14 = objc_msgSend(v11, "bs_containsObjectPassingTest:", v28);

  PBFLogDataStore();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) != 0)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "Identity '%@' is no longer marked in use; will remove.",
        buf,
        0xCu);
    }

    objc_msgSend(v5, "posterUUID");
    v15 = objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = 0;
    -[PBFPosterExtensionDataStore _stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:](self, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v15, &v27, &v26);
    v17 = v27;
    v18 = v26;
    v25 = 0;
    objc_msgSend(v18, "removeSupplement:forVersion:error:", objc_msgSend(v5, "supplement"), objc_msgSend(v5, "version"), &v25);
    v19 = v25;
    PBFLogDataStore();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStore assertionManager:identityIsNowMarkedAsNOTInUse:].cold.1();
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "Successfully cleaned up after path: %@", buf, 0xCu);
    }

    if ((objc_msgSend(v18, "hasKnownVersions") & 1) == 0)
    {
      objc_msgSend(v17, "teardownConfigurationStoreCoordinatorForPosterUUID:error:", v15, 0);
      database = self->_database;
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke_678;
      v23[3] = &unk_1E86F3990;
      v24 = v15;
      -[PBFPosterExtensionDataStoreSQLiteDatabase performChanges:error:](database, "performChanges:error:", v23, 0);

    }
  }
  else if (v16)
  {
    *(_DWORD *)buf = 138412290;
    v31 = v13;
    _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "Extension '%@' has been removed; will not delete underlying configurations.",
      buf,
      0xCu);
  }

}

uint64_t __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "posterExtensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke_678(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removePosterUUID:error:", *(_QWORD *)(a1 + 32), 0);
}

- (void)roleCoordinatorWasReset:(id)a3 processInitialStateSetupEvents:(id *)a4
{
  PFPosterExtensionProvider *extensionProvider;
  id v7;
  os_unfair_lock_s *p_extensionProvidingLock;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  extensionProvider = self->_extensionProvider;
  v7 = a3;
  -[PFPosterExtensionProvider knownPosterExtensions](extensionProvider, "knownPosterExtensions");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  p_extensionProvidingLock = &self->_extensionProvidingLock;
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  -[NSMutableDictionary objectEnumerator](self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_extensionProvidingLock);
  objc_msgSend((id)objc_opt_class(), "buildInitialStateSetupEventsForRoleCoordinator:extensionHandlers:extensionStoreCoordinators:", v7, v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *a4 = v11;
}

- (id)buildPrewarmPlanWithIdentifier:(id)a3 refreshStrategy:(int64_t)a4 galleryUpdateOptions:(unint64_t)a5 powerLogReason:(int64_t)a6 cleanupOldResources:(BOOL)a7 prewarmDisplayContext:(id)a8
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PBFMutablePosterExtensionDataStorePrewarmPlan *v16;
  BSAtomicFlag *v17;
  BSAtomicFlag *v18;
  id v19;
  int v20;
  uint64_t v21;
  BSAtomicFlag *v22;
  id v23;
  BSAtomicFlag *v24;
  id v25;
  BSAtomicFlag *v26;
  uint64_t v27;
  id v28;
  id v29;
  PBFPosterSnapshotManager *v30;
  void *v31;
  id v33;
  _BOOL4 v35;
  PBFPosterSnapshotManager *v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[4];
  BSAtomicFlag *v41;
  id v42;
  PBFPosterSnapshotManager *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  BSAtomicFlag *v47;
  id v48;
  id v49;
  PBFPosterSnapshotManager *v50;
  id v51[2];
  _QWORD v52[4];
  BSAtomicFlag *v53;
  id v54;
  id v55[3];
  _QWORD v56[4];
  BSAtomicFlag *v57;
  id v58;
  id v59;
  _QWORD v60[4];
  BSAtomicFlag *v61;
  id v62;
  id v63[3];
  id location[2];

  v35 = a7;
  v12 = a3;
  v37 = a8;
  if (!v37)
  {
    +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allKeys](self->_roleToRoleCoordinator, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(PBFMutablePosterExtensionDataStorePrewarmPlan);
  -[PBFPosterExtensionDataStorePrewarmPlan setIdentifier:](v16, "setIdentifier:", v12);
  v17 = self->_invalidationFlag;
  v36 = self->_snapshotManager;
  objc_initWeak(location, self);
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke;
  v60[3] = &unk_1E86F39E0;
  objc_copyWeak(v63, location);
  v18 = v17;
  v61 = v18;
  v63[1] = (id)a4;
  v63[2] = (id)a6;
  v19 = v12;
  v62 = v19;
  -[PBFMutablePosterExtensionDataStorePrewarmPlan setExecutionBlock:forPhase:](v16, "setExecutionBlock:forPhase:", v60, CFSTR("PBFPrewarmPhaseReloadDescriptors"));
  v20 = objc_msgSend(v15, "bs_containsObjectPassingTest:", &__block_literal_global_685);
  v21 = MEMORY[0x1E0C809B0];
  if (v20)
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4;
    v56[3] = &unk_1E86F3A50;
    objc_copyWeak(&v59, location);
    v22 = v18;
    v57 = v22;
    v23 = v19;
    v58 = v23;
    -[PBFMutablePosterExtensionDataStorePrewarmPlan setExecutionBlock:forPhase:](v16, "setExecutionBlock:forPhase:", v56, CFSTR("PBFPrewarmPhasePushToProactive"));
    v33 = v19;
    v52[0] = v21;
    v52[1] = 3221225472;
    v52[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_688;
    v52[3] = &unk_1E86F39E0;
    objc_copyWeak(v55, location);
    v24 = v22;
    v53 = v24;
    v25 = v23;
    v54 = v25;
    v55[1] = (id)a5;
    v55[2] = (id)a6;
    -[PBFMutablePosterExtensionDataStorePrewarmPlan setExecutionBlock:forPhase:](v16, "setExecutionBlock:forPhase:", v52, CFSTR("PBFPrewarmPhaseAcquireNewGallery"));
    v46[0] = v21;
    v46[1] = 3221225472;
    v46[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_692;
    v46[3] = &unk_1E86F3B10;
    objc_copyWeak(v51, location);
    v26 = v24;
    v47 = v26;
    v27 = v21;
    v28 = v25;
    v48 = v28;
    v29 = v37;
    v49 = v29;
    v51[1] = (id)a6;
    v30 = v36;
    v50 = v30;
    -[PBFMutablePosterExtensionDataStorePrewarmPlan setExecutionBlock:forPhase:](v16, "setExecutionBlock:forPhase:", v46, CFSTR("PBFPrewarmPhaseSnapshotSwitcher"));
    v40[0] = v27;
    v40[1] = 3221225472;
    v40[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_701;
    v40[3] = &unk_1E86F3BB0;
    objc_copyWeak(&v45, location);
    v41 = v26;
    v42 = v29;
    v43 = v30;
    v44 = v28;
    -[PBFMutablePosterExtensionDataStorePrewarmPlan setExecutionBlock:forPhase:](v16, "setExecutionBlock:forPhase:", v40, CFSTR("PBFPrewarmPhaseSnapshotGallery"));

    objc_destroyWeak(&v45);
    objc_destroyWeak(v51);

    objc_destroyWeak(v55);
    objc_destroyWeak(&v59);
    v19 = v33;
    v21 = MEMORY[0x1E0C809B0];
  }
  if (v35)
  {
    -[PBFMutablePosterExtensionDataStorePrewarmPlan appendPrewarmPhase:](v16, "appendPrewarmPhase:", CFSTR("PBFPrewarmPhaseSnapshotCleanup"));
    v39[0] = v21;
    v39[1] = 3221225472;
    v39[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_709;
    v39[3] = &unk_1E86F3C00;
    v39[4] = self;
    -[PBFMutablePosterExtensionDataStorePrewarmPlan setExecutionBlock:forPhase:](v16, "setExecutionBlock:forPhase:", v39, CFSTR("PBFPrewarmPhaseSnapshotCleanup"));
    -[PBFMutablePosterExtensionDataStorePrewarmPlan appendPrewarmPhase:](v16, "appendPrewarmPhase:", CFSTR("PBFPrewarmPhaseFileSystemCleanup"));
    v38[0] = v21;
    v38[1] = 3221225472;
    v38[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_6;
    v38[3] = &unk_1E86F3C00;
    v38[4] = self;
    -[PBFMutablePosterExtensionDataStorePrewarmPlan setExecutionBlock:forPhase:](v16, "setExecutionBlock:forPhase:", v38, CFSTR("PBFPrewarmPhaseFileSystemCleanup"));
  }
  v31 = (void *)-[PBFMutablePosterExtensionDataStorePrewarmPlan copy](v16, "copy");

  objc_destroyWeak(v63);
  objc_destroyWeak(location);

  return v31;
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  id v38;
  uint64_t v39;
  id obj;
  _QWORD block[4];
  id v42;
  _QWORD aBlock[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  const __CFString *v62;
  _QWORD v63[4];

  v63[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !objc_msgSend(*(id *)(a1 + 32), "getFlag"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 47);
    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*((id *)WeakRetained + 5), "knownPosterExtensions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 64);
    v54 = 0;
    v37 = (void *)v15;
    v38 = WeakRetained;
    objc_msgSend(WeakRetained, "_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:", v15, v16, v17, 4, &v54);
    v18 = v54;
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 47);
    v19 = dispatch_group_create();
    dispatch_group_enter(v19);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v18;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    v21 = MEMORY[0x1E0C809B0];
    if (v20)
    {
      v22 = v20;
      v23 = *(_QWORD *)v51;
      v39 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          PBFLogPrewarm();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v19;
            v28 = v22;
            v29 = v6;
            v30 = v7;
            v31 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v25, "extensionBundleIdentifier");
            v32 = a1;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v56 = v31;
            v7 = v30;
            v6 = v29;
            v22 = v28;
            v19 = v27;
            v57 = 2114;
            v58 = v6;
            v59 = 2114;
            v60 = v33;
            _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ watching reload descriptor operation for bundle %{public}@", buf, 0x20u);

            a1 = v32;
            v23 = v39;
            v21 = MEMORY[0x1E0C809B0];
          }

          dispatch_group_enter(v19);
          v45[0] = v21;
          v45[1] = 3221225472;
          v45[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_682;
          v45[3] = &unk_1E86F39B8;
          v46 = v7;
          v47 = *(id *)(a1 + 40);
          v48 = v6;
          v49 = v19;
          objc_msgSend(v25, "addCompletionObserver:", v45);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      }
      while (v22);
    }

    dispatch_group_leave(v19);
    aBlock[0] = v21;
    aBlock[1] = 3221225472;
    aBlock[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_683;
    aBlock[3] = &unk_1E86F2518;
    v44 = obj;
    v11 = obj;
    v34 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2;
    block[3] = &unk_1E86F2518;
    v42 = v7;
    dispatch_group_notify(v19, v35, block);

    v12 = _Block_copy(v34);
    v10 = v37;
    WeakRetained = v38;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v62 = CFSTR("phase");
    v63[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 3, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishedWithError:", v11);
    v12 = 0;
  }

  return v12;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_682(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteNonFatalError:", v6);
    PBFLogPrewarm();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "extensionBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v6;
      _os_log_error_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_ERROR, "(%{public}@) phase %{public}@ reload descriptor operation for bundle %{public}@ failed with error: %{public}@", (uint8_t *)&v13, 0x2Au);
LABEL_6:

    }
  }
  else
  {
    PBFLogPrewarm();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "extensionBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ reload descriptor operation for bundle %{public}@ succeeded", (uint8_t *)&v13, 0x20u);
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_683(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "invalidateAssertionsWithCompletion:", 0, (_QWORD)v7);
        objc_msgSend(v6, "cancel");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedWithError:", 0);
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D7FC90], "proactiveGallerySupportedForRole:", a2);
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  os_unfair_lock_s *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !objc_msgSend(a1[4], "getFlag"))
  {
    os_unfair_lock_lock(WeakRetained + 47);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5;
    v15[3] = &unk_1E86F3A28;
    v16 = v8;
    v17 = a1[5];
    v18 = v7;
    v19 = v9;
    -[os_unfair_lock_s _stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:](WeakRetained, "_stateLock_pushPosterDescriptorsToProactiveForReason:force:completion:", CFSTR("prewarm"), 1, v15);
    os_unfair_lock_unlock(WeakRetained + 47);

    v12 = v16;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("phase");
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishedWithError:", v13);

  }
  return 0;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
    v6 = 0;
  else
    v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("DID_PUSH_DESCRIPTORS"));

  PBFLogPrewarm();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 1024;
    v19 = v6;
    _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ did push descriptors? %{BOOL}u", (uint8_t *)&v14, 0x1Cu);
  }

  if (v5)
  {
    PBFLogPrewarm();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 56), "noteNonFatalError:", v5);
  }
  PBFLogPrewarm();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v13;
    v16 = 1024;
    LODWORD(v17) = a2;
    _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) finished pushing descriptors to proactive; did update? %{BOOL}u",
      (uint8_t *)&v14,
      0x12u);
  }

  objc_msgSend(*(id *)(a1 + 56), "finishedWithError:", 0);
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_688(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !objc_msgSend(*(id *)(a1 + 32), "getFlag"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DID_PUSH_DESCRIPTORS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    PBFLogPrewarm();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        v31 = 2114;
        v32 = v7;
        _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ asking for new gallery", buf, 0x16u);
      }

      v20 = (void *)WeakRetained[11];
      v21 = *(_QWORD *)(a1 + 56);
      v22 = *(_QWORD *)(a1 + 64);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_689;
      v24[3] = &unk_1E86F3A78;
      v25 = *(id *)(a1 + 40);
      v26 = v7;
      v27 = v9;
      v28 = v8;
      objc_msgSend(v20, "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", v21, v22, v24);

    }
    else
    {
      if (v18)
      {
        v23 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2114;
        v32 = v7;
        _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ bail asking for new gallery; no descriptors were pushed",
          buf,
          0x16u);
      }

      objc_msgSend(v9, "finishedWithError:", 0);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v33 = CFSTR("phase");
    v34[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishedWithError:", v13);

  }
  return 0;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_689(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  PBFLogPrewarm();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_689_cold_1(a1, (uint64_t)v7, v9);

    objc_msgSend(*(id *)(a1 + 48), "noteNonFatalError:", v7);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ ask for new gallery succeeded", (uint8_t *)&v13, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v12, CFSTR("DID_UPDATE_GALLERY"));

  objc_msgSend(*(id *)(a1 + 48), "finishedWithError:", 0);
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_692(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  const __CFString *v46;
  _QWORD v47[4];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && !objc_msgSend(*(id *)(a1 + 32), "getFlag"))
  {
    objc_msgSend(*(id *)(a1 + 40), "stringByAppendingFormat:", CFSTR("-%@"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "acquireSnapshotterInUseAssertionWithReason:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained[33], "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC58]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "posterCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "orderedPosters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_opt_new();
    v19 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_693;
    v38[3] = &unk_1E86F3AA0;
    v39 = *(id *)(a1 + 48);
    objc_msgSend(v10, "bs_mapNoNulls:", v38);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    v37[1] = 3221225472;
    v37[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_694;
    v37[3] = &__block_descriptor_40_e60___PBFPosterSnapshotRequest_16__0__PBFPosterSnapshotRequest_8l;
    v37[4] = *(_QWORD *)(a1 + 72);
    objc_msgSend(v20, "bs_map:", v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObjectsFromArray:", v21);
    PBFLogPrewarm();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v41 = v23;
      v42 = 2114;
      v43 = v6;
      v44 = 2114;
      v45 = v18;
      _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ prewarming switcher snapshots: %{public}@", buf, 0x20u);
    }

    v24 = *(void **)(a1 + 56);
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_697;
    v34[3] = &unk_1E86F3AE8;
    v35 = v7;
    v25 = v14;
    v36 = v25;
    objc_msgSend(v24, "prewarmSnapshotsForRequests:completion:", v18, v34);
    aBlock[0] = v19;
    aBlock[1] = 3221225472;
    aBlock[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_698;
    aBlock[3] = &unk_1E86F3308;
    v30 = v25;
    v31 = *(id *)(a1 + 56);
    v32 = v18;
    v33 = *(id *)(a1 + 40);
    v26 = v18;
    v11 = v25;
    v27 = _Block_copy(aBlock);
    v12 = _Block_copy(v27);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v46 = CFSTR("phase");
    v47[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 3, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishedWithError:", v11);
    v12 = 0;
  }

  return v12;
}

PBFPosterSnapshotRequest *__156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_693(uint64_t a1, void *a2)
{
  id v3;
  PBFPosterSnapshotRequest *v4;
  void *v5;
  PBFPosterSnapshotRequest *v6;

  v3 = a2;
  v4 = [PBFPosterSnapshotRequest alloc];
  +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions](PBFPosterSnapshotDefinition, "defaultConfigurationDefinitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:](v4, "initWithConfiguration:definitions:context:", v3, v5, *(_QWORD *)(a1 + 32));

  return v6;
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_694(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "requestWithIntention:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithPowerLogReason:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_697(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteNonFatalError:", v3);
    v3 = v4;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedWithError:", v3);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_698(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(CFSTR("Prewarm cancelled - "), "stringByAppendingString:", *(_QWORD *)(a1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelRequestedSnapshotsForRequests:reason:", v3, v4);

}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_701(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD aBlock[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained && !objc_msgSend(a1[4], "getFlag"))
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy_;
    v34[4] = __Block_byref_object_dispose_;
    v35 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy_;
    v32[4] = __Block_byref_object_dispose_;
    v33 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_702;
    v23[3] = &unk_1E86F3B60;
    v24 = v9;
    v30 = v32;
    v25 = a1[5];
    v26 = a1[6];
    v27 = a1[7];
    v28 = v7;
    v31 = v34;
    v29 = WeakRetained;
    objc_msgSend(WeakRetained, "fetchCurrentGalleryConfiguration:", v23);
    aBlock[0] = v15;
    aBlock[1] = 3221225472;
    aBlock[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_708;
    aBlock[3] = &unk_1E86F3B88;
    v21 = v34;
    v19 = a1[6];
    v22 = v32;
    v20 = a1[7];
    v16 = _Block_copy(aBlock);
    v14 = _Block_copy(v16);

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v36 = CFSTR("phase");
    v37[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishedWithError:", v13);

    v14 = 0;
  }

  return v14;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_702(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "prewarmGallerySnapshotRequestsForDisplayContext:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_705;
    v40[3] = &unk_1E86F2940;
    v41 = *(id *)(a1 + 48);
    objc_msgSend(v3, "bs_filter:", v40);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    PBFLogPrewarm();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 64);
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
      *(_DWORD *)buf = 138543874;
      v44 = v8;
      v45 = 2114;
      v46 = v9;
      v47 = 2048;
      v48 = v10;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ prewarming gallery snapshots: %lu", buf, 0x20u);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = a1;
    v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          PBFLogPrewarm();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(_QWORD *)(v11 + 56);
            *(_DWORD *)buf = 138543618;
            v44 = v19;
            v45 = 2114;
            v46 = v17;
            _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) snapshot request %{public}@", buf, 0x16u);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v14);
    }

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v11 + 80) + 8) + 40), "count"))
    {
      v20 = *(void **)(v11 + 72);
      objc_msgSend(*(id *)(v11 + 56), "stringByAppendingFormat:", CFSTR("-%@"), *(_QWORD *)(v11 + 64));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "acquireSnapshotterInUseAssertionWithReason:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(v11 + 88) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      v25 = *(void **)(v11 + 48);
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 80) + 8) + 40);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_706;
      v33[3] = &unk_1E86F3B38;
      v27 = *(id *)(v11 + 32);
      v28 = *(_QWORD *)(v11 + 88);
      v34 = v27;
      v35 = v28;
      objc_msgSend(v25, "prewarmSnapshotsForRequests:completion:", v26, v33);

    }
    else
    {
      objc_msgSend(*(id *)(v11 + 32), "finishedWithError:", 0);
    }

  }
  else
  {
    v29 = *(void **)(a1 + 32);
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D68];
    v50[0] = CFSTR("Gallery configuration is nil at this step during prewarm.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "pbf_generalErrorWithCode:userInfo:", 1, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "noteNonFatalError:", v32);

    objc_msgSend(*(id *)(a1 + 32), "finishedWithError:", 0);
  }
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_705(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "areSnapshotsFullyPrepared:", v3) ^ 1;

  return v4;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_706(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteNonFatalError:", v3);
    v3 = v4;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedWithError:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");

}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_708(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v3 = (void *)a1[4];
  objc_msgSend(CFSTR("Prewarm cancelled - "), "stringByAppendingString:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequestedSnapshotsForRequests:reason:", v2, v4);

}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_709(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_710;
  v9[3] = &unk_1E86F3BD8;
  v9[4] = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "fetchCurrentGalleryConfiguration:", v9);

  return 0;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_710(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 188);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_711;
  v6[3] = &unk_1E86F2518;
  v5 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_stateLock_cleanupStaleSnapshotsNotWithinGallery:completion:", v4, v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_711(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedWithError:", 0);
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
  objc_msgSend(*(id *)(a1 + 32), "_stateLock_extensionStoreCoordinators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 188));
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_7;
  v18[3] = &unk_1E86F3130;
  v19 = v7;
  v9 = v6;
  v20 = v9;
  v21 = v5;
  v10 = v5;
  v11 = v7;
  PBFDispatchAsyncWithString(CFSTR("FSCleanup"), QOS_CLASS_DEFAULT, v18);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_8;
  v16[3] = &unk_1E86F2518;
  v17 = v9;
  v12 = v9;
  v13 = _Block_copy(v16);
  v14 = _Block_copy(v13);

  return v14;
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_7(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "ensureFileSystemIntegrity", (_QWORD)v9);
      if ((objc_msgSend(a1[5], "getFlag") & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  return objc_msgSend(a1[6], "finishedWithError:", 0);
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFlag:", 1);
}

- (id)_buildSwitcherConfigurationWithContext:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  void *v6;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[PBFPosterExtensionDataStore _stateLock_buildSwitcherConfigurationWithContext:outMutated:](self, "_stateLock_buildSwitcherConfigurationWithContext:outMutated:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (PBFPosterExtensionDataStoreAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (PBFPosterSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (PFPosterExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

- (NSURL)extensionStoreCoordinatorContainerURL
{
  return self->_extensionStoreCoordinatorContainerURL;
}

- (NSURL)galleryCacheURL
{
  return self->_galleryCacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryCacheURL, 0);
  objc_storeStrong((id *)&self->_extensionStoreCoordinatorContainerURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_extensionsInputIsValidAtomicFlag, 0);
  objc_storeStrong((id *)&self->_stateLock_wasMigrationJustPerformed, 0);
  objc_storeStrong((id *)&self->_stateLock_updateExtensionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_activePosterLock_roleToActivePosterConfiguration, 0);
  objc_storeStrong((id *)&self->_roleToRoleCoordinator, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_stateLock_hasBeenUnlockedSinceBoot, 0);
  objc_storeStrong((id *)&self->_prewarmer, 0);
  objc_storeStrong((id *)&self->_isPrewarmingFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_clientSnapshotRequestQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_stateLock_activePathAssertions, 0);
  objc_storeStrong((id *)&self->_stateLock_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_stateLock_staticDescriptorsForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_descriptorsForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_suggestedLayout, 0);
  objc_storeStrong((id *)&self->_stateLock_configuration, 0);
  objc_storeStrong((id *)&self->_instanceCollection, 0);
  objc_storeStrong((id *)&self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_galleryController, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_complicationSnapshotService, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_stateLock_fromExtensions, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_foregroundKeepDatabaseAliveAssertion, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_extensionEnvironmentURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_155_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_17(&dword_1CB9FA000, v0, v1, "(%{public}@) prewarm runtime assertion was invalidated; probably ran out of time?",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_7();
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  v2 = 138543362;
  v3 = v0;
  _os_log_debug_impl(&dword_1CB9FA000, v1, OS_LOG_TYPE_DEBUG, "(%{public}@) finished wih no errors", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_7();
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v1, v2, "(%{public}@) finished with non-fatal errors %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_7();
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_159_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v1, v2, "(%{public}@) finished with fatal error %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_7();
}

- (void)posterDescriptorsForExtensionBundleIdentifier:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)staticPosterDescriptorsForExtensionBundleIdentifier:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)deletePosterDescriptorsForExtensionBundleIdentifier:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)updateGallery:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)updateGallery:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPosterSnapshotsWithClientRequest:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPosterSnapshotsWithClientRequest:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not retrieve snapshot for XPC client request with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v1, v2, "[%{public}@] Not configurationUpdate received; bailing w/ error: %{public}@",
    (_QWORD)v3,
    DWORD2(v3));
  OUTLINED_FUNCTION_7();
}

void __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v1, v2, "[%{public}@] failed to update data store: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.7()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)refreshPosterConfigurationMatchingUUID:sessionInfo:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)activePosterForRole:assocPoster:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_17(&dword_1CB9FA000, v0, v1, "Unable to query for active poster for role %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)duplicatePosterConfigurationMatchingUUID:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)exportPosterConfigurationMatchingUUID:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)importPosterConfigurationFromArchiveData:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)ingestSnapshotCollection:forPosterConfigurationUUID:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)ingestSnapshotCollection:forPosterConfigurationUUID:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_ingestRefreshPosterConfiguration:(const char *)a1 completion:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "Invalidated; bailing on %{public}@", v4, 0xCu);

}

- (void)_ingestRefreshPosterConfiguration:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Active editing session for extension %{public}@; bailing on poster configuration refresh",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)_ingestRefreshPosterConfiguration:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Failed to find role coordinator for role %{public}@; unable to ingest refresh poster configuration",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)_ingestRefreshPosterConfiguration:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Failed to poster; destinationUUID was invalid for role %@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)updateDataStoreForIncomingAvailableFocusModeChange:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Failed to prune focus modes for %{public}@; role coordinator is not setup for that role?",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)processIncomingPosterConfiguration:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "(%{public}@} failed to execute data store update: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_19(&dword_1CB9FA000, v0, v1, "Role %{public}@ numberOfOrderedPostersAssertionsForReason %lu");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_buildSwitcherConfigurationWithContext:(os_log_t)log outMutated:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_FAULT, "(_stateLock_buildSwitcherConfigurationWithContext...) Can't build switcher configuration: No role coordinator for PRPosterRoleLockScreen", v1, 2u);
}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not obtain snapshot for suggested Focus poster with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "(%{public}@) PosterBoard extension update aborted; no extensions passed?",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "(%{public}@) failed to issue update extensions data store event w/ error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "(%{public}@) failed to build update extensions data store event: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_finishUpdateExtensionUpdateWithOptions:updateExtensionSession:pushToProactiveError:didUpdateProactiveDescriptors:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "(%@)Finished dynamic descriptors update; could not push to proactive because error: %{public}@");
  OUTLINED_FUNCTION_7();
}

void __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v1, v2, "(%@)Finished dynamic descriptors update w/ error: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Unable to update Extension static descriptors %{public}@; this extension is not currently tracked",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Unable to update Extension static descriptors %{public}@; no extension store coordinator for provider",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_19(&dword_1CB9FA000, v0, v1, "Failed to setup static descriptors for %{public}@; errors: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_setupEnvironmentForExtension:wasUpdated:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Unable to create extension store coordinator container for provider '%{public}@: '%{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_updateEnvironmentForExtension:fromExtension:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Unable to update Extension %{public}@; this extension is not currently tracked",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_hasBeenUnlockedSinceBoot
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PBF_MKBDeviceUnlockedSinceBoot(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBFPosterExtensionDataStore.m"), 123, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:(NSObject *)a3 reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.2(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_1CB9FA000, a3, v5, "Extension Store Coordinator discovery error %{public}@: %{public}@", v6);

  OUTLINED_FUNCTION_20();
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:(NSObject *)a3 reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.3(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_1CB9FA000, a3, v5, "Asset Updated Error %{public}@: %{public}@", v6);

  OUTLINED_FUNCTION_20();
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Error ingesting reloaded descriptors %{public}@: %{public}@");
  OUTLINED_FUNCTION_7();
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Failed %{public}@: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@ error: no extension store coordinator found for bundle identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@ ingest error: %{public}@");
  OUTLINED_FUNCTION_7();
}

void __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_17(&dword_1CB9FA000, v0, v1, "update gallery prewarm runtime assertion was invalidated: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)resetRole:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Failed to reset of role %{public}@; role coordinator is not setup for that role?",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)resetRole:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Failed to reset of role %{public}@; could not build reset role event: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)resetRole:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Reset of role %{public}@; role coordinator finished with failure",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)assertionManager:identityIsNowMarkedAsNOTInUse:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "UNABLE TO DELETE PATH '%@': %@");
  OUTLINED_FUNCTION_7();
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 40);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v1, v2, "(%{public}@) finished pushing to proactive; error: %{public}@",
    (_QWORD)v3,
    DWORD2(v3));
  OUTLINED_FUNCTION_7();
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_689_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "(%{public}@) phase %{public}@ ask for new gallery failed with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end
