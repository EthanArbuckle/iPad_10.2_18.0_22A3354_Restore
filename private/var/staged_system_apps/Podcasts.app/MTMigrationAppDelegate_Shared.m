@implementation MTMigrationAppDelegate_Shared

- (MTMigrationAppDelegate_Shared)init
{
  id v3;

  if (self)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    -[MTMigrationAppDelegate_Shared setQueuedInvocations:](self, "setQueuedInvocations:", v3);

  }
  return self;
}

- (void)willConnectScene
{
  MTSplashViewController *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
  v2 = objc_opt_new(MTSplashViewController);
  objc_msgSend(v3, "setRootViewController:", v2);

}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", v4);

  return v6;
}

- (id)createWindowWithScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "createWindowWithScene:", v4));

  return v6;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __uint64_t v10;
  id v11;
  id v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  MTBackgroundTaskScheduler *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_queue_global_t global_queue;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  _QWORD block[10];
  char v31;
  _QWORD v32[4];
  id v33;
  MTMigrationAppDelegate_Shared *v34;
  id v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[5];

  v36 = a3;
  v35 = a4;
  v37[0] = CFSTR("current_data_version");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[MTDB libraryDataVersion](MTDB, "libraryDataVersion")));
  v38[0] = v6;
  v37[1] = CFSTR("current_core_data_version");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[MTDB coreDataVersion](MTDB, "coreDataVersion")));
  v38[1] = v7;
  v38[2] = &off_1004D5D40;
  v37[2] = CFSTR("new_data_version");
  v37[3] = CFSTR("new_core_data_version");
  v38[3] = &off_1004D5D58;
  v37[4] = CFSTR("has_corrupt_db");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MTDB isCorrupt](MTDB, "isCorrupt")));
  v38[4] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 5));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("migration"), 0, v9);

  +[IMMetrics startTimer:](IMMetrics, "startTimer:", CFSTR("migration"));
  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v11 = +[MTDB libraryDataVersion](MTDB, "libraryDataVersion");
  v12 = +[MTDB coreDataVersion](MTDB, "coreDataVersion");
  LOBYTE(v9) = +[MTDB isCorrupt](MTDB, "isCorrupt");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v14 = (char *)objc_msgSend(v13, "integerForKey:", CFSTR("migrationAttemptCount"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  objc_msgSend(v15, "setInteger:forKey:", v14 + 1, CFSTR("migrationAttemptCount"));

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000AC714;
  v32[3] = &unk_1004A6640;
  v33 = v36;
  v34 = self;
  -[MTMigrationAppDelegate_Shared setProcessAssertion:](self, "setProcessAssertion:", objc_msgSend(v33, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Database migration"), v32));
  -[MTMigrationAppDelegate_Shared setIsMigrating:](self, "setIsMigrating:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTCarPlayMigrationBridge sharedInstance](MTCarPlayMigrationBridge, "sharedInstance"));
  objc_msgSend(v16, "setIsMigrating:", 1);

  +[MTBackgroundTaskScheduler registerBackgroundTaskClass:](MTBackgroundTaskScheduler, "registerBackgroundTaskClass:", objc_opt_class(MTFeedUpdateBackgroundTask));
  v17 = objc_alloc_init(MTBackgroundTaskScheduler);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  objc_msgSend(v18, "setBackgroundTaskScheduler:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared methodSignatureForSelector:](self, "methodSignatureForSelector:", "application:willFinishLaunchingWithOptions:"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v19));
  objc_msgSend(v20, "setSelector:", "application:willFinishLaunchingWithOptions:");
  objc_msgSend(v20, "setArgument:atIndex:", &v36, 2);
  objc_msgSend(v20, "setArgument:atIndex:", &v35, 3);
  -[MTMigrationAppDelegate_Shared forwardInvocation:](self, "forwardInvocation:", v20);
  global_queue = dispatch_get_global_queue(2, 0);
  v22 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC790;
  block[3] = &unk_1004A93F8;
  block[4] = self;
  block[5] = v10;
  block[6] = v11;
  block[7] = 70;
  block[8] = v12;
  block[9] = 141;
  v31 = (char)v9;
  dispatch_async(v22, block);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  v24 = objc_opt_respondsToSelector(v23, "createWindowWithScene:");
  if ((v24 & 1) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    if ((objc_opt_respondsToSelector(v11, "willConnectScene") & 1) != 0)
    {

LABEL_8:
      goto LABEL_9;
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  v26 = objc_opt_respondsToSelector(v25, "createWindowForApplication:");

  if ((v24 & 1) != 0)
  if ((v26 & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "createWindowForApplication:", v36));
    -[MTMigrationAppDelegate_Shared setWindow:](self, "setWindow:", v28);

    -[MTMigrationAppDelegate_Shared willConnectScene](self, "willConnectScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
    objc_msgSend(v23, "makeKeyAndVisible");
    goto LABEL_8;
  }
LABEL_9:

  return 1;
}

- (void)finishMigration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[MTMigrationAppDelegate_Shared setIsMigrating:](self, "setIsMigrating:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "setDelegate:", v3);

  -[MTMigrationAppDelegate_Shared flushInvocations](self, "flushInvocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  if ((objc_opt_respondsToSelector(v5, "createWindowWithScene:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    v7 = objc_opt_respondsToSelector(v6, "willConnectScene");

    if ((v7 & 1) == 0)
      goto LABEL_5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "createWindowWithScene:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    objc_msgSend(v12, "setWindow:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    objc_msgSend(v13, "willConnectScene");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    objc_msgSend(v14, "makeKeyAndVisible");

  }
LABEL_5:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTCarPlayMigrationBridge sharedInstance](MTCarPlayMigrationBridge, "sharedInstance"));
  objc_msgSend(v15, "setIsMigrating:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
  objc_msgSend(v16, "setHidden:", 1);

  -[MTMigrationAppDelegate_Shared setWindow:](self, "setWindow:", 0);
  if (-[MTMigrationAppDelegate_Shared processAssertion](self, "processAssertion"))
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v17, "endBackgroundTask:", -[MTMigrationAppDelegate_Shared processAssertion](self, "processAssertion"));

  }
}

- (UIWindow)window
{
  return self->window;
}

- (unint64_t)processAssertion
{
  return self->_processAssertion;
}

- (void)flushInvocations
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations"));
  objc_sync_enter(v3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
        objc_msgSend(v8, "invokeWithTarget:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "methodSignatureForSelector:", a3));

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  LOBYTE(a3) = objc_opt_respondsToSelector(v4, a3);

  return a3 & 1;
}

- (MTAppDelegateProtocol)appDelegate
{
  MTAppDelegateProtocol *appDelegate;
  MTAppDelegateProtocol *v4;
  MTAppDelegateProtocol *v5;

  appDelegate = self->_appDelegate;
  if (!appDelegate)
  {
    v4 = (MTAppDelegateProtocol *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(self), "appDelegateClass"));
    v5 = self->_appDelegate;
    self->_appDelegate = v4;

    appDelegate = self->_appDelegate;
  }
  return appDelegate;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[MTMigrationAppDelegate_Shared isMigrating](self, "isMigrating"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations"));
    objc_sync_enter(v4);
    objc_msgSend(v6, "retainArguments");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations"));
    objc_msgSend(v5, "addObject:", v6);

    objc_sync_exit(v4);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    objc_msgSend(v6, "invokeWithTarget:", v4);
  }

}

- (NSMutableArray)queuedInvocations
{
  return self->_queuedInvocations;
}

- (BOOL)isMigrating
{
  return self->_isMigrating;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->window, a3);
}

- (void)setQueuedInvocations:(id)a3
{
  objc_storeStrong((id *)&self->_queuedInvocations, a3);
}

- (void)setProcessAssertion:(unint64_t)a3
{
  self->_processAssertion = a3;
}

- (void)setIsMigrating:(BOOL)a3
{
  self->_isMigrating = a3;
}

- (BOOL)didBecomeActiveWhileMigrating
{
  return self->_didBecomeActiveWhileMigrating;
}

+ (Class)appDelegateClass
{
  return 0;
}

- (void)applicationDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MTMigrationAppDelegate_Shared setDidBecomeActiveWhileMigrating:](self, "setDidBecomeActiveWhileMigrating:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared methodSignatureForSelector:](self, "methodSignatureForSelector:", "applicationDidBecomeActive:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v4));
  objc_msgSend(v5, "setSelector:", "applicationDidBecomeActive:");
  objc_msgSend(v5, "setArgument:atIndex:", &v6, 2);
  -[MTMigrationAppDelegate_Shared forwardInvocation:](self, "forwardInvocation:", v5);

}

