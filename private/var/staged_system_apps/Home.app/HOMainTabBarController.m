@implementation HOMainTabBarController

- (void)_setSelectedViewController:(id)a3 persistSelection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[HOMainTabBarController setChangingSelectedViewControllerProgrammatically:](self, "setChangingSelectedViewControllerProgrammatically:", 1);
  -[HOMainTabBarController setSelectedViewController:](self, "setSelectedViewController:", v6);

  if (v4)
    -[HOMainTabBarController _persistLastSelectedTab](self, "_persistLastSelectedTab");
  -[HOMainTabBarController setChangingSelectedViewControllerProgrammatically:](self, "setChangingSelectedViewControllerProgrammatically:", 0);
}

- (id)_navigationControllerForMainTabIdentifier:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController _itemForMainTabIdentifier:](self, "_itemForMainTabIdentifier:", a3));
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController _navigationControllerForItem:](self, "_navigationControllerForItem:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)_itemForMainTabIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController itemManager](self, "itemManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allDisplayedItems"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006010;
  v10[3] = &unk_1000B7C60;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v10));

  return v8;
}

- (id)_navigationControllerForInitialSelection
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedHomeAppTabIdentifier"));

  if (objc_msgSend(UIApp, "launchedToTest"))
  {
    v6 = HFHomeAppTabIdentifierHome;

    v5 = v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController _navigationControllerForMainTabIdentifier:](self, "_navigationControllerForMainTabIdentifier:", v5));
  if (!v7)
  {
    if (v5)
    {
      v8 = HFLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100078898((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController _navigationControllerForMainTabIdentifier:](self, "_navigationControllerForMainTabIdentifier:", HFHomeAppTabIdentifierHome));
    if (!v7)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOMainTabBarController.m"), 553, CFSTR("We should always have a navigation controller for the Home tab"));

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_shouldShowOnboardingWelcomeOrLoadingView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "homeManager"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  if (v5)
    v6 = objc_msgSend(v3, "hf_hasSeenOnboardingWelcomeView") ^ 1;
  else
    LOBYTE(v6) = 1;

  if (objc_msgSend(v3, "dataSyncState") == (id)1)
    v7 = v6;
  else
    v7 = 1;

  return v7;
}

- (HOMainTabBarController)init
{
  HOMainTabBarController *v3;
  HOMainTabBarController *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *tabClassToNavigationControllerMap;
  uint64_t v8;
  NSMutableArray *viewVisibleFutures;
  NAFuture *v10;
  NAFuture *loadTabsFuture;
  HOBaseController *v12;
  HOBaseController *baseController;
  HOMainTabBarItemManager *v14;
  HOMainTabBarItemManager *itemManager;
  id v16;
  uint64_t v17;
  NAFuture *dataSyncStateChangeProcessingFuture;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HOMainTabBarController;
  v3 = -[HOMainTabBarController init](&v20, "init");
  v4 = v3;
  if (v3)
  {
    -[HOMainTabBarController setDelegate:](v3, "setDelegate:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController tabBar](v4, "tabBar"));
    objc_msgSend(v5, "setBarStyle:", 0);

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    tabClassToNavigationControllerMap = v4->_tabClassToNavigationControllerMap;
    v4->_tabClassToNavigationControllerMap = (NSMutableDictionary *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    viewVisibleFutures = v4->_viewVisibleFutures;
    v4->_viewVisibleFutures = (NSMutableArray *)v8;

    v10 = (NAFuture *)objc_alloc_init((Class)NAFuture);
    loadTabsFuture = v4->_loadTabsFuture;
    v4->_loadTabsFuture = v10;

    v12 = -[HOBaseController initWithRootController:]([HOBaseController alloc], "initWithRootController:", v4);
    baseController = v4->_baseController;
    v4->_baseController = v12;

    v14 = -[HOMainTabBarItemManager initWithDelegate:]([HOMainTabBarItemManager alloc], "initWithDelegate:", v4);
    itemManager = v4->_itemManager;
    v4->_itemManager = v14;

    v16 = -[HOMainTabBarItemManager reloadAndUpdateAllItemsFromSenderSelector:](v4->_itemManager, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
    v17 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    dataSyncStateChangeProcessingFuture = v4->_dataSyncStateChangeProcessingFuture;
    v4->_dataSyncStateChangeProcessingFuture = (NAFuture *)v17;

  }
  return v4;
}

+ (void)_checkForTestingFlags
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id updated;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint8_t v23[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));

  v4 = objc_alloc((Class)HFUserItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));
  v6 = objc_msgSend(v4, "initWithHome:user:nameStyle:", v3, v5, 0);

  v7 = (id)HFCheckAndClearResetIdentifyVoicePreference();
  if ((_DWORD)v7)
  {
    v8 = objc_msgSend(v6, "setDismissIdentifyVoiceOnboarding:", 0);
    v7 = objc_msgSend(v6, "setDismissIdentifyVoiceReminderBanner:", 0);
  }
  v9 = (id)HFCheckAndClearResetAnnouncePreference(v7);
  if ((_DWORD)v9)
    v9 = objc_msgSend(v6, "setDismissAnnounceOnboarding:", 0);
  v10 = (id)HFCheckAndClearResetHomeTheaterPreference(v9);
  if ((_DWORD)v10)
    v10 = objc_msgSend(v6, "setDismissHomeTheaterOnboarding:", 0);
  v11 = (id)HFCheckAndClearResetTVViewingProfilesPreference(v10);
  if ((_DWORD)v11)
  {
    v12 = objc_msgSend(v6, "setDismissTVViewingProfilesOnboarding:", 0);
    v11 = objc_msgSend(v6, "setDismissTVViewingProfilesReminderBanner:", 0);
  }
  v13 = (id)HFCheckAndClearResetNaturalLightingPreference(v11);
  if ((_DWORD)v13)
    v13 = objc_msgSend(v6, "setDismissNaturalLightingOnboarding:", 0);
  v14 = (id)HFCheckAndClearResetCameraRecordingPreference(v13);
  if ((_DWORD)v14)
  {
    v15 = objc_msgSend(v6, "setDismissCameraRecordingOnboarding:", 0);
    v14 = objc_msgSend(v6, "setDismissCameraRecordingReminderBanner:", 0);
  }
  v16 = (id)HFCheckAndClearResetWalletKeyExpressModePreference(v14);
  if ((_DWORD)v16)
    v16 = objc_msgSend(v6, "setDismissWalletKeyExpressModeOnboarding:forWalletKeyUUID:", 0, 0);
  v17 = (id)HFCheckAndClearResetAccessCodePreference(v16);
  if ((_DWORD)v17)
    v17 = objc_msgSend(v6, "setDismissAccessCodeOnboarding:", 0);
  updated = (id)HFCheckAndClearResetAccessoryFirmwareUpdatePreference(v17);
  if ((_DWORD)updated)
    updated = objc_msgSend(v6, "setDismissAccessoryFirmwareUpdateOnboarding:", 0);
  v19 = (id)HFCheckAndClearResetUtilityPreference(updated);
  if ((_DWORD)v19)
    v19 = objc_msgSend(v6, "setDismissUtilityOnboarding:", 0);
  if (HFCheckAndClearResetRedesignMigrationPreference(v19))
  {
    v20 = HFLogForCategory(9);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Resetting hf_homeHasMigratedForRedesign", v23, 2u);
    }

    v22 = objc_msgSend(v3, "hf_setHomeHasMigratedForRedesign:", 0);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HOMainTabBarController;
  -[HOMainTabBarController viewDidAppear:](&v12, "viewDidAppear:", a3);
  -[HOMainTabBarController setViewVisible:](self, "setViewVisible:", 1);
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController loadTabsFuture](self, "loadTabsFuture"));
    v5 = objc_msgSend(v4, "addCompletionBlock:", &stru_1000B7B48);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController baseController](self, "baseController"));
  objc_msgSend(v6, "reloadInitialSetup");

  if (!-[HOMainTabBarController _debug_viewHasEverAppeared](self, "_debug_viewHasEverAppeared"))
  {
    -[HOMainTabBarController set_debug_viewHasEverAppeared:](self, "set_debug_viewHasEverAppeared:", 1);
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController loadTabsFuture](self, "loadTabsFuture"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006AF4;
    v9[3] = &unk_1000B7B70;
    objc_copyWeak(&v10, &location);
    v8 = objc_msgSend(v7, "addCompletionBlock:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_reloadNavigationControllers
{
  void *v3;
  uint64_t v4;
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
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController itemManager](self, "itemManager"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayedItemsInSection:", 0));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E13C;
  v19[3] = &unk_1000B5D60;
  v19[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "na_map:", v19));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController loadTabsFuture](self, "loadTabsFuture"));
  LOBYTE(v4) = objc_msgSend(v6, "isFinished");

  if ((v4 & 1) == 0)
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      if ((objc_msgSend(v7, "hasLoadedHomes") & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));

        if (v9)
          goto LABEL_8;
      }
      else
      {

      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController baseController](self, "baseController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadLoadingViewController"));

    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    -[HOMainTabBarController setViewControllers:](self, "setViewControllers:", v12);

  }
