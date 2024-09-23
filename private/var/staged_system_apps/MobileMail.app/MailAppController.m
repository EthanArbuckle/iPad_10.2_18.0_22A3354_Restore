@implementation MailAppController

- (id)_mailboxStringFromMailbox:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  v3 = a3;
  if (objc_msgSend(v3, "isSmartMailbox"))
  {
    v4 = v3;
    if (objc_msgSend(v4, "smartMailboxType") != (id)8)
    {
      if (objc_msgSend(v4, "smartMailboxType") && objc_msgSend(v4, "smartMailboxType"))
      {
        if (objc_msgSend(v4, "smartMailboxType") == (id)1)
        {
          v5 = CFSTR("com.apple.mobilemail.context.flagged");
          goto LABEL_11;
        }
        if (objc_msgSend(v4, "smartMailboxType") == (id)3)
        {
          v5 = CFSTR("com.apple.mobilemail.context.toMe");
          goto LABEL_11;
        }
        if (objc_msgSend(v4, "smartMailboxType") == (id)4)
        {
          v5 = CFSTR("com.apple.mobilemail.context.hasAttachments");
          goto LABEL_11;
        }
        if (objc_msgSend(v4, "smartMailboxType") != (id)5)
        {
          v5 = 0;
          goto LABEL_11;
        }
        v9 = (id *)&MSUserNotificationCenterTopicNotifiedThreads;
      }
      else
      {
        v9 = (id *)&MSUserNotificationCenterTopicVIP;
      }
      v5 = (__CFString *)*v9;
      goto LABEL_11;
    }
    v5 = CFSTR("com.apple.mobilemail.context.AllInbox");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxProvider"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyMailboxForObjectID:", v7));

    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLString"));
  }
LABEL_11:

  return v5;
}

- (NSArray)activeScenes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController connectedScenes](self, "connectedScenes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_compactMap:", &stru_10051D5B8));

  return (NSArray *)v4;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  int v13;
  void *v14;

  v5 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log", a3, a4));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForInfoDictionaryKey:", kCFBundleVersionKey));
    v13 = 138543362;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MobileMail version %{public}@ launched", (uint8_t *)&v13, 0xCu);

  }
  -[MailAppController _performBackEndOneShotInitialization](self, "_performBackEndOneShotInitialization");
  -[MailAppController registerApplicationLifecycleObservers](self, "registerApplicationLifecycleObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactionLogger"));
  objc_msgSend(v9, "applicationLaunched");

  -[MailAppController registerAppIntentsDependencies](self, "registerAppIntentsDependencies");
  global_queue = dispatch_get_global_queue(9, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v11, &stru_10051D4D8);

  return 1;
}

- (void)_updateAccountsIfNecessaryFromCollection:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MailAppController mailboxCollection](self, "mailboxCollection"));

  if (v6 == v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);

    }
    -[MailAppController _accountsChanged:](self, "_accountsChanged:", 0);
  }

}

- (MailMainScene)mostRecentMainScene
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController openSessions](self, "openSessions", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v4)
        objc_enumerationMutation(v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5), "scene"));
      v7 = objc_opt_class(MailMainScene);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        break;

      if (v3 == (id)++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return (MailMainScene *)v6;
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)mf_updateCurrentContexts
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v21 = objc_alloc_init((Class)NSMutableSet);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController activeScenes](self, "activeScenes"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "suppressionMailboxes") & 1) != 0)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suppressionMailboxes"));
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10003B850;
          v22[3] = &unk_10051D500;
          v22[4] = self;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_compactMap:", v22));

          if (objc_msgSend(v9, "count"))
            objc_msgSend(v21, "unionSet:", v9);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }

  -[MailAppController setCurrentAlertSuppressionContexts:](self, "setCurrentAlertSuppressionContexts:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchController"));
  objc_msgSend(v11, "setSuppressedContexts:", v21);

  v12 = objc_opt_new(NSArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v14 = objc_opt_respondsToSelector(v13, "visibleMailboxes");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "visibleMailboxes"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));

    v12 = (NSArray *)v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "daemonInterface"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "clientState"));
  objc_msgSend(v20, "setCurrentlyVisibleMailboxes:", v12);

}

- (void)_performBackEndOneShotInitialization
{
  EMFocusController *v3;
  EMFocusController *focusController;
  MFAccountsController *v5;
  MFAccountsController *accountsController;
  MFMailAccountsProvider *v7;
  MFMailAccountsProvider *accountsProvider;
  MFMailboxProvider *v9;
  MFMailboxProvider *mailboxProvider;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  FavoritesPersistence *v29;
  MFMailAccountsProvider *v30;
  void *v31;
  FavoritesPersistence *v32;
  FavoritesPersistence *favoritesPersistence;
  void *v34;
  DockContainerPersistence *v35;
  DockContainerPersistence *dockPersistence;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id location;

  if ((byte_1005A9C10 & 1) == 0)
  {
    byte_1005A9C10 = 1;
    +[MailAppIntentConfigurator configureAppManager](_TtC10MobileMail25MailAppIntentConfigurator, "configureAppManager");
    v3 = (EMFocusController *)objc_alloc_init((Class)EMFocusController);
    focusController = self->_focusController;
    self->_focusController = v3;

    v5 = -[MFAccountsController initWithFocusController:]([MFAccountsController alloc], "initWithFocusController:", self->_focusController);
    accountsController = self->_accountsController;
    self->_accountsController = v5;

    v7 = (MFMailAccountsProvider *)objc_claimAutoreleasedReturnValue(-[MFAccountsController accountsProvider](self->_accountsController, "accountsProvider"));
    accountsProvider = self->_accountsProvider;
    self->_accountsProvider = v7;

    v9 = (MFMailboxProvider *)objc_claimAutoreleasedReturnValue(-[MFAccountsController mailboxProvider](self->_accountsController, "mailboxProvider"));
    mailboxProvider = self->_mailboxProvider;
    self->_mailboxProvider = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
    objc_msgSend(v11, "setAllowsBackgroundResume:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vipManager"));
    +[VIPManager setBackingManager:](VIPManager, "setBackingManager:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", self, "_mailWasSent:", CFSTR("MailComposeControllerDidSendMail"), 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", self, "_accountsChanged:", EMAccountsChangedNotification, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "daemonInterface"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mailboxRepository"));

    v18 = objc_alloc((Class)EMQuery);
    v19 = objc_opt_class(EMMailbox);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate ef_matchEverythingPredicate](NSPredicate, "ef_matchEverythingPredicate"));
    v21 = objc_msgSend(v18, "initWithTargetClass:predicate:sortDescriptors:", v19, v20, &__NSArray0__struct);

    v22 = objc_msgSend(objc_alloc((Class)EMQueryingCollection), "initWithQuery:repository:", v21, v17);
    objc_msgSend(v22, "beginObserving:", self);
    -[MailAppController setMailboxCollection:](self, "setMailboxCollection:", v22);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000B2F9C, CFSTR("com.apple.mail.MailAccountSignaturesChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1000B2FA8, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController accountsController](self, "accountsController"));
    objc_msgSend(v25, "resetAccountsSynchronouslyOnMainThread");

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "persistence"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "conversationPersistence"));

    v29 = [FavoritesPersistence alloc];
    v30 = self->_accountsProvider;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
    v32 = -[FavoritesPersistence initWithConversationSubscriptionProvider:accountsProvider:mailboxPersistence:daemonInterface:analyticsCollector:](v29, "initWithConversationSubscriptionProvider:accountsProvider:mailboxPersistence:daemonInterface:analyticsCollector:", v28, v30, 0, v31, 0);
    favoritesPersistence = self->_favoritesPersistence;
    self->_favoritesPersistence = v32;

    -[MailAppController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "delayedStartupTasks", 0, 4.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MFUserProfileProvider_iOS defaultProvider](MFUserProfileProvider_iOS, "defaultProvider"));

    v35 = -[DockContainerPersistence initWithRecoveryDelegate:]([DockContainerPersistence alloc], "initWithRecoveryDelegate:", self);
    dockPersistence = self->_dockPersistence;
    self->_dockPersistence = v35;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "clientState"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "foregroundObservable"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100005D88;
    v41[3] = &unk_10051D528;
    objc_copyWeak(&v42, &location);
    v40 = objc_msgSend(v39, "subscribeWithResultBlock:", v41);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

  }
}

- (MailAppController)init
{
  MailAppController *v2;
  MailExtendedLaunchTracker *v3;
  MailExtendedLaunchTracker *extendedLaunchTracker;
  void *v5;
  MailAppController *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  MailAppController *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  MUIBrandIndicatorProvider *v18;
  MUIBrandIndicatorProvider *brandIndicatorProvider;
  uint64_t v20;
  MFDiskFreeSpaceMonitor *freeSpaceMonitor;
  NetworkActivityIndicator *v22;
  NetworkActivityIndicator *networkActivityIndicator;
  uint64_t v24;
  UNUserNotificationCenter *userNotificationCenter;
  MailUserNotificationCenterDelegate *v26;
  MailUserNotificationCenterDelegate *userNotificationCenterHelper;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  dispatch_source_t v37;
  OS_dispatch_source *diagnostic_signal_source;
  dispatch_source_t v39;
  OS_dispatch_source *multipurpose_signal_source;
  void *v41;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v43;
  MailAppController *v44;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  MailAppController *v49;
  _QWORD v50[4];
  MailAppController *v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)MailAppController;
  v2 = -[MailAppController init](&v52, "init");
  if (v2)
  {
    v3 = -[MailExtendedLaunchTracker initWithDelegate:]([MailExtendedLaunchTracker alloc], "initWithDelegate:", v2);
    extendedLaunchTracker = v2->_extendedLaunchTracker;
    v2->_extendedLaunchTracker = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000B17D4;
    v50[3] = &unk_10051AA98;
    v6 = v2;
    v51 = v6;
    v7 = objc_msgSend(v5, "afterDelay:performBlock:", v50, 60.0);

    v8 = objc_msgSend(objc_alloc((Class)EMDaemonInterface), "initAndConfigureBlockedSenderManager:", 1);
    -[MailAppController setDaemonInterface:](v6, "setDaemonInterface:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](v6, "daemonInterface"));
    objc_msgSend(v9, "launchDaemon");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](v6, "daemonInterface"));
    +[MFWKWebViewFactory setDaemonInterface:URLCacheWithMemoryCapacity:](MFWKWebViewFactory, "setDaemonInterface:URLCacheWithMemoryCapacity:", v10, 0x400000);

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000B1858;
    v48[3] = &unk_10051D428;
    v11 = v6;
    v49 = v11;
    +[MFComposeWebView setURLCacheBlock:](MFComposeWebView, "setURLCacheBlock:", v48);
    +[MFAccount setShouldHealAccounts:](MFAccount, "setShouldHealAccounts:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](v11, "daemonInterface"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountRepository"));
    objc_msgSend(v13, "requestAccounts");

    v14 = objc_alloc_init((Class)MUICachingSVGConverter);
    v15 = objc_alloc((Class)MUIBrandIndicatorProvider);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](v11, "daemonInterface"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageRepository"));
    v18 = (MUIBrandIndicatorProvider *)objc_msgSend(v15, "initWithMessageRepository:svgConverter:", v17, v14);
    brandIndicatorProvider = v11->_brandIndicatorProvider;
    v11->_brandIndicatorProvider = v18;

    MFSetUserAgent(v11);
    v20 = objc_claimAutoreleasedReturnValue(+[MFDiskFreeSpaceMonitor defaultMonitor](MFDiskFreeSpaceMonitor, "defaultMonitor"));
    freeSpaceMonitor = v11->_freeSpaceMonitor;
    v11->_freeSpaceMonitor = (MFDiskFreeSpaceMonitor *)v20;

    v22 = objc_alloc_init(NetworkActivityIndicator);
    networkActivityIndicator = v11->_networkActivityIndicator;
    v11->_networkActivityIndicator = v22;

    v24 = objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    userNotificationCenter = v11->_userNotificationCenter;
    v11->_userNotificationCenter = (UNUserNotificationCenter *)v24;

    v26 = -[MailUserNotificationCenterDelegate initWithAlertSuppressionContextProvider:]([MailUserNotificationCenterDelegate alloc], "initWithAlertSuppressionContextProvider:", v11);
    userNotificationCenterHelper = v11->_userNotificationCenterHelper;
    v11->_userNotificationCenterHelper = v26;

    -[UNUserNotificationCenter setDelegate:](v11->_userNotificationCenter, "setDelegate:", v11->_userNotificationCenterHelper);
    if (_os_feature_enabled_impl("Mail", "Extensions"))
    {
      v28 = objc_alloc((Class)MEContentRuleListManager);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MEAppExtensionsController sharedInstance](MEAppExtensionsController, "sharedInstance"));
      v30 = objc_msgSend(v28, "initWithExtensionsController:", v29);

      objc_storeStrong((id *)&v11->_contentRuleListManager, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MFWKWebViewFactory sharedWebViewFactoryFuture](MFWKWebViewFactory, "sharedWebViewFactoryFuture"));
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000B18E8;
      v46[3] = &unk_10051D450;
      v32 = v30;
      v47 = v32;
      objc_msgSend(v31, "addSuccessBlock:", v46);

    }
    +[EMServerConfiguration refreshAsync](EMServerConfiguration, "refreshAsync");
    -[MailAppController _configureUserDefaultsKVOAdd:](v11, "_configureUserDefaultsKVOAdd:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[EFDevice currentDevice](EFDevice, "currentDevice"));
    v34 = objc_msgSend(v33, "isInternal");

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v35, "addObserver:selector:name:object:", v11, "_userDidTakeScreenshot:", UIApplicationUserDidTakeScreenshotNotification, 0);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"));
    objc_msgSend(v36, "startListeningForBatterySaverNotifications");

    signal(30, (void (__cdecl *)(int))1);
    v37 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    diagnostic_signal_source = v11->diagnostic_signal_source;
    v11->diagnostic_signal_source = (OS_dispatch_source *)v37;

    dispatch_source_set_event_handler((dispatch_source_t)v11->diagnostic_signal_source, &stru_10051D470);
    dispatch_resume((dispatch_object_t)v11->diagnostic_signal_source);
    signal(31, (void (__cdecl *)(int))1);
    v39 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    multipurpose_signal_source = v11->multipurpose_signal_source;
    v11->multipurpose_signal_source = (OS_dispatch_source *)v39;

    dispatch_source_set_event_handler((dispatch_source_t)v11->multipurpose_signal_source, &stru_10051D490);
    dispatch_resume((dispatch_object_t)v11->multipurpose_signal_source);
    +[NSURLProtocol registerClass:](NSURLProtocol, "registerClass:", objc_opt_class(MFMessageURLProtocol));
    MFRegisterPowerObserver(v11);
    +[MFMessageStore setDefaultMessageHeadersClass:](MFMessageStore, "setDefaultMessageHeadersClass:", objc_opt_class(MFLocalizedMessageHeaders));
    -[MailAppController _setUserDefaultsSyncEnabled:](v11, "_setUserDefaultsSyncEnabled:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[MFDiagnostics sharedController](MFDiagnostics, "sharedController"));
    objc_msgSend(v41, "addDiagnosticsGenerator:", v11);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobilemail.launch"), 0, 0, 1u);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v43, "setBatteryMonitoringEnabled:", 1);

    v44 = v11;
  }

  return v2;
}

