@implementation ICICloudProgressIndicatorTracker

- (ICICloudProgressIndicatorTracker)initWithDelegate:(id)a3
{
  ICICloudProgressIndicatorTracker *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICICloudProgressIndicatorTracker;
  v3 = -[ICProgressIndicatorTracker initWithDelegate:](&v13, "initWithDelegate:", a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)ICSelectorDelayer), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v3, "updateMakingProgress", 0, 1, 0.15);
    -[ICICloudProgressIndicatorTracker setUpdateMakingProgressDelayer:](v3, "setUpdateMakingProgressDelayer:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "cloudOperationsDidChange:", ICCloudContextHasPendingOperationsDidChangeNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "migrationStateDidChange:", ICMigrationStateDidChangeNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "migrationStateDidChange:", CFSTR("ICCurrentDeviceMigrationStateDidChange"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, "legacyImportOperationsDidChange:", CFSTR("ICLegacyImportManagerOperationsDidChangeNotification"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = kReachabilityChangedNotification;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, "reachabilityChanged:", v10, v11);

    -[ICICloudProgressIndicatorTracker updateMakingProgress](v3, "updateMakingProgress");
  }
  return v3;
}

- (void)invalidate
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICICloudProgressIndicatorTracker;
  -[ICProgressIndicatorTracker invalidate](&v4, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICICloudProgressIndicatorTracker updateMakingProgressDelayer](self, "updateMakingProgressDelayer"));
  objc_msgSend(v3, "cancelPreviousFireRequests");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICICloudProgressIndicatorTracker;
  -[ICICloudProgressIndicatorTracker dealloc](&v4, "dealloc");
}

+ (BOOL)isMigratingICloudAccount:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  unsigned __int8 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", a3));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceMigrationState currentDeviceMigrationStateForAccount:createIfNecessary:](ICDeviceMigrationState, "currentDeviceMigrationStateForAccount:createIfNecessary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), 0, (_QWORD)v10));
        v8 = objc_msgSend(v7, "isMigrating");

        if ((v8 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

+ (BOOL)isMigratingLocalAccount
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser"));

  if (objc_msgSend(v3, "userType") == (id)1
    || !+[ICMigrationController didChooseToMigrateLocalAccount](ICMigrationController, "didChooseToMigrateLocalAccount"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = !+[ICMigrationController didMigrateLocalAccount](ICMigrationController, "didMigrateLocalAccount");
  }

  return v4;
}

- (void)cloudOperationsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F552C;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)migrationStateDidChange:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10040B980(v4, v5, v6, v7, v8, v9, v10, v11);

  -[ICICloudProgressIndicatorTracker updateMakingProgress](self, "updateMakingProgress");
}

- (void)updateMakingProgress
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000F5648;
  v2[3] = &unk_100550110;
  v2[4] = self;
  dispatchMainAfterDelay(v2, 0.0);
}

- (void)_performProgressUpdate
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;

  objc_initWeak(&location, self);
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICICloudProgressIndicatorTracker _performProgressUpdate]", 1, 0, CFSTR("Unexpected call from background thread"));
  if ((+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests") & 1) == 0)
  {
    if (-[ICICloudProgressIndicatorTracker isPerformingProgressUpdate](self, "isPerformingProgressUpdate"))
    {
      -[ICICloudProgressIndicatorTracker setNeedsPerformingProgressUpdateAfterCurrentIsComplete:](self, "setNeedsPerformingProgressUpdateAfterCurrentIsComplete:", 1);
    }
    else
    {
      -[ICICloudProgressIndicatorTracker setIsPerformingProgressUpdate:](self, "setIsPerformingProgressUpdate:", 1);
      v3 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        sub_10040B980(v3, v4, v5, v6, v7, v8, v9, v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000F57CC;
      v12[3] = &unk_100554CC0;
      objc_copyWeak(&v13, &location);
      v12[4] = self;
      objc_msgSend(v11, "performBackgroundTask:", v12);

      objc_destroyWeak(&v13);
    }
  }
  objc_destroyWeak(&location);
}

- (ICSelectorDelayer)updateMakingProgressDelayer
{
  return self->_updateMakingProgressDelayer;
}

- (void)setUpdateMakingProgressDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_updateMakingProgressDelayer, a3);
}

- (BOOL)isPerformingProgressUpdate
{
  return self->_isPerformingProgressUpdate;
}

- (void)setIsPerformingProgressUpdate:(BOOL)a3
{
  self->_isPerformingProgressUpdate = a3;
}

- (BOOL)needsPerformingProgressUpdateAfterCurrentIsComplete
{
  return self->_needsPerformingProgressUpdateAfterCurrentIsComplete;
}

- (void)setNeedsPerformingProgressUpdateAfterCurrentIsComplete:(BOOL)a3
{
  self->_needsPerformingProgressUpdateAfterCurrentIsComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateMakingProgressDelayer, 0);
}

@end
