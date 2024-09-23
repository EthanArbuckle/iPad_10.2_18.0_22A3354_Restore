@implementation MCDBrowserViewController

- (BOOL)deviceAcknowledgementRequired
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo"));
  v3 = objc_msgSend(v2, "privacyAcknowledgementRequiredForMusic");

  return v3;
}

- (void)_setAppropriateViewControllers
{
  _TtC16MusicApplication20CarPlayNoContentView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _TtC16MusicApplication20CarPlayNoContentView *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint8_t v15[8];
  MCDTabBarController *tabBarController;
  id v17;

  if (-[MCDBrowserViewController deviceAcknowledgementRequired](self, "deviceAcknowledgementRequired"))
  {
    v3 = [_TtC16MusicApplication20CarPlayNoContentView alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Privacy Information"), &stru_13E1990, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("When you’re not driving, open Music on your iPhone and review the privacy information."), &stru_13E1990, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Dismiss"), &stru_13E1990, 0));
    v10 = -[CarPlayNoContentView initWithTitle:subtitle:buttonTitle:buttonHandler:](v3, "initWithTitle:subtitle:buttonTitle:buttonHandler:", v5, v7, v9, &__block_literal_global_16);

    v11 = soft_MCDMusicGeneralLogging_2();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Showing message about content restriction that should be resolved on device", v15, 2u);
    }

    v13 = objc_alloc_init((Class)UIViewController);
    objc_msgSend(v13, "setView:", v10);
    v17 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    -[MCDBrowserViewController setViewControllers:animated:](self, "setViewControllers:animated:", v14, 0);

    -[MCDBrowserViewController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
    -[MCDBrowserViewController _beginObservingPrivacyInfo](self, "_beginObservingPrivacyInfo");

  }
  else
  {
    -[MCDBrowserViewController _endObservingPrivacyInfoIfNeeded](self, "_endObservingPrivacyInfoIfNeeded");
    tabBarController = self->_tabBarController;
    v10 = (_TtC16MusicApplication20CarPlayNoContentView *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &tabBarController, 1));
    -[MCDBrowserViewController setViewControllers:animated:](self, "setViewControllers:animated:", v10, 0);
  }

}

void __58__MCDBrowserViewController__setAppropriateViewControllers__block_invoke(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[CRSOpenApplicationService defaultService](CRSOpenApplicationService, "defaultService"));
  objc_msgSend(v1, "openApplication:completion:", CFSTR("com.apple.CarPlayApp"), &__block_literal_global_42);

}

void __58__MCDBrowserViewController__setAppropriateViewControllers__block_invoke_2(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = soft_MCDMusicGeneralLogging_2();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__MCDBrowserViewController__setAppropriateViewControllers__block_invoke_2_cold_1((uint64_t)v2, v4);

  }
}

