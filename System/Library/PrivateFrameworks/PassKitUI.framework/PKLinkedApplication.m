@implementation PKLinkedApplication

+ (id)_openOptionsWithURL:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D22D78]);
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKLinkedApplication)init
{
  return -[PKLinkedApplication initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:](self, "initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:", 0, 0, 0, 0);
}

- (PKLinkedApplication)initWithPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKLinkedApplication *v8;

  v4 = a3;
  objc_msgSend(v4, "storeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemAppBundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLaunchURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKLinkedApplication initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:](self, "initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:", v5, v6, v7, 0);
  return v8;
}

- (PKLinkedApplication)initWithStoreIDs:(id)a3 defaultLaunchURL:(id)a4
{
  return -[PKLinkedApplication initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:](self, "initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:", a3, 0, a4, 0);
}

- (PKLinkedApplication)initWithApplicationIdentifiers:(id)a3 storeIDs:(id)a4 defaultLaunchURL:(id)a5
{
  return -[PKLinkedApplication initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:](self, "initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:", a4, 0, a5, a3);
}

- (PKLinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5
{
  return -[PKLinkedApplication initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:](self, "initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:applicationIdentifiers:", a3, a4, a5, 0);
}

- (PKLinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5 applicationIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKLinkedApplication *v14;
  PKLinkedApplication *v15;
  uint64_t v16;
  NSHashTable *observers;
  NSMutableArray *v18;
  NSMutableArray *completionHandlers;
  uint64_t v20;
  NSArray *storeIDs;
  uint64_t v22;
  NSArray *systemAppBundleIdentifiers;
  uint64_t v24;
  NSURL *defaultLaunchURL;
  uint64_t v26;
  NSArray *applicationIdentifiers;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *appLookupQueue;
  objc_super v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)PKLinkedApplication;
  v14 = -[PKLinkedApplication init](&v34, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_pendingLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v16 = objc_claimAutoreleasedReturnValue();
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v15->_completionHandlers;
    v15->_completionHandlers = v18;

    v20 = objc_msgSend(v10, "copy");
    storeIDs = v15->_storeIDs;
    v15->_storeIDs = (NSArray *)v20;

    v22 = objc_msgSend(v11, "copy");
    systemAppBundleIdentifiers = v15->_systemAppBundleIdentifiers;
    v15->_systemAppBundleIdentifiers = (NSArray *)v22;

    v24 = objc_msgSend(v12, "copy");
    defaultLaunchURL = v15->_defaultLaunchURL;
    v15->_defaultLaunchURL = (NSURL *)v24;

    v26 = objc_msgSend(v13, "copy");
    applicationIdentifiers = v15->_applicationIdentifiers;
    v15->_applicationIdentifiers = (NSArray *)v26;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v15, sel_installedApplicationsDidChangeNotification_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v28, "addObserver:selector:name:object:", v15, sel_installedApplicationsDidChangeNotification_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    *(_WORD *)&v15->_shouldApplyMask = 257;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v29, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = dispatch_queue_create("com.apple.passkitui.system.app.lookup", v30);
    appLookupQueue = v15->_appLookupQueue;
    v15->_appLookupQueue = (OS_dispatch_queue *)v31;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
  -[PKCancelable cancel](self->_pendingUpdate, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)PKLinkedApplication;
  -[PKLinkedApplication dealloc](&v4, sel_dealloc);
}

- (void)_reloadApplicationStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *completionHandlers;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    completionHandlers = self->_completionHandlers;
    v7 = _Block_copy(v4);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v7);

  }
  if (!self->_loading)
  {
    self->_loading = 1;
    -[PKLinkedApplication _notifyObserversOfStateChange](self, "_notifyObserversOfStateChange");
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__PKLinkedApplication__reloadApplicationStateWithCompletion___block_invoke;
    v8[3] = &unk_1E3E61C58;
    objc_copyWeak(&v9, &location);
    -[PKLinkedApplication _updateApplicationStateWithCompletion:](self, "_updateApplicationStateWithCompletion:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __61__PKLinkedApplication__reloadApplicationStateWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      *((_WORD *)WeakRetained + 16) = 1;
      objc_msgSend(WeakRetained, "_notifyObserversOfStateChange");
    }
    v5 = (void *)objc_msgSend(v4[6], "copy");
    objc_msgSend(v4[6], "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)reloadApplicationStateIfNecessary
{
  -[PKLinkedApplication reloadApplicationStateIfNecessaryWithCompletion:](self, "reloadApplicationStateIfNecessaryWithCompletion:", 0);
}

- (void)reloadApplicationStateIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  SSSoftwareLibraryItem *foundLibraryItem;
  int v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!self->_loaded
    || ((v5 = v4, (foundLibraryItem = self->_foundLibraryItem) == 0)
     || (v7 = -[SSSoftwareLibraryItem isPlaceholder](foundLibraryItem, "isPlaceholder"), v5 = v8, v7))
    && !self->_foundStoreItem)
  {
    -[PKLinkedApplication _reloadApplicationStateWithCompletion:](self, "_reloadApplicationStateWithCompletion:", v8);
    v5 = v8;
  }

}

