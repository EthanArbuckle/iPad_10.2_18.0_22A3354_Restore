@implementation SUStoreController

- (SUStoreController)init
{
  SUStoreController *v2;
  SUClient *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[6];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUStoreController;
  v2 = -[SUStoreController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SUClient);
    v2->_client = v3;
    -[SUClient setDelegate:](v3, "setDelegate:", v2);
    +[SUClient setSharedClient:](SUClient, "setSharedClient:", v2->_client);
    -[SUPurchaseManager setDelegate:](-[SUClientInterface purchaseManager](-[SUClient clientInterface](v2->_client, "clientInterface"), "purchaseManager"), "setDelegate:", v2);
    v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance"), "copyProtocolConditionalContext");
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3052000000;
    v8[3] = __Block_byref_object_copy__41;
    v8[4] = __Block_byref_object_dispose__41;
    v8[5] = v2;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __25__SUStoreController_init__block_invoke;
    v7[3] = &unk_24DE7D370;
    v7[4] = v8;
    objc_msgSend(v4, "setItemLookupBlock:", v7);
    objc_msgSend(MEMORY[0x24BEB1F70], "setDefaultConditionalContext:", v4);

    +[SURemoteNotificationController sharedInstance](SURemoteNotificationController, "sharedInstance");
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__selectFooterSectionNotification_, *MEMORY[0x24BEC8B18], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__storeFrontChangedNotification_, *MEMORY[0x24BEB21E8], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__bagDidLoadNotification_, *MEMORY[0x24BEC8B38], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__restrictionsChangedNotification_, *MEMORY[0x24BE63740], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__accountControllerDisappearedNotification_, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__reloadForNetworkTypeChange_, CFSTR("SUNetworkTypeChangedNotification"), 0);
    _Block_object_dispose(v8, 8);
  }
  return v2;
}

uint64_t __25__SUStoreController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "libraryContainsItemIdentifier:", a2);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  SUPurchaseManager *v5;
  objc_super v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B18], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB21E8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B38], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUNetworkTypeChangedNotification"), 0);
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance"), "copyProtocolConditionalContext");
  objc_msgSend(MEMORY[0x24BEB1F70], "setDefaultConditionalContext:", v4);

  v5 = -[SUClientInterface purchaseManager](-[SUClient clientInterface](self->_client, "clientInterface"), "purchaseManager");
  if ((SUStoreController *)-[SUPurchaseManager delegate](v5, "delegate") == self)
    -[SUPurchaseManager setDelegate:](v5, "setDelegate:", 0);
  +[SUClient setSharedClient:](SUClient, "setSharedClient:", 0);
  -[SUClient setDelegate:](self->_client, "setDelegate:", 0);

  self->_client = 0;
  -[SUStoreController tearDownUI](self, "tearDownUI");
  -[SUStoreController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");

  v6.receiver = self;
  v6.super_class = (Class)SUStoreController;
  -[SUStoreController dealloc](&v6, sel_dealloc);
}

+ (id)sharedInstance
{
  return (id)__SharedInstance_2;
}

+ (void)setSharedInstance:(id)a3
{
  if ((id)__SharedInstance_2 != a3)
  {

    __SharedInstance_2 = (uint64_t)a3;
  }
}

- (BOOL)application:(id)a3 handleOpenURL:(id)a4
{
  if (self->_lastSectionsResponse)
    -[SUStoreController handleApplicationURL:](self, "handleApplicationURL:", a4);
  else
    -[SUStoreController setLaunchURL:](self, "setLaunchURL:", a4);
  return 1;
}

- (void)cancelAllOperations
{
  -[SUStoreController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "cancelAllOperations");
}

