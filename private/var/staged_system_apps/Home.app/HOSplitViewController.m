@implementation HOSplitViewController

- (HOSplitViewController)initWithStyle:(int64_t)a3
{
  HOSplitViewController *v3;
  HOBaseController *v4;
  HOBaseController *baseController;
  HUDashboardNavigationBar *v6;
  HUDashboardNavigationBar *navBar;
  NSMutableDictionary *v8;
  NSMutableDictionary *tabClassToNavigationControllerMap;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HOSplitViewController;
  v3 = -[HOSplitViewController initWithStyle:](&v12, "initWithStyle:", a3);
  if (v3)
  {
    v4 = -[HOBaseController initWithRootController:]([HOBaseController alloc], "initWithRootController:", v3);
    baseController = v3->_baseController;
    v3->_baseController = v4;

    v6 = (HUDashboardNavigationBar *)objc_alloc_init((Class)HUDashboardNavigationBar);
    navBar = v3->_navBar;
    v3->_navBar = v6;

    v8 = objc_opt_new(NSMutableDictionary);
    tabClassToNavigationControllerMap = v3->_tabClassToNavigationControllerMap;
    v3->_tabClassToNavigationControllerMap = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v10, "addHomeObserver:", v3);

    -[HOSplitViewController setDelegate:](v3, "setDelegate:", v3);
  }
  return v3;
}

- (void)viewDidLoad
{
  _UNKNOWN **v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  void *v46;

  v38.receiver = self;
  v38.super_class = (Class)HOSplitViewController;
  -[HOSplitViewController viewDidLoad](&v38, "viewDidLoad");
  -[HOSplitViewController setPrimaryBackgroundStyle:](self, "setPrimaryBackgroundStyle:", 0);
  -[HOSplitViewController _setUpWallpaper](self, "_setUpWallpaper");
  v3 = &_s10AppIntents0A6IntentPAAE16parameterSummaryQrvgZ_ptr;
  if (-[HOSplitViewController displayMode](self, "displayMode") == (id)2)
    v4 = 0;
  else
    v4 = +[HFUtilities isAMac](HFUtilities, "isAMac") ^ 1;
  -[HOSplitViewController setPresentsWithGesture:](self, "setPresentsWithGesture:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  if ((objc_msgSend(v5, "hasLoadedHomes") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));

    if (v7)
    {
      v8 = HFLogForCategory(59);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "initial load", buf, 2u);
      }

      -[HOSplitViewController _initialLoad](self, "_initialLoad");
      -[HOSplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 0);
      -[HOSplitViewController setInitialLoadCompleted:](self, "setInitialLoadCompleted:", 1);
      goto LABEL_13;
    }
  }
  else
  {

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController baseController](self, "baseController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadLoadingViewController"));

  -[HOSplitViewController showDetailViewController:sender:](self, "showDetailViewController:sender:", v11, 0);
  -[HOSplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 1);
  v12 = HFLogForCategory(59);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v15 = objc_msgSend(v14, "hasLoadedHomes");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "home"));
    *(_DWORD *)buf = 67109378;
    v44 = v15;
    v45 = 2112;
    v46 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Showing loading screen and hide sidebar, hasLoadedHomes:%d, hasHome: %@", buf, 0x12u);

  }
LABEL_13:
  v18 = HFLogForCategory(59);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "set sidebar as primary column", buf, 2u);
  }

  v20 = objc_alloc_init((Class)UINavigationController);
  -[HOSplitViewController setPrimaryNavigationController:](self, "setPrimaryNavigationController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = CFSTR("HOTabHomeTitle");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("HOTabHomeTitle"), CFSTR("_"), CFSTR("HOLocalizable")));

  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v23))
  {
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v24 = sub_100027F84();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
LABEL_18:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("HOTabHomeTitle"), CFSTR("HOTabHomeTitle"), v30));

        if (!-[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("HOTabHomeTitle")))
          break;

        if (v27 == (id)++v29)
        {
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
          if (v27)
            goto LABEL_18;
          v32 = CFSTR("_");
          break;
        }
      }
      v3 = &_s10AppIntents0A6IntentPAAE16parameterSummaryQrvgZ_ptr;
      v22 = CFSTR("HOTabHomeTitle");
    }
    else
    {
      v32 = CFSTR("_");
    }

    v23 = v32;
  }
  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v23))
    NSLog(CFSTR("Sensitive key '%@' not found!"), CFSTR("HOTabHomeTitle"));
  else
    v22 = v23;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController primaryNavigationController](self, "primaryNavigationController"));
  objc_msgSend(v33, "setTitle:", v22);

  LODWORD(v33) = objc_msgSend(v3[454], "isAMac");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController primaryNavigationController](self, "primaryNavigationController"));
  v35 = v34;
  if ((_DWORD)v33)
  {
    objc_msgSend(v34, "setNavigationBarHidden:", 1);

    -[HOSplitViewController loadSideBarWithDisplayModeChangeAllowed:](self, "loadSideBarWithDisplayModeChangeAllowed:", 1);
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "navigationBar"));
    objc_msgSend(v36, "setPrefersLargeTitles:", 1);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController primaryNavigationController](self, "primaryNavigationController"));
  -[HOSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v37, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOSplitViewController;
  -[HOSplitViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController baseController](self, "baseController"));
  objc_msgSend(v4, "reloadInitialSetup");

}

