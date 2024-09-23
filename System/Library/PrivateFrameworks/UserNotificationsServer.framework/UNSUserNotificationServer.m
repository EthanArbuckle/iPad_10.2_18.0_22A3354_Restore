@implementation UNSUserNotificationServer

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  UNSUserNotificationServerConnectionListener *userNotificationServerConnectionListener;
  id v7;
  id v8;

  userNotificationServerConnectionListener = self->_userNotificationServerConnectionListener;
  v7 = a4;
  v8 = a3;
  -[UNSUserNotificationServerConnectionListener didReceiveDeviceToken:forBundleIdentifier:](userNotificationServerConnectionListener, "didReceiveDeviceToken:forBundleIdentifier:", v8, v7);
  -[UNSUserNotificationServerRemoteNotificationConnectionListener didReceiveDeviceToken:forBundleIdentifier:](self->_userNotificationServerRemoteNotificationConnectionListener, "didReceiveDeviceToken:forBundleIdentifier:", v8, v7);

}

- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  UNCNotificationSchedulingService *notificationSchedulingService;
  id v7;
  id v8;

  notificationSchedulingService = self->_notificationSchedulingService;
  v7 = a4;
  v8 = a3;
  -[UNCNotificationSchedulingService didChangeNotificationSettings:forBundleIdentifier:](notificationSchedulingService, "didChangeNotificationSettings:forBundleIdentifier:", v8, v7);
  -[UNCRemoteNotificationServer didChangeNotificationSettings:forBundleIdentifier:](self->_remoteNotificationService, "didChangeNotificationSettings:forBundleIdentifier:", v8, v7);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance___sharedInstance;
}