- (void)_configureUserDefaultsKVOAdd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  MailAppController *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = sub_100044814(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (v3)
          v12 = objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), 1, "UserDefaultsKVOContext");
        else
          v12 = objc_msgSend(v5, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
        v13 = MFLogGeneral(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v20 = self;
          v21 = 1024;
          v22 = v3;
          v23 = 2112;
          v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "MailAppController (%p) add(%{BOOL}d) observer for key path %@", buf, 0x1Cu);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v8);
  }

}

- (BOOL)isMobileMail
{
  return 1;
}

- (BOOL)isMaild
{
  return 0;
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = (void *)qword_1005A9C18;
  qword_1005A9C18 = 0;
  v7 = a4;
  v8 = a3;

  v9 = (void *)qword_1005A9C20;
  qword_1005A9C20 = 0;

  v10 = (void *)qword_1005A9C28;
  qword_1005A9C28 = 0;

  v11.receiver = self;
  v11.super_class = (Class)MailAppController;
  -[MailAppController finishedTest:extraResults:](&v11, "finishedTest:extraResults:", v8, v7);

}

- (void)updateDefaultImageWithReason:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (pthread_main_np() != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailAppController.m"), 622, CFSTR("Current thread must be main"));

  }
  -[MailAppController setLastDefaultImageUpdateReason:](self, "setLastDefaultImageUpdateReason:", v6);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_reallyUpdateDefaultImage", 0);
  -[MailAppController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_reallyUpdateDefaultImage", 0, 1.0);

}

- (void)setMailboxCollection:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxCollection, a3);
}

- (void)setLastDefaultImageUpdateReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setExtendedLaunchTracker:(id)a3
{
  objc_storeStrong((id *)&self->_extendedLaunchTracker, a3);
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (void)setCurrentAlertSuppressionContexts:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)registerApplicationLifecycleObservers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "foregroundObservable"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003AF40;
  v7[3] = &unk_10051B950;
  v7[4] = self;
  v6 = objc_msgSend(v5, "subscribeWithResultBlock:", v7);

}

- (void)performUIRelatedLaunchTasksIfNeeded
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B1D4;
  block[3] = &unk_10051AA98;
  block[4] = self;
  if (qword_1005A9C00 != -1)
    dispatch_once(&qword_1005A9C00, block);
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (EMQueryingCollection)mailboxCollection
{
  return self->_mailboxCollection;
}

- (MFDiskFreeSpaceMonitor)freeSpaceMonitor
{
  return self->_freeSpaceMonitor;
}

- (EMFocusController)focusController
{
  return self->_focusController;
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (MailExtendedLaunchTracker)extendedLaunchTracker
{
  return self->_extendedLaunchTracker;
}

- (DockContainerPersistence)dockPersistence
{
  return self->_dockPersistence;
}

- (void)didFinishLoadAllScenes:(id)a3
{
  void *v4;
  void *v5;

  sub_100044780((uint64_t)self);
  v4 = (void *)UIApp;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "_launchTestName"));
  objc_msgSend(v4, "finishedTest:extraResults:", v5, 0);

  -[MailAppController setExtendedLaunchTracker:](self, "setExtendedLaunchTracker:", 0);
}

- (id)defaultAttachmentManager
{
  return self->_defaultAttachmentManager;
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  -[MailAppController _updateAccountsIfNecessaryFromCollection:](self, "_updateAccountsIfNecessaryFromCollection:", a3, a4, a5);
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (MFAccountsController)accountsController
{
  return self->_accountsController;
}

- (id)_extendLaunchTest
{
  return CFSTR("LaunchToBecomeResponsive");
}

- (void)_beginAutoFetchIfViable
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController freeSpaceMonitor](self, "freeSpaceMonitor"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B884;
  v4[3] = &unk_10051D4B8;
  v4[4] = self;
  objc_msgSend(v3, "getFreeSpaceStatusWithCompletionHandler:", v4);

}

- (void)_accountsChanged:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BCE0;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performSyncBlock:", v4);

}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B484;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9C40 != -1)
    dispatch_once(&qword_1005A9C40, block);
  return (id)qword_1005A9C38;
}

- (id)copyDiagnosticInformation
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v2 = objc_alloc_init((Class)NSMutableString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFWebAttachmentSource allSources](MFWebAttachmentSource, "allSources"));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v2, "appendFormat:", CFSTR("==== Attachment Stores ====\n%@\n"), v3);
  objc_msgSend(v2, "appendString:", CFSTR("\n==== Accounts ====\n"));
  v22 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccountsWithError:](MailAccount, "mailAccountsWithError:", &v22));
  v4 = v22;
  v5 = v4;
  if (v4)
    objc_msgSend(v2, "appendFormat:", CFSTR("  last error: %@\n"), v4, v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount lastMailAccountsReloadDate](MailAccount, "lastMailAccountsReloadDate"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter ef_formatDate:shortStyle:](NSDateFormatter, "ef_formatDate:shortStyle:", v6, 0));
    objc_msgSend(v2, "appendFormat:", CFSTR("  last reload: %@\n"), v7);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v17;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), "copyDiagnosticInformation");
        v13 = v12;
        if (v12)
          objc_msgSend(v2, "appendFormat:", CFSTR("\n%@\n"), v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }

  v14 = EFContentProtectionDumpDiagnosticState();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v2, "appendString:", v15);

  return v2;
}

- (BOOL)isFrontmost
{
  if ((objc_msgSend(UIApp, "isSuspended") & 1) != 0)
    return 0;
  else
    return objc_msgSend(UIApp, "isSuspendedEventsOnly") ^ 1;
}

- (void)startListeningForNotifications
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "canFetch", (_QWORD)v7))
          objc_msgSend(v6, "startListeningForNotifications");
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)delayedStartupTasks
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  if ((-[MailAppController launchedToTest](self, "launchedToTest") & 1) != 0)
    v3 = 1;
  else
    v3 = EFIsRunningUnitTests();
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientState"));
  objc_msgSend(v4, "setIsRunningTests:", v3);

  -[MailAppController _preallocateWebViews](self, "_preallocateWebViews");
  if ((v3 & 1) == 0)
  {
    if (-[MailAppController isForeground](self, "isForeground"))
    {
      -[MailAppController _setupDiagnosticProviderIfNeeded](self, "_setupDiagnosticProviderIfNeeded");
      v7 = (id)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fetchController"));
      objc_msgSend(v5, "performFetchOfType:", EMFetchTypeLaunch);

    }
    v8 = (id)objc_claimAutoreleasedReturnValue(+[MailTipsHelper shared](_TtC10MobileMail14MailTipsHelper, "shared"));
    objc_msgSend(v8, "setup");

  }
}

- (void)_preallocateWebViews
{
  NSObject *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  MailAppController *v13;

  v3 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 2048;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Launch] Preallocate web views", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFWKWebViewFactory sharedWebViewFactoryFuture](MFWKWebViewFactory, "sharedWebViewFactoryFuture"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B208C;
  v9[3] = &unk_10051D450;
  v9[4] = self;
  objc_msgSend(v7, "onScheduler:addSuccessBlock:", v8, v9);

}

- (void)_setupDiagnosticProviderIfNeeded
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B220C;
  block[3] = &unk_10051AA98;
  block[4] = self;
  if (qword_1005A9C08 != -1)
    dispatch_once(&qword_1005A9C08, block);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned int v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  __CFString *v36;

  v7 = a4;
  v28 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userActivities"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
  if (objc_msgSend(v10, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ef_mapSelector:", "activityType"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));

  }
  else
  {
    v14 = CFSTR("None");
  }
  v15 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activityType"));
    *(_DWORD *)buf = 138544130;
    v30 = v17;
    v31 = 2114;
    v32 = v9;
    v33 = 2114;
    v34 = v18;
    v35 = 2114;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ -\n\tRole: %{public}@\n\tSelected User Activity: %{public}@\n\tUser Activity Types: %{public}@", buf, 0x2Au);

  }
  if (v9 != UIWindowSceneSessionRoleApplication)
  {
    if (v9 == (NSString *)SiriInteractiveSessionRoleSnippet)
    {
      v23 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found SiriInteractiveSessionRoleSnippet, updating config", buf, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UISceneConfiguration configurationWithName:sessionRole:](UISceneConfiguration, "configurationWithName:sessionRole:", 0, v9));
      objc_msgSend(v19, "setDelegateClass:", objc_opt_class(_TtC10MobileMail13SiriMailScene));
    }
    else
    {
      v19 = v8;
    }
    goto LABEL_23;
  }
  v20 = MailSceneNameMainScene;
  if (v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activityType"));
    if ((objc_msgSend(v21, "isEqualToString:", MSMailActivityHandoffTypeComposeWithStreams) & 1) != 0)
    {
      v22 = (id *)&MailSceneNameComposeScene;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", MSMailActivityHandoffTypeDisplayMessage) & 1) != 0)
    {
      v22 = (id *)&MailSceneNameConversationScene;
    }
    else
    {
      if ((objc_msgSend(v21, "isEqualToString:", MSMailActivityHandoffTypeQuickLook) & 1) == 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[EFDevice currentDevice](EFDevice, "currentDevice"));
        if (objc_msgSend(v24, "isInternal"))
        {
          v27 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.mail.private.debugmenu"));

          if (v27)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[UISceneConfiguration configurationWithName:sessionRole:](UISceneConfiguration, "configurationWithName:sessionRole:", 0, v9));
            objc_msgSend(v25, "setDelegateClass:", objc_opt_class(MailSceneLifecycleController));
            objc_msgSend(v25, "setSceneClass:", objc_opt_class(MailDebugScene));

            goto LABEL_24;
          }
          goto LABEL_21;
        }
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      v22 = (id *)&MailSceneNameQuickLookScene;
    }
    v24 = v20;
    v20 = *v22;
    goto LABEL_20;
  }
LABEL_22:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UISceneConfiguration configurationWithName:sessionRole:](UISceneConfiguration, "configurationWithName:sessionRole:", v20, v9));

LABEL_23:
  v8 = v19;
  v25 = v8;
