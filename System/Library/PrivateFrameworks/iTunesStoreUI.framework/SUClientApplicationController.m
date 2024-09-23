@implementation SUClientApplicationController

- (SUClientApplicationController)initWithClientInterface:(id)a3
{
  SUClientApplicationController *v4;
  id v5;
  id v6;
  double Current;
  SUSectionsResponse *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int *v19;
  uint64_t v20;
  objc_super v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SUClientApplicationController;
  v4 = -[SUClientController initWithClientInterface:](&v21, sel_initWithClientInterface_);
  if (v4)
  {
    v5 = +[SUSectionsResponse lastCachedVersionIdentifier](SUSectionsResponse, "lastCachedVersionIdentifier");
    if (v5)
    {
      v6 = v5;
      Current = CFAbsoluteTimeGetCurrent();
      v8 = -[SUSectionsResponse initWithClientInterface:cacheDirectory:]([SUSectionsResponse alloc], "initWithClientInterface:cacheDirectory:", a3, objc_msgSend(+[SUSectionsResponse sectionsCacheDirectory](SUSectionsResponse, "sectionsCacheDirectory"), "stringByAppendingPathComponent:", v6));
      v4->_lastSectionsResponse = v8;
      if (v8)
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v10 = objc_msgSend(v9, "shouldLog");
        if (objc_msgSend(v9, "shouldLogToDisk"))
          v11 = v10 | 2;
        else
          v11 = v10;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v11 &= 2u;
        if (v11)
        {
          v12 = objc_opt_class();
          v13 = CFAbsoluteTimeGetCurrent();
          v22 = 138412546;
          v23 = v12;
          v24 = 2048;
          v25 = v13 - Current;
          LODWORD(v20) = 22;
          v19 = &v22;
          v14 = _os_log_send_and_compose_impl();
          if (v14)
          {
            v15 = (void *)v14;
            v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v22, v20);
            free(v15);
            v19 = (int *)v16;
            SSFileLog();
          }
        }
      }
    }
    v4->_shouldPrepareUserInterfaceWhenActivated = 1;
    v17 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v19);
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel__selectFooterSectionNotification_, *MEMORY[0x24BEC8B18], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel__restrictionsChangedNotification_, *MEMORY[0x24BE63740], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel__storeFrontChangedNotification_, *MEMORY[0x24BEB21E8], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel__accountControllerDisappearedNotification_, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel__reloadForNetworkTypeChange_, CFSTR("SUNetworkTypeChangedNotification"), 0);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B18], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB21E8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUDialogDidFinishNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUNetworkTypeChangedNotification"), 0);

  -[SUUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", 0);
  -[SUTabBarController setDelegate:](self->_tabBarController, "setDelegate:", 0);

  -[SUClientApplicationController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");
  v4.receiver = self;
  v4.super_class = (Class)SUClientApplicationController;
  -[SUClientController dealloc](&v4, sel_dealloc);
}

+ (void)setSharedController:(id)a3
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SUClientApplicationController;
  objc_msgSendSuper2(&v3, sel_setSharedController_, a3);
}

+ (id)sharedController
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SUClientApplicationController;
  return objc_msgSendSuper2(&v3, sel_sharedController);
}

- (void)beginIgnoringDownloadQueueChanges
{
  ++self->_ignoreDownloadQueueChangeCount;
}

- (id)copySuspendSettings
{
  return objc_alloc_init(MEMORY[0x24BDBCED8]);
}

- (double)defaultImageSnapshotExpiration
{
  double v3;
  double result;
  double v5;
  UIViewController *v6;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture"), "timeIntervalSinceReferenceDate");
  if (self->_reloadSectionsOnNextLaunch)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "distantPast"), "timeIntervalSinceReferenceDate");
  }
  else
  {
    v5 = v3;
    if (-[SUClientApplicationController isTabBarControllerLoaded](self, "isTabBarControllerLoaded")
      && (v6 = -[UINavigationController topViewController](-[SUClientApplicationController topNavigationController](self, "topNavigationController"), "topViewController"), (objc_opt_respondsToSelector() & 1) != 0))
    {
      -[UIViewController defaultPNGExpirationTime](v6, "defaultPNGExpirationTime");
    }
    else
    {
      return v5;
    }
  }
  return result;
}

- (NSString)defaultPNGNameForSuspend
{
  NSString *v3;
  SUMediaPlayerViewController *v4;
  SUMediaPlayerViewController *v5;

  v3 = (NSString *)objc_msgSend(-[SUClientApplicationController _resumableViewController](self, "_resumableViewController"), "defaultPNGName");

  self->_preMediaDefaultPNG = 0;
  v4 = -[SUClientApplicationController _activeMediaPlayer](self, "_activeMediaPlayer");
  if (!v4)
    return v3;
  v5 = v4;
  self->_preMediaDefaultPNG = v3;
  return (NSString *)-[SUMediaPlayerViewController defaultPNGName](v5, "defaultPNGName");
}

- (void)endIgnoringDownloadQueueChanges
{
  int64_t ignoreDownloadQueueChangeCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;

  ignoreDownloadQueueChangeCount = self->_ignoreDownloadQueueChangeCount;
  v3 = ignoreDownloadQueueChangeCount == 1;
  v4 = ignoreDownloadQueueChangeCount < 1;
  v5 = ignoreDownloadQueueChangeCount - 1;
  if (!v4)
  {
    self->_ignoreDownloadQueueChangeCount = v5;
    if (v3)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUClientDidStopIgnoringDownloadQueueNotification"), self);
  }
}