void __43__UNSUserNotificationServer_sharedInstance__block_invoke()
{
  UNSUserNotificationServer *v0;
  void *v1;

  v0 = objc_alloc_init(UNSUserNotificationServer);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (UNSUserNotificationServer)init
{
  UNSUserNotificationServer *v2;
  UNSUserNotificationServer *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *installedSourceQueue;
  UNSContentProtectionManager *v7;
  UNSContentProtectionManager *contentProtectionManager;
  void *v9;
  uint64_t v10;
  NSString *libraryDirectory;
  uint64_t v12;
  NSString *directory;
  uint64_t v14;
  UNCBundleLibrarian *librarian;
  UNCLocalizationService *v16;
  UNCLocalizationService *localizationService;
  _UNNotificationCommunicationContextService *v18;
  _UNNotificationCommunicationContextService *communicationContextService;
  UNSBadgeService *v20;
  UNSBadgeService *badgeService;
  id v22;
  NSString *v23;
  UNCBundleLibrarian *v24;
  void *v25;
  uint64_t v26;
  UNCNotificationTopicRepository *topicRepository;
  UNCNotificationCoreServiceClient *v28;
  UNCNotificationCoreServiceClient *coreServiceClient;
  uint64_t v30;
  UNSNotificationCategoryRepository *categoryRepository;
  uint64_t v32;
  UNCNotificationRepository *notificationRepository;
  id v34;
  UNCBundleLibrarian *v35;
  NSString *v36;
  void *v37;
  uint64_t v38;
  UNSNotificationCategoryRepository *v39;
  id v40;
  NSString *v41;
  UNCBundleLibrarian *v42;
  void *v43;
  uint64_t v44;
  UNCNotificationRepository *v45;
  uint64_t v46;
  UNSSummaryServiceAdapter *v47;
  UNSSummaryServiceAdapter *summaryService;
  id v49;
  UNCBundleLibrarian *v50;
  NSString *v51;
  void *v52;
  uint64_t v53;
  UNCPendingNotificationRepository *pendingNotificationRepository;
  uint64_t v55;
  UNCPushRegistrationRepository *pushRegistrationRepository;
  uint64_t v57;
  UNCNotificationScheduleRepository *notificationScheduleRepository;
  uint64_t v59;
  UNCAttachmentsRepository *attachmentsRepository;
  UNCLocationMonitor *v61;
  UNCLocationMonitor *locationMonitor;
  uint64_t v63;
  UNCNotificationSchedulingService *notificationSchedulingService;
  UNSAttachmentsService *v65;
  UNSAttachmentsService *attachmentsService;
  UNSApplicationLauncher *v67;
  UNSApplicationLauncher *applicationLauncher;
  UNSDaemonLauncher *v69;
  UNSDaemonLauncher *daemonLauncher;
  UNSSettingsGateway *v71;
  UNSSettingsGateway *settingsGateway;
  UNSDefaultDataProviderFactory *v73;
  UNSDefaultDataProviderFactory *dataProviderFactory;
  UNSNotificationSettingsService *v75;
  UNSNotificationSettingsService *notificationSettingsService;
  UNSNotificationAuthorizationService *v77;
  UNSNotificationAuthorizationService *notificationAuthorizationService;
  UNSApplicationService *v79;
  UNSApplicationService *applicationService;
  id v81;
  UNCNotificationRepository *v82;
  UNSAttachmentsService *v83;
  UNCPushRegistrationRepository *v84;
  void *v85;
  uint64_t v86;
  UNCRemoteNotificationServer *remoteNotificationService;
  UNSUserNotificationServerRemoteNotificationConnectionListener *v88;
  UNSUserNotificationServerRemoteNotificationConnectionListener *userNotificationServerRemoteNotificationConnectionListener;
  UNSUserNotificationServerConnectionListener *v90;
  UNSUserNotificationServerConnectionListener *userNotificationServerConnectionListener;
  UNSUserNotificationServerSettingsConnectionListener *v92;
  UNSUserNotificationServerSettingsConnectionListener *userNotificationServerSettingsConnectionListener;
  uint64_t v94;
  UNCNotificationSystemServiceListener *systemServiceListener;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  NSSet *systemSourceBundleIdentifiers;
  UNCBundleLibrarian *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  id v110;
  id v111;
  UNCBundleLibrarian *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  RBSProcessMonitor *processMonitor;
  NSObject *v117;
  id *v118;
  id v119;
  uint64_t v120;
  id v121;
  _QWORD block[4];
  id *v124;
  id v125;
  _QWORD v126[4];
  id v127;
  id location;
  _QWORD v129[4];
  id v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  objc_super v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v136.receiver = self;
  v136.super_class = (Class)UNSUserNotificationServer;
  v2 = -[UNSUserNotificationServer init](&v136, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UNSUserNotificationServer _registerLoggers](v2, "_registerLoggers");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.usernotificationsserver.SourceInstallation", v4);
    installedSourceQueue = v3->_installedSourceQueue;
    v3->_installedSourceQueue = (OS_dispatch_queue *)v5;

    v7 = (UNSContentProtectionManager *)objc_alloc_init(MEMORY[0x24BEBF4B8]);
    contentProtectionManager = v3->_contentProtectionManager;
    v3->_contentProtectionManager = v7;

    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    libraryDirectory = v3->_libraryDirectory;
    v3->_libraryDirectory = (NSString *)v10;

    -[NSString stringByAppendingPathComponent:](v3->_libraryDirectory, "stringByAppendingPathComponent:", CFSTR("UserNotifications"));
    v12 = objc_claimAutoreleasedReturnValue();
    directory = v3->_directory;
    v3->_directory = (NSString *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF3B0]), "initWithDirectory:", v3->_directory);
    librarian = v3->_librarian;
    v3->_librarian = (UNCBundleLibrarian *)v14;

    v16 = (UNCLocalizationService *)objc_alloc_init(MEMORY[0x24BEBF3C0]);
    localizationService = v3->_localizationService;
    v3->_localizationService = v16;

    v18 = (_UNNotificationCommunicationContextService *)objc_alloc_init(MEMORY[0x24BEBF568]);
    communicationContextService = v3->_communicationContextService;
    v3->_communicationContextService = v18;

    v20 = objc_alloc_init(UNSBadgeService);
    badgeService = v3->_badgeService;
    v3->_badgeService = v20;

    v22 = objc_alloc(MEMORY[0x24BEBF448]);
    v23 = v3->_directory;
    v24 = v3->_librarian;
    -[UNSContentProtectionManager classDStrategy](v3->_contentProtectionManager, "classDStrategy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v22, "initWithDirectory:librarian:repositoryProtectionStrategy:", v23, v24, v25);
    topicRepository = v3->_topicRepository;
    v3->_topicRepository = (UNCNotificationTopicRepository *)v26;

    if (UNCRemoteServicesNeeded())
    {
      v28 = (UNCNotificationCoreServiceClient *)objc_alloc_init(MEMORY[0x24BEBF3F0]);
      coreServiceClient = v3->_coreServiceClient;
      v3->_coreServiceClient = v28;

      -[UNCNotificationCoreServiceClient setDelegate:](v3->_coreServiceClient, "setDelegate:", v3);
    }
    if (UNCDaemonEnabled())
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF4E0]), "initWithServiceClient:", v3->_coreServiceClient);
      categoryRepository = v3->_categoryRepository;
      v3->_categoryRepository = (UNSNotificationCategoryRepository *)v30;

      v32 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF460]), "initWithServiceClient:", v3->_coreServiceClient);
      notificationRepository = v3->_notificationRepository;
      v3->_notificationRepository = (UNCNotificationRepository *)v32;

    }
    else
    {
      v34 = objc_alloc(MEMORY[0x24BEBF4C0]);
      v35 = v3->_librarian;
      v36 = v3->_directory;
      -[UNSContentProtectionManager classDStrategy](v3->_contentProtectionManager, "classDStrategy");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v34, "initWithDirectory:librarian:repositoryProtectionStrategy:", v36, v35, v37);
      v39 = v3->_categoryRepository;
      v3->_categoryRepository = (UNSNotificationCategoryRepository *)v38;

      v40 = objc_alloc(MEMORY[0x24BEBF3B8]);
      v41 = v3->_directory;
      v42 = v3->_librarian;
      -[UNSContentProtectionManager classCStrategyExcludedFromBackup](v3->_contentProtectionManager, "classCStrategyExcludedFromBackup");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v40, "initWithDirectory:librarian:repositoryProtectionStrategy:categoryRepository:badgeService:", v41, v42, v43, v3->_categoryRepository, v3->_badgeService);
      v45 = v3->_notificationRepository;
      v3->_notificationRepository = (UNCNotificationRepository *)v44;

      if (UNCRemoteServicesNeeded())
      {
        v46 = *MEMORY[0x24BEBF4F0];
        -[UNCNotificationRepository addObserver:forBundleIdentifier:](v3->_notificationRepository, "addObserver:forBundleIdentifier:", v3->_coreServiceClient, *MEMORY[0x24BEBF4F0]);
        -[UNSNotificationCategoryRepository addObserver:forBundleIdentifier:](v3->_categoryRepository, "addObserver:forBundleIdentifier:", v3->_coreServiceClient, v46);
      }
    }
    v47 = objc_alloc_init(UNSSummaryServiceAdapter);
    summaryService = v3->_summaryService;
    v3->_summaryService = v47;

    v49 = objc_alloc(MEMORY[0x24BEBF450]);
    v50 = v3->_librarian;
    v51 = v3->_directory;
    -[UNSContentProtectionManager classDStrategy](v3->_contentProtectionManager, "classDStrategy");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v49, "initWithDirectory:librarian:repositoryProtectionStrategy:", v51, v50, v52);
    pendingNotificationRepository = v3->_pendingNotificationRepository;
    v3->_pendingNotificationRepository = (UNCPendingNotificationRepository *)v53;

    v55 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF458]), "initWithDirectory:librarian:", v3->_directory, v3->_librarian);
    pushRegistrationRepository = v3->_pushRegistrationRepository;
    v3->_pushRegistrationRepository = (UNCPushRegistrationRepository *)v55;

    v57 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF408]), "initWithDirectory:librarian:", v3->_directory, v3->_librarian);
    notificationScheduleRepository = v3->_notificationScheduleRepository;
    v3->_notificationScheduleRepository = (UNCNotificationScheduleRepository *)v57;

    v59 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF3A8]), "initWithDirectory:librarian:", v3->_directory, v3->_librarian);
    attachmentsRepository = v3->_attachmentsRepository;
    v3->_attachmentsRepository = (UNCAttachmentsRepository *)v59;

    v61 = (UNCLocationMonitor *)objc_alloc_init(MEMORY[0x24BEBF3C8]);
    locationMonitor = v3->_locationMonitor;
    v3->_locationMonitor = v61;

    v63 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF410]), "initWithNotificationRepository:pendingNotificationRepository:notificationScheduleRepository:locationMonitor:", v3->_notificationRepository, v3->_pendingNotificationRepository, v3->_notificationScheduleRepository, v3->_locationMonitor);
    notificationSchedulingService = v3->_notificationSchedulingService;
    v3->_notificationSchedulingService = (UNCNotificationSchedulingService *)v63;

    v65 = -[UNSAttachmentsService initWithAttachmentsRepository:notificationRepository:notificationSchedulingService:pendingNotificationRepository:]([UNSAttachmentsService alloc], "initWithAttachmentsRepository:notificationRepository:notificationSchedulingService:pendingNotificationRepository:", v3->_attachmentsRepository, v3->_notificationRepository, v3->_notificationSchedulingService, v3->_pendingNotificationRepository);
    attachmentsService = v3->_attachmentsService;
    v3->_attachmentsService = v65;

    v67 = -[UNSApplicationLauncher initWithLocationMonitor:]([UNSApplicationLauncher alloc], "initWithLocationMonitor:", v3->_locationMonitor);
    applicationLauncher = v3->_applicationLauncher;
    v3->_applicationLauncher = v67;

    v69 = objc_alloc_init(UNSDaemonLauncher);
    daemonLauncher = v3->_daemonLauncher;
    v3->_daemonLauncher = v69;

    v71 = objc_alloc_init(UNSSettingsGateway);
    settingsGateway = v3->_settingsGateway;
    v3->_settingsGateway = v71;

    v73 = -[UNSDefaultDataProviderFactory initWithApplicationLauncher:daemonLauncher:categoryRepository:notificationRepository:attachmentsService:topicRepository:localizationService:summaryService:settingsGateway:]([UNSDefaultDataProviderFactory alloc], "initWithApplicationLauncher:daemonLauncher:categoryRepository:notificationRepository:attachmentsService:topicRepository:localizationService:summaryService:settingsGateway:", v3->_applicationLauncher, v3->_daemonLauncher, v3->_categoryRepository, v3->_notificationRepository, v3->_attachmentsService, v3->_topicRepository, v3->_localizationService, v3->_summaryService, v3->_settingsGateway);
    dataProviderFactory = v3->_dataProviderFactory;
    v3->_dataProviderFactory = v73;

    v75 = -[UNSNotificationSettingsService initWithSettingsGateway:]([UNSNotificationSettingsService alloc], "initWithSettingsGateway:", v3->_settingsGateway);
    notificationSettingsService = v3->_notificationSettingsService;
    v3->_notificationSettingsService = v75;

    v77 = -[UNSNotificationAuthorizationService initWithDataProviderFactory:settingsService:localizationService:]([UNSNotificationAuthorizationService alloc], "initWithDataProviderFactory:settingsService:localizationService:", v3->_dataProviderFactory, v3->_notificationSettingsService, v3->_localizationService);
    notificationAuthorizationService = v3->_notificationAuthorizationService;
    v3->_notificationAuthorizationService = v77;

    v79 = -[UNSApplicationService initWithApplicationLauncher:categoryRepository:localizationService:]([UNSApplicationService alloc], "initWithApplicationLauncher:categoryRepository:localizationService:", v3->_applicationLauncher, v3->_categoryRepository, v3->_localizationService);
    applicationService = v3->_applicationService;
    v3->_applicationService = v79;

    if ((UNCDaemonEnabled() & 1) == 0)
      -[UNCNotificationRepository setSettingsProvider:](v3->_notificationRepository, "setSettingsProvider:", v3->_notificationSettingsService);
    v81 = objc_alloc(MEMORY[0x24BEBF468]);
    v82 = v3->_notificationRepository;
    v83 = v3->_attachmentsService;
    v84 = v3->_pushRegistrationRepository;
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v81, "initWithNotificationRepository:attachmentsService:pushRegistrationRepository:platform:", v82, v83, v84, v85);
    remoteNotificationService = v3->_remoteNotificationService;
    v3->_remoteNotificationService = (UNCRemoteNotificationServer *)v86;

    v88 = -[UNSUserNotificationServerRemoteNotificationConnectionListener initWithRemoteNotificationService:]([UNSUserNotificationServerRemoteNotificationConnectionListener alloc], "initWithRemoteNotificationService:", v3->_remoteNotificationService);
    userNotificationServerRemoteNotificationConnectionListener = v3->_userNotificationServerRemoteNotificationConnectionListener;
    v3->_userNotificationServerRemoteNotificationConnectionListener = v88;

    v90 = -[UNSUserNotificationServerConnectionListener initWithCategoryRepository:notificationSchedulingService:notificationAuthorizationService:notificationSettingsService:notificationRepository:remoteNotificationConnectionListener:remoteNotificationService:applicationLauncher:attachmentsService:locationMonitor:topicRepository:localizationService:communicationContextService:]([UNSUserNotificationServerConnectionListener alloc], "initWithCategoryRepository:notificationSchedulingService:notificationAuthorizationService:notificationSettingsService:notificationRepository:remoteNotificationConnectionListener:remoteNotificationService:applicationLauncher:attachmentsService:locationMonitor:topicRepository:localizationService:communicationContextService:", v3->_categoryRepository, v3->_notificationSchedulingService, v3->_notificationAuthorizationService, v3->_notificationSettingsService, v3->_notificationRepository, v3->_userNotificationServerRemoteNotificationConnectionListener, v3->_remoteNotificationService, v3->_applicationLauncher, v3->_attachmentsService, v3->_locationMonitor, v3->_topicRepository, v3->_localizationService, v3->_communicationContextService);
    userNotificationServerConnectionListener = v3->_userNotificationServerConnectionListener;
    v3->_userNotificationServerConnectionListener = v90;

    v92 = -[UNSUserNotificationServerSettingsConnectionListener initWithNotificationSettingsService:]([UNSUserNotificationServerSettingsConnectionListener alloc], "initWithNotificationSettingsService:", v3->_notificationSettingsService);
    userNotificationServerSettingsConnectionListener = v3->_userNotificationServerSettingsConnectionListener;
    v3->_userNotificationServerSettingsConnectionListener = v92;

    if (UNCRemoteServicesNeeded())
    {
      v94 = objc_msgSend(objc_alloc(MEMORY[0x24BEBF430]), "initWithDelegate:", v3);
      systemServiceListener = v3->_systemServiceListener;
      v3->_systemServiceListener = (UNCNotificationSystemServiceListener *)v94;

      -[UNCNotificationSystemServiceListener activate](v3->_systemServiceListener, "activate");
    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSUserNotificationServer _loadAllSystemNotificationSourceDescriptions](v3, "_loadAllSystemNotificationSourceDescriptions");
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v98 = (id)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
    if (v99)
    {
      v100 = *(_QWORD *)v133;
      do
      {
        v101 = 0;
        do
        {
          if (*(_QWORD *)v133 != v100)
            objc_enumerationMutation(v98);
          objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * v101), "bundleIdentifier");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "addObject:", v102);
          objc_msgSend(v97, "addObject:", v102);

          ++v101;
        }
        while (v99 != v101);
        v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
      }
      while (v99);
    }

    v103 = objc_msgSend(v96, "copy");
    systemSourceBundleIdentifiers = v3->_systemSourceBundleIdentifiers;
    v3->_systemSourceBundleIdentifiers = (NSSet *)v103;

    v105 = v3->_librarian;
    -[NSString stringByAppendingPathComponent:](v3->_libraryDirectory, "stringByAppendingPathComponent:", CFSTR("UserNotificationsServer"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCBundleLibrarian migrateLibraryFromDirectory:toDirectory:](v105, "migrateLibraryFromDirectory:toDirectory:", v106, v3->_directory);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (void *)MEMORY[0x24BDC1540];
    v109 = MEMORY[0x24BDAC760];
    v129[0] = MEMORY[0x24BDAC760];
    v129[1] = 3221225472;
    v129[2] = __33__UNSUserNotificationServer_init__block_invoke;
    v129[3] = &unk_24D639F60;
    v110 = v107;
    v130 = v110;
    v111 = v97;
    v131 = v111;
    objc_msgSend(v108, "unc_enumerateApplicationRecordsEligibleToDeliverNotifications:", v129);
    v112 = v3->_librarian;
    v113 = (void *)objc_msgSend(v111, "copy");
    -[UNCBundleLibrarian bootstrapLibraryForBundleIdentifiers:](v112, "bootstrapLibraryForBundleIdentifiers:", v113);

    if ((UNCDaemonEnabled() & 1) == 0)
      -[UNSUserNotificationServer _migrateNotificationRepository](v3, "_migrateNotificationRepository");
    -[UNSUserNotificationServer _migrateAttachments](v3, "_migrateAttachments");
    -[UNSUserNotificationServer _removePushStore](v3, "_removePushStore");
    if ((UNCDaemonEnabled() & 1) == 0)
      -[UNSUserNotificationServer _validateNotificationRepository](v3, "_validateNotificationRepository");
    objc_initWeak(&location, v3);
    v114 = (void *)MEMORY[0x24BE80CC8];
    v126[0] = v109;
    v126[1] = 3221225472;
    v126[2] = __33__UNSUserNotificationServer_init__block_invoke_2;
    v126[3] = &unk_24D639FB0;
    objc_copyWeak(&v127, &location);
    objc_msgSend(v114, "monitorWithConfiguration:", v126);
    v115 = objc_claimAutoreleasedReturnValue();
    processMonitor = v3->_processMonitor;
    v3->_processMonitor = (RBSProcessMonitor *)v115;

    -[UNSUserNotificationServer _addObserverForApplicationStateRestore](v3, "_addObserverForApplicationStateRestore");
    -[UNSUserNotificationServer _addObserverForApplicationWorkspaceChanges](v3, "_addObserverForApplicationWorkspaceChanges");
    -[UNSUserNotificationServer _addObserverForBackgroundRefreshApplicationChanges](v3, "_addObserverForBackgroundRefreshApplicationChanges");
    -[UNSUserNotificationServer _addObserverForContentProtectionChanges](v3, "_addObserverForContentProtectionChanges");
    -[UNSUserNotificationServer _addObserverForDataProviderFactoryChanges](v3, "_addObserverForDataProviderFactoryChanges");
    -[UNSUserNotificationServer _addObserverForLocaleChanges](v3, "_addObserverForLocaleChanges");
    -[UNSUserNotificationServer _addObserverForRemoteNotificationServiceChanges](v3, "_addObserverForRemoteNotificationServiceChanges");
    -[UNSUserNotificationServer _addObserverForSignificantTimeChanges](v3, "_addObserverForSignificantTimeChanges");
    -[UNSUserNotificationServer initialSystemNotificationSourcesDidInstall:applicationsDidInstall:](v3, "initialSystemNotificationSourcesDidInstall:applicationsDidInstall:", v98, v110);
    if ((UNCDaemonEnabled() & 1) == 0)
      -[UNCNotificationRepository setDelegate:](v3->_notificationRepository, "setDelegate:", v3);
    dispatch_get_global_queue(0, 0);
    v117 = objc_claimAutoreleasedReturnValue();
    block[0] = v109;
    block[1] = 3221225472;
    block[2] = __33__UNSUserNotificationServer_init__block_invoke_4;
    block[3] = &unk_24D639C20;
    v118 = v3;
    v124 = v118;
    v119 = v111;
    v125 = v119;
    dispatch_async(v117, block);

    if (-[UNSContentProtectionManager deviceUnlockedSinceBoot](v3->_contentProtectionManager, "deviceUnlockedSinceBoot"))objc_msgSend(v118, "_ensureAttachmentsIntegrity");
    -[UNSUserNotificationServerConnectionListener resume](v3->_userNotificationServerConnectionListener, "resume");
    -[UNSUserNotificationServerRemoteNotificationConnectionListener resume](v3->_userNotificationServerRemoteNotificationConnectionListener, "resume");
    -[UNSUserNotificationServerSettingsConnectionListener resume](v3->_userNotificationServerSettingsConnectionListener, "resume");
    v120 = objc_opt_new();
    v121 = v118[35];
    v118[35] = (id)v120;

    objc_msgSend(v118[35], "setDelegate:", v118);
    UNSExampleUserNotificationCenterRegister();

    objc_destroyWeak(&v127);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __33__UNSUserNotificationServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "compatibilityObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

void __33__UNSUserNotificationServer_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v4, "setEndowmentNamespaces:", &unk_24D645FC0);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingProcessTypeApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v6);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__UNSUserNotificationServer_init__block_invoke_3;
  v7[3] = &unk_24D639F88;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  objc_msgSend(v3, "setUpdateHandler:", v7);
  objc_destroyWeak(&v8);

}

