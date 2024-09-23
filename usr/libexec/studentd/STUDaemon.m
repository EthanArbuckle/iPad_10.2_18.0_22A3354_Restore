@implementation STUDaemon

- (STUDaemon)init
{
  STUDaemon *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CRKFeatureFlags *featureFlags;
  STUPrivacyMigrationTaskProvider *v9;
  void *v10;
  STUMigrationSession *v11;
  void *v12;
  void *v13;
  STUDebouncingAnalyticsPrimitives *v14;
  void *v15;
  STUDebouncingAnalyticsPrimitives *v16;
  STUAnalyticsPrimitives *debouncingAnalyticsPrimitives;
  STUDevice *v18;
  STUDevice *currentDevice;
  id v20;
  NSObject *v21;
  void *v22;
  CATTaskServer *v23;
  CATTaskServer *mServer;
  CATOperationQueue *v25;
  CATOperationQueue *mOperationQueue;
  void *v27;
  uint64_t v28;
  CRKKeychain *keychain;
  void *v30;
  uint64_t v31;
  CRKIDSMessageBroadcasting *IDSMessageBroadcaster;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  STUASMCourseLibrary *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  STUClassSessionBrowsing *ASMClassSessionBrowser;
  STUASMEventHandler *v45;
  STUASMEventHandler *ASMEventHandler;
  void *v47;
  uint64_t v48;
  CRKFeatureDataStoreProtocol *featureDataStore;
  void *v50;
  uint64_t v51;
  CRKClassroomLockScreenMonitoring *lockScreenMonitor;
  id v53;
  void *v54;
  CRKCertificateExchangeBroadcastHandler *v55;
  CRKCertificateExchangeBroadcastHandler *certificateExchangeBroadcastHandler;
  STUConfigurationManager *v57;
  CRKFeatureDataStoreProtocol *v58;
  void *v59;
  STUConfigurationManager *v60;
  STUConfigurationManager *configurationManager;
  STUServerResourceCache *v62;
  STUServerResourceCache *serverResourceCache;
  STUActivityUI *v64;
  STUActivityUI *activityUI;
  STUDevicePropertyObserver *v66;
  STUDevicePropertyObserver *mPropertyObserver;
  NSMutableDictionary *v68;
  NSMutableDictionary *mSubscriptionContextsBySessionUUID;
  uint64_t v70;
  STUPermanentTokenAuthenticator *mSessionTokenAuthenticator;
  void *v72;
  uint64_t v73;
  NSXPCListener *mListener;
  CRKClassSessionBrowser *v75;
  CRKClassSessionBrowser *mSessionBrowser;
  uint64_t v77;
  NSMapTable *mSessionIdentifiersByTransport;
  NSMutableSet *v79;
  NSMutableSet *quarantinedIDSSessionIdentifiers;
  STUInvitationSessionManager *v81;
  STUInvitationSessionManager *mInvitationSessionManager;
  NSMutableDictionary *v83;
  NSMutableDictionary *mScreenObservationTimersBySessionIdentifier;
  void *v85;
  void *v86;
  STUIdleConnectionMonitor *v87;
  STUDevice *v88;
  STUConfigurationManager *v89;
  void *v90;
  void *v91;
  STUIdleConnectionMonitor *v92;
  STUIdleConnectionMonitor *idleConnectionMonitor;
  STUCoursePresenceTracker *v94;
  void *v95;
  STUCoursePresenceTracker *v96;
  STUCoursePresenceTracker *mCoursePresenceTracker;
  STUInstructorRoleManager *v98;
  void *v99;
  STUInstructorRoleManager *v100;
  STUInstructorRoleManager *mInstructorRoleManager;
  STUDevicePropertyObservationGatekeeper *v102;
  void *v103;
  STUDevicePropertyObservationGatekeeper *v104;
  STUDevicePropertyObservationGatekeeper *propertyObservationGatekeeper;
  STUClassSessionSnapshotManager *v106;
  STUClassSessionSnapshotManager *snapshotManager;
  STURestrictionUUIDKeeper *v108;
  void *v109;
  STURestrictionUUIDKeeper *v110;
  STURestrictionUUIDKeeper *restrictionUUIDKeeper;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  dispatch_queue_global_t global_queue;
  NSObject *v119;
  NSMutableDictionary *v120;
  NSMutableDictionary *transactionsBySessionUUID;
  CRKScreenshotServiceInterface *v122;
  CRKScreenshotServiceInterface *screenshotServiceProxy;
  STUApplicationWorkspace *v124;
  STUApplicationWorkspace *applicationWorkspace;
  STUSignInHistoryStorage *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  STUSignInHistoryStorage *v131;
  STUSignInHistoryStorage *signInHistoryStorage;
  STUClassKitReSyncer *v133;
  STUClassKitReSyncer *classKitReSyncer;
  id v136;
  id v137;
  STUPrivacyMigrationTaskProvider *v138;
  void *v139;
  STUASMCourseLibrary *v140;
  void *v141;
  _QWORD block[4];
  id v143;
  _QWORD v144[4];
  id v145;
  id location;
  objc_super v147;
  const __CFString *v148;
  _UNKNOWN **v149;

  v147.receiver = self;
  v147.super_class = (Class)STUDaemon;
  v2 = -[STUDaemon init](&v147, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primitives"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "whiteboard"));

    v6 = (void *)objc_opt_new(CRKFeatureFlagsFactory);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "makeFeatureFlags"));
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = (CRKFeatureFlags *)v7;

    v9 = [STUPrivacyMigrationTaskProvider alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileSystemPrimitives"));
    v138 = -[STUPrivacyMigrationTaskProvider initWithFileSystemPrimitives:](v9, "initWithFileSystemPrimitives:", v10);

    v11 = -[STUMigrationSession initWithMigrationTaskProvider:]([STUMigrationSession alloc], "initWithMigrationTaskProvider:", v138);
    -[STUDaemon setMigrationSession:](v2, "setMigrationSession:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon migrationSession](v2, "migrationSession"));
    objc_msgSend(v12, "setDelegate:", v2);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon migrationSession](v2, "migrationSession"));
    objc_msgSend(v13, "startMigration");

    -[STUDaemon deleteVestigialSettingsUIVisibiltyIndicatorFile](v2, "deleteVestigialSettingsUIVisibiltyIndicatorFile");
    v14 = [STUDebouncingAnalyticsPrimitives alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analyticsPrimitives"));
    v16 = -[STUDebouncingAnalyticsPrimitives initWithUnderlyingPrimitives:](v14, "initWithUnderlyingPrimitives:", v15);
    debouncingAnalyticsPrimitives = v2->_debouncingAnalyticsPrimitives;
    v2->_debouncingAnalyticsPrimitives = (STUAnalyticsPrimitives *)v16;

    v18 = -[STUDevice initWithPrimitives:]([STUDevice alloc], "initWithPrimitives:", v4);
    currentDevice = v2->_currentDevice;
    v2->_currentDevice = v18;

    -[STUDaemon setupSignalHandler](v2, "setupSignalHandler");
    if ((_set_user_dir_suffix("com.apple.studentd") & 1) == 0)
    {
      v20 = sub_10004A590();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10007C5F4();

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    objc_msgSend(v22, "registerUserSwitchStakeHolder:", v2);

    v23 = objc_opt_new(CATTaskServer);
    mServer = v2->mServer;
    v2->mServer = v23;

    -[CATTaskServer setDelegate:](v2->mServer, "setDelegate:", v2);
    v25 = objc_opt_new(CATOperationQueue);
    mOperationQueue = v2->mOperationQueue;
    v2->mOperationQueue = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "keychain"));
    keychain = v2->_keychain;
    v2->_keychain = (CRKKeychain *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "IDSPrimitives"));
    v31 = objc_claimAutoreleasedReturnValue(+[CRKPrimitiveBackedIDSMessageBroadcaster broadcasterWithIDSPrimitives:](CRKPrimitiveBackedIDSMessageBroadcaster, "broadcasterWithIDSPrimitives:", v30));
    IDSMessageBroadcaster = v2->_IDSMessageBroadcaster;
    v2->_IDSMessageBroadcaster = (CRKIDSMessageBroadcasting *)v31;

    v33 = objc_alloc((Class)CRKPrimitiveBackedCertificateConduit);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "IDSPrimitives"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "IDSAddressTranslator"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timerPrimitives"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
    v137 = objc_msgSend(v33, "initWithIDSPrimitives:addressTranslator:timerPrimitives:operationQueue:", v34, v35, v36, v37);

    v139 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon makeRosterProvider](v2, "makeRosterProvider"));
    v38 = [STUASMCourseLibrary alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "studentClassKitFacade"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "IDSPrimitives"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "IDSAddressTranslator"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "IDSCacheClearer"));
    v140 = -[STUASMCourseLibrary initWithRosterProvider:studentClassKitFacade:certificateConduit:IDSPrimitives:IDSAddressTranslator:IDSCacheClearer:device:](v38, "initWithRosterProvider:studentClassKitFacade:certificateConduit:IDSPrimitives:IDSAddressTranslator:IDSCacheClearer:device:", v139, v39, v137, v40, v41, v42, v2->_currentDevice);

    v43 = objc_claimAutoreleasedReturnValue(-[STUASMCourseLibrary makeClassSessionBrowser](v140, "makeClassSessionBrowser"));
    ASMClassSessionBrowser = v2->_ASMClassSessionBrowser;
    v2->_ASMClassSessionBrowser = (STUClassSessionBrowsing *)v43;

    -[STUClassSessionBrowsing setDelegate:](v2->_ASMClassSessionBrowser, "setDelegate:", v2);
    v45 = -[STUASMEventHandler initWithASMCourseLibrary:]([STUASMEventHandler alloc], "initWithASMCourseLibrary:", v140);
    ASMEventHandler = v2->_ASMEventHandler;
    v2->_ASMEventHandler = v45;

    v47 = (void *)objc_opt_new(CRKFeatureDataStoreProvider);
    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "makeFeatureDataStore"));
    featureDataStore = v2->_featureDataStore;
    v2->_featureDataStore = (CRKFeatureDataStoreProtocol *)v48;

    v50 = (void *)objc_opt_new(CRKClassroomLockScreenMonitorProvider);
    v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "makeMonitor"));
    lockScreenMonitor = v2->_lockScreenMonitor;
    v2->_lockScreenMonitor = (CRKClassroomLockScreenMonitoring *)v51;

    v136 = objc_msgSend(objc_alloc((Class)CRKASMRosterBackedAppleIDProvider), "initWithRosterProvider:", v139);
    v53 = objc_alloc((Class)CRKCertificateExchangeBroadcastHandler);
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "IDSPrimitives"));
    v55 = (CRKCertificateExchangeBroadcastHandler *)objc_msgSend(v53, "initWithIDSPrimitives:appleIDProvider:", v54, v136);
    certificateExchangeBroadcastHandler = v2->_certificateExchangeBroadcastHandler;
    v2->_certificateExchangeBroadcastHandler = v55;

    -[CRKCertificateExchangeBroadcastHandler setDelegate:](v2->_certificateExchangeBroadcastHandler, "setDelegate:", v140);
    -[CRKIDSMessageBroadcasting addBroadcastHandler:](v2->_IDSMessageBroadcaster, "addBroadcastHandler:", v2->_certificateExchangeBroadcastHandler);
    v57 = [STUConfigurationManager alloc];
    v58 = v2->_featureDataStore;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mobileKeyBagPrimitives"));
    v60 = -[STUConfigurationManager initWithASMCourseLibrary:featureDataStore:mobileKeyBagPrimitives:](v57, "initWithASMCourseLibrary:featureDataStore:mobileKeyBagPrimitives:", v140, v58, v59);
    configurationManager = v2->_configurationManager;
    v2->_configurationManager = v60;

    v62 = -[STUServerResourceCache initWithConfigurationManager:]([STUServerResourceCache alloc], "initWithConfigurationManager:", v2->_configurationManager);
    serverResourceCache = v2->_serverResourceCache;
    v2->_serverResourceCache = v62;

    v64 = -[STUActivityUI initWithPrimitives:device:]([STUActivityUI alloc], "initWithPrimitives:device:", v4, v2->_currentDevice);
    activityUI = v2->_activityUI;
    v2->_activityUI = v64;

    v66 = -[STUDevicePropertyObserver initWithDevice:]([STUDevicePropertyObserver alloc], "initWithDevice:", v2->_currentDevice);
    mPropertyObserver = v2->mPropertyObserver;
    v2->mPropertyObserver = v66;

    -[STUDevicePropertyObserver setDelegate:](v2->mPropertyObserver, "setDelegate:", v2);
    v68 = objc_opt_new(NSMutableDictionary);
    mSubscriptionContextsBySessionUUID = v2->mSubscriptionContextsBySessionUUID;
    v2->mSubscriptionContextsBySessionUUID = v68;

    v70 = objc_claimAutoreleasedReturnValue(+[STUPermanentTokenAuthenticator sharedInstance](STUPermanentTokenAuthenticator, "sharedInstance"));
    mSessionTokenAuthenticator = v2->mSessionTokenAuthenticator;
    v2->mSessionTokenAuthenticator = (STUPermanentTokenAuthenticator *)v70;

    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "XPCPrimitives"));
    v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "listenerForMachServiceName:", CFSTR("com.apple.studentd")));
    mListener = v2->mListener;
    v2->mListener = (NSXPCListener *)v73;

    -[NSXPCListener setDelegate:](v2->mListener, "setDelegate:", v2);
    v75 = objc_opt_new(CRKClassSessionBrowser);
    mSessionBrowser = v2->mSessionBrowser;
    v2->mSessionBrowser = v75;

    -[CRKClassSessionBrowser setDelegate:](v2->mSessionBrowser, "setDelegate:", v2);
    v77 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    mSessionIdentifiersByTransport = v2->mSessionIdentifiersByTransport;
    v2->mSessionIdentifiersByTransport = (NSMapTable *)v77;

    v79 = objc_opt_new(NSMutableSet);
    quarantinedIDSSessionIdentifiers = v2->_quarantinedIDSSessionIdentifiers;
    v2->_quarantinedIDSSessionIdentifiers = v79;

    v81 = -[STUInvitationSessionManager initWithConfigurationManager:daemon:device:]([STUInvitationSessionManager alloc], "initWithConfigurationManager:daemon:device:", v2->_configurationManager, v2, v2->_currentDevice);
    mInvitationSessionManager = v2->mInvitationSessionManager;
    v2->mInvitationSessionManager = v81;

    -[STUInvitationSessionManager setSessionBrowser:](v2->mInvitationSessionManager, "setSessionBrowser:", v2->mSessionBrowser);
    -[STUInvitationSessionManager addObserver:forKeyPath:options:context:](v2->mInvitationSessionManager, "addObserver:forKeyPath:options:context:", v2, CFSTR("acceptedInvitationIdentifiers"), 0, CFSTR("STUDaemonObservationContext"));
    v83 = objc_opt_new(NSMutableDictionary);
    mScreenObservationTimersBySessionIdentifier = v2->mScreenObservationTimersBySessionIdentifier;
    v2->mScreenObservationTimersBySessionIdentifier = v83;

    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v148 = CFSTR("DisconnectedSessionTimeout");
    v149 = &off_1000D42B8;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1));
    objc_msgSend(v85, "registerDefaults:", v86);

    -[STUDaemon initializeEventRecorder](v2, "initializeEventRecorder");
    v87 = [STUIdleConnectionMonitor alloc];
    v88 = v2->_currentDevice;
    v89 = v2->_configurationManager;
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timerPrimitives"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](v2, "monotonicClock"));
    v92 = -[STUIdleConnectionMonitor initWithDaemon:device:configurationManager:timerPrimitives:dateProvider:](v87, "initWithDaemon:device:configurationManager:timerPrimitives:dateProvider:", v2, v88, v89, v90, v91);
    idleConnectionMonitor = v2->_idleConnectionMonitor;
    v2->_idleConnectionMonitor = v92;

    v94 = [STUCoursePresenceTracker alloc];
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](v2, "monotonicClock"));
    v96 = -[STUCoursePresenceTracker initWithDateProvider:](v94, "initWithDateProvider:", v95);
    mCoursePresenceTracker = v2->mCoursePresenceTracker;
    v2->mCoursePresenceTracker = v96;

    v98 = [STUInstructorRoleManager alloc];
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchServicesPrimitives"));
    v100 = -[STUInstructorRoleManager initWithLSPrimitives:featureDataStore:](v98, "initWithLSPrimitives:featureDataStore:", v99, v2->_featureDataStore);
    mInstructorRoleManager = v2->mInstructorRoleManager;
    v2->mInstructorRoleManager = v100;

    v102 = [STUDevicePropertyObservationGatekeeper alloc];
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "XPCPrimitives"));
    v104 = -[STUDevicePropertyObservationGatekeeper initWithXPCPrimitives:device:](v102, "initWithXPCPrimitives:device:", v103, v2->_currentDevice);
    propertyObservationGatekeeper = v2->_propertyObservationGatekeeper;
    v2->_propertyObservationGatekeeper = v104;

    v106 = objc_opt_new(STUClassSessionSnapshotManager);
    snapshotManager = v2->_snapshotManager;
    v2->_snapshotManager = v106;

    -[STUClassSessionSnapshotManager setDelegate:](v2->_snapshotManager, "setDelegate:", v2);
    v108 = [STURestrictionUUIDKeeper alloc];
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[STUExclusiveOperationManager sharedManager](STUExclusiveOperationManager, "sharedManager"));
    v110 = -[STURestrictionUUIDKeeper initWithExclusiveOperationManager:](v108, "initWithExclusiveOperationManager:", v109);
    restrictionUUIDKeeper = v2->_restrictionUUIDKeeper;
    v2->_restrictionUUIDKeeper = v110;

    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v112, "addObserver:selector:name:object:", v2, "permissionsDidChange:", CRKStudentPermissionsDidChangeNotificationName, 0);

    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v113, "addObserver:selector:name:object:", v2, "scheduleConfigurationDidChangeNotification", CFSTR("STUConfigurationManagerDidUpdateConfigurationNotificationName"), 0);

    v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v114, "addObserver:selector:name:object:", v2, "localeDidChange:", NSCurrentLocaleDidChangeNotification, 0);

    v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v115, "addObserver:selector:name:object:", v2, "adHocInvitationsDidChange:", CRKCourseInvitationsUpdatedNotificationName, 0);

    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v116, "addObserver:selector:name:object:", v2, "signInHistoryDidChange:", CRKMAIDSignInHistoryDidChangeNotificationName, 0);

    +[CRKRestrictionsObserver addRestrictionsObserver:](CRKRestrictionsObserver, "addRestrictionsObserver:", v2);
    -[STUDaemon updateSessionBrowser](v2, "updateSessionBrowser");
    objc_initWeak(&location, v2);
    v117 = &_dispatch_main_q;
    v144[0] = _NSConcreteStackBlock;
    v144[1] = 3221225472;
    v144[2] = sub_10004A5D0;
    v144[3] = &unk_1000CB050;
    objc_copyWeak(&v145, &location);
    v2->mLoggingStateHandle = CRKLogAddStateHandler(&_dispatch_main_q, CFSTR("studentd State"), v144);

    global_queue = dispatch_get_global_queue(0, 0);
    v119 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A608;
    block[3] = &unk_1000C9F38;
    objc_copyWeak(&v143, &location);
    dispatch_async(v119, block);

    v120 = objc_opt_new(NSMutableDictionary);
    transactionsBySessionUUID = v2->_transactionsBySessionUUID;
    v2->_transactionsBySessionUUID = v120;

    v122 = (CRKScreenshotServiceInterface *)objc_msgSend(objc_alloc((Class)CRKDeadmanScreenshotServiceProxy), "initWithTimeout:", 5.0);
    screenshotServiceProxy = v2->_screenshotServiceProxy;
    v2->_screenshotServiceProxy = v122;

    v124 = -[STUApplicationWorkspace initWithPrimitives:device:]([STUApplicationWorkspace alloc], "initWithPrimitives:device:", v4, v2->_currentDevice);
    applicationWorkspace = v2->_applicationWorkspace;
    v2->_applicationWorkspace = v124;

    v126 = [STUSignInHistoryStorage alloc];
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileSystemPrimitives"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountsPrimitives"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osTransactionPrimitives"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timerPrimitives"));
    v131 = -[STUSignInHistoryStorage initWithFileSystemPrimitives:accountPrimitives:transactionPrimitives:timerPrimitives:limit:](v126, "initWithFileSystemPrimitives:accountPrimitives:transactionPrimitives:timerPrimitives:limit:", v127, v128, v129, v130, 500);
    signInHistoryStorage = v2->_signInHistoryStorage;
    v2->_signInHistoryStorage = v131;

    v133 = objc_opt_new(STUClassKitReSyncer);
    classKitReSyncer = v2->_classKitReSyncer;
    v2->_classKitReSyncer = v133;

    objc_destroyWeak(&v143);
    objc_destroyWeak(&v145);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)deleteVestigialSettingsUIVisibiltyIndicatorFile
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;

  if (CRKIsOSX(self, a2))
  {
    v2 = (void *)objc_opt_new(CRKSettingsUIVisibilityIndicatorFile);
    v7 = 0;
    v3 = objc_msgSend(v2, "deleteWithError:", &v7);
    v4 = v7;

    if ((v3 & 1) == 0)
    {
      v5 = sub_10004A590();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10007C66C(v4);

    }
  }
}