LABEL_24:

  return v25;
}

- (void)_deliveryQueueProcessingFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sent")));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("playSound")));
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
      +[MFSoundController playSentMailSound](MFSoundController, "playSentMailSound");
    -[MailAppController _mailWasSent:](self, "_mailWasSent:", v8);
  }

}

- (void)_mailWasSent:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchController"));
    objc_msgSend(v6, "performFetchOfType:", EMFetchTypeStandardMailbox);

  }
  else
  {
    -[MailAppController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v7, 0);
  }

}

- (void)significantTimeChange
{
  void *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B29CC;
  v3[3] = &unk_10051AA98;
  v3[4] = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v2, "performBlock:", v3);

}

- (EMBlockedSenderManager)blockedSenderManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "blockedSenderManager"));

  return (EMBlockedSenderManager *)v3;
}

- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager
{
  _TtC10MobileMail21AppStoreReviewManager *appStoreReviewManager;
  NSObject *v4;
  _TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *v5;
  void *v6;
  _TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *v7;
  _TtC10MobileMail40AppStoreReviewRequirementConstantStorage *v8;
  _TtC10MobileMail21AppStoreReviewManager *v9;
  _TtC10MobileMail21AppStoreReviewManager *v10;
  uint8_t v12[16];

  appStoreReviewManager = self->_appStoreReviewManager;
  if (!appStoreReviewManager)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing AppStoreReviewManager...", v12, 2u);
    }

    v5 = [_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v7 = -[AppStoreReviewEligibilityUserDefaultsTracker initWithUserDefaults:](v5, "initWithUserDefaults:", v6);

    v8 = objc_alloc_init(_TtC10MobileMail40AppStoreReviewRequirementConstantStorage);
    v9 = -[AppStoreReviewManager initWithEligibilityTracker:requirementStorage:]([_TtC10MobileMail21AppStoreReviewManager alloc], "initWithEligibilityTracker:requirementStorage:", v7, v8);
    v10 = self->_appStoreReviewManager;
    self->_appStoreReviewManager = v9;

    appStoreReviewManager = self->_appStoreReviewManager;
  }
  return appStoreReviewManager;
}

- (void)_reallyUpdateDefaultImage
{
  void *v3;
  void *v4;
  id v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  const __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;

  if (-[MailAppController isSuspended](self, "isSuspended"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
      v5 = objc_msgSend(v4, "protectedDataAvailability");

      if (!v5)
      {
        -[MailAppController _updateSnapshotForBackgroundApplication:](self, "_updateSnapshotForBackgroundApplication:", 0);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MailAppController lastDefaultImageUpdateReason](self, "lastDefaultImageUpdateReason"));
        v7 = MFLogGeneral(v6);
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = ": ";
          if (!v6)
            v9 = "";
          v10 = &stru_100531B00;
          if (v6)
            v10 = v6;
          v11 = 136315394;
          v12 = v9;
          v13 = 2112;
          v14 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updated default image%s%@", (uint8_t *)&v11, 0x16u);
        }

      }
    }
  }
}

- (void)cleanUpAfterSuspend
{
  void *v4;
  id v5;
  id v6;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", a2, self, 0, 15, 0));
    objc_msgSend(v5, "addInvocation:", v4);

  }
  else
  {
    +[MailAccount saveStateForAllAccounts](MailAccount, "saveStateForAllAccounts");
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "synchronize");

    v5 = (id)objc_claimAutoreleasedReturnValue(+[MailPersistentStorage sharedStorage](MailPersistentStorage, "sharedStorage"));
    objc_msgSend(v5, "save");
  }

}

- (void)didReceiveMemoryWarning
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailAppController;
  -[MailAppController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", MailApplicationMemoryWarningNotification, 0);

}

- (BOOL)isForeground
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController daemonInterface](self, "daemonInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientState"));
  v4 = objc_msgSend(v3, "isForeground");

  return v4;
}

- (BOOL)canUseSpotlightIndex
{
  return 1;
}

- (void)dealloc
{
  __CFDictionary *emptiedTrashTimestamps;
  void *v4;
  objc_super v5;

  notify_cancel(self->_accountChangeNotificationToken);
  emptiedTrashTimestamps = self->_emptiedTrashTimestamps;
  if (emptiedTrashTimestamps)
    CFRelease(emptiedTrashTimestamps);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController diagnosticInfoProviderToken](self, "diagnosticInfoProviderToken"));
  objc_msgSend(v4, "cancel");

  -[MailAppController _configureUserDefaultsKVOAdd:](self, "_configureUserDefaultsKVOAdd:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MailAppController;
  -[MailAppController dealloc](&v5, "dealloc");
}

- (void)_handleDeliveryFailure:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("account")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("error")));
  if (v5)
    -[MailAppController displayError:forAccount:mode:](self, "displayError:forAccount:mode:", v5, v4, 1);

}

- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[3];
  uint8_t buf[4];
  void *v27;

  v7 = a3;
  v20 = a5;
  v8 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController providerObjectID](self, "providerObjectID"));
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> Gathering diagnostics...", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_URLByAppendingTimestampedPathComponent:withExtension:", CFSTR("SceneSessions"), CFSTR("log")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _dumpUIStateAtURL:](self, "_dumpUIStateAtURL:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_URLByAppendingTimestampedPathComponent:withExtension:", CFSTR("EMUserDefaults"), CFSTR("plist")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _dumpEMUserDefaultsAtURL:](self, "_dumpEMUserDefaultsAtURL:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_URLByAppendingTimestampedPathComponent:withExtension:", CFSTR("StandardUserDefaults"), CFSTR("plist")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _dumpEMUserDefaultsAtURL:](self, "_dumpEMUserDefaultsAtURL:", v14));
  v25[0] = v11;
  v25[1] = v13;
  v25[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture join:](EFFuture, "join:", v16));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B3398;
  v23[3] = &unk_10051B3D8;
  v18 = v20;
  v24 = v18;
  objc_msgSend(v17, "addSuccessBlock:", v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B344C;
  v21[3] = &unk_10051B000;
  v19 = v18;
  v22 = v19;
  objc_msgSend(v17, "addFailureBlock:", v21);

}

- (void)_userDidTakeScreenshot:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[24];

  v4 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screenshot taken. Dumping UI state...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EMDiagnosticInfoGatherer localDiagnosticsDirectoryURL](EMDiagnosticInfoGatherer, "localDiagnosticsDirectoryURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = 0;
  objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v12);
  v7 = v12;

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
      sub_100391D50(v9, (uint64_t)v7, (uint64_t)buf);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_URLByAppendingTimestampedPathComponent:withExtension:", CFSTR("Screenshot"), CFSTR("log")));
  v11 = -[MailAppController _dumpUIStateAtURL:](self, "_dumpUIStateAtURL:", v10);

}

- (id)_dumpUIStateAtURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;
  MailAppController *v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_1000B386C;
  v16[4] = sub_1000B387C;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_alloc_init((Class)NSMutableString);
  v15 = v16;
  v6 = v4;
  v12 = v6;
  v13 = self;
  v7 = v5;
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000B3884, &unk_10051D578));
  objc_msgSend(v8, "performBlock:", &v11);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "future"));
  _Block_object_dispose(v16, 8);

  return v9;
}

- (id)_dumpEMUserDefaultsAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _dumpUserDefaults:atURL:](self, "_dumpUserDefaults:atURL:", v5, v4));

  return v6;
}

- (id)_dumpStandardUserDefaultsAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _dumpUserDefaults:atURL:](self, "_dumpUserDefaults:atURL:", v5, v4));

  return v6;
}

- (id)_dumpUserDefaults:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  MailAppController *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_1000B40FC;
  v18 = &unk_10051C1F0;
  v10 = v6;
  v19 = v10;
  v11 = v7;
  v20 = v11;
  v21 = self;
  v12 = v8;
  v22 = v12;
  objc_msgSend(v9, "performBlock:", &v15);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "future", v15, v16, v17, v18));
  return v13;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;

  v8 = a3;
  if (a6 == "UserDefaultsKVOContext")
    -[MailAppController _userDefaultDidChange:](self, "_userDefaultDidChange:", v8);

}

- (void)_userDefaultDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  int v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "synchronize");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  objc_msgSend(v5, "synchronize");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  if ((objc_msgSend(v16, "isEqualToString:", MFMailAccountDescription) & 1) != 0)
  {
    v7 = &MailApplicationDidChangeAccountDisplayName;
LABEL_3:
    objc_msgSend(v6, "postNotificationName:object:", *v7, self);
    v8 = 1;
    goto LABEL_10;
  }
  if ((objc_msgSend(v16, "isEqualToString:", EMUserDefaultLoadRemoteContentKey) & 1) != 0)
  {
    v9 = &MailApplicationDidChangeRemoteImageLoading;
  }
  else
  {
    if (objc_msgSend(v16, "isEqualToString:", IncludeAttachmentRepliesKey))
    {
      v10 = sub_1001D6C98(1);
      goto LABEL_9;
    }
    if (objc_msgSend(v16, "isEqualToString:", EMUserDefaultLinesOfPreviewKey))
    {
      +[NSUserDefaults em_resetLinesOfPreview](NSUserDefaults, "em_resetLinesOfPreview");
      v7 = &MailApplicationDidChangePreviewLinesNotification;
      goto LABEL_3;
    }
    if (objc_msgSend(v16, "isEqualToString:", ShowToCCIndicatorsKey))
    {
      sub_100039DC8(1);
      v7 = &MailApplicationDidChangeShowToCCNotification;
      goto LABEL_3;
    }
    if (objc_msgSend(v16, "isEqualToString:", DisableThreadingKey))
    {
      v7 = &MailApplicationsDisableThreadingKeyChanged;
      goto LABEL_3;
    }
    if (objc_msgSend(v16, "isEqualToString:", RightSwipeActionKey))
    {
      v13 = sub_1001D6D14(1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v14, "postNotificationName:object:", MailApplicationDidChangeSwipeActions, self);

      goto LABEL_9;
    }
    if (objc_msgSend(v16, "isEqualToString:", LeftSwipeActionKey))
    {
      v15 = sub_1001D6DCC(1);
      v9 = &MailApplicationDidChangeSwipeActions;
    }
    else if (objc_msgSend(v16, "isEqualToString:", ConversationViewShowsNewestAtTop))
    {
      sub_100039F44(1);
      v9 = &MailApplicationDidChangeConversationOrder;
    }
    else if (objc_msgSend(v16, "isEqualToString:", ConversationViewExcludesRelatedMessagesKey))
    {
      sub_100039F8C(1);
      v9 = &MailApplicationDidChangeConversationViewIncludesRelatedMessages;
    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", CollapseReadConversationMessagesKey))
        goto LABEL_9;
      sub_1001D6C4C(1);
      v9 = &MailApplicationDidChangeConversationViewCollapseReadMessagesNotification;
    }
  }
  objc_msgSend(v6, "postNotificationName:object:", *v9, self);
LABEL_9:
  v8 = 0;
LABEL_10:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:userInfo:", MailDefaultsChangedNotification, v16, 0);

  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("defaults changed: %@"), v16));
    -[MailAppController updateDefaultImageWithReason:](self, "updateDefaultImageWithReason:", v12);

  }
}

- (void)systemWillSleep
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](MailAccount, "activeAccounts"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "systemWillSleep");

}

- (void)systemDidWake
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](MailAccount, "activeAccounts"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "systemDidWake");

}

- (BOOL)canPerformNetworkOperationOnAccount:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "canGoOffline") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
    v4 = objc_msgSend(v5, "isDataAvailable");

  }
  return v4;
}

- (id)accountCanPerformNetworkOperations:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B4918;
  v6[3] = &unk_10051C528;
  v6[4] = self;
  v7 = a3;
  v3 = v7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithBlock:](EFFuture, "futureWithBlock:", v6));

  return v4;
}

- (BOOL)isAllowedToAccessProtectedData
{
  return 1;
}

- (id)sourceApplicationBundleIdentifier
{
  return kMFMobileMailBundleIdentifier;
}

- (BOOL)canRegisterForAPSPush
{
  return 0;
}

- (void)_setProtectedDataAvailabilityWithNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", MailMessageLibraryProtectedDataAvailibilityKey));

  v5 = v6;
  if (v6)
  {
    self->_protectedDataAvailability = objc_msgSend(v6, "unsignedIntValue");
    v5 = v6;
  }

}