- (void)exitStoreAfterDialogsDismiss
{
  if (-[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance"), "numberOfPendingDialogs"))
  {
    -[SUClientApplicationController _cancelSuspendAfterDialogsDismissed](self, "_cancelSuspendAfterDialogsDismissed");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__dialogDidFinishNotification_, CFSTR("SUDialogDidFinishNotification"), 0);
  }
  else
  {
    -[SUClientController exitStoreWithReason:](self, "exitStoreWithReason:", 0);
  }
}

- (BOOL)isIgnoringDownloadQueueChanges
{
  return self->_ignoreDownloadQueueChangeCount > 0;
}

- (BOOL)isTabBarControllerLoaded
{
  return self->_tabBarController != 0;
}

- (NSURL)launchURL
{
  return (NSURL *)-[SUUIURL underlyingURL](self->_launchURL, "underlyingURL");
}

- (void)prepareUserInterface
{
  -[SUClientApplicationController tabBarController](self, "tabBarController");
  -[SUClientApplicationController _setupTabBarController](self, "_setupTabBarController");
}

- (BOOL)reloadSectionWithIdentifier:(id)a3 url:(id)a4
{
  -[SUTabBarController reloadSectionWithIdentifier:URL:](-[SUClientApplicationController tabBarController](self, "tabBarController"), "reloadSectionWithIdentifier:URL:", a3, a4);
  return 1;
}

- (BOOL)selectSectionWithIdentifier:(id)a3
{
  -[SUTabBarController setSelectedIdentifier:](-[SUClientApplicationController tabBarController](self, "tabBarController"), "setSelectedIdentifier:", a3);
  return 1;
}

- (void)setExitStoreButtonTitle:(id)a3
{
  NSString *exitStoreButtonTitle;

  exitStoreButtonTitle = self->_exitStoreButtonTitle;
  if (exitStoreButtonTitle != a3 && !-[NSString isEqualToString:](exitStoreButtonTitle, "isEqualToString:"))
  {

    self->_exitStoreButtonTitle = (NSString *)objc_msgSend(a3, "copy");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUClientExitStoreButtonDidChangeNotification"), self);
  }
}

- (void)setupUI
{
  SUUIURL *launchURL;
  SUUIURL *v4;

  self->_preMediaDefaultPNG = 0;
  launchURL = self->_launchURL;
  if (launchURL)
  {
    v4 = launchURL;

    self->_launchURL = 0;
    -[SUClientApplicationController _openClientURL:](self, "_openClientURL:", v4);

  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "shouldLaunchSafe") & 1) == 0)
    -[SUClientController composeEmailByRestoringAutosavedMessage](self, "composeEmailByRestoringAutosavedMessage");
}