- (MCDBrowserViewController)init
{
  MCDBrowserViewController *v2;
  CARSessionStatus *v3;
  CARSessionStatus *carSessionStatus;
  NSArray *tabIdentifiers;
  MCDTabBarController *v6;
  MCDTabBarController *tabBarController;
  void *v8;
  _QWORD *v9;
  void *v10;
  _Unwind_Exception *v12;
  objc_super v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v13.receiver = self;
  v13.super_class = (Class)MCDBrowserViewController;
  v2 = -[MCDBrowserViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = (CARSessionStatus *)objc_msgSend(objc_alloc((Class)CARSessionStatus), "initAndWaitUntilSessionUpdated");
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v3;

    -[MCDBrowserViewController setNavigationBarHidden:](v2, "setNavigationBarHidden:", 0);
    -[MCDBrowserViewController setDelegate:](v2, "setDelegate:", v2);
    tabIdentifiers = v2->_tabIdentifiers;
    v2->_tabIdentifiers = (NSArray *)&__NSArray0__struct;

    v6 = objc_opt_new(MCDTabBarController);
    tabBarController = v2->_tabBarController;
    v2->_tabBarController = v6;

    -[MCDTabBarController setDelegate:](v2->_tabBarController, "setDelegate:", v2);
    -[MCDBrowserViewController _setAppropriateViewControllers](v2, "_setAppropriateViewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_mediaLibraryDidChange:", MPMediaLibraryDidChangeNotification, 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_limitedUIChanged:", CARSessionLimitUserInterfacesChangedNotification, 0);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v9 = (_QWORD *)getMCDContentItemsChangedNotificationSymbolLoc_ptr;
    v17 = getMCDContentItemsChangedNotificationSymbolLoc_ptr;
    if (!getMCDContentItemsChangedNotificationSymbolLoc_ptr)
    {
      v10 = (void *)MusicCarDisplayUILibrary_13();
      v9 = dlsym(v10, "MCDContentItemsChangedNotification");
      v15[3] = (uint64_t)v9;
      getMCDContentItemsChangedNotificationSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v14, 8);
    if (!v9)
    {
      v12 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
      _Block_object_dispose(&v14, 8);
      _Unwind_Resume(v12);
    }
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_nowPlayingDidChangeNotification:", *v9, 0);
    MRMediaRemoteRegisterForNowPlayingNotifications(0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MCDTabBarController setDelegate:](self->_tabBarController, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  MRMediaRemoteUnregisterForNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)MCDBrowserViewController;
  -[MCDBrowserViewController dealloc](&v4, "dealloc");
}

- (void)_nowPlayingDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61__MCDBrowserViewController__nowPlayingDidChangeNotification___block_invoke;
  block[3] = &unk_1338FD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __61__MCDBrowserViewController__nowPlayingDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNowPlayingVisibility");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDBrowserViewController;
  -[MCDBrowserViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_viewHasAppeared = 1;
  -[MCDBrowserViewController _updateNowPlayingVisibility](self, "_updateNowPlayingVisibility");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCDBrowserViewController;
  -[MCDBrowserViewController viewDidLoad](&v3, "viewDidLoad");
  -[MCDBrowserViewController pushNowPlaying:](self, "pushNowPlaying:", 0);
}

- (id)_createViewControllerForIdentifier:(id)a3
{
  id v4;
  _BOOL8 v5;
  id MCDRadioViewControllerIdentifier;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  MCDBrowserTableViewController *v15;
  id v16;
  uint64_t v17;
  id MCDLibraryViewControllerIdentifier;
  void *v19;
  unsigned int v20;
  void *v21;
  id MCDForYouTableViewControllerIdentifier;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  id v27;
  id MCDBrowseViewControllerIdentifier;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id MCDPlaylistsViewControllerIdentifier_1;
  void *v38;
  unsigned int v39;
  void *v40;
  id v41;

  v4 = a3;
  v5 = -[MCDBrowserViewController _limitedUIEnabled](self, "_limitedUIEnabled");
  MCDRadioViewControllerIdentifier = getMCDRadioViewControllerIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue(MCDRadioViewControllerIdentifier);
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if (!v8)
  {
    MCDLibraryViewControllerIdentifier = getMCDLibraryViewControllerIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue(MCDLibraryViewControllerIdentifier);
    v20 = objc_msgSend(v4, "isEqualToString:", v19);

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Library"), &stru_13E1990, 0));

      v15 = -[MCDBrowserTableViewController initWithLimitedUI:]([MCDBrowserTableViewController alloc], "initWithLimitedUI:", v5);
      -[MCDBrowserTableViewController setTitle:](v15, "setTitle:", v9);
      v16 = objc_alloc((Class)UITabBarItem);
      v17 = objc_claimAutoreleasedReturnValue(+[UIImage tabLibrary](UIImage, "tabLibrary"));
      goto LABEL_14;
    }
    MCDForYouTableViewControllerIdentifier = getMCDForYouTableViewControllerIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue(MCDForYouTableViewControllerIdentifier);
    v24 = objc_msgSend(v4, "isEqualToString:", v23);

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Home"), &stru_13E1990, 0));

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tabHome](UIImage, "tabHome"));
      v15 = -[MCDForYouTableViewController initWithLimitedUI:]([MCDForYouTableViewController alloc], "initWithLimitedUI:", v5);
      -[MCDBrowserTableViewController setTitle:](v15, "setTitle:", v9);
      v27 = objc_alloc((Class)UITabBarItem);
LABEL_15:
      v34 = objc_msgSend(v27, "initWithTitle:image:tag:", v9, v26, 0);
LABEL_16:
      v35 = v34;
      -[MCDBrowserTableViewController setTabBarItem:](v15, "setTabBarItem:", v34);

      goto LABEL_17;
    }
    MCDBrowseViewControllerIdentifier = getMCDBrowseViewControllerIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue(MCDBrowseViewControllerIdentifier);
    v30 = objc_msgSend(v4, "isEqualToString:", v29);

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Browse"), &stru_13E1990, 0));

      if (_os_feature_enabled_impl("Music", "in_with_the_new"))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("New"), &stru_13E1990, 0));

        v9 = (void *)v33;
      }
      v15 = -[MCDBrowseTableViewController initWithLimitedUI:]([MCDBrowseTableViewController alloc], "initWithLimitedUI:", v5);
      -[MCDBrowserTableViewController setTitle:](v15, "setTitle:", v9);
      v16 = objc_alloc((Class)UITabBarItem);
      v17 = objc_claimAutoreleasedReturnValue(+[UIImage tabBrowse](UIImage, "tabBrowse"));
      goto LABEL_14;
    }
    MCDPlaylistsViewControllerIdentifier_1 = getMCDPlaylistsViewControllerIdentifier_1();
    v38 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier_1);
    v39 = objc_msgSend(v4, "isEqualToString:", v38);

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Playlists"), &stru_13E1990, 0));

      v15 = -[MCDPlaylistsViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDPlaylistsViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v4, v5, 0);
      -[MCDBrowserTableViewController setTitle:](v15, "setTitle:", v9);
      v41 = objc_alloc((Class)UITabBarItem);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage playlistPlaceholder](UIImage, "playlistPlaceholder"));
      v34 = objc_msgSend(v41, "initWithTitle:image:selectedImage:", v9, v26, 0);
      goto LABEL_16;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
  if (objc_msgSend(v9, "allowsRadioContent"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "DSIDForUserIdentity:outError:", v11, 0));
    v13 = objc_msgSend(v12, "unsignedLongLongValue");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Radio"), &stru_13E1990, 0));

      v15 = -[MCDRadioMusicKitTableViewController initWithLimitedUI:]([MCDRadioMusicKitTableViewController alloc], "initWithLimitedUI:", v5);
      -[MCDBrowserTableViewController setPlayActivityFeatureName:](v15, "setPlayActivityFeatureName:", CFSTR("radio"));
      -[MCDBrowserTableViewController setTitle:](v15, "setTitle:", v9);
      v16 = objc_alloc((Class)UITabBarItem);
      v17 = objc_claimAutoreleasedReturnValue(+[UIImage tabRadio](UIImage, "tabRadio"));