- (void)performWhenProtectedDataIsAvailable:(id)a3
{
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id blockToPerformWhenProtectedDataIsAvailable;
  void (**v10)(_QWORD);
  id v11;
  void *v12;
  uint8_t v13[16];

  v5 = (void (**)(_QWORD))a3;
  v6 = pthread_main_np();
  if ((_DWORD)v6 != 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailAppController.m"), 1071, CFSTR("Current thread must be main"));

  }
  if (self->_protectedDataAvailability == 2)
  {
    v7 = MFLogGeneral(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will perform when protected data is available.", v13, 2u);
    }

    blockToPerformWhenProtectedDataIsAvailable = self->_blockToPerformWhenProtectedDataIsAvailable;
    self->_blockToPerformWhenProtectedDataIsAvailable = 0;

    if (v5)
    {
      v10 = objc_retainBlock(v5);
      v11 = self->_blockToPerformWhenProtectedDataIsAvailable;
      self->_blockToPerformWhenProtectedDataIsAvailable = v10;

      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "cancelPreviousPerformRequestsWhenProtectedDataIsAvailable", 0);
      -[MailAppController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "cancelPreviousPerformRequestsWhenProtectedDataIsAvailable", 0, 2.0);
    }
  }
  else if (v5)
  {
    v5[2](v5);
  }

}

- (void)cancelPreviousPerformRequestsWhenProtectedDataIsAvailable
{
  void *v4;

  if (pthread_main_np() != 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailAppController.m"), 1093, CFSTR("Current thread must be main"));

  }
  -[MailAppController performWhenProtectedDataIsAvailable:](self, "performWhenProtectedDataIsAvailable:", 0);
}

- (void)_messageLibraryWillBecomeUnavailable:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t protectedDataAvailability;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailAppController.m"), 1099, CFSTR("Current thread must be main"));

  }
  v6 = MFLogGeneral(-[MailAppController _setProtectedDataAvailabilityWithNotification:](self, "_setProtectedDataAvailabilityWithNotification:", v5));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    protectedDataAvailability = self->_protectedDataAvailability;
    v16 = 134217984;
    v17 = protectedDataAvailability;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Protected data will become unavailable (%lu)", (uint8_t *)&v16, 0xCu);
  }

  v9 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend((id)v9, "postNotificationName:object:", MailApplicationProtectedDataWillBecomeUnavailable, self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController postponedMessageURL](self, "postponedMessageURL"));
  LOBYTE(v9) = v10 == 0;

  if ((v9 & 1) == 0)
  {
    v12 = MFLogGeneral(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController postponedMessageURL](self, "postponedMessageURL"));
      v16 = 138412290;
      v17 = (unint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Forgetting postponed URL %@ because protected data became unavailable", (uint8_t *)&v16, 0xCu);

    }
    -[MailAppController setPostponedMessageURL:](self, "setPostponedMessageURL:", 0);
  }

}

- (void)_messageLibraryDidBecomeAvailable:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t protectedDataAvailability;
  void *v9;
  id blockToPerformWhenProtectedDataIsAvailable;
  void *v11;
  int v12;
  unint64_t v13;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailAppController.m"), 1113, CFSTR("Current thread must be main"));

  }
  v6 = MFLogGeneral(-[MailAppController _setProtectedDataAvailabilityWithNotification:](self, "_setProtectedDataAvailabilityWithNotification:", v5));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    protectedDataAvailability = self->_protectedDataAvailability;
    v12 = 134217984;
    v13 = protectedDataAvailability;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Protected data did become available (%lu)", (uint8_t *)&v12, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:", MailApplicationProtectedDataDidBecomeAvailable, self);

  if (self->_blockToPerformWhenProtectedDataIsAvailable)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "cancelPreviousPerformRequestsWhenProtectedDataIsAvailable", 0);
    (*((void (**)(void))self->_blockToPerformWhenProtectedDataIsAvailable + 2))();
    blockToPerformWhenProtectedDataIsAvailable = self->_blockToPerformWhenProtectedDataIsAvailable;
    self->_blockToPerformWhenProtectedDataIsAvailable = 0;

  }
}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  objc_msgSend(v9, "displayError:forAccount:mode:", v10, v8, a5);

}

- (NSSet)selectedAccounts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedAccounts"));

  return (NSSet *)v3;
}

- (void)terminateOnNextSuspend
{
  *((_BYTE *)self + 80) |= 1u;
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  -[MailAppController _updateAccountsIfNecessaryFromCollection:](self, "_updateAccountsIfNecessaryFromCollection:", a3, a4, a5);
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  -[MailAppController _updateAccountsIfNecessaryFromCollection:](self, "_updateAccountsIfNecessaryFromCollection:", a3, a4);
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  -[MailAppController _updateAccountsIfNecessaryFromCollection:](self, "_updateAccountsIfNecessaryFromCollection:", a3, a4);
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  -[MailAppController _updateAccountsIfNecessaryFromCollection:](self, "_updateAccountsIfNecessaryFromCollection:", a3, a4, a5);
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  -[MailAppController _updateAccountsIfNecessaryFromCollection:](self, "_updateAccountsIfNecessaryFromCollection:", a3, a4, a5);
}

- (id)identifiersToExcludeFromDockedItemRecovery
{
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000B386C;
  v10 = sub_1000B387C;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000B51D0, &unk_10051D620, self, &v6));
  objc_msgSend(v2, "performSyncBlock:", &v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MailAppController;
  -[MailAppController buildMenuWithBuilder:](&v39, "buildMenuWithBuilder:", v4);
  if (self)
  {
    self = self->_menuCommandsCollection;
    if (self)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "system"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

      if (v5 == v6)
      {
        v7 = sub_1000EFBD4((uint64_t)self, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v8 = sub_1000EFBD4((uint64_t)self, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v9 = sub_1000EFBD4((uint64_t)self, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v10 = sub_1000EFBD4((uint64_t)self, 3);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v11 = sub_1000EFBD4((uint64_t)self, 4);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v12 = sub_1000EFBD4((uint64_t)self, 5);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v13 = sub_1000EFBD4((uint64_t)self, 6);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v14 = sub_1000EFBD4((uint64_t)self, 7);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v4, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuFind, &stru_10051D660);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v37));
        objc_msgSend(v4, "insertChildMenu:atStartOfMenuForIdentifier:", v30, UIMenuApplication);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v32));
        objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v29, UIMenuEdit);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v34));
        objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v15, UIMenuFile);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v31));
        objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v16, UIMenuView);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v33));
        objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v17, UIMenuFormat);
        v18 = sub_1000B5A40(CFSTR("MAILBOX_MENU_TITLE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v19, v36));

        objc_msgSend(v4, "insertSiblingMenu:afterMenuForIdentifier:", v20, UIMenuEdit);
        v21 = sub_1000B5A40(CFSTR("MESSAGE_MENU_TITLE"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v22, v38));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
        objc_msgSend(v4, "insertSiblingMenu:afterMenuForIdentifier:", v23, v24);

        v25 = sub_1000B5A40(CFSTR("WINDOW_MENU_TITLE"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v26, v35));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
        objc_msgSend(v4, "insertSiblingMenu:afterMenuForIdentifier:", v27, v28);

      }
    }
  }

}

- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a5)
    v5 = 2;
  else
    v5 = 3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  objc_msgSend(v7, "closeSceneWithAnimation:", v5);

}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  objc_msgSend(v7, "didFailToContinueUserActivityWithType:error:", v8, v6);

}

- (id)activeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeViewController"));

  return v3;
}

- (void)mailComposeDeliveryControllerDidAttemptToSaveDraft:(id)a3 account:(id)a4 result:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  MailAppController *v14;
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  v14 = self;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v17 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000B5D4C, &unk_10051AB60, v14));
  objc_msgSend(v12, "performBlock:", &v13);

}

- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  MailAppController *v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000B5ED0, &unk_10051C1F0, v16));
  objc_msgSend(v14, "performBlock:", &v15);

}

- (void)mailComposeDeliveryControllerWillAttemptToSend:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  MailAppController *v6;
  id v7;

  v6 = self;
  v3 = a3;
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000B5FE4, &unk_10051A910, v6));
  objc_msgSend(v4, "performBlock:", &v5);

}

- (void)mailComposeDeliveryController:(id)a3 didMoveCancelledMessageToDrafts:(id)a4 draftMailboxObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  MailAppController *v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000B6164, &unk_10051C1F0, v16));
  objc_msgSend(v14, "performBlock:", &v15);

}

- (BOOL)_shouldShowAlertForUndoManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v5 = MSSendMailIntent_ptr;
  if (!+[UIApplication instancesRespondToSelector:](UIApplication, "instancesRespondToSelector:", "_motionKeyWindow")|| !+[UIApplication instancesRespondToSelector:](UIApplication, "instancesRespondToSelector:", "_shouldShowAlertForUndoManager:"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100391E38(v5, v8, v9, v10, v11, v12, v13, v14);
    v7 = 0;
    goto LABEL_10;
  }
  v6 = v4;
  if (!v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MailAppController _motionKeyWindow](self, "_motionKeyWindow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject undoManager](v5, "undoManager"));
  }
  v16.receiver = self;
  v16.super_class = (Class)MailAppController;
  v7 = -[MailAppController _shouldShowAlertForUndoManager:](&v16, "_shouldShowAlertForUndoManager:", v6);
  if (!v4)
  {

LABEL_10:
  }

  return v7;
}

- (void)_showEditAlertViewWithUndoManager:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = MSSendMailIntent_ptr;
  if (!+[UIApplication instancesRespondToSelector:](UIApplication, "instancesRespondToSelector:", "_motionKeyWindow")|| !+[UIApplication instancesRespondToSelector:](UIApplication, "instancesRespondToSelector:", "_shouldShowAlertForUndoManager:"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100391E6C(v8, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  v9 = v6;
  if (!v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MailAppController _motionKeyWindow](self, "_motionKeyWindow"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject undoManager](v8, "undoManager"));
  }
  v17.receiver = self;
  v17.super_class = (Class)MailAppController;
  -[MailAppController _showEditAlertViewWithUndoManager:window:](&v17, "_showEditAlertViewWithUndoManager:window:", v9, v7);
  if (!v6)
  {

LABEL_9:
  }

}

- (EMObjectID)providerObjectID
{
  return self->_providerObjectID;
}

- (id)composeCompletionBlock
{
  return self->composeCompletionBlock;
}

- (void)setComposeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSSet)currentAlertSuppressionContexts
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)finishedLaunching
{
  return self->_finishedLaunching;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (void)setMailboxProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxProvider, a3);
}

- (MFMessageRuleLibraryHook)messageRuleManager
{
  return self->_messageRuleManager;
}

- (ComposeNavigationController)handoffComposeController
{
  return self->_handoffComposeController;
}

- (MFMailPurgeableStorage)purgeableStorage
{
  return self->_purgeableStorage;
}

- (void)setBlockedSenderManager:(id)a3
{
  objc_storeStrong((id *)&self->_blockedSenderManager, a3);
}

- (MEContentRuleListManager)contentRuleListManager
{
  return self->_contentRuleListManager;
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (NSString)lastDefaultImageUpdateReason
{
  return self->_lastDefaultImageUpdateReason;
}

- (NSURL)postponedMessageURL
{
  return self->_postponedMessageURL;
}

- (void)setPostponedMessageURL:(id)a3
{
  objc_storeStrong((id *)&self->_postponedMessageURL, a3);
}

- (unint64_t)protectedDataAvailability
{
  return self->_protectedDataAvailability;
}

- (void)setProtectedDataAvailability:(unint64_t)a3
{
  self->_protectedDataAvailability = a3;
}

- (UIAlertController)lowDiskAlertController
{
  return self->_lowDiskAlertController;
}

- (void)setLowDiskAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_lowDiskAlertController, a3);
}

- (void)setFreeSpaceMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_freeSpaceMonitor, a3);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (EFCancelable)diagnosticInfoProviderToken
{
  return self->_diagnosticInfoProviderToken;
}

- (void)setDiagnosticInfoProviderToken:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticInfoProviderToken, a3);
}