void __33__UNSUserNotificationServer_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v6, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_didChangeProcessState:forBundleIdentifier:", v8, v10);

}

void __33__UNSUserNotificationServer_init__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "notificationSourcesForBundleIdentifiers:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "sourceSettings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "notificationSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasEnabledSettings"))
        {
          objc_msgSend(v7, "sourceIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "didChangeNotificationSettings:forBundleIdentifier:", v9, v10);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "didCompleteInitialization");

}

- (id)_loadAllSystemNotificationSourceDescriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEBF420], "systemSourceDirectoryURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_56);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_57);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __73__UNSUserNotificationServer__loadAllSystemNotificationSourceDescriptions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1580];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __73__UNSUserNotificationServer__loadAllSystemNotificationSourceDescriptions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBF420], "systemSourcePathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __73__UNSUserNotificationServer__loadAllSystemNotificationSourceDescriptions__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BEBF420], "systemSourceDescriptionWithBundleURL:", a2);
}

- (void)initialSystemNotificationSourcesDidInstall:(id)a3 applicationsDidInstall:(id)a4
{
  id v6;
  id v7;
  NSObject *installedSourceQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  installedSourceQueue = self->_installedSourceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__UNSUserNotificationServer_initialSystemNotificationSourcesDidInstall_applicationsDidInstall___block_invoke;
  block[3] = &unk_24D639EA8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(installedSourceQueue, block);

}