LABEL_14:
      v26 = (void *)v17;
      v27 = v16;
      goto LABEL_15;
    }
    goto LABEL_21;
  }
  v15 = 0;
LABEL_17:

LABEL_18:
  return v15;
}

- (void)pushNowPlaying:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id MCDNowPlayingViewControllerClass;
  char isKindOfClass;
  id v8;
  id v9;

  v3 = a3;
  if (!-[MCDBrowserViewController deviceAcknowledgementRequired](self, "deviceAcknowledgementRequired"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController visibleViewController](self, "visibleViewController"));
    MCDNowPlayingViewControllerClass = getMCDNowPlayingViewControllerClass();
    isKindOfClass = objc_opt_isKindOfClass(v5, MCDNowPlayingViewControllerClass);

    if ((isKindOfClass & 1) == 0)
    {
      if (-[MCDBrowserViewController _isNowPlayingAvailable](self, "_isNowPlayingAvailable"))
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController currentNowPlayingViewControllerInStack](self, "currentNowPlayingViewControllerInStack"));
        if (v9)
          v8 = -[MCDBrowserViewController popToViewController:animated:](self, "popToViewController:animated:", v9, v3);
        else
          -[MCDBrowserViewController MCD_pushNowPlayingViewControllerAnimated:](self, "MCD_pushNowPlayingViewControllerAnimated:", v3);

      }
      else
      {
        self->_shouldPushToNowPlayingOnceNowPlayingHasLoaded = 1;
      }
    }
  }
}