- (id)makeRosterProvider
{
  void *v2;
  unsigned __int8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "crk_isBeingTested");

  if ((v3 & 1) != 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "whiteboard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "IDSPrimitives"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primitives"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "IDSAddressTranslator"));

  v11 = objc_alloc((Class)CRKASMSuspendableRosterProvider);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004A824;
  v15[3] = &unk_1000CB078;
  v16 = v7;
  v17 = v10;
  v12 = v10;
  v13 = v7;
  v14 = objc_msgSend(v11, "initWithGenerator:", v15);

  return v14;
}

- (void)initializeEventRecorder
{
  NSArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  NSObject *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  STUSQLiteEventStore *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  STUOldEventPruningStore *v38;
  void *v39;
  STUOldEventPruningStore *v40;
  void *v41;
  STUEventStoreProtocol *mEventStore;
  STUOldEventPruningStore *v43;
  STUEventRecorder *v44;
  void *v45;
  STUEventStoreProtocol *v46;
  void *v47;
  STUEventRecorder *v48;
  STUEventRecorder *mEventRecorder;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;

  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("studentd")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "URLByAppendingPathComponent:", CFSTR("LogEvents.db")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v56 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "crk_safeRemoveItemAtURL:error:", v7, &v56);
  v9 = v56;

  if ((v6 & 1) == 0)
  {
    v10 = sub_10004A590();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10007C87C(v7);

  }
  v51 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager eventDatabaseDirectoryURL](NSFileManager, "eventDatabaseDirectoryURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v55 = v9;
  v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v55);
  v15 = v55;

  if ((v14 & 1) == 0)
  {
    v16 = sub_10004A590();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10007C7EC(v12);

  }
  v54 = v15;
  v18 = objc_msgSend(v12, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v54);
  v19 = v54;

  if ((v18 & 1) == 0)
  {
    v20 = sub_10004A590();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10007C75C(v12);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("LogEvents.db")));
  v22 = -[STUSQLiteEventStore initWithDatabaseURL:]([STUSQLiteEventStore alloc], "initWithDatabaseURL:", v50);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v24 = (id)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](self, "monotonicClock"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sessionToken"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringForKey:", CFSTR("LastDateProviderSessionToken")));
  v27 = v25;
  v28 = v26;
  if (!(v27 | v28))
    goto LABEL_19;
  v29 = (void *)v28;
  v30 = objc_msgSend((id)v27, "isEqual:", v28);

  if ((v30 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](self, "monotonicClock"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sessionToken"));
    objc_msgSend(v23, "setObject:forKey:", v32, CFSTR("LastDateProviderSessionToken"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](self, "monotonicClock"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "distantFuture"));
    v53 = 0;
    v35 = -[STUSQLiteEventStore purgeEventsBeforeDate:error:](v22, "purgeEventsBeforeDate:error:", v34, &v53);
    v24 = v53;

    if ((v35 & 1) == 0)
    {
      v36 = sub_10004A590();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_10007C6E4(v24);

    }
LABEL_19:

  }
  v38 = [STUOldEventPruningStore alloc];
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](self, "monotonicClock"));
  v40 = -[STUOldEventPruningStore initWithUnderlyingStore:dateProvider:maximumEventAge:](v38, "initWithUnderlyingStore:dateProvider:maximumEventAge:", v22, v39, 18000.0);

  -[STUOldEventPruningStore pruneOldEvents](v40, "pruneOldEvents");
  v41 = v19;
  mEventStore = self->mEventStore;
  self->mEventStore = (STUEventStoreProtocol *)v40;
  v43 = v40;

  v44 = [STUEventRecorder alloc];
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon currentDevice](self, "currentDevice"));
  v46 = self->mEventStore;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](self, "monotonicClock"));
  v48 = -[STUEventRecorder initWithDevice:store:dateProvider:](v44, "initWithDevice:store:dateProvider:", v45, v46, v47);
  mEventRecorder = self->mEventRecorder;
  self->mEventRecorder = v48;

  -[STUEventRecorder setDelegate:](self->mEventRecorder, "setDelegate:", self);
}