- (void)openApplication:(id)a3
{
  -[PKLinkedApplication openApplication:withLaunchOptions:](self, "openApplication:withLaunchOptions:", a3, 0);
}

- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4
{
  -[PKLinkedApplication openApplication:withLaunchOptions:launchURL:](self, "openApplication:withLaunchOptions:launchURL:", a3, a4, self->_defaultLaunchURL);
}

- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4 launchURL:(id)a5
{
  char v6;
  NSURL *v8;
  SKStoreProductViewController *presentedViewController;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  SKStoreProductViewController *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  SSSoftwareLibraryItem *foundLibraryItem;
  SSSoftwareLibraryItem *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSURL *v30;
  NSURL *v31;
  NSURL *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PKStoreProductViewPresenter *v40;
  id obj;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id location;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v6 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v8 = (NSURL *)a5;
  presentedViewController = self->_presentedViewController;
  if (presentedViewController)
  {
    -[SKStoreProductViewController presentingViewController](presentedViewController, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v18 = self->_presentedViewController;
      self->_presentedViewController = 0;

      if (v8)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (!v8)
LABEL_4:
    v8 = self->_defaultLaunchURL;
LABEL_5:
  -[PKAMSLookupItem distributionIdentifier](self->_foundStoreItem, "distributionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || -[PKLinkedApplication isInstalled](self, "isInstalled"))
  {
    if (PKRunningInViewService())
    {
      v12 = v42;
      if (v12)
      {
        v13 = v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = 1;
        }
        else
        {
          while (1)
          {
            objc_msgSend(v13, "parentViewController");
            v15 = objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              objc_msgSend(v13, "presentingViewController");
              v15 = objc_claimAutoreleasedReturnValue();
              if (!v15)
                break;
            }

            objc_opt_class();
            v13 = (void *)v15;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = 1;
              v13 = (void *)v15;
              goto LABEL_31;
            }
          }
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v13, "childViewControllers");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v48;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v48 != v20)
                  objc_enumerationMutation(obj);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v14 = 1;
                  goto LABEL_30;
                }
              }
              v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
              if (v19)
                continue;
              break;
            }
          }
          v14 = 0;
LABEL_30:

          v13 = 0;
        }