- (void)pushSharePlayTogetherSettings
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  _TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *v9;
  id v10;

  if (!-[MCDBrowserViewController deviceAcknowledgementRequired](self, "deviceAcknowledgementRequired"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharePlayTogetherObjCViewModel](UIApplication, "sharePlayTogetherObjCViewModel"));
    if (v3)
    {
      v10 = v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController viewControllers](self, "viewControllers"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
      v6 = objc_opt_class(_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController);
      isKindOfClass = objc_opt_isKindOfClass(v5, v6);

      if ((isKindOfClass & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController viewControllers](self, "viewControllers"));
        v9 = (_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

        -[MCDSharePlayTogetherSessionViewController dismissQRCode](v9, "dismissQRCode");
      }
      else
      {
        v9 = -[MCDSharePlayTogetherSessionViewController initWithViewModel:]([_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController alloc], "initWithViewModel:", v10);
        -[MCDBrowserViewController pushViewController:animated:](self, "pushViewController:animated:", v9, 1);
      }

      v3 = v10;
    }

  }
}

- (void)refreshNavigationPath
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  if (-[MCDBrowserViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController viewControllers](self, "viewControllers"));
    v4 = 0;
    if (objc_msgSend(v3, "count"))
    {
      while (1)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v4));
        v6 = objc_opt_class(MCDTableViewController);
        if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
        {
          v7 = v5;
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
          objc_msgSend((id)v8, "reloadData");

          LOBYTE(v8) = objc_msgSend(v7, "hasRowsToDisplay");
          if ((v8 & 1) == 0)
            break;
        }
        ++v4;

        if (v4 >= (unint64_t)objc_msgSend(v3, "count"))
          goto LABEL_8;
      }

    }
LABEL_8:
    if (v4)
      v9 = v4 - 1;
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController topViewController](self, "topViewController"));

    if (v10 != v11)
      v12 = -[MCDBrowserViewController popToViewController:animated:](self, "popToViewController:animated:", v10, 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTabBarController viewControllers](self->_tabBarController, "viewControllers", 0));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v18, "isViewLoaded"))
          {
            v19 = objc_opt_class(MCDTableViewController);
            if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tableView"));
              objc_msgSend(v20, "reloadData");

            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

  }
}

- (void)_mediaLibraryDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__MCDBrowserViewController__mediaLibraryDidChange___block_invoke;
  block[3] = &unk_1338FD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __51__MCDBrowserViewController__mediaLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  unsigned __int8 *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v3 = objc_msgSend(v2, "hasSongs");

  v4 = *(unsigned __int8 **)(a1 + 32);
  if (v4[10] != v3)
  {
    objc_msgSend(v4, "_reloadTabsViewControllers");
    v4 = *(unsigned __int8 **)(a1 + 32);
  }
  return objc_msgSend(v4, "refreshNavigationPath");
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  objc_msgSend(v6, "setTitle:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "musicTabIdentifier"));

  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("carLastSelectedTabIdentifier"));
}

- (BOOL)_isNowPlayingAvailable
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nowPlayingContentManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentPlayingSong"));
  v5 = v4 != 0;

  return v5;
}