- (void)connect
{
  void *v3;
  uint64_t v4;
  NSString *localStoreFrontAtLastSuspend;
  uint64_t v6;
  NSString *synchedStoreFrontAtLastSuspend;
  char v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL reloadSectionsOnNextLaunch;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  SUStoreController *v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  int v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC8C20], "invalidateCurrentMap");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "reloadNetworkType");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "existingDefaultStore"), "reloadAccounts");
  if (self->_localStoreFrontAtLastSuspend || self->_synchedStoreFrontAtLastSuspend)
  {
    if (((v3 = (void *)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"),
           objc_msgSend(v3, "reloadStoreFrontIdentifier"),
           v4 = objc_msgSend(v3, "storeFrontIdentifier"),
           localStoreFrontAtLastSuspend = self->_localStoreFrontAtLastSuspend,
           localStoreFrontAtLastSuspend == (NSString *)v4)
       || -[NSString isEqualToString:](localStoreFrontAtLastSuspend, "isEqualToString:"))
      && (!objc_msgSend(v3, "isStoreFrontIdentifierTransient")
       || (v6 = objc_msgSend(v3, "synchedStoreFrontIdentifier"),
           synchedStoreFrontAtLastSuspend = self->_synchedStoreFrontAtLastSuspend,
           synchedStoreFrontAtLastSuspend == (NSString *)v6)
       || -[NSString isEqualToString:](synchedStoreFrontAtLastSuspend, "isEqualToString:")))
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v11 &= 2u;
      if (v11)
      {
        v34 = 138412290;
        v35 = objc_opt_class();
        LODWORD(v31) = 12;
        v30 = &v34;
        v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v34, v31);
          free(v13);
          v30 = (int *)v14;
          SSFileLog();
        }
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache", v30), "invalidateAllURLBags");
      v8 = 1;
    }
    v15 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__storeFrontChangedNotification_, *MEMORY[0x24BEB21E8], 0);

    self->_localStoreFrontAtLastSuspend = 0;
    self->_synchedStoreFrontAtLastSuspend = 0;
    if ((v8 & 1) != 0)
    {
      v16 = 0;
LABEL_23:
      reloadSectionsOnNextLaunch = 1;
      goto LABEL_24;
    }
  }
  if (!self->_lastSectionsResponse)
  {
    v16 = 1;
    goto LABEL_23;
  }
  reloadSectionsOnNextLaunch = self->_reloadSectionsOnNextLaunch;
  v16 = 1;
LABEL_24:
  self->_reloadSectionsOnNextLaunch = 0;
  v18 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("SUNavigationAccountID"));
  v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "activeAccount"), "uniqueIdentifier");
  if ((void *)v19 != v18 && (objc_msgSend(v18, "isEqual:", v19) & 1) == 0)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v21 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v20, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v22 &= 2u;
    if (v22)
    {
      v23 = objc_opt_class();
      v34 = 138412290;
      v35 = v23;
      LODWORD(v31) = 12;
      v30 = &v34;
      v24 = _os_log_send_and_compose_impl();
      if (v24)
      {
        v25 = (void *)v24;
        v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v34, v31);
        free(v25);
        v30 = (int *)v26;
        SSFileLog();
      }
    }
    -[SUTabBarController resetToSystemDefaults](self->_tabBarController, "resetToSystemDefaults", v30);
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "launchedToTest") & 1) == 0)
  {
    if (reloadSectionsOnNextLaunch)
    {
      -[SUNetworkObserver startNetworkAvailabilityTimer](+[SUNetworkObserver sharedInstance](SUNetworkObserver, "sharedInstance"), "startNetworkAvailabilityTimer");
      -[SUTabBarController dismissViewControllerAnimated:completion:](self->_tabBarController, "dismissViewControllerAnimated:completion:", 0, 0);
      -[SUTabBarController setSections:](self->_tabBarController, "setSections:", 0);
      -[SUStoreController _presentSectionFetchUI](self, "_presentSectionFetchUI");
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __28__SUStoreController_connect__block_invoke_2;
      v32[3] = &unk_24DE7AF90;
      v32[4] = self;
      v27 = v32;
      v28 = self;
      v29 = v16;
    }
    else
    {
      if (!-[SUTabBarController sections](self->_tabBarController, "sections"))
      {
        -[SUTabBarController setSections:](self->_tabBarController, "setSections:", -[SUSectionsResponse sections](self->_lastSectionsResponse, "sections"));
        -[SUTabBarController loadFromDefaults](self->_tabBarController, "loadFromDefaults");
        -[SUStoreController setupUI](self, "setupUI");
      }
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __28__SUStoreController_connect__block_invoke;
      v33[3] = &unk_24DE7AF90;
      v33[4] = self;
      v27 = v33;
      v28 = self;
      v29 = 1;
    }
    -[SUStoreController _loadSectionsAllowingCache:withCompletionBlock:](v28, "_loadSectionsAllowingCache:withCompletionBlock:", v29, v27);
  }
}

uint64_t __28__SUStoreController_connect__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mainThreadProxy"), "_handleFinishedBackgroundLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __28__SUStoreController_connect__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mainThreadProxy"), "_handleFinishedLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
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
    if (-[SUStoreController isTabBarControllerLoaded](self, "isTabBarControllerLoaded")
      && (v6 = -[UINavigationController topViewController](-[SUStoreController topNavigationController](self, "topNavigationController"), "topViewController"), (objc_opt_respondsToSelector() & 1) != 0))
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

