@implementation CarKeyboardModeController

- (CarKeyboardModeController)initWithRequestedInteractionModel:(unint64_t)a3 resultsProvider:(id)a4
{
  id v7;
  id v8;
  CarKeyboardModeController *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", v7);
  v14.receiver = self;
  v14.super_class = (Class)CarKeyboardModeController;
  v9 = -[CarKeyboardModeController initWithSearchController:](&v14, "initWithSearchController:", v8);
  if (v9)
  {
    if (!a3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      if (objc_msgSend(v10, "primaryInteractionModel"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        a3 = (unint64_t)objc_msgSend(v11, "primaryInteractionModel");

      }
      else
      {
        a3 = 1;
      }

    }
    v9->_requestedInteractionModel = a3;
    objc_storeStrong((id *)&v9->_resultsProvider, a4);
    -[CarKeyboardResultsProviding setKeyboardMode:](v9->_resultsProvider, "setKeyboardMode:", v9);
    objc_msgSend(v8, "_setRequestedInteractionModel:", a3);
    objc_msgSend(v8, "setHidesNavigationBarDuringPresentation:", 0);
    objc_msgSend(v8, "setActive:", 1);
    objc_msgSend(v8, "setDelegate:", v9);
    objc_msgSend(v8, "setSearchResultsUpdater:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
    objc_msgSend(v12, "setSpellCheckingType:", 1);

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CarKeyboardModeController;
  -[CarKeyboardModeController viewDidLoad](&v17, "viewDidLoad");
  -[CarKeyboardModeController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchBar"));
  objc_msgSend(v6, "setShowsCancelButton:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setTitleView:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setHidesBackButton:", 1);

  -[CarKeyboardModeController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[CarKeyboardModeController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController view](self, "view"));
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("CarKeyboardSearch"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchBar"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("CarSearchBar"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController view](self, "view"));
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[CarKeyboardModeController _setPlaceholder](self, "_setPlaceholder");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "_offlineSettingChangeHandler", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarKeyboardModeController;
  -[CarKeyboardModeController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController resultsProvider](self, "resultsProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  objc_msgSend(v4, "updateForInteractionModel:", objc_msgSend(v5, "_requestedInteractionModel"));

  v6 = sub_100B3A5D4();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "oneInsights"));
  objc_msgSend(v8, "preload");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarKeyboardModeController;
  -[CarKeyboardModeController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
  objc_msgSend(v5, "becomeFirstResponder");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PPTTest_CarKeyboardModeController_DidDisplayKeyboard"), 0, 0);

}

- (void)_setPlaceholder
{
  void *v3;
  unsigned int v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v5;
  if (v4)
    v6 = CFSTR("[Offline CarPlay Search] Search Offline Maps");
  else
    v6 = CFSTR("[CarPlay Search] Search");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
  objc_msgSend(v9, "setPlaceholder:", v7);

}

- (BOOL)showsMapView
{
  return 0;
}

- (BOOL)showsNavigationBar
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (id)fullscreenViewController
{
  UINavigationController *wrapperNavigationController;
  UINavigationController *v4;
  UINavigationController *v5;

  wrapperNavigationController = self->_wrapperNavigationController;
  if (!wrapperNavigationController)
  {
    v4 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self);
    v5 = self->_wrapperNavigationController;
    self->_wrapperNavigationController = v4;

    -[UINavigationController loadViewIfNeeded](self->_wrapperNavigationController, "loadViewIfNeeded");
    wrapperNavigationController = self->_wrapperNavigationController;
  }
  return wrapperNavigationController;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (BOOL)invalidAfterDisconnect
{
  return 1;
}

- (BOOL)hidesStatusBanner
{
  return 1;
}

- (BOOL)suppressesStatusBannerAnimation
{
  return 1;
}

- (void)configureFocusContainerGuideController:(id)a3
{
  objc_msgSend(a3, "setActiveEdges:", 0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController resultsProvider](self, "resultsProvider"));
  objc_msgSend(v5, "updateSearchResultsForSearchController:", v4);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController resultsProvider](self, "resultsProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  objc_msgSend(v6, "handleSearchButtonPressedWithText:", v5);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController chromeViewController](self, "chromeViewController", a3));
  objc_msgSend(v4, "captureUserAction:", 2002);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController resultsProvider](self, "resultsProvider"));
  objc_msgSend(v5, "handleCancelButtonPressed");

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController resultsProvider](self, "resultsProvider"));
  objc_msgSend(v6, "handleSearchTextDidChange:", v5);

}

- (void)didDismissSearchController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance", a3));
  objc_msgSend(v4, "popFromContext:", self);

}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (int)currentUsageTarget
{
  return 1023;
}

- (void)_ppt_selectKeyboardSearchButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController resultsProvider](self, "resultsProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
    objc_msgSend(v10, "handleSearchButtonPressedWithText:", v9);

  }
}

- (void)pptHandleTextChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)pptEndEditing
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController searchController](self, "searchController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)pptInvokeSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardModeController resultsProvider](self, "resultsProvider"));
  objc_msgSend(v5, "handleSearchButtonPressedWithText:", v4);

}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (CarKeyboardResultsProviding)resultsProvider
{
  return self->_resultsProvider;
}

- (void)setResultsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_resultsProvider, a3);
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsProvider, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_wrapperNavigationController, 0);
}

@end