- (void)showIncompatibleDBDialog
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  const __CFString *v6;
  int64_t v7;
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
  _QWORD v18[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v4 = objc_msgSend(v3, "isLibrarySyncEnabled");

  v5 = CFSTR("INCOMPATIBLE_DB_BUTTON_WITHOUT_SYNC");
  if (v4)
  {
    v5 = CFSTR("INCOMPATIBLE_DB_BUTTON_WITH_SYNC");
    v6 = CFSTR("INCOMPATIBLE_DB_MESSAGE_WITH_SYNC");
  }
  else
  {
    v6 = CFSTR("INCOMPATIBLE_DB_MESSAGE_WITHOUT_SYNC");
  }
  v7 = -[MTMigrationAppDelegate_Shared alertControllerStyleForInterfaceIdiom](self, "alertControllerStyleForInterfaceIdiom", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INCOMPATIBLE_DB_TITLE"), &stru_1004C6D40, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v6, &stru_1004C6D40, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v11, v7));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v17, &stru_1004C6D40, 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000ACE6C;
  v18[3] = &unk_1004A9420;
  v18[4] = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v18));
  objc_msgSend(v12, "addAction:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController mt_rootViewController](UIViewController, "mt_rootViewController"));
  objc_msgSend(v16, "presentViewController:animated:completion:", v12, 1, 0);

}