- (HOMainTabBarController)mainTabBarController
{
  HOMainTabBarController *mainTabBarController;
  HOMainTabBarController *v4;
  HOMainTabBarController *v5;

  mainTabBarController = self->_mainTabBarController;
  if (!mainTabBarController)
  {
    v4 = objc_alloc_init(HOMainTabBarController);
    v5 = self->_mainTabBarController;
    self->_mainTabBarController = v4;

    mainTabBarController = self->_mainTabBarController;
  }
  return mainTabBarController;
}

- (void)loadSideBarWithDisplayModeChangeAllowed:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[8];
  _QWORD v21[4];
  id v22;
  BOOL v23;
  id location;

  v5 = objc_alloc((Class)HUSideBarViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
  v8 = objc_msgSend(v5, "initWithDelegate:forHome:", self, v7);
  -[HOSplitViewController setSideBarViewController:](self, "setSideBarViewController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController sideBarViewController](self, "sideBarViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController sideBarViewController](self, "sideBarViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemManager"));
  objc_msgSend(v9, "updateWithSideBarViewController:sideBarItemManager:", v10, v12);

  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController sideBarViewController](self, "sideBarViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstFastUpdateFuture"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100025C90;
  v21[3] = &unk_1000B67A0;
  objc_copyWeak(&v22, &location);
  v23 = a3;
  v16 = objc_msgSend(v15, "addSuccessBlock:", v21);

  v17 = HFLogForCategory(59);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "push actual sidebar view controller onto primary navigation controller", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025DF8;
  block[3] = &unk_1000B5A50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (BOOL)wantsAccessoryControlsCard
{
  return -[HOSplitViewController isCollapsed](self, "isCollapsed") ^ 1;
}

- (void)didLoadLoadingViewController
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = HFLogForCategory(59);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "show only secondary view for side bar after setting loading view", v5, 2u);
  }

  -[HOSplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 1);
}

- (id)currentViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController viewControllers](self, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (void)setLoadingViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if ((-[HOSplitViewController isCollapsed](self, "isCollapsed") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController primaryNavigationController](self, "primaryNavigationController"));
    -[HOSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v5, 0);

    -[HOSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", 0, 2);
    -[HOSplitViewController showDetailViewController:sender:](self, "showDetailViewController:sender:", v4, 0);
    v6 = HFLogForCategory(59);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "show loading view after home change result in no home", v8, 2u);
    }

  }
}

- (void)didLoadHome:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController sideBarViewController](self, "sideBarViewController"));
  objc_msgSend(v5, "switchToSelectedHome:", v4);

  -[HOSplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 0);
  v6 = HFLogForCategory(59);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "refresh sidebar after home change: %@", (uint8_t *)&v13, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 2));
  v9 = objc_opt_class(HOMainLoadingViewController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = HFLogForCategory(59);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "initial load after a home switch: %@", (uint8_t *)&v13, 0xCu);
    }

    -[HOSplitViewController _initialLoad](self, "_initialLoad");
  }

}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  HOSplitViewController *v19;
  id v20;
  id v21;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
  objc_msgSend(v5, "setSelectedHomeAppTabIdentifier:", v4);

  v6 = objc_alloc_init((Class)NAFuture);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController _loadNavigationViewControllerForIdentifier:](self, "_loadNavigationViewControllerForIdentifier:", v4));
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000262DC;
  v16[3] = &unk_1000B6818;
  v9 = v8;
  v17 = v9;
  v10 = v4;
  v18 = v10;
  v19 = self;
  objc_copyWeak(&v21, &location);
  v11 = v6;
  v20 = v11;
  v12 = objc_msgSend(v7, "addCompletionBlock:", v16);
  v13 = v20;
  v14 = v11;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v14;
}