- (void)invalidate
{
  STUEventRecorder *mEventRecorder;
  STUEventStoreProtocol *mEventStore;

  mEventRecorder = self->mEventRecorder;
  self->mEventRecorder = 0;

  mEventStore = self->mEventStore;
  self->mEventStore = 0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CRKRestrictionsObserver removeRestrictionsObserver:](CRKRestrictionsObserver, "removeRestrictionsObserver:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  CRKLogRemoveStateHandler(self->mLoggingStateHandle);
  -[CATTaskServer invalidate](self->mServer, "invalidate");
  -[STUInvitationSessionManager removeObserver:forKeyPath:context:](self->mInvitationSessionManager, "removeObserver:forKeyPath:context:", self, CFSTR("acceptedInvitationIdentifiers"), CFSTR("STUDaemonObservationContext"));
  v4.receiver = self;
  v4.super_class = (Class)STUDaemon;
  -[STUDaemon dealloc](&v4, "dealloc");
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_autoreleasePoolPush();
  -[NSXPCListener resume](self->mListener, "resume");
  objc_autoreleasePoolPop(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primitives"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "XPCPrimitives"));

  objc_msgSend(v6, "registerHandlerForNotificationEventStream:", &stru_1000CB0B8);
  objc_msgSend(v6, "registerHandlerForFilePathKeepAliveEventStream:", &stru_1000CB0D8);

}

- (id)stateDictionary
{
  NSMutableDictionary *v3;
  NSMutableArray *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v6 = objc_msgSend(v5, "isAdHoc");

  if (v6)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("ADHOC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v8 = objc_msgSend(v7, "isManaged");

  if (v8)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("MANAGED"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v10 = objc_msgSend(v9, "isASM");

  if (v10)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("ASM"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v12 = objc_msgSend(v11, "isDisabled");

  if (v12)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("NONE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR("|")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, CFSTR("Configuration"));

  if (-[CRKClassSessionBrowser isBrowsing](self->mSessionBrowser, "isBrowsing"))
    v14 = CFSTR("ON");
  else
    v14 = CFSTR("OFF");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, CFSTR("Browser"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon ASMClassSessionBrowser](self, "ASMClassSessionBrowser"));
  if (objc_msgSend(v15, "isBrowsing"))
    v16 = CFSTR("ON");
  else
    v16 = CFSTR("OFF");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, CFSTR("ASMBrowser"));

  if (-[CRKClassSessionBrowser isBrowsing](self->mSessionBrowser, "isBrowsing"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRKClassSessionBrowser browserStateDictionary](self->mSessionBrowser, "browserStateDictionary"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v22));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v23, v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v19);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRKClassSessionBrowser stateDictionariesByClassSessionIdentifierString](self->mSessionBrowser, "stateDictionariesByClassSessionIdentifierString"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v29));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v30, v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v26);
    }

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v32 = objc_msgSend(v31, "hasIdentities");

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v34 = objc_msgSend(v33, "isInstructorOnEDU");

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "organizationUUIDs"));
    v37 = objc_msgSend(v36, "count");

    v40 = CFSTR("NO SSL IDENTITY");
    if (v34)
      v40 = CFSTR("INSTRUCTOR IDENTITY ON SHARED DEVICE");
    if (v37)
      v41 = v40;
    else
      v41 = CFSTR("NOT CONFIGURED");
    if (v37 && (v34 & 1) == 0 && v32)
    {
      if (CRKIsiOS(v38, v39) && !objc_msgSend(v17, "isSupervised"))
      {
        v41 = CFSTR("NOT SUPERVISED");
      }
      else if (objc_msgSend(v17, "EDUPayloadInstalledByUserEnrollment"))
      {
        v41 = CFSTR("EDU PAYLOAD INSTALLED BY USER ENROLLMENT");
      }
      else
      {
        v41 = CFSTR("UNKNOWN");
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v41, CFSTR("Reason"));
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon idleStateProvider](self, "idleStateProvider"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v42, "isIdle")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v43, CRKIdleStateKey);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUEventRecorder isRecording](self->mEventRecorder, "isRecording")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v44, CRKEventRecordingKey);

  return v3;
}

- (id)activeCourseIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon activeSessionIdentifiers](self, "activeSessionIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("groupIdentifier")));

  return v3;
}

- (id)activeInstructorIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon activeInstructorUsers](self, "activeInstructorUsers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("userIdentifier")));

  return v3;
}

- (id)classSessionGenerationTokens
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon exposableClientSessions](self, "exposableClientSessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crk_mapUsingBlock:", &stru_1000CB118));

  return v3;
}

- (void)acquireDaemonActivityAssertion
{
  uint64_t v3;
  void *v4;

  v3 = CATGetCatalystQueue(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  CATAssertIsQueue();

  ++self->mDaemonActivityAssertionCount;
}

- (void)releaseDaemonActivityAssertion
{
  uint64_t v3;
  void *v4;

  v3 = CATGetCatalystQueue(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  CATAssertIsQueue();

  --self->mDaemonActivityAssertionCount;
}

- (void)acquireConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = CATGetCatalystQueue(v7, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  CATAssertIsQueue();

  -[CRKClassSessionBrowser acquireConnectWithoutBeaconAssertionForSessionIdentifier:](self->mSessionBrowser, "acquireConnectWithoutBeaconAssertionForSessionIdentifier:", v7);
}

- (void)releaseConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = CATGetCatalystQueue(v7, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  CATAssertIsQueue();

  -[CRKClassSessionBrowser releaseConnectWithoutBeaconAssertionForSessionIdentifier:](self->mSessionBrowser, "releaseConnectWithoutBeaconAssertionForSessionIdentifier:", v7);
}

- (void)acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = CATGetCatalystQueue(v7, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  CATAssertIsQueue();

  -[CRKClassSessionBrowser acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:](self->mSessionBrowser, "acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:", v7);
}

- (void)releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = CATGetCatalystQueue(v7, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  CATAssertIsQueue();

  -[CRKClassSessionBrowser releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:](self->mSessionBrowser, "releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:", v7);
}

- (id)eventLogSinceDate:(id)a3 error:(id *)a4
{
  id v7;
  STUEventStoreProtocol *mEventStore;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  NSString *v14;
  void *v15;

  v7 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 600, CFSTR("%@ must be called from the main thread"), v15);

  }
  mEventStore = self->mEventStore;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](self, "monotonicClock"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUEventStoreProtocol eventLogWithStartDate:endDate:error:](mEventStore, "eventLogWithStartDate:endDate:error:", v7, v10, a4));

  return v11;
}

- (id)identifierForSession:(id)a3
{
  NSMapTable *mSessionIdentifiersByTransport;
  void *v4;
  void *v5;

  mSessionIdentifiersByTransport = self->mSessionIdentifiersByTransport;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "transport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mSessionIdentifiersByTransport, "objectForKey:", v4));

  return v5;
}

- (void)fetchMeCard:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  id v6;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRKUser stu_sharedMeCardUserProvider](CRKUser, "stu_sharedMeCardUserProvider"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "user"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryValue"));
  v3[2](v3, v5, 0);

}

- (STUIdleStateProviding)idleStateProvider
{
  STUIdleStateProviding *idleStateProvider;
  STUIdleStateProviding *v3;

  idleStateProvider = self->_idleStateProvider;
  if (idleStateProvider)
    v3 = idleStateProvider;
  return idleStateProvider;
}

- (void)fetchImageDataForUser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon serverResourceCache](self, "serverResourceCache"));
      objc_msgSend(v10, "fetchResourceFromURL:completion:", v9, v7);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageIdentifier"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageIdentifier"));
        v16 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userImageDataWithIdentifier:error:", v13, &v16));
        v15 = v16;

        v7[2](v7, v14, v15);
      }
      else
      {
        v7[2](v7, 0, 0);
      }
    }

  }
}

- (id)enrollmentRecordForSession:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon enrollmentRecordForSessionIdentifier:error:](self, "enrollmentRecordForSessionIdentifier:error:", v6, a4));

  return v7;
}

- (id)enrollmentRecordForSessionIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v16;
  const __CFString *v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enrollmentRecordWithIdentifier:", v8));

  if (a4 && !v9)
  {
    v16 = CFSTR("kCRKSessionIdentifierStringErrorKey");
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
    v11 = (void *)v10;
    v12 = CFSTR("<nil>");
    if (v10)
      v12 = (const __CFString *)v10;
    v17 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v14 = CRKErrorWithCodeAndUserInfo(14, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v14);

  }
  return v9;
}

- (void)allowManagementForSessionWithIdentifier:(id)a3
{
  STUCoursePresenceTracker *mCoursePresenceTracker;
  void *v5;
  id v6;

  mCoursePresenceTracker = self->mCoursePresenceTracker;
  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  -[STUCoursePresenceTracker foundCourseIdentifier:](mCoursePresenceTracker, "foundCourseIdentifier:", v5);

  -[STUEventRecorder startRecording](self->mEventRecorder, "startRecording");
  -[STUEventRecorder recordCurrentState](self->mEventRecorder, "recordCurrentState");
  -[STUDaemon unquarantineIDSSessionIdentifier:](self, "unquarantineIDSSessionIdentifier:", v6);

}

- (id)courseInvitations
{
  return -[STUInvitationSessionManager courseInvitations](self->mInvitationSessionManager, "courseInvitations");
}

