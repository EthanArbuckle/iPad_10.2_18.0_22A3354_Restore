@implementation ICAppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;

  v5 = a4;
  v6 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315394;
    v18 = "-[ICAppDelegate application:willFinishLaunchingWithOptions:]";
    v19 = 1024;
    v20 = 286;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v17, 0x12u);
  }
  v7 = 721457;

  if (+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests")
    && !+[ICDeviceSupport isRunningDuoTests](ICDeviceSupport, "isRunningDuoTests"))
  {
    v7 = 4915760;
  }
  +[ICNoteContext startSharedContextWithOptions:](ICNoteContext, "startSharedContextWithOptions:", v7);
  +[ICNoteContext importArchivesForCurrentLaunchConfigurationIfNeeded](ICNoteContext, "importArchivesForCurrentLaunchConfigurationIfNeeded");
  +[ICAccount initializeLocalAccountNamesInBackground](ICAccount, "initializeLocalAccountNamesInBackground");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIApplicationLaunchOptionsURLKey));
  -[ICAppDelegate setLaunchURL:](self, "setLaunchURL:", v8);

  if (-[ICAppDelegate isRunningPPT](self, "isRunningPPT"))
    +[ICNAOptedInObject disableAnalytics](ICNAOptedInObject, "disableAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIApplicationLaunchOptionsSourceApplicationKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate analyticsController](self, "analyticsController"));
  objc_msgSend(v10, "startAppSession");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate launchURL](self, "launchURL"));
  -[ICAppDelegate startAnalyticsSessionWithReferralURL:referralApplication:](self, "startAnalyticsSessionWithReferralURL:referralApplication:", v11, v9);

  if (ICIsSandboxModeEnabled())
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "registerDefaults:", &off_10057C760);

  }
  global_queue = dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v14, &stru_100551420);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "applicationWillResignActive:", UIApplicationWillResignActiveNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "persistentContainerWillLockDatabase:", ICPersistentContainerWillLockDatabaseNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "persistentContainerDidUnlockDatabase:", ICPersistentContainerDidUnlockDatabaseNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "managedObjectContextWillSave:", NSManagedObjectContextWillSaveNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "managedObjectContextDidSave:", NSManagedObjectContextDidSaveNotification, 0);

  return 1;
}

- (NSArray)viewControllerManagers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate windows](self, "windows"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ic_compactMap:", &stru_100551400));

  return (NSArray *)v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  ICNotesCloudContextDelegate *v10;
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
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;

  v6 = a4;
  v7 = a3;
  v8 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315394;
    v30 = "-[ICAppDelegate application:didFinishLaunchingWithOptions:]";
    v31 = 1024;
    v32 = 332;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v29, 0x12u);
  }

  self->_isLaunchedInBackground = objc_msgSend(v7, "applicationState") == (id)2;
  -[ICAppDelegate setExtendedLaunchTimeIsLogged:](self, "setExtendedLaunchTimeIsLogged:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  objc_msgSend(v9, "application:didFinishLaunchingWithOptions:", v7, v6);

  v10 = objc_alloc_init(ICNotesCloudContextDelegate);
  -[ICAppDelegate setCloudContextDelegate:](self, "setCloudContextDelegate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate cloudContextDelegate](self, "cloudContextDelegate"));
  objc_msgSend(v11, "setCloudContextDelegate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICNACloudOperationEventReporter sharedReporter](ICNACloudOperationEventReporter, "sharedReporter"));
  objc_msgSend(v13, "setCloudAnalyticsDelegate:", v14);

  +[ICRemoteFileAttachmentDownloader initializeDownloaderAfterDelayIfNecessary](ICRemoteFileAttachmentDownloader, "initializeDownloaderAfterDelayIfNecessary");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
  objc_msgSend(v16, "setCollaborationControllerDelegate:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
  objc_msgSend(v18, "setCollaborationAnalyticsDelegate:", v17);

  -[ICAppDelegate registerForNotifications](self, "registerForNotifications");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate launchURL](self, "launchURL"));
  -[ICAppDelegate setLaunchingQuickNoteViaPencil:](self, "setLaunchingQuickNoteViaPencil:", +[ICAppURLUtilities isLaunchingQuickNoteViaPencil:](ICAppURLUtilities, "isLaunchingQuickNoteViaPencil:", v19));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", UIApplicationLaunchOptionsUserActivityDictionaryKey));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", UIApplicationLaunchOptionsUserActivityTypeKey));
    v22 = objc_msgSend(v21, "isEqualToString:", CSSearchableItemActionType);

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("UIApplicationLaunchOptionsUserActivityKey")));
      -[ICAppDelegate setLaunchUserActivity:](self, "setLaunchUserActivity:", v23);

    }
  }
  if (!self->_isLaunchedInBackground)
    -[ICAppDelegate finishLaunching](self, "finishLaunching");
  -[ICAppDelegate registerBackgroundTasks](self, "registerBackgroundTasks");
  v24 = objc_alloc_init((Class)ICRegulatoryLogger);
  -[ICAppDelegate setRegulatoryLogger:](self, "setRegulatoryLogger:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  objc_msgSend(v25, "applicationDidFinishLaunching");

  v26 = +[ICAppIntentsManager registerDependencies](_TtC11MobileNotes19ICAppIntentsManager, "registerDependencies");
  if (ICDebugModeEnabled(v26, v27))
    +[ICGroupActivityDebugStatusController setUp](ICGroupActivityDebugStatusController, "setUp");
  +[ICFastSyncPresenceController setUp](ICFastSyncPresenceController, "setUp");

  return 1;
}

- (void)finishLaunching
{
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v8;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[4];
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;

  v3 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[ICAppDelegate finishLaunching]";
    v35 = 1024;
    v36 = 519;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  objc_initWeak((id *)buf, self);
  v4 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060C0C;
  block[3] = &unk_10054FF58;
  objc_copyWeak(&v31, (id *)buf);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "accountWillBeDeleted:", ICAccountWillBeDeletedNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "accountsDidChange:", ICAccountsDidChangeNotification, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "authenticationStateDidDeauthenticate:", ICAuthenticationStateDidDeauthenticateNotification, v6);

  objc_msgSend(v5, "addObserver:selector:name:object:", self, "mentionNotificationWillSend:", ICMentionNotificationControllerWillSendNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "mentionNotificationDidSend:", ICMentionNotificationControllerDidSendNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "newShareCreatedOrSynced:", ICNotesCloudContextDidFetchShareNotification, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v8 = (const __CFString *)ICInternalPreferencesChangedNotification();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100060C4C, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)sub_100060C4C, CFSTR("com.apple.springboard.lockcomplete"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)sub_100060C4C, CFSTR("GSEventHardwareKeyboardAttached"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v11, "ic_addObserver:forKeyPath:context:", self, ICSettingsNoteListSortTypeKey, &off_1005CD1F0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v12, "ic_addObserver:forKeyPath:context:", self, ICFolderCustomNoteSortTypeQuerySortKey, &off_1005CD1F0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v13, "ic_addObserver:forKeyPath:context:", self, ICSettingsNoteDateHeadersTypeKey, &off_1005CD1F0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v14, "ic_addObserver:forKeyPath:context:", self, ICSettingsQueryDateHeadersTypeKey, &off_1005CD1F0);

  self->_isActive = 1;
  if (-[ICAppDelegate isRunningPPT](self, "isRunningPPT"))
  {
    if (ICUseCoreDataCoreSpotlightIntegration())
    {
      v15 = (os_log_t)objc_claimAutoreleasedReturnValue(+[ICCDCSIReindexer sharedReindexer](ICCDCSIReindexer, "sharedReindexer"));
      -[NSObject stopIndexing](v15, "stopIndexing");
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
      objc_msgSend(v16, "setDisabled:", 1);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
      objc_msgSend(v17, "stopObservingChanges");

      v15 = os_log_create("com.apple.notes", "Test");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_100022FD0();
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate window](self, "window"));
  +[ICLongRunningTaskController setMainWindow:](ICLongRunningTaskController, "setMainWindow:", v18);

  -[ICAppDelegate setDelayedLockProtectedNotesTask:](self, "setDelayedLockProtectedNotesTask:", UIBackgroundTaskInvalid);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "arguments"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v25, "isEqualToString:", CFSTR("TestScrollNotesList"), (_QWORD)v26))
        {
          -[ICAppDelegate testScrollNotesList](self, "testScrollNotesList");
          goto LABEL_21;
        }
        if (objc_msgSend(v25, "isEqualToString:", CFSTR("TestScrollNote")))
        {
          -[ICAppDelegate testScrollNote](self, "testScrollNote");
          goto LABEL_21;
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_21:

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (id)windows
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "_windows", (_QWORD)v13));
        objc_msgSend(v2, "ic_addObjectsFromNonNilArray:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(v2, "copy");
  return v11;
}

- (void)didShowFolderList
{
  if ((byte_1005DDE71 & 1) == 0
    && objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowAccountsList")))
  {
    if (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowAccountsList")))
    {
      if (byte_1005DDE88 == 1)
      {
        objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICDelaySubTest"), qword_1005DDE58);
        byte_1005DDE88 = 0;
      }
      else
      {
        objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICAnimationSubTest"), qword_1005DDE58);
      }
    }
    objc_msgSend(UIApp, "finishedTest:", qword_1005DDE58);
  }
}

- (void)didFinishExtendedLaunch
{
  void *v3;
  void *v4;

  if (!-[ICAppDelegate extendedLaunchTimeIsLogged](self, "extendedLaunchTimeIsLogged"))
  {
    if (objc_msgSend(UIApp, "shouldRecordExtendedLaunchTime"))
    {
      v3 = (void *)UIApp;
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "_launchTestName"));
      objc_msgSend(v3, "finishedTest:", v4);

      -[ICAppDelegate setExtendedLaunchTimeIsLogged:](self, "setExtendedLaunchTimeIsLogged:", 1);
    }
  }
}

- (BOOL)isReadyForDelayedLaunchTasks
{
  return self->_isReadyForDelayedLaunchTasks;
}

- (UIWindow)window
{
  return self->_window;
}

- (NSNumber)userNotificationsAllowed
{
  return self->_userNotificationsAllowed;
}

- (void)startAnalyticsSessionWithReferralURL:(id)a3 referralApplication:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICAppDelegate analyticsController](self, "analyticsController"));
  objc_msgSend(v8, "startSessionWithReferralURL:referralApplication:startingSessionType:", v7, v6, ICNASessionTypeGlobal);

}

- (BOOL)showMigrationStartupScreenIfNecessary
{
  _BOOL4 v3;

  v3 = -[ICAppDelegate shouldShowMigrationScreen](self, "shouldShowMigrationScreen");
  if (v3)
    -[ICAppDelegate showStartupWithCompletionBlock:](self, "showStartupWithCompletionBlock:", 0);
  return v3;
}

- (BOOL)shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount
{
  return self->_shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount;
}

- (BOOL)shouldShowMigrationScreen
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (-[ICAppDelegate shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount](self, "shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v4));

    if (v5 && (objc_msgSend(v5, "didChooseToMigrate") & 1) == 0)
    {
      -[ICAppDelegate setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:](self, "setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:", 0);
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentUser"));
  v9 = objc_msgSend(v8, "userType");

  if (v9 == (id)1)
  {
    +[ICStartupController setHasShownWelcomeScreen:](ICStartupController, "setHasShownWelcomeScreen:", 1);
    +[ICMigrationController upgradeEmptyLocalLegacyAccountIfNecessary](ICMigrationController, "upgradeEmptyLocalLegacyAccountIfNecessary");
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14);
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "systemPaperViewController"));

          if (v16)
          {

            return 0;
          }
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }

  if ((v6 & 1) != 0)
    return 1;
  if (-[ICAppDelegate resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary](self, "resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary"))
  {
    return 0;
  }
  return +[ICStartupController shouldShowWelcomeOrWhatsNewScreen](ICStartupController, "shouldShowWelcomeOrWhatsNewScreen");
}

