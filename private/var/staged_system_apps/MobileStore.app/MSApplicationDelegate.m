@implementation MSApplicationDelegate

- (int64_t)_tabBarStyleWithWidth:(double)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
  v5 = SUUIUserInterfaceIdiom();

  return a3 >= 768.0 && v5 == 1;
}

- (BOOL)_showsDownloadsTabForDownloadManager:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "downloads"));
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_requestAuthorization
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100001AD4;
  v3[3] = &unk_10000C758;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "requestAuthorizationWithOptions:completionHandler:", 6, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (MSApplicationDelegate)init
{
  MSApplicationDelegate *v2;
  id v3;
  id v4;
  uint64_t v5;
  SUUIApplicationController *v6;
  SUUIApplicationController *applicationController;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSApplicationDelegate;
  v2 = -[MSApplicationDelegate init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)SUUIMutableApplicationControllerOptions);
    objc_msgSend(v3, "setPageRenderMetricsEnabled:", 1);
    v4 = objc_alloc((Class)SUUIApplicationController);
    v6 = (SUUIApplicationController *)objc_msgSend(v4, "initWithClientContextClass:options:", objc_opt_class(MSClientContext, v5), v3);
    applicationController = v2->_applicationController;
    v2->_applicationController = v6;

    -[SUUIApplicationController setDelegate:](v2->_applicationController, "setDelegate:", v2);
    v8 = objc_msgSend(objc_alloc((Class)NSURLCache), "initWithMemoryCapacity:diskCapacity:diskPath:", 512000, 52428800, 0);
    +[NSURLCache setSharedURLCache:](NSURLCache, "setSharedURLCache:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_networkingStartNotification:", SSVNetworkingDidStartNotification, 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_networkingStopNotification:", SSVNetworkingDidStopNotification, 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_purchaseFinishedNotification:", SUPurchaseFinishedNotification, 0);

  }
  return v2;
}

- (id)_downloadManager
{
  SSDownloadManager *downloadManager;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  SSDownloadManager *v9;
  SSDownloadManager *v10;

  downloadManager = self->_downloadManager;
  if (!downloadManager)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientInterface"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerFactory"));
    v7 = objc_msgSend(v6, "newDownloadManagerOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queueSessionManager"));
    v9 = (SSDownloadManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "beginDownloadManagerSessionWithManagerOptions:", v7));
    v10 = self->_downloadManager;
    self->_downloadManager = v9;

    -[SSDownloadManager addObserver:](self->_downloadManager, "addObserver:", self);
    downloadManager = self->_downloadManager;
  }
  return downloadManager;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIWindow *window;
  id v10;
  void *v11;
  UIWindow *v12;
  UIWindow *v13;
  UIWindow *v14;
  UIColor *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  double v20;
  int64_t v21;
  void *v22;
  SUUIApplicationController *applicationController;
  id v24;
  void *v25;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "registerDefaults:", &off_10000D0E8);

  window = self->_window;
  if (!window)
  {
    v10 = objc_alloc((Class)UIWindow);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v11, "bounds");
    v12 = (UIWindow *)objc_msgSend(v10, "initWithFrame:");
    v13 = self->_window;
    self->_window = v12;

    -[UIWindow setAutoresizingMask:](self->_window, "setAutoresizingMask:", 18);
    v14 = self->_window;
    v15 = sub_100002C38();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[UIWindow setTintColor:](v14, "setTintColor:", v16);

    window = self->_window;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController rootViewController](self->_applicationController, "rootViewController"));
  -[UIWindow setRootViewController:](window, "setRootViewController:", v17);

  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  v18 = objc_msgSend(v7, "launchedToTest");

  if ((v18 & 1) == 0)
    -[MSApplicationDelegate _loadApplicationWithLaunchOptions:](self, "_loadApplicationWithLaunchOptions:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController tabBarItems](self->_applicationController, "tabBarItems"));

  if (!v19)
  {
    -[UIWindow bounds](self->_window, "bounds");
    v21 = -[MSApplicationDelegate _tabBarStyleWithWidth:](self, "_tabBarStyleWithWidth:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController tabBarController](self->_applicationController, "tabBarController"));
    objc_msgSend(v22, "_setMaximumNumberOfItems:", -[MSApplicationDelegate _maximumTabBarItemsForStyle:](self, "_maximumTabBarItemsForStyle:", v21));

    applicationController = self->_applicationController;
    v24 = -[MSApplicationDelegate _newTabBarItemsWithStyle:](self, "_newTabBarItemsWithStyle:", v21);
    -[SUUIApplicationController setTabBarItems:](applicationController, "setTabBarItems:", v24);

  }
  +[MSQuickActionController updateShortcutItems](MSQuickActionController, "updateShortcutItems");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v25, "setCategory:error:", AVAudioSessionCategoryPlayback, 0);

  -[MSApplicationDelegate _requestAuthorization](self, "_requestAuthorization");
  return 1;
}