- (id)showMainPageForItemKind:(id)a3 sectionIdentifiers:(id)a4
{
  uint64_t v6;
  id result;
  SUTabBarController *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(MEMORY[0x24BEC8C40], "storeFrontURLBagKeyForItemKind:", a3);
  if (v6)
    return -[SUClientApplicationController _showPageForExternalOriginatedURLBagKey:](self, "_showPageForExternalOriginatedURLBagKey:", v6);
  v8 = -[SUClientApplicationController tabBarController](self, "tabBarController");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = (id)objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v14;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(a4);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
        if (-[SUTabBarController viewControllerForSectionIdentifier:](v8, "viewControllerForSectionIdentifier:", v12))
        {
          -[SUTabBarController setSelectedIdentifier:](v8, "setSelectedIdentifier:", v12);
          return -[SUTabBarController selectedViewController](v8, "selectedViewController");
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      result = (id)objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v9 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (SUTabBarController)tabBarController
{
  SUTabBarController *tabBarController;

  tabBarController = self->_tabBarController;
  if (!tabBarController)
  {
    tabBarController = -[SUClientApplicationController _newTabBarController](self, "_newTabBarController");
    self->_tabBarController = tabBarController;
    if (!self->super._rootViewController)
    {
      -[SUClientController setRootViewController:](self, "setRootViewController:", tabBarController);
      return self->_tabBarController;
    }
  }
  return tabBarController;
}

- (void)tearDownUI
{
  SUTabBarController *tabBarController;

  -[SUClientApplicationController _cancelSuspendAfterDialogsDismissed](self, "_cancelSuspendAfterDialogsDismissed");
  tabBarController = self->_tabBarController;
  if ((SUTabBarController *)self->super._rootViewController == tabBarController)
  {
    -[SUClientController setRootViewController:](self, "setRootViewController:", 0);
    tabBarController = self->_tabBarController;
  }
  -[SUTabBarController setDelegate:](tabBarController, "setDelegate:", 0);
  if (-[SUTabBarController isViewLoaded](self->_tabBarController, "isViewLoaded"))
    objc_msgSend((id)-[SUTabBarController view](self->_tabBarController, "view"), "removeFromSuperview");

  self->_tabBarController = 0;
}

- (UINavigationController)topNavigationController
{
  UINavigationController *v3;
  UINavigationController *i;

  v3 = (UINavigationController *)-[SUTabBarController transientViewController](-[SUClientApplicationController tabBarController](self, "tabBarController"), "transientViewController");
  if (!v3)
    v3 = -[UITabBarController selectedNavigationController](-[SUClientApplicationController tabBarController](self, "tabBarController"), "selectedNavigationController");
  for (i = v3; -[UINavigationController presentedViewController](i, "presentedViewController"); v3 = i)
    i = (UINavigationController *)-[UINavigationController presentedViewController](v3, "presentedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return (UINavigationController *)-[UINavigationController navigationController](v3, "navigationController");
}

- (BOOL)wasLaunchedFromLibrary
{
  return 0;
}

- (void)becomeActive
{
  BOOL v3;
  objc_super v4;

  v3 = -[SUClientController isActive](self, "isActive");
  v4.receiver = self;
  v4.super_class = (Class)SUClientApplicationController;
  -[SUClientController becomeActive](&v4, sel_becomeActive);
  if (!v3 && (objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    if (-[SUClientApplicationController shouldPrepareUserInterfaceWhenActivated](self, "shouldPrepareUserInterfaceWhenActivated"))
    {
      -[SUClientApplicationController _setupTabBarController](self, "_setupTabBarController");
    }
  }
}

- (void)cancelAllOperations
{
  objc_super v3;

  -[SUClientApplicationController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");
  v3.receiver = self;
  v3.super_class = (Class)SUClientApplicationController;
  -[SUClientController cancelAllOperations](&v3, sel_cancelAllOperations);
}

- (void)dismissOverlayBackgroundViewController
{
  -[SUTabBarController dismissOverlayBackgroundViewController](self->_tabBarController, "dismissOverlayBackgroundViewController");
}

- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController *v4;

  v3 = a3;
  v4 = -[UINavigationController topViewController](-[SUClientApplicationController topNavigationController](self, "topNavigationController"), "topViewController");
  -[UIViewController dismissAnimated:](v4, "dismissAnimated:", v3);
  return v4 != 0;
}

- (BOOL)displayClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v9 = objc_msgSend(a3, "storeURLType");
  v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  if (v9 != 1 || v10 == 1)
  {
    switch(v9)
    {
      case 4:
        -[SUClientApplicationController _handleAddPassbookPassURL:](self, "_handleAddPassbookPassURL:", a3);
        break;
      case 3:
        -[SUClientApplicationController _handleDonationURL:](self, "_handleDonationURL:", a3);
        break;
      case 2:
        -[SUClientApplicationController _handleAccountURL:](self, "_handleAccountURL:", a3);
        break;
      default:
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", objc_msgSend(a3, "schemeSwizzledURL"));
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", a5, CFSTR("referer"));
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", a4, CFSTR("ref-user-agent"));
        -[SUClientApplicationController _defaultHandleApplicationURLRequestProperties:](self, "_defaultHandleApplicationURLRequestProperties:", v11);

        break;
    }
  }
  else
  {
    -[SUClientApplicationController _handleSearchURL:withSourceApplication:sourceURL:](self, "_handleSearchURL:withSourceApplication:sourceURL:", a3, a4, a5);
  }
  return 1;
}

- (BOOL)openClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5
{
  uint64_t v9;
  void *v10;
  BOOL v11;

  v9 = ISUIMobileStoreUIFramework();
  v10 = (void *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIURL"), v9)), "initWithURL:", a3);
  objc_msgSend(v10, "setReferrerApplicationName:", a4);
  objc_msgSend(v10, "setReferrerURLString:", a5);
  if (self->_lastSectionsResponse)
  {
    v11 = -[SUClientApplicationController _displayClientURL:](self, "_displayClientURL:", v10);
  }
  else
  {

    self->_launchURL = (SUUIURL *)v10;
    v11 = 1;
  }

  return v11;
}

- (id)overlayBackgroundViewController
{
  return -[SUTabBarController overlayBackgroundViewController](self->_tabBarController, "overlayBackgroundViewController");
}

- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  SUNavigationController *v9;
  BOOL v10;
  SUTabBarController *i;
  SUTabBarController *v12;

  v5 = a5;
  v6 = a4;
  v9 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", a3);
  -[SUNavigationController setClientInterface:](v9, "setClientInterface:", objc_msgSend(a3, "clientInterface"));
  -[SUNavigationController setNavigationBarHidden:](v9, "setNavigationBarHidden:", !v6);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    v10 = -[SUClientApplicationController _showWildcatAccountViewController:animated:](self, "_showWildcatAccountViewController:animated:", v9, v5);
  }
  else
  {
    for (i = -[SUClientApplicationController tabBarController](self, "tabBarController");
          ;
          i = (SUTabBarController *)-[SUTabBarController presentedViewController](v12, "presentedViewController"))
    {
      v12 = i;
      if (!-[SUTabBarController presentedViewController](i, "presentedViewController"))
        break;
    }
    -[UIViewController transitionSafePresentModalViewController:animated:](v12, "transitionSafePresentModalViewController:animated:", v9, v5);
    v10 = v12 != 0;
  }

  return v10;
}

- (void)presentExternalURLViewController:(id)a3
{
  id v5;
  id v6;
  SUTabBarController *v7;

  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (id)objc_msgSend(a3, "topViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = -[SUClientController overlayConfigurationForStorePage:](self, "overlayConfigurationForStorePage:", v5)) != 0)
  {
    -[UIViewController presentViewController:inOverlayWithConfiguration:](-[SUClientApplicationController tabBarController](self, "tabBarController"), "presentViewController:inOverlayWithConfiguration:", a3, v6);
  }
  else
  {
    v7 = -[SUClientApplicationController tabBarController](self, "tabBarController");
    -[SUTabBarController setTransientViewController:animated:](v7, "setTransientViewController:animated:", a3, 0);
    if (-[SUTabBarController presentedViewController](v7, "presentedViewController"))
      -[SUTabBarController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  return -[SUTabBarController presentOverlayBackgroundViewController:](self->_tabBarController, "presentOverlayBackgroundViewController:", a3);
}

- (void)resignActive
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (-[SUClientController isActive](self, "isActive"))
  {
    -[SUClientApplicationController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");
    if (self->super._mailComposeViewController)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v12 = *MEMORY[0x24BDF7608];
      v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v4 = MEMORY[0x24BDAC760];
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __45__SUClientApplicationController_resignActive__block_invoke;
      v8[3] = &unk_24DE7AF68;
      v8[4] = &v9;
      v5 = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v8);
      v10[3] = v5;
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __45__SUClientApplicationController_resignActive__block_invoke_2;
      v7[3] = &unk_24DE7AF68;
      v7[4] = &v9;
      -[SUClientController autosaveMessageWithCompletionBlock:](self, "autosaveMessageWithCompletionBlock:", v7);
      _Block_object_dispose(&v9, 8);
    }
    if (self->_lastSectionsResponse)
      -[SUTabBarController saveToDefaults](self->_tabBarController, "saveToDefaults");
  }
  v6.receiver = self;
  v6.super_class = (Class)SUClientApplicationController;
  -[SUClientController resignActive](&v6, sel_resignActive);
}

uint64_t __45__SUClientApplicationController_resignActive__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x24BDF7608];
  return result;
}

uint64_t __45__SUClientApplicationController_resignActive__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x24BDF7608];
  return result;
}

- (id)_newTabBarController
{
  SUTabBarController *v3;
  void *v4;
  void *v5;
  SUNavigationController *v6;

  v3 = -[SUTabBarController initWithClientInterface:]([SUTabBarController alloc], "initWithClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  -[SUTabBarController setDelegate:](v3, "setDelegate:", self);
  v4 = (void *)-[SUTabBarController view](v3, "view");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  objc_msgSend(v4, "setFrame:");
  if (objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG"))
  {
    v5 = (void *)objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
    objc_msgSend(v5, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
    v6 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v5);
    -[SUNavigationController setClientInterface:](v6, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
    -[SUTabBarController setTransientViewController:](v3, "setTransientViewController:", v6);

  }
  return v3;
}

- (void)_restorePreMediaPlayerSettings
{
  id v3;
  void *v4;

  if (self->_preMediaDefaultPNG)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE70]);
    v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", self->_preMediaDefaultPNG, *MEMORY[0x24BDF8230], 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "updateSuspendedSettings:", v4);

    self->_preMediaDefaultPNG = 0;
  }
}