- (id)acceptedInvitationIdentifiers
{
  return -[STUInvitationSessionManager acceptedInvitationIdentifiers](self->mInvitationSessionManager, "acceptedInvitationIdentifiers");
}

- (void)startBrowsingForCourseInvitations
{
  id v4;
  NSObject *v5;
  unint64_t mCourseInvitationBrowseReferenceCount;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t buf[4];
  unint64_t v11;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 676, CFSTR("%@ must be called from the main thread"), v9);

  }
  ++self->mCourseInvitationBrowseReferenceCount;
  -[STUDaemon updateSessionBrowser](self, "updateSessionBrowser");
  v4 = sub_10004A590();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    mCourseInvitationBrowseReferenceCount = self->mCourseInvitationBrowseReferenceCount;
    *(_DWORD *)buf = 134217984;
    v11 = mCourseInvitationBrowseReferenceCount;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "INCREMENT invitation browser reference count: %lu", buf, 0xCu);
  }

}

- (void)stopBrowsingForCourseInvitations
{
  unint64_t mCourseInvitationBrowseReferenceCount;
  id v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  unint64_t v13;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 685, CFSTR("%@ must be called from the main thread"), v10);

  }
  mCourseInvitationBrowseReferenceCount = self->mCourseInvitationBrowseReferenceCount;
  if (!mCourseInvitationBrowseReferenceCount)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 686, CFSTR("Not browsing for course invitations"));

    mCourseInvitationBrowseReferenceCount = self->mCourseInvitationBrowseReferenceCount;
  }
  self->mCourseInvitationBrowseReferenceCount = mCourseInvitationBrowseReferenceCount - 1;
  -[STUDaemon updateSessionBrowser](self, "updateSessionBrowser");
  v5 = sub_10004A590();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self->mCourseInvitationBrowseReferenceCount;
    *(_DWORD *)buf = 134217984;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "DECREMENT invitation browser reference count: %lu", buf, 0xCu);
  }

}

- (BOOL)acceptCourseInvitationWithIdentifier:(id)a3 pin:(id)a4 studentInformation:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v16;
  NSString *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 695, CFSTR("%@ must be called from the main thread"), v18);

  }
  v14 = -[STUInvitationSessionManager acceptCourseInvitationWithIdentifier:pin:studentInformation:error:](self->mInvitationSessionManager, "acceptCourseInvitationWithIdentifier:pin:studentInformation:error:", v11, v12, v13, a6);

  return v14;
}

- (id)IDSTaskSessions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon exposableClientSessions](self, "exposableClientSessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crk_filterUsingBlock:", &stru_1000CB158));

  return v3;
}

- (id)exposableClientSessions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSMutableArray *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v16 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager courseInvitations](self->mInvitationSessionManager, "courseInvitations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crk_mapUsingBlock:", &stru_1000CB198));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CATTaskServer connectedClientSessions](self->mServer, "connectedClientSessions"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon enrollmentRecordForSession:error:](self, "enrollmentRecordForSession:error:", v10, 0));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if (v12
          && ((objc_msgSend(v12, "isHidden") | v14) & 1) == 0
          && -[STUDaemon isBonafideClassSession:](self, "isBonafideClassSession:", v10))
        {
          -[NSMutableArray addObject:](v16, "addObject:", v10);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v16;
}

- (id)activeSessionIdentifiers
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon exposableClientSessions](self, "exposableClientSessions", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)));
        if (v9)
          -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)activeInstructorUsersBySession
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon exposableClientSessions](self, "exposableClientSessions", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v9));
        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stu_info"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instructorIdentifier"));

          v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon instructorUserWithIdentifier:forSessionWithIdentifier:](self, "instructorUserWithIdentifier:forSessionWithIdentifier:", v12, v10));
          if (v13)
            objc_msgSend(v3, "setObject:forKey:", v13, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)instructorUserWithIdentifier:(id)a3 forSessionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enrollmentRecordWithIdentifier:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instructorsByIdentifier"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));

    if (!v12)
    {
      v13 = objc_alloc((Class)CRKUser);
      v20[0] = kCRKAdHocConfigurationStudentIdentifierKey;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      v21[0] = v14;
      v20[1] = kCRKAdHocConfigurationStudentDisplayNameKey;
      v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Teacher"), &stru_1000CDD50, 0));
      v21[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      v12 = objc_msgSend(v13, "initWithDictionary:", v18);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)activeInstructorUsers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon activeInstructorUsersBySession](self, "activeInstructorUsersBySession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectEnumerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return v4;
}

- (void)fetchActiveInstructorsIncludingImages:(BOOL)a3 includeIdleInstructors:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon makeOperationsToGenerateActiveInstructorsIncludingImages:](self, "makeOperationsToGenerateActiveInstructorsIncludingImages:", v6));
    if (v5)
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon makeOperationsToGenerateIdleInstructorsIncludingImages:](self, "makeOperationsToGenerateIdleInstructorsIncludingImages:", v6));
    else
      v10 = &__NSArray0__struct;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon generateInstructorOperationsByUnioningActiveOperations:andIdleOperations:](self, "generateInstructorOperationsByUnioningActiveOperations:andIdleOperations:", v9, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
    objc_msgSend(v12, "addOperations:waitUntilFinished:", v11, 0);

    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_10004C90C;
    v19 = &unk_1000CAF70;
    v20 = v11;
    v21 = v8;
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v16));
    objc_msgSend(v14, "cat_addDependencies:", v13, v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    objc_msgSend(v15, "addOperation:", v14);

  }
}

- (BOOL)postNotificationToSessionWithIdentifier:(id)a3 name:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskServer connectedClientSessions](self->mServer, "connectedClientSessions", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v16));
        v18 = v17;
        if (v17 && objc_msgSend(v17, "isEqual:", v8))
        {
          objc_msgSend(v16, "postNotificationWithName:userInfo:", v9, v10);

          v19 = 1;
          goto LABEL_12;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_12:

  return v19;
}

- (void)disconnectIDSSessionWithCourseIdentifier:(id)a3 instructorIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 836, CFSTR("%@ must be called from the main thread"), v15);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskServer connectedClientSessions](self->mServer, "connectedClientSessions"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004CDEC;
  v16[3] = &unk_1000CB1C0;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v10 = v8;
  v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crk_filterUsingBlock:", v16));

  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &stru_1000CB200);
}

- (void)setupSignalHandler
{
  OS_dispatch_source *v3;
  OS_dispatch_source *mSIGTERMSource;
  NSObject *v5;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->mSIGTERMSource)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 854, CFSTR("SIGTERM source should only be setup once."));

  }
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  mSIGTERMSource = self->mSIGTERMSource;
  self->mSIGTERMSource = v3;

  objc_initWeak(&location, self);
  v5 = self->mSIGTERMSource;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D018;
  v8[3] = &unk_1000C9F38;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v5, v8);
  dispatch_resume((dispatch_object_t)self->mSIGTERMSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateSessionBrowser
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  int v24;
  void *v25;
  unsigned int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v33;
  int v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned __int8 v60;
  uint64_t v61;
  void *v62;
  void *v63;
  unsigned int v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  void *v69;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[STUDaemon performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
    return;
  }
  v4 = sub_10004A590();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupEnrollmentRecords"));
    *(_DWORD *)buf = 138543362;
    v69 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Student configuration did change: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v10 = objc_msgSend(v9, "hasIdentities");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v12 = objc_msgSend(v11, "isInstructorOnEDU");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "organizationUUIDs"));
  v15 = objc_msgSend(v14, "count");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager acceptedInvitationIdentifiers](self->mInvitationSessionManager, "acceptedInvitationIdentifiers"));
  v17 = (unint64_t)objc_msgSend(v16, "count");

  v18 = objc_msgSend(v8, "isSupervised");
  if (v15)
    v19 = v18;
  else
    v19 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v21 = objc_msgSend(v20, "isASM");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v23 = objc_msgSend(v22, "isAdHoc");

  v24 = v21 | v23;
  if (self->mCourseInvitationBrowseReferenceCount)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v26 = objc_msgSend(v25, "isDisabled");

  }
  else
  {
    v26 = 0;
  }
  v27 = v19 | v24;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "adHocBaseUserIdentifier"));

  if (v29)
  {
    v66 = CRKTaskServerBaseStudentIdentifierUserInfoKey;
    v67 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    -[CATTaskServer setUserInfo:](self->mServer, "setUserInfo:", v30);

  }
  else
  {
    -[CATTaskServer setUserInfo:](self->mServer, "setUserInfo:", 0);
  }
  v31 = -[STUInvitationSessionManager setAdHocBaseUserIdentifier:](self->mInvitationSessionManager, "setAdHocBaseUserIdentifier:", v29);
  v33 = v27 | v26;
  if (v17)
    v33 = 1;
  v34 = v33 & v10 ^ 1 | v12;
  if ((v34 & 1) == 0)
  {
    v42 = sub_10004A590();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Starting session browser", buf, 2u);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "organizationUUIDs"));
    -[CRKClassSessionBrowser setOrganizationUUIDs:](self->mSessionBrowser, "setOrganizationUUIDs:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "enrolledControlGroupIdentifiers"));
    -[CRKClassSessionBrowser setEnrolledControlGroupIdentifiers:](self->mSessionBrowser, "setEnrolledControlGroupIdentifiers:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    if ((objc_msgSend(v48, "isSharedIPad") & 1) != 0)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "currentUser"));
      -[CRKClassSessionBrowser setAllowUnenrolledSessions:](self->mSessionBrowser, "setAllowUnenrolledSessions:", objc_msgSend(v50, "isLoginUser"));

    }
    else
    {
      -[CRKClassSessionBrowser setAllowUnenrolledSessions:](self->mSessionBrowser, "setAllowUnenrolledSessions:", 0);
    }

    -[CRKClassSessionBrowser setAllowInvitationSessions:](self->mSessionBrowser, "setAllowInvitationSessions:", (self->mCourseInvitationBrowseReferenceCount | v17) != 0);
    -[CRKClassSessionBrowser startBrowsing](self->mSessionBrowser, "startBrowsing");
    goto LABEL_46;
  }
  if (CRKIsiOS(v31, v32) && (objc_msgSend(v8, "isSupervised") & 1) == 0)
  {
    v35 = sub_10004A590();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10007C9BC();

  }
  if (objc_msgSend(v8, "EDUPayloadInstalledByUserEnrollment"))
  {
    v37 = sub_10004A590();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_10007C990();

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "organizationUUIDs"));
  v41 = objc_msgSend(v40, "count");

  if (v41)
  {
    if ((v10 & 1) != 0)
      goto LABEL_28;
LABEL_39:
    v53 = sub_10004A590();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_10007C938();

    if (!v12)
      goto LABEL_45;
    goto LABEL_42;
  }
  v51 = sub_10004A590();
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    sub_10007C964();

  if ((v10 & 1) == 0)
    goto LABEL_39;
LABEL_28:
  if (v12)
  {
LABEL_42:
    v55 = sub_10004A590();
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_10007C90C();

  }