void __95__UNSUserNotificationServer_initialSystemNotificationSourcesDidInstall_applicationsDidInstall___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_sourceDescriptionsForApplications:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "arrayByAddingObjectsFromArray:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_installedSourceQueue_notificationSourcesDidInstall:", v3);

}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  NSObject *installedSourceQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  UNSUserNotificationServer *v9;

  v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__UNSUserNotificationServer_applicationInstallsDidChange___block_invoke;
  v7[3] = &unk_24D639C20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(installedSourceQueue, v7);

}

void __58__UNSUserNotificationServer_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "correspondingApplicationRecord", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && objc_msgSend(v9, "isWebApp"))
          objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 40), "_applicationsDidInstall:", v2);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *installedSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__UNSUserNotificationServer_applicationsDidInstall___block_invoke;
  v7[3] = &unk_24D639C20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(installedSourceQueue, v7);

}

uint64_t __52__UNSUserNotificationServer_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationsDidInstall:", *(_QWORD *)(a1 + 40));
}

- (void)applicationStateDidChange:(id)a3
{
  id v4;
  NSObject *installedSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__UNSUserNotificationServer_applicationStateDidChange___block_invoke;
  v7[3] = &unk_24D639C20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(installedSourceQueue, v7);

}

uint64_t __55__UNSUserNotificationServer_applicationStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationsDidInstall:", *(_QWORD *)(a1 + 40));
}