- (void)_setActiveMediaPlayer:(id)a3
{
  SUMediaPlayerViewController *activeMediaPlayer;
  SUMediaPlayerViewController *v6;

  activeMediaPlayer = self->_activeMediaPlayer;
  if (activeMediaPlayer != a3)
  {

    v6 = (SUMediaPlayerViewController *)a3;
    self->_activeMediaPlayer = v6;
    if (!v6)
      -[SUClientApplicationController _restorePreMediaPlayerSettings](self, "_restorePreMediaPlayerSettings");
  }
}

- (id)_showPageForExternalOriginatedURLBagKey:(id)a3
{
  id v5;
  void *v6;
  SUNavigationController *v7;

  v5 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v5, "setURLBagKey:", a3);
  v6 = (void *)objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v6, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  objc_msgSend(v6, "setExternalRequest:", 1);
  objc_msgSend(v6, "setURLRequestProperties:", v5);
  v7 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v6);
  -[SUNavigationController setClientInterface:](v7, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  -[SUClientApplicationController presentExternalURLViewController:](self, "presentExternalURLViewController:", v7);

  return v6;
}

- (void)clientInterface:(id)a3 hidePreviewOverlayAnimated:(BOOL)a4
{
  if (self->_previewOverlay)
    -[SUTabBarController _hidePreviewOverlayAnimated:](-[SUClientApplicationController tabBarController](self, "tabBarController", a3), "_hidePreviewOverlayAnimated:", a4);
}

- (void)clientInterface:(id)a3 showPreviewOverlayAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  _QWORD v28[5];
  BOOL v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = -[SUClientApplicationController _previewOverlayViewController](self, "_previewOverlayViewController", a3);
  if (objc_msgSend(v6, "isContentLoaded"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v9 &= 2u;
    if (v9)
    {
      v30 = 138412546;
      v31 = objc_opt_class();
      v32 = 2112;
      v33 = v6;
      LODWORD(v27) = 22;
      v26 = &v30;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v30, v27);
        free(v11);
        v26 = (int *)v12;
        SSFileLog();
      }
    }
    -[SUClientApplicationController _showPreviewOverlayAnimated:](self, "_showPreviewOverlayAnimated:", v4, v26);
  }
  else
  {
    v13 = objc_msgSend(v6, "isSkLoaded");
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    v17 = objc_msgSend(v14, "OSLogObject");
    if (v13)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        v18 = v16;
      else
        v18 = v16 & 2;
      if (v18)
      {
        v30 = 138412290;
        v31 = objc_opt_class();
        LODWORD(v27) = 12;
        v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          v20 = (void *)v19;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v30, v27);
          free(v20);
          SSFileLog();
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        v21 = v16;
      else
        v21 = v16 & 2;
      if (v21)
      {
        v30 = 138412290;
        v31 = objc_opt_class();
        LODWORD(v27) = 12;
        v26 = &v30;
        v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          v23 = (void *)v22;
          v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v30, v27);
          free(v23);
          v26 = (int *)v24;
          SSFileLog();
        }
      }
      v25 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self, v26);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __76__SUClientApplicationController_clientInterface_showPreviewOverlayAnimated___block_invoke;
      v28[3] = &unk_24DE7DCA8;
      v28[4] = v25;
      v29 = v4;
      objc_msgSend(v6, "loadWithCompletionBlock:", v28);
    }
  }
}

uint64_t __76__SUClientApplicationController_clientInterface_showPreviewOverlayAnimated___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "object"), "_showPreviewOverlayAnimated:", *(unsigned __int8 *)(result + 40));
  return result;
}

- (id)previewOverlayForClientInterface:(id)a3
{
  return -[SUClientApplicationController _previewOverlayViewController](self, "_previewOverlayViewController", a3);
}

- (void)passbookLoaderDidFinish:(id)a3
{
  if (self->_passbookLoader == a3)
  {
    objc_msgSend(a3, "setDelegate:", 0);

    self->_passbookLoader = 0;
  }
}

- (BOOL)tabBarController:(id)a3 shouldShowSection:(id)a4
{
  return 1;
}

- (void)_accountControllerDisappearedNotification:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_reloadForStorefrontChangeAfterAccountSetup)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3);
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v6 &= 2u;
    if (v6)
    {
      v12 = 138412290;
      v13 = objc_opt_class();
      LODWORD(v11) = 12;
      v10 = &v12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v12, v11);
        free(v8);
        v10 = (int *)v9;
        SSFileLog();
      }
    }
    self->_reloadForStorefrontChangeAfterAccountSetup = 0;
    -[SUClientApplicationController _reloadForStorefrontChange](self, "_reloadForStorefrontChange", v10);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3), "postNotificationName:object:", CFSTR("SUStoreEnabledChangedNotification"), self);
}

- (void)bagDidLoadNotification:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  objc_super v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[SUClientApplicationController _accountViewController](self, "_accountViewController"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v7 &= 2u;
    if (v7)
    {
      v17 = 138412290;
      v18 = objc_opt_class();
      LODWORD(v15) = 12;
      v14 = &v17;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v17, v15);
        free(v9);
        v14 = (int *)v10;
        SSFileLog();
      }
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUStoreEnabledChangedNotification"), self);
  }
  v11 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache", v14);
  v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0)), "valueForKey:", CFSTR("platform-gradients"));
  objc_opt_class();
  v13 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = objc_msgSend(v12, "objectForKey:", -[SUClientController clientIdentifier](self, "clientIdentifier"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setObject:forKey:", v13, CFSTR("SUPlatformGradients"));
  v16.receiver = self;
  v16.super_class = (Class)SUClientApplicationController;
  -[SUClientController bagDidLoadNotification:](&v16, sel_bagDidLoadNotification_, a3);
}

- (void)_dialogDidFinishNotification:(id)a3
{
  if (!-[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance", a3), "numberOfPendingDialogs"))-[SUClientController exitStoreWithReason:](self, "exitStoreWithReason:", 0);
}

- (void)_restrictionsChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SUClientApplicationController__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __66__SUClientApplicationController__restrictionsChangedNotification___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 160))
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v4 &= 2u;
    if (v4)
    {
      v10 = 138412290;
      v11 = objc_opt_class();
      LODWORD(v9) = 12;
      v8 = &v10;
      v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4, &v10, v9);
        free(v6);
        v8 = (int *)v7;
        SSFileLog();
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 216), "setSections:", objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 160), "sections", v8));
  }
  return result;
}