- (id)_newTabBarItemsWithStyle:(int64_t)a3
{
  id v5;
  void *v6;
  Block_layout *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  UIColor *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  MSApplicationDelegate *v56;
  void *v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  _BYTE v68[128];

  v5 = objc_alloc_init((Class)NSMutableArray);
  v56 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) != 0)
  {
    v7 = 0;
  }
  else if (v6)
  {
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100002BE8;
    v66[3] = &unk_10000C678;
    v67 = v6;
    v7 = objc_retainBlock(v66);

  }
  else
  {
    v7 = &stru_10000C6B8;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tabBarItemsForStyle:", a3));
  if (!v8)
    v8 = -[MSApplicationDelegate _newDefaultTabBarItemsWithClientContext:style:](v56, "_newDefaultTabBarItemsWithClientContext:style:", v6, a3);
  v57 = v6;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v63;
    v58 = v5;
    v59 = v9;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tabIdentifier"));
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("music")))
        {
          v16 = objc_alloc_init((Class)UITabBarItem);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music")));
          objc_msgSend(v16, "setImage:", v17);

          if (v7)
          {
            v18 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("MUSIC"));
            goto LABEL_16;
          }
          goto LABEL_18;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("movies")))
        {
          v16 = objc_alloc_init((Class)UITabBarItem);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("film.fill")));
          objc_msgSend(v16, "setImage:", v22);

          if (v7)
          {
            v23 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("MOVIES"));
            goto LABEL_25;
          }
          goto LABEL_26;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("tv")))
        {
          v16 = objc_alloc_init((Class)UITabBarItem);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("tv.inset.filled")));
          objc_msgSend(v16, "setImage:", v24);

          if (v7)
          {
            v23 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("TV_SHOWS"));
LABEL_25:
            v25 = (void *)objc_claimAutoreleasedReturnValue(v23);
            objc_msgSend(v16, "setTitle:", v25);

          }
LABEL_26:
          v20 = v14;
          v21 = 1;
          goto LABEL_27;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("search")))
        {
          v16 = objc_msgSend(objc_alloc((Class)UITabBarItem), "initWithTabBarSystemItem:tag:", 8, 0);
          if (v7)
          {
            v30 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("SEARCH"));
            goto LABEL_34;
          }
          goto LABEL_45;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("audiobooks")))
        {
          v16 = objc_alloc_init((Class)UITabBarItem);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UITabBarAudiobooks")));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_imageThatSuppressesAccessibilityHairlineThickening"));
          objc_msgSend(v16, "setImage:", v32);

          v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UITabBarAudiobooksSelected")));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_imageThatSuppressesAccessibilityHairlineThickening"));
          objc_msgSend(v16, "setSelectedImage:", v34);

          if (v7)
          {
            v35 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("AUDIOBOOKS"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
            objc_msgSend(v16, "setTitle:", v36);

          }
          objc_msgSend(v14, "setBarTintStyle:", 2);
          v27 = SUStorePageViewController_ptr;
          v5 = v58;
          v9 = v59;
          goto LABEL_28;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("tones")))
        {
          v16 = objc_alloc_init((Class)UITabBarItem);
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("bell.fill")));
          objc_msgSend(v16, "setImage:", v37);

          if (v7)
          {
            v18 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("TONES"));
            goto LABEL_16;
          }
LABEL_18:
          v20 = v14;
          v21 = 2;
LABEL_27:
          objc_msgSend(v20, "setBarTintStyle:", v21);
          v27 = SUStorePageViewController_ptr;