- (id)sharedInstanceInit
{
  ICAppDelegate *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *backgroundTasks;
  uint64_t v5;
  NSMapTable *managedObjectContextSaveTasks;
  uint64_t v7;
  NSUUID *databaseLockBackgroundTaskIdentifier;
  objc_super v10;

  v2 = self;
  v10.receiver = v2;
  v10.super_class = (Class)ICAppDelegate;

  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  backgroundTasks = v2->_backgroundTasks;
  v2->_backgroundTasks = v3;

  v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  managedObjectContextSaveTasks = v2->_managedObjectContextSaveTasks;
  v2->_managedObjectContextSaveTasks = (NSMapTable *)v5;

  v7 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  databaseLockBackgroundTaskIdentifier = v2->_databaseLockBackgroundTaskIdentifier;
  v2->_databaseLockBackgroundTaskIdentifier = (NSUUID *)v7;

  return v2;
}

- (void)setUserNotificationsAllowed:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationsAllowed, a3);
}

- (void)setRegulatoryLogger:(id)a3
{
  objc_storeStrong((id *)&self->_regulatoryLogger, a3);
}

- (void)setLaunchingQuickNoteViaPencil:(BOOL)a3
{
  self->_launchingQuickNoteViaPencil = a3;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setInhibitMigrationScreenCheckOnForgroundNotification:(BOOL)a3
{
  self->_inhibitMigrationScreenCheckOnForgroundNotification = a3;
}

- (void)setExtendedLaunchTimeIsLogged:(BOOL)a3
{
  self->_extendedLaunchTimeIsLogged = a3;
}

- (void)setDelayedLockProtectedNotesTask:(unint64_t)a3
{
  self->_delayedLockProtectedNotesTask = a3;
}

- (void)setCloudContextDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContextDelegate, a3);
}

- (BOOL)resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  v3 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ICAppDelegate resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary]";
    v10 = 1024;
    v11 = 1338;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v4 = +[ICStartupController consumeShouldResetMigrationStateInternalSetting](ICStartupController, "consumeShouldResetMigrationStateInternalSetting");
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000647A4;
    block[3] = &unk_100550110;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObjectForKey:", kICInternalSettingsResetMigrationStateDefaultKey);

  return v4;
}

- (void)registerForNotifications
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "registerForRemoteNotifications");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v4, "setDelegate:", self);

}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (BOOL)isRunningPPT
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if ((objc_msgSend(v2, "isRunningTest") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    if ((objc_msgSend(v4, "launchedToTest") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v3 = objc_msgSend(v5, "BOOLForKey:", CFSTR("isRunningPPT"));

    }
  }

  return v3;
}

- (BOOL)isAnyWelcomeScreenVisible
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers"));
  v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &stru_100551790);

  return v3;
}

- (ICAppDelegate)init
{
  ICAppDelegate *v2;
  id v3;
  ICAppDelegate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAppDelegate;
  v2 = -[ICAppDelegate init](&v6, "init");
  v3 = objc_msgSend((id)objc_opt_class(v2), "sharedInstance");
  v4 = (ICAppDelegate *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (BOOL)inhibitMigrationScreenCheckOnForgroundNotification
{
  return self->_inhibitMigrationScreenCheckOnForgroundNotification;
}

- (BOOL)extendedLaunchTimeIsLogged
{
  return self->_extendedLaunchTimeIsLogged;
}

- (ICNAEventReporter)eventReporter
{
  ICNAEventReporter *eventReporter;
  id v4;
  ICNAEventReporter *v5;
  ICNAEventReporter *v6;

  eventReporter = self->_eventReporter;
  if (!eventReporter)
  {
    v4 = objc_alloc((Class)ICNAEventReporter);
    v5 = (ICNAEventReporter *)objc_msgSend(v4, "initWithSubTrackerName:", kICNASubtrackerNameAppDelegate);
    v6 = self->_eventReporter;
    self->_eventReporter = v5;

    eventReporter = self->_eventReporter;
  }
  return eventReporter;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)ICAppDelegate;
  -[ICAppDelegate dealloc](&v5, "dealloc");
}

- (ICNotesCloudContextDelegate)cloudContextDelegate
{
  return self->_cloudContextDelegate;
}

- (void)checkIfUserNotificationsAllowed:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, id);

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate userNotificationsAllowed](self, "userNotificationsAllowed"));

  if (v5)
  {
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate userNotificationsAllowed](self, "userNotificationsAllowed"));
      v4[2](v4, objc_msgSend(v6, "integerValue"));

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100015A90;
    v8[3] = &unk_100551858;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "getNotificationSettingsWithCompletionHandler:", v8);

  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[ICAppDelegate applicationWillEnterForeground:]";
    v18 = 1024;
    v19 = 866;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v16, 0x12u);
  }

  v6 = objc_opt_class(UIApplication);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v8 = ICCheckedDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (self->_isLaunchedInBackground)
  {
    self->_isLaunchedInBackground = 0;
    -[ICAppDelegate finishLaunching](self, "finishLaunching");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
    objc_msgSend(v10, "applicationWillEnterForeground:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v11, "cleanupAdditionalPersistentStores");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
    objc_msgSend(v12, "enableAutomaticPreviewGeneration");
    objc_msgSend(v12, "generatePreviewsIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workerManagedObjectContext"));

    objc_msgSend(v12, "generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
    objc_msgSend(v15, "applicationWillEnterForeground");

  }
  if (!-[ICAppDelegate inhibitMigrationScreenCheckOnForgroundNotification](self, "inhibitMigrationScreenCheckOnForgroundNotification"))
  {
    -[ICAppDelegate setInhibitMigrationScreenCheckOnForgroundNotification:](self, "setInhibitMigrationScreenCheckOnForgroundNotification:", 1);
    -[ICAppDelegate showMigrationStartupScreenIfNecessary](self, "showMigrationStartupScreenIfNecessary");
  }
  +[ICNoteListSortUtilities clearCache](ICNoteListSortUtilities, "clearCache");
  +[ICDateHeadersUtilities clearCache](ICDateHeadersUtilities, "clearCache");

}

- (void)applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[ICAppDelegate applicationDidBecomeActive:]";
    v14 = 1024;
    v15 = 598;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if (!self->_isActive)
  {
    self->_isActive = 1;
    if (-[ICAppDelegate refreshAccountsInFolderViewOnActivate](self, "refreshAccountsInFolderViewOnActivate"))
      -[ICAppDelegate setRefreshAccountsInFolderViewOnActivate:](self, "setRefreshAccountsInFolderViewOnActivate:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate lockNotesInBackgroundTimer](self, "lockNotesInBackgroundTimer"));
    objc_msgSend(v5, "invalidate");

    -[ICAppDelegate setLockNotesInBackgroundTimer:](self, "setLockNotesInBackgroundTimer:", 0);
    if (-[ICAppDelegate delayedLockProtectedNotesTask](self, "delayedLockProtectedNotesTask") != UIBackgroundTaskInvalid)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v6, "endBackgroundTask:", -[ICAppDelegate delayedLockProtectedNotesTask](self, "delayedLockProtectedNotesTask"));

      -[ICAppDelegate setDelayedLockProtectedNotesTask:](self, "setDelayedLockProtectedNotesTask:", UIBackgroundTaskInvalid);
    }
  }
  global_queue = dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v8, &stru_100551488);

  objc_initWeak((id *)buf, self);
  v9 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060C54;
  block[3] = &unk_10054FF58;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  v5 = a4;
  if (-[ICAppDelegate isAnyWelcomeScreenVisible](self, "isAnyWelcomeScreenVisible")
    || -[ICAppDelegate isAnyAudioInspectorShowingForWindow:](self, "isAnyAudioInspectorShowingForWindow:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7)
      v8 = 30;
    else
      v8 = 2;
  }
  else
  {
    v8 = 30;
  }

  return v8;
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100023684();

}

- (ICNAController)analyticsController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appDelegate"));

  if (!v4)
    objc_msgSend(v3, "setAppDelegate:", self);
  return (ICNAController *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreRatingObserver, 0);
  objc_storeStrong((id *)&self->_allowNotificationsViewController, 0);
  objc_storeStrong((id *)&self->_userNotificationsAllowed, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_databaseLockBackgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_managedObjectContextSaveTasks, 0);
  objc_storeStrong((id *)&self->_backgroundTasks, 0);
  objc_storeStrong((id *)&self->_delayedLaunchTasks, 0);
  objc_storeStrong((id *)&self->_launchUserActivity, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_repetitiveLoggingTimer, 0);
  objc_storeStrong((id *)&self->_serverSideUpgradeTaskController, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_userActivityPendingContinuation, 0);
  objc_storeStrong((id *)&self->_lockNotesInBackgroundTimer, 0);
  objc_storeStrong((id *)&self->_pendingUserActivityContinuationTimer, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_secureWindow, 0);
  objc_storeStrong((id *)&self->_cloudContextDelegate, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

+ (ICAppDelegate)sharedInstance
{
  if (qword_1005DDD30 != -1)
    dispatch_once(&qword_1005DDD30, &stru_1005513C0);
  return (ICAppDelegate *)(id)qword_1005DDD28;
}

- (ICViewControllerManager)randomViewControllerManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (ICViewControllerManager *)v3;
}

- (int64_t)_dragDataOwner
{
  return 3;
}

- (int64_t)_dropDataOwner
{
  return 3;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  id v16;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "role"));
  v10 = (void *)_UIWindowSceneSessionTypeCoverSheet;

  if (v9 == v10)
  {
    v13 = CFSTR("quicknoteScene");
  }
  else
  {
    v11 = -[ICAppDelegate isAuxWindowForConnectionOptions:](self, "isAuxWindowForConnectionOptions:", v7);
    v12 = off_1005CCF48;
    if (!v11)
      v12 = CFSTR("mainScene");
    v13 = v12;
  }
  v14 = objc_alloc((Class)UISceneConfiguration);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "role"));

  v16 = objc_msgSend(v14, "initWithName:sessionRole:", v13, v15);
  return v16;
}