- (void)_selectFooterSectionNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEC8B10]);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "isSuspended") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v8 &= 2u;
      if (v8)
      {
        v14 = 138412546;
        v15 = objc_opt_class();
        v16 = 2112;
        v17 = v5;
        LODWORD(v13) = 22;
        v12 = &v14;
        v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v14, v13);
          free(v10);
          v12 = (int *)v11;
          SSFileLog();
        }
      }
      -[SUTabBarController setSelectedIdentifier:](self->_tabBarController, "setSelectedIdentifier:", v5, v12);
    }
  }
}

- (void)_storeFrontChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SUClientApplicationController__storeFrontChangedNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __64__SUClientApplicationController__storeFrontChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t result;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "applicationState") == 2)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    result = os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)result)
      v4 &= 2u;
    if (v4)
    {
      v12 = 138412290;
      v13 = objc_opt_class();
      LODWORD(v11) = 12;
      result = _os_log_send_and_compose_impl();
      if (result)
      {
        v6 = (void *)result;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", result, 4, &v12, v11);
        free(v6);
        return SSFileLog();
      }
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "_accountViewController"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    result = os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)result)
      v9 &= 2u;
    if (v9)
    {
      v12 = 138412290;
      v13 = objc_opt_class();
      LODWORD(v11) = 12;
      result = _os_log_send_and_compose_impl();
      if (result)
      {
        v10 = (void *)result;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", result, 4, &v12, v11);
        free(v10);
        result = SSFileLog();
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 1;
  }
  else
  {
    return objc_msgSend(*(id *)(a1 + 32), "_reloadForStorefrontChange");
  }
  return result;
}

- (void)_cancelLoadSectionsOperation
{
  -[ISOperation setCompletionBlock:](self->_loadSectionsOperation, "setCompletionBlock:", 0);
  -[ISOperation cancel](self->_loadSectionsOperation, "cancel");

  self->_loadSectionsOperation = 0;
}

- (void)_cancelSectionFetchPlaceholder
{
  -[SUPlaceholderViewController setSkLoading:](self->_fetchSectionsPlaceholder, "setSkLoading:", 0);

  self->_fetchSectionsPlaceholder = 0;
}

- (void)_handleFinishedBackgroundLoadSectionsOperation:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "sectionsResponse");

  self->_lastBackgroundSectionsResponse = 0;
  if (objc_msgSend(a3, "success")
    && objc_msgSend(v5, "responseType") == 1
    && (objc_msgSend((id)objc_msgSend(v5, "versionString"), "isEqualToString:", -[SUSectionsResponse versionString](self->_lastSectionsResponse, "versionString")) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v8 &= 2u;
    if (v8)
    {
      v14 = 138412290;
      v15 = objc_opt_class();
      LODWORD(v13) = 12;
      v12 = &v14;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v14, v13);
        free(v10);
        v12 = (int *)v11;
        SSFileLog();
      }
    }
    self->_lastBackgroundSectionsResponse = (SUSectionsResponse *)v5;
    self->_reloadSectionsOnNextLaunch = 1;
  }
  -[SUClientApplicationController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation", v12);
}

- (void)_handleFinishedLoadSectionsOperation:(id)a3
{
  void *v5;
  uint64_t v6;
  SUClientApplicationController *v7;

  if ((objc_msgSend(a3, "success") & 1) == 0)
  {
    v6 = objc_msgSend(a3, "error");
    v7 = self;
LABEL_6:
    -[SUClientApplicationController _handleSectionsLoadFailedWithError:](v7, "_handleSectionsLoadFailedWithError:", v6);
    goto LABEL_7;
  }
  v5 = (void *)objc_msgSend(a3, "sectionsResponse");
  if (!objc_msgSend((id)objc_msgSend(v5, "sections"), "count"))
  {
    v7 = self;
    v6 = 0;
    goto LABEL_6;
  }
  -[SUClientApplicationController _reloadWithSectionsResponse:](self, "_reloadWithSectionsResponse:", v5);
LABEL_7:
  -[SUClientApplicationController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");
}

- (void)_handleSectionsLoadFailedWithError:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SUDialogManager *v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (ISErrorIndicatesSlowNetwork())
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      v15 = 138412290;
      v16 = objc_opt_class();
      LODWORD(v14) = 12;
      v13 = &v15;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v15, v14);
        free(v9);
        v13 = (int *)v10;
        SSFileLog();
      }
    }
    -[SUDialogManager presentDialogForError:](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance", v13), "presentDialogForError:", a3);
    -[SUClientApplicationController _retrySectionsAfterNetworkTransition](self, "_retrySectionsAfterNetworkTransition");
  }
  else
  {
    v11 = (void *)-[SUTabBarController transientViewController](self->_tabBarController, "transientViewController");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (void *)objc_msgSend(v11, "topViewController");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setSkLoading:", 0);
    v12 = +[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance");
    if (!-[SUDialogManager numberOfPendingDialogs](v12, "numberOfPendingDialogs"))
    {
      if (!a3)
        a3 = (id)ISError();
      -[SUDialogManager presentDialogForError:](v12, "presentDialogForError:", a3);
    }
    -[SUClientApplicationController exitStoreAfterDialogsDismiss](self, "exitStoreAfterDialogsDismiss");
  }
}

- (BOOL)_loadSectionsAllowingCache:(BOOL)a3 withCompletionBlock:(id)a4
{
  ISOperation *loadSectionsOperation;
  _BOOL8 v6;
  SULoadSectionsOperation *v8;

  loadSectionsOperation = self->_loadSectionsOperation;
  if (!loadSectionsOperation)
  {
    v6 = a3;
    v8 = -[SULoadSectionsOperation initWithClientInterface:]([SULoadSectionsOperation alloc], "initWithClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
    -[SULoadSectionsOperation setActiveSectionVersionString:](v8, "setActiveSectionVersionString:", -[SUSectionsResponse versionString](self->_lastSectionsResponse, "versionString"));
    -[SULoadSectionsOperation setCompletionBlock:](v8, "setCompletionBlock:", a4);
    -[SULoadSectionsOperation setShouldUseCache:](v8, "setShouldUseCache:", v6);
    self->_loadSectionsOperation = &v8->super;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v8);
  }
  return loadSectionsOperation == 0;
}