- (MailUserNotificationCenterDelegate)userNotificationCenterHelper
{
  return self->_userNotificationCenterHelper;
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(id)a3
{
  objc_storeStrong((id *)&self->_currentFocus, a3);
}

- (EFCancelable)focusObservationToken
{
  return self->_focusObservationToken;
}

- (void)setFocusObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_focusObservationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusObservationToken, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_userNotificationCenterHelper, 0);
  objc_storeStrong((id *)&self->_menuCommandsCollection, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoProviderToken, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_mailboxCollection, 0);
  objc_storeStrong((id *)&self->_freeSpaceMonitor, 0);
  objc_storeStrong((id *)&self->_lowDiskAlertController, 0);
  objc_storeStrong((id *)&self->_postponedMessageURL, 0);
  objc_storeStrong((id *)&self->_lastDefaultImageUpdateReason, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_contentRuleListManager, 0);
  objc_storeStrong((id *)&self->_extendedLaunchTracker, 0);
  objc_storeStrong((id *)&self->_dockPersistence, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_purgeableStorage, 0);
  objc_storeStrong((id *)&self->_handoffComposeController, 0);
  objc_storeStrong((id *)&self->_messageRuleManager, 0);
  objc_storeStrong((id *)&self->_accountsController, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_appStoreReviewManager, 0);
  objc_storeStrong((id *)&self->currentAlertSuppressionContexts, 0);
  objc_storeStrong(&self->composeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_providerObjectID, 0);
  objc_storeStrong((id *)&self->_networkActivityIndicator, 0);
  objc_storeStrong(&self->_blockToPerformWhenProtectedDataIsAvailable, 0);
  objc_storeStrong((id *)&self->_defaultAttachmentManager, 0);
  objc_storeStrong((id *)&self->multipurpose_signal_source, 0);
  objc_storeStrong((id *)&self->diagnostic_signal_source, 0);
}

- (BOOL)isTesting
{
  return qword_1005A9C18 != 0;
}

+ (id)allTestsName
{
  return &off_100542178;
}

- (void)runAllTests
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v3 = objc_msgSend((id)objc_opt_class(self), "allTestsName");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[MailAppController runTest:options:](self, "runTest:options:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), 0, (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  BOOL v21;
  _QWORD v23[4];
  id v24;
  MailAppController *v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  id v29;
  objc_super v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;

  v7 = a3;
  v8 = a4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000B6F28;
  v35[3] = &unk_10051D6C8;
  v35[4] = self;
  v9 = v7;
  v36 = v9;
  v10 = objc_retainBlock(v35);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000B6F94;
  v33[3] = &unk_10051D6C8;
  v33[4] = self;
  v11 = v9;
  v34 = v11;
  v12 = objc_retainBlock(v33);
  objc_storeStrong((id *)&qword_1005A9C18, a3);
  objc_storeStrong((id *)&qword_1005A9C20, a4);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mf_mailboxName"));
  v14 = (void *)qword_1005A9C28;
  qword_1005A9C28 = v13;

  v15 = objc_msgSend((id)objc_opt_class(self), "allTestsName");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000B7000;
  v31[3] = &unk_10051C680;
  v17 = v11;
  v32 = v17;
  v18 = objc_msgSend(v16, "ef_any:", v31);

  if ((v18 & 1) != 0)
  {
    -[MailAppController waitForUIToSettleDown](self, "waitForUIToSettleDown");
    v19 = objc_msgSend(v8, "mf_testInterfaceOrientation");
    v20 = (void *)UIApp;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000B700C;
    v23[3] = &unk_10051D6F0;
    v29 = v19;
    v24 = v17;
    v25 = self;
    v26 = v8;
    v27 = v10;
    v28 = v12;
    objc_msgSend(v20, "rotateIfNeeded:completion:", v19, v23);

    v21 = 1;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)MailAppController;
    v21 = -[MailAppController runTest:options:](&v30, "runTest:options:", v17, v8);
  }

  return v21;
}

- (void)_finishTestDismissingReply:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B7AF4;
  v3[3] = &unk_10051AA98;
  v3[4] = self;
  -[MailAppController finishedTest:extraResults:withTeardownBlock:](self, "finishedTest:extraResults:withTeardownBlock:", a3, 0, v3);
}

- (void)failedTest:(id)a3 withFailure:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = (void *)qword_1005A9C18;
  qword_1005A9C18 = 0;
  v7 = a4;
  v8 = a3;

  v9 = (void *)qword_1005A9C20;
  qword_1005A9C20 = 0;

  v10 = (void *)qword_1005A9C28;
  qword_1005A9C28 = 0;

  v11.receiver = self;
  v11.super_class = (Class)MailAppController;
  -[MailAppController failedTest:withFailure:](&v11, "failedTest:withFailure:", v8, v7);

}

- (void)failedTest:(id)a3
{
  -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", a3, CFSTR("Not Specified"));
}

- (id)getControllerOfType:(Class)a3 fromNavigationController:(id)a4
{
  id v5;
  void *v6;
  unint64_t i;
  void *v8;
  char isKindOfClass;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
  if (v6)
  {
    for (i = 0; i < (unint64_t)objc_msgSend(v6, "count"); ++i)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", i));
      isKindOfClass = objc_opt_isKindOfClass(v8, a3);

      if ((isKindOfClass & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", i));
        goto LABEL_8;
      }
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)getControllerOfType:(Class)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController masterNavigationController](self, "masterNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getControllerOfType:fromNavigationController:](self, "getControllerOfType:fromNavigationController:", a3, v5));

  return v6;
}

- (id)getMessageListContainerViewController
{
  uint64_t v3;

  v3 = objc_opt_class(MessageListContainerViewController);
  return -[MailAppController getControllerOfType:](self, "getControllerOfType:", v3);
}

- (id)getMessageListViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListContainerViewController](self, "getMessageListContainerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListViewController"));

  return v3;
}

- (id)getMailboxListViewControllerMail
{
  uint64_t v3;

  v3 = objc_opt_class(MailboxListViewControllerMail);
  return -[MailAppController getControllerOfType:](self, "getControllerOfType:", v3);
}

- (id)getMailboxPickerController
{
  uint64_t v3;

  v3 = objc_opt_class(MailboxPickerOutlineController);
  return -[MailAppController getControllerOfType:](self, "getControllerOfType:", v3);
}

- (id)getConversationViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageDetailNavController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationViewController"));

  return v5;
}

- (id)getAccount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_defaultAccountsToSelect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  return v4;
}

- (id)getMailboxWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getAccount](self, "getAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allMailboxUidsSortedWithSpecialsAtTopForAccount:includingLocals:client:outbox:", v6, 0, 0, 0));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name", (_QWORD)v16));
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if ((v14 & 1) != 0)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)switchToInbox
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getAccount](self, "getAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allMailboxUidsSortedWithSpecialsAtTopForAccount:includingLocals:client:outbox:", v4, 0, 0, 0));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "mailboxType", (_QWORD)v12) == (id)7)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMailboxListViewControllerMail](self, "getMailboxListViewControllerMail"));
          objc_msgSend(v11, "setSelectedMailbox:", v10);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)switchToDesiredMailbox
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  if (qword_1005A9C28)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MailAppController getMailboxWithName:](self, "getMailboxWithName:"));
    if (v5)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMailboxListViewControllerMail](self, "getMailboxListViewControllerMail"));
      objc_msgSend(v3, "setSelectedMailbox:", v5);

    }
  }
  else
  {
    -[MailAppController switchToInbox](self, "switchToInbox");
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
  objc_msgSend(v6, "runUntilDate:", v4);

  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    if (objc_msgSend((id)qword_1005A9C18, "rangeOfString:", CFSTR("DismissCompose")) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
      objc_msgSend(v7, "selectMessageAtIndex:", 0);

    }
  }
}

- (void)waitForUIToSettleDown
{
  void *v3;
  void *v4;
  id v5;

  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));

    if (!v3)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
      objc_msgSend(v5, "runUntilDate:", v4);

    }
  }
}

- (id)_prepareForScrollMessagesTest:(id)a3 inEditMode:(BOOL)a4 currentDelay:(double *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v10 = v9;
  if (v9)
  {
    if (a5)
      v11 = *a5;
    else
      v11 = 0.0;
    objc_msgSend(v9, "setEditing:animated:", 0, 0);
    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    {
      v11 = v11 + 2.0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000B8700;
      v20[3] = &unk_10051AA98;
      v21 = v10;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v20, v11);

    }
    v13 = v11 + 2.0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B870C;
    v19[3] = &unk_10051AA98;
    v19[4] = self;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v19, v13);
    if ((unint64_t)(qword_1005A9C48 - 1) <= 1)
    {
      v13 = v13 + 2.0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000B8718;
      v18[3] = &unk_10051AA98;
      v18[4] = self;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v18, v13);
    }
    if (v6)
    {
      v13 = v13 + 2.0;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000B8724;
      v16[3] = &unk_10051AA98;
      v17 = v10;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v16, v13);

    }
    if (a5)
      *a5 = v13;
    v14 = v10;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("testName")));
    -[MailAppController failedTest:](self, "failedTest:", v12);

  }
  return v10;
}

- (void)_showMessageListView:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "splitViewController"));
  objc_msgSend(v4, "showMessageListViewController:animated:completion:", 1, v3, 0);

}

- (void)_performScrollTestOnMessageListOnCollectionView:(id)a3 withOptions:(id)a4 isNatural:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  int v26;
  uint8_t v27[16];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(+[MailAppController log](MailAppController, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting to perform scroll test", v27, 2u);
  }

  if (v8)
  {
    if (v5)
    {
LABEL_5:
      v11 = objc_alloc((Class)RPTScrollViewTestParameters);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mf_testName"));
      v13 = objc_msgSend(v11, "initWithTestName:scrollView:completionHandler:", v12, v8, 0);

      objc_msgSend(v13, "setAmplitude:", RPTAmplitudeFromPagesOfView(v8, 2, (int)objc_msgSend(v9, "mf_pages")) * 0.8);
      objc_msgSend(v13, "setDirection:", 3);
      objc_msgSend(v13, "setIterationDurationFactor:", 0.9);
      v14 = RPTGetBoundsForView(v8);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      objc_msgSend(v8, "adjustedContentInset");
      v22 = v21;
      objc_msgSend(v8, "adjustedContentInset");
      objc_msgSend(v13, "setScrollingBounds:", v14 + 0.0, v16 + v22, v18, v20 - (v22 + v23 + 5.0));
      +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v13);
      goto LABEL_11;
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collectionView"));

    if (v5)
      goto LABEL_5;
  }
  v25 = objc_msgSend(v8, "desiredScrollLength:", v9);
  if (v25 >= 0)
    v26 = v25;
  else
    v26 = v25 + 15;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mf_testName"));
  objc_msgSend(v8, "_performScrollTest:iterations:delta:length:", v13, objc_msgSend(v9, "mf_iterations"), objc_msgSend(v9, "mf_scrollOffset"), (v26 >> 4));
LABEL_11:

}

- (id)_prepareForScrollMailboxesTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "setEditing:animated:", 0, 0);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000B8C94;
      v18[3] = &unk_10051AA98;
      v19 = v6;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v18, 2.0);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000B8CA0;
      v17[3] = &unk_10051AA98;
      v17[4] = self;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v17, 4.0);
      if ((unint64_t)(qword_1005A9C48 - 1) <= 1)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000B8CAC;
        v16[3] = &unk_10051AA98;
        v16[4] = self;
        +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v16, 6.0);
      }

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMailboxPickerController](self, "getMailboxPickerController"));
    v8 = v7;
    if (v7)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000B8CB8;
      v14[3] = &unk_10051A910;
      v14[4] = self;
      v9 = v7;
      v15 = v9;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v14, 8.0);
      v10 = v9;

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
      -[MailAppController failedTest:](self, "failedTest:", v12);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
    -[MailAppController failedTest:](self, "failedTest:", v11);

    v8 = 0;
  }

  return v8;
}

- (void)startScrollMessagesInEditModeWithSelectionTest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("testName")));
    -[MailAppController failedTest:](self, "failedTest:", v5);

  }
}

- (void)startScrollMessagesInEditModeTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v4, 1, 0));

  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B8EC0;
    v7[3] = &unk_10051A910;
    v7[4] = self;
    v8 = v4;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v7, 12.0);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
    -[MailAppController failedTest:](self, "failedTest:", v6);

  }
}

- (void)reallyStartScrollMessageViewListTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("testName")));
  -[MailAppController startedTest:](self, "startedTest:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
  v7 = objc_msgSend(v6, "desiredScrollLength:", v14);
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = v7 + 15;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("testName")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("iterations")));
  v12 = objc_msgSend(v11, "intValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("offset")));
  objc_msgSend(v9, "_performScrollTest:iterations:delta:length:", v10, v12, objc_msgSend(v13, "intValue"), (v8 >> 4));

}

- (void)startScrollMessageListTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  double v11;
  void **v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  double v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("ScrollMessageList")) == (id)0x7FFFFFFFFFFFFFFFLL)
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMailboxesTest:](self, "_prepareForScrollMailboxesTest:", v7));
    else
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v7, 0, 0));
    v9 = v8;
    if (!v8)
    {
      -[MailAppController failedTest:](self, "failedTest:", v6);
      goto LABEL_12;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B9330;
    v20[3] = &unk_10051C1F0;
    v20[4] = self;
    v21 = v8;
    v22 = v7;
    v23 = v6;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v20, 12.0);

    v13 = v21;
  }
  else
  {
    v19 = 0.0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v7, 0, &v19));
    v19 = v19 + 2.0;
    v10 = objc_msgSend(v6, "hasSuffix:", CFSTR("Natural"));
    v11 = v19;
    if (v10)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000B93A8;
      v16[3] = &unk_10051A960;
      v16[4] = self;
      v17 = v9;
      v18 = v7;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v16, v11);
      v12 = &v17;

    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000B9408;
      v14[3] = &unk_10051A910;
      v14[4] = self;
      v15 = v7;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v14, v11);
      v12 = &v15;
    }
    v13 = *v12;
  }