LABEL_31:

      }
      else
      {
        v14 = 0;
      }
      v16 = v14 != 0;
    }
    else
    {
      v16 = 0;
    }
    -[PKLinkedApplication storeIdentifier](self, "storeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v16 | PKRunningInLockScreenPlugin()) == 1)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (-[PKLinkedApplication isInstalled](self, "isInstalled"))
      {
        foundLibraryItem = self->_foundLibraryItem;
        if (foundLibraryItem)
          -[SSSoftwareLibraryItem valueForProperty:](foundLibraryItem, "valueForProperty:", *MEMORY[0x1E0DAFCE8]);
        else
          -[LSApplicationRecord bundleIdentifier](self->_foundSystemAppRecord, "bundleIdentifier");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, CFSTR("bundleID"));
          v31 = v8;
        }
        else
        {
          v31 = 0;
        }
      }
      else
      {
        -[PKLinkedApplication _foundStoreItemProductPageURL](self, "_foundStoreItemProductPageURL");
        v30 = (NSURL *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v30;
          v33 = CFSTR("com.apple.AppStore");
        }
        else
        {
          v33 = 0;
        }

      }
      objc_msgSend(v42, "viewIfLoaded");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "window");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 && v38)
      {
        objc_msgSend((id)objc_opt_class(), "_openOptionsWithURL:", v31);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        PKPostOpenApplicationNotification(v38, v33, v39);

      }
      goto LABEL_67;
    }
    if (-[PKLinkedApplication isInstalled](self, "isInstalled"))
    {
      v25 = self->_foundLibraryItem;
      if (v25)
        -[SSSoftwareLibraryItem valueForProperty:](v25, "valueForProperty:", *MEMORY[0x1E0DAFCE8]);
      else
        -[LSApplicationRecord bundleIdentifier](self->_foundSystemAppRecord, "bundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_msgSend((id)objc_opt_class(), "_openOptionsWithURL:", v8);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        PKOpenApplication(v35, v36);

      }
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68338], 0);

      goto LABEL_67;
    }
    if ((v6 & 1) != 0)
    {
      -[PKLinkedApplication _foundStoreItemProductPageURL](self, "_foundStoreItemProductPageURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend((id)objc_opt_class(), "_openOptionsWithURL:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        PKOpenApplication(CFSTR("com.apple.AppStore"), v34);

      }
    }
    else
    {
      if (v42)
      {
        if (!self->_presentedViewController)
        {
          if (v22)
          {
            objc_msgSend(v42, "presentedViewController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26 == 0;

            if (v27)
            {
              objc_initWeak(&location, self);
              v40 = -[PKStoreProductViewPresenter initWithProductDelegate:]([PKStoreProductViewPresenter alloc], "initWithProductDelegate:", self);
              -[PKStoreProductViewPresenter loadProductForItemIdentifier:customProductPageIdentifier:](v40, "loadProductForItemIdentifier:customProductPageIdentifier:", v22, self->_customProductPageIdentifier);
              v43[0] = MEMORY[0x1E0C809B0];
              v43[1] = 3221225472;
              v43[2] = __67__PKLinkedApplication_openApplication_withLaunchOptions_launchURL___block_invoke;
              v43[3] = &unk_1E3E65520;
              objc_copyWeak(&v45, &location);
              v44 = v42;
              -[PKStoreProductViewPresenter presentStoreViewWithBlock:](v40, "presentStoreViewWithBlock:", v43);

              objc_destroyWeak(&v45);
              objc_destroyWeak(&location);
              goto LABEL_67;
            }
          }
        }
      }
      -[PKLinkedApplication _foundStoreItemProductPageURL](self, "_foundStoreItemProductPageURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend((id)objc_opt_class(), "_openOptionsWithURL:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        PKOpenApplication(CFSTR("com.apple.AppStore"), v29);

      }
    }

LABEL_67:
    goto LABEL_68;
  }
  -[PKAMSLookupItem appStoreIdentifier](self->_foundStoreItem, "appStoreIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PKDistributedAppLauncher launchAppWithDistributorBundleID:itemID:completion:](_TtC9PassKitUI25_PKDistributedAppLauncher, "launchAppWithDistributorBundleID:itemID:completion:", v11, objc_msgSend(v17, "integerValue"), 0);

LABEL_68:
}

void __67__PKLinkedApplication_openApplication_withLaunchOptions_launchURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 7, a2);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, v6);
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68340], 0);

}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)_unloadApplicationState
{
  os_unfair_lock_s *p_pendingLock;
  PKCancelable *pendingUpdate;
  PKCancelable *v5;
  LSApplicationRecord *foundSystemAppRecord;
  SSSoftwareLibraryItem *foundLibraryItem;
  PKAMSLookupItem *foundStoreItem;
  UIImage *iconImage;

  p_pendingLock = &self->_pendingLock;
  os_unfair_lock_lock(&self->_pendingLock);
  pendingUpdate = self->_pendingUpdate;
  if (pendingUpdate)
  {
    -[PKCancelable cancel](pendingUpdate, "cancel");
    v5 = self->_pendingUpdate;
    self->_pendingUpdate = 0;

  }
  os_unfair_lock_unlock(p_pendingLock);
  *(_WORD *)&self->_loaded = 0;
  foundSystemAppRecord = self->_foundSystemAppRecord;
  self->_foundSystemAppRecord = 0;

  foundLibraryItem = self->_foundLibraryItem;
  self->_foundLibraryItem = 0;

  foundStoreItem = self->_foundStoreItem;
  self->_foundStoreItem = 0;

  iconImage = self->_iconImage;
  self->_iconImage = 0;

  -[PKLinkedApplication _notifyObserversOfStateChange](self, "_notifyObserversOfStateChange");
}