- (void)_presentSectionFetchUI
{
  SUPlaceholderViewController *v3;
  SUNavigationController *v4;

  v3 = (SUPlaceholderViewController *)objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
  self->_fetchSectionsPlaceholder = v3;
  -[SUViewController setClientInterface:](v3, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  v4 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", self->_fetchSectionsPlaceholder);
  -[SUNavigationController setClientInterface:](v4, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  -[SUPlaceholderViewController setSkLoading:](self->_fetchSectionsPlaceholder, "setSkLoading:", 1);
  -[SUTabBarController setTransientViewController:animated:](self->_tabBarController, "setTransientViewController:animated:", v4, 0);

}

- (BOOL)_reloadForStorefrontChange
{
  _QWORD v4[5];

  if (self->_loadSectionsOperation)
    return 1;
  -[SUTabBarController saveToDefaults](self->_tabBarController, "saveToDefaults");
  -[SUTabBarController dismissViewControllerAnimated:completion:](self->_tabBarController, "dismissViewControllerAnimated:completion:", 0, 0);
  -[SUTabBarController setViewControllers:](self->_tabBarController, "setViewControllers:", 0);
  -[SUClientApplicationController _presentSectionFetchUI](self, "_presentSectionFetchUI");

  self->_lastBackgroundSectionsResponse = 0;
  self->_lastSectionsResponse = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke;
  v4[3] = &unk_24DE7AF90;
  v4[4] = self;
  return -[SUClientApplicationController _loadSectionsAllowingCache:withCompletionBlock:](self, "_loadSectionsAllowingCache:withCompletionBlock:", 0, v4);
}

void __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke_2;
  block[3] = &unk_24DE7AF90;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelSectionFetchPlaceholder");
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishedLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
}

- (void)_reloadWithSectionsResponse:(id)a3
{
  SUSectionsResponse *lastSectionsResponse;
  SUSectionsResponse *lastBackgroundSectionsResponse;

  lastSectionsResponse = self->_lastSectionsResponse;
  if (lastSectionsResponse != a3)
  {

    self->_lastSectionsResponse = (SUSectionsResponse *)a3;
  }
  -[SUTabBarController setTransientViewController:animated:](self->_tabBarController, "setTransientViewController:animated:", 0, 0);
  -[SUTabBarController setSections:](self->_tabBarController, "setSections:", -[SUSectionsResponse sections](self->_lastSectionsResponse, "sections"));
  -[SUTabBarController setMoreListSelectedImage:unselectedImage:](self->_tabBarController, "setMoreListSelectedImage:unselectedImage:", -[SUSectionsResponse moreListSelectedImage](self->_lastSectionsResponse, "moreListSelectedImage"), -[SUSectionsResponse moreListImage](self->_lastSectionsResponse, "moreListImage"));
  -[SUTabBarController setMoreListTitle:](self->_tabBarController, "setMoreListTitle:", -[SUSectionsResponse moreListTitle](self->_lastSectionsResponse, "moreListTitle"));
  lastBackgroundSectionsResponse = self->_lastBackgroundSectionsResponse;
  if (lastBackgroundSectionsResponse
    && -[NSString isEqualToString:](-[SUSectionsResponse versionString](lastBackgroundSectionsResponse, "versionString"), "isEqualToString:", -[SUSectionsResponse versionString](self->_lastSectionsResponse, "versionString")))
  {
    if (!-[SUSectionsResponse shouldResetUserOrdering](self->_lastBackgroundSectionsResponse, "shouldResetUserOrdering"))
    {
LABEL_10:
      -[SUTabBarController loadFromDefaults](self->_tabBarController, "loadFromDefaults");
      goto LABEL_11;
    }
  }
  else if (!-[SUSectionsResponse shouldResetUserOrdering](self->_lastSectionsResponse, "shouldResetUserOrdering")
         || !-[SUSectionsResponse responseType](self->_lastSectionsResponse, "responseType"))
  {
    goto LABEL_10;
  }
  -[SUTabBarController selectDefaultSection](self->_tabBarController, "selectDefaultSection");
  -[SUTabBarController resetUserDefaults](self->_tabBarController, "resetUserDefaults");
LABEL_11:

  self->_lastBackgroundSectionsResponse = 0;
  -[SUClientApplicationController setupUI](self, "setupUI");
}

- (void)_retrySectionsAfterNetworkTransition
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD v11[5];
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!self->_lastSectionsResponse
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType") >= 1)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v5 &= 2u;
    if (v5)
    {
      v12 = 138412290;
      v13 = objc_opt_class();
      LODWORD(v10) = 12;
      v9 = &v12;
      v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, &v12, v10);
        free(v7);
        v9 = (int *)v8;
        SSFileLog();
      }
    }
    -[SUClientApplicationController _presentSectionFetchUI](self, "_presentSectionFetchUI", v9);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke;
    v11[3] = &unk_24DE7AF90;
    v11[4] = self;
    -[SUClientApplicationController _loadSectionsAllowingCache:withCompletionBlock:](self, "_loadSectionsAllowingCache:withCompletionBlock:", 1, v11);
  }
}

void __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke_2;
  block[3] = &unk_24DE7AF90;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelSectionFetchPlaceholder");
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishedLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
}