- (void)dismissOverlayBackgroundViewController
{
  -[SUTabBarController dismissOverlayBackgroundViewController](self->_tabBarController, "dismissOverlayBackgroundViewController");
}

- (void)exitStoreAfterDialogsDismiss
{
  if (-[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance"), "numberOfPendingDialogs"))
  {
    -[SUStoreController _cancelSuspendAfterDialogsDismissed](self, "_cancelSuspendAfterDialogsDismissed");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__dialogDidFinishNotification_, CFSTR("SUDialogDidFinishNotification"), 0);
  }
  else
  {
    -[SUStoreController exitStoreWithReason:](self, "exitStoreWithReason:", 0);
  }
}

- (void)exitStoreWithReason:(int64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "suspend");
}

- (BOOL)isStoreEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  char v8;
  CFIndex v9;
  CFIndex v10;
  uint64_t v11;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v3 = objc_msgSend(v2, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0));
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = (const __CFArray *)objc_msgSend(+[SUClient sharedClient](SUClient, "sharedClient"), "assetTypes");
  if (!v5)
    return 1;
  v6 = v5;
  Count = CFArrayGetCount(v5);
  v8 = Count == 0;
  if (Count >= 1)
  {
    v9 = Count;
    v10 = 0;
    v8 = 0;
    do
    {
      CFArrayGetValueAtIndex(v6, v10);
      v11 = SSDownloadKindForAssetType();
      if ((v8 & 1) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend((id)objc_msgSend(v4, "networkConstraintsForDownloadKind:", v11), "isAnyNetworkTypeEnabled");
      ++v10;
    }
    while (v9 != v10);
  }
  return v8;
}

- (BOOL)isTabBarControllerLoaded
{
  return self->_tabBarController != 0;
}

- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3
{
  return 0;
}

- (BOOL)matchesClientApplication:(id)a3
{
  return 1;
}

- (id)overlayBackgroundViewController
{
  return -[SUTabBarController overlayBackgroundViewController](self->_tabBarController, "overlayBackgroundViewController");
}

- (id)overlayConfigurationForStorePage:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *overlayConfigurations;
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

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "URLRequestProperties");
  v5 = objc_msgSend(v4, "URLBagKey");
  v6 = objc_msgSend(v4, "URL");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  overlayConfigurations = self->_overlayConfigurations;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](overlayConfigurations, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = *(_QWORD *)v15;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v10)
      objc_enumerationMutation(overlayConfigurations);
    v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
    if (v6)
    {
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "matchesURL:", v6) & 1) != 0)
        return v12;
    }
    if (v5 && (objc_msgSend(v12, "matchesURLBagKey:", v5) & 1) != 0)
      return v12;
    if (v9 == ++v11)
    {
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](overlayConfigurations, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)prepareForSuspend
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  MFMailComposeViewController *mailComposeViewController;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (self->_mailComposeViewController)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = *MEMORY[0x24BDF7608];
    v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v4 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__SUStoreController_prepareForSuspend__block_invoke;
    v11[3] = &unk_24DE7AF68;
    v11[4] = &v12;
    v5 = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v11);
    v13[3] = v5;
    mailComposeViewController = self->_mailComposeViewController;
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __38__SUStoreController_prepareForSuspend__block_invoke_2;
    v10[3] = &unk_24DE7D398;
    v10[4] = &v12;
    -[MFMailComposeViewController autosaveWithHandler:](mailComposeViewController, "autosaveWithHandler:", v10);
    _Block_object_dispose(&v12, 8);
  }
  objc_msgSend(MEMORY[0x24BDB7470], "sharedURLCache");
  ISURLCacheSaveMemoryCache();
  if (-[SUStoreController _isAccountViewControllerVisible](self, "_isAccountViewControllerVisible"))
    -[SUTabBarController dismissViewControllerAnimated:completion:](self->_tabBarController, "dismissViewControllerAnimated:completion:", 0, 0);
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");

  self->_localStoreFrontAtLastSuspend = (NSString *)(id)objc_msgSend(v7, "storeFrontIdentifier");
  v8 = (id)objc_msgSend(v7, "synchedStoreFrontIdentifier");
  self->_synchedStoreFrontAtLastSuspend = (NSString *)v8;
  if ((unint64_t)self->_localStoreFrontAtLastSuspend | (unint64_t)v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x24BEB21E8], 0);
  }
  -[SUStoreController _saveArchivedNavigationPath](self, "_saveArchivedNavigationPath");
  -[SUStoreController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");
}