- (void)_updateApplicationStateWithCompletion:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  id v7;
  NSUInteger v8;
  uint64_t v9;
  NSArray *v10;
  id v11;
  PKCancelable *pendingUpdate;
  PKCancelable *v13;
  void *v14;
  PKCancelable *v15;
  PKCancelable *v16;
  PKCancelable *v17;
  PKCancelable *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31;
  id location;
  _QWORD v33[4];
  NSArray *v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSArray *v40;
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD v44[4];
  NSArray *v45;
  id v46;
  PKLinkedApplication *v47;
  _QWORD *v48;
  id *v49;
  _QWORD v50[4];
  NSArray *v51;
  id v52;
  PKLinkedApplication *v53;
  id *v54;
  _QWORD *v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[5];
  id v61;
  id from[5];
  id v63;

  v4 = a3;
  v5 = self->_storeIDs;
  v20 = self->_systemAppBundleIdentifiers;
  v21 = self->_applicationIdentifiers;
  if (-[NSArray count](v5, "count") || -[NSArray count](v20, "count") || -[NSArray count](v21, "count"))
  {
    from[0] = 0;
    from[1] = from;
    from[2] = (id)0x3032000000;
    from[3] = __Block_byref_object_copy__6;
    from[4] = __Block_byref_object_dispose__6;
    v63 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__6;
    v60[4] = __Block_byref_object_dispose__6;
    v61 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = __Block_byref_object_copy__6;
    v58[4] = __Block_byref_object_dispose__6;
    v59 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__6;
    v56[4] = __Block_byref_object_dispose__6;
    v57 = 0;
    v19 = v4;
    -[PKLinkedApplication _iconImageDescriptorForScale:](self, "_iconImageDescriptorForScale:", PKUIScreenScale());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v8 = -[NSArray count](self->_systemAppBundleIdentifiers, "count");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke;
      v50[3] = &unk_1E3E65570;
      v51 = v20;
      v52 = v6;
      v53 = self;
      v54 = from;
      v55 = v56;
      objc_msgSend(v7, "addOperation:", v50);

    }
    if (-[NSArray count](v21, "count"))
    {
      v44[0] = v9;
      v44[1] = 3221225472;
      v44[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_3;
      v44[3] = &unk_1E3E65570;
      v48 = v56;
      v45 = v21;
      v46 = v6;
      v47 = self;
      v49 = from;
      objc_msgSend(v7, "addOperation:", v44);

    }
    if (-[NSArray count](v5, "count"))
    {
      v39[0] = v9;
      v39[1] = 3221225472;
      v39[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_5;
      v39[3] = &unk_1E3E655C0;
      v42 = v56;
      v10 = v5;
      v40 = v10;
      v11 = v6;
      v41 = v11;
      v43 = v60;
      objc_msgSend(v7, "addOperation:", v39);
      v33[0] = v9;
      v33[1] = 3221225472;
      v33[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_7;
      v33[3] = &unk_1E3E65610;
      v36 = v56;
      v37 = v60;
      v34 = v10;
      v35 = v11;
      v38 = v58;
      objc_msgSend(v7, "addOperation:", v33);

    }
    os_unfair_lock_lock(&self->_pendingLock);
    pendingUpdate = self->_pendingUpdate;
    if (pendingUpdate)
    {
      -[PKCancelable cancel](pendingUpdate, "cancel");
      v13 = self->_pendingUpdate;
      self->_pendingUpdate = 0;

    }
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_9;
    v25[3] = &unk_1E3E65660;
    objc_copyWeak(&v31, &location);
    v27 = from;
    v28 = v60;
    v29 = v58;
    v30 = v56;
    v4 = v19;
    v26 = v19;
    objc_msgSend(v7, "evaluateWithInput:completion:", v14, v25);
    v15 = (PKCancelable *)objc_claimAutoreleasedReturnValue();
    v16 = self->_pendingUpdate;
    self->_pendingUpdate = v15;

    os_unfair_lock_unlock(&self->_pendingLock);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

    _Block_object_dispose(v56, 8);
    _Block_object_dispose(v58, 8);

    _Block_object_dispose(v60, 8);
    _Block_object_dispose(from, 8);

  }
  else
  {
    os_unfair_lock_lock(&self->_pendingLock);
    v17 = self->_pendingUpdate;
    if (v17)
    {
      -[PKCancelable cancel](v17, "cancel");
      v18 = self->_pendingUpdate;
      self->_pendingUpdate = 0;

    }
    os_unfair_lock_unlock(&self->_pendingLock);
    objc_initWeak(from, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_11;
    block[3] = &unk_1E3E61C80;
    objc_copyWeak(&v24, from);
    v23 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(from);
  }

}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_2;
  v19[3] = &unk_1E3E65548;
  v22 = *(_OWORD *)(a1 + 56);
  v20 = v6;
  v21 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v19;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __LookupSystemApplications_block_invoke;
  block[3] = &unk_1E3E65388;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v15 = v13;
  v16 = v12;
  v17 = v6;
  v18 = v7;
  dispatch_async(v10, block);

}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[5] + 16))();
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = a1[7];
  if (*(_QWORD *)(*(_QWORD *)(v9 + 8) + 40))
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }
  else
  {
    v10 = (void *)a1[4];
    v11 = (void *)a1[5];
    v12 = *(NSObject **)(a1[6] + 80);
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_4;
    v19[3] = &unk_1E3E65548;
    v22 = a1[8];
    v23 = v9;
    v21 = v7;
    v20 = v6;
    v14 = v10;
    v15 = v11;
    v16 = v19;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __LookupApplications_block_invoke;
    block[3] = &unk_1E3E65388;
    v25 = v14;
    v26 = v15;
    v27 = v16;
    v17 = v15;
    v18 = v14;
    dispatch_async(v12, block);

  }
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  v7 = a1[5];
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, a1[4], 0);

}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_5(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD *v52;
  _QWORD v53[4];
  id v54;
  _QWORD *v55;
  _QWORD v56[5];
  id v57;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40))
  {
    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
  }
  else
  {
    v12 = (void *)a1[4];
    v13 = (void *)a1[5];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_6;
    v36[3] = &unk_1E3E65598;
    v39 = a1[7];
    v40 = v11;
    v38 = v9;
    v37 = v8;
    v14 = v12;
    v15 = v7;
    v16 = v13;
    v17 = v36;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__6;
    v56[4] = __Block_byref_object_dispose__6;
    v57 = objc_alloc_init(MEMORY[0x1E0DAF640]);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = v7;
    v35 = v15;
    v19 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D6A1A0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v14, "containsObject:", v20);

    if (v21)
      v22 = (id)*MEMORY[0x1E0D6A190];
    else
      v22 = 0;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __LookupInstalledApplications_block_invoke;
    v53[3] = &unk_1E3E658B8;
    v55 = v56;
    v23 = v18;
    v54 = v23;
    objc_msgSend(v19, "addOperation:", v53);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __LookupInstalledApplications_block_invoke_3;
    v49[3] = &unk_1E3E658E0;
    v52 = v56;
    v24 = v14;
    v50 = v24;
    v25 = v23;
    v51 = v25;
    objc_msgSend(v19, "addOperation:", v49);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __LookupInstalledApplications_block_invoke_5;
    v42[3] = &unk_1E3E65908;
    v27 = v24;
    v43 = v27;
    v28 = v25;
    v44 = v28;
    v29 = v22;
    v45 = v29;
    v30 = v16;
    v46 = v30;
    v31 = v35;
    v47 = v31;
    v32 = v17;
    v48 = v32;
    v33 = (id)objc_msgSend(v19, "evaluateWithInput:completion:", v26, v42);

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __LookupInstalledApplications_block_invoke_7;
    v41[3] = &unk_1E3E62060;
    v41[4] = v56;
    objc_msgSend(v31, "addCancelAction:", v41);

    _Block_object_dispose(v56, 8);
    v7 = v34;
  }

}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[5] + 16))();
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_7(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1[6];
  if (!*(_QWORD *)(*(_QWORD *)(v10 + 8) + 40))
    goto LABEL_5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "valueForProperty:", *MEMORY[0x1E0DAFD18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
    v10 = a1[6];
LABEL_5:
    v13 = (void *)a1[4];
    v14 = (void *)a1[5];
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_8;
    v24[3] = &unk_1E3E655E8;
    v27 = a1[8];
    v28 = v10;
    v26 = v9;
    v25 = v8;
    v16 = v13;
    v17 = v7;
    v18 = v14;
    v19 = v24;
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __LookupStoreApplications_block_invoke;
    v31[3] = &unk_1E3E65980;
    v32 = v16;
    v33 = v17;
    v34 = v18;
    v35 = v19;
    v20 = v18;
    v21 = v16;
    PKLookupAppStoreApplications(v21, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __LookupStoreApplications_block_invoke_336;
    v29[3] = &unk_1E3E612E8;
    v30 = v22;
    v23 = v22;
    objc_msgSend(v17, "addCancelAction:", v29);

    goto LABEL_6;
  }
  (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
LABEL_6:

}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_8(_QWORD *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(v7, "iconImage");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  id v14;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_10;
  block[3] = &unk_1E3E65638;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  v10 = v5;
  v8 = *(_OWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 64);
  v6 = (id)v8;
  v11 = v8;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_10(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 80));
  v7 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained + 4;
  os_unfair_lock_lock(WeakRetained + 4);
  v4 = *(void **)&v7[6]._os_unfair_lock_opaque;
  if (v4 == *(void **)(a1 + 32))
  {
    *(_QWORD *)&v7[6]._os_unfair_lock_opaque = 0;

  }
  os_unfair_lock_unlock(v3);
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_storeStrong((id *)&v7[18], *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_storeStrong((id *)&v7[16], *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_storeStrong((id *)&v7[2], *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_storeStrong((id *)&v7[34], *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v5 = 0;
  }
  else
  {
LABEL_5:
    v5 = 1;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v5);

}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 9);
    *((_QWORD *)WeakRetained + 9) = 0;

    v5 = (void *)v8[8];
    v8[8] = 0;

    v6 = (void *)v8[1];
    v8[1] = 0;

    v3 = v8;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);
    v3 = v8;
  }

}

