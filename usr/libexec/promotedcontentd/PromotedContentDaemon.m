@implementation PromotedContentDaemon

+ (id)sharedInstance
{
  if (qword_100268748 != -1)
    dispatch_once(&qword_100268748, &stru_10020E018);
  return (id)qword_100268740;
}

- (PromotedContentDaemon)init
{
  PromotedContentDaemon *v2;
  void *v3;
  void *v4;
  id v5;
  APRotationRouter *v6;
  APRotationRouter *rotationRouter;
  APPersistentCache *v8;
  APPersistentCache *cache;
  APMescalSigningRouter *v10;
  APMescalSigningRouter *mescalSigningListener;
  _TtC16promotedcontentd29ObservabilityXPCTimerActivity *v12;
  _TtC16promotedcontentd29ObservabilityXPCTimerActivity *observabilityTimerActivity;
  _TtC16promotedcontentd29ObservabilityXPCTimerActivity *v14;
  void *v15;
  void *v16;
  void *v17;
  APCacheStatusUpdater *v18;
  APCacheStatusUpdater *updater;
  APMetricsLegacyInterface *v20;
  APPCControllerRouter *v21;
  APPCControllerRouter *controllerListener;
  PCSupportRouter *v23;
  PCSupportRouter *supportListener;
  PCStatusConditionsRouter *v25;
  PCStatusConditionsRouter *statusConditionsListener;
  APAttributionRouter *v27;
  APAttributionRouter *attributionListener;
  id v29;
  APCacheGCActivity *v30;
  APXPCActivity *v31;
  APXPCActivity *gcActivity;
  APPCPolicyAdProcessor *v33;
  id v34;
  id v35;
  APPostInstallActivity *v36;
  APXPCActivity *v37;
  APXPCActivity *postInstallActivity;
  id v39;
  APDailyReportActivity *v40;
  APXPCActivity *v41;
  APXPCActivity *dailyReportActivity;
  id v43;
  APTimeSpentReportActivity *v44;
  APXPCActivity *v45;
  APXPCActivity *timeSpentReportActivity;
  APConfigSystemBackgroundTask *v47;
  APConfigSystemBackgroundTask *configSystemRequestTask;
  uint64_t v49;
  NSObject *v50;
  unsigned int v51;
  const __CFString *v52;
  objc_super v54;
  uint8_t buf[4];
  const __CFString *v56;

  v54.receiver = self;
  v54.super_class = (Class)PromotedContentDaemon;
  v2 = -[PromotedContentDaemon init](&v54, "init");
  if (v2)
  {
    if (!MKBDeviceUnlockedSinceBoot())
      APSimulateCrash(5, CFSTR("The daemon was started prior to a first device unlock"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
    objc_msgSend(v3, "setUpMainDatabase");

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APPromotedContentControllerDaemonModule setup](APPromotedContentControllerDaemonModule, "setup"));
    v5 = objc_alloc_init((Class)APNetworkClientConfig);
    objc_msgSend(v5, "setUseFixedHttpSessionManager:", objc_msgSend(v4, "httpUseFixedHttpSessionManager"));
    objc_msgSend(v4, "httpLookBackWindow");
    objc_msgSend(v5, "setLookBackWindow:");
    objc_msgSend(v5, "setHttpMaximumConnectionsPerHost:", objc_msgSend(v4, "httpMaximumConnectionsPerHost"));
    objc_msgSend(v5, "setHttpMaximumConnectionsPerHostTempSession:", objc_msgSend(v4, "httpMaximumConnectionsPerHostTempSession"));
    +[APNetworkClient createSharedNetworkClientWithConfig:](APNetworkClient, "createSharedNetworkClientWithConfig:", v5);
    v6 = objc_alloc_init(APRotationRouter);
    rotationRouter = v2->_rotationRouter;
    v2->_rotationRouter = v6;

    v8 = -[APPersistentCache initWithCacheSize:]([APPersistentCache alloc], "initWithCacheSize:", objc_msgSend(v4, "cacheSizeLimit"));
    cache = v2->_cache;
    v2->_cache = v8;

    v10 = -[APMescalSigningRouter initWithAMSProvider:]([APMescalSigningRouter alloc], "initWithAMSProvider:", objc_msgSend(v4, "useAMSMescal"));
    mescalSigningListener = v2->_mescalSigningListener;
    v2->_mescalSigningListener = v10;

    v12 = objc_alloc_init(_TtC16promotedcontentd29ObservabilityXPCTimerActivity);
    observabilityTimerActivity = v2->_observabilityTimerActivity;
    v2->_observabilityTimerActivity = v12;

    v14 = v2->_observabilityTimerActivity;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
    +[APGlobalState createWithTimerXPCActivity:database:](APGlobalState, "createWithTimerXPCActivity:database:", v14, v15);

    +[MetricsModule setup](MetricsModule, "setup");
    +[APPCBaseEventListener startListeners](APPCBaseEventListener, "startListeners");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "notificationRegistrar"));

    v18 = -[APCacheStatusUpdater initWithNotificationRegister:]([APCacheStatusUpdater alloc], "initWithNotificationRegister:", v17);
    updater = v2->_updater;
    v2->_updater = v18;

    v20 = objc_alloc_init(APMetricsLegacyInterface);
    +[APPCControllerMetricCoordinator startWithLegacyInterface:](APPCControllerMetricCoordinator, "startWithLegacyInterface:", v20);
    v21 = objc_alloc_init(APPCControllerRouter);
    controllerListener = v2->_controllerListener;
    v2->_controllerListener = v21;

    v23 = objc_alloc_init(PCSupportRouter);
    supportListener = v2->_supportListener;
    v2->_supportListener = v23;

    v25 = objc_alloc_init(PCStatusConditionsRouter);
    statusConditionsListener = v2->_statusConditionsListener;
    v2->_statusConditionsListener = v25;

    v27 = objc_alloc_init(APAttributionRouter);
    attributionListener = v2->_attributionListener;
    v2->_attributionListener = v27;

    +[MetricsModule start](MetricsModule, "start");
    -[ObservabilityXPCTimerActivity checkin](v2->_observabilityTimerActivity, "checkin");
    -[APPersistentCache start](v2->_cache, "start");
    v29 = objc_alloc((Class)APXPCActivity);
    v30 = -[APCacheGCActivity initWithCache:]([APCacheGCActivity alloc], "initWithCache:", v2->_cache);
    v31 = (APXPCActivity *)objc_msgSend(v29, "initWithDelegate:", v30);
    gcActivity = v2->_gcActivity;
    v2->_gcActivity = v31;

    -[APXPCActivity checkin](v2->_gcActivity, "checkin");
    v33 = objc_alloc_init(APPCPolicyAdProcessor);
    -[APPCPolicyAdProcessor processAdPolicyData](v33, "processAdPolicyData");
    v34 = objc_alloc_init((Class)APConfigurationStorage);
    v35 = objc_alloc((Class)APXPCActivity);
    v36 = -[APPostInstallActivity initWithConfigurationStorage:]([APPostInstallActivity alloc], "initWithConfigurationStorage:", v34);
    v37 = (APXPCActivity *)objc_msgSend(v35, "initWithDelegate:", v36);
    postInstallActivity = v2->_postInstallActivity;
    v2->_postInstallActivity = v37;

    -[APXPCActivity checkin](v2->_postInstallActivity, "checkin");
    v39 = objc_alloc((Class)APXPCActivity);
    v40 = objc_alloc_init(APDailyReportActivity);
    v41 = (APXPCActivity *)objc_msgSend(v39, "initWithDelegate:", v40);
    dailyReportActivity = v2->_dailyReportActivity;
    v2->_dailyReportActivity = v41;

    -[APXPCActivity schedule](v2->_dailyReportActivity, "schedule");
    v43 = objc_alloc((Class)APXPCActivity);
    v44 = -[APTimeSpentReportActivity initWithLegacyInterface:]([APTimeSpentReportActivity alloc], "initWithLegacyInterface:", v20);
    v45 = (APXPCActivity *)objc_msgSend(v43, "initWithDelegate:", v44);
    timeSpentReportActivity = v2->_timeSpentReportActivity;
    v2->_timeSpentReportActivity = v45;

    -[APXPCActivity checkin](v2->_timeSpentReportActivity, "checkin");
    v47 = -[APConfigSystemBackgroundTask initWithConfigurationStorage:]([APConfigSystemBackgroundTask alloc], "initWithConfigurationStorage:", v34);
    configSystemRequestTask = v2->_configSystemRequestTask;
    v2->_configSystemRequestTask = v47;

    -[APConfigSystemBackgroundTask registerTask](v2->_configSystemRequestTask, "registerTask");
    +[APGlobalState startWorkCoordinator](APGlobalState, "startWorkCoordinator");
    v49 = APLogForCategory(12);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = +[APSystemInfo firstRunSinceReboot](APSystemInfo, "firstRunSinceReboot");
      v52 = CFSTR("NOT ");
      if (v51)
        v52 = &stru_100219118;
      *(_DWORD *)buf = 138412290;
      v56 = v52;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Device has %@rebooted since last daemon launch", buf, 0xCu);
    }

  }
  return v2;
}