- (BOOL)observeLaunchProhibitedApps
{
  return 1;
}

- (void)_applicationsDidInstall:(id)a3
{
  id v4;

  -[UNSUserNotificationServer _sourceDescriptionsForApplications:](self, "_sourceDescriptionsForApplications:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UNSUserNotificationServer _installedSourceQueue_notificationSourcesDidInstall:](self, "_installedSourceQueue_notificationSourcesDidInstall:", v4);

}

- (id)_sourceDescriptionsForApplications:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__UNSUserNotificationServer__sourceDescriptionsForApplications___block_invoke;
  v4[3] = &unk_24D63A078;
  v4[4] = self;
  objc_msgSend(a3, "bs_mapNoNulls:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __64__UNSUserNotificationServer__sourceDescriptionsForApplications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = a2;
  v5 = (void *)MEMORY[0x219A03098]();
  objc_msgSend(v4, "correspondingApplicationRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unc_isEligibleToDeliverNotifications");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEBF420], "applicationSourceDescriptionWithApplication:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "useDefaultDataProvider");
    if ((v9 & 1) == 0)
    {
      objc_msgSend(v8, "pushEnvironment");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v2)
        goto LABEL_7;
    }
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
    objc_msgSend(v8, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v9 & 1) == 0)
    if ((v12 & 1) == 0)
      v13 = v8;
    else
LABEL_7:
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }
  objc_autoreleasePoolPop(v5);

  return v13;
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *installedSourceQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  UNSUserNotificationServer *v9;

  v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_24D639C20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(installedSourceQueue, v7);

}

void __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke_2;
  v4[3] = &unk_24D63A078;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "bs_mapNoNulls:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_installedSourceQueue_notificationSourcesDidUninstall:", v3);

}

id __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEBF420], "applicationSourceDescriptionWithApplication:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useDefaultDataProvider");
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v4, "pushEnvironment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      goto LABEL_6;
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v5 & 1) == 0)
  if ((v8 & 1) == 0)
    v9 = v4;
  else
LABEL_6:
    v9 = 0;

  return v9;
}

- (BOOL)isApplicationForeground:(id)a3
{
  return -[UNSApplicationService isApplicationForeground:](self->_applicationService, "isApplicationForeground:", a3);
}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  -[UNSApplicationService willPresentNotification:forBundleIdentifier:withCompletionHandler:](self->_applicationService, "willPresentNotification:forBundleIdentifier:withCompletionHandler:", a3, a4, a5);
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UNCNotificationRepository contentProtectionStateChangedForFirstUnlock:](self->_notificationRepository, "contentProtectionStateChangedForFirstUnlock:");
  -[UNCPendingNotificationRepository contentProtectionStateChangedForFirstUnlock:](self->_pendingNotificationRepository, "contentProtectionStateChangedForFirstUnlock:", v3);
  -[UNSNotificationCategoryRepository contentProtectionStateChangedForFirstUnlock:](self->_categoryRepository, "contentProtectionStateChangedForFirstUnlock:", v3);
  -[UNCNotificationTopicRepository contentProtectionStateChangedForFirstUnlock:](self->_topicRepository, "contentProtectionStateChangedForFirstUnlock:", v3);
  -[UNSAttachmentsService contentProtectionStateChangedForFirstUnlock:](self->_attachmentsService, "contentProtectionStateChangedForFirstUnlock:", v3);
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  return -[UNSBadgeService badgeNumberForBundleIdentifier:](self->_badgeService, "badgeNumberForBundleIdentifier:", a3);
}

- (BOOL)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4
{
  return -[UNSBadgeService setBadgeValue:forBundleIdentifier:](self->_badgeService, "setBadgeValue:forBundleIdentifier:", a3, a4);
}

- (BOOL)setBadgeString:(id)a3 forBundleIdentifier:(id)a4
{
  return -[UNSBadgeService setBadgeValue:forBundleIdentifier:](self->_badgeService, "setBadgeValue:forBundleIdentifier:", a3, a4);
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UNCNotificationRepository notifyDidPerformUpdates:forBundleIdentifier:](self->_notificationRepository, "notifyDidPerformUpdates:forBundleIdentifier:", v7, v6);

}

- (void)notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UNCNotificationRepository notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier:](self->_notificationRepository, "notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier:", v4);

}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UNSNotificationCategoryRepository notifyDidChangeCategoriesForBundleIdentifier:](self->_categoryRepository, "notifyDidChangeCategoriesForBundleIdentifier:", v4);

}

- (void)_removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  UNCNotificationRepository *notificationRepository;
  void *v6;
  id v7;
  id v8;

  notificationRepository = self->_notificationRepository;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  objc_msgSend(v6, "setWithArray:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository removeNotificationRecordsForIdentifiers:bundleIdentifier:](notificationRepository, "removeNotificationRecordsForIdentifiers:bundleIdentifier:", v8, v7);

}

- (id)allBundleIdentifiersForCategories
{
  return (id)-[UNSNotificationCategoryRepository allBundleIdentifiers](self->_categoryRepository, "allBundleIdentifiers");
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return (id)-[UNSNotificationCategoryRepository categoriesForBundleIdentifier:](self->_categoryRepository, "categoriesForBundleIdentifier:", a3);
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return (id)-[UNSNotificationCategoryRepository categoryWithIdentifier:bundleIdentifier:](self->_categoryRepository, "categoryWithIdentifier:bundleIdentifier:", a3, a4);
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNSNotificationCategoryRepository setCategories:forBundleIdentifier:](self->_categoryRepository, "setCategories:forBundleIdentifier:", a3, a4);
}