- (id)_iconImageDescriptorForScale:(double)a3
{
  void *v5;
  const __CFString *v6;
  void *v7;

  if ((PKUserInterfaceIdiomSupportsLargeLayouts() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0D3A830];
    v6 = CFSTR("com.apple.IconServices.ImageDescriptor.LargeHomeScreen");
LABEL_6:
    objc_msgSend(v5, "imageDescriptorNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = (void *)MEMORY[0x1E0D3A830];
  if (!self->_useSmallIcon)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0D3A870];
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A880]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDrawBorder:", 1);
LABEL_7:
  objc_msgSend(v7, "setScale:", a3);
  objc_msgSend(v7, "setDrawBorder:", self->_shouldApplyBorder);
  objc_msgSend(v7, "setShouldApplyMask:", self->_shouldApplyMask);
  return v7;
}

- (void)_notifyObserversOfStateChange
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "linkedApplicationDidChangeState:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)installedApplicationsDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKLinkedApplication_installedApplicationsDidChangeNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __66__PKLinkedApplication_installedApplicationsDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadApplicationStateWithCompletion:", 0);
}

- (void)setStoreIDs:(id)a3
{
  NSArray *v4;
  NSArray *storeIDs;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    storeIDs = self->_storeIDs;
    self->_storeIDs = v4;

    -[PKLinkedApplication _unloadApplicationState](self, "_unloadApplicationState");
  }

}

