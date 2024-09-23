@implementation BKUbiquityOptInController

- (void)_cleanupUserDefaults
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v2 = sub_100009780();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cleaning up NSUserDefaults", v10, 2u);
  }

  v4 = objc_alloc((Class)NSUserDefaults);
  v5 = objc_msgSend(v4, "initWithSuiteName:", BUBooksGroupContainerIdentifier);
  objc_msgSend(v5, "setInteger:forKey:", 4, CFSTR("BKUbiquitousLastAppVersion"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("BKUbiquitousOptedInToken"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("BKUbiquitousWelcomeReminderTrigger"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("BKCumulusEnabled.Collections"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("BKCumulusEnabled"));

}

- (IMUbiquityStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (BDSLiverpoolStatusMonitor)liverpoolStatusMonitor
{
  return self->_liverpoolStatusMonitor;
}

- (BKUbiquityOptInController)initWithStatusMonitor:(id)a3 liverpoolStatusMonitor:(id)a4
{
  id v7;
  id v8;
  BKUbiquityOptInController *v9;
  BKUbiquityOptInController *v10;
  NSMutableArray *v11;
  NSMutableArray *completionBlocks;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKUbiquityOptInController.m", 56, "-[BKUbiquityOptInController initWithStatusMonitor:liverpoolStatusMonitor:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v14.receiver = self;
  v14.super_class = (Class)BKUbiquityOptInController;
  v9 = -[BKUbiquityOptInController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statusMonitor, a3);
    objc_storeStrong((id *)&v10->_liverpoolStatusMonitor, a4);
    v11 = objc_opt_new(NSMutableArray);
    completionBlocks = v10->_completionBlocks;
    v10->_completionBlocks = v11;

    -[BKUbiquityOptInController _updateStatusMonitorsWithOptedIn:](v10, "_updateStatusMonitorsWithOptedIn:", 1);
    -[BKUbiquityOptInController _cleanupUserDefaults](v10, "_cleanupUserDefaults");
  }

  return v10;
}

- (void)finalizeSetup
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  BKUbiquityEligibilityManager *v9;
  BKUbiquityEligibilityManager *cloudEligibilityManager;
  IMUbiquityQuotaFetcher *v11;

  v11 = objc_opt_new(IMUbiquityQuotaFetcher);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceConformingToProtocol:", &OBJC_PROTOCOL___BKUbiquityEligibleBooksProviding));

  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKUbiquityEligibleBooksProviding, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_alloc((Class)BKUbiquityEligibilityManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityOptInController statusMonitor](self, "statusMonitor"));
  v9 = (BKUbiquityEligibilityManager *)objc_msgSend(v7, "initWithQuotaFetcher:eligibleBooksProvider:ubiquityStatusMonitor:", v11, v6, v8);
  cloudEligibilityManager = self->_cloudEligibilityManager;
  self->_cloudEligibilityManager = v9;

}

- (void)_updateStatusMonitorsWithOptedIn:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  v5 = sub_100009780();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1006A2158(v3, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityOptInController liverpoolStatusMonitor](self, "liverpoolStatusMonitor"));
  objc_msgSend(v7, "updateWithOptedIn:", v3);

}

- (void)setStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_statusMonitor, a3);
}

- (void)setLiverpoolStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_liverpoolStatusMonitor, a3);
}

- (BOOL)iBooksForiCloudIsEnabled
{
  return self->_iBooksForiCloudIsEnabled;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (BKUbiquityEligibilityManager)cloudEligibilityManager
{
  return self->_cloudEligibilityManager;
}

- (void)setCloudEligibilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_cloudEligibilityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudEligibilityManager, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_liverpoolStatusMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
}

@end