- (int64_t)alertControllerStyleForInterfaceIdiom
{
  return 0;
}

- (void)performIncompatibleDBDialogAction
{
  objc_msgSend((id)objc_opt_class(self), "destroyAndRebuildDatabase");
  -[MTMigrationAppDelegate_Shared finishMigration](self, "finishMigration");
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  LOBYTE(a3) = objc_opt_isKindOfClass(v4, a3);

  return a3 & 1;
}

+ (void)destroyAndRebuildDatabase
{
  uint64_t v3;
  NSObject *v4;
  id v5;
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
  uint8_t buf[16];

  v3 = _MTLogCategoryDatabase(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Rebuilding library database", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd-hh:mm:ss"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("backup_%@"), v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryPath](MTDB, "libraryPath"));
  objc_msgSend(a1, "moveSourceFile:toPath:", v12, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryShmPath](MTDB, "libraryShmPath"));
  objc_msgSend(a1, "moveSourceFile:toPath:", v13, v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryWalPath](MTDB, "libraryWalPath"));
  objc_msgSend(a1, "moveSourceFile:toPath:", v14, v10);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  objc_msgSend(v15, "resetMetadataToInitialState");

  +[MTDB setCorrupt:](MTDB, "setCorrupt:", 0);
  +[MTLibraryMigrator needsMigration](MTLibraryMigrator, "needsMigration");

}

+ (void)moveSourceFile:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v9));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v8, "moveItemAtURL:toURL:error:", v6, v7, 0);

}

- (void)setAppDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_appDelegate, a3);
}

- (void)setDidBecomeActiveWhileMigrating:(BOOL)a3
{
  self->_didBecomeActiveWhileMigrating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
  objc_storeStrong((id *)&self->_appDelegate, 0);
  objc_storeStrong((id *)&self->window, 0);
}

@end