- (BOOL)isAuxWindowForConnectionOptions:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userActivities", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.notes.open.object")))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ICUseAuxiliaryWindow")));
          v12 = objc_msgSend(v11, "isEqual:", &__kCFBooleanTrue);

          if ((v12 & 1) != 0)
          {

            v13 = 1;
            goto LABEL_12;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (void)runDelayedLaunchTasks
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;

  v3 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[ICAppDelegate runDelayedLaunchTasks]";
    v45 = 1024;
    v46 = 385;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAppDelegate runDelayedLaunchTasks]", 1, 0, CFSTR("Unexpected call from background thread"));
  self->_isReadyForDelayedLaunchTasks = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICAppDelegateWillRunDelayedLaunchTasks"), self);

  -[ICAppDelegate setupReachability](self, "setupReachability");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate cloudContextDelegate](self, "cloudContextDelegate"));
  objc_msgSend(v5, "syncPasswordProtectedNotesIfNecessary");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate cloudContextDelegate](self, "cloudContextDelegate"));
  objc_msgSend(v6, "updateLastOSVersion");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate cloudContextDelegate](self, "cloudContextDelegate"));
  objc_msgSend(v7, "updateAppleAccountBags");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate cloudContextDelegate](self, "cloudContextDelegate"));
  objc_msgSend(v8, "registerForSyncMessages");

  if (+[ICNoteContext hasSharedContext](ICNoteContext, "hasSharedContext"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate windows](self, "windows"));
    v10 = objc_msgSend(v9, "ic_firstObjectOfClass:", objc_opt_class(ICWindow));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICSystemPaperThumbnailService sharedService](ICSystemPaperThumbnailService, "sharedService"));
    objc_msgSend(v13, "setTraitCollection:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICSystemPaperThumbnailService sharedService](ICSystemPaperThumbnailService, "sharedService"));
    objc_msgSend(v14, "observe");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICSystemPaperThumbnailService sharedService](ICSystemPaperThumbnailService, "sharedService"));
    objc_msgSend(v15, "updateIfNeededWithCompletion:", 0);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
  objc_msgSend(v16, "setReloadsTimelinesAutomatically:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v17, "setDeauthenticationTimeInterval:", 0.0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  v42 = ICNotePasteboardUTI;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  v20 = objc_msgSend(v18, "containsPasteboardTypes:", v19);

  if ((v20 & 1) == 0)
    +[ICDataPersister deletePasteboardDataFiles](ICDataPersister, "deletePasteboardDataFiles");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v22 = objc_msgSend(v21, "applicationState");

  if (!v22)
    +[ICMigrationController continueMigrationIfNecessary](ICMigrationController, "continueMigrationIfNecessary");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "managedObjectContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v24));

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v30, "updateFullNameAndEmail:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "accountDataCreateIfNecessary"));
        objc_msgSend(v31, "updateSupportsV1Neo:", 0);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v27);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "workerManagedObjectContext"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharedWithYouController sharedController](ICSharedWithYouController, "sharedController"));
  objc_msgSend(v34, "setManagedObjectContext:", v33);

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100060390;
  v36[3] = &unk_100550BE8;
  v36[4] = self;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[ICLaunchTaskRunner runDelayedLaunchTasksWithDelegate:completionHandler:](ICLaunchTaskRunner, "runDelayedLaunchTasksWithDelegate:completionHandler:", self, v36));
  -[ICAppDelegate setDelayedLaunchTasks:](self, "setDelayedLaunchTasks:", v35);

}

- (void)registerBackgroundTasks
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  if (+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests"))
  {
    v3 = os_log_create("com.apple.notes", "BackgroundTask");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Skipping registration of background tasks during unit tests", buf, 2u);
    }

  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000609E8;
    block[3] = &unk_100550110;
    block[4] = self;
    if (qword_1005DDD38 != -1)
      dispatch_once(&qword_1005DDD38, block);
  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[ICAppDelegate applicationWillTerminate:]";
    v40 = 1024;
    v41 = 653;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  self->_willTerminate = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate delayedLaunchTasks](self, "delayedLaunchTasks"));
  objc_msgSend(v6, "cancel");

  -[ICAppDelegate setDelayedLaunchTasks:](self, "setDelayedLaunchTasks:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v8 = objc_msgSend(v7, "isQuickNoteSessionActive");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    objc_msgSend(v9, "endSession");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "ic_removeObserver:forKeyPath:context:", self, ICSettingsNoteListSortTypeKey, &off_1005CD1F0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v11, "ic_removeObserver:forKeyPath:context:", self, ICFolderCustomNoteSortTypeQuerySortKey, &off_1005CD1F0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v12, "ic_removeObserver:forKeyPath:context:", self, ICSettingsNoteDateHeadersTypeKey, &off_1005CD1F0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v13, "ic_removeObserver:forKeyPath:context:", self, ICSettingsQueryDateHeadersTypeKey, &off_1005CD1F0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v14, "deauthenticate");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v15, "saveImmediately");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICDispatchAfterHandler appLifeCycleHandler](ICDispatchAfterHandler, "appLifeCycleHandler"));
  objc_msgSend(v16, "cancelAll");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  objc_msgSend(v17, "applicationWillTerminate:", v4);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v22), "legacyNoteEditorViewController"));
        objc_msgSend(v23, "donateEditingIntentIfNecessary");

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v20);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v25 = objc_msgSend(v24, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Remove All Cloud Syncing Activity Events"), &stru_1005514A8);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "managedObjectContext"));
  +[ICCloudSyncingObject removeAllCloudSyncingObjectActivityEventsForUnsharedObjectsInContext:](ICCloudSyncingObject, "removeAllCloudSyncingObjectActivityEventsForUnsharedObjectsInContext:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v28, "endBackgroundTask:", v25);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v29, "applicationWillTerminate");

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  objc_msgSend(v30, "applicationWillTerminate");

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate appStoreRatingObserver](self, "appStoreRatingObserver"));
  objc_msgSend(v31, "stopObserving");

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate analyticsController](self, "analyticsController"));
  objc_msgSend(v32, "appSessionDidTerminate");

  -[ICAppDelegate cleanUpTemporaryFiles](self, "cleanUpTemporaryFiles");
}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[ICAppDelegate applicationWillResignActive:]";
    v25 = 1024;
    v26 = 698;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = objc_opt_class(UIApplication);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v8 = ICCheckedDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "noteEditorViewController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "note"));
        v17 = objc_msgSend(v16, "isPasswordProtected");

        if (v17)
        {
          objc_msgSend(v9, "ignoreSnapshotOnNextApplicationLaunch");
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

  if (+[ICFeatureFlags appShortcutsEnabled](_TtC11MobileNotes14ICFeatureFlags, "appShortcutsEnabled"))
    +[ICAppIntentsManager updateAppShortcutParameters](_TtC11MobileNotes19ICAppIntentsManager, "updateAppShortcutParameters");

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;

  v4 = a3;
  v5 = objc_opt_class(UIApplication);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = ICCheckedDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ((((uint64_t (*)(void))ICUseCoreDataCoreSpotlightIntegration)() & 1) != 0)
    v9 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Save When Backgrounding"), &stru_1005514E8, 0);
  else
    v9 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Save When Backgrounding"), &stru_1005514E8, objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Finish Indexing"), &stru_1005514C8));
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  objc_msgSend(v11, "applicationDidEnterBackground");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICMentionNotificationController sharedController](ICMentionNotificationController, "sharedController"));
  objc_msgSend(v12, "applicationDidEnterBackground");

  v13 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v56 = "-[ICAppDelegate applicationDidEnterBackground:]";
    v57 = 1024;
    v58 = 736;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  if (objc_msgSend(v14, "isQuickNoteSessionActive"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    v16 = objc_msgSend(v15, "isSecureScreenShowing");

    if ((v16 & 1) != 0)
      goto LABEL_12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteEditorViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentedViewController"));
    v19 = objc_opt_respondsToSelector(v18, "prepareForDismissal");

    if ((v19 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentedViewController"));
      objc_msgSend(v20, "prepareForDismissal");

    }
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    objc_msgSend(v21, "endSession");

  }
LABEL_12:
  self->_isActive = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICDispatchAfterHandler appLifeCycleHandler](ICDispatchAfterHandler, "appLifeCycleHandler"));
  objc_msgSend(v22, "cancelAll");

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v23, "saveImmediately");

  objc_msgSend(v8, "endBackgroundTask:", v10);
  v53 = 0u;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v51;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v28), "legacyNoteEditorViewController"));
        objc_msgSend(v29, "donateEditingIntentIfNecessary");

        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v26);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
  objc_msgSend(v30, "cancelGenerationOfPendingPreviews");

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
  objc_msgSend(v31, "disableAutomaticPreviewGeneration");

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v32, "synchronize");

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  objc_msgSend(v33, "applicationDidEnterBackground:", v8);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "managedObjectContext"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v35));

  if (!v36 || (v37 = objc_msgSend(v36, "didChooseToMigrate"), (_DWORD)v37))
    v37 = -[ICAppDelegate openWelcomeScreenWhenLoggingInToUnmigratedICloudAccount](self, "openWelcomeScreenWhenLoggingInToUnmigratedICloudAccount");
  if ((ICUseCoreDataCoreSpotlightIntegration(v37) & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100061C48;
    v47[3] = &unk_100551510;
    v48 = v8;
    v49 = v45;
    objc_msgSend(v38, "finishRemainingOperationsWithCompletionHandler:", v47);

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  v40 = objc_msgSend(v39, "isAuthenticated");

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate secureWindow](self, "secureWindow"));

    if (v41)
    {
      -[ICAppDelegate lockAllNotes](self, "lockAllNotes");
    }
    else
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100061C54;
      v46[3] = &unk_100550110;
      v46[4] = self;
      self->_delayedLockProtectedNotesTask = (unint64_t)objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Lock Notes In Background"), v46);
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "lockAllNotes", 0, 0, 480.0));
      -[ICAppDelegate setLockNotesInBackgroundTimer:](self, "setLockNotesInBackgroundTimer:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate lockNotesInBackgroundTimer](self, "lockNotesInBackgroundTimer"));
      objc_msgSend(v43, "addTimer:forMode:", v44, NSDefaultRunLoopMode);

    }
  }
  -[ICAppDelegate setUserNotificationsAllowed:](self, "setUserNotificationsAllowed:", 0);

}

- (void)cleanUpTemporaryFiles
{
  _QWORD v2[8];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100061DD0;
  v2[3] = &unk_1005515B8;
  v2[4] = self;
  v2[5] = &v11;
  v2[6] = &v7;
  v2[7] = &v3;
  performBlockOnMainThreadAndWait(v2);
  if (!*((_BYTE *)v12 + 24))
    +[ICAttachmentModel deletePreviewItemHardLinkURLs](ICAttachmentModel, "deletePreviewItemHardLinkURLs");
  if (!*((_BYTE *)v8 + 24) && !*((_BYTE *)v4 + 24))
    +[ICDocCamPDFGenerator deleteAllDocCamPDFs](ICDocCamPDFGenerator, "deleteAllDocCamPDFs");
  _Block_object_dispose(&v3, 8);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)lockAllNotes
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate lockNotesInBackgroundTimer](self, "lockNotesInBackgroundTimer"));
  objc_msgSend(v3, "invalidate");

  -[ICAppDelegate setLockNotesInBackgroundTimer:](self, "setLockNotesInBackgroundTimer:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers"));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "lockNotesNow");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  if (-[ICAppDelegate delayedLockProtectedNotesTask](self, "delayedLockProtectedNotesTask") != UIBackgroundTaskInvalid)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100062118;
    v10[3] = &unk_100550110;
    v10[4] = self;
    dispatchMainAfterDelay(v10, 0.0);
  }
  v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1004056B4();

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICAppDelegate;
  -[ICAppDelegate buildMenuWithBuilder:](&v12, "buildMenuWithBuilder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

  if (v5 == v6)
  {
    objc_msgSend(v4, "removeMenuForIdentifier:", UIMenuTextSize);
    objc_msgSend(v4, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuFind, &stru_1005515F8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICKeyboardHandler fileKeyboardShortcutMenu](ICKeyboardHandler, "fileKeyboardShortcutMenu"));
    objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v7, UIMenuFile);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICKeyboardHandler editKeyboardShortcutMenu](ICKeyboardHandler, "editKeyboardShortcutMenu"));
    objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v8, UIMenuEdit);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICKeyboardHandler viewKeyboardShortcutMenu](ICKeyboardHandler, "viewKeyboardShortcutMenu"));
    objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v9, UIMenuView);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICKeyboardHandler goKeyboardShortcutMenu](ICKeyboardHandler, "goKeyboardShortcutMenu"));
    objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v10, UIMenuRoot);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteEditorViewController formatKeyboardShortcutMenu](ICNoteEditorViewController, "formatKeyboardShortcutMenu"));
    objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v11, UIMenuFormat);

  }
}