LABEL_45:
  -[CRKClassSessionBrowser stopBrowsing](self->mSessionBrowser, "stopBrowsing");
  -[CRKClassSessionBrowser setAllowInvitationSessions:](self->mSessionBrowser, "setAllowInvitationSessions:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  -[CRKClassSessionBrowser setOrganizationUUIDs:](self->mSessionBrowser, "setOrganizationUUIDs:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  -[CRKClassSessionBrowser setEnrolledControlGroupIdentifiers:](self->mSessionBrowser, "setEnrolledControlGroupIdentifiers:", v58);

LABEL_46:
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v60 = objc_msgSend(v59, "configurationType");

  if ((v60 & 4) != 0)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon ASMClassSessionBrowser](self, "ASMClassSessionBrowser"));
    objc_msgSend(v62, "resume");
    v61 = 1;
  }
  else
  {
    v61 = v34 ^ 1u;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon ASMClassSessionBrowser](self, "ASMClassSessionBrowser"));
    objc_msgSend(v62, "suspend");
  }

  -[STUDaemon updateKeepAliveFile:](self, "updateKeepAliveFile:", v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration"));
  v64 = objc_msgSend(v63, "isEphemeralMultiUser");

  if (v64)
    v65 = "com.apple.classroom.recvbg.enabled";
  else
    v65 = "com.apple.classroom.recvbg.disabled";
  notify_post(v65);

}

- (void)updateKeepAliveFile:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_opt_new(CRKStudentKeepAliveFile);
  v5 = v4;
  if (v3)
  {
    v13 = 0;
    v6 = objc_msgSend(v4, "createWithError:", &v13);
    v7 = v13;
    if ((v6 & 1) == 0)
    {
      v8 = sub_10004A590();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10007C9E8(v7);
LABEL_8:

    }
  }
  else
  {
    v12 = 0;
    v10 = objc_msgSend(v4, "deleteWithError:", &v12);
    v7 = v12;
    if ((v10 & 1) == 0)
    {
      v11 = sub_10004A590();
      v9 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10007CA60(v7);
      goto LABEL_8;
    }
  }

}

- (void)scheduleConfigurationDidChangeNotification
{
  NSTimer *v3;
  NSTimer *mConfigurationNotificationTimer;

  -[STUDaemon postConfigurationDidChangeXPCNotification](self, "postConfigurationDidChangeXPCNotification");
  -[STUDaemon postActiveInstructorsDidChangeXPCNotification](self, "postActiveInstructorsDidChangeXPCNotification");
  -[NSTimer invalidate](self->mConfigurationNotificationTimer, "invalidate");
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "configurationDidChange", 0, 0, 1.0));
  mConfigurationNotificationTimer = self->mConfigurationNotificationTimer;
  self->mConfigurationNotificationTimer = v3;

}

- (void)configurationDidChange
{
  NSTimer *mConfigurationNotificationTimer;
  void *v4;
  unsigned int v5;
  void *v6;

  -[NSTimer invalidate](self->mConfigurationNotificationTimer, "invalidate");
  mConfigurationNotificationTimer = self->mConfigurationNotificationTimer;
  self->mConfigurationNotificationTimer = 0;

  notify_post("com.apple.studentd.configuration.didchange");
  -[STUDaemon updateSessionBrowser](self, "updateSessionBrowser");
  -[STUDaemon invalidateUnenrollmentRequestsIfNeeded](self, "invalidateUnenrollmentRequestsIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v5 = objc_msgSend(v4, "isManaged");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon serverResourceCache](self, "serverResourceCache"));
    objc_msgSend(v6, "removeAllCachedResources");

  }
  -[STUDaemon recalculateUsageMetrics](self, "recalculateUsageMetrics");
}

- (void)recalculateUsageMetrics
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_recalculateUsageMetrics", 0);
  -[STUDaemon performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_recalculateUsageMetrics", 0, 0.5);
}

- (void)invalidateUnenrollmentRequestsIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v4 = objc_msgSend(v3, "requestPermissionToLeaveClasses");

  if ((v4 & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enrolledControlGroupIdentifiers"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
          objc_msgSend(v12, "setRequestUnenroll:forCourseWithIdentifier:completion:", 0, v11, &stru_1000CB220);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)_recalculateUsageMetrics
{
  STUAnalyticsEnrollmentEvent *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  STUAnalyticsEnrollmentEvent *v9;

  v3 = [STUAnalyticsEnrollmentEvent alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v5 = objc_msgSend(v4, "configurationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleGroupEnrollmentRecords"));
  v9 = -[STUAnalyticsEnrollmentEvent initWithConfigurationType:courseCount:](v3, "initWithConfigurationType:courseCount:", v5, objc_msgSend(v7, "count"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon debouncingAnalyticsPrimitives](self, "debouncingAnalyticsPrimitives"));
  objc_msgSend(v8, "sendEvent:", v9);

}

- (void)subscriptionOperationDidFinish:(id)a3 context:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableDictionary *mSubscriptionContextsBySessionUUID;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertyKeys"));
  objc_msgSend(v13, "unsubscribePropertyKeys:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "propertyKeys"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    mSubscriptionContextsBySessionUUID = self->mSubscriptionContextsBySessionUUID;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionUUID"));
    -[NSMutableDictionary removeObjectForKey:](mSubscriptionContextsBySessionUUID, "removeObjectForKey:", v12);

  }
}

- (void)fetchScreenshotOperationDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mScreenObservationTimersBySessionIdentifier, "objectForKeyedSubscript:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v8)
  {
    objc_msgSend(v7, "fire");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon activityUI](self, "activityUI"));
    objc_msgSend(v9, "showScreenObserveIndicator");

    v10 = sub_10004A590();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10007CB50(v4, v11);

    objc_msgSend(v7, "invalidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "screenObserveIndicatorDismissTimerDidFire:", 0, 0, 5.0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mScreenObservationTimersBySessionIdentifier, "setObject:forKeyedSubscript:", v12, v6);
    if (!v7)
      -[STUDaemon postActiveInstructorsDidChangeXPCNotification](self, "postActiveInstructorsDidChangeXPCNotification");

  }
}

- (id)sessionIdentifierForTimer:(id)a3
{
  void *v5;
  void *v6;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->mScreenObservationTimersBySessionIdentifier, "allKeysForObject:", a3));
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 1066, CFSTR("The same timer is associated with multiple session identifiers. This is illegal."));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  return v6;
}

- (void)screenObserveIndicatorDismissTimerDidFire:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[STUDaemon sessionIdentifierForTimer:](self, "sessionIdentifierForTimer:", a3));
  -[NSMutableDictionary removeObjectForKey:](self->mScreenObservationTimersBySessionIdentifier, "removeObjectForKey:");
  -[STUDaemon postActiveInstructorsDidChangeXPCNotification](self, "postActiveInstructorsDidChangeXPCNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->mScreenObservationTimersBySessionIdentifier, "allKeys"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon activityUI](self, "activityUI"));
    objc_msgSend(v6, "hideScreenObserveIndicator");

  }
}

- (BOOL)isInstructorWithSessionIdentifierObservingScreen:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mScreenObservationTimersBySessionIdentifier, "objectForKeyedSubscript:", a3));
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)countOfBonafideClassSessions
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskServer connectedClientSessions](self->mServer, "connectedClientSessions", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += -[STUDaemon isBonafideClassSession:](self, "isBonafideClassSession:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isBonafideClassSession:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stu_info"));
  if (objc_msgSend(v5, "isTrustedByInstructor"))
  {
    if ((objc_msgSend(v5, "isLocalNetworkSession") & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "isIDSSession");
    v7 = v6 & !-[STUDaemon isSessionQuarantined:](self, "isSessionQuarantined:", v4);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)activeCoursesDidChange
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004E0D8;
  v6[3] = &unk_1000C97E8;
  v6[4] = self;
  v2 = v6;
  v4 = CATGetCatalystQueue(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005276C;
  block[3] = &unk_1000CB3A8;
  v8 = v2;
  dispatch_async(v5, block);

}

- (void)permissionsDidChange:(id)a3
{
  -[CATTaskServer postNotificationWithName:userInfo:](self->mServer, "postNotificationWithName:userInfo:", CRKStudentPermissionsDidChangeNotificationName, 0);
}

- (void)localeDidChange:(id)a3
{
  id v3;

  v3 = a3;
  exit(0);
}

- (void)signInHistoryDidChange:(id)a3
{
  -[STUDaemon postXPCNotificationWithName:userInfo:](self, "postXPCNotificationWithName:userInfo:", CRKMAIDSignInHistoryDidChangeNotificationName, 0);
}

- (void)postConfigurationDidChangeXPCNotification
{
  -[STUDaemon postXPCNotificationWithName:userInfo:](self, "postXPCNotificationWithName:userInfo:", CFSTR("com.apple.studentd.configuration.didchange"), 0);
}

- (void)postActiveInstructorsDidChangeXPCNotification
{
  -[STUDaemon postXPCNotificationWithName:userInfo:](self, "postXPCNotificationWithName:userInfo:", CRKActiveInstructorsDidChangeNotificationName, 0);
}

- (void)postXPCNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskServer connectedClientSessions](self->mServer, "connectedClientSessions", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transport"));
        v15 = objc_opt_class(CATXPCTransport);
        isKindOfClass = objc_opt_isKindOfClass(v14, v15);

        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v13, "postNotificationWithName:userInfo:", v6, v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void)postLogEventsDidChangeNotification
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[CATTaskServer postNotificationWithName:userInfo:](self->mServer, "postNotificationWithName:userInfo:", CRKLogEventsDidChangeNotificationName, 0);
}

- (void)beginTransactionForSession:(id)a3 transport:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon transactionsBySessionUUID](self, "transactionsBySessionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sessionUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    v10 = (objc_class *)objc_opt_class(v6);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.studentd.task-session.%@"), v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v13, v15));

      v13 = (void *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "primitives"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "osTransactionPrimitives"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transactionWithReverseDNSReason:", v13));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon transactionsBySessionUUID](self, "transactionsBySessionUUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sessionUUID"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

  }
}

- (void)endTransactionForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[STUDaemon transactionsBySessionUUID](self, "transactionsBySessionUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionUUID"));

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)stopEventRecordingIfNeeded
{
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRKClassSessionBrowser inRangeClassSessionIdentifiers](self->mSessionBrowser, "inRangeClassSessionIdentifiers"));
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon ASMSessionIdentifiers](self, "ASMSessionIdentifiers"));
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      -[STUEventRecorder stopRecording](self->mEventRecorder, "stopRecording");
  }
}

- (NSArray)ASMSessionIdentifiers
{
  NSMutableArray *v3;
  NSMapTable *mSessionIdentifiersByTransport;
  NSMutableArray *v5;
  id v6;
  _QWORD v8[4];
  NSMutableArray *v9;

  v3 = objc_opt_new(NSMutableArray);
  mSessionIdentifiersByTransport = self->mSessionIdentifiersByTransport;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E744;
  v8[3] = &unk_1000CB248;
  v9 = v3;
  v5 = v3;
  -[NSMapTable stu_enumerateKeysAndObjectsUsingBlock:](mSessionIdentifiersByTransport, "stu_enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = -[NSMutableArray copy](v5, "copy");

  return (NSArray *)v6;
}

- (id)quarantineAllowedTaskRequestClasses
{
  if (qword_1000FC450 != -1)
    dispatch_once(&qword_1000FC450, &stru_1000CB268);
  return (id)qword_1000FC458;
}

- (BOOL)isSessionQuarantined:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stu_info"));
    if (objc_msgSend(v6, "isIDSSession"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon quarantinedIDSSessionIdentifiers](self, "quarantinedIDSSessionIdentifiers"));
      v8 = objc_msgSend(v7, "containsObject:", v5);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)quarantineIDSSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon quarantinedIDSSessionIdentifiers](self, "quarantinedIDSSessionIdentifiers"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = sub_10004A590();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
      v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Quarantining session identifier %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon quarantinedIDSSessionIdentifiers](self, "quarantinedIDSSessionIdentifiers"));
    objc_msgSend(v10, "addObject:", v4);

  }
}