LABEL_8:
  if (objc_msgSend(v5, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController wallpaperView](self, "wallpaperView"));
    objc_msgSend(v13, "removeFromSuperview");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController loadTabsFuture](self, "loadTabsFuture"));
    v15 = objc_msgSend(v14, "isFinished");

    if (v15)
    {
      -[HOMainTabBarController setViewControllers:animated:](self, "setViewControllers:animated:", v5, 0);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController _navigationControllerForInitialSelection](self, "_navigationControllerForInitialSelection"));
      v17 = objc_msgSend(v16, "hu_preloadContent");
      -[HOMainTabBarController setViewControllers:animated:](self, "setViewControllers:animated:", v5, 0);
      -[HOMainTabBarController _setSelectedViewController:persistSelection:](self, "_setSelectedViewController:persistSelection:", v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController loadTabsFuture](self, "loadTabsFuture"));
      objc_msgSend(v18, "finishWithNoResult");

    }
  }

}

- (NAFuture)loadTabsFuture
{
  return self->_loadTabsFuture;
}

- (void)setViewVisible:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  BOOL v8;

  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController viewVisibleFutures](self, "viewVisibleFutures"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000E0F8;
    v7[3] = &unk_1000B7B08;
    v8 = a3;
    objc_msgSend(v5, "na_each:", v7);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController viewVisibleFutures](self, "viewVisibleFutures"));
    objc_msgSend(v6, "removeAllObjects");

  }
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a5;
  if (-[HOMainTabBarController isViewVisible](self, "isViewVisible")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate)),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        (v8 & 1) != 0))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100008070;
    v14[3] = &unk_1000B7428;
    v10 = objc_alloc_init((Class)NAFuture);
    v15 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v14));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController viewVisibleFutures](self, "viewVisibleFutures"));
    objc_msgSend(v12, "addObject:", v11);

    v9 = v10;
  }

  return v9;
}