- (void)_buildForegroundAction:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  UNCDecodeNotificationActionSelector();

}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  os_log_t *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15)
  {
    v16 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2;
    block[3] = &unk_24D639C70;
    v43 = *(id *)(a1 + 48);
    v42 = v15;
    dispatch_async(v16, block);

    v17 = v43;
  }
  else
  {
    v18 = (os_log_t *)MEMORY[0x24BDF8970];
    v19 = *MEMORY[0x24BDF8970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v45 = v11;
      v46 = 2112;
      v47 = v13;
      v48 = 2112;
      v49 = v12;
      v50 = 2112;
      v51 = v14;
      _os_log_impl(&dword_216DCB000, v19, OS_LOG_TYPE_DEFAULT, "bundleID: %@ performAction: %@ forNotification: %@ withUserText: %@", buf, 0x2Au);
    }
    objc_msgSend(*(id *)(a1 + 40), "localResponseForAction:notification:bundleID:userText:", v13, v12, v11, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v20 = objc_msgSend(v13, "isEqual:", *MEMORY[0x24BDF8A60]);
      objc_msgSend(*(id *)(a1 + 40), "localActionForAction:notification:bundleID:", v13, v12, v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v33, "options") & 4) != 0 || v20)
      {
        v25 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v45 = v13;
          v46 = 2112;
          v47 = v12;
          v48 = 2112;
          v49 = v14;
          _os_log_impl(&dword_216DCB000, v25, OS_LOG_TYPE_DEFAULT, "FOREGROUND sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
        }
        objc_msgSend(v17, "notification");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "request");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "content");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "launchImageName");
        v32 = objc_claimAutoreleasedReturnValue();

        v29 = *(_QWORD *)(a1 + 32);
        v30 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_62;
        v36[3] = &unk_24D63A0A0;
        v31 = *(void **)(a1 + 48);
        v22 = (void *)v32;
        v38 = v31;
        v37 = v11;
        objc_msgSend(v30, "foregroundLaunchOptionsForApplication:withResponse:launchImageName:origin:queue:completionHandler:", v37, v17, v32, 0, v29, v36);

      }
      else
      {
        v21 = *(NSObject **)(a1 + 32);
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2_64;
        v34[3] = &unk_24D639DB8;
        v35 = *(id *)(a1 + 48);
        dispatch_async(v21, v34);
        v22 = v35;
      }

      v24 = v33;
    }
    else
    {
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
        __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_cold_1();
      v23 = *(NSObject **)(a1 + 32);
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_60;
      v39[3] = &unk_24D639DB8;
      v40 = *(id *)(a1 + 48);
      dispatch_async(v23, v39);
      v24 = v40;
    }

  }
}

uint64_t __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_60(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_62(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;

  v4 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  if (a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v4, a3);
}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2_64(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)performAction:(id)a3 forNotification:(id)a4 inApp:(id)a5 withUserText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  UNSApplicationLauncher *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UNSApplicationLauncher *applicationLauncher;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  UNSUserNotificationServer *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (os_log_t *)MEMORY[0x24BDF8970];
  v15 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v39 = v12;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v11;
    v44 = 2112;
    v45 = v13;
    _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "bundleID: %@ performAction: %@ forNotification: %@ withUserText: %@", buf, 0x2Au);
  }
  -[UNSUserNotificationServer localResponseForAction:notification:bundleID:userText:](self, "localResponseForAction:notification:bundleID:userText:", v10, v11, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[UNSUserNotificationServer localActionForAction:notification:bundleID:](self, "localActionForAction:notification:bundleID:", v10, v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "options");
    v19 = *v14;
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if ((v18 & 4) != 0)
    {
      v27 = v17;
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        v39 = v10;
        v40 = 2112;
        v41 = v11;
        v42 = 2112;
        v43 = v13;
        _os_log_impl(&dword_216DCB000, v19, OS_LOG_TYPE_DEFAULT, "FOREGROUND sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
      }
      objc_msgSend(v16, "notification");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "request");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "content");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "launchImageName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      applicationLauncher = self->_applicationLauncher;
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke;
      v34[3] = &unk_24D63A0F0;
      v35 = v10;
      v36 = v11;
      v37 = v13;
      -[UNSApplicationLauncher foregroundLaunchApplication:withResponse:launchImageName:origin:endpoint:completionHandler:](applicationLauncher, "foregroundLaunchApplication:withResponse:launchImageName:origin:endpoint:completionHandler:", v12, v16, v22, 0, 0, v34);

      v17 = v27;
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        v39 = v10;
        v40 = 2112;
        v41 = v11;
        v42 = 2112;
        v43 = v13;
        _os_log_impl(&dword_216DCB000, v19, OS_LOG_TYPE_DEFAULT, "BACKGROUND APPLICATION sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
      }
      v21 = self->_applicationLauncher;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_67;
      v28[3] = &unk_24D63A118;
      v29 = v10;
      v30 = v11;
      v31 = v13;
      v32 = self;
      v33 = v12;
      -[UNSApplicationLauncher backgroundLaunchApplication:withResponse:completionHandler:](v21, "backgroundLaunchApplication:withResponse:completionHandler:", v33, v16, v28);

      v22 = v29;
    }

  }
  else if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
  {
    __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_cold_1();
  }

}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke(_QWORD *a1, char a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF8970];
  v4 = *MEMORY[0x24BDF8970];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = a1[5];
      v7 = a1[6];
      v8 = 138412802;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "FOREGROUND succeeded sendAction: %@ forNotification: %@ withUserText: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_cold_1();
  }
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_67(uint64_t a1, char a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF8970];
  v4 = *MEMORY[0x24BDF8970];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "BACKGROUND APPLICATION succeeded sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_68;
    block[3] = &unk_24D639EA8;
    block[4] = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_67_cold_1();
  }
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_68(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v4[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeNotificationRecordsForIdentifiers:bundleIdentifier:", v3, a1[6]);

}

- (id)localActionForAction:(id)a3 notification:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  char v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UNSDefaultDataProviderFactory bundleIdentifierToDataProvider](self->_dataProviderFactory, "bundleIdentifierToDataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UNCNotificationRepository notificationRecordForIdentifier:bundleIdentifier:](self->_notificationRepository, "notificationRecordForIdentifier:bundleIdentifier:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "categoryIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationCategoryRepository categoryWithIdentifier:bundleIdentifier:](self->_categoryRepository, "categoryWithIdentifier:bundleIdentifier:", v15, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = objc_alloc(MEMORY[0x24BEBF3E8]);
        objc_msgSend(v12, "bundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithBundle:", v18);

        if (v19)
        {
          objc_msgSend(v19, "notificationCategoryForNotificationCategoryRecord:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v20;
          if (v20)
          {
            v34 = v19;
            v35 = v16;
            v36 = v15;
            v37 = v9;
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            objc_msgSend(v20, "actions");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v40;
              v33 = v14;
              while (2)
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v40 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                  objc_msgSend(v26, "identifier", v33);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "isEqual:", v8);

                  if ((v28 & 1) != 0)
                  {
                    v29 = v26;

                    v9 = v37;
                    v14 = v33;
                    goto LABEL_30;
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
                v14 = v33;
                if (v23)
                  continue;
                break;
              }
            }

            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
              -[UNSUserNotificationServer localActionForAction:notification:bundleID:].cold.4();
            v29 = 0;
            v9 = v37;
LABEL_30:
            v16 = v35;
            v15 = v36;
            v19 = v34;
          }
          else
          {
            v31 = *MEMORY[0x24BDF8970];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v45 = v10;
              v46 = 2112;
              v47 = v12;
              v48 = 2112;
              v49 = v16;
              _os_log_error_impl(&dword_216DCB000, v31, OS_LOG_TYPE_ERROR, "bundleID: %@ NO CATEGORY found provider: %@, categoryRecord: %@", buf, 0x20u);
            }
            v29 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
            -[UNSUserNotificationServer localActionForAction:notification:bundleID:].cold.3();
          v29 = 0;
          v19 = 0;
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
          -[UNSUserNotificationServer localActionForAction:notification:bundleID:].cold.2();
        v29 = 0;
      }

    }
    else
    {
      v30 = *MEMORY[0x24BDF8970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v45 = v10;
        v46 = 2112;
        v47 = v12;
        v48 = 2112;
        v49 = v9;
        _os_log_error_impl(&dword_216DCB000, v30, OS_LOG_TYPE_ERROR, "bundleID: %@ NO NOTIFICATION RECORD found provider: %@, notification: %@", buf, 0x20u);
      }
      v29 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
      -[UNSUserNotificationServer localActionForAction:notification:bundleID:].cold.1();
    v29 = 0;
  }

  return v29;
}