LABEL_28:
          objc_msgSend(v14, "setRootViewControllerClass:", objc_opt_class(*v27, v26));
          objc_msgSend(v14, "setUnderlyingTabBarItem:", v16);
          v28 = sub_100002C38();
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          objc_msgSend(v14, "setUserInterfaceTintColor:", v29);

          objc_msgSend(v5, "addObject:", v14);
          goto LABEL_29;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("charts")))
        {
          v16 = objc_msgSend(objc_alloc((Class)UITabBarItem), "initWithTabBarSystemItem:tag:", 11, 0);
          if (v7)
          {
            v30 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("CHARTS"));
LABEL_34:
            v19 = (void *)objc_claimAutoreleasedReturnValue(v30);
            objc_msgSend(v16, "_setInternalTitle:", v19);
LABEL_17:

            goto LABEL_18;
          }
LABEL_45:
          objc_msgSend(v16, "_setInternalTitle:", &stru_10000C7F8);
          goto LABEL_18;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("genius")))
        {
          v16 = objc_alloc_init((Class)UITabBarItem);
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("genius")));
          objc_msgSend(v16, "setImage:", v38);

          if (!v7)
            goto LABEL_18;
          v18 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("GENIUS"));
LABEL_16:
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          objc_msgSend(v16, "setTitle:", v19);
          goto LABEL_17;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("purchased")))
        {
          v16 = objc_alloc_init((Class)UITabBarItem);
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("purchased")));
          objc_msgSend(v16, "setImage:", v39);

          if (!v7)
            goto LABEL_18;
          v18 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("PURCHASED"));
          goto LABEL_16;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("downloads")))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSApplicationDelegate _downloadManager](v56, "_downloadManager"));
          v41 = -[MSApplicationDelegate _showsDownloadsTabForDownloadManager:](v56, "_showsDownloadsTabForDownloadManager:", v40);

          if (v41)
          {
            v16 = objc_msgSend(objc_alloc((Class)UITabBarItem), "initWithTabBarSystemItem:tag:", 9, 0);
            if (v7)
            {
              v42 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("DOWNLOADS"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              objc_msgSend(v16, "setTitle:", v43);

            }
            objc_msgSend(v14, "setBarTintStyle:", 2);
            objc_msgSend(v14, "setAlwaysCreatesRootViewController:", 1);
            v27 = SUUIDownloadsViewController_ptr;
            goto LABEL_28;
          }
        }
        else
        {
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("itunesu")))
          {
            v16 = objc_alloc_init((Class)UITabBarItem);
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UITabBariTunesU")));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "_imageThatSuppressesAccessibilityHairlineThickening"));
            objc_msgSend(v16, "setImage:", v45);

            if (v7)
            {
              v46 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("ITUNES_U"));
              goto LABEL_63;
            }
            goto LABEL_64;
          }
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("podcast")))
          {
            v16 = objc_alloc_init((Class)UITabBarItem);
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UITabBarPodcasts")));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "_imageThatSuppressesAccessibilityHairlineThickening"));
            objc_msgSend(v16, "setImage:", v48);

            if (v7)
            {
              v46 = ((uint64_t (*)(Block_layout *, const __CFString *))v7->invoke)(v7, CFSTR("PODCASTS"));
LABEL_63:
              v49 = (void *)objc_claimAutoreleasedReturnValue(v46);
              objc_msgSend(v16, "setTitle:", v49);

            }
LABEL_64:
            objc_msgSend(v14, "setBarTintStyle:", 2);
            v27 = SUStorePageViewController_ptr;
            v9 = v59;
            goto LABEL_28;
          }
        }
LABEL_29:

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v50 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      v11 = v50;
    }
    while (v50);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKey:", CFSTR("MSApplicationDelegateTabBarOrdering")));

  v54 = objc_opt_class(NSArray, v53);
  if ((objc_opt_isKindOfClass(v52, v54) & 1) != 0)
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100005B6C;
    v60[3] = &unk_10000C6E0;
    v61 = v52;
    objc_msgSend(v5, "sortUsingComparator:", v60);

  }
  return v5;
}