- (int64_t)state
{
  SSSoftwareLibraryItem *foundLibraryItem;

  foundLibraryItem = self->_foundLibraryItem;
  if (foundLibraryItem && !-[SSSoftwareLibraryItem isPlaceholder](foundLibraryItem, "isPlaceholder")
    || self->_foundStoreItem
    || self->_foundSystemAppRecord)
  {
    return 1;
  }
  if (self->_loaded)
    return 2 * !self->_loading;
  return 0;
}

- (void)setUseSmallIcon:(BOOL)a3
{
  if (((!self->_useSmallIcon ^ a3) & 1) == 0)
  {
    self->_useSmallIcon = a3;
    -[PKLinkedApplication _unloadApplicationState](self, "_unloadApplicationState");
  }
}

- (BOOL)isInstalled
{
  SSSoftwareLibraryItem *foundLibraryItem;

  foundLibraryItem = self->_foundLibraryItem;
  return foundLibraryItem && !-[SSSoftwareLibraryItem isPlaceholder](foundLibraryItem, "isPlaceholder")
      || self->_foundSystemAppRecord != 0;
}

- (BOOL)_useLibraryItem
{
  if (self->_foundStoreItem)
    return -[SSSoftwareLibraryItem isPlaceholder](self->_foundLibraryItem, "isPlaceholder");
  else
    return 1;
}