- (void)_updateNowPlayingVisibility
{
  MCDTabBarController *tabBarController;
  void *v4;

  if (!-[MCDBrowserViewController _isNowPlayingAvailable](self, "_isNowPlayingAvailable"))
  {
    tabBarController = self->_tabBarController;
    goto LABEL_6;
  }
  tabBarController = self->_tabBarController;
  if (!self->_viewHasAppeared)
  {
LABEL_6:
    -[MCDTabBarController _setAccessoryView:](tabBarController, "_setAccessoryView:", 0);
    -[MCDBrowserViewController MCD_popNowPlayingViewControllerAnimated:](self, "MCD_popNowPlayingViewControllerAnimated:", 1);
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController nowPlayingButtonView](self, "nowPlayingButtonView"));
  -[MCDTabBarController _setAccessoryView:](tabBarController, "_setAccessoryView:", v4);

  if (self->_shouldPushToNowPlayingOnceNowPlayingHasLoaded)
  {
    self->_shouldPushToNowPlayingOnceNowPlayingHasLoaded = 0;
    -[MCDBrowserViewController pushNowPlaying:](self, "pushNowPlaying:", 1);
  }
}

- (id)nowPlayingButtonView
{
  CPUINowPlayingButtonWrapperView *nowPlayingButtonView;
  id v4;
  void *v5;
  double Height;
  id *v7;
  void *v8;
  id v9;
  CPUINowPlayingButtonWrapperView *v10;
  CPUINowPlayingButtonWrapperView *v11;
  void *v12;
  _Unwind_Exception *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  CGRect v19;

  nowPlayingButtonView = self->_nowPlayingButtonView;
  if (!nowPlayingButtonView)
  {
    v4 = objc_alloc((Class)CPUINowPlayingButtonWrapperView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTabBarController tabBar](self->_tabBarController, "tabBar"));
    objc_msgSend(v5, "bounds");
    Height = CGRectGetHeight(v19);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v7 = (id *)getMCDMusicBundleIdentifierSymbolLoc_ptr_2;
    v18 = getMCDMusicBundleIdentifierSymbolLoc_ptr_2;
    if (!getMCDMusicBundleIdentifierSymbolLoc_ptr_2)
    {
      v8 = (void *)MusicCarDisplayUILibrary_13();
      v7 = (id *)dlsym(v8, "MCDMusicBundleIdentifier");
      v16[3] = (uint64_t)v7;
      getMCDMusicBundleIdentifierSymbolLoc_ptr_2 = (uint64_t)v7;
    }
    _Block_object_dispose(&v15, 8);
    if (!v7)
    {
      v14 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
      _Block_object_dispose(&v15, 8);
      _Unwind_Resume(v14);
    }
    v9 = *v7;
    v10 = (CPUINowPlayingButtonWrapperView *)objc_msgSend(v4, "initWithFrame:bundleIdentifier:", v9, 0.0, 0.0, 0.0, Height, v15);
    v11 = self->_nowPlayingButtonView;
    self->_nowPlayingButtonView = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPUINowPlayingButtonWrapperView nowPlayingButton](self->_nowPlayingButtonView, "nowPlayingButton"));
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_nowPlayingButtonTouchUpInside:", 64);

    nowPlayingButtonView = self->_nowPlayingButtonView;
  }
  return nowPlayingButtonView;
}

- (BOOL)hasNowPlayingViewControllerBeenPushed
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController currentNowPlayingViewControllerInStack](self, "currentNowPlayingViewControllerInStack"));
  v3 = v2 != 0;

  return v3;
}