- (void)unquarantineIDSSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon quarantinedIDSSessionIdentifiers](self, "quarantinedIDSSessionIdentifiers"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = sub_10004A590();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
      v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unquarantining session identifier %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon quarantinedIDSSessionIdentifiers](self, "quarantinedIDSSessionIdentifiers"));
    objc_msgSend(v10, "removeObject:", v4);

    -[STUDaemon postActiveInstructorsDidChangeXPCNotification](self, "postActiveInstructorsDidChangeXPCNotification");
  }

}

- (void)updateActiveConnectionUI
{
  unint64_t v3;
  void *v4;
  char *v5;

  v3 = -[STUDaemon countOfBonafideClassSessions](self, "countOfBonafideClassSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon snapshotManager](self, "snapshotManager"));
  v5 = (char *)objc_msgSend(v4, "countOfIdleClassSessions");

  if (&v5[v3])
    -[STUDaemon showActiveConnectionUI](self, "showActiveConnectionUI");
  else
    -[STUDaemon hideActiveConnectionUI](self, "hideActiveConnectionUI");
}

- (void)showActiveConnectionUI
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STUDaemon activityUI](self, "activityUI"));
  objc_msgSend(v2, "showActiveConnectionIndicator");

}

- (void)hideActiveConnectionUI
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STUDaemon activityUI](self, "activityUI"));
  objc_msgSend(v2, "hideActiveConnectionIndicator");

}

- (id)makeOperationsToGenerateActiveInstructorsIncludingImages:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon exposableClientSessions](self, "exposableClientSessions"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004EC88;
  v8[3] = &unk_1000CB290;
  v8[4] = self;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crk_mapUsingBlock:", v8));

  return v6;
}

- (id)makeOperationsToGenerateIdleInstructorsIncludingImages:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon snapshotManager](self, "snapshotManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operationsToGenerateIdleInstructorsWithDaemon:includeImages:", self, v3));

  return v6;
}

- (id)generateInstructorOperationsByUnioningActiveOperations:(id)a3 andIdleOperations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crk_mapUsingBlock:", &stru_1000CB2D0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  v9 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v5);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionIdentifier", (_QWORD)v20));
        v17 = objc_msgSend(v8, "containsObject:", v16);

        if ((v17 & 1) == 0)
          -[NSMutableArray addObject:](v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = -[NSMutableArray copy](v9, "copy");
  return v18;
}

- (id)monotonicClock
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "whiteboard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "monotonicClock"));

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  STUInvitationSessionManager *v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = (STUInvitationSessionManager *)a4;
  v12 = a5;
  if (a6 == CFSTR("STUDaemonObservationContext"))
  {
    if (self->mInvitationSessionManager == v11
      && objc_msgSend(v10, "isEqualToString:", CFSTR("acceptedInvitationIdentifiers")))
    {
      -[STUDaemon updateSessionBrowser](self, "updateSessionBrowser");
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STUDaemon;
    -[STUDaemon observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)restrictionsDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004F0BC;
  v3[3] = &unk_1000C97E8;
  v3[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v3);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;

  v5 = a4;
  if (-[STUDaemon BOOLValueForEntitlement:onConnection:](self, "BOOLValueForEntitlement:onConnection:", CFSTR("com.apple.studentd-access"), v5))
  {
    -[STUDaemon performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "acceptNewConnection:", v5, 0);
LABEL_5:
    v8 = 1;
    goto LABEL_9;
  }
  if (-[STUDaemon BOOLValueForEntitlement:onConnection:](self, "BOOLValueForEntitlement:onConnection:", CFSTR("com.apple.studentd.configuration"), v5))
  {
    v6 = CRKStudentDaemonXPCInterface(objc_msgSend(v5, "setExportedObject:", self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(v5, "resume");
    goto LABEL_5;
  }
  v9 = sub_10004A590();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10007CBFC(v5, v10);

  v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)BOOLValueForEntitlement:(id)a3 onConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned __int8 v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primitives"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "XPCPrimitives"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForEntitlement:onConnection:", v6, v5));
  v11 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "BOOLValue");

  return v14;
}

- (void)acceptNewConnection:(id)a3
{
  id v4;
  STUXPCTransport *v5;

  v4 = a3;
  v5 = -[STUXPCTransport initWithXPCConnection:]([STUXPCTransport alloc], "initWithXPCConnection:", v4);

  -[CATTaskServer connectWithClientTransport:](self->mServer, "connectWithClientTransport:", v5);
}

- (void)willSwitchUser
{
  UMUserSwitchBlockingTask *v3;
  UMUserSwitchBlockingTask *mUserSwitchTask;
  _QWORD *v5;
  _QWORD v6[5];

  -[UMUserSwitchBlockingTask end](self->mUserSwitchTask, "end");
  v3 = (UMUserSwitchBlockingTask *)objc_claimAutoreleasedReturnValue(+[UMUserSwitchBlockingTask taskWithName:reason:](UMUserSwitchBlockingTask, "taskWithName:reason:", CFSTR("studentd notify"), CFSTR("Notifying connected instructors of the user switch")));
  mUserSwitchTask = self->mUserSwitchTask;
  self->mUserSwitchTask = v3;

  -[UMUserSwitchBlockingTask begin](self->mUserSwitchTask, "begin");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004F3F0;
  v6[3] = &unk_1000C97E8;
  v6[4] = self;
  v5 = objc_retainBlock(v6);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v5[2])(v5);
  else
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)endUserSwitchTask
{
  id v3;
  NSObject *v4;
  UMUserSwitchBlockingTask *mUserSwitchTask;
  uint8_t v6[16];

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "endUserSwitchTask", 0);
  v3 = sub_10004A590();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ending switching task", v6, 2u);
  }

  -[UMUserSwitchBlockingTask end](self->mUserSwitchTask, "end");
  mUserSwitchTask = self->mUserSwitchTask;
  self->mUserSwitchTask = 0;

}

- (unint64_t)nextLoginState
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon currentDevice](self, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "loginState");

  if (v3 > 2)
    return 1;
  else
    return qword_1000B9180[v3];
}

- (void)fetchConfigurationType:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F734;
  v4[3] = &unk_1000C9A68;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v4);

}

- (void)setAdHocConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F82C;
  v7[3] = &unk_1000CB2F8;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v7);

}

- (void)fetchAdHocConfiguration:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F948;
  v4[3] = &unk_1000C9A68;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v4);

}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004FA4C;
  v7[3] = &unk_1000CB2F8;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v7);

}

- (void)fetchConfiguration:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004FB68;
  v4[3] = &unk_1000C9A68;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v4);

}

- (void)setActiveStudentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  STUDaemon *v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004FC6C;
  v8[3] = &unk_1000CB2F8;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v8);

}

- (void)studentDidAuthenticate:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004FDEC;
  v7[3] = &unk_1000CAF70;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v7);

}

- (void)fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004FF4C;
  v7[3] = &unk_1000CB2F8;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v7);

}

- (void)fetchSetOfActiveRestrictionUUIDsForClientType:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  void *v6;
  id v7;

  v5 = (void (**)(id, id, _QWORD))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon restrictionUUIDKeeper](self, "restrictionUUIDKeeper"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeRestrictionUUIDs"));

  v5[2](v5, v7, 0);
}

- (BOOL)server:(id)a3 clientSession:(id)a4 shouldConnectWithTransport:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transport"));

  v10 = sub_10004A590();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9 == v8)
  {
    if (v12)
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "TASK SESSION CONNECTING %{public}@", (uint8_t *)&v15, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon propertyObservationGatekeeper](self, "propertyObservationGatekeeper"));
    objc_msgSend(v13, "beginObservationForSession:", v7);

    -[STUDaemon beginTransactionForSession:transport:](self, "beginTransactionForSession:transport:", v7, v8);
  }
  else
  {
    if (v12)
    {
      v15 = 138543618;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "TASK SESSION RECONNECTING %{public}@ with transport %{public}@", (uint8_t *)&v15, 0x16u);
    }

  }
  return 1;
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v9, "isEqualToString:", CATErrorDomain))
  {
    v10 = objc_msgSend(v8, "code");

    if (v10 == (id)503)
    {
      v11 = sub_10004A590();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10007CC84((uint64_t)v7, v8);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v7));
      if (!v15)
        goto LABEL_22;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stu_info"));
      v17 = objc_msgSend(v16, "isIDSSession");

      if ((v17 & 1) != 0)
        goto LABEL_22;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
      if (objc_msgSend(v18, "isEqualToString:", CRKErrorDomain))
      {
        v19 = objc_msgSend(v14, "code");

        if (v19 == (id)202)
        {
          -[CRKClassSessionBrowser classSessionRejected:](self->mSessionBrowser, "classSessionRejected:", v15);
LABEL_22:
          objc_msgSend(v7, "invalidate");

          goto LABEL_23;
        }
      }
      else
      {

      }
      -[CRKClassSessionBrowser classSessionInvalidated:](self->mSessionBrowser, "classSessionInvalidated:", v15);
      goto LABEL_22;
    }
  }
  else
  {

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stu_info"));
  v21 = objc_msgSend(v20, "isNonXPCSession");

  if (v21)
  {
    v22 = sub_10004A590();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10007CD78((uint64_t)v7, v8);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v7));
  if (v14)
  {
    v24 = sub_10004A590();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10007CD08();

    -[CRKClassSessionBrowser lostConnectionToClassSession:](self->mSessionBrowser, "lostConnectionToClassSession:", v14);
  }
  objc_msgSend(v7, "disconnect");
LABEL_23:

}

- (void)server:(id)a3 clientSessionDidConnect:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  NSMapTable *mSessionIdentifiersByTransport;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  int v32;
  id v33;
  __int16 v34;
  void *v35;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon idleConnectionMonitor](self, "idleConnectionMonitor"));
  objc_msgSend(v9, "connectedTaskSessionsDidChange");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transport"));
  v11 = objc_opt_class(CATXPCTransport);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stu_info"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selfReportedSessionIdentifier"));

    if (!v14)
    {
      v15 = sub_10004A590();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "XPC session provided an invalid session identifier. Defaulting to managed.", (uint8_t *)&v32, 2u);
      }

      v17 = objc_alloc((Class)DMFControlSessionIdentifier);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMFControlGroupIdentifier crk_managedXPCGroupIdentifier](DMFControlGroupIdentifier, "crk_managedXPCGroupIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
      v14 = objc_msgSend(v17, "initWithString:", v19);

      if (!v14)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 1561, CFSTR("Failed to create managed XPC session identifier"));

        v14 = 0;
      }
    }
    mSessionIdentifiersByTransport = self->mSessionIdentifiersByTransport;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transport"));
    -[NSMapTable setObject:forKey:](mSessionIdentifiersByTransport, "setObject:forKey:", v14, v21);

  }
  else
  {
    v22 = sub_10004A590();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedClientSessions"));
      v32 = 138543618;
      v33 = v8;
      v34 = 2114;
      v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "TASK SESSION REMOTE CONNECTED %{public}@ %{public}@", (uint8_t *)&v32, 0x16u);

    }
    objc_msgSend(v8, "postNotificationWithName:userInfo:", CRKLogEventsDidChangeNotificationName, 0);
  }
  -[STUDaemon postActiveInstructorsDidChangeXPCNotification](self, "postActiveInstructorsDidChangeXPCNotification");
  -[STUDaemon activeCoursesDidChange](self, "activeCoursesDidChange");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v8));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "groupIdentifier"));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[STUCourseIdentifierMetadataTracker sharedTracker](STUCourseIdentifierMetadataTracker, "sharedTracker"));
    objc_msgSend(v27, "classSessionDidConnectWithCourseIdentifier:", v26);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon snapshotManager](self, "snapshotManager"));
  objc_msgSend(v28, "classSessionDidConnect:", v8);

  -[STUDaemon updateActiveConnectionUI](self, "updateActiveConnectionUI");
  v29 = sub_10004A590();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v32 = 138543362;
    v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "TASK SESSION CONNECTED %{public}@", (uint8_t *)&v32, 0xCu);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "invalidateSession:", v8);
}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = sub_10004A590();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v24 = 138543362;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TASK SESSION DISCONNECTED %{public}@", (uint8_t *)&v24, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon idleConnectionMonitor](self, "idleConnectionMonitor"));
  objc_msgSend(v10, "connectedTaskSessionsDidChange");

  -[STUDaemon postActiveInstructorsDidChangeXPCNotification](self, "postActiveInstructorsDidChangeXPCNotification");
  -[STUDaemon activeCoursesDidChange](self, "activeCoursesDidChange");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon snapshotManager](self, "snapshotManager"));
  objc_msgSend(v11, "classSessionDidDisconnect:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupIdentifier"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[STUCourseIdentifierMetadataTracker sharedTracker](STUCourseIdentifierMetadataTracker, "sharedTracker"));
    objc_msgSend(v14, "classSessionDidDisconnectWithCourseIdentifier:", v13);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stu_info"));
  v16 = objc_msgSend(v15, "isNonXPCSession");

  if (v16)
  {
    v17 = sub_10004A590();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedClientSessions"));
      v24 = 138543618;
      v25 = v7;
      v26 = 2114;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "TASK SESSION REMOTE DISCONNECTED %{public}@ %{public}@", (uint8_t *)&v24, 0x16u);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", CFSTR("DisconnectedSessionTimeout")));
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  -[STUDaemon performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "invalidateSession:", v7, v23);
  -[STUDaemon updateActiveConnectionUI](self, "updateActiveConnectionUI");

}