- (id)application:(id)a3 navigationControllerWithTabBarItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tabIdentifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("search"));
  if ((v8 & 1) != 0)
  {
    v9 = 0;
    v10 = 1;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("movies")) & 1) != 0
         || objc_msgSend(v7, "isEqualToString:", CFSTR("tv")))
  {
    v10 = 0;
    v9 = 1;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientInterface"));
  v13 = objc_msgSend(objc_alloc((Class)SUSection), "initWithClientInterface:sectionType:defaultPNGStyle:", v12, v10, v9);
  if ((v8 & 1) != 0 || SUUIUserInterfaceIdiom(v11) == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUSearchFieldConfiguration defaultConfigurationWithClientInterface:](SUSearchFieldConfiguration, "defaultConfigurationWithClientInterface:", v12));
    objc_msgSend(v13, "setSearchFieldConfiguration:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "underlyingTabBarItem"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "image"));
  objc_msgSend(v13, "setImage:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedImage"));
  objc_msgSend(v13, "setSelectedImage:", v17);

  v18 = objc_msgSend(objc_alloc((Class)SUNavigationController), "initWithSection:", v13);
  objc_msgSend(v18, "setClientInterface:", v12);

  return v18;
}

- (int64_t)_maximumTabBarItemsForStyle:(int64_t)a3
{
  if (a3)
    return 8;
  else
    return 5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, SSVNetworkingDidStartNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, SSVNetworkingDidStopNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, SUPurchaseFinishedNotification, 0);
  -[SUUIApplicationController setDelegate:](self->_applicationController, "setDelegate:", 0);
  -[SSDownloadManager removeObserver:](self->_downloadManager, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MSApplicationDelegate;
  -[MSApplicationDelegate dealloc](&v4, "dealloc");
}

- (void)applicationDidChangeClientContext:(id)a3
{
  void *v4;
  SSDownloadManager *downloadManager;
  void *v6;
  double v7;
  int64_t v8;
  SUUIApplicationController *applicationController;
  id v10;
  void *v11;
  void *v12;
  SULegacyClientBridge *v13;
  SULegacyClientBridge *legacyBridge;
  SULegacyClientBridge *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext", a3));
  objc_msgSend(v4, "setPurchaseReferrerURL:", self->_launchURL);

  -[SSDownloadManager removeObserver:](self->_downloadManager, "removeObserver:", self);
  downloadManager = self->_downloadManager;
  self->_downloadManager = 0;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController rootViewController](self->_applicationController, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  objc_msgSend(v6, "bounds");
  v8 = -[MSApplicationDelegate _tabBarStyleWithWidth:](self, "_tabBarStyleWithWidth:", v7);

  applicationController = self->_applicationController;
  v10 = -[MSApplicationDelegate _newTabBarItemsWithStyle:](self, "_newTabBarItemsWithStyle:", v8);
  -[SUUIApplicationController setTabBarItems:](applicationController, "setTabBarItems:", v10);

  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientInterface"));

  v13 = (SULegacyClientBridge *)objc_msgSend(objc_alloc((Class)SULegacyClientBridge), "initWithClientInterface:", v12);
  legacyBridge = self->_legacyBridge;
  self->_legacyBridge = v13;

  v15 = self->_legacyBridge;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController tabBarController](self->_applicationController, "tabBarController"));
  -[SULegacyClientBridge setRootViewController:](v15, "setRootViewController:", v16);

  +[SUClientDispatch setClientBridge:](SUClientDispatch, "setClientBridge:", self->_legacyBridge);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "purchaseManager"));
  objc_msgSend(v17, "setDelegate:", self);

  -[MSApplicationDelegate presentOnboardingIfNeeded](self, "presentOnboardingIfNeeded");
}

- (void)applicationDidCustomizeTabBarItems:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tabBarItems"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004248;
  v8[3] = &unk_10000C550;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MSApplicationDelegateTabBarOrdering"));
  objc_msgSend(v6, "synchronize");

}

- (void)applicationDidDisplayFirstPage:(id)a3
{
  MSLaunchNotificationsController *v4;
  void *v5;
  MSLaunchNotificationsController *v6;
  MSLaunchNotificationsController *launchNotificationsController;
  MSLaunchNotificationsController *v8;
  void *v9;
  id quickActionBlock;
  id v11;

  v11 = a3;
  if (!self->_launchNotificationsController)
  {
    v4 = [MSLaunchNotificationsController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));
    v6 = -[MSLaunchNotificationsController initWithParentViewController:](v4, "initWithParentViewController:", v5);
    launchNotificationsController = self->_launchNotificationsController;
    self->_launchNotificationsController = v6;

    v8 = self->_launchNotificationsController;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientContext"));
    -[MSLaunchNotificationsController setClientContext:](v8, "setClientContext:", v9);

    if ((+[MSOnboardingUtil shouldShowOnboarding](MSOnboardingUtil, "shouldShowOnboarding") & 1) == 0)
      -[MSLaunchNotificationsController checkForNotifications](self->_launchNotificationsController, "checkForNotifications");
  }
  self->_didDisplayFirstPage = 1;
  if (self->_quickActionBlock
    && (+[MSOnboardingUtil shouldShowOnboarding](MSOnboardingUtil, "shouldShowOnboarding") & 1) == 0)
  {
    (*((void (**)(void))self->_quickActionBlock + 2))();
    quickActionBlock = self->_quickActionBlock;
    self->_quickActionBlock = 0;

  }
  -[MSApplicationDelegate presentOnboardingIfNeeded](self, "presentOnboardingIfNeeded");

}