- (BOOL)launchTaskRunnerShouldRunLaunchTasks:(id)a3
{
  return +[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests", a3) ^ 1;
}

- (id)serverChangeTokensForCloudKitAccounts:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableSet);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverChangeTokens"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));

              if (v16)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ckServerChangeToken"));
                objc_msgSend(v4, "addObject:", v17);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a5;
  v8 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1004056E0();

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100062750;
  v11[3] = &unk_100551660;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "handleRemoteNotificationWithUserInfo:completion:", v6, v11);

}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4;
  double v5;
  NSObject *v6;
  dispatch_time_t v7;

  v4 = a4;
  ++qword_1005DDD40;
  v5 = fmin((double)(unint64_t)(60 * qword_1005DDD40), 300.0);
  v6 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100405740((uint64_t)v4, v6, v5);

  v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_100551680);

}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  NSObject *v3;
  void *v4;

  v3 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1004057E8();

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
  objc_msgSend(v4, "didReceiveMemoryWarning");

}

- (void)handleDarwinNotificationName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = ICInternalPreferencesChangedNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    -[ICAppDelegate setRefreshAccountsInFolderViewOnActivate:](self, "setRefreshAccountsInFolderViewOnActivate:", 1);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.springboard.lockcomplete")))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_100405814();

    -[ICAppDelegate lockAllNotes](self, "lockAllNotes");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("GSEventHardwareKeyboardAttached")))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), "keyboardHandler"));
          objc_msgSend(v14, "updateHardwareKeyboardAvailability");

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)legacyNotesChanged
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v2, "addOrDeleteLocalAccountIfNecessary");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = objc_msgSend(v4, "hasChanges");

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
    objc_msgSend(v6, "ic_save");

  }
}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
  +[ICDocCamPDFGenerator deleteAllDocCamPasswordProtectedPDFs](ICDocCamPDFGenerator, "deleteAllDocCamPasswordProtectedPDFs", a3);
}

- (void)mentionNotificationWillSend:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  ICAppDelegate *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100062C24;
  v5[3] = &unk_10054FE80;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)mentionNotificationDidSend:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  ICAppDelegate *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100062EF0;
  v5[3] = &unk_10054FE80;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)persistentContainerWillLockDatabase:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[ICAppDelegate persistentContainerWillLockDatabase:]";
    v12 = 1024;
    v13 = 1088;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v10, 0x12u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Finish Database-locking operation"), &stru_1005516A0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate backgroundTasks](self, "backgroundTasks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate databaseLockBackgroundTaskIdentifier](self, "databaseLockBackgroundTaskIdentifier"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

- (void)persistentContainerDidUnlockDatabase:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;

  v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[ICAppDelegate persistentContainerDidUnlockDatabase:]";
    v14 = 1024;
    v15 = 1098;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v12, 0x12u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate backgroundTasks](self, "backgroundTasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate databaseLockBackgroundTaskIdentifier](self, "databaseLockBackgroundTaskIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1004059D0();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v9, "endBackgroundTask:", objc_msgSend(v7, "unsignedIntegerValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate backgroundTasks](self, "backgroundTasks"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate databaseLockBackgroundTaskIdentifier](self, "databaseLockBackgroundTaskIdentifier"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

  }
}

- (void)managedObjectContextWillSave:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (!v4)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((context) != nil)", "-[ICAppDelegate managedObjectContextWillSave:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate managedObjectContextSaveTasks](self, "managedObjectContextSaveTasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(([self.managedObjectContextSaveTasks objectForKey:context]) == nil)", "-[ICAppDelegate managedObjectContextWillSave:]", 1, 0, CFSTR("Expected nil value for '%s'"), "[self.managedObjectContextSaveTasks objectForKey:context]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Context Save %@"), v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000635D0;
  v14[3] = &unk_100550110;
  v15 = v4;
  v10 = v4;
  v11 = objc_msgSend(v9, "beginBackgroundTaskWithName:expirationHandler:", v8, v14);

  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate managedObjectContextSaveTasks](self, "managedObjectContextSaveTasks"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](NSValue, "value:withObjCType:", &v16, "Q"));
  objc_msgSend(v12, "setObject:forKey:", v13, v10);

}

- (void)managedObjectContextDidSave:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIBackgroundTaskIdentifier v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (!v4)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((context) != nil)", "-[ICAppDelegate managedObjectContextDidSave:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate managedObjectContextSaveTasks](self, "managedObjectContextSaveTasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((taskIdentifierValue) != nil)", "-[ICAppDelegate managedObjectContextDidSave:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "taskIdentifierValue");
  v9 = UIBackgroundTaskInvalid;
  objc_msgSend(v6, "getValue:", &v9);
  if (v9 != UIBackgroundTaskInvalid)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "endBackgroundTask:", v9);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate managedObjectContextSaveTasks](self, "managedObjectContextSaveTasks"));
  objc_msgSend(v8, "removeObjectForKey:", v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  if ((-[ICAppDelegate ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/GlobalUI/ICAppDelegate.m") & 1) != 0)
  {
    v13 = -[ICAppDelegate ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v10, v12);

    if (a6 == &off_1005CD1F0 && (v13 & 1) == 0)
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));

      if (v14 == v10)
      {
        +[ICNoteListSortUtilities clearCache](ICNoteListSortUtilities, "clearCache");
        +[ICDateHeadersUtilities clearCache](ICDateHeadersUtilities, "clearCache");
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICAppDelegate;
    -[ICAppDelegate observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v12, v10, v11, a6);

  }
}

- (void)accountsDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1004059FC();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentAttachmentPresenter"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentAttachmentPresenter"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachments"));
          v14 = objc_msgSend(v13, "ic_containsObjectPassingTest:", &stru_1005516E0);

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentAttachmentPresenter"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));
            objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);

          }
        }
        -[ICAppDelegate showMigrationStartupScreenIfNecessary](self, "showMigrationStartupScreenIfNecessary");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v17, "deauthenticate");

}

- (void)accountWillBeDeleted:(id)a3
{
  NSObject *v4;
  void *v5;

  v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100405A28();

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate undoManager](self, "undoManager"));
  objc_msgSend(v5, "removeAllActions");

}

- (void)submitBackgroundAnalyticsEventsWithEventReporter:(id)a3
{
  id v4;

  v4 = a3;
  -[ICAppDelegate submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:eventReporter:](self, "submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:eventReporter:", 1, v4);
  -[ICAppDelegate submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:eventReporter:](self, "submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:eventReporter:", 0, v4);
  -[ICAppDelegate submitPasswordChangeEventsWithReset:eventReporter:](self, "submitPasswordChangeEventsWithReset:eventReporter:", 1, v4);
  -[ICAppDelegate submitPasswordChangeEventsWithReset:eventReporter:](self, "submitPasswordChangeEventsWithReset:eventReporter:", 0, v4);
  -[ICAppDelegate submitPasswordChangeModeEventWithEventReporter:](self, "submitPasswordChangeModeEventWithEventReporter:", v4);

}

- (void)submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:(BOOL)a3 eventReporter:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v7 = a4;
  v5 = (uint64_t)+[ICInstrumentationUtilities autoSortSelectionChangeCountForState:](ICInstrumentationUtilities, "autoSortSelectionChangeCountForState:", v4);
  if (v5 >= 1)
  {
    v6 = v5;
    +[ICInstrumentationUtilities clearAutoSortSelectionChangeCountForState:](ICInstrumentationUtilities, "clearAutoSortSelectionChangeCountForState:", v4);
    do
    {
      objc_msgSend(v7, "submitMoveCheckedItemsToBottomSwitchEventWithNewState:isInApp:", v4, 0);
      --v6;
    }
    while (v6);
  }

}

- (void)submitPasswordChangeEventsWithReset:(BOOL)a3 eventReporter:(id)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = a4;
  v6 = (uint64_t)+[ICInstrumentationUtilities recentPasswordChangeCountAsReset:](ICInstrumentationUtilities, "recentPasswordChangeCountAsReset:", v4);
  v7 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100405A54(v4, v6, v7);

  if (v6 >= 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100063D64;
    v9[3] = &unk_100551708;
    v12 = v4;
    v11 = v6;
    v10 = v5;
    objc_msgSend(v8, "performSnapshotBackgroundTask:", v9);

  }
}

- (void)submitPasswordChangeModeEventWithEventReporter:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100063EB8;
  v6[3] = &unk_100551750;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performSnapshotBackgroundTask:", v6);

}

- (void)openWelcomeScreenWhenLoggingInToUnmigratedICloudAccount
{
  -[ICAppDelegate setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:](self, "setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:", 1);
}

- (BOOL)isAnyAudioInspectorShowingForWindow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100064310;
  v9[3] = &unk_1005517B8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "ic_containsObjectPassingTest:", v9);

  return v7;
}

- (id)mainWindowIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate lastBackgroundedArchiveState](self, "lastBackgroundedArchiveState"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowIdentifier"));
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v11, "isAuxiliary"))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
            v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windowIdentifier"));

            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void)showStartupWithForceWelcomeScreen:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id obj;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[ICAppDelegate viewControllerManagers](self, "viewControllerManagers"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10006466C;
        v14[3] = &unk_1005517E0;
        v12 = v6;
        v14[4] = self;
        v15 = v12;
        objc_msgSend(v11, "showStartupWithForceWelcomeScreen:completion:", v4, v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)showMigrationScreen
{
  -[ICAppDelegate showStartupWithForceWelcomeScreen:completion:](self, "showStartupWithForceWelcomeScreen:completion:", 1, 0);
}

- (void)showStartupWithCompletionBlock:(id)a3
{
  -[ICAppDelegate showStartupWithForceWelcomeScreen:completion:](self, "showStartupWithForceWelcomeScreen:completion:", 0, a3);
}

- (id)undoManager
{
  return +[NSUndoManager shared](NSUndoManager, "shared");
}

- (void)setUpAppStoreRatingObserverWithWindowScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  ICAppStoreRatingObserver *appStoreRatingObserver;
  ICAppStoreRatingObserver *v8;
  void *v9;
  void *v10;
  void *v11;
  ICAppStoreRatingObserver *v12;
  ICAppStoreRatingObserver *v13;
  id v14;

  v14 = a3;
  if (+[ICNoteContext hasSharedContext](ICNoteContext, "hasSharedContext"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryICloudACAccount"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    if (objc_msgSend(v6, "length"))
    {
      appStoreRatingObserver = self->_appStoreRatingObserver;
      if (!appStoreRatingObserver)
      {
        v8 = [ICAppStoreRatingObserver alloc];
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workerManagedObjectContext"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v12 = -[ICAppStoreRatingObserver initWithAccountIdentifier:managedObjectContext:userDefaults:windowScene:](v8, "initWithAccountIdentifier:managedObjectContext:userDefaults:windowScene:", v6, v10, v11, v14);
        v13 = self->_appStoreRatingObserver;
        self->_appStoreRatingObserver = v12;

        appStoreRatingObserver = self->_appStoreRatingObserver;
      }
      -[ICAppStoreRatingObserver startObserving](appStoreRatingObserver, "startObserving");
    }

  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;

  v6 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  v8 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100405BB4();

  v7[2](v7, 26);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;

  v7 = a4;
  v8 = kICNANotificationCenterReferralURL;
  v9 = (void (**)(_QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
  -[ICAppDelegate startAnalyticsSessionWithReferralURL:referralApplication:](self, "startAnalyticsSessionWithReferralURL:referralApplication:", v10, 0);

  v11 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100405D28();

  objc_msgSend(UIApp, "setApplicationIconBadgeNumber:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "request"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));

  v16 = objc_opt_class(NSDictionary);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kICCloudNotificationsNotesPayloadKey));
  v18 = ICDynamicCast(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = objc_opt_class(NSString);
  if (v19)
  {
    v21 = kICCloudNotificationsNotesPayloadNoteUUIDKey;
    v22 = v19;
  }
  else
  {
    v21 = kICNotificationNoteIdentifierKey;
    v22 = v15;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v21));
  v24 = ICDynamicCast(v20, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  v26 = objc_opt_class(NSString);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", kICCloudNotificationsNotesPayloadInlineAttachmentUUIDKey));
  v28 = ICDynamicCast(v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate randomViewControllerManager](self, "randomViewControllerManager"));
  v31 = os_log_create("com.apple.notes", "Notifications");
  v32 = v31;
  if (v29 && v25)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      sub_100405C14();

    objc_msgSend(v30, "showInlineAttachmentWithIdentifier:inNoteIdentifier:", v29, v25);
  }
  else if (v25)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      sub_100405C90();

    objc_msgSend(v30, "showNoteWithIdentifier:", v25);
  }
  else
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_100405CF0();

  }
  v9[2](v9);

}