- (void)_defaultHandleApplicationURLRequestProperties:(id)a3
{
  uint64_t v5;
  SUNavigationController *v6;
  id v7;

  v5 = objc_msgSend(-[SUTabBarController selectedViewController](-[SUClientApplicationController tabBarController](self, "tabBarController"), "selectedViewController"), "section");
  v7 = (id)objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v7, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  objc_msgSend(v7, "setExternalRequest:", 1);
  objc_msgSend(v7, "setURLRequestProperties:", a3);
  v6 = -[SUNavigationController initWithSection:rootViewController:]([SUNavigationController alloc], "initWithSection:rootViewController:", v5, v7);
  -[SUNavigationController setClientInterface:](v6, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  -[SUClientApplicationController presentExternalURLViewController:](self, "presentExternalURLViewController:", v6);

}

- (void)_handleAccountURL:(id)a3
{
  SUAccountViewController *v4;

  v4 = -[SUAccountViewController initWithExternalAccountURL:]([SUAccountViewController alloc], "initWithExternalAccountURL:", a3);
  -[SUViewController setClientInterface:](v4, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  -[SUClientController presentAccountViewController:animated:](self, "presentAccountViewController:animated:", v4, 1);

}

- (void)_handleAddPassbookPassURL:(id)a3
{
  SUUIPassbookLoader *passbookLoader;
  uint64_t v6;
  id v7;
  uint64_t v8;
  SUUIPassbookLoader *v9;

  passbookLoader = self->_passbookLoader;
  if (!passbookLoader)
  {
    v6 = ISUIMobileStoreUIFramework();
    v7 = ISUIWeakLinkedClassForString(CFSTR("SUUIClientContext"), v6);
    v8 = ISUIMobileStoreUIFramework();
    v9 = (SUUIPassbookLoader *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIPassbookLoader"), v8)), "initWithClientContext:", objc_msgSend(v7, "defaultContext"));
    self->_passbookLoader = v9;
    -[SUUIPassbookLoader setDelegate:](v9, "setDelegate:", self);
    passbookLoader = self->_passbookLoader;
  }
  -[SUUIPassbookLoader loadPassWithURL:](passbookLoader, "loadPassWithURL:", a3);
}

- (void)_handleDonationURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = ISUIMobileStoreUIFramework();
  v9 = (id)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIURL"), v5)), "initWithURL:", a3);
  v6 = ISUIMobileStoreUIFramework();
  v7 = (void *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIDonationViewController"), v6)), "initWithURL:", v9);
  v8 = ISUIMobileStoreUIFramework();
  objc_msgSend(v7, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(CFSTR("SUUIClientContext"), v8), "defaultContext"));
  -[SUTabBarController presentViewController:animated:completion:](-[SUClientApplicationController tabBarController](self, "tabBarController"), "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_handleSearchURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5
{
  SUTabBarController *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  UIViewController *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = -[SUClientApplicationController tabBarController](self, "tabBarController");
  v10 = -[SUTabBarController sections](v9, "sections");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
      v16 = (void *)objc_msgSend(v15, "searchFieldConfiguration");
      if (v16)
      {
        if (objc_msgSend(v16, "location") != 2)
          break;
      }
      if (v12 == ++v14)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    if (!v15)
      goto LABEL_13;
    -[SUTabBarController setSelectedIdentifier:](v9, "setSelectedIdentifier:", objc_msgSend(v15, "identifier"));
  }
  else
  {
LABEL_13:
    -[SUTabBarController selectSectionOfType:](v9, "selectSectionOfType:", 1);
  }
  v17 = -[UINavigationController topViewController](-[SUClientApplicationController topNavigationController](self, "topNavigationController"), "topViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController handleApplicationURL:withSourceApplication:sourceURL:](v17, "handleApplicationURL:withSourceApplication:sourceURL:", objc_msgSend(a3, "schemeSwizzledURL"), a4, a5);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController handleApplicationURL:](v17, "handleApplicationURL:", objc_msgSend(a3, "schemeSwizzledURL"));
  }
}

- (id)_accountViewController
{
  void *v3;

  v3 = (void *)-[SUTabBarController presentedViewController](self->_tabBarController, "presentedViewController");
  if (!v3)
    v3 = (void *)objc_msgSend((id)objc_msgSend(-[SUTabBarController overlayBackgroundViewController](self->_tabBarController, "overlayBackgroundViewController"), "selectedViewController"), "activeViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v3, "topViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (void)_cancelSuspendAfterDialogsDismissed
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUDialogDidFinishNotification"), 0);
}

- (BOOL)_displayClientURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = +[SUClientApplicationController instanceMethodForSelector:](SUClientApplicationController, "instanceMethodForSelector:", sel_displayClientURL_);
  v6 = -[SUClientApplicationController methodForSelector:](self, "methodForSelector:", sel_displayClientURL_);
  v7 = objc_msgSend(a3, "underlyingURL");
  if (v6 == v5)
    return -[SUClientApplicationController displayClientURL:withSourceApplication:sourceURLString:](self, "displayClientURL:withSourceApplication:sourceURLString:", v7, objc_msgSend(a3, "referrerApplicationName"), objc_msgSend(a3, "referrerURLString"));
  else
    return -[SUClientController displayClientURL:](self, "displayClientURL:", v7);
}

- (void)_openClientURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = +[SUClientApplicationController instanceMethodForSelector:](SUClientApplicationController, "instanceMethodForSelector:", sel_openClientURL_);
  v6 = -[SUClientApplicationController methodForSelector:](self, "methodForSelector:", sel_openClientURL_);
  v7 = objc_msgSend(a3, "underlyingURL");
  if (v6 == v5)
    -[SUClientApplicationController openClientURL:withSourceApplication:sourceURLString:](self, "openClientURL:withSourceApplication:sourceURLString:", v7, objc_msgSend(a3, "referrerApplicationName"), objc_msgSend(a3, "referrerURLString"));
  else
    -[SUClientController openClientURL:](self, "openClientURL:", v7);
}

- (id)_previewOverlayViewController
{
  id result;
  SUPreviewOverlayViewController *v4;

  result = self->_previewOverlay;
  if (!result)
  {
    v4 = objc_alloc_init(SUPreviewOverlayViewController);
    self->_previewOverlay = v4;
    -[SUViewController setClientInterface:](v4, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
    return self->_previewOverlay;
  }
  return result;
}

- (id)_resumableViewController
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v2 = -[SUTabBarController selectedViewController](self->_tabBarController, "selectedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(v2, "copyArchivableContext");
    if (v3)
    {

      return v2;
    }
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = (void *)objc_msgSend(v2, "viewControllers");
  v5 = objc_msgSend(v4, "count");
  if (v5 < 1)
    return 0;
  v6 = v5;
  do
  {
    v2 = (id)objc_msgSend(v4, "objectAtIndex:", v6 - 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v7 = (void *)objc_msgSend(v2, "copyArchivableContext")) != 0)

    else
      v2 = 0;
    if (v6 < 2)
      break;
    --v6;
  }
  while (!v2);
  return v2;
}

- (void)_setupTabBarController
{
  SUTabBarController *v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  SUSectionsResponse *lastSectionsResponse;
  NSString *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  dispatch_time_t v29;
  int *v30;
  int *v31;
  uint64_t v32;
  _QWORD v33[5];
  _QWORD block[5];
  int v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = -[SUClientApplicationController tabBarController](self, "tabBarController");
  if (-[SUClientController storeFrontDidChangeSinceLastSuspend](self, "storeFrontDidChangeSinceLastSuspend"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v6 &= 2u;
    if (v6)
    {
      v35 = 138412290;
      v36 = objc_opt_class();
      LODWORD(v32) = 12;
      v30 = &v35;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v35, v32);
        free(v8);
        v30 = (int *)v9;
        SSFileLog();
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache", v30), "invalidateAllURLBags");
    v10 = 0;
    v11 = 1;
  }
  else if (self->_reloadSectionsOnNextLaunch || (lastSectionsResponse = self->_lastSectionsResponse) == 0)
  {
    v11 = 1;
    v10 = 1;
  }
  else
  {
    v13 = -[SUSectionsResponse storeFrontIdentifier](lastSectionsResponse, "storeFrontIdentifier");
    v10 = -[NSString isEqualToString:](v13, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "storeFrontIdentifier"));
    if ((v10 & 1) == 0)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = objc_msgSend(v14, "shouldLog");
      if (objc_msgSend(v14, "shouldLogToDisk"))
        v16 = v15 | 2;
      else
        v16 = v15;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v16 &= 2u;
      if (v16)
      {
        v35 = 138412290;
        v36 = objc_opt_class();
        LODWORD(v32) = 12;
        v30 = &v35;
        v17 = _os_log_send_and_compose_impl();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v35, v32);
          free(v18);
          v30 = (int *)v19;
          SSFileLog();
        }
      }
    }
    v11 = v10 ^ 1;
  }
  self->_reloadSectionsOnNextLaunch = 0;
  v20 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v30), "objectForKey:", CFSTR("SUNavigationAccountID"));
  v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "activeAccount"), "uniqueIdentifier");
  if ((void *)v21 != v20 && (objc_msgSend(v20, "isEqual:", v21) & 1) == 0)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v24 &= 2u;
    if (v24)
    {
      v25 = objc_opt_class();
      v35 = 138412290;
      v36 = v25;
      LODWORD(v32) = 12;
      v31 = &v35;
      v26 = _os_log_send_and_compose_impl();
      if (v26)
      {
        v27 = (void *)v26;
        v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v35, v32);
        free(v27);
        v31 = (int *)v28;
        SSFileLog();
      }
    }
    -[SUTabBarController resetToSystemDefaults](v3, "resetToSystemDefaults", v31);
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "launchedToTest") & 1) == 0)
  {
    if ((v11 & 1) != 0)
    {
      -[SUNetworkObserver startNetworkAvailabilityTimer](+[SUNetworkObserver sharedInstance](SUNetworkObserver, "sharedInstance"), "startNetworkAvailabilityTimer");
      -[SUTabBarController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 0, 0);
      -[SUTabBarController setSections:](v3, "setSections:", 0);
      -[SUClientApplicationController _presentSectionFetchUI](self, "_presentSectionFetchUI");
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_4;
      v33[3] = &unk_24DE7AF90;
      v33[4] = self;
      -[SUClientApplicationController _loadSectionsAllowingCache:withCompletionBlock:](self, "_loadSectionsAllowingCache:withCompletionBlock:", v10, v33);
    }
    else
    {
      if (!-[SUTabBarController sections](v3, "sections"))
      {
        -[SUTabBarController loadFromDefaultsAndSetSections:](v3, "loadFromDefaultsAndSetSections:", -[SUSectionsResponse sections](self->_lastSectionsResponse, "sections"));
        -[SUClientApplicationController setupUI](self, "setupUI");
      }
      v29 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke;
      block[3] = &unk_24DE7AF90;
      block[4] = self;
      dispatch_after(v29, MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __55__SUClientApplicationController__setupTabBarController__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_2;
  v3[3] = &unk_24DE7AF90;
  v3[4] = v1;
  return objc_msgSend(v1, "_loadSectionsAllowingCache:withCompletionBlock:", 1, v3);
}

void __55__SUClientApplicationController__setupTabBarController__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_3;
  block[3] = &unk_24DE7AF90;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __55__SUClientApplicationController__setupTabBarController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishedBackgroundLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
}

void __55__SUClientApplicationController__setupTabBarController__block_invoke_4(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_5;
  block[3] = &unk_24DE7AF90;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __55__SUClientApplicationController__setupTabBarController__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelSectionFetchPlaceholder");
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishedLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  -[SUTabBarController _showPreviewOverlay:animated:](-[SUClientApplicationController tabBarController](self, "tabBarController"), "_showPreviewOverlay:animated:", -[SUClientApplicationController _previewOverlayViewController](self, "_previewOverlayViewController"), a3);
}

- (BOOL)_showWildcatAccountViewController:(id)a3 animated:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(-[SUTabBarController overlayBackgroundViewController](self->_tabBarController, "overlayBackgroundViewController", a3, a4), "viewControllers");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
      v12 = (void *)objc_msgSend(v11, "backViewController");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v12, "topViewController");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    if (!v11)
      goto LABEL_14;
    objc_msgSend(v11, "setBackViewController:", a3);
  }
  else
  {
LABEL_14:
    -[SUClientApplicationController presentExternalURLViewController:](self, "presentExternalURLViewController:", a3);
  }
  return 1;
}

- (SUMediaPlayerViewController)_activeMediaPlayer
{
  return self->_activeMediaPlayer;
}

- (NSString)exitStoreButtonTitle
{
  return self->_exitStoreButtonTitle;
}

- (BOOL)shouldPrepareUserInterfaceWhenActivated
{
  return self->_shouldPrepareUserInterfaceWhenActivated;
}

- (void)setShouldPrepareUserInterfaceWhenActivated:(BOOL)a3
{
  self->_shouldPrepareUserInterfaceWhenActivated = a3;
}

@end