- (void)invalidateSession:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = sub_10004A590();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10007CDFC();

    v8 = CATErrorWithCodeAndUserInfo(4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v5, "invalidateWithError:", v9);

  }
  else
  {
    -[STUDaemon performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v5, 0);
  }

}

- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSMapTable *mSessionIdentifiersByTransport;
  uint64_t v11;
  void *v12;
  STUCoursePresenceTracker *mCoursePresenceTracker;
  void *v14;
  STUPermanentTokenAuthenticator *mSessionTokenAuthenticator;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v5));
  v7 = sub_10004A590();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v18 = 138543362;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "TASK SESSION INVALIDATED %{public}@", (uint8_t *)&v18, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon idleConnectionMonitor](self, "idleConnectionMonitor"));
  objc_msgSend(v9, "connectedTaskSessionsDidChange");

  if (v6)
  {
    mSessionIdentifiersByTransport = self->mSessionIdentifiersByTransport;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transport"));
    -[NSMapTable removeObjectForKey:](mSessionIdentifiersByTransport, "removeObjectForKey:", v11);

    -[STUDaemon stopEventRecordingIfNeeded](self, "stopEventRecordingIfNeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRKClassSessionBrowser inRangeClassSessionIdentifiers](self->mSessionBrowser, "inRangeClassSessionIdentifiers"));
    LOBYTE(v11) = objc_msgSend(v12, "containsObject:", v6);

    if ((v11 & 1) == 0)
    {
      mCoursePresenceTracker = self->mCoursePresenceTracker;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
      -[STUCoursePresenceTracker removedCourseIdentifier:](mCoursePresenceTracker, "removedCourseIdentifier:", v14);

    }
  }
  mSessionTokenAuthenticator = self->mSessionTokenAuthenticator;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionUUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  -[STUPermanentTokenAuthenticator deauthenticateToken:](mSessionTokenAuthenticator, "deauthenticateToken:", v17);

  -[STUDaemon unquarantineIDSSessionIdentifier:](self, "unquarantineIDSSessionIdentifier:", v6);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "invalidateSession:", v5);
  -[STUDaemon endTransactionForSession:](self, "endTransactionForSession:", v5);

}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  STUPerformRequestOperation *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  STUCoursePresenceTracker *mCoursePresenceTracker;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CATOperationQueue *mOperationQueue;
  void *v48;
  void *v49;
  STUPermanentTokenAuthenticator *mSessionTokenAuthenticator;
  STUTaskOperationContext *v51;
  void *v52;
  id v53;
  id v54;
  STUTaskOperationContext *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;

  v9 = a4;
  v10 = a5;
  if (!+[STUPerformRequestOperation validateRequest:error:](STUPerformRequestOperation, "validateRequest:error:", v10, a6))
  {
    v18 = 0;
    goto LABEL_19;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enrollmentRecordWithIdentifier:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientUserInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CRKTaskClientSessionTokenUserInfoKey));

  if (objc_msgSend(v15, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));
    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("-%@"), v15));

    v15 = v17;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessionUUID"));
    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  }

  if ((objc_msgSend(v65, "isManaged") & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stu_info"));
    if (objc_msgSend(v19, "isIDSSession"))
    {

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
      v21 = objc_msgSend(v20, "automaticallyJoinClasses");

      if (!v21)
        goto LABEL_11;
    }
  }
  -[STUPermanentTokenAuthenticator authenticateToken:](self->mSessionTokenAuthenticator, "authenticateToken:", v64);
LABEL_11:
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientUserInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CRKTaskClientInstructorPlatformUserInfoKey));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientUserInfo"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CRKTaskClientInstructorOSVersionUserInfoKey));

  v56 = v23;
  v54 = objc_msgSend(v23, "unsignedIntegerValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientUserInfo"));
  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CRKTaskClientInstructorClassroomAppVersionUserInfoKey));

  if (-[STUDaemon isSessionQuarantined:](self, "isSessionQuarantined:", v9)
    && (v27 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon quarantineAllowedTaskRequestClasses](self, "quarantineAllowedTaskRequestClasses")),
        v28 = objc_msgSend(v27, "containsObject:", objc_opt_class(v10)),
        v27,
        (v28 & 1) == 0))
  {
    if (a6)
    {
      v39 = CRKErrorWithCodeAndUserInfo(38, 0);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(v39);
    }
    else
    {
      v18 = 0;
    }
    v37 = (void *)v25;
    v38 = (void *)v63;
    v36 = (void *)v64;
  }
  else
  {
    v51 = [STUTaskOperationContext alloc];
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stu_info"));
    mSessionTokenAuthenticator = self->mSessionTokenAuthenticator;
    mCoursePresenceTracker = self->mCoursePresenceTracker;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePresenceTracker firstSeenDateForCourseIdentifier:](mCoursePresenceTracker, "firstSeenDateForCourseIdentifier:", v52));
    v30 = objc_claimAutoreleasedReturnValue(-[STUDaemon monotonicClock](self, "monotonicClock"));
    mOperationQueue = self->mOperationQueue;
    v48 = (void *)v30;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon IDSMessageBroadcaster](self, "IDSMessageBroadcaster"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon keychain](self, "keychain"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon screenshotServiceProxy](self, "screenshotServiceProxy"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon serverResourceCache](self, "serverResourceCache"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon featureDataStore](self, "featureDataStore"));
    v62 = v11;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon lockScreenMonitor](self, "lockScreenMonitor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon currentDevice](self, "currentDevice"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
    v53 = v10;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "primitives"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon applicationWorkspace](self, "applicationWorkspace"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon idleStateProvider](self, "idleStateProvider"));
    v46 = (void *)v25;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon signInHistoryStorage](self, "signInHistoryStorage"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon classKitReSyncer](self, "classKitReSyncer"));
    v55 = -[STUTaskOperationContext initWithConfigurationManager:sessionInfo:sessionIdentifier:enrollmentRecord:tokenAuthenticator:sessionToken:courseFirstSeenDate:dateProvider:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:operationQueue:studentIdentity:IDSMessageBroadcaster:keychain:screenshotServiceProxy:serverResourceCache:featureDataStore:lockScreenMonitor:daemon:device:primitives:classSessionReporter:applicationWorkspace:idleStateProvider:signInHistoryStorage:classKitReSyncer:](v51, "initWithConfigurationManager:sessionInfo:sessionIdentifier:enrollmentRecord:tokenAuthenticator:sessionToken:courseFirstSeenDate:dateProvider:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:operationQueue:studentIdentity:IDSMessageBroadcaster:keychain:screenshotServiceProxy:serverResourceCache:featureDataStore:lockScreenMonitor:daemon:device:primitives:classSessionReporter:applicationWorkspace:idleStateProvider:signInHistoryStorage:classKitReSyncer:", v60, v49, v62, v65, mSessionTokenAuthenticator, v64, v61, v48, v54, v25, v63, mOperationQueue, 0,
            v59,
            v58,
            v44,
            v57,
            v31,
            v43,
            self,
            v32,
            v42,
            self,
            v41,
            v33,
            v34,
            v35);

    v36 = (void *)v64;
    v10 = v53;

    v11 = v62;
    v37 = v46;
    v18 = -[STUPerformRequestOperation initWithRequest:session:context:]([STUPerformRequestOperation alloc], "initWithRequest:session:context:", v53, v9, v55);

    v38 = (void *)v63;
  }

LABEL_19:
  return v18;
}

- (void)server:(id)a3 clientSession:(id)a4 enqueueOperation:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *mSubscriptionContextsBySessionUUID;
  void *v12;
  STUDevicePropertySubscriptionContext *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;

  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class(STUDevicePropertyNotificationSubscriptionOperation);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
    mSubscriptionContextsBySessionUUID = self->mSubscriptionContextsBySessionUUID;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionUUID"));
    v13 = (STUDevicePropertySubscriptionContext *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](mSubscriptionContextsBySessionUUID, "objectForKeyedSubscript:", v12));

    if (!v13)
    {
      v14 = objc_opt_class(DMFDevicePropertyNotificationSubscriptionRequest);
      v13 = -[STUDevicePropertySubscriptionContext initWithSession:postsDMFNotification:]([STUDevicePropertySubscriptionContext alloc], "initWithSession:postsDMFNotification:", v7, objc_opt_isKindOfClass(v10, v14) & 1);
      v15 = self->mSubscriptionContextsBySessionUUID;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionUUID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon propertyKeysForSubscriptionRequest:](self, "propertyKeysForSubscriptionRequest:", v10));
    -[STUDevicePropertySubscriptionContext subscribePropertyKeys:](v13, "subscribePropertyKeys:", v17);
    objc_msgSend(v8, "addTarget:selector:forOperationEvents:userInfo:", self, "subscriptionOperationDidFinish:context:", 6, v13);

  }
  else
  {
    v18 = objc_opt_class(STUFetchScreenshotOperation);
    if ((objc_opt_isKindOfClass(v8, v18) & 1) != 0)
      objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, "fetchScreenshotOperationDidFinish:", 6);
  }
  v19 = objc_opt_class(STUPerformRequestOperation);
  if ((objc_opt_isKindOfClass(v8, v19) & 1) == 0)
  {
    objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, "enqueuedOperationDidFail:", 4);
    v20 = sub_10004A590();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class(v8);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = 138543618;
      v26 = v7;
      v27 = 2114;
      v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "TASK SESSION %{public}@ enqueued operation: %{public}@", (uint8_t *)&v25, 0x16u);

    }
  }
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v8);

}

- (id)propertyKeysForSubscriptionRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = objc_opt_class(DMFDevicePropertyNotificationSubscriptionRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKDevicePropertyNotificationSubscriptionRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertyKeys"));
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "propertyKeys"));
    v15 = (void *)v14;
    v16 = &__NSArray0__struct;
    if (v14)
      v16 = (void *)v14;
    v13 = v16;

  }
  return v13;
}