LABEL_12:
}

- (void)startScrollMessageListSearchTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  id v10;
  id v11;
  double v12;
  id v13;
  id v14;
  double v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  MailAppController *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  double v29[2];

  v4 = a3;
  v29[0] = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v4, 0, v29));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationViewController"));
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    if ((unint64_t)(qword_1005A9C48 - 1) <= 1)
    {
      v29[0] = v29[0] + 1.0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000B972C;
      v28[3] = &unk_10051AA98;
      v28[4] = self;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v28);
    }
  }
  else if (!v5 || objc_msgSend(v6, "isFullyVisible"))
  {
    v29[0] = v29[0] + 1.0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationController"));
    v8 = objc_msgSend(v7, "popToViewController:animated:", v5, 1);

    -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", v29[0]);
  }
  v29[0] = v29[0] + 1.0;
  v9 = v29[0];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000B9738;
  v25[3] = &unk_10051A910;
  v10 = v5;
  v26 = v10;
  v11 = v4;
  v27 = v11;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v25, v9);
  v29[0] = v29[0] + 1.0;
  v12 = v29[0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B97E4;
  v21[3] = &unk_10051A960;
  v13 = v10;
  v22 = v13;
  v23 = self;
  v14 = v11;
  v24 = v14;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v21, v12);
  v29[0] = v29[0] + 1.0;
  v15 = v29[0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000B9AE0;
  v18[3] = &unk_10051A960;
  v18[4] = self;
  v16 = v14;
  v19 = v16;
  v17 = v13;
  v20 = v17;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v18, v15);

}

- (void)startSearchWhileTypingTestWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  MailAppController *v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  float v14;
  float v15;
  id v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  MailAppController *v31;
  id obj;
  uint64_t v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  void *v40;
  id v41;
  unint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _QWORD v50[5];
  double v51;
  _BYTE v52[128];

  v51 = 0.5;
  v30 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("testName")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v30, 0, &v51));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "conversationViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "searchResultsUpdater"));
  v31 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("searchStrings")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" ")));

  v6 = v29;
  v7 = v31;
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad")
    && (unint64_t)(qword_1005A9C48 - 1) <= 1)
  {
    v51 = v51 + 0.5;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000BA140;
    v50[3] = &unk_10051AA98;
    v50[4] = v31;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v50);
  }
  else if (!v29 || objc_msgSend(v28, "isFullyVisible"))
  {
    v51 = v51 + 0.5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "navigationController"));
    v9 = objc_msgSend(v8, "popToViewController:animated:", v29, 1);

    v7 = v31;
    v6 = v29;
    -[MailAppController _waitForTimeInterval:](v31, "_waitForTimeInterval:", v51);
  }
  v51 = v51 + 0.5;
  v10 = v51;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000BA14C;
  v47[3] = &unk_10051A960;
  v47[4] = v7;
  v11 = v26;
  v48 = v11;
  v12 = v6;
  v49 = v12;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v47, v10);
  v51 = v51 + 1.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("timeBetweenLetters")));
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  v43 = 0u;
  obj = v27;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v16)
  {
    v17 = v15;
    v33 = *(_QWORD *)v44;
    do
    {
      v18 = 0;
      v34 = v16;
      do
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(obj);
        v19 = 0;
        v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v18);
        while (v19 < (unint64_t)objc_msgSend(v20, "length") + 1)
        {
          v21 = v51;
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_1000BA17C;
          v38[3] = &unk_10051AB60;
          v39 = v12;
          v40 = v20;
          v42 = v19;
          v41 = v4;
          +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v38, v21);
          v51 = v51 + v17;

          ++v19;
        }
        v18 = (char *)v18 + 1;
      }
      while (v18 != v34);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v16);
  }

  v22 = v51;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000BA26C;
  v35[3] = &unk_10051A960;
  v35[4] = v31;
  v23 = v11;
  v36 = v23;
  v24 = v12;
  v37 = v24;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v35, v22);

}

- (void)_reallyStartShowComposeTest:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  MailAppController *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
  objc_msgSend(v5, "setShowKeyboardImmediately:", 1);
  v6 = MFMailComposeViewDidShow;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000BA4D8;
  v18[3] = &unk_10051D718;
  v18[4] = self;
  v7 = v4;
  v19 = v7;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v6, 1, v18);
  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) == 0)
  {
    v8 = MFMailComposeViewDidAnimate;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BA4EC;
    v16[3] = &unk_10051D718;
    v16[4] = self;
    v17 = v7;
    -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v8, 1, v16);

  }
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000BA504;
  v13 = &unk_10051D718;
  v14 = self;
  v9 = v7;
  v15 = v9;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", UIKeyboardDidShowNotification, 1, &v10);
  -[MailAppController startedTest:](self, "startedTest:", v9, v10, v11, v12, v13, v14);
  -[MailAppController startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("ComposeViewAnimationStart"), v9);
  -[MailAppController showComposeWithContext:animated:initialTitle:completionBlock:](self, "showComposeWithContext:animated:initialTitle:completionBlock:", v5, 1, 0, 0);

}

- (void)_finishTestIfComposeAndKeyboardDidShow:(id)a3
{
  id v4;

  v4 = a3;
  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0
    || byte_1005A9C50 == 1 && byte_1005A9C51 == 1)
  {
    -[MailAppController _finishTestDismissingReply:](self, "_finishTestDismissingReply:", v4);
    byte_1005A9C50 = 0;
    byte_1005A9C51 = 0;
  }

}

- (void)_reallyStartShowEmptyComposeTest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  MailAppController *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = MFMailComposeViewDidShow;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BA714;
  v15[3] = &unk_10051D718;
  v15[4] = self;
  v6 = v4;
  v16 = v6;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v5, 1, v15);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_1000BA728;
  v12 = &unk_10051D718;
  v13 = self;
  v7 = v6;
  v14 = v7;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", UIKeyboardDidShowNotification, 1, &v9);
  -[MailAppController startedTest:](self, "startedTest:", v7, v9, v10, v11, v12, v13);
  -[MailAppController startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("ComposeViewAnimationStart"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  objc_msgSend(v8, "composeButtonPressed:", 0);

}

- (void)_reallyStartShowEmptyComposeAnimationTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  MailAppController *v11;
  id v12;
  _QWORD v13[4];
  MailAppController *v14;
  id v15;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BA86C;
  v13[3] = &unk_10051A910;
  v14 = self;
  v4 = a3;
  v15 = v4;
  -[MailAppController installCACommitCompletionBlock:](v14, "installCACommitCompletionBlock:", v13);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000BA878;
  v10 = &unk_10051D718;
  v11 = self;
  v5 = v4;
  v12 = v5;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", UIKeyboardDidShowNotification, 1, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene", v7, v8, v9, v10, v11));
  objc_msgSend(v6, "composeButtonPressed:", 0);

}

- (void)_prepareForShowComposeTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BA970;
  v8[3] = &unk_10051AA98;
  v8[4] = self;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v8, 2.0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BA97C;
  v6[3] = &unk_10051A910;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v6, 4.0);

}

- (void)searchPseudoContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController dockContainer](self, "dockContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mailComposeController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailComposeView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toField"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textView"));
    objc_msgSend(v9, "setText:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textView"));
    objc_msgSend(v8, "textViewDidChange:", v10);

  }
}

- (void)scrollPseudoContactList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController dockContainer](self, "dockContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeViewController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mailComposeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailComposeView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchTableView"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("offset")));
  v10 = objc_msgSend(v9, "intValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("iterations")));
  v12 = objc_msgSend(v11, "intValue");

  v13 = objc_msgSend(v8, "desiredScrollLength:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("testName")));
  objc_msgSend(v8, "_performScrollTest:iterations:delta:length:", v14, v12, v10, v13);

}

- (void)_reallyStartComposeToPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  MailAppController *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
  objc_msgSend(v8, "setShowKeyboardImmediately:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("PseudoContact")));
  v10 = MFMailComposeViewDidShow;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000BAE24;
  v20[3] = &unk_10051D718;
  v20[4] = self;
  v11 = v9;
  v21 = v11;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v10, 1, v20);
  v12 = MFMailComposeViewDidSortSearchResults;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000BAE30;
  v17 = &unk_10051D718;
  v18 = self;
  v13 = v6;
  v19 = v13;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v12, 1, &v14);
  -[MailAppController showComposeWithContext:animated:initialTitle:completionBlock:](self, "showComposeWithContext:animated:initialTitle:completionBlock:", v8, 1, 0, 0, v14, v15, v16, v17, v18);
  -[MailAppController startedTest:](self, "startedTest:", v13);

}

- (void)_reallyStartScrollPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  MailAppController *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
  objc_msgSend(v8, "setShowKeyboardImmediately:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("PseudoContact")));
  v10 = MFMailComposeViewDidShow;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000BB004;
  v20[3] = &unk_10051D718;
  v20[4] = self;
  v11 = v9;
  v21 = v11;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v10, 1, v20);
  v12 = MFMailComposeViewDidSortSearchResults;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000BB010;
  v17 = &unk_10051D718;
  v18 = self;
  v13 = v7;
  v19 = v13;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v12, 1, &v14);
  -[MailAppController showComposeWithContext:animated:initialTitle:completionBlock:](self, "showComposeWithContext:animated:initialTitle:completionBlock:", v8, 1, 0, 0, v14, v15, v16, v17, v18);
  -[MailAppController startedTest:](self, "startedTest:", v6);

}

- (void)_prepareForComposePseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BB140;
  v13[3] = &unk_10051AA98;
  v13[4] = self;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v13, 2.0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BB14C;
  v10[3] = &unk_10051A960;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v10, 4.0);

}

- (void)_prepareForScrollPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BB280;
  v13[3] = &unk_10051AA98;
  v13[4] = self;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v13, 2.0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BB28C;
  v10[3] = &unk_10051A960;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v10, 4.0);

}

- (void)tearDownPhotoPickerTest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController dockContainer](self, "dockContainer"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeViewController"));

  v4 = v6;
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mailComposeController"));
    -[MailAppController _dismissComposeViewController:animated:](self, "_dismissComposeViewController:animated:", v5, 0);

    v4 = v6;
  }

}

- (void)_startPhotoPickerTest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  MailAppController *v15;

  v4 = a3;
  v5 = MFMailComposeViewDidShow;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000BB454;
  v13 = &unk_10051D718;
  v6 = v4;
  v14 = v6;
  v15 = self;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v5, 1, &v10);
  v7 = objc_alloc((Class)_MFMailCompositionContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("mailto:foo@bar.com"), v10, v11, v12, v13));
  v9 = objc_msgSend(v7, "initWithURL:", v8);

  -[MailAppController showComposeWithContext:animated:initialTitle:completionBlock:](self, "showComposeWithContext:animated:initialTitle:completionBlock:", v9, 1, 0, 0);
}

- (void)_showPhotoPickerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController dockContainer](self, "dockContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mailComposeController"));
    objc_msgSend(v6, "insertPhotoOrVideo");
    -[MailAppController installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v7);

  }
}

- (void)_dismissPhotoPickerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController dockContainer](self, "dockContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mailComposeController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
    objc_msgSend(v6, "imagePickerControllerDidCancel:", v7);
    if (v8)
      v8[2]();

  }
}

- (void)startPhotoPickerTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  -[MailAppController _prepareForComposeView:](self, "_prepareForComposeView:", v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BB888;
  v7[3] = &unk_10051A910;
  v7[4] = self;
  v6 = v5;
  v8 = v6;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v7, 4.0);

}

- (void)startShowComposeTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  v6 = -[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v4, 0, 0);
  -[MailAppController _prepareForComposeView:](self, "_prepareForComposeView:", v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BB994;
  v8[3] = &unk_10051A910;
  v8[4] = self;
  v7 = v5;
  v9 = v7;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v8, 4.0);

}

- (void)startShowEmptyComposeTest:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  -[MailAppController _prepareForComposeView:](self, "_prepareForComposeView:", v5);
  if (objc_msgSend(v5, "mf_containsSubstring:", CFSTR("Animation")))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000BBAF0;
    v8[3] = &unk_10051A910;
    v6 = v8;
    v8[4] = self;
    v8[5] = v5;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v8, 4.0);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000BBAFC;
    v7[3] = &unk_10051A910;
    v6 = v7;
    v7[4] = self;
    v7[5] = v5;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v7, 4.0);
  }

}