uint64_t __38__SUStoreController_prepareForSuspend__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x24BDF7608];
  return result;
}

uint64_t __38__SUStoreController_prepareForSuspend__block_invoke_2(uint64_t a1, const void *a2)
{
  const __CFString *v3;
  uint64_t result;

  v3 = (const __CFString *)*MEMORY[0x24BDBD580];
  CFPreferencesSetAppValue(CFSTR("SUAutosavedMessageID"), a2, (CFStringRef)*MEMORY[0x24BDBD580]);
  CFPreferencesAppSynchronize(v3);
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x24BDF7608];
  return result;
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
    && (v6 = -[SUStoreController overlayConfigurationForStorePage:](self, "overlayConfigurationForStorePage:", v5)) != 0)
  {
    -[UIViewController presentViewController:inOverlayWithConfiguration:](-[SUStoreController tabBarController](self, "tabBarController"), "presentViewController:inOverlayWithConfiguration:", a3, v6);
  }
  else
  {
    v7 = -[SUStoreController tabBarController](self, "tabBarController");
    -[SUTabBarController setTransientViewController:animated:](v7, "setTransientViewController:animated:", a3, 0);
    if (-[SUTabBarController presentedViewController](v7, "presentedViewController"))
      -[SUTabBarController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  return -[SUTabBarController presentOverlayBackgroundViewController:](self->_tabBarController, "presentOverlayBackgroundViewController:", a3);
}

- (BOOL)reloadSectionWithIdentifier:(id)a3 url:(id)a4
{
  -[SUTabBarController reloadSectionWithIdentifier:URL:](-[SUStoreController tabBarController](self, "tabBarController"), "reloadSectionWithIdentifier:URL:", a3, a4);
  return 1;
}

- (BOOL)selectSectionWithIdentifier:(id)a3
{
  -[SUTabBarController setSelectedIdentifier:](-[SUStoreController tabBarController](self, "tabBarController"), "setSelectedIdentifier:", a3);
  return 1;
}

- (BOOL)showDialogForCapabilities:(id)a3 mismatches:(id)a4
{
  return 0;
}

- (void)tearDownUI
{
  -[SUStoreController _cancelSuspendAfterDialogsDismissed](self, "_cancelSuspendAfterDialogsDismissed");
  -[SUStoreController _saveArchivedNavigationPath](self, "_saveArchivedNavigationPath");
  -[SUTabBarController setDelegate:](self->_tabBarController, "setDelegate:", 0);
  if (-[SUTabBarController isViewLoaded](self->_tabBarController, "isViewLoaded"))
    objc_msgSend((id)-[SUTabBarController view](self->_tabBarController, "view"), "removeFromSuperview");

  self->_tabBarController = 0;
}

- (NSString)defaultPNGNameForSuspend
{
  return (NSString *)objc_msgSend(-[SUStoreController _resumableViewController](self, "_resumableViewController"), "defaultPNGName");
}

- (id)storeContentLanguage
{
  id v3;
  id result;
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (!self->_storeFrontLanguages)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE70]);
    self->_storeFrontLanguages = (NSDictionary *)objc_msgSend(v3, "initWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("StoreFrontLanguages"), CFSTR("plist")));
  }
  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "storeFrontIdentifier");
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(result, "rangeOfString:options:range:", CFSTR("-"), 0, 0, objc_msgSend(result, "length"));
    v7 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR(","), 0, 0, objc_msgSend(v5, "length"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        return (id)objc_msgSend(-[NSDictionary objectForKey:](self->_storeFrontLanguages, "objectForKey:", v5), "objectForKey:", CFSTR("LanguageCode"));
      v6 = v7;
    }
    v5 = (id)objc_msgSend(v5, "substringToIndex:", v6);
    return (id)objc_msgSend(-[NSDictionary objectForKey:](self->_storeFrontLanguages, "objectForKey:", v5), "objectForKey:", CFSTR("LanguageCode"));
  }
  return result;
}