- (NSMutableArray)viewVisibleFutures
{
  return self->_viewVisibleFutures;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (id)_navigationControllerForItem:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;
  id v14;
  HODiscoverWebViewController *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  HODiscoverWebViewController *v19;
  void *v20;
  void *v21;
  HODiscoverWebViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
  v6 = (objc_class *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HOResultTabClassKey"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HOResultTabTitleKey")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", HFResultDisplayIconNamesKey));

  if (v6)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11 || v10 == 0)
  {
    NSLog(CFSTR("Tab does not have required keys for item: %@"), v4);
    v14 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController tabClassToNavigationControllerMap](self, "tabClassToNavigationControllerMap"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v6));

    if (v14)
    {
      v15 = (HODiscoverWebViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController"));
      -[HOMainTabBarController _configureTabBarWithImageNamed:forViewController:](self, "_configureTabBarWithImageNamed:forViewController:", v10, v15);
    }
    else
    {
      v15 = (HODiscoverWebViewController *)objc_alloc_init(v6);
      if (-[objc_class isEqual:](v6, "isEqual:", objc_opt_class(HODiscoverWebViewController)))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HOResultMainTabIdentifierKey")));
        v18 = objc_msgSend(v17, "isEqualToString:", HFHomeAppTabIdentifierDiscover);

        if (v18)
        {
          v19 = [HODiscoverWebViewController alloc];
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", HFResultStoreLocaleDictionaryArgumentsKey));
          v22 = -[HODiscoverWebViewController initWithLocalizationDictionary:](v19, "initWithLocalizationDictionary:", v21);

          v15 = v22;
        }
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController tabBarItem](v15, "tabBarItem"));
      objc_msgSend(v23, "setTitle:", v8);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Home.Tab.%@"), v8));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController tabBarItem](v15, "tabBarItem"));
      objc_msgSend(v25, "setAccessibilityIdentifier:", v24);

      -[HOMainTabBarController _configureTabBarWithImageNamed:forViewController:](self, "_configureTabBarWithImageNamed:forViewController:", v10, v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HOResultNavigationBarClassKey")));
      v28 = (uint64_t)v27;
      if (!v27)
        v28 = objc_opt_class(UINavigationBar);

      v14 = objc_msgSend(objc_alloc((Class)HUDashboardNavigationController), "initWithNavigationBarClass:toolbarClass:", v28, 0);
      objc_msgSend(v14, "pushViewController:animated:", v15, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController tabClassToNavigationControllerMap](self, "tabClassToNavigationControllerMap"));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, v6);

    }
  }

  return v14;
}