- (void)application:(id)a3 didFailToLoadWithError:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientContext"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:", CFSTR("GENERIC_ERROR")));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GENERIC_ERROR"), &stru_10000C7F8, 0));

    v7 = (uint64_t)v9;
  }
  v10 = (id)v7;
  objc_msgSend(v4, "showErrorViewWithTitle:message:", v7, 0);

}

- (void)application:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double width;
  id v8;
  void *v9;
  void *v10;
  double v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  id v15;
  void *v16;
  id v17;

  width = a4.width;
  v17 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rootViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v10, "bounds");
  v12 = -[MSApplicationDelegate _tabBarStyleWithWidth:](self, "_tabBarStyleWithWidth:", v11);

  v13 = -[MSApplicationDelegate _tabBarStyleWithWidth:](self, "_tabBarStyleWithWidth:", width);
  if (v12 != v13)
  {
    v14 = v13;
    v15 = -[MSApplicationDelegate _newTabBarItemsWithStyle:](self, "_newTabBarItemsWithStyle:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tabBarController"));
    objc_msgSend(v16, "_setMaximumNumberOfItems:", -[MSApplicationDelegate _maximumTabBarItemsForStyle:](self, "_maximumTabBarItemsForStyle:", v14));

    objc_msgSend(v17, "updateTabBarWithItems:animated:", v15, objc_msgSend(v8, "isAnimated"));
  }

}

- (id)bootstrapScriptURLForApplication:(id)a3
{
  void *v3;
  unsigned int v4;
  id v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v4 = objc_msgSend(v3, "launchedToTest");

  if (v4)
  {
    v5 = objc_alloc((Class)NSString);
    v6 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@://PPT.js"), SUUITestDataURLScheme);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004674;
  v7[3] = &unk_10000C498;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (id)purchaseManager:(id)a3 purchaseBatchForItems:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = objc_msgSend(objc_alloc((Class)MSPurchaseBatch), "initWithItems:", v4);

  return v5;
}

- (id)purchaseManager:(id)a3 purchaseBatchForPurchases:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v6 = objc_alloc_init((Class)MSPurchaseBatch);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
        v15 = objc_opt_class(SSPurchase, v10);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          objc_msgSend(v7, "customizePurchase:", v14, (_QWORD)v17);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setPurchasesAndContinuationsFromPurchases:", v8);
  return v6;
}

- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  SUUIApplicationController *applicationController;
  id v26;
  void *v27;
  SUUIURL *launchURL;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)SUUIURL), "initWithURL:", v11);
  objc_msgSend(v14, "setReferrerApplicationName:", v12);
  v16 = objc_opt_class(NSDictionary, v15);
  if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
  {
    v17 = (void *)sub_100003EA0();
    v19 = *(id *)sub_100003F2C("LSReferrerURLKey", v17);
    if (v19)
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v19));
    else
      v20 = 0;
    v21 = objc_opt_class(NSString, v18);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      objc_msgSend(v14, "setReferrerURLString:", v20);
    }
    else
    {
      v23 = objc_opt_class(NSURL, v22);
      if ((objc_opt_isKindOfClass(v20, v23) & 1) != 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
        objc_msgSend(v14, "setReferrerURLString:", v24);

      }
    }

  }
  objc_initWeak(&location, self);
  applicationController = self->_applicationController;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100004B88;
  v31[3] = &unk_10000C5B8;
  objc_copyWeak(&v33, &location);
  v26 = v14;
  v32 = v26;
  -[SUUIApplicationController evaluateBlockWhenLoaded:](applicationController, "evaluateBlockWhenLoaded:", v31);
  self->_onActiveShouldResumeApplication = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
  objc_msgSend(v27, "setPurchaseReferrerURL:", v26);

  launchURL = self->_launchURL;
  self->_launchURL = (SUUIURL *)v26;
  v29 = v26;

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  id v32;
  void *v33;
  MSApplicationDelegate *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int v39;
  id v40;
  _BYTE v41[128];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForResource:ofType:", CFSTR("testDefinitions"), CFSTR("plist")));

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v11, 0, 0, 0));
    v14 = objc_opt_class(NSArray, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v16)
      {
        v18 = v16;
        v31 = v12;
        v32 = v11;
        v33 = v8;
        v34 = self;
        v19 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v22 = objc_opt_class(NSDictionary, v17);
            if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("testName")));
              v24 = objc_msgSend(v23, "isEqualToString:", v7);

              if (v24)
              {
                v8 = v21;

                self = v34;
                goto LABEL_14;
              }
            }
          }
          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          if (v18)
            continue;
          break;
        }
        self = v34;