- (SUTabBarController)tabBarController
{
  SUTabBarController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  SUNavigationController *v9;

  if (!self->_tabBarController)
  {
    v3 = -[SUTabBarController initWithClientInterface:]([SUTabBarController alloc], "initWithClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
    self->_tabBarController = v3;
    -[SUTabBarController setDelegate:](v3, "setDelegate:", self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    objc_msgSend((id)-[SUTabBarController view](self->_tabBarController, "view"), "setFrame:", v4, v5, v6, v7);
    if (objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG"))
    {
      v8 = (void *)objc_msgSend(-[SUClient viewControllerFactory](self->_client, "viewControllerFactory"), "newPlaceholderViewController");
      objc_msgSend(v8, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
      v9 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v8);
      -[SUNavigationController setClientInterface:](v9, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
      -[SUTabBarController setTransientViewController:](self->_tabBarController, "setTransientViewController:", v9);

    }
  }
  return self->_tabBarController;
}

- (UINavigationController)topNavigationController
{
  UINavigationController *v3;
  UINavigationController *i;

  v3 = (UINavigationController *)-[SUTabBarController transientViewController](-[SUStoreController tabBarController](self, "tabBarController"), "transientViewController");
  if (!v3)
    v3 = -[UITabBarController selectedNavigationController](-[SUStoreController tabBarController](self, "tabBarController"), "selectedNavigationController");
  for (i = v3; -[UINavigationController presentedViewController](i, "presentedViewController"); v3 = i)
    i = (UINavigationController *)-[UINavigationController presentedViewController](v3, "presentedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return (UINavigationController *)-[UINavigationController navigationController](v3, "navigationController");
}

- (id)newScriptInterface
{
  return objc_alloc_init(SUScriptInterface);
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
    -[SUStoreController _reloadForStorefrontChange](self, "_reloadForStorefrontChange", v10);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3), "postNotificationName:object:", CFSTR("SUStoreEnabledChangedNotification"), self);
}

- (void)_bagDidLoadNotification:(id)a3
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
  if (-[SUStoreController _isAccountViewControllerVisible](self, "_isAccountViewControllerVisible", a3))
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
        SSFileLog();
        -[SUStoreController _reloadOverlayConfigurations](self, "_reloadOverlayConfigurations", v9);
        return;
      }
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUStoreEnabledChangedNotification"), self);
  }
  -[SUStoreController _reloadOverlayConfigurations](self, "_reloadOverlayConfigurations", v10);
}

- (void)_dialogDidFinishNotification:(id)a3
{
  if (!-[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance", a3), "numberOfPendingDialogs"))-[SUStoreController exitStoreWithReason:](self, "exitStoreWithReason:", 0);
}

- (void)_restrictionsChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUStoreController__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __54__SUStoreController__restrictionsChangedNotification___block_invoke(uint64_t result)
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
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 24))
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
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "setSections:", objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "sections", v8));
  }
  return result;
}

- (void)_mainThreadStoreFrontChangedNotification:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[SUStoreController _isAccountViewControllerVisible](self, "_isAccountViewControllerVisible", a3))
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
      v10 = 138412290;
      v11 = objc_opt_class();
      LODWORD(v9) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v10, v9);
        free(v8);
        SSFileLog();
      }
    }
    self->_reloadForStorefrontChangeAfterAccountSetup = 1;
  }
  else
  {
    -[SUStoreController _reloadForStorefrontChange](self, "_reloadForStorefrontChange");
  }
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
  objc_msgSend((id)-[SUStoreController mainThreadProxy](self, "mainThreadProxy"), "_mainThreadStoreFrontChangedNotification:", a3);
}

- (BOOL)client:(id)a3 openInternalURL:(id)a4
{
  -[SUStoreController handleApplicationURL:](self, "handleApplicationURL:", a4);
  return 1;
}

- (BOOL)client:(id)a3 presentAccountViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  SUNavigationController *v8;
  BOOL v9;
  BOOL v10;

  v5 = a5;
  v8 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", a4);
  -[SUNavigationController setClientInterface:](v8, "setClientInterface:", objc_msgSend(a3, "clientInterface"));
  -[SUNavigationController setNavigationBarHidden:](v8, "setNavigationBarHidden:", 1);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
    v9 = -[SUStoreController _showWildcatAccountViewController:animated:](self, "_showWildcatAccountViewController:animated:", v8, v5);
  else
    v9 = -[SUStoreController client:presentModalViewController:animated:](self, "client:presentModalViewController:animated:", a3, v8, v5);
  v10 = v9;

  return v10;
}

- (BOOL)client:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  SUTabBarController *i;
  SUTabBarController *v8;

  v5 = a5;
  for (i = -[SUStoreController tabBarController](self, "tabBarController", a3);
        ;
        i = (SUTabBarController *)-[SUTabBarController presentedViewController](v8, "presentedViewController"))
  {
    v8 = i;
    if (!-[SUTabBarController presentedViewController](i, "presentedViewController"))
      break;
  }
  -[UIViewController transitionSafePresentModalViewController:animated:](v8, "transitionSafePresentModalViewController:animated:", a4, v5);
  return v8 != 0;
}