- (void)newShareCreatedOrSynced:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100064EE4;
  v5[3] = &unk_10054FF58;
  objc_copyWeak(&v6, &location);
  performBlockOnMainThread(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)checkIfHasSharedNotesOrFolders:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workerManagedObjectContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100064FC4;
  v8[3] = &unk_100550160;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v8);

}

- (void)showAllowNotificationsWarmingSheet:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  ICAllowNotificationsViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  v4 = a3;
  v5 = objc_opt_class(ICWindow);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICUIApplicationShim sharedInstance](ICUIApplicationShim, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyWindow"));
  v8 = ICDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "behavior") == (id)1)
  {
    v10 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Not showing allow notifications warming sheet in Calculator.", v22, 2u);
    }

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_topmostPresentedViewController"));
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootViewController"));
    v14 = v13;

    if (+[UIDevice ic_isiPhone](UIDevice, "ic_isiPhone"))
      v15 = 0;
    else
      v15 = 2;
    v16 = objc_alloc_init(ICAllowNotificationsViewController);
    -[ICAppDelegate setAllowNotificationsViewController:](self, "setAllowNotificationsViewController:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate allowNotificationsViewController](self, "allowNotificationsViewController"));
    objc_msgSend(v17, "setModalPresentationStyle:", v15);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate allowNotificationsViewController](self, "allowNotificationsViewController"));
    objc_msgSend(v18, "setModalInPresentation:", 1);

    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate allowNotificationsViewController](self, "allowNotificationsViewController"));
      objc_msgSend(v19, "setPreferredContentSize:", 512.0, 680.0);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate allowNotificationsViewController](self, "allowNotificationsViewController"));
    objc_msgSend(v20, "setCompletionHandler:", v4);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate allowNotificationsViewController](self, "allowNotificationsViewController"));
    objc_msgSend(v14, "presentViewController:animated:completion:", v21, 1, 0);

  }
}

- (void)dismissAllowNotificationsWarmingSheet
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate allowNotificationsViewController](self, "allowNotificationsViewController"));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[ICAppDelegate setAllowNotificationsViewController:](self, "setAllowNotificationsViewController:", 0);
}

- (void)requestAuthorizationToShowUserNotificationsIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAppDelegate requestAuthorizationToShowUserNotificationsIfNecessary]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!-[ICAppDelegate requestedAuthorizationToShowUserNotifications](self, "requestedAuthorizationToShowUserNotifications"))
  {
    if ((+[UIDevice ic_isLocked](UIDevice, "ic_isLocked") & 1) != 0)
    {
LABEL_19:
      v19 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_100405D88();
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v31;
        while (2)
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v31 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v8);
            v10 = objc_opt_class(UIWindowScene);
            v11 = ICDynamicCast(v10, v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
            v14 = objc_msgSend(v13, "ic_isSecure");

            if ((v14 & 1) != 0)
            {

              goto LABEL_19;
            }
            v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v6)
            continue;
          break;
        }
      }

      v15 = objc_opt_class(ICWindow);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICUIApplicationShim sharedInstance](ICUIApplicationShim, "sharedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keyWindow"));
      v18 = ICDynamicCast(v15, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ic_topmostPresentedViewController](v19, "ic_topmostPresentedViewController"));
      v21 = objc_opt_class(ICCloudSharingController);
      isKindOfClass = objc_opt_isKindOfClass(v20, v21);
      v23 = -[ICAppDelegate isAnyWelcomeScreenVisible](self, "isAnyWelcomeScreenVisible");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject windowScene](v19, "windowScene"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "session"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "role"));

      if (!-[ICAppDelegate requestedAuthorizationToShowUserNotifications](self, "requestedAuthorizationToShowUserNotifications"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v28 = (objc_msgSend(v27, "applicationState") != 0) | v23 | isKindOfClass;

        if ((v28 & 1) == 0 && v26 != (void *)SBSUIWindowSceneSessionRoleSystemNotes)
        {
          -[ICAppDelegate setRequestedAuthorizationToShowUserNotifications:](self, "setRequestedAuthorizationToShowUserNotifications:", 1);
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000655F0;
          v29[3] = &unk_100551808;
          v29[4] = self;
          -[ICAppDelegate checkIfUserNotificationsAllowed:](self, "checkIfUserNotificationsAllowed:", v29);
        }
      }

    }
  }
}

- (void)saveQuicknoteArchiveState:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));

  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("quicknoteState"));
}

- (void)saveLastBackgroundedArchiveState:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));

  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastBackgroundedState"));
}

- (ICWindowStateArchive)quicknoteArchiveState
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("quicknoteState")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveFromDictionary:](ICWindowStateArchive, "windowStateArchiveFromDictionary:", v3));
  else
    v4 = 0;

  return (ICWindowStateArchive *)v4;
}

- (ICWindowStateArchive)lastBackgroundedArchiveState
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("lastBackgroundedState")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveFromDictionary:](ICWindowStateArchive, "windowStateArchiveFromDictionary:", v3));
  else
    v4 = 0;

  return (ICWindowStateArchive *)v4;
}

- (unint64_t)beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = objc_msgSend(v7, "beginBackgroundTaskWithName:expirationHandler:", v6, v5);

  return (unint64_t)v8;
}

- (void)endBackgroundTask:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "endBackgroundTask:", a3);

}

- (void)sessionDidStartForWindowScene:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_alloc((Class)ICNAEventReporter);
  v6 = objc_msgSend(v5, "initWithSubTrackerName:windowScene:", kICNASubtrackerNameAppDelegate, v4);

  -[ICAppDelegate submitBackgroundAnalyticsEventsWithEventReporter:](self, "submitBackgroundAnalyticsEventsWithEventReporter:", v6);
}

- (void)setupReachability
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
  -[ICAppDelegate setReachability:](self, "setReachability:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate reachability](self, "reachability"));
  objc_msgSend(v4, "startNotifier");

  v5 = (id)objc_claimAutoreleasedReturnValue(+[ICMentionNotificationController sharedController](ICMentionNotificationController, "sharedController"));
  objc_msgSend(v5, "listenForReachabilityChange");

}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BOOL)isSecureScreenShowing
{
  return self->_secureScreenShowing;
}

- (ICSecureWindow)secureWindow
{
  return self->_secureWindow;
}

- (void)setSecureWindow:(id)a3
{
  objc_storeStrong((id *)&self->_secureWindow, a3);
}

- (BOOL)isLaunchingQuickNoteViaPencil
{
  return self->_launchingQuickNoteViaPencil;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (BOOL)icSearchIndexerDisabled
{
  return self->_icSearchIndexerDisabled;
}

- (void)setIcSearchIndexerDisabled:(BOOL)a3
{
  self->_icSearchIndexerDisabled = a3;
}

- (BOOL)isPendingUserActivityContinuation
{
  return self->_pendingUserActivityContinuation;
}

- (void)setPendingUserActivityContinuation:(BOOL)a3
{
  self->_pendingUserActivityContinuation = a3;
}

- (NSTimer)pendingUserActivityContinuationTimer
{
  return self->_pendingUserActivityContinuationTimer;
}

- (void)setPendingUserActivityContinuationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUserActivityContinuationTimer, a3);
}

- (NSTimer)lockNotesInBackgroundTimer
{
  return self->_lockNotesInBackgroundTimer;
}

- (void)setLockNotesInBackgroundTimer:(id)a3
{
  objc_storeStrong((id *)&self->_lockNotesInBackgroundTimer, a3);
}

- (NSUserActivity)userActivityPendingContinuation
{
  return self->_userActivityPendingContinuation;
}

- (void)setUserActivityPendingContinuation:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityPendingContinuation, a3);
}

- (ICReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (ICServerSideUpdateTaskController)serverSideUpgradeTaskController
{
  return self->_serverSideUpgradeTaskController;
}

- (void)setServerSideUpgradeTaskController:(id)a3
{
  objc_storeStrong((id *)&self->_serverSideUpgradeTaskController, a3);
}

- (NSTimer)repetitiveLoggingTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRepetitiveLoggingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)refreshAccountsInFolderViewOnActivate
{
  return self->_refreshAccountsInFolderViewOnActivate;
}

- (void)setRefreshAccountsInFolderViewOnActivate:(BOOL)a3
{
  self->_refreshAccountsInFolderViewOnActivate = a3;
}

- (NSUserActivity)launchUserActivity
{
  return self->_launchUserActivity;
}

- (void)setLaunchUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_launchUserActivity, a3);
}

- (void)setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:(BOOL)a3
{
  self->_shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount = a3;
}

- (unint64_t)delayedLockProtectedNotesTask
{
  return self->_delayedLockProtectedNotesTask;
}

- (ICLaunchTaskCancellationToken)delayedLaunchTasks
{
  return self->_delayedLaunchTasks;
}

- (void)setDelayedLaunchTasks:(id)a3
{
  objc_storeStrong((id *)&self->_delayedLaunchTasks, a3);
}

- (NSMutableDictionary)backgroundTasks
{
  return self->_backgroundTasks;
}

- (void)setBackgroundTasks:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTasks, a3);
}

- (NSMapTable)managedObjectContextSaveTasks
{
  return self->_managedObjectContextSaveTasks;
}

- (void)setManagedObjectContextSaveTasks:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContextSaveTasks, a3);
}

- (NSUUID)databaseLockBackgroundTaskIdentifier
{
  return self->_databaseLockBackgroundTaskIdentifier;
}

- (void)setDatabaseLockBackgroundTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (ICRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (BOOL)requestedAuthorizationToShowUserNotifications
{
  return self->_requestedAuthorizationToShowUserNotifications;
}

- (void)setRequestedAuthorizationToShowUserNotifications:(BOOL)a3
{
  self->_requestedAuthorizationToShowUserNotifications = a3;
}

- (ICAllowNotificationsViewController)allowNotificationsViewController
{
  return self->_allowNotificationsViewController;
}

- (void)setAllowNotificationsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_allowNotificationsViewController, a3);
}