- (NSMutableDictionary)tabClassToNavigationControllerMap
{
  return self->_tabClassToNavigationControllerMap;
}

- (void)_configureTabBarWithImageNamed:(id)a3 forViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000D2818, "objectForKey:", v9));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v9));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_imageThatSuppressesAccessibilityHairlineThickening"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tabBarItem"));
  objc_msgSend(v8, "setImage:", v6);

}

- (HUWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  HUWallpaperView *v5;
  HUWallpaperView *wallpaperView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HOMainTabBarController;
  -[HOMainTabBarController viewDidLoad](&v11, "viewDidLoad");
  if (-[HOMainTabBarController _shouldShowOnboardingWelcomeOrLoadingView](self, "_shouldShowOnboardingWelcomeOrLoadingView"))
  {
    v3 = objc_alloc((Class)HUWallpaperView);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController view](self, "view"));
    objc_msgSend(v4, "bounds");
    v5 = (HUWallpaperView *)objc_msgSend(v3, "initWithFrame:");
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = v5;

    -[HUWallpaperView setAutoresizingMask:](self->_wallpaperView, "setAutoresizingMask:", 18);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController view](self, "view"));
    objc_msgSend(v7, "addSubview:", self->_wallpaperView);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController view](self, "view"));
    objc_msgSend(v8, "sendSubviewToBack:", self->_wallpaperView);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultWallpaperForCollectionType:", 0));

    -[HUWallpaperView populateWallpaper:withAnimation:onlyIfNeeded:](self->_wallpaperView, "populateWallpaper:withAnimation:onlyIfNeeded:", v10, 1, 1);
  }
}

- (void)set_debug_viewHasEverAppeared:(BOOL)a3
{
  self->__debug_viewHasEverAppeared = a3;
}

- (void)setNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_navigator, a3);
}

- (void)setChangingSelectedViewControllerProgrammatically:(BOOL)a3
{
  self->_changingSelectedViewControllerProgrammatically = a3;
}