- (id)downloadQueueForClient:(id)a3 downloadKinds:(id)a4
{
  return 0;
}

- (id)topViewControllerForClient:(id)a3
{
  return -[UINavigationController topViewController](-[SUStoreController topNavigationController](self, "topNavigationController", a3), "topViewController");
}

- (void)tabBarController:(id)a3 didEndCustomizingViewControllers:(id)a4 changed:(BOOL)a5
{
  if (a5)
    -[SUTabBarController saveOrderingToDefaults](self->_tabBarController, "saveOrderingToDefaults", a3, a4);
}

- (void)handleApplicationURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = objc_msgSend(a3, "storeURLType");
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  if (v5 != 1 || v6 == 1)
  {
    if (v5 == 2)
    {
      -[SUStoreController _handleAccountURL:](self, "_handleAccountURL:", a3);
    }
    else
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(a3, "schemeSwizzledURL"));
      -[SUStoreController _defaultHandleApplicationURLRequestProperties:](self, "_defaultHandleApplicationURLRequestProperties:", v7);

    }
  }
  else
  {
    -[SUStoreController _handleSearchURL:](self, "_handleSearchURL:", a3);
  }
}

- (void)setupUI
{
  NSURL *v3;

  v3 = -[SUStoreController launchURL](self, "launchURL");
  if (v3)
    -[SUStoreController handleApplicationURL:](self, "handleApplicationURL:", v3);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "shouldLaunchSafe") & 1) == 0)
    -[SUStoreController composeEmailByRestoringAutosavedMessage](self, "composeEmailByRestoringAutosavedMessage");
}

- (void)_cancelLoadSectionsOperation
{
  -[ISOperation setCompletionBlock:](self->_loadSectionsOperation, "setCompletionBlock:", 0);
  -[ISOperation cancel](self->_loadSectionsOperation, "cancel");

  self->_loadSectionsOperation = 0;
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
  -[SUStoreController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation", v12);
}

- (void)_handleFinishedLoadSectionsOperation:(id)a3
{
  if ((objc_msgSend(a3, "success") & 1) != 0)
    -[SUStoreController _reloadWithSectionsResponse:](self, "_reloadWithSectionsResponse:", objc_msgSend(a3, "sectionsResponse"));
  else
    -[SUStoreController _handleSectionsLoadFailedWithError:](self, "_handleSectionsLoadFailedWithError:", objc_msgSend(a3, "error"));
  -[SUStoreController _cancelLoadSectionsOperation](self, "_cancelLoadSectionsOperation");
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
    -[SUStoreController _retrySectionsAfterNetworkTransition](self, "_retrySectionsAfterNetworkTransition");
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
    -[SUStoreController exitStoreAfterDialogsDismiss](self, "exitStoreAfterDialogsDismiss");
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
    v8 = -[SULoadSectionsOperation initWithClientInterface:]([SULoadSectionsOperation alloc], "initWithClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
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
  SUNavigationController *v3;
  id v4;

  v4 = (id)objc_msgSend(-[SUClient viewControllerFactory](self->_client, "viewControllerFactory"), "newPlaceholderViewController");
  objc_msgSend(v4, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
  v3 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v4);
  -[SUNavigationController setClientInterface:](v3, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
  objc_msgSend(v4, "setSkLoading:", 1);
  -[SUTabBarController setTransientViewController:animated:](self->_tabBarController, "setTransientViewController:animated:", v3, 0);

}

- (BOOL)_reloadForStorefrontChange
{
  _QWORD v4[5];

  -[SUTabBarController dismissViewControllerAnimated:completion:](self->_tabBarController, "dismissViewControllerAnimated:completion:", 0, 0);
  -[SUTabBarController setViewControllers:](self->_tabBarController, "setViewControllers:", 0);
  -[SUStoreController _presentSectionFetchUI](self, "_presentSectionFetchUI");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__SUStoreController__reloadForStorefrontChange__block_invoke;
  v4[3] = &unk_24DE7AF90;
  v4[4] = self;
  return -[SUStoreController _loadSectionsAllowingCache:withCompletionBlock:](self, "_loadSectionsAllowingCache:withCompletionBlock:", 0, v4);
}

uint64_t __47__SUStoreController__reloadForStorefrontChange__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mainThreadProxy"), "_handleFinishedLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
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
    -[SUStoreController _presentSectionFetchUI](self, "_presentSectionFetchUI", v9);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__SUStoreController__retrySectionsAfterNetworkTransition__block_invoke;
    v11[3] = &unk_24DE7AF90;
    v11[4] = self;
    -[SUStoreController _loadSectionsAllowingCache:withCompletionBlock:](self, "_loadSectionsAllowingCache:withCompletionBlock:", 1, v11);
  }
}

uint64_t __57__SUStoreController__retrySectionsAfterNetworkTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mainThreadProxy"), "_handleFinishedLoadSectionsOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_cancelSuspendAfterDialogsDismissed
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUDialogDidFinishNotification"), 0);
}