- (ICAppStoreRatingObserver)appStoreRatingObserver
{
  return self->_appStoreRatingObserver;
}

- (void)setAppStoreRatingObserver:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreRatingObserver, a3);
}

- (void)waitForDelayedLaunchWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = (void (**)(_QWORD))a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAppDelegate(DelayedLaunch) waitForDelayedLaunchWithCompletionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (-[ICAppDelegate isReadyForDelayedLaunchTasks](self, "isReadyForDelayedLaunchTasks"))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_100065F50;
    v15 = sub_100065F60;
    v16 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100065F68;
    v8[3] = &unk_100551880;
    v10 = &v11;
    v9 = v4;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("ICAppDelegateWillRunDelayedLaunchTasks"), self, 0, v8));
    v7 = (void *)v12[5];
    v12[5] = v6;

    _Block_object_dispose(&v11, 8);
  }

}

- (id)ic_viewControllerManager
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllerManagers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (void)ic_selectLocalModernAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "folderListViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
  objc_msgSend(v6, "selectItemWithIdentifier:animated:", v7, 0);

}

- (void)ic_selectFolderNamed:(id)a3
{
  id v4;
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
  void *v17;
  _QWORD v18[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder predicateForVisibleFoldersInContext:](ICFolder, "predicateForVisibleFoldersInContext:", v6));
  v18[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("title == %@"), v4));
  v18[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder foldersMatchingPredicate:context:](ICFolder, "foldersMatchingPredicate:context:", v10, v12));

  if (objc_msgSend(v13, "count") != (id)1)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "folders.count == 1", "-[ICAppDelegate(ICTesting) ic_selectFolderNamed:]", 1, 0, CFSTR("Unexpected number (%lu) of folders named: %@"), objc_msgSend(v13, "count"), v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "folderListViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));
  objc_msgSend(v16, "selectItemWithIdentifier:animated:", v17, 0);

}

- (id)ic_folderListScrollView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "folderListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));

  return v4;
}

- (id)ic_notesListScrollView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNoteBrowseViewController"));

  if (objc_msgSend(v4, "noteContainerViewMode"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "noteBrowseViewController.noteContainerViewMode == ICNoteContainerViewModeList", "-[ICAppDelegate(ICTesting) ic_notesListScrollView]", 1, 0, CFSTR("Expected a note list, but got view mode %lu"), objc_msgSend(v4, "noteContainerViewMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootNoteBrowseViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));

  return v7;
}

- (id)ic_noteEditorViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteEditorViewController"));

  return v3;
}

- (id)ic_notesGridScrollView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootNoteBrowseViewController"));

  if (objc_msgSend(v3, "noteContainerViewMode") != (id)1)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "noteBrowseViewController.noteContainerViewMode == ICNoteContainerViewModeGrid", "-[ICAppDelegate(ICTesting) ic_notesGridScrollView]", 1, 0, CFSTR("Expected grid view, but got view mode %lu"), objc_msgSend(v3, "noteContainerViewMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));

  return v4;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  const __CFString *v12;
  ICAppDelegate *v13;
  id v14;
  uint64_t v15;

  v8 = a4;
  v9 = a5;
  objc_storeStrong((id *)&qword_1005DDE58, a4);
  objc_storeStrong(&qword_1005DDE60, a5);
  objc_msgSend(v8, "containsString:", CFSTR("Landscape"));
  byte_1005DDE71 = 0;
  v10 = objc_opt_class(RPTTestRunner);
  if (v10)
    LOBYTE(v10) = +[RPTTestRunner isRecapAvailable](RPTTestRunner, "isRecapAvailable");
  byte_1005DDE70 = v10;
  -[ICAppDelegate setIcSearchIndexerDisabled:](self, "setIcSearchIndexerDisabled:", -[ICAppDelegate isScrollingTest:](self, "isScrollingTest:", v8));
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowAccountsList")))
  {
    -[ICAppDelegate startICShowAccountsListTest:](self, "startICShowAccountsListTest:", v9);
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "containsString:", CFSTR("ICScrollAccountsList")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ICScrollAccountsListRecap")))
  {
    -[ICAppDelegate startICScrollAccountsListTest:](self, "startICScrollAccountsListTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICRotateAccountsList")))
  {
    -[ICAppDelegate startICRotateAccountsListTest:](self, "startICRotateAccountsListTest:", v9);
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "containsString:", CFSTR("ICShowNotesList")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ICWarmShowNotesList")))
  {
    -[ICAppDelegate startICShowNotesListTest:warm:](self, "startICShowNotesListTest:warm:", v9, objc_msgSend(v8, "containsString:", CFSTR("ICWarmShowNotesList")));
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICScrollNotesList")))
  {
    -[ICAppDelegate startICScrollNotesListTest:](self, "startICScrollNotesListTest:", v9);
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "containsString:", CFSTR("ICScrollEnglishNotesList")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ICScrollEnglishNotesListRecap")))
  {
    -[ICAppDelegate startICScrollEnglishNotesListTest:](self, "startICScrollEnglishNotesListTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICNewNoteFromNotesList")))
  {
    -[ICAppDelegate startICNewNoteFromNotesListTest:](self, "startICNewNoteFromNotesListTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICRotateNotesList")))
  {
    -[ICAppDelegate startICRotateNotesListTest:](self, "startICRotateNotesListTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICScrollSearchResultsNotesList")))
  {
    -[ICAppDelegate startICScrollSearchResultsNotesListTest:](self, "startICScrollSearchResultsNotesListTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowSearchResults")))
  {
    -[ICAppDelegate startICShowSearchResultsTest:](self, "startICShowSearchResultsTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICScrollTableHorizontally")))
  {
    -[ICAppDelegate startICScrollTableHorizontallyTest:](self, "startICScrollTableHorizontallyTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICScrollTableVertically")))
  {
    -[ICAppDelegate startICScrollTableVerticallyTest:](self, "startICScrollTableVerticallyTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowTableNote")))
  {
    v12 = CFSTR("Tables");
LABEL_33:
    -[ICAppDelegate startICShowNoteTestInFolderNamed:withOptions:](self, "startICShowNoteTestInFolderNamed:withOptions:", v12, v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowGridView")))
  {
    -[ICAppDelegate startICShowGridViewTest:](self, "startICShowGridViewTest:", v9);
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "containsString:", CFSTR("ICScrollNotesGrid")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ICScrollNotesGridRecap")))
  {
    -[ICAppDelegate startICScrollGridViewTest:](self, "startICScrollGridViewTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowInlineSketchNote")))
  {
    v12 = CFSTR("Inline Sketches");
    goto LABEL_33;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICScrollInlineSketchNote")))
  {
    -[ICAppDelegate startICScrollInlineSketchTest:](self, "startICScrollInlineSketchTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowInkPicker")))
  {
    -[ICAppDelegate startICShowInkPickerTest:](self, "startICShowInkPickerTest:", v9);
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "containsString:", CFSTR("ICNewNoteFromNoteView")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ICWarmKeyboardNewNoteFromNoteView")))
  {
    -[ICAppDelegate startICNewNoteFromNoteViewTest:warm:](self, "startICNewNoteFromNoteViewTest:warm:", v9, objc_msgSend(v8, "containsString:", CFSTR("ICWarmKeyboardNewNoteFromNoteView")));
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowNote")))
  {
    -[ICAppDelegate startICShowNoteTest:](self, "startICShowNoteTest:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICScrollNoteKeyboardUp")))
  {
    v13 = self;
    v14 = v9;
    v15 = 1;
LABEL_55:
    -[ICAppDelegate startICScrollNoteTest:withKeyboardUp:](v13, "startICScrollNoteTest:withKeyboardUp:", v14, v15);
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "containsString:", CFSTR("ICScrollNote")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ICScrollNoteRecap")))
  {
    v13 = self;
    v14 = v9;
    v15 = 0;
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "containsString:", CFSTR("ICShowShareSheetFromNoteView")))
  {
    -[ICAppDelegate startICShowShareSheetFromNoteViewTest:](self, "startICShowShareSheetFromNoteViewTest:", v9);
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("ICRotateNote")))
  {
    -[ICAppDelegate startICRotateNoteTest:](self, "startICRotateNoteTest:", v9);
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("ICInsertChecklist")))
  {
    -[ICAppDelegate startICInsertChecklistTest:](self, "startICInsertChecklistTest:", v9);
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("ICKeyboardBringUpAndDismissal")))
  {
    -[ICAppDelegate startICKeyboardBringUpAndDismissal:](self, "startICKeyboardBringUpAndDismissal:", v9);
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("ICKeyboardRotation")))
  {
    -[ICAppDelegate startICKeyboardRotation:](self, "startICKeyboardRotation:", v9);
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("ICKeyboardSplitAndMerge")))
  {
    -[ICAppDelegate startICKeyboardSplitAndMerge:](self, "startICKeyboardSplitAndMerge:", v9);
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("ICNoteEditorTyping")))
  {
    -[ICAppDelegate startICNoteEditorTypingTest:](self, "startICNoteEditorTypingTest:", v9);
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("ICResizeWindow")))
  {
    -[ICAppDelegate startICResizeWindowTest:](self, "startICResizeWindowTest:", v9);
  }
LABEL_8:

  return 1;
}