LABEL_14:
        v11 = v32;
        v12 = v31;
      }

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v26 = objc_msgSend(v25, "shouldLog");
  if (objc_msgSend(v25, "shouldLogToDisk"))
    v26 |= 2u;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "OSLogObject"));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    v28 = v26;
  else
    v28 = v26 & 2;
  if (!(_DWORD)v28)
    goto LABEL_25;
  v39 = 138412290;
  v40 = v8;
  v29 = (void *)_os_log_send_and_compose_impl(v28, 0, 0, 0, &_mh_execute_header, v27, 2, "Running PPT with options: %@", &v39, 12);

  if (v29)
  {
    v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4));
    free(v29);
    SSFileLog(v25, CFSTR("%@"));
LABEL_25:

  }
  -[MSApplicationDelegate _loadApplicationWithLaunchOptions:](self, "_loadApplicationWithLaunchOptions:", v8);

  return 1;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;

  if (self->_onActiveShouldResumeApplication)
    -[SUUIApplicationController resumeApplicationWithOptions:](self->_applicationController, "resumeApplicationWithOptions:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MSApplicationDelegate _storeReview](self, "_storeReview", a3));
  objc_msgSend(v4, "applicationDidForeground");

}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void ***v13;
  id quickActionBlock;
  id v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self->_applicationController);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100005080;
  v19 = &unk_10000C5E0;
  objc_copyWeak(&v22, &location);
  v11 = v9;
  v20 = v11;
  v12 = v10;
  v21 = v12;
  v13 = objc_retainBlock(&v16);
  quickActionBlock = self->_quickActionBlock;
  self->_quickActionBlock = v13;

  if (self->_didDisplayFirstPage
    && (+[MSOnboardingUtil shouldShowOnboarding](MSOnboardingUtil, "shouldShowOnboarding", v16, v17, v18, v19, v20) & 1) == 0)
  {
    (*((void (**)(void))self->_quickActionBlock + 2))();
    v15 = self->_quickActionBlock;
    self->_quickActionBlock = 0;

  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  MSApplicationDelegate *v7;
  id v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000514C;
  v5[3] = &unk_10000C630;
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v6, "beginBackgroundTaskWithExpirationHandler:", 0);
  v4 = v6;
  SSDialogGetDaemonDialogState(v5);

}

- (void)_networkingStartNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000052D4;
  block[3] = &unk_10000C470;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_networkingStopNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005384;
  block[3] = &unk_10000C470;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_purchaseFinishedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buyParameters"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buyParameters"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBuyParams buyParamsWithString:](AMSBuyParams, "buyParamsWithString:", v7));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parameterForKey:", CFSTR("mtApp")));
      if (objc_msgSend(v9, "isEqual:", CFSTR("com.apple.MobileStore")))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSApplicationDelegate _storeReview](self, "_storeReview"));
        v11 = objc_msgSend(v10, "shouldAttemptPromptReview");

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSApplicationDelegate _storeReview](self, "_storeReview"));
          objc_msgSend(v12, "didAttemptPromptReview");

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000055C8;
          block[3] = &unk_10000C470;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }

    }
  }

}

- (id)_storeReview
{
  if (qword_100011E40 != -1)
    dispatch_once(&qword_100011E40, &stru_10000C650);
  return (id)qword_100011E38;
}