- (void)switchToHomeForTabIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  int v43;
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));

  if (objc_msgSend(v6, "hf_currentUserIsRestrictedGuest"))
  {
    v7 = HFLogForCategory(59);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_prettyDescription"));
      v43 = 136315906;
      v44 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      v45 = 2112;
      v46 = v4;
      v47 = 2112;
      v48 = v10;
      v49 = 2112;
      v50 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Switching to 'home' tab instead of '%@' because current user is RG | user = %@ | home = %@", (uint8_t *)&v43, 0x2Au);

    }
    v11 = HFHomeAppTabIdentifierHome;

    v4 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedHomeAppTabIdentifier"));
  v14 = objc_msgSend(v13, "isEqualToString:", v4);

  if (v14)
  {
    v15 = objc_opt_class(UINavigationController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController currentViewController](self, "currentViewController"));
    v17 = (objc_opt_isKindOfClass(v16, v15) & 1) != 0 ? v16 : 0;
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewControllers"));
    v20 = objc_msgSend(v19, "count");

    if (v20 == (id)1)
    {
      v21 = HFLogForCategory(59);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "home"));
        v43 = 136315650;
        v44 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
        v45 = 2112;
        v46 = v4;
        v47 = 2112;
        v48 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "(%s) scrolling to top instead of tab switching since we are already displaying the tab: %@ for home %@", (uint8_t *)&v43, 0x20u);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
      objc_msgSend(v25, "scrollToDefaultPositionInCurrentContextAnimated:", 1);
LABEL_25:

      goto LABEL_26;
    }
  }
  if (objc_msgSend(v4, "isEqualToString:", HFHomeAppTabIdentifierTriggers))
  {
    v26 = HFLogForCategory(59);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "home"));
      v43 = 136315394;
      v44 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      v45 = 2112;
      v46 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "(%s) show automation tab for %@", (uint8_t *)&v43, 0x16u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
    v30 = objc_msgSend(v25, "showAutomationTab");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", HFHomeAppTabIdentifierHome))
  {
    v31 = HFLogForCategory(59);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "home"));
      v43 = 136315394;
      v44 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      v45 = 2112;
      v46 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "(%s) show home tab for %@", (uint8_t *)&v43, 0x16u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "home"));
    v37 = objc_msgSend(v25, "showHome:animated:", v36, 0);

    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", HFHomeAppTabIdentifierDiscover))
  {
    v38 = HFLogForCategory(59);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "home"));
      v43 = 136315394;
      v44 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      v45 = 2112;
      v46 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "(%s) show discover tab for %@", (uint8_t *)&v43, 0x16u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
    v42 = objc_msgSend(v25, "showDiscoverTab");
    goto LABEL_25;
  }
LABEL_26:

}

- (void)switchToRoom:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = HFLogForCategory(59);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "show room: %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  v8 = objc_msgSend(v7, "showRoom:animated:", v4, 0);

}

- (void)switchToAccessoryTypeGroup:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = HFLogForCategory(59);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "show accessory type group: %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
  v10 = objc_msgSend(v7, "showAccessoryTypeGroup:forHome:animated:", v4, v9, 1);

}