- (void)_defaultHandleApplicationURLRequestProperties:(id)a3
{
  uint64_t v5;
  SUNavigationController *v6;
  id v7;

  v5 = objc_msgSend(-[SUTabBarController selectedViewController](-[SUStoreController tabBarController](self, "tabBarController"), "selectedViewController"), "section");
  v7 = (id)objc_msgSend(-[SUClient viewControllerFactory](self->_client, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v7, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
  objc_msgSend(v7, "setExternalRequest:", 1);
  objc_msgSend(v7, "setURLRequestProperties:", a3);
  v6 = -[SUNavigationController initWithSection:rootViewController:]([SUNavigationController alloc], "initWithSection:rootViewController:", v5, v7);
  -[SUNavigationController setClientInterface:](v6, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
  -[SUStoreController presentExternalURLViewController:](self, "presentExternalURLViewController:", v6);

}

- (void)_handleAccountURL:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *UniqueIdentifierFromValue;
  void *v10;
  SUAccountViewController *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = 1;
  v14 = (id)objc_msgSend(a3, "copyQueryStringDictionaryWithUnescapedValues:", 1);
  v5 = objc_msgSend(v14, "objectForKey:", CFSTR("url"));
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v4 = v6 == 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v14, "objectForKey:", CFSTR("continuation"));
  if (v7)
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v7, 1);
  else
    v8 = 0;
  if (objc_msgSend(v14, "objectForKey:", CFSTR("dsid")))
    UniqueIdentifierFromValue = (void *)SSAccountGetUniqueIdentifierFromValue();
  else
    UniqueIdentifierFromValue = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", objc_msgSend(v6, "schemeSwizzledURL"));
  objc_msgSend(v10, "setRequestParameters:", v8);
  v11 = objc_alloc_init(SUAccountViewController);
  -[SUViewController setClientInterface:](v11, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
  -[SUStorePageViewController setExternalRequest:](v11, "setExternalRequest:", 1);
  -[SUStorePageViewController setURLRequestProperties:](v11, "setURLRequestProperties:", v10);
  -[SUAccountViewController setStyle:](v11, "setStyle:", v4);
  if (UniqueIdentifierFromValue && objc_msgSend(UniqueIdentifierFromValue, "unsignedLongLongValue"))
  {
    v12 = (void *)-[SSAuthenticationContext mutableCopy](-[SUStorePageViewController authenticationContext](v11, "authenticationContext"), "mutableCopy");
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "setRequiredUniqueIdentifier:", UniqueIdentifierFromValue);
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccountIdentifier:", UniqueIdentifierFromValue);
    }
    -[SUStorePageViewController setAuthenticationContext:](v11, "setAuthenticationContext:", v13);

  }
  objc_msgSend(+[SUClient sharedClient](SUClient, "sharedClient"), "enterAccountFlowWithViewController:animated:", v11, 1);

}