- (void)folderListDidLayoutSubviews
{
  if ((byte_1005DDE71 & 1) == 0)
  {
    if (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowAccountsList")))
      sub_1000B3400((void *)qword_1005DDE58);
  }
}

- (void)didShowNotesList
{
  if ((byte_1005DDE71 & 1) == 0
    && ((objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowNotesList")) & 1) != 0
     || objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICWarmShowNotesList"))))
  {
    if (byte_1005DDE88 == 1)
    {
      objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICDelaySubTest"), qword_1005DDE58);
      byte_1005DDE88 = 0;
    }
    else
    {
      objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICAnimationSubTest"), qword_1005DDE58);
    }
    objc_msgSend(UIApp, "finishedTest:", qword_1005DDE58);
  }
}

- (void)noteListDidLayoutSubviews
{
  if ((byte_1005DDE71 & 1) == 0
    && ((objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowNotesList")) & 1) != 0
     || objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICWarmShowNotesList"))))
  {
    sub_1000B3400((void *)qword_1005DDE58);
  }
}

- (void)didShowNoteEditor
{
  void *v2;
  id v3;

  if ((byte_1005DDE71 & 1) == 0
    && ((objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowNote")) & 1) != 0
     || (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowInlineSketchNote")) & 1) != 0
     || objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowTableNote"))))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if (!v3)
    {
      if (byte_1005DDE88 == 1)
      {
        objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICDelaySubTest"), qword_1005DDE58);
        byte_1005DDE88 = 0;
      }
      else
      {
        objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICAnimationSubTest"), qword_1005DDE58);
      }
      objc_msgSend(UIApp, "finishedTest:", qword_1005DDE58);
    }
  }
}

- (void)noteEditorDidLayoutSubviews
{
  void *v2;
  id v3;

  if ((byte_1005DDE71 & 1) == 0
    && ((objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowNote")) & 1) != 0
     || (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowInlineSketchNote")) & 1) != 0
     || objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowTableNote"))))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if (!v3)
      sub_1000B3400((void *)qword_1005DDE58);
  }
}

- (void)willLoadNoteIntoEditor
{
  void *v2;
  id v3;

  if ((byte_1005DDE71 & 1) == 0
    && ((objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowInlineSketchNote")) & 1) != 0
     || objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowTableNote"))))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if (v3 == (id)1)
    {
      objc_msgSend(UIApp, "startedTest:", qword_1005DDE58);
      objc_msgSend(UIApp, "installCACommitCompletionBlock:", &stru_100553A00);
    }
  }
}

- (void)didEditorBeginEditing
{
  if ((byte_1005DDE71 & 1) == 0
    && ((objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICNewNoteFromNotesList")) & 1) != 0
     || (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICNewNoteFromNoteView")) & 1) != 0
     || objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICWarmKeyboardNewNoteFromNoteView"))))
  {
    objc_msgSend(UIApp, "installCACommitCompletionBlock:", &stru_100553A20);
  }
}

- (void)didEditorPresentActivityViewController
{
  if ((byte_1005DDE71 & 1) == 0)
  {
    if (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowShareSheetFromNoteView")))
      objc_msgSend(UIApp, "installCACommitCompletionBlock:", &stru_100553A40);
  }
}

- (void)textViewDidChange
{
  void *v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  id v8;

  if ((byte_1005DDE71 & 1) == 0)
  {
    if (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICInsertChecklist")))
    {
      objc_msgSend(UIApp, "installCACommitCompletionBlock:", &stru_100553A60);
    }
    else if (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICNoteEditorTyping"))
           && byte_1005DDE72 == 1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_noteEditorViewController](self, "ic_noteEditorViewController"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textView"));

      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textStorage"));
      v5 = objc_msgSend(CFSTR("dog"), "length");
      if (objc_msgSend(v4, "length") > v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedSubstringFromRange:", (_BYTE *)objc_msgSend(v4, "length") - v5, v5));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));

        if (objc_msgSend(v7, "isEqualToString:", CFSTR("dog")))
          objc_msgSend(UIApp, "installCACommitCompletionBlock:", &stru_100553A80);

      }
    }
  }
}

- (void)inkPickerDidShow
{
  if (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowInkPicker")))
  {
    if (byte_1005DDE88 == 1)
    {
      objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICDelaySubTest"), qword_1005DDE58);
      byte_1005DDE88 = 0;
    }
    else
    {
      objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICAnimationSubTest"), qword_1005DDE58);
    }
    objc_msgSend(UIApp, "finishedTest:", qword_1005DDE58);
  }
}

- (void)searchResultBecameVisible
{
  if ((byte_1005DDE71 & 1) == 0 && (byte_1005DDE73 & 1) == 0)
  {
    if (objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowSearchResults")))
    {
      byte_1005DDE73 = 1;
      objc_msgSend(UIApp, "installCACommitCompletionBlock:", &stru_100553AA0);
    }
  }
}

- (void)didShowGridView
{
  if ((byte_1005DDE71 & 1) == 0
    && objc_msgSend((id)qword_1005DDE58, "containsString:", CFSTR("ICShowGridView")))
  {
    if (byte_1005DDE88 == 1)
    {
      objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICDelaySubTest"), qword_1005DDE58);
      byte_1005DDE88 = 0;
    }
    else
    {
      objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("ICAnimationSubTest"), qword_1005DDE58);
    }
    _objc_msgSend(UIApp, "finishedTest:waitForCommit:extraResults:", qword_1005DDE58, 0, 0);
  }
}

- (void)startICShowAccountsListTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  byte_1005DDE71 = 1;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B3DC0;
  v4[3] = &unk_100550110;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B3E5C;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v4, v3);
}

- (void)startICScrollAccountsListTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  ICAppDelegate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B3FF0;
  v4[3] = &unk_10054FE80;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[ICAppDelegate dismissMigrationScreenCompletionBlock:](v5, "dismissMigrationScreenCompletionBlock:", v4);

}

- (void)startICRotateAccountsListTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  ICAppDelegate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B41D0;
  v4[3] = &unk_10054FE80;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[ICAppDelegate dismissMigrationScreenCompletionBlock:](v5, "dismissMigrationScreenCompletionBlock:", v4);

}

- (void)startICShowNotesListTest:(id)a3 warm:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  byte_1005DDE71 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B4454;
  v4[3] = &unk_100550360;
  v4[4] = self;
  v5 = a4;
  -[ICAppDelegate dismissMigrationScreenCompletionBlock:](self, "dismissMigrationScreenCompletionBlock:", v4);
}

- (void)performScrollTestForScrollView:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a4;
  v12 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("iterations")));
  v7 = objc_msgSend(v6, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("offset")));
  v9 = objc_msgSend(v8, "intValue");

  objc_msgSend(v12, "scrollToTop");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("recapBased")));

  LODWORD(v5) = objc_msgSend(v10, "BOOLValue");
  if ((_DWORD)v5)
  {
    objc_msgSend(v12, "ic_performRecapScrollTestNamed:iterations:", qword_1005DDE58, (int)v7);
  }
  else
  {
    if (v9)
      v11 = v9;
    else
      v11 = 20;
    objc_msgSend(v12, "_performScrollTest:iterations:delta:", qword_1005DDE58, v7, v11);
  }

}

- (void)performFlickScrollOnScrollView:(id)a3 duration:(double)a4 delta:(int64_t)a5 delayBetweenScroll:(double)a6 iterations:(unint64_t)a7
{
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  id v22;
  _QWORD v23[5];
  id v24;
  unint64_t v25;
  double v26;
  double v27;
  int64_t v28;

  v12 = a3;
  v13 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10040A0A8(v13, v14, v15, v16, v17, v18, v19, v20);

  v21 = (double)a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B4A30;
  v23[3] = &unk_100553B10;
  v24 = v12;
  v25 = a7;
  v23[4] = self;
  v26 = a6;
  v27 = a4;
  v28 = a5;
  v22 = v12;
  objc_msgSend(v22, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", 0, 0, 0, v23, 0.0, v21, a4);

}

- (void)performFlickScrollTestForScrollView:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  signed int v9;
  void *v10;
  unsigned int v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  double v24;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("iterations")));
  v9 = objc_msgSend(v8, "intValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("offset")));
  v11 = objc_msgSend(v10, "intValue");
  if (v11)
    v12 = v11;
  else
    v12 = 100;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("flickDelay")));
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134218752;
    v18 = v9;
    v19 = 2048;
    v20 = v12;
    v21 = 2048;
    v22 = 0x3FC999999999999ALL;
    v23 = 2048;
    v24 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Flick scroll test iterations %lu, delta: %lu, duration: %.2f, delay: %.2f", (uint8_t *)&v17, 0x2Au);
  }

  objc_msgSend(v7, "scrollToTop");
  -[ICAppDelegate performFlickScrollOnScrollView:duration:delta:delayBetweenScroll:iterations:](self, "performFlickScrollOnScrollView:duration:delta:delayBetweenScroll:iterations:", v7, v12, v9, 0.2, v15);

}

- (void)startICScrollNotesListTest:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B4DA0;
  v7[3] = &unk_100550110;
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B4DA8;
  v5[3] = &unk_10054FE80;
  v5[4] = self;
  v4 = v6;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v7, v5);

}

- (void)startICScrollEnglishNotesListTest:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B4E90;
  v7[3] = &unk_100550110;
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B4EA0;
  v5[3] = &unk_10054FE80;
  v5[4] = self;
  v4 = v6;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v7, v5);

}

- (void)startICScrollSearchResultsNotesListTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  ICAppDelegate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B4F64;
  v4[3] = &unk_10054FE80;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[ICAppDelegate reindexEverythingThenPerformBlock:](v5, "reindexEverythingThenPerformBlock:", v4);

}

- (void)startICRotateNotesListTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;
  ICAppDelegate *v6;
  _QWORD v7[5];

  v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B5238;
  v7[3] = &unk_100550110;
  v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B5240;
  v4[3] = &unk_10054FE80;
  v5 = a3;
  v3 = v5;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](v6, "showNotesListWithAccountSelectionBlock:readyBlock:", v7, v4);

}

- (void)startICShowNoteTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B53A8;
  v4[3] = &unk_100550110;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B53B0;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v4, v3);
}

- (void)startICNewNoteFromNotesListTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  byte_1005DDE71 = 1;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B54F4;
  v4[3] = &unk_100550110;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B54FC;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v4, v3);
}

- (void)startICNewNoteFromNoteViewTest:(id)a3 warm:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[5];

  byte_1005DDE71 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B56F8;
  v8[3] = &unk_100553B58;
  v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B5728;
  v6[3] = &unk_100553B80;
  v6[4] = self;
  v7 = a4;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B5810;
  v4[3] = &unk_100550360;
  v4[4] = self;
  v5 = a4;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v8, v6, v4, &stru_1005539E0);
}

- (void)startICScrollNoteTest:(id)a3 withKeyboardUp:(BOOL)a4
{
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[4];
  ICAppDelegate *v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B5AE4;
  v10[3] = &unk_100553B58;
  v11 = self;
  v7 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B5B00;
  v8[3] = &unk_100553B80;
  v8[4] = v11;
  v9 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B5B6C;
  v6[3] = &unk_10054FE80;
  v6[4] = v11;
  v5 = v7;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](v11, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v10, v8, v6, &stru_1005539E0);

}

- (void)startICShowShareSheetFromNoteViewTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B5C54;
  v5[3] = &unk_100553B58;
  v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B5C70;
  v4[3] = &unk_100553B58;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B5CC4;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_1005539E0);
}

- (void)startICRotateNoteTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;
  ICAppDelegate *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  ICAppDelegate *v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B5E4C;
  v8[3] = &unk_100553B58;
  v9 = self;
  v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B5E68;
  v7[3] = &unk_100553B58;
  v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B5EBC;
  v4[3] = &unk_10054FE80;
  v5 = a3;
  v3 = v5;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](v9, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v8, v7, v4, &stru_1005539E0);

}

- (void)startICScrollTableHorizontallyTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;
  ICAppDelegate *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  ICAppDelegate *v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B607C;
  v8[3] = &unk_100553B58;
  v9 = self;
  v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B60A0;
  v7[3] = &unk_100553B58;
  v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B60F4;
  v4[3] = &unk_10054FE80;
  v5 = a3;
  v3 = v5;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](v9, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v8, v7, v4, &stru_1005539E0);

}

- (void)startICScrollTableVerticallyTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;
  ICAppDelegate *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  ICAppDelegate *v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B6258;
  v8[3] = &unk_100553B58;
  v9 = self;
  v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B627C;
  v7[3] = &unk_100553B58;
  v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B62D0;
  v4[3] = &unk_10054FE80;
  v5 = a3;
  v3 = v5;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](v9, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v8, v7, v4, &stru_1005539E0);

}

- (void)startICShowGridViewTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B63DC;
  v4[3] = &unk_100550110;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B63E4;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v4, v3);
}

- (void)startICScrollGridViewTest:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B655C;
  v7[3] = &unk_100550110;
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B656C;
  v5[3] = &unk_10054FE80;
  v5[4] = self;
  v4 = v6;
  -[ICAppDelegate showNotesGridWithAccountSelectionBlock:readyBlock:](self, "showNotesGridWithAccountSelectionBlock:readyBlock:", v7, v5);

}