- (HOMainTabBarItemManager)itemManager
{
  return self->_itemManager;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  objc_msgSend(a4, "performWithOptions:", 0);
  -[HOMainTabBarController _reloadNavigationControllers](self, "_reloadNavigationControllers");
}

- (HOBaseController)baseController
{
  return self->_baseController;
}

- (BOOL)_debug_viewHasEverAppeared
{
  return self->__debug_viewHasEverAppeared;
}

+ (id)preloadTabIcons
{
  if (qword_1000D2828 != -1)
    dispatch_once(&qword_1000D2828, &stru_1000B7CC0);
  return (id)qword_1000D2820;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[HOMainTabBarController setViewVisible:](self, "setViewVisible:", 0);
  v5.receiver = self;
  v5.super_class = (Class)HOMainTabBarController;
  -[HOMainTabBarController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (id)selectCurrentTab
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedHomeAppTabIdentifier"));
  v5 = (void *)v4;
  v6 = (void *)HFHomeAppTabIdentifierHome;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController selectTabWithIdentifier:](self, "selectTabWithIdentifier:", v7));
  return v8;
}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = HFLogForCategory(70);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[HOMainTabBarController selectTabWithIdentifier:]";
    v21 = 2112;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, tabIdentifier: %@", buf, 0x16u);
  }

  v7 = objc_alloc_init((Class)NAFuture);
  objc_initWeak((id *)buf, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController loadTabsFuture](self, "loadTabsFuture"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003CE9C;
  v15[3] = &unk_1000B7BE8;
  objc_copyWeak(&v18, (id *)buf);
  v9 = v4;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  v11 = objc_msgSend(v8, "addCompletionBlock:", v15);

  v12 = v17;
  v13 = v10;

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

  return v13;
}

- (id)dismissPresentedViewControllersAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", v3));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003D3E0;
  v8[3] = &unk_1000B7C10;
  objc_copyWeak(&v9, &location);
  v10 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v8));
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

- (id)tabBarController:(id)a3 animationControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  if (-[HOMainTabBarController changingSelectedViewControllerProgrammatically](self, "changingSelectedViewControllerProgrammatically", a3, a4, a5))
  {
    return 0;
  }
  else
  {
    return objc_alloc_init((Class)HUPreloadedTransitionController);
  }
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectedViewController"));
  -[HOMainTabBarController setShouldScrollToDefaultPosition:](self, "setShouldScrollToDefaultPosition:", v7 == v6);

  v8 = objc_opt_class(UINavigationController);
  v9 = v6;
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (-[HOMainTabBarController shouldScrollToDefaultPosition](self, "shouldScrollToDefaultPosition") && v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
    -[HOMainTabBarController setShouldScrollToDefaultPosition:](self, "setShouldScrollToDefaultPosition:", objc_msgSend(v12, "count") == (id)1);

  }
  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[HOMainTabBarController tabBarController:didSelectViewController:]";
    v10 = 2048;
    v11 = -[HOMainTabBarController selectedIndex](self, "selectedIndex");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) User selected tab index %lu", (uint8_t *)&v8, 0x16u);
  }

  -[HOMainTabBarController _persistLastSelectedTab](self, "_persistLastSelectedTab");
  if (-[HOMainTabBarController shouldScrollToDefaultPosition](self, "shouldScrollToDefaultPosition"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController navigator](self, "navigator"));
    objc_msgSend(v7, "scrollToDefaultPositionInCurrentContextAnimated:", 1);

    -[HOMainTabBarController setShouldScrollToDefaultPosition:](self, "setShouldScrollToDefaultPosition:", 0);
  }
}

- (unint64_t)_indexOfTabForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController itemManager](self, "itemManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayedItemsInSection:", 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D730;
  v10[3] = &unk_1000B7C38;
  v11 = v4;
  v7 = v4;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);

  return (unint64_t)v8;
}

- (id)_displayedIdentifiersArray
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController itemManager](self, "itemManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayedItemsInSection:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_1000B7CA0));

  return v4;
}