- (id)localResponseForAction:(id)a3 notification:(id)a4 bundleID:(id)a5 userText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[UNSDefaultDataProviderFactory bundleIdentifierToDataProvider](self->_dataProviderFactory, "bundleIdentifierToDataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UNCNotificationRepository notificationRecordForIdentifier:bundleIdentifier:](self->_notificationRepository, "notificationRecordForIdentifier:bundleIdentifier:", v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x24BEBF400]);
      objc_msgSend(v15, "bundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithBundle:categoryRepository:", v18, self->_categoryRepository);

      if (v19)
      {
        objc_msgSend(v19, "notificationForNotificationRecord:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          if (v13)
            objc_msgSend(MEMORY[0x24BDF88A8], "responseWithNotification:actionIdentifier:userText:", v20, v10, v13);
          else
            objc_msgSend(MEMORY[0x24BDF8860], "responseWithNotification:actionIdentifier:", v20, v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = *MEMORY[0x24BDF8970];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
          {
            v25 = 138412802;
            v26 = v12;
            v27 = 2112;
            v28 = v19;
            v29 = 2112;
            v30 = v16;
            _os_log_error_impl(&dword_216DCB000, v23, OS_LOG_TYPE_ERROR, "bundleID: %@ NO NOTIFICATION found mapper: %@, record: %@", (uint8_t *)&v25, 0x20u);
          }
          v21 = 0;
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
          -[UNSUserNotificationServer localResponseForAction:notification:bundleID:userText:].cold.2();
        v21 = 0;
      }

    }
    else
    {
      v22 = *MEMORY[0x24BDF8970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
      {
        v25 = 138412802;
        v26 = v12;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v11;
        _os_log_error_impl(&dword_216DCB000, v22, OS_LOG_TYPE_ERROR, "bundleID: %@ NO NOTIFICATION RECORD found provider: %@, notification: %@", (uint8_t *)&v25, 0x20u);
      }
      v21 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
      -[UNSUserNotificationServer localActionForAction:notification:bundleID:].cold.1();
    v21 = 0;
  }

  return v21;
}

- (void)_migrateNotificationRepository
{
  -[UNCNotificationRepository performMigration](self->_notificationRepository, "performMigration");
}

- (void)_validateNotificationRepository
{
  -[UNCNotificationRepository performValidation](self->_notificationRepository, "performValidation");
}

- (void)_migrateAttachments
{
  -[UNCAttachmentsRepository performMigration](self->_attachmentsRepository, "performMigration");
}

- (void)_removePushStore
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[NSString stringByAppendingPathComponent:](self->_libraryDirectory, "stringByAppendingPathComponent:", CFSTR("SpringBoard"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PushStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v8 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v8);
    v6 = v8;
    if ((v5 & 1) == 0)
    {
      v7 = *MEMORY[0x24BDF89D0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v6;
        _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "Removing PushStore failed: %{public}@", buf, 0xCu);
      }
    }

  }
}

- (void)_addObserverForLocaleChanges
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__localeDidChange, *MEMORY[0x24BDBCA70], 0);

}

- (void)_localeDidChange
{
  -[UNCNotificationSchedulingService localeDidChange](self->_notificationSchedulingService, "localeDidChange");
}

- (void)_addObserverForBackgroundRefreshApplicationChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_UNSBackgroundRefreshApplicationsDidChange, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_applicationStateDidRestore
{
  -[UNCNotificationSchedulingService applicationStateDidRestore](self->_notificationSchedulingService, "applicationStateDidRestore");
}

- (void)_backgroundRefreshApplicationsDidChange
{
  -[UNCRemoteNotificationServer backgroundRefreshApplicationsDidChange](self->_remoteNotificationService, "backgroundRefreshApplicationsDidChange");
}

- (void)_addObserverForApplicationWorkspaceChanges
{
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_addObserverForContentProtectionChanges
{
  -[UNSContentProtectionManager addContentProtectionObserver:](self->_contentProtectionManager, "addContentProtectionObserver:", self);
}

- (void)_addObserverForDataProviderFactoryChanges
{
  -[UNSDefaultDataProviderFactory addObserver:](self->_dataProviderFactory, "addObserver:", self);
}

- (void)_addObserverForRemoteNotificationServiceChanges
{
  -[UNCRemoteNotificationServer setObserver:](self->_remoteNotificationService, "setObserver:", self);
}

- (void)_addObserverForSignificantTimeChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_UNSTimeDidChangeSignificantly, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_ensureAttachmentsIntegrity
{
  -[UNSAttachmentsService ensureIntegrityWithCompletionHandler:](self->_attachmentsService, "ensureIntegrityWithCompletionHandler:", &__block_literal_global_85);
}

void __56__UNSUserNotificationServer__ensureAttachmentsIntegrity__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = *MEMORY[0x24BDF8980];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_216DCB000, v0, OS_LOG_TYPE_DEFAULT, "Attachment integrity check complete", v1, 2u);
  }
}

- (void)_timeDidChangeSignificantly
{
  -[UNCNotificationSchedulingService timeDidChangeSignificantly](self->_notificationSchedulingService, "timeDidChangeSignificantly");
}

- (void)_triggerLocationArrowForBundleIdentifier:(id)a3
{
  -[UNCLocationMonitor markAsHavingReceivedLocation](self->_locationMonitor, "markAsHavingReceivedLocation", a3);
}