- (void)enqueuedOperationDidFail:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  v4 = sub_10004A590();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10007CE28((uint64_t)v3);

}

- (id)browser:(id)a3 clientIdentityForGroup:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientIdentityForGroupIdentifier:", v5));

  return v7;
}

- (id)browser:(id)a3 trustedAnchorCertificatesForGroup:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon configurationManager](self, "configurationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trustedAnchorCertificatesForGroupIdentifier:", v5));

  return v7;
}

- (void)browser:(id)a3 classSessionDidBecomeConnectable:(id)a4 withFlags:(unsigned __int16)a5
{
  char v5;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = sub_10004A590();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    v16 = 138543362;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Class session became connectable %{public}@", (uint8_t *)&v16, 0xCu);

  }
  if ((v5 & 2) != 0 && !self->mDaemonActivityAssertionCount)
  {
    v13 = sub_10004A590();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
      v16 = 138543362;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Not connecting to %{public}@ because it is idle and the daemon is not active", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v8, "connectToClassSessionWithIdentifier:", v9);
  }

}

- (void)browser:(id)a3 classSessionDidBecomeNotConnectable:(id)a4 withFlags:(unsigned __int16)a5
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a4;
  v6 = sub_10004A590();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Class session became NOT connectable %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)browser:(id)a3 didFindClassSession:(id)a4 transport:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[STUEventRecorder recordCurrentState](self->mEventRecorder, "recordCurrentState");
  v9 = sub_10004A590();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found class session %{public}@. Transport: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[CATTaskServer connectWithClientTransport:](self->mServer, "connectWithClientTransport:", v8);
  -[NSMapTable setObject:forKey:](self->mSessionIdentifiersByTransport, "setObject:forKey:", v7, v8);

}

- (void)browser:(id)a3 didRemoveClassSession:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskServer clientSessions](self->mServer, "clientSessions", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v11));
        v13 = v12;
        if (v12 && objc_msgSend(v12, "isEqual:", v5))
        {
          v14 = CRKErrorWithCodeAndUserInfo(6, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          objc_msgSend(v11, "invalidateWithError:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (BOOL)hasConnectionToClassWithIdentifier:(id)a3
{
  id v5;
  unsigned __int8 v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDaemon.m"), 1805, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("classIdentifier"));

  }
  v6 = -[CRKClassSessionBrowser hasConnectionToClassWithIdentifier:](self->mSessionBrowser, "hasConnectionToClassWithIdentifier:", v5);

  return v6;
}

- (void)browser:(id)a3 didFailWithError:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a4;
  v5 = sub_10004A590();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10007CECC(v4);

}

- (void)browser:(id)a3 didUpdateInRangeClassSessions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon ASMSessionIdentifiers](self, "ASMSessionIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromArray:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_mapUsingBlock:", &stru_1000CB338));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePresenceTracker presentCourseIdentifiers](self->mCoursePresenceTracker, "presentCourseIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crk_setBySubtractingSet:", v8));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        -[STUCoursePresenceTracker removedCourseIdentifier:](self->mCoursePresenceTracker, "removedCourseIdentifier:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v15));
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        -[STUCoursePresenceTracker foundCourseIdentifier:](self->mCoursePresenceTracker, "foundCourseIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20), (_QWORD)v23);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v16, "count"))
    -[STUEventRecorder startRecording](self->mEventRecorder, "startRecording");
  else
    -[STUDaemon stopEventRecordingIfNeeded](self, "stopEventRecordingIfNeeded");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon ASMEventHandler](self, "ASMEventHandler", (_QWORD)v23));
  objc_msgSend(v21, "setInRangeClassSessions:", v5);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon snapshotManager](self, "snapshotManager"));
  objc_msgSend(v22, "inRangeClassSessionsDidChange:", v5);

}

- (void)browser:(id)a3 encounteredUntrustedClassSession:(id)a4 ASMInstructorIdentifier:(id)a5 decisionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[STUDaemon ASMEventHandler](self, "ASMEventHandler"));
  objc_msgSend(v12, "didEncounterUntrustedClassSession:instructorIdentifier:decisionHandler:", v11, v10, v9);

}

- (void)devicePropertyObserver:(id)a3 didObserveChangeForKey:(id)a4 toValue:(id)a5 inCourse:(id)a6
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100051EB0;
  v11[3] = &unk_1000CB360;
  v11[4] = self;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v11);

}

- (void)postDevicePropertyChangedNotification:(id)a3 course:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  id obj;
  STUDaemon *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->mSubscriptionContextsBySessionUUID, "allValues"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](v22, "identifierForSession:", v15));

        if (!v7
          || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "groupIdentifier")),
              v18 = objc_msgSend(v7, "isEqual:", v17),
              v17,
              v18))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "propertyKeys"));
          v20 = objc_msgSend(v19, "containsObject:", v14);

          if (v20)
            objc_msgSend(v12, "postNotificationForPropertyChange:", v6);
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

}

- (void)eventRecorder:(id)a3 didRecordEvent:(id)a4
{
  -[STUDaemon performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "postLogEventsDidChangeNotification", 0, 1.0);
}

- (void)classSessionBrowser:(id)a3 foundSessionWithIdentifier:(id)a4 transport:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1000FC478 != -1)
    dispatch_once(&qword_1000FC478, &stru_1000CB3C8);
  v11 = qword_1000FC470;
  if (os_log_type_enabled((os_log_t)qword_1000FC470, OS_LOG_TYPE_INFO))
  {
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found ASM class session %{public}@. Transport: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  -[STUDaemon quarantineIDSSessionIdentifier:](self, "quarantineIDSSessionIdentifier:", v9);
  -[CATTaskServer connectWithClientTransport:](self->mServer, "connectWithClientTransport:", v10);
  -[NSMapTable setObject:forKey:](self->mSessionIdentifiersByTransport, "setObject:forKey:", v9, v10);

}

- (void)classSessionBrowser:(id)a3 lostEnrollmentInCourses:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskServer clientSessions](self->mServer, "clientSessions", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon identifierForSession:](self, "identifierForSession:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupIdentifier"));
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if (v14)
        {
          v15 = CRKErrorWithCodeAndUserInfo(202, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          objc_msgSend(v11, "invalidateWithError:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (id)snapshotManager:(id)a3 identifierForSession:(id)a4
{
  return -[STUDaemon identifierForSession:](self, "identifierForSession:", a4);
}

- (void)snapshotManagerDidUpdateIdleInstructors:(id)a3
{
  -[STUDaemon updateActiveConnectionUI](self, "updateActiveConnectionUI", a3);
  -[STUDaemon postActiveInstructorsDidChangeXPCNotification](self, "postActiveInstructorsDidChangeXPCNotification");
}

- (BOOL)hasActiveRemoteClassSessions
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDaemon IDSTaskSessions](self, "IDSTaskSessions"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)migrationSessionDidFinish:(id)a3
{
  -[STUDaemon setMigrationSession:](self, "setMigrationSession:", 0);
}

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (STUDevice)currentDevice
{
  return self->_currentDevice;
}

- (STUDevicePropertyObservationGatekeeper)propertyObservationGatekeeper
{
  return self->_propertyObservationGatekeeper;
}

- (CRKIDSMessageBroadcasting)IDSMessageBroadcaster
{
  return self->_IDSMessageBroadcaster;
}

- (CRKCertificateExchangeBroadcastHandler)certificateExchangeBroadcastHandler
{
  return self->_certificateExchangeBroadcastHandler;
}

- (STUASMEventHandler)ASMEventHandler
{
  return self->_ASMEventHandler;
}

- (NSMutableDictionary)transactionsBySessionUUID
{
  return self->_transactionsBySessionUUID;
}

- (CRKScreenshotServiceInterface)screenshotServiceProxy
{
  return self->_screenshotServiceProxy;
}

- (STUServerResourceCache)serverResourceCache
{
  return self->_serverResourceCache;
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (CRKClassroomLockScreenMonitoring)lockScreenMonitor
{
  return self->_lockScreenMonitor;
}

- (STUClassSessionBrowsing)ASMClassSessionBrowser
{
  return self->_ASMClassSessionBrowser;
}

- (NSMutableSet)quarantinedIDSSessionIdentifiers
{
  return self->_quarantinedIDSSessionIdentifiers;
}

- (CRKFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (STUIdleConnectionMonitor)idleConnectionMonitor
{
  return self->_idleConnectionMonitor;
}

- (STUActivityUI)activityUI
{
  return self->_activityUI;
}

- (STUClassSessionSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (STURestrictionUUIDKeeper)restrictionUUIDKeeper
{
  return self->_restrictionUUIDKeeper;
}

- (STUAnalyticsPrimitives)debouncingAnalyticsPrimitives
{
  return self->_debouncingAnalyticsPrimitives;
}

- (STUApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (STUSignInHistoryStorage)signInHistoryStorage
{
  return self->_signInHistoryStorage;
}

- (STUClassKitReSyncer)classKitReSyncer
{
  return self->_classKitReSyncer;
}

- (STUMigrationSession)migrationSession
{
  return self->_migrationSession;
}

- (void)setMigrationSession:(id)a3
{
  objc_storeStrong((id *)&self->_migrationSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationSession, 0);
  objc_storeStrong((id *)&self->_classKitReSyncer, 0);
  objc_storeStrong((id *)&self->_signInHistoryStorage, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_debouncingAnalyticsPrimitives, 0);
  objc_storeStrong((id *)&self->_restrictionUUIDKeeper, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_activityUI, 0);
  objc_storeStrong((id *)&self->_idleConnectionMonitor, 0);
  objc_storeStrong((id *)&self->_keychain, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_quarantinedIDSSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_ASMClassSessionBrowser, 0);
  objc_storeStrong((id *)&self->_lockScreenMonitor, 0);
  objc_storeStrong((id *)&self->_featureDataStore, 0);
  objc_storeStrong((id *)&self->_serverResourceCache, 0);
  objc_storeStrong((id *)&self->_screenshotServiceProxy, 0);
  objc_storeStrong((id *)&self->_transactionsBySessionUUID, 0);
  objc_storeStrong((id *)&self->_ASMEventHandler, 0);
  objc_storeStrong((id *)&self->_certificateExchangeBroadcastHandler, 0);
  objc_storeStrong((id *)&self->_IDSMessageBroadcaster, 0);
  objc_storeStrong((id *)&self->_propertyObservationGatekeeper, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_idleStateProvider, 0);
  objc_storeStrong((id *)&self->mSIGTERMSource, 0);
  objc_storeStrong((id *)&self->mInstructorRoleManager, 0);
  objc_storeStrong((id *)&self->mCoursePresenceTracker, 0);
  objc_storeStrong((id *)&self->mEventRecorder, 0);
  objc_storeStrong((id *)&self->mEventStore, 0);
  objc_storeStrong((id *)&self->mSessionTokenAuthenticator, 0);
  objc_storeStrong((id *)&self->mScreenObservationTimersBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->mInvitationSessionManager, 0);
  objc_storeStrong((id *)&self->mUserSwitchTask, 0);
  objc_storeStrong((id *)&self->mSubscriptionContextsBySessionUUID, 0);
  objc_storeStrong((id *)&self->mConfigurationNotificationTimer, 0);
  objc_storeStrong((id *)&self->mSessionIdentifiersByTransport, 0);
  objc_storeStrong((id *)&self->mSessionBrowser, 0);
  objc_storeStrong((id *)&self->mPropertyObserver, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_storeStrong((id *)&self->mServer, 0);
  objc_storeStrong((id *)&self->mListener, 0);
}

@end