- (void)startICShowNoteTestInFolderNamed:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id *v8;
  id v9;
  Block_layout *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v5 = a3;
  byte_1005DDE71 = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)1)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B66D8;
    v16[3] = &unk_10054FE80;
    v8 = &v17;
    v16[4] = self;
    v17 = v5;
    v9 = v5;
    v10 = &stru_100553BC0;
    v11 = v16;
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000B66EC;
    v14[3] = &unk_10054FE80;
    v8 = &v15;
    v14[4] = self;
    v15 = v5;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B66F8;
    v13[3] = &unk_100550110;
    v13[4] = self;
    v12 = v5;
    v10 = (Block_layout *)v14;
    v11 = v13;
  }
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v10, v11);

}

- (void)startICScrollInlineSketchTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;
  ICAppDelegate *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  ICAppDelegate *v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B6880;
  v8[3] = &unk_100553B58;
  v9 = self;
  v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B68A4;
  v7[3] = &unk_100553B58;
  v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B68F8;
  v4[3] = &unk_10054FE80;
  v5 = a3;
  v3 = v5;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](v9, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v8, v7, v4, &stru_1005539E0);

}

- (void)startICKeyboardBringUpAndDismissal:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B6A30;
  v5[3] = &unk_100553B58;
  v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B6A4C;
  v4[3] = &unk_100553B58;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B6AA0;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_1005539E0);
}

- (void)startICKeyboardRotation:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B6BD4;
  v5[3] = &unk_100553B58;
  v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B6BF0;
  v4[3] = &unk_100553B58;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B6C44;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_1005539E0);
}

- (void)startICKeyboardSplitAndMerge:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B6D78;
  v5[3] = &unk_100553B58;
  v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B6D94;
  v4[3] = &unk_100553B58;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B6DE8;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_1005539E0);
}

- (void)startICInsertChecklistTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  byte_1005DDE71 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B6F24;
  v5[3] = &unk_100553B58;
  v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B6F54;
  v4[3] = &unk_100553B58;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B7114;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_100553BE0);
}

- (void)startICShowInkPickerTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B7264;
  v5[3] = &unk_100553B58;
  v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B7294;
  v4[3] = &unk_100553B58;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B72E8;
  v3[3] = &unk_100550110;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_1005539E0);
}

- (void)startICShowSearchResultsTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  ICAppDelegate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B73C4;
  v4[3] = &unk_10054FE80;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[ICAppDelegate reindexEverythingThenPerformBlock:](v5, "reindexEverythingThenPerformBlock:", v4);

}

- (void)startICNoteEditorTypingTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  if (byte_1005DDE70)
  {
    byte_1005DDE71 = 1;
    byte_1005DDE72 = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000B75FC;
    v5[3] = &unk_100553B58;
    v5[4] = self;
    v3[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B762C;
    v4[3] = &unk_100553B58;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000B793C;
    v3[3] = &unk_100550110;
    -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_100553C00);
  }
  else
  {
    objc_msgSend(UIApp, "failedTest:withFailure:", qword_1005DDE58, CFSTR("Recap required"));
  }
}

- (void)startICResizeWindowTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  if (byte_1005DDE70)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000B7DB0;
    v5[3] = &unk_100553B58;
    v5[4] = self;
    v3[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B7DE0;
    v4[3] = &unk_100553B58;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000B7E34;
    v3[3] = &unk_100550110;
    -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v5, v4, v3, &stru_1005539E0);
  }
  else
  {
    objc_msgSend(UIApp, "failedTest:withFailure:", qword_1005DDE58, CFSTR("Recap required"));
  }
}

- (int64_t)scrollIterationsFromDefaults
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("scrollTestIterations"));

  if ((uint64_t)v3 <= 0)
    return 6;
  else
    return (int64_t)v3;
}

- (int64_t)scrollOffsetFromDefaults
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("scrollTestOffset"));

  if ((uint64_t)v3 <= 0)
    return 3;
  else
    return (int64_t)v3;
}

- (BOOL)scrollTestUseRecap
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("scrollTestUseRecap"));

  return v3;
}

- (BOOL)scrollTestUseFlick
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("scrollTestUseFlick"));

  return v3;
}

- (void)testScrollNotesList
{
  _QWORD handler[5];
  int out_token;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B809C;
  v5[3] = &unk_100550110;
  v5[4] = self;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](self, "showNotesListWithAccountSelectionBlock:readyBlock:", v5, 0);
  out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B80AC;
  handler[3] = &unk_100553C28;
  handler[4] = self;
  notify_register_dispatch("com.apple.mobilenotes.testScrollNotesList", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)testScrollNote
{
  _QWORD v3[5];
  int out_token;
  _QWORD v5[5];
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B82E8;
  v6[3] = &unk_100553B58;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B8304;
  v5[3] = &unk_100553B58;
  v5[4] = self;
  -[ICAppDelegate showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:](self, "showNoteWithAccountSelectionBlock:noteSelectionBlock:readyBlock:errorBlock:", v6, v5, 0, &stru_1005539E0);
  out_token = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B8358;
  v3[3] = &unk_100553C28;
  v3[4] = self;
  notify_register_dispatch("com.apple.mobilenotes.testScrollNote", &out_token, (dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)reindexEverythingThenPerformBlock:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  void *v25;
  id v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10040A144(v5, v6, v7, v8, v9, v10, v11, v12);

  if (ICUseCoreDataCoreSpotlightIntegration(v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICCDCSIReindexer sharedReindexer](ICCDCSIReindexer, "sharedReindexer"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000B8658;
    v24[3] = &unk_10054F8B8;
    v25 = v4;
    v26 = v3;
    v15 = v3;
    v16 = v4;
    objc_msgSend(v14, "reindexAllSearchableItemsWithCompletionHandler:", v24);

    v17 = v25;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
    objc_msgSend(v18, "setDisabled:", 0);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B86C4;
    v20[3] = &unk_100553C50;
    v21 = v4;
    v22 = v18;
    v23 = v3;
    v17 = v3;
    v15 = v18;
    v19 = v4;
    objc_msgSend(v15, "reindexAllSearchableItemsWithCompletionHandler:", v20);

  }
}

- (void)dismissMigrationScreenCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  v5 = objc_opt_class(ICWindow);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate window](self, "window"));
  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_topmostPresentedViewController"));

  v10 = objc_opt_class(ICStartupNavigationController);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    objc_msgSend(v9, "noUpgradeActionAndDismiss");
    v11 = 2000000000;
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = 0;
  if (v4)
  {
LABEL_5:
    v12 = dispatch_time(0, v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B8858;
    block[3] = &unk_10054FFA8;
    v14 = v4;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);

  }
LABEL_6:

}

- (void)showNotesListWithAccountSelectionBlock:(id)a3 readyBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  ICAppDelegate *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B8908;
  v7[3] = &unk_1005502E8;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[ICAppDelegate dismissMigrationScreenCompletionBlock:](v8, "dismissMigrationScreenCompletionBlock:", v7);

}

- (void)showNotesGridWithAccountSelectionBlock:(id)a3 readyBlock:(id)a4
{
  id v5;
  _QWORD v6[4];
  ICAppDelegate *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B8B30;
  v6[3] = &unk_100550160;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[ICAppDelegate showNotesListWithAccountSelectionBlock:readyBlock:](v7, "showNotesListWithAccountSelectionBlock:readyBlock:", a3, v6);

}

- (void)showNoteWithAccountSelectionBlock:(id)a3 noteSelectionBlock:(id)a4 readyBlock:(id)a5 errorBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B8D84;
  v17[3] = &unk_100553CF0;
  v17[4] = self;
  v18 = v10;
  v19 = a6;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v19;
  v16 = v10;
  -[ICAppDelegate dismissMigrationScreenCompletionBlock:](self, "dismissMigrationScreenCompletionBlock:", v17);

}

- (BOOL)selectFirstNoteInCollectionView:(id)a3 errorString:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", 0);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v9 = objc_msgSend(v8, "collectionView:shouldSelectItemAtIndexPath:", v5, v7);

    if ((v9 & 1) != 0)
    {
      v10 = v7;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 1, 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
      v12 = objc_msgSend(v11, "collectionView:shouldSelectItemAtIndexPath:", v5, v10);

      if ((v12 & 1) == 0)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[collectionView.delegate collectionView:collectionView shouldSelectItemAtIndexPath:indexPath]", "-[ICAppDelegate(ICTesting) selectFirstNoteInCollectionView:errorString:]", 1, 0, CFSTR("2nd item in collection view is not a note"));
    }
    objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    objc_msgSend(v13, "collectionView:didSelectItemAtIndexPath:", v5, v10);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    objc_msgSend(v14, "collectionView:performPrimaryActionForItemAtIndexPath:", v5, v10);

  }
  else if (a4)
  {
    *a4 = CFSTR("No notes found.");
  }

  return v6 != 0;
}

- (BOOL)selectFirstNoteInTableView:(id)a3 errorString:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "numberOfRowsInSection:", 0);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    objc_msgSend(v8, "tableView:didSelectRowAtIndexPath:", v5, v7);

  }
  else if (a4)
  {
    *a4 = CFSTR("No notes found.");
  }

  return v6 != 0;
}

- (BOOL)selectFirstNoteInScrollView:(id)a3 errorString:(id *)a4
{
  id v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  BOOL v10;

  v6 = a3;
  v7 = objc_opt_class(UITableView);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = -[ICAppDelegate selectFirstNoteInTableView:errorString:](self, "selectFirstNoteInTableView:errorString:", v6, a4);
  }
  else
  {
    v9 = objc_opt_class(UICollectionView);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v8 = -[ICAppDelegate selectFirstNoteInCollectionView:errorString:](self, "selectFirstNoteInCollectionView:errorString:", v6, a4);
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (void)showAccountsList
{
  -[ICAppDelegate showAccountsListAnimated:](self, "showAccountsListAnimated:", 0);
}

- (void)showAccountsListAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_viewControllerManager](self, "ic_viewControllerManager"));
  objc_msgSend(v4, "showAccountListAnimated:", v3);

}

- (void)bringUpKeyboard
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_noteEditorViewController](self, "ic_noteEditorViewController"));
  objc_msgSend(v2, "setEditing:animated:", 1, 1);

}

- (void)goToBottomOfNoteInEditor
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_noteEditorViewController](self, "ic_noteEditorViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textView"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textStorage"));
  objc_msgSend(v6, "setSelectedRange:", objc_msgSend(v3, "length"), 0);

  v4 = objc_msgSend(v6, "selectedRange");
  objc_msgSend(v6, "ic_scrollRangeToVisible:consideringInsets:animated:", v4, v5, 1, 0);

}

- (void)dismissKeyboard
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICAppDelegate ic_noteEditorViewController](self, "ic_noteEditorViewController"));
  objc_msgSend(v2, "setEditing:animated:", 0, 1);

}

- (BOOL)isScrollingTest:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;

  v3 = qword_1005DDE80;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1005DDE80, &stru_100553D10);
  v5 = objc_msgSend((id)qword_1005DDE78, "containsObject:", v4);

  return v5;
}

- (void)rotateToOrientation:(int64_t)a3 iterationsRemaining:(int)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(_QWORD);
  int64_t v13;
  int v14;

  v8 = (void (**)(_QWORD))a5;
  v9 = v8;
  if (a4 < 1)
  {
    v8[2](v8);
  }
  else
  {
    v10 = (void *)UIApp;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B9654;
    v11[3] = &unk_100553D60;
    v13 = a3;
    v11[4] = self;
    v14 = a4;
    v12 = v8;
    objc_msgSend(v10, "rotateIfNeeded:completion:", a3, v11);

  }
}

@end