- (CGSize)expectedIconSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PKLinkedApplication _iconImageDescriptorForScale:](self, "_iconImageDescriptorForScale:", PKUIScreenScale());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSNumber)storeIdentifier
{
  if (-[PKLinkedApplication _useLibraryItem](self, "_useLibraryItem"))
    -[SSSoftwareLibraryItem valueForProperty:](self->_foundLibraryItem, "valueForProperty:", *MEMORY[0x1E0DAFD08]);
  else
    -[PKAMSLookupItem appStoreIdentifier](self->_foundStoreItem, "appStoreIdentifier");
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)displayName
{
  LSApplicationRecord *foundSystemAppRecord;
  void *v4;

  foundSystemAppRecord = self->_foundSystemAppRecord;
  if (foundSystemAppRecord)
  {
    -[LSApplicationRecord localizedName](foundSystemAppRecord, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKLinkedApplication _useLibraryItem](self, "_useLibraryItem"))
      -[SSSoftwareLibraryItem valueForProperty:](self->_foundLibraryItem, "valueForProperty:", *MEMORY[0x1E0DAFD18]);
    else
      -[PKAMSLookupItem displayName](self->_foundStoreItem, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (id)_foundStoreItemProductPageURL
{
  PKAMSLookupItem *foundStoreItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  foundStoreItem = self->_foundStoreItem;
  if (!foundStoreItem)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PKAMSLookupItem appStoreIdentifier](foundStoreItem, "appStoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("itms-appss://apps.apple.com/app/id%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v6);
  if (self->_customProductPageIdentifier)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ppid"), self->_customProductPageIdentifier);
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQueryItems:", v9);

  }
  objc_msgSend(v7, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)productViewControllerDidFinish:(id)a3
{
  SKStoreProductViewController *v4;
  SKStoreProductViewController *v5;

  v5 = (SKStoreProductViewController *)a3;
  -[SKStoreProductViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);
  v4 = v5;
  if (self->_presentedViewController == v5)
  {
    self->_presentedViewController = 0;

    v4 = v5;
  }

}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (NSArray)systemAppBundleIdentifiers
{
  return self->_systemAppBundleIdentifiers;
}

- (void)setSystemAppBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)defaultLaunchURL
{
  return self->_defaultLaunchURL;
}

- (void)setDefaultLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)customProductPageIdentifier
{
  return self->_customProductPageIdentifier;
}

- (void)setCustomProductPageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)useSmallIcon
{
  return self->_useSmallIcon;
}

- (BOOL)shouldApplyMask
{
  return self->_shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->_shouldApplyMask = a3;
}

- (BOOL)shouldApplyBorder
{
  return self->_shouldApplyBorder;
}

- (void)setShouldApplyBorder:(BOOL)a3
{
  self->_shouldApplyBorder = a3;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (PKAMSLookupItem)foundStoreItem
{
  return self->_foundStoreItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_customProductPageIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultLaunchURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_systemAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_appLookupQueue, 0);
  objc_storeStrong((id *)&self->_foundSystemAppRecord, 0);
  objc_storeStrong((id *)&self->_foundLibraryItem, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingUpdate, 0);
  objc_storeStrong((id *)&self->_foundStoreItem, 0);
}

@end