- (void)_initialLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedHomeAppTabIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController _loadNavigationViewControllerForIdentifier:](self, "_loadNavigationViewControllerForIdentifier:", v4));

  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController _loadNavigationViewControllerForIdentifier:](self, "_loadNavigationViewControllerForIdentifier:", HFHomeAppTabIdentifierHome));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentContext"));
  objc_msgSend(v6, "configureDashboardContextWithDashboardContext:navigationController:animated:", v8, v5, 0);

  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hu_preloadContent"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026FA8;
  v12[3] = &unk_1000B6868;
  v12[4] = self;
  objc_copyWeak(&v14, &location);
  v10 = v5;
  v13 = v10;
  v11 = objc_msgSend(v9, "addCompletionBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_setUpWallpaper
{
  HUWallpaperView *v3;
  HUWallpaperView *wallpaperView;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  _QWORD v9[5];

  if (!self->_wallpaperView)
  {
    v3 = (HUWallpaperView *)objc_msgSend(objc_alloc((Class)HUWallpaperView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = v3;

    -[HUWallpaperView setTranslatesAutoresizingMaskIntoConstraints:](self->_wallpaperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUWallpaperView setHidden:](self->_wallpaperView, "setHidden:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController view](self, "view"));
    objc_msgSend(v5, "addSubview:", self->_wallpaperView);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController view](self, "view"));
    objc_msgSend(v6, "sendSubviewToBack:", self->_wallpaperView);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000271A0;
    v9[3] = &unk_1000B6890;
    v9[4] = self;
    v7 = sub_1000271A0((uint64_t)v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

  }
}

- (void)_loadWallpaperWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTabIdentifier"));
  v7 = objc_msgSend(v6, "isEqualToString:", HFHomeAppTabIdentifierHome);

  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager")), v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dashboarHomeKitObject")), v8, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController wallpaperView](self, "wallpaperView"));
    objc_msgSend(v10, "setHidden:", 0);

    v11 = HFLogForCategory(59);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "load wallpaper for hkObject: %@", buf, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController wallpaperView](self, "wallpaperView"));
    v14 = objc_msgSend(v13, "refreshWallpaperForHomeKitObject:withAnimation:", v9, v3);

  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[HOSplitViewController wallpaperView](self, "wallpaperView"));
    objc_msgSend(v15, "setHidden:", 1);

  }
}

- (id)_loadNavigationViewControllerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __objc2_class **v9;
  void *v10;
  int v11;
  id v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", HFHomeAppTabIdentifierTriggers))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
    if ((objc_msgSend(v6, "hf_hasAnyVisibleTriggers") & 1) != 0)
    {
LABEL_5:

      v9 = (__objc2_class **)HUTriggerListViewController_ptr;
      goto LABEL_12;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    if ((objc_msgSend(v8, "hf_userCanCreateTrigger") & 1) != 0)
    {

      goto LABEL_5;
    }
    v11 = HFForceAllowAutomationCreation();

    v9 = (__objc2_class **)HUAboutResidentDeviceViewController_ptr;
    if (v11)
      v9 = (__objc2_class **)HUTriggerListViewController_ptr;
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFHomeAppTabIdentifierDiscover)
         && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFStoreLocaleAvailability getAvailabilityDictionary](HFStoreLocaleAvailability, "getAvailabilityDictionary")), v10, v10))
  {
    v9 = &off_1000B4ED0;
  }
  else
  {
    v9 = (__objc2_class **)HUDashboardViewController_ptr;
  }
LABEL_12:
  v12 = -[HOSplitViewController navigationControllerFromMapWithClass:](self, "navigationControllerFromMapWithClass:", objc_opt_class(*v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)navigationControllerFromMapWithClass:(Class)a3
{
  void *v5;
  id v6;
  unsigned int v7;
  _QWORD *v8;
  uint64_t v9;
  HODiscoverWebViewController *v10;
  void *v11;
  HODiscoverWebViewController *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController tabClassToNavigationControllerMap](self, "tabClassToNavigationControllerMap"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", a3));

  if (!v6)
  {
    v7 = -[objc_class isEqual:](a3, "isEqual:", objc_opt_class(HUDashboardViewController));
    v8 = HUDashboardNavigationBar_ptr;
    if (!v7)
      v8 = UINavigationBar_ptr;
    v9 = objc_opt_class(*v8);
    if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(HODiscoverWebViewController)))
    {
      v10 = [HODiscoverWebViewController alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFStoreLocaleAvailability getAvailabilityDictionary](HFStoreLocaleAvailability, "getAvailabilityDictionary"));
      v12 = -[HODiscoverWebViewController initWithLocalizationDictionary:](v10, "initWithLocalizationDictionary:", v11);

    }
    else
    {
      v12 = (HODiscoverWebViewController *)objc_alloc_init(a3);
    }
    v6 = objc_msgSend(objc_alloc((Class)HUDashboardNavigationController), "initWithNavigationBarClass:toolbarClass:", v9, 0);
    objc_msgSend(v6, "pushViewController:animated:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController tabClassToNavigationControllerMap](self, "tabClassToNavigationControllerMap"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, a3);

  }
  return v6;
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6;
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
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint8_t v21[16];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentContext"));

  if (a4 != 3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController mainTabBarController](self, "mainTabBarController"));
    objc_msgSend(v6, "setViewController:forColumn:", v9, 3);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController mainTabBarController](self, "mainTabBarController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  objc_msgSend(v11, "setRootViewController:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController mainTabBarController](self, "mainTabBarController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "baseController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  objc_msgSend(v14, "setBaseController:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController mainTabBarController](self, "mainTabBarController"));
  objc_msgSend(v16, "setNavigator:", v15);

  v17 = HFLogForCategory(59);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "initial load after switching to tab bar view", v21, 2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController mainTabBarController](self, "mainTabBarController"));
  objc_msgSend(v19, "refreshAfterSidebarTabbarSwitchWithDashboardContext:", v8);

  return 3;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController baseController](self, "baseController", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  objc_msgSend(v7, "setBaseController:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  objc_msgSend(v8, "setRootViewController:", self);

  v9 = HFLogForCategory(59);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "initial load after switching to side bar view", v12, 2u);
  }

  -[HOSplitViewController _initialLoad](self, "_initialLoad");
  return a4;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  void *v6;
  _QWORD v7[6];

  if ((+[HFUtilities isAMac](HFUtilities, "isAMac", a3) & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027AF0;
    v7[3] = &unk_1000B68B8;
    v7[4] = self;
    v7[5] = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
    if (a4 != 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController sideBarViewController](self, "sideBarViewController"));

      if (!v6)
        -[HOSplitViewController loadSideBarWithDisplayModeChangeAllowed:](self, "loadSideBarWithDisplayModeChangeAllowed:", 0);
    }
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  HOSideBarPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HOSideBarPresentationController initWithPresentedViewController:presentingViewController:]([HOSideBarPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (void)selectDiscoverTab:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v4 = HFLogForCategory(59);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "show learn tab", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOSplitViewController appNavigator](self, "appNavigator"));
  v7 = objc_msgSend(v6, "showDiscoverTab");

}