- (id)currentNowPlayingViewControllerInStack
{
  void *v3;
  id MCDNowPlayingViewControllerClass;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController visibleViewController](self, "visibleViewController"));
  MCDNowPlayingViewControllerClass = getMCDNowPlayingViewControllerClass();
  isKindOfClass = objc_opt_isKindOfClass(v3, MCDNowPlayingViewControllerClass);

  if ((isKindOfClass & 1) != 0)
    return (id)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController visibleViewController](self, "visibleViewController"));
  if (-[MCDBrowserViewController _isNowPlayingAvailable](self, "_isNowPlayingAvailable"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController viewControllers](self, "viewControllers", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
          v13 = getMCDNowPlayingViewControllerClass();
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            v14 = v12;

            return v14;
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  return 0;
}

- (void)MCD_pushNowPlayingViewControllerAnimated:(BOOL)a3 fromViewController:(id)a4
{
  void *v5;
  MCDBrowserViewController *v6;
  MCDBrowserViewController *v7;

  v7 = (MCDBrowserViewController *)a4;
  if (!-[MCDBrowserViewController hasNowPlayingViewControllerBeenPushed](self, "hasNowPlayingViewControllerBeenPushed"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCDMusicNowPlayingViewController musicNowPlayingViewController](MCDMusicNowPlayingViewController, "musicNowPlayingViewController"));
    if (v7)
      v6 = v7;
    else
      v6 = self;
    objc_msgSend(v5, "setPlayActivityFeatureNameSourceViewController:", v6);
    -[MCDBrowserViewController pushViewController:animated:](self, "pushViewController:animated:", v5, 1);

  }
}

- (void)MCD_pushNowPlayingViewControllerAnimated:(BOOL)a3
{
  -[MCDBrowserViewController MCD_pushNowPlayingViewControllerAnimated:fromViewController:](self, "MCD_pushNowPlayingViewControllerAnimated:fromViewController:", a3, 0);
}

- (void)MCD_popNowPlayingViewControllerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id MCDNowPlayingViewControllerClass;
  char isKindOfClass;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController visibleViewController](self, "visibleViewController"));
  MCDNowPlayingViewControllerClass = getMCDNowPlayingViewControllerClass();
  isKindOfClass = objc_opt_isKindOfClass(v5, MCDNowPlayingViewControllerClass);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = soft_MCDMusicGeneralLogging_2();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Dismissing Now Playing view", v12, 2u);
    }

    if (v3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      if (objc_msgSend(v10, "userInterfaceLayoutDirection"))
        v11 = 1;
      else
        v11 = 2;
      -[MCDBrowserViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", v11, 0);

    }
    else
    {
      -[MCDBrowserViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    }
  }
}

- (void)_nowPlayingButtonTouchUpInside:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = soft_MCDMusicGeneralLogging_2();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Pushing to Now Playing from button touch up inside", v6, 2u);
  }

  -[MCDBrowserViewController MCD_pushNowPlayingViewControllerAnimated:fromViewController:](self, "MCD_pushNowPlayingViewControllerAnimated:fromViewController:", 1, self);
}

- (void)setTabIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *tabIdentifiers;
  NSMutableArray *v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *tabVCIdentifiers;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  if (setTabIdentifiers__sOnceToken != -1)
    dispatch_once(&setTabIdentifiers__sOnceToken, &__block_literal_global_102);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
  self->_subscriptionState = (int64_t)objc_msgSend(v5, "userSubscriptionState");

  if (self->_subscriptionState >= 2uLL)
    v6 = (NSArray *)v4;
  else
    v6 = (NSArray *)&off_13E7890;
  tabIdentifiers = self->_tabIdentifiers;
  self->_tabIdentifiers = v6;

  v8 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = self->_tabIdentifiers;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)setTabIdentifiers__CarPlayTabIDViewControllerMapping, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), (_QWORD)v20));
        if (v14)
          -[NSMutableArray addObject:](v8, "addObject:", v14);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (!-[NSMutableArray count](v8, "count"))
  {
    v15 = (void *)setTabIdentifiers__CarPlayDefaultTabIDsMapping;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_subscriptionState));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));
    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v17);

  }
  v18 = (NSArray *)-[NSMutableArray copy](v8, "copy", (_QWORD)v20);
  tabVCIdentifiers = self->_tabVCIdentifiers;
  self->_tabVCIdentifiers = v18;

  -[MCDBrowserViewController _reloadTabsViewControllers](self, "_reloadTabsViewControllers");
}