- (void)_persistLastSelectedTab
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;

  v3 = -[HOMainTabBarController selectedIndex](self, "selectedIndex");
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(CFSTR("UITabBarController doesn't have a selected tab!"), 0);
  }
  else
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController itemManager](self, "itemManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v4, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayedItemAtIndexPath:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "latestResults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HOResultMainTabIdentifierKey")));

    if (v9)
    {
      v10 = HFLogForCategory(68);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[HOMainTabBarController _persistLastSelectedTab]";
        v17 = 2112;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) Persisting tab: %@", buf, 0x16u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
      objc_msgSend(v12, "setSelectedHomeAppTabIdentifier:", v9);

      if (objc_msgSend(v9, "isEqualToString:", HFHomeAppTabIdentifierDiscover))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, HFAnalyticsDiscoverTabTapCountKey);

        +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 10, v13);
      }
    }
    else
    {
      NSLog(CFSTR("Tab item: %@ is missing a persistant identifier"), v7);
    }

  }
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController presentedViewController](self, "presentedViewController"));
  v8 = objc_msgSend(v6, "naui_isDescendantOfViewController:", v7);

  if ((v8 & 1) == 0)
    NSLog(CFSTR("Presented view controller %@ is requesting dismissal when it was not presented by %@!"), v6, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v11, "setOrientation:animated:", 1, 0);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", v4));

  return v12;
}

- (void)setLoadingViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  -[HOMainTabBarController setViewControllers:](self, "setViewControllers:", v5, v6);
}

- (void)refreshAfterSidebarTabbarSwitchWithDashboardContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedHomeAppTabIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController _navigationControllerForMainTabIdentifier:](self, "_navigationControllerForMainTabIdentifier:", v5));

  if (!v6)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController _navigationControllerForMainTabIdentifier:](self, "_navigationControllerForMainTabIdentifier:", HFHomeAppTabIdentifierHome));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController childViewControllers](self, "childViewControllers"));
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
    -[HOMainTabBarController _setSelectedViewController:persistSelection:](self, "_setSelectedViewController:persistSelection:", v6, 1);
  if (v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController navigator](self, "navigator"));
    objc_msgSend(v9, "configureDashboardContextWithDashboardContext:navigationController:animated:", v10, v6, 0);

  }
}

- (void)selectDiscoverTab:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HOMainTabBarController navigator](self, "navigator", a3));
  v3 = objc_msgSend(v4, "showDiscoverTab");

}

- (HOAppNavigator)navigator
{
  return self->_navigator;
}

- (void)setDashboardNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardNavigator, a3);
}

- (void)setBaseController:(id)a3
{
  objc_storeStrong((id *)&self->_baseController, a3);
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (void)setLoadTabsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_loadTabsFuture, a3);
}

- (BOOL)changingSelectedViewControllerProgrammatically
{
  return self->_changingSelectedViewControllerProgrammatically;
}

- (NAFuture)dataSyncStateChangeProcessingFuture
{
  return self->_dataSyncStateChangeProcessingFuture;
}

- (void)setDataSyncStateChangeProcessingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_dataSyncStateChangeProcessingFuture, a3);
}

- (void)setTabClassToNavigationControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_tabClassToNavigationControllerMap, a3);
}

- (BOOL)shouldScrollToDefaultPosition
{
  return self->_shouldScrollToDefaultPosition;
}

- (void)setShouldScrollToDefaultPosition:(BOOL)a3
{
  self->_shouldScrollToDefaultPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_viewVisibleFutures, 0);
  objc_storeStrong((id *)&self->_tabClassToNavigationControllerMap, 0);
  objc_storeStrong((id *)&self->_dataSyncStateChangeProcessingFuture, 0);
  objc_storeStrong((id *)&self->_loadTabsFuture, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_baseController, 0);
  objc_storeStrong((id *)&self->_dashboardNavigator, 0);
  objc_storeStrong((id *)&self->_navigator, 0);
}

@end