- (void)_handleSearchURL:(id)a3
{
  SUTabBarController *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UIViewController *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[SUStoreController tabBarController](self, "tabBarController");
  v6 = -[SUTabBarController sections](v5, "sections");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
      v12 = (void *)objc_msgSend(v11, "searchFieldConfiguration");
      if (v12)
      {
        if (objc_msgSend(v12, "location") != 2)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    if (!v11)
      goto LABEL_13;
    -[SUTabBarController setSelectedIdentifier:](v5, "setSelectedIdentifier:", objc_msgSend(v11, "identifier"));
  }
  else
  {
LABEL_13:
    -[SUTabBarController selectSectionOfType:](v5, "selectSectionOfType:", 1);
  }
  v13 = -[UINavigationController topViewController](-[SUStoreController topNavigationController](self, "topNavigationController"), "topViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIViewController handleApplicationURL:](v13, "handleApplicationURL:", objc_msgSend(a3, "schemeSwizzledURL"));
}

- (BOOL)_isAccountViewControllerVisible
{
  void *v2;

  v2 = (void *)-[SUTabBarController presentedViewController](self->_tabBarController, "presentedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "topViewController");
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)_reloadOverlayConfigurations
{
  uint64_t v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  SUOverlayConfiguration *v10;
  SUOverlayConfiguration *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1
    && (v3 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0),
        v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v3), "valueForKey:", CFSTR("p2-overlay-actions")), objc_msgSend(v4, "count")))
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = -[SUOverlayConfiguration initWithDictionary:]([SUOverlayConfiguration alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          if (v10)
          {
            v11 = v10;
            -[NSArray addObject:](v5, "addObject:", v10);

          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }

  self->_overlayConfigurations = v5;
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
  -[SUStoreController setupUI](self, "setupUI");
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

- (void)_saveArchivedNavigationPath
{
  if ((objc_msgSend(+[SUClient sharedClient](SUClient, "sharedClient"), "dontSaveNavigationPath") & 1) == 0
    && self->_lastSectionsResponse)
  {
    -[SUTabBarController saveToDefaults](self->_tabBarController, "saveToDefaults");
  }
  objc_msgSend(+[SUClient sharedClient](SUClient, "sharedClient"), "setDontSaveNavigationPath:", 0);
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
    -[SUStoreController presentExternalURLViewController:](self, "presentExternalURLViewController:", a3);
  }
  return 1;
}

- (void)composeEmailByRestoringAutosavedMessage
{
  const __CFString *v3;
  objc_class *v4;
  MFMailComposeViewController *v5;
  id v6;

  if (CPCanSendMail())
  {
    if (!-[SUStoreController isComposingEmail](self, "isComposingEmail"))
    {
      v3 = (const __CFString *)*MEMORY[0x24BDBD580];
      v6 = (id)CFPreferencesCopyAppValue(CFSTR("SUAutosavedMessageID"), (CFStringRef)*MEMORY[0x24BDBD580]);
      if (v6)
      {
        v4 = (objc_class *)ISWeakLinkedClassForString();
        if (-[objc_class hasAutosavedMessageWithIdentifier:](v4, "hasAutosavedMessageWithIdentifier:", v6))
        {
          v5 = (MFMailComposeViewController *)objc_alloc_init(v4);
          self->_mailComposeViewController = v5;
          -[MFMailComposeViewController setKeyboardVisible:](v5, "setKeyboardVisible:", 1);
          -[MFMailComposeViewController setMailComposeDelegate:](self->_mailComposeViewController, "setMailComposeDelegate:", self);
          -[MFMailComposeViewController recoverAutosavedMessageWithIdentifier:](self->_mailComposeViewController, "recoverAutosavedMessageWithIdentifier:", v6);
          -[SUStoreController presentMailComposeViewController:animated:](self, "presentMailComposeViewController:animated:", self->_mailComposeViewController, 0);
        }
        CFPreferencesSetAppValue(CFSTR("SUAutosavedMessageID"), 0, v3);
        CFPreferencesAppSynchronize(v3);

      }
    }
  }
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  MFMailComposeViewController *v7;

  if (CPCanSendMail())
  {
    if (!-[SUStoreController isComposingEmail](self, "isComposingEmail"))
    {
      v7 = (MFMailComposeViewController *)objc_alloc_init((Class)ISWeakLinkedClassForString());
      self->_mailComposeViewController = v7;
      -[MFMailComposeViewController setKeyboardVisible:](v7, "setKeyboardVisible:", 1);
      -[MFMailComposeViewController setMailComposeDelegate:](self->_mailComposeViewController, "setMailComposeDelegate:", self);
      -[MFMailComposeViewController setSubject:](self->_mailComposeViewController, "setSubject:", a3);
      -[MFMailComposeViewController setMessageBody:isHTML:](self->_mailComposeViewController, "setMessageBody:isHTML:", a4, 1);
      -[SUStoreController presentMailComposeViewController:animated:](self, "presentMailComposeViewController:animated:", self->_mailComposeViewController, 1);
    }
  }
}

- (void)dismissMailComposeViewControllerAnimated:(BOOL)a3
{
  -[SUTabBarController dismissViewControllerAnimated:completion:](-[SUStoreController tabBarController](self, "tabBarController"), "dismissViewControllerAnimated:completion:", a3, 0);
}

- (BOOL)isComposingEmail
{
  return self->_mailComposeViewController != 0;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[SUStoreController dismissMailComposeViewControllerAnimated:](self, "dismissMailComposeViewControllerAnimated:", 1, a4, a5);

  self->_mailComposeViewController = 0;
}

- (void)presentMailComposeViewController:(id)a3 animated:(BOOL)a4
{
  -[UINavigationController presentViewController:animated:completion:](-[SUStoreController topNavigationController](self, "topNavigationController"), "presentViewController:animated:completion:", a3, a4, 0);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