- (void)_loadApplicationWithLaunchOptions:(id)a3
{
  SUUIApplicationController *applicationController;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SULegacyClientBridge *v11;
  SULegacyClientBridge *legacyBridge;
  SULegacyClientBridge *v13;
  void *v14;
  void *v15;
  id v16;

  applicationController = self->_applicationController;
  v5 = a3;
  v7 = objc_msgSend((id)objc_opt_class(applicationController, v6), "applicationOptionsWithLaunchOptions:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue(v7);

  -[SUUIApplicationController loadApplicationWithOptions:](self->_applicationController, "loadApplicationWithOptions:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientInterface"));
    v11 = (SULegacyClientBridge *)objc_msgSend(objc_alloc((Class)SULegacyClientBridge), "initWithClientInterface:", v10);
    legacyBridge = self->_legacyBridge;
    self->_legacyBridge = v11;

    v13 = self->_legacyBridge;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController tabBarController](self->_applicationController, "tabBarController"));
    -[SULegacyClientBridge setRootViewController:](v13, "setRootViewController:", v14);

    +[SUClientDispatch setClientBridge:](SUClientDispatch, "setClientBridge:", self->_legacyBridge);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "purchaseManager"));
    objc_msgSend(v15, "setDelegate:", self);

  }
}

- (id)_newDefaultTabBarItemsWithClientContext:(id)a3 style:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = SUUIUserInterfaceIdiom(v5);

  v8 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("music"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewMusicMain")));
  objc_msgSend(v8, "setRootURL:", v9);

  objc_msgSend(v6, "addObject:", v8);
  v10 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("movies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewMoviesMain")));
  objc_msgSend(v10, "setRootURL:", v11);

  objc_msgSend(v6, "addObject:", v10);
  v12 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("tv"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTVShowsMain")));
  objc_msgSend(v12, "setRootURL:", v13);

  objc_msgSend(v6, "addObject:", v12);
  if (!a4 || v7 != 1)
  {
    v14 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("search"));
    objc_msgSend(v6, "addObject:", v14);

  }
  v15 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("audiobooks"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAudiobooksMain")));
  objc_msgSend(v15, "setRootURL:", v16);

  objc_msgSend(v6, "addObject:", v15);
  if (v7 != 1)
  {
    v17 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("tones"));
    v18 = CFSTR("https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewRingtones");
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    v17 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("charts"));
    v18 = CFSTR("https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?genreId=34");
LABEL_8:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
    objc_msgSend(v17, "setRootURL:", v19);

    objc_msgSend(v6, "addObject:", v17);
  }
  v20 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("genius"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://my.itunes.apple.com/WebObjects/MZPersonalizer.woa/wa/seeAllRecommendations?html=true")));
  objc_msgSend(v20, "setRootURL:", v21);

  objc_msgSend(v6, "addObject:", v20);
  v22 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("purchased"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://se.itunes.apple.com/WebObjects/MZStoreElements.woa/wa/purchases?mode=UNHIDDEN")));
  objc_msgSend(v22, "setRootURL:", v23);

  objc_msgSend(v22, "setRootViewControllerClass:", objc_opt_class(SUStorePageViewController, v24));
  objc_msgSend(v6, "addObject:", v22);

  v25 = objc_msgSend(objc_alloc((Class)SUUITabBarItem), "initWithTabIdentifier:", CFSTR("downloads"));
  objc_msgSend(v6, "addObject:", v25);

  return v6;
}

- (void)_showExternalURL:(id)a3
{
  id v4;
  _QWORD *v5;
  id showURLBlock;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (+[MSOnboardingUtil shouldShowOnboarding](MSOnboardingUtil, "shouldShowOnboarding"))
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005CD4;
    v7[3] = &unk_10000C5B8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    v5 = objc_retainBlock(v7);
    showURLBlock = self->_showURLBlock;
    self->_showURLBlock = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SUUIApplicationController showExternalURL:](self->_applicationController, "showExternalURL:", v4);
  }

}

- (void)presentOnboardingIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD v8[2];

  if (self->_didDisplayFirstPage)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUUIApplicationController clientContext](self->_applicationController, "clientContext"));
    v8[0] = SUUIConfigurationKeyTabs;
    v8[1] = SUUIConfigurationKeyStopPages;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005E60;
    v5[3] = &unk_10000C730;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v3, "loadValueForConfigurationKeys:completionBlock:", v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_showURLBlock, 0);
  objc_storeStrong(&self->_quickActionBlock, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_legacyBridge, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_launchNotificationsController, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end