- (id)status
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Controller Listener:\t%@,\nMescal Signing Listener:\t%@,\nSupport Listener:\t%@,\nStatus Conditions Listener:\t%@"), self->_controllerListener, self->_mescalSigningListener, self->_supportListener, self->_statusConditionsListener);
}

- (APPCControllerRouter)controllerListener
{
  return self->_controllerListener;
}

- (void)setControllerListener:(id)a3
{
  objc_storeStrong((id *)&self->_controllerListener, a3);
}

- (APMescalSigningRouter)mescalSigningListener
{
  return self->_mescalSigningListener;
}

- (void)setMescalSigningListener:(id)a3
{
  objc_storeStrong((id *)&self->_mescalSigningListener, a3);
}

- (APCacheStatusUpdater)updater
{
  return self->_updater;
}

- (APPersistentCache)cache
{
  return self->_cache;
}

- (PCSupportRouter)supportListener
{
  return self->_supportListener;
}

- (void)setSupportListener:(id)a3
{
  objc_storeStrong((id *)&self->_supportListener, a3);
}

- (PCStatusConditionsRouter)statusConditionsListener
{
  return self->_statusConditionsListener;
}

- (void)setStatusConditionsListener:(id)a3
{
  objc_storeStrong((id *)&self->_statusConditionsListener, a3);
}