void __46__MCDBrowserViewController_setTabIdentifiers___block_invoke(id a1)
{
  id MCDForYouTableViewControllerIdentifier;
  void *v2;
  id MCDBrowseViewControllerIdentifier;
  void *v4;
  id MCDRadioViewControllerIdentifier;
  void *v6;
  id MCDLibraryViewControllerIdentifier;
  void *v8;
  id MCDPlaylistsViewControllerIdentifier_1;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[5];
  _QWORD v52[5];

  v51[0] = CFSTR("listenNow");
  MCDForYouTableViewControllerIdentifier = getMCDForYouTableViewControllerIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue(MCDForYouTableViewControllerIdentifier);
  v52[0] = v2;
  v51[1] = CFSTR("browse");
  MCDBrowseViewControllerIdentifier = getMCDBrowseViewControllerIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue(MCDBrowseViewControllerIdentifier);
  v52[1] = v4;
  v51[2] = CFSTR("radio");
  MCDRadioViewControllerIdentifier = getMCDRadioViewControllerIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue(MCDRadioViewControllerIdentifier);
  v52[2] = v6;
  v51[3] = CFSTR("library");
  MCDLibraryViewControllerIdentifier = getMCDLibraryViewControllerIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue(MCDLibraryViewControllerIdentifier);
  v52[3] = v8;
  v51[4] = CFSTR("playlists");
  MCDPlaylistsViewControllerIdentifier_1 = getMCDPlaylistsViewControllerIdentifier_1();
  v10 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier_1);
  v52[4] = v10;
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 5));
  v12 = (void *)setTabIdentifiers__CarPlayTabIDViewControllerMapping;
  setTabIdentifiers__CarPlayTabIDViewControllerMapping = v11;

  v49[0] = &off_13E77D8;
  v13 = getMCDForYouTableViewControllerIdentifier();
  v44 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v48[0] = v44;
  v14 = getMCDBrowseViewControllerIdentifier();
  v43 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v48[1] = v43;
  v15 = getMCDRadioViewControllerIdentifier();
  v42 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v48[2] = v42;
  v16 = getMCDLibraryViewControllerIdentifier();
  v41 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v48[3] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));
  v50[0] = v40;
  v49[1] = &off_13E77F0;
  v17 = getMCDForYouTableViewControllerIdentifier();
  v39 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v47[0] = v39;
  v18 = getMCDRadioViewControllerIdentifier();
  v38 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v47[1] = v38;
  v19 = getMCDLibraryViewControllerIdentifier();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v47[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
  v50[1] = v21;
  v49[2] = &off_13E7808;
  v22 = getMCDLibraryViewControllerIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v46[0] = v23;
  v24 = getMCDPlaylistsViewControllerIdentifier_1();
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v46[1] = v25;
  v26 = getMCDRadioViewControllerIdentifier();
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v46[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
  v50[2] = v28;
  v49[3] = &off_13E7820;
  v29 = getMCDLibraryViewControllerIdentifier();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v45[0] = v30;
  v31 = getMCDPlaylistsViewControllerIdentifier_1();
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v45[1] = v32;
  v33 = getMCDRadioViewControllerIdentifier();
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v45[2] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 3));
  v50[3] = v35;
  v36 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 4));
  v37 = (void *)setTabIdentifiers__CarPlayDefaultTabIDsMapping;
  setTabIdentifiers__CarPlayDefaultTabIDsMapping = v36;

}