- (void)startComposeToPseudoContactTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  -[MailAppController _prepareForComposeView:](self, "_prepareForComposeView:", v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BBC10;
  v8[3] = &unk_10051A960;
  v8[4] = self;
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v8, 4.0);

}

- (void)startScrollPseudoContactTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  -[MailAppController _prepareForComposeView:](self, "_prepareForComposeView:", v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BBD28;
  v8[3] = &unk_10051A960;
  v8[4] = self;
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v8, 4.0);

}

- (void)_prepareForComposeView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setEditing:animated:", 0, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000BBE0C;
    v7[3] = &unk_10051AA98;
    v7[4] = self;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v7, 2.0);
  }
  else
  {
    -[MailAppController failedTest:](self, "failedTest:", v4);
  }

}

- (void)_reallyStartDismissComposeTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController dockContainer](self, "dockContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeViewController"));

  if (v6)
  {
    v7 = objc_opt_class(ComposeNavigationController);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mailComposeController"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000BC04C;
      v17[3] = &unk_10051D718;
      v17[4] = self;
      v9 = v4;
      v18 = v9;
      -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", UIKeyboardDidHideNotification, 1, v17);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000BC05C;
      v14[3] = &unk_10051A960;
      v14[4] = self;
      v15 = v9;
      v10 = v8;
      v16 = v10;
      -[MailAppController installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v14);

    }
    else
    {
      v11 = (objc_class *)objc_opt_class(v6);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("activeViewController is not a ComposeNavigationController. It is a %@"), v13));

      -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", v4, v10);
    }

  }
  else
  {
    -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", v4, CFSTR("Unable to get the active ViewController"));
  }

}

- (void)_prepareForDismissComposeTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (!-[MailAppController isComposeWindowActive](self, "isComposeWindowActive"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
    v6 = v5;
    if (!v5)
    {
      -[MailAppController failedTest:](self, "failedTest:", v4);
      goto LABEL_5;
    }
    objc_msgSend(v5, "setEditing:animated:", 0, 0);
    v7 = objc_alloc((Class)_MFMailCompositionContext);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("mailto:")));
    v9 = objc_msgSend(v7, "initWithURL:", v8);

    objc_msgSend(v9, "setShowKeyboardImmediately:", 1);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000BC26C;
    v13[3] = &unk_10051A910;
    v13[4] = self;
    v10 = v9;
    v14 = v10;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v13, 2.0);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BC284;
  v11[3] = &unk_10051A910;
  v11[4] = self;
  v12 = v4;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v11, 4.0);

LABEL_5:
}

- (void)startDismissComposeTest:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BC32C;
  v4[3] = &unk_10051A910;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v4, 3.0);

}

- (void)startRotationTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setEditing:animated:", 0, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BC4E4;
    v10[3] = &unk_10051AA98;
    v10[4] = self;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v10, 2.0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000BC4F0;
    v8[3] = &unk_10051A910;
    v8[4] = self;
    v9 = v5;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v8, 4.0);

  }
  else
  {
    -[MailAppController failedTest:](self, "failedTest:", v5);
  }

}

- (void)_reallyStartRotationTest:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BC574;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BC628;
  v3[3] = &unk_10051AA98;
  -[MailAppController runTestForKeyboardRotationWithName:fromOrientation:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "runTestForKeyboardRotationWithName:fromOrientation:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:", a3, qword_1005A9C48, v4, 0, v3);
}

- (void)_reallyStartExitEditModeTest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_didFinishExitEditModeTest:", CFSTR("DidFinishExitEditModeTest"), 0);

    -[MailAppController startedTest:](self, "startedTest:", v6);
    objc_msgSend(v4, "setEditing:animated:", 0, 1);
  }
  else
  {
    -[MailAppController failedTest:](self, "failedTest:", v6);
  }

}

- (void)startExitEditModeTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v4, 1, 0));

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000BC818;
    v7[3] = &unk_10051A910;
    v7[4] = self;
    v8 = v5;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v7, 12.0);

  }
  else
  {
    -[MailAppController failedTest:](self, "failedTest:", v5);
  }

}

- (void)_didFinishExitEditModeTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BC884;
  v3[3] = &unk_10051AA98;
  v3[4] = self;
  -[MailAppController finishedTest:extraResults:withTeardownBlock:](self, "finishedTest:extraResults:withTeardownBlock:", qword_1005A9C18, 0, v3);
}

- (void)_reallyStartMessageTransferTest:(id)a3 mailboxController:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getAccount](self, "getAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxUidOfType:createIfNeeded:", 3, 0));

  if (v6)
    -[MailAppController runTest:forAnimation:](self, "runTest:forAnimation:", v7, CFSTR("MessageToPointAnimation"));
  else
    -[MailAppController failedTest:](self, "failedTest:", v7);

}

- (void)startMessageTransferTest:(id)a3 multiSelect:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v6, 1, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("testName")));
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getAccount](self, "getAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxUidOfType:createIfNeeded:", 3, 1));

    if (v10)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000BCC44;
      v20[3] = &unk_10051AA98;
      v11 = v7;
      v21 = v11;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v20, 12.0);
      if (v4)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000BCC50;
        v18[3] = &unk_10051AA98;
        v12 = v11;
        v19 = v12;
        +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v18, 13.0);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000BCC5C;
        v16[3] = &unk_10051AA98;
        v17 = v12;
        +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v16, 14.0);

      }
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000BCC68;
      v13[3] = &unk_10051A960;
      v13[4] = self;
      v14 = v8;
      v15 = v11;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v13, 18.0);

    }
    else
    {
      -[MailAppController failedTest:](self, "failedTest:", v8);
    }

  }
  else
  {
    -[MailAppController failedTest:](self, "failedTest:", v8);
  }

}

- (void)_reallyStartMessageDeleteTest:(id)a3
{
  -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", a3, CFSTR("Could not get the conversationViewController"));
}

- (void)startMessageDeleteTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "setEditing:animated:", 0, 0);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000BCE28;
      v10[3] = &unk_10051AA98;
      v11 = v7;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v10, 2.0);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000BCE34;
      v8[3] = &unk_10051A910;
      v8[4] = self;
      v9 = v5;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v8, 4.0);

    }
    else
    {
      -[MailAppController failedTest:](self, "failedTest:", v5);
    }

  }
  else
  {
    -[MailAppController failedTest:](self, "failedTest:", v5);
  }

}

- (void)_messageContentLayerFinished
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  char *v13;
  int v14;
  char v15;
  double Current;
  void *v17;
  id v18;
  uint64_t v19;
  double v20;
  void *i;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  if (objc_msgSend((id)qword_1005A9C18, "isEqualToString:", CFSTR("MessageIteration")))
  {
    -[MailAppController finishedSubTest:forTest:](self, "finishedSubTest:forTest:", CFSTR("MessageLoad"), qword_1005A9C18);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
    v4 = v3;
    if (!v3)
    {
LABEL_32:

      return;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationViewController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceMessageListItem"));

    if (dword_1005A9C58 < 1)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1005A9C30, "allValues"));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v33;
        v20 = 0.0;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "doubleValue");
            v20 = v20 + v22;
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v18);
      }
      else
      {
        v20 = 0.0;
      }

      v23 = (void *)qword_1005A9C30;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - *(double *)&qword_1005A9C60));
      objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("time"));

      v25 = (void *)qword_1005A9C30;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20 / (Current - *(double *)&qword_1005A9C60) * 100.0));
      objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("MMMessageDisplayPercentage"));

      objc_msgSend((id)qword_1005A9C30, "setObject:forKey:", CFSTR("percent"), CFSTR("MMMessageDisplayPercentageUnits"));
      -[MailAppController finishedTest:extraResults:](self, "finishedTest:extraResults:", CFSTR("MessageIteration"), qword_1005A9C30);
      v27 = (void *)qword_1005A9C18;
      qword_1005A9C18 = 0;

      v28 = (void *)qword_1005A9C30;
      qword_1005A9C30 = 0;

      goto LABEL_31;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewDataSource"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "itemID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForItemIdentifier:", v9));

    v11 = (uint64_t)objc_msgSend(v10, "row");
    v12 = objc_msgSend(v10, "section");
    v13 = (char *)objc_msgSend(v8, "numberOfItems");
    v14 = byte_1005A9C54;
    if (v13 - 1 == (char *)v11)
      v15 = byte_1005A9C54;
    else
      v15 = 1;
    if ((v15 & 1) != 0)
    {
      if (v11)
        v14 = 0;
      if (v14 != 1)
        goto LABEL_27;
      if (v12)
      {
        v11 = (uint64_t)objc_msgSend(v8, "numberOfSections");
LABEL_27:
        v29 = byte_1005A9C54;
        -[MailAppController startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("MessageLoad"), qword_1005A9C18);
        if (v29)
          v30 = v11 - 1;
        else
          v30 = v11 + 1;
        --dword_1005A9C58;
        objc_msgSend(v4, "selectMessageAtIndex:", v30);

LABEL_31:
        goto LABEL_32;
      }
      v11 = 0;
    }
    else if (v12 != objc_msgSend(v8, "numberOfSections"))
    {
      v11 = -1;
      goto LABEL_27;
    }
    byte_1005A9C54 = v15 ^ 1;
    goto LABEL_27;
  }
}

- (void)startMessageIterationTest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("iterations")));
  dword_1005A9C58 = objc_msgSend(v4, "intValue");

  qword_1005A9C60 = CFAbsoluteTimeGetCurrent();
  -[MailAppController startedTest:](self, "startedTest:", qword_1005A9C18);
  -[MailAppController startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("MessageLoad"), qword_1005A9C18);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v6, 0, 0));
  objc_msgSend(v5, "selectMessageAtIndex:", 0);

}

- (void)startMailboxFilterEnableTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MailAppController *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v4, 0, 0));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BD42C;
  v8[3] = &unk_10051A960;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v7, "_doOnInitialLoadCompletion:", v8);

}

- (void)startMailboxFilterDisableTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MailAppController *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:", v4, 0, 0));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BD6A4;
  v8[3] = &unk_10051A960;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v7, "_doOnInitialLoadCompletion:", v8);

}

- (void)startMailboxFilterPickerEnableTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BD978;
  v8[3] = &unk_10051D740;
  v8[4] = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  v9 = v6;
  v7 = v5;
  v10 = v7;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("MFMailboxFilterPickerViewControllerDidShow"), 1, v8);
  -[MailAppController startedTest:](self, "startedTest:", v6);

}

- (void)startMailboxFilterPickerDisableTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MailAppController *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BDBB8;
  v9[3] = &unk_10051D740;
  v7 = v5;
  v10 = v7;
  v11 = self;
  v8 = v6;
  v12 = v8;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("MFMailboxFilterPickerViewControllerDidShow"), 1, v9);
  -[MailAppController startedTest:](self, "startedTest:", v8);

}

- (void)startShowDismissReplyTest:(id)a3
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
  double v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setEditing:animated:", 0, 0);
    -[MailAppController dismissAnyModalViewControllerOrPopoverAnimated:](self, "dismissAnyModalViewControllerOrPopoverAnimated:", 0);
    -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v9));
      objc_msgSend(v7, "selectItemID:userInitiated:animated:", v10, 1, 0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "referenceMessageListItemForFirstConversationWithSingleMessage:markAsRead:", 0, 0));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemID"));
      objc_msgSend(v7, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:", v13, 0, 1, 1, 0);

      v14 = 7.0;
      if (objc_msgSend(v5, "rangeOfString:", CFSTR("WarmedUp")) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000BDFE4;
        v19[3] = &unk_10051A910;
        v19[4] = self;
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("IgnoreMe")));
        v15 = v20;
        +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v19, 7.0);

        v14 = 14.0;
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000BDFF0;
      v17[3] = &unk_10051A910;
      v17[4] = self;
      v18 = v5;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v17, v14);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSource"));
      -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v5, objc_msgSend(v16, "numberOfItems"));

    }
  }
  else
  {
    -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", v5, CFSTR("Could not get MessageListViewController/MailboxContentViewController"));
  }

}