- (APAttributionRouter)attributionListener
{
  return self->_attributionListener;
}

- (void)setAttributionListener:(id)a3
{
  objc_storeStrong((id *)&self->_attributionListener, a3);
}

- (APXPCActivity)aesDownloadActivity
{
  return self->_aesDownloadActivity;
}

- (void)setAesDownloadActivity:(id)a3
{
  objc_storeStrong((id *)&self->_aesDownloadActivity, a3);
}

- (APXPCActivity)gcActivity
{
  return self->_gcActivity;
}

- (void)setGcActivity:(id)a3
{
  objc_storeStrong((id *)&self->_gcActivity, a3);
}

- (APRotationRouter)rotationRouter
{
  return self->_rotationRouter;
}

- (void)setRotationRouter:(id)a3
{
  objc_storeStrong((id *)&self->_rotationRouter, a3);
}

- (APXPCActivity)postInstallActivity
{
  return self->_postInstallActivity;
}

- (void)setPostInstallActivity:(id)a3
{
  objc_storeStrong((id *)&self->_postInstallActivity, a3);
}

- (APConfigurationRequester)configRequester
{
  return self->_configRequester;
}

- (void)setConfigRequester:(id)a3
{
  objc_storeStrong((id *)&self->_configRequester, a3);
}

- (APXPCActivity)dailyReportActivity
{
  return self->_dailyReportActivity;
}

- (void)setDailyReportActivity:(id)a3
{
  objc_storeStrong((id *)&self->_dailyReportActivity, a3);
}

- (_TtC16promotedcontentd29ObservabilityXPCTimerActivity)observabilityTimerActivity
{
  return self->_observabilityTimerActivity;
}

- (void)setObservabilityTimerActivity:(id)a3
{
  objc_storeStrong((id *)&self->_observabilityTimerActivity, a3);
}

- (APConfigSystemBackgroundTask)configSystemRequestTask
{
  return self->_configSystemRequestTask;
}

- (void)setConfigSystemRequestTask:(id)a3
{
  objc_storeStrong((id *)&self->_configSystemRequestTask, a3);
}

- (APXPCActivity)timeSpentReportActivity
{
  return self->_timeSpentReportActivity;
}

- (void)setTimeSpentReportActivity:(id)a3
{
  objc_storeStrong((id *)&self->_timeSpentReportActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSpentReportActivity, 0);
  objc_storeStrong((id *)&self->_configSystemRequestTask, 0);
  objc_storeStrong((id *)&self->_observabilityTimerActivity, 0);
  objc_storeStrong((id *)&self->_dailyReportActivity, 0);
  objc_storeStrong((id *)&self->_configRequester, 0);
  objc_storeStrong((id *)&self->_postInstallActivity, 0);
  objc_storeStrong((id *)&self->_rotationRouter, 0);
  objc_storeStrong((id *)&self->_gcActivity, 0);
  objc_storeStrong((id *)&self->_aesDownloadActivity, 0);
  objc_storeStrong((id *)&self->_attributionListener, 0);
  objc_storeStrong((id *)&self->_statusConditionsListener, 0);
  objc_storeStrong((id *)&self->_supportListener, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_mescalSigningListener, 0);
  objc_storeStrong((id *)&self->_controllerListener, 0);
}

@end