- (void)reloadTabsContent
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTabBarController viewControllers](self->_tabBarController, "viewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isViewLoaded"))
        {
          v8 = objc_opt_class(MCDTableViewController);
          if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
            objc_msgSend(v9, "reloadData");

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)_reloadTabsViewControllers
{
  void *v3;
  id v4;
  id v5;
  void *i;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSArray *obj;
  MCDBrowserViewController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTabBarController viewControllers](self->_tabBarController, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  self->_libraryHasSongs = objc_msgSend(v3, "hasSongs");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = self;
  obj = self->_tabVCIdentifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = v20;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
LABEL_8:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "musicTabIdentifier"));
            v15 = objc_msgSend(v14, "isEqualToString:", v7);

            if ((v15 & 1) != 0)
              break;
            if (v10 == (id)++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v10)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v16 = v13;
          objc_msgSend(v21, "addObject:", v16);

          if (!v16)
            goto LABEL_17;
          objc_msgSend(v16, "setMusicTabIdentifier:", v7);
LABEL_18:
          objc_msgSend(v21, "addObject:", v16);

          continue;
        }
LABEL_14:

LABEL_17:
        v16 = (id)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController _createViewControllerForIdentifier:](v18, "_createViewControllerForIdentifier:", v7));
        objc_msgSend(v16, "setMusicTabIdentifier:", v7);
        if (v16)
          goto LABEL_18;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  -[MCDTabBarController setViewControllers:](v18->_tabBarController, "setViewControllers:", v21);
  -[MCDTabBarController setCustomizableViewControllers:](v18->_tabBarController, "setCustomizableViewControllers:", 0);
  -[MCDBrowserViewController refreshNavigationPath](v18, "refreshNavigationPath");

}

- (BOOL)_limitedUIEnabled
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "limitUserInterfaces"));
  if (objc_msgSend(v3, "BOOLValue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));
    v5 = ((unint64_t)objc_msgSend(v4, "limitableUserInterfaces") >> 3) & 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_limitedUIChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__MCDBrowserViewController__limitedUIChanged___block_invoke;
  block[3] = &unk_1338FD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __46__MCDBrowserViewController__limitedUIChanged___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_limitedUIEnabled");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "viewControllers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "setLimitedUI:") & 1) != 0)
          objc_msgSend(v8, "setLimitedUI:", v2);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "viewControllers", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j);
        if ((objc_opt_respondsToSelector(v14, "setLimitedUI:") & 1) != 0)
          objc_msgSend(v14, "setLimitedUI:", v2);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

}

- (void)_removeDetailViews
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserViewController viewControllers](self, "viewControllers"));
  v3 = objc_msgSend(v2, "mutableCopy");

}

- (void)_beginObservingPrivacyInfo
{
  void *v3;
  void *v4;
  id privacyObservationToken;
  _QWORD v6[5];

  if (!self->_privacyObservationToken)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __54__MCDBrowserViewController__beginObservingPrivacyInfo__block_invoke;
    v6[3] = &unk_133A038;
    v6[4] = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "beginObservingPrivacyAcknowledgementForIdentifier:handler:", ICPrivacyIdentifierMusic, v6));
    privacyObservationToken = self->_privacyObservationToken;
    self->_privacyObservationToken = v4;

  }
}

void __54__MCDBrowserViewController__beginObservingPrivacyInfo__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __54__MCDBrowserViewController__beginObservingPrivacyInfo__block_invoke_2;
  block[3] = &unk_1338FD8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __54__MCDBrowserViewController__beginObservingPrivacyInfo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAppropriateViewControllers");
}

- (void)_endObservingPrivacyInfoIfNeeded
{
  void *v3;
  id privacyObservationToken;

  if (self->_privacyObservationToken)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo"));
    objc_msgSend(v3, "endObservingPrivacyAcknowledgementForIdentifier:withToken:", ICPrivacyIdentifierMusic, self->_privacyObservationToken);

    privacyObservationToken = self->_privacyObservationToken;
    self->_privacyObservationToken = 0;

  }
}

- (NSArray)tabIdentifiers
{
  return self->_tabIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIdentifiers, 0);
  objc_storeStrong(&self->_privacyObservationToken, 0);
  objc_storeStrong((id *)&self->_tabVCIdentifiers, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_nowPlayingButtonView, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
}

void __58__MCDBrowserViewController__setAppropriateViewControllers__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error dismissing Music app error=%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