- (void)_reallyStartShowReplyTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  MailAppController *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getConversationViewController](self, "getConversationViewController"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetMessageForBarButtonTriage"));
    if (v7)
    {
      v8 = objc_msgSend(v4, "rangeOfString:", CFSTR("NoKeyboard"));
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v10 = v9;
      v11 = 4 * (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
      v12 = MFMailComposeViewDidShow;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000BE220;
      v21[3] = &unk_10051D768;
      v21[4] = self;
      v13 = v4;
      v22 = v13;
      v23 = v10;
      v24 = v11;
      -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v12, 1, v21);
      v15 = _NSConcreteStackBlock;
      v16 = 3221225472;
      v17 = sub_1000BE328;
      v18 = &unk_10051D718;
      v19 = self;
      v14 = v13;
      v20 = v14;
      -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", UIKeyboardDidShowNotification, 1, &v15);
      -[MailAppController startedTest:](self, "startedTest:", v14, v15, v16, v17, v18, v19);
      -[MailAppController startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("ComposeViewAnimationStart"), v14);
      objc_msgSend(v6, "_testReplyForSelectedMessage");

    }
    else
    {
      -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", v4, CFSTR("Could not get message from the conversation view controller"));
    }

  }
  else
  {
    -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", v4, CFSTR("Could not get the conversationViewController"));
  }

}

- (void)dismissReply
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BE38C;
  block[3] = &unk_10051AA98;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performNextShowDismissComposeTransitionForTest:(id)a3
{
  int v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (-[MailAppController isComposeWindowActive](self, "isComposeWindowActive"))
  {
    -[MailAppController dismissAnyModalViewControllerOrPopoverAnimated:](self, "dismissAnyModalViewControllerOrPopoverAnimated:", 1);
    v5 = --dword_1005A9C58;
  }
  else
  {
    v6 = objc_alloc((Class)_MFMailCompositionContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("mailto:foo@bar.com")));
    v8 = objc_msgSend(v6, "initWithURL:", v7);

    -[MailAppController showComposeWithContext:animated:initialTitle:completionBlock:](self, "showComposeWithContext:animated:initialTitle:completionBlock:", v8, 1, 0, 0);
    v5 = dword_1005A9C58;
  }
  if (v5 < 1)
    -[MailAppController finishedTest:extraResults:](self, "finishedTest:extraResults:", v9, 0);
  else
    -[MailAppController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, v9, 1.0);

}

- (void)startShowDismissComposeTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("iterations")));
  dword_1005A9C58 = objc_msgSend(v5, "intValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testName")));
  -[MailAppController startedTest:](self, "startedTest:", v6);
  -[MailAppController dismissAnyModalViewControllerOrPopoverAnimated:](self, "dismissAnyModalViewControllerOrPopoverAnimated:", 0);
  v7 = dispatch_time(0, 2000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BE840;
  v9[3] = &unk_10051A910;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)reportPPTTimings:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  if (!qword_1005A9C30)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)qword_1005A9C30;
    qword_1005A9C30 = (uint64_t)v4;

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v10));
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1005A9C30, "objectForKey:", v10));
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "doubleValue");
          v13 = v13 + v16;
        }
        v17 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", v13);
        objc_msgSend((id)qword_1005A9C30, "setObject:forKey:", v17, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)startConversationSelectionTestWithOptions:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  _QWORD *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  MailAppController *v38;
  id v39;
  id v40;
  unsigned __int8 v41;
  char v42;
  _QWORD v43[4];
  id v44;
  MailAppController *v45;
  _QWORD *v46;
  _QWORD v47[3];
  char v48;

  v4 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  v5 = objc_msgSend(v26, "containsString:", CFSTR("SelectSingleMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationViewController", v6));
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000BEFFC;
  v43[3] = &unk_10051D790;
  v46 = v47;
  v7 = v26;
  v44 = v7;
  v45 = self;
  v8 = objc_retainBlock(v43);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000BF1B4;
  v36[3] = &unk_10051D7B8;
  v9 = v6;
  v41 = v5;
  v42 = v5 ^ 1;
  v37 = v9;
  v38 = self;
  v27 = v8;
  v40 = v27;
  v10 = v7;
  v39 = v10;
  v11 = objc_retainBlock(v36);
  -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemIdentifierForIndexPath:", v13));
    objc_msgSend(v9, "selectItemID:userInitiated:animated:", v14, 1, 0);

    if ((unint64_t)(qword_1005A9C48 - 1) <= 1)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000BF2D4;
      v35[3] = &unk_10051AA98;
      v35[4] = self;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v35, 1.0);
    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000BF2E0;
    v33[3] = &unk_10051AA98;
    v34 = v9;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v33, 2.0);
    -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 3.0);
    v15 = &v34;
  }
  else
  {
    if (v9 && !objc_msgSend(v28, "isFullyVisible"))
      goto LABEL_11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
    v17 = objc_msgSend(v16, "popToViewController:animated:", v9, 1);

    -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemIdentifierForIndexPath:", v19));
    objc_msgSend(v9, "selectItemID:userInitiated:animated:", v20, 1, 0);

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000BF2EC;
    v31[3] = &unk_10051AA98;
    v21 = v9;
    v32 = v21;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v31, 1.0);
    -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 2.0);
    v15 = &v32;
    if (!v9 || objc_msgSend(v28, "isFullyVisible"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationController"));
      v23 = objc_msgSend(v22, "popToViewController:animated:", v21, 1);

      -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
    }
  }

LABEL_11:
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad")
    && objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)1
    || (+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) == 0
    && (objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)3
     || objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)4))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "splitViewController"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000BF2F8;
    v29[3] = &unk_10051D7E0;
    v29[4] = self;
    v30 = v11;
    objc_msgSend(v25, "showMessageListViewController:animated:completion:", 1, 1, v29);

  }
  else
  {
    ((void (*)(_QWORD *))v11[2])(v11);
  }

  _Block_object_dispose(v47, 8);
}

- (void)startConversationScrollTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  unsigned __int8 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[6];

  v4 = a3;
  -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad")
    && objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "splitViewController"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000BF758;
    v30[3] = &unk_10051A848;
    v30[4] = self;
    objc_msgSend(v6, "showMessageListViewController:animated:completion:", 1, 1, v30);

    -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  v7 = objc_msgSend(v4, "mf_isAMSTest");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "referenceMessageListItemForFirstConversationWithSingleMessage:markAsRead:", 0, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationViewController"));
  objc_msgSend(v10, "setDisableScrollPinning:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionView"));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000BF7CC;
  v26[3] = &unk_10051A960;
  v13 = v21;
  v27 = v13;
  v14 = v4;
  v28 = v14;
  v15 = v12;
  v29 = v15;
  v16 = objc_retainBlock(v26);
  if (v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemID"));
    objc_msgSend(v8, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:", v17, 0, 0, 1, 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000BF8F4;
    v22[3] = &unk_10051D808;
    v25 = v7;
    v23 = v15;
    v24 = v16;
    v19 = objc_msgSend(v18, "afterDelay:performBlock:", v22, 1.0);

    v20 = v23;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));
    -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v13, objc_msgSend(v20, "numberOfItems"));
  }

}

- (BOOL)_allMessageViewControllersDidDisplayContent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 2 || (uint64_t)objc_msgSend(0, "countOfMessages") < 2)
  {
    v6 = 0;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "childViewControllers", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    v6 = v5 != 0;
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(v3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)))
          {
            v6 = 0;
            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
      v6 = 1;
    }
LABEL_14:

  }
  return v6;
}

- (void)startConversationLoadAllMessagesTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  MailAppController *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
  -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "referenceMessageListItemForFirstConversationWithSingleMessage:markAsRead:", 0, 0));
  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BFDB4;
    v16[3] = &unk_10051D718;
    v16[4] = self;
    v9 = v6;
    v17 = v9;
    -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("MFMailConversationViewDidShow"), 1, v16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BFDC0;
    v12[3] = &unk_10051D740;
    v13 = v5;
    v14 = self;
    v15 = v9;
    -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("MFMailConversationViewChildMessageViewDidDisplayContent"), 0, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemID"));
    objc_msgSend(v7, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:", v10, 0, 1, 1, 0);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSource"));
    -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v6, objc_msgSend(v11, "numberOfItems"));

  }
}

- (void)startConversationViewRotationTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  MailAppController *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  if ((unint64_t)(qword_1005A9C48 - 3) < 2)
    v6 = 1;
  else
    v6 = 4;
  -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMessageListViewController](self, "getMessageListViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "referenceMessageListItemForFirstConversationWithSingleMessage:markAsRead:", 0, 0));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemID"));
    objc_msgSend(v7, "selectItemID:userInitiated:animated:", v10, 1, 1);

    -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 2.0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000C00F0;
    v19[3] = &unk_10051D718;
    v19[4] = self;
    v11 = v5;
    v20 = v11;
    -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("MailSplitViewControllerWillTransitionToSizeNotification"), 1, v19);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000C018C;
    v16 = &unk_10051D718;
    v17 = self;
    v18 = v11;
    -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("MailSplitViewControllerDidTransitionToSizeNotification"), 1, &v13);
    objc_msgSend(UIApp, "rotateIfNeeded:completion:", v6, 0, v13, v14, v15, v16, v17);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSource"));
    -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v5, objc_msgSend(v12, "numberOfItems"));

  }
}

- (void)startMailboxPredictionTestWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  MailAppController *v12;
  id v13;

  v4 = a3;
  -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
  objc_msgSend(0, "selectMessageAtIndex:", 0);
  -[MailAppController _waitForTimeInterval:](self, "_waitForTimeInterval:", 1.0);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000C02F0;
  v11 = &unk_10051D718;
  v12 = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  v13 = v5;
  -[MailAppController installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("MFMoveToPredictionTriageInteractionPredictionPresented"), 1, &v8);
  -[MailAppController startedTest:](self, "startedTest:", v5, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "barItemsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "moveButtonItem"));
  objc_msgSend(0, "moveButtonTapped:", v7);

}

- (void)startMessageListSwipeActionTestWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v4 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000C0568;
  v23[3] = &unk_10051D858;
  v23[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  v25 = 0;
  v26 = 0;
  v24 = v5;
  v6 = objc_retainBlock(v23);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C06F0;
  v20[3] = &unk_10051D880;
  v20[4] = self;
  v7 = v5;
  v21 = v7;
  v22 = 0;
  v8 = objc_retainBlock(v20);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "splitViewController"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C082C;
  v14[3] = &unk_10051D8A8;
  objc_copyWeak(&v18, &location);
  v11 = v7;
  v15 = v11;
  v12 = v6;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  objc_msgSend(v10, "showMessageListViewController:animated:completion:", 1, 1, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_testFailedDueToNilReferenceMessage:(id)a3 messageCount:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't find a conversation to select. Mail message count: %lu"), a4));
  -[MailAppController failedTest:withFailure:](self, "failedTest:withFailure:", v7, v6);

}

- (void)startScrollMailboxListTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController getMailboxPickerController](self, "getMailboxPickerController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "splitViewController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C0AD4;
  v10[3] = &unk_10051D8F8;
  v8 = v5;
  v11 = v8;
  v9 = v4;
  v12 = v9;
  objc_msgSend(v7, "showMailboxPickerController:animated:completion:", 1, 0, v10);

}

- (void)_waitForTimeInterval:(double)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
  objc_msgSend(v5, "runUntilDate:", v4);

}

- (void)installNotificationObserverForNotificationName:(id)a3 object:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000C0E98;
  v25 = sub_1000C0EA8;
  v26 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C0EB0;
  v17[3] = &unk_10051D920;
  v19 = &v21;
  v20 = a5;
  v14 = v11;
  v18 = v14;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v9, v10, v12, v17));
  v16 = (void *)v22[5];
  v22[5] = v15;

  _Block_object_dispose(&v21, 8);
}

- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5
{
  -[MailAppController installNotificationObserverForNotificationName:object:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:object:forOneNotification:usingBlock:", a3, 0, a4, a5);
}

- (id)masterNavigationController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "masterNavigationController"));

  return v3;
}

- (BOOL)isComposeWindowActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = objc_msgSend(v2, "isComposeWindowActive");

  return v3;
}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a4;
  v13 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  objc_msgSend(v12, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v13, v8, v10, 0, v11);

}

- (void)dismissAnyModalViewControllerOrPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  objc_msgSend(v4, "_dismissAnyModalViewControllerOrPopoverAnimated:", v3);

}

- (id)dockContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dockContainer"));

  return v3;
}

- (id)rootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mf_rootViewController"));

  return v3;
}

- (void)_dismissComposeViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAppController mostRecentMainScene](self, "mostRecentMainScene"));
  objc_msgSend(v6, "dismissComposeViewController:animated:afterSending:", v7, v4, 0);

}

- (id)copySourcesCurrentlyVisible
{
  return &__NSArray0__struct;
}

- (void)registerAppIntentsDependencies
{
  MailAppController *v3;

  swift_getObjectType();
  v3 = self;
  sub_1002B75B8();

}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  id v4;
  MailAppController *v5;
  Class isa;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  isa = MailAppController.presentingViewController(for:)((MFTriageInteraction *)a3).super.super.isa;

  return isa;
}

@end