- (void)_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  UNSApplicationService *applicationService;
  id v7;
  id v8;

  applicationService = self->_applicationService;
  v7 = a4;
  v8 = a3;
  -[UNSApplicationService didChangeProcessState:forBundleIdentifier:](applicationService, "didChangeProcessState:forBundleIdentifier:", v8, v7);
  -[UNSNotificationAuthorizationService didChangeProcessState:forBundleIdentifier:](self->_notificationAuthorizationService, "didChangeProcessState:forBundleIdentifier:", v8, v7);
  -[UNCRemoteNotificationServer didChangeProcessState:forBundleIdentifier:](self->_remoteNotificationService, "didChangeProcessState:forBundleIdentifier:", v8, v7);

}

- (void)_installedSourceQueue_notificationSourcesDidInstall:(id)a3
{
  NSObject *installedSourceQueue;
  id v5;

  installedSourceQueue = self->_installedSourceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(installedSourceQueue);
  -[UNCLocalizationService notificationSourcesDidInstall:](self->_localizationService, "notificationSourcesDidInstall:", v5);
  -[UNSDefaultDataProviderFactory notificationSourcesDidInstall:](self->_dataProviderFactory, "notificationSourcesDidInstall:", v5);
  -[UNCNotificationRepository notificationSourcesDidInstall:](self->_notificationRepository, "notificationSourcesDidInstall:", v5);
  -[UNCRemoteNotificationServer notificationSourcesDidInstall:](self->_remoteNotificationService, "notificationSourcesDidInstall:", v5);

}

- (void)_installedSourceQueue_notificationSourcesDidUninstall:(id)a3
{
  NSObject *installedSourceQueue;
  id v5;

  installedSourceQueue = self->_installedSourceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(installedSourceQueue);
  -[UNSDefaultDataProviderFactory notificationSourcesDidUninstall:](self->_dataProviderFactory, "notificationSourcesDidUninstall:", v5);
  -[UNSAttachmentsService notificationSourcesDidUninstall:](self->_attachmentsService, "notificationSourcesDidUninstall:", v5);
  -[UNCNotificationRepository notificationSourcesDidInstall:](self->_notificationRepository, "notificationSourcesDidInstall:", v5);
  -[UNCNotificationSchedulingService notificationSourcesDidUninstall:](self->_notificationSchedulingService, "notificationSourcesDidUninstall:", v5);
  -[UNCRemoteNotificationServer notificationSourcesDidUninstall:](self->_remoteNotificationService, "notificationSourcesDidUninstall:", v5);
  -[UNCNotificationScheduleRepository notificationSourcesDidUninstall:](self->_notificationScheduleRepository, "notificationSourcesDidUninstall:", v5);
  -[UNCPendingNotificationRepository notificationSourcesDidUninstall:](self->_pendingNotificationRepository, "notificationSourcesDidUninstall:", v5);
  -[UNSNotificationCategoryRepository notificationSourcesDidUninstall:](self->_categoryRepository, "notificationSourcesDidUninstall:", v5);
  -[UNCNotificationTopicRepository notificationSourcesDidUninstall:](self->_topicRepository, "notificationSourcesDidUninstall:", v5);
  -[UNCLocalizationService notificationSourcesDidUninstall:](self->_localizationService, "notificationSourcesDidUninstall:", v5);
  -[UNSUserNotificationServer _removeNotificationSourceDirectories:](self, "_removeNotificationSourceDirectories:", v5);
  -[UNSUserNotificationServer _removeBundleLibrarianMappingsForSourceDescriptions:](self, "_removeBundleLibrarianMappingsForSourceDescriptions:", v5);

}

- (void)_removeNotificationSourceDirectories:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138543618;
    v17 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "bundleIdentifier", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCBundleLibrarian uniqueIdentifierForBundleIdentifier:](self->_librarian, "uniqueIdentifierForBundleIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "fileExistsAtPath:", v13))
        {
          v19 = 0;
          v14 = objc_msgSend(v5, "removeItemAtPath:error:", v13, &v19);
          v15 = v19;
          if ((v14 & 1) == 0)
          {
            v16 = *MEMORY[0x24BDF89D0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v25 = v13;
              v26 = 2114;
              v27 = v15;
              _os_log_impl(&dword_216DCB000, v16, OS_LOG_TYPE_DEFAULT, "Removing bundle directory '%{public}@' failed: %{public}@", buf, 0x16u);
            }
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

}

- (void)_removeBundleLibrarianMappingsForSourceDescriptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCBundleLibrarian removeMappingForBundleIdentifier:](self->_librarian, "removeMappingForBundleIdentifier:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverActionHandler, 0);
  objc_storeStrong((id *)&self->_installedSourceQueue, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_libraryDirectory, 0);
  objc_storeStrong((id *)&self->_systemSourceBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_summaryService, 0);
  objc_storeStrong((id *)&self->_coreServiceClient, 0);
  objc_storeStrong((id *)&self->_daemonLauncher, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_notificationScheduleRepository, 0);
  objc_storeStrong((id *)&self->_remoteNotificationService, 0);
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationSettingsService, 0);
  objc_storeStrong((id *)&self->_notificationAuthorizationService, 0);
  objc_storeStrong((id *)&self->_notificationSchedulingService, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_systemServiceListener, 0);
  objc_storeStrong((id *)&self->_userNotificationServerRemoteNotificationConnectionListener, 0);
  objc_storeStrong((id *)&self->_userNotificationServerSettingsConnectionListener, 0);
  objc_storeStrong((id *)&self->_userNotificationServerConnectionListener, 0);
  objc_storeStrong((id *)&self->_badgeService, 0);
  objc_storeStrong((id *)&self->_communicationContextService, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_attachmentsRepository, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_pushRegistrationRepository, 0);
}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "bundleID: %@ NO LOCAL RESPONSE FOUND", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_216DCB000, v0, v1, "FOREGROUND FAILED sendAction: %@ forNotification: %@ withUserText: %@", v2, v3, v4, v5, v6);
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_67_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_216DCB000, v0, v1, "BACKGROUND APPLICATION FAILED sendAction: %@ forNotification: %@ withUserText: %@", v2, v3, v4, v5, v6);
}

- (void)localActionForAction:notification:bundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "bundleID: %@ NO PROVIDER", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)localActionForAction:notification:bundleID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "bundleID: %@ NO CATEGORY RECORD found for action %@");
  OUTLINED_FUNCTION_2();
}

- (void)localActionForAction:notification:bundleID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "bundleID: %@ NO CATEGORY MAPPER found provider: %@");
  OUTLINED_FUNCTION_2();
}

- (void)localActionForAction:notification:bundleID:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "bundleID: %@ NO ACTION found provider: %@");
  OUTLINED_FUNCTION_2();
}

- (void)localResponseForAction:notification:bundleID:userText:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "bundleID: %@ NO NOTIFICATION MAPPER found provider: %@");
  OUTLINED_FUNCTION_2();
}

@end