- (void)contextDidUpdate
{
  -[HOSplitViewController _loadWallpaperWithAnimation:](self, "_loadWallpaperWithAnimation:", 0);
}

- (void)homeDidUpdateWallpaper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTabIdentifier"));
  if ((objc_msgSend(v5, "isEqualToString:", HFHomeAppTabIdentifierHome) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dashboarHomeKitObject"));
    v8 = objc_msgSend(v7, "isEqual:", v9);

    if (v8)
      -[HOSplitViewController _loadWallpaperWithAnimation:](self, "_loadWallpaperWithAnimation:", 1);
  }
  else
  {

  }
}

- (void)home:(id)a3 didUpdateWallpaperForRoom:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTabIdentifier"));
  if ((objc_msgSend(v6, "isEqualToString:", HFHomeAppTabIdentifierHome) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dashboarHomeKitObject"));
    v9 = objc_msgSend(v8, "isEqual:", v10);

    if (v9)
      -[HOSplitViewController _loadWallpaperWithAnimation:](self, "_loadWallpaperWithAnimation:", 1);
  }
  else
  {

  }
}

- (HOAppNavigator)appNavigator
{
  return self->_appNavigator;
}

- (void)setAppNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_appNavigator, a3);
}

- (HOBaseController)baseController
{
  return self->_baseController;
}

- (void)setBaseController:(id)a3
{
  objc_storeStrong((id *)&self->_baseController, a3);
}

- (HUSideBarViewController)sideBarViewController
{
  return self->_sideBarViewController;
}

- (void)setSideBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sideBarViewController, a3);
}

- (void)setMainTabBarController:(id)a3
{
  objc_storeStrong((id *)&self->_mainTabBarController, a3);
}

- (UINavigationController)primaryNavigationController
{
  return self->_primaryNavigationController;
}

- (void)setPrimaryNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryNavigationController, a3);
}

- (HUDashboardNavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (BOOL)initialLoadCompleted
{
  return self->_initialLoadCompleted;
}

- (void)setInitialLoadCompleted:(BOOL)a3
{
  self->_initialLoadCompleted = a3;
}

- (NSMutableDictionary)tabClassToNavigationControllerMap
{
  return self->_tabClassToNavigationControllerMap;
}

- (void)setTabClassToNavigationControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_tabClassToNavigationControllerMap, a3);
}

- (HUWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_tabClassToNavigationControllerMap, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_primaryNavigationController, 0);
  objc_storeStrong((id *)&self->_mainTabBarController, 0);
  objc_storeStrong((id *)&self->_sideBarViewController, 0);
  objc_storeStrong((id *)&self->_baseController, 0);
  objc_storeStrong((id *)&self->_appNavigator, 0);
  objc_storeStrong((id *)&self->dashboardNavigator, 0);
}

@end
