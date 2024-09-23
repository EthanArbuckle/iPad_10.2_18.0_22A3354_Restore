@implementation DOCTabbedBrowserViewController

- (void)tabbedBrowserView:(id)a3 willMoveToWindow:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneIdentifier"));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
      objc_msgSend(v9, "updateStateAndSceneIdentifiersWithWindow:", v6);

      objc_msgSend(v6, "frame");
      if (!CGRectIsEmpty(v13))
      {
        objc_msgSend(v12, "frame");
        if (CGRectIsEmpty(v14))
        {
          objc_msgSend(v6, "bounds");
          objc_msgSend(v12, "setFrame:");
        }
      }
    }
  }
  -[DOCTabbedBrowserViewController _loadFullHierarchy](self, "_loadFullHierarchy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sceneIdentifier"));
  +[DOCTabbedBrowserViewController setGlobalTabbedBrowserController:forIdentifier:](DOCTabbedBrowserViewController, "setGlobalTabbedBrowserController:forIdentifier:", self, v11);

}

- (void)doc_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *didLoadStateByTab;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  DOCSourceObserver *v15;
  void *v16;
  void *v17;
  DOCSourceObserver *v18;
  DOCSourceObserver *sourceObserver;
  DOCAutoBarHidingTabBarController *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;

  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  didLoadStateByTab = self->_didLoadStateByTab;
  self->_didLoadStateByTab = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v6 = objc_msgSend(v5, "isFilesApp");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostIdentifier"));
    +[FINode setCurrentHostAppIdentifier:](FINode, "setCurrentHostAppIdentifier:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DOCAppProtectionManager sharedManager](DOCAppProtectionManager, "sharedManager"));
  objc_msgSend(v11, "setHostIdentifier:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v12, "registerDefaults:", &off_1005F5040);

  -[DOCTabbedBrowserViewController setCustomActions:](self, "setCustomActions:", &__NSArray0__struct);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  if (objc_msgSend(v13, "forPickingDocuments"))
    v14 = 2;
  else
    v14 = 0;

  v15 = [DOCSourceObserver alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hostIdentifier"));
  v18 = -[DOCSourceObserver initWithUserAction:hostIdentifier:](v15, "initWithUserAction:hostIdentifier:", v14, v17);
  sourceObserver = self->_sourceObserver;
  self->_sourceObserver = v18;

  self->_isSystemTabBarAllowedByTraits = 1;
  self->_isSystemTabBarPreferred = 1;
  self->_isSystemTabBarVisible = 1;
  self->_isAppLaunchOptimizationsActive = 1;
  v20 = objc_opt_new(DOCAutoBarHidingTabBarController);
  -[DOCTabbedBrowserViewController setTabBarController:](self, "setTabBarController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  objc_msgSend(v21, "setDelegate:", self);

  v22 = (id)-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy") == (id)2;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  objc_msgSend(v23, "setUsingSharedSplitBrowserStrategy:", v22);

  -[DOCTabbedBrowserViewController configureTabBarForUIPIfNecessary](self, "configureTabBarForUIPIfNecessary");
  objc_storeWeak(&qword_1006725F0, self);
}

- (void)_loadMinimalHierarchy
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[DOCAXIdentifier browsingModeTabBar](DOCAXIdentifier, "browsingModeTabBar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tabBar"));
  objc_msgSend(v18, "setAccessibilityIdentifier:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  -[DOCTabbedBrowserViewController addChildViewController:](self, "addChildViewController:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v20, "addSubview:", v22);

  v23 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  objc_msgSend(v23, "didMoveToParentViewController:", self);

}

- (DOCFullDocumentManagerViewController)effectiveFullBrowser
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowserForTab:](self, "effectiveFullBrowserForTab:", objc_msgSend(v3, "selectedOrInflightSelectedTab")));

  return (DOCFullDocumentManagerViewController *)v4;
}

- (void)_loadFullHierarchy
{
  void *v3;
  id v4;
  void *v5;
  DOCFullDocumentManagerViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  DOCFullDocumentManagerViewController *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  DOCSplitBrowserViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  _TtC5Files25DOCDefaultSourceUIManager *v27;
  void *v28;
  _TtC5Files25DOCDefaultSourceUIManager *v29;
  _TtC5Files24DOCNamedLocationResolver *v30;
  void *v31;
  void *v32;
  _TtC5Files24DOCNamedLocationResolver *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  DOCFullDocumentManagerViewController *fullSharedViewController;
  unint64_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  unsigned int v78;
  _QWORD v79[4];
  id v80;
  id location;
  void *v82;
  _QWORD v83[3];
  _QWORD v84[3];
  DOCSplitBrowserViewController *splitBrowserViewController;

  objc_initWeak(&location, self);
  if (*(_OWORD *)&self->_fullRecentsViewController == 0 && !self->_splitBrowserViewController)
  {
    if (!-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
      v4 = objc_msgSend(v3, "copy");

      objc_msgSend(v4, "configureContextForDisplayingTab:", 0);
      objc_msgSend(v4, "setPreferLastUsedDate:", 1);
      objc_msgSend(v4, "setRestoreLastVisitedLocation:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[DOCConcreteLocation recentDocumentsLocation](DOCConcreteLocation, "recentDocumentsLocation"));
      objc_msgSend(v4, "setDefaultLocation:", v5);

      v6 = -[DOCFullDocumentManagerViewController initWithConfiguration:sourceObserver:]([DOCFullDocumentManagerViewController alloc], "initWithConfiguration:sourceObserver:", v4, self->_sourceObserver);
      -[DOCTabbedBrowserViewController setFullRecentsViewController:](self, "setFullRecentsViewController:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
      objc_msgSend(v7, "setShortDebugID:", CFSTR("recents"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
      objc_msgSend(v8, "setFullDocumentManagerDelegate:", self);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
      v10 = objc_msgSend(v9, "copy");

      objc_msgSend(v10, "configureContextForDisplayingTab:", 1);
      objc_msgSend(v10, "setPreferLastUsedDate:", 1);
      objc_msgSend(v10, "setRestoreLastVisitedLocation:", 1);
      objc_msgSend(v10, "setSaveLastVisitedLocation:", 1);
      v11 = -[DOCFullDocumentManagerViewController initWithConfiguration:sourceObserver:]([DOCFullDocumentManagerViewController alloc], "initWithConfiguration:sourceObserver:", v10, self->_sourceObserver);
      -[DOCTabbedBrowserViewController setFullSharedViewController:](self, "setFullSharedViewController:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
      objc_msgSend(v12, "setShortDebugID:", CFSTR("shared"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
      objc_msgSend(v13, "setFullDocumentManagerDelegate:", self);

    }
    if (-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy"))
      v14 = -[DOCTabbedBrowserViewController defaultInitialBrowsedPathEffectiveTab](self, "defaultInitialBrowsedPathEffectiveTab");
    else
      v14 = 2;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
    v16 = objc_msgSend(v15, "copy");

    objc_msgSend(v16, "configureContextForDisplayingTab:", v14);
    v17 = -[DOCSplitBrowserViewController initWithConfiguration:sourceObserver:]([DOCSplitBrowserViewController alloc], "initWithConfiguration:sourceObserver:", v16, self->_sourceObserver);
    -[DOCTabbedBrowserViewController setSplitBrowserViewController:](self, "setSplitBrowserViewController:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    objc_msgSend(v18, "setShortDebugID:", CFSTR("browser"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fullDocumentManagerViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "hierarchyController"));
    objc_msgSend(v21, "setDefaultTab:", v14);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController traitCollection](self, "traitCollection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController viewIfLoaded](self, "viewIfLoaded"));
    objc_msgSend(v23, "frame");
    -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v22, v24, v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    objc_msgSend(v26, "setSplitViewDelegate:", self);

    -[DOCTabbedBrowserViewController setAllowsDocumentCreation:](self, "setAllowsDocumentCreation:", -[DOCTabbedBrowserViewController allowsDocumentCreation](self, "allowsDocumentCreation"));
    v27 = [_TtC5Files25DOCDefaultSourceUIManager alloc];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
    v29 = -[DOCDefaultSourceUIManager initWithConfiguration:sourceObserver:presentAlertsOn:](v27, "initWithConfiguration:sourceObserver:presentAlertsOn:", v28, self->_sourceObserver, self);
    -[DOCTabbedBrowserViewController setDefaultSourceUIManager:](self, "setDefaultSourceUIManager:", v29);

    v30 = [_TtC5Files24DOCNamedLocationResolver alloc];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController defaultSourceUIManager](self, "defaultSourceUIManager"));
    v33 = -[DOCNamedLocationResolver initWithConfiguration:defaultSourceUIManager:](v30, "initWithConfiguration:defaultSourceUIManager:", v31, v32);
    -[DOCTabbedBrowserViewController setNamedLocationResolver:](self, "setNamedLocationResolver:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
    objc_msgSend(v34, "setDelegate:", self);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    objc_msgSend(v35, "setDelegate:", self);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabBarItem itemWithTab:](_TtC5Files13DOCTabBarItem, "itemWithTab:", 0));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
    objc_msgSend(v37, "setTabBarItem:", v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "hierarchyController"));
    objc_msgSend(v39, "setDefaultTab:", 0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabBarItem itemWithTab:](_TtC5Files13DOCTabBarItem, "itemWithTab:", 1));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    objc_msgSend(v41, "setTabBarItem:", v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "hierarchyController"));
    objc_msgSend(v43, "setDefaultTab:", 1);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabBarItem itemWithTab:](_TtC5Files13DOCTabBarItem, "itemWithTab:", 2));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "fullDocumentManagerViewController"));
    objc_msgSend(v46, "setDelegate:", self);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    objc_msgSend(v47, "setTabBarItem:", v44);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "fullDocumentManagerViewController"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "hierarchyController"));
    objc_msgSend(v50, "setDefaultTab:", 2);

    if ((id)-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy") == (id)1)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
      splitBrowserViewController = self->_splitBrowserViewController;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &splitBrowserViewController, 1));
      objc_msgSend(v51, "loadViewControllers:initialIndex:", v52, 0);

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[DOCUserInterfaceStateStore sharedStore](DOCUserInterfaceStateStore, "sharedStore"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
      v55 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "interfaceStateForConfiguration:", v54));

      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "mostRecentlyVisitedBrowsedState_FullBrowser"));
      if (v56
        || (v56 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController forceBrowseTabDefaultsValue](self, "forceBrowseTabDefaultsValue"))) != 0)
      {

      }
      else
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[DOCConcreteLocation recentDocumentsLocation](DOCConcreteLocation, "recentDocumentsLocation"));
        v78 = objc_msgSend(v76, "allowsDisplaying:", v77);

        if (v78)
          -[DOCTabbedBrowserViewController presentRecentsTabFromFullBrowse](self, "presentRecentsTabFromFullBrowse");
      }
    }
    else
    {
      v57 = -[DOCTabbedBrowserViewController fetchLastUsedTab](self, "fetchLastUsedTab");
      if ((id)-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy") == (id)2)
      {
        v84[0] = v36;
        v84[1] = v40;
        v84[2] = v44;
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 3));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
        v55 = -[DOCTabbedBrowserViewController newViewControllersSharing:tabBarItems:](self, "newViewControllersSharing:tabBarItems:", v59, v58);

      }
      else
      {
        fullSharedViewController = self->_fullSharedViewController;
        v83[0] = self->_fullRecentsViewController;
        v83[1] = fullSharedViewController;
        v83[2] = self->_splitBrowserViewController;
        v55 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 3));
      }
      v61 = -[DOCTabbedBrowserViewController tabControllerIndexForTab:inViewControllers:](self, "tabControllerIndexForTab:inViewControllers:", v57, v55);
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
      v63 = v62;
      if (v61 == 0x7FFFFFFFFFFFFFFFLL)
        v64 = 0;
      else
        v64 = v61;
      objc_msgSend(v62, "loadViewControllers:initialIndex:", v55, v64);

      -[DOCTabbedBrowserViewController presentTab:](self, "presentTab:", v57);
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
    v66 = objc_msgSend(v65, "isInUIPDocumentLanding");

    if (v66)
      -[DOCTabbedBrowserViewController configureUIPDocumentLandingStyle](self, "configureUIPDocumentLandingStyle");
    -[DOCTabbedBrowserViewController setDeferredBrowserStateChanges:](self, "setDeferredBrowserStateChanges:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
    objc_msgSend(v67, "activateContainerViewControllersIfNeeded");

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
    objc_msgSend(v68, "addObserver:forKeyPath:options:context:", self, CFSTR("editing"), 1, off_100640B68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    objc_msgSend(v69, "addObserver:forKeyPath:options:context:", self, CFSTR("editing"), 1, off_100640B68);

    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[DOCColumnViewController DOCColumnViewControllerUpdatedNavigationItem](_TtC5Files23DOCColumnViewController, "DOCColumnViewControllerUpdatedNavigationItem"));
    objc_msgSend(v70, "addObserver:selector:name:object:", self, "columViewControllerDidUpdate:", v71, 0);

    -[DOCTabbedBrowserViewController updateForChangedHorizontalSizeClass](self, "updateForChangedHorizontalSizeClass");
    v72 = objc_opt_self(UITraitHorizontalSizeClass);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    v82 = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));
    v75 = -[DOCTabbedBrowserViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v74, "updateForChangedHorizontalSizeClass");

    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000C0560;
    v79[3] = &unk_1005BEA90;
    objc_copyWeak(&v80, &location);
    -[DOCTabbedBrowserViewController registerForTabSwitcherTraitChangesWithHandler:](self, "registerForTabSwitcherTraitChangesWithHandler:", v79);
    objc_destroyWeak(&v80);

  }
  objc_destroyWeak(&location);
}

+ (id)globalTabbedBrowserControllerForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = a1;
  v6 = objc_sync_enter(v5);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabbedBrowserViewController globalMapTable](DOCTabbedBrowserViewController, "globalMapTable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));

  }
  else
  {
    v9 = docUILogHandle;
    if (!docUILogHandle)
    {
      DOCInitLogging(v6);
      v9 = docUILogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1004BF884(v9, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }
  objc_sync_exit(v5);

  return v8;
}

+ (id)globalMapTable
{
  if (qword_100658FE0 != -1)
    dispatch_once(&qword_100658FE0, &stru_1005BE9F0);
  return (id)qword_100658FD8;
}

- (void)fullDocumentManagerViewController:(id)a3 didUpdateHierarchy:(id)a4 displayedRootLocation:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _QWORD v11[6];

  v10 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "parentViewController"));

  if (a5)
  {
    if (v8)
    {
      if ((id)-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy") == (id)2)
      {
        v9 = objc_msgSend(v10, "effectiveTabSwitcherTab");
        if (v9 != (id)-[DOCAutoBarHidingTabBarController selectedOrInflightSelectedTab](self->_tabBarController, "selectedOrInflightSelectedTab"))
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_1000C325C;
          v11[3] = &unk_1005BEA18;
          v11[4] = self;
          v11[5] = v9;
          +[UIViewController doc_performWithDeferredTransitionsAndAnimationsDisabled:](UIViewController, "doc_performWithDeferredTransitionsAndAnimationsDisabled:", v11);
        }
      }
    }
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v4, "frame");
  -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v3, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController viewWillLayoutSubviews](&v7, "viewWillLayoutSubviews");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController viewDidLoad](&v4, "viewDidLoad");
  -[DOCTabbedBrowserViewController _loadMinimalHierarchy](self, "_loadMinimalHierarchy");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "itemCollectionViewControllerDidLoad", CFSTR("DOCItemCollectionViewDidLoadContents"), 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v4, "frame");
  -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v3, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
}

- (void)updateLocationTitleFromCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  -[DOCTabbedBrowserViewController setCurrentLocationTitle:](self, "setCurrentLocationTitle:", v5);
}

- (DOCTabbedBrowserViewControllerDelegate)tabbedBrowserViewControllerDelegate
{
  return (DOCTabbedBrowserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_tabbedBrowserViewControllerDelegate);
}

- (DOCAutoBarHidingTabBarController)tabBarController
{
  return (DOCAutoBarHidingTabBarController *)objc_getProperty(self, a2, 88, 1);
}

- (DOCSplitBrowserViewController)splitBrowserViewController
{
  return (DOCSplitBrowserViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTabbedBrowserViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tabbedBrowserViewControllerDelegate, a3);
}

- (void)setTabBarController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setSplitBrowserViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setSafeAreaUpdatesDisabledDuringTransitions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_safeAreaUpdatesDisabledDuringTransitions != a3)
  {
    v3 = a3;
    self->_safeAreaUpdatesDisabledDuringTransitions = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
    objc_msgSend(v4, "setSafeAreaUpdatesDisabledDuringTransitions:", v3);

  }
}

- (void)setNamedLocationResolver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setIsShowingSearchResults:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  if (self->_isShowingSearchResults != a3)
  {
    self->_isShowingSearchResults = a3;
    if (a3)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
      objc_msgSend(v7, "hideBar");
    }
    else
    {
      if (-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy"))
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));
        v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___DOCKeyCommandDismissible);

        if (v5)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));
          objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

        }
      }
      v7 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
      objc_msgSend(v7, "showBarIfAllowed");
    }

  }
}

- (void)setFullSharedViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setFullRecentsViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setDefaultSourceUIManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setCustomActions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController setCustomActions:](&v9, "setCustomActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self->_splitBrowserViewController, "sidebarViewController"));
  objc_msgSend(v5, "setCustomActions:", v4);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C09B8;
  v7[3] = &unk_1005BEAD8;
  v8 = v4;
  v6 = v4;
  -[DOCTabbedBrowserViewController enumerateAllFullBrowserViewControllers:](self, "enumerateAllFullBrowserViewControllers:", v7);

}

- (void)setCurrentLocationTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setAllowsDocumentCreation:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController setAllowsDocumentCreation:](&v7, "setAllowsDocumentCreation:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C09AC;
  v5[3] = &unk_1005BEAB0;
  v6 = a3;
  -[DOCTabbedBrowserViewController enumerateAllFullBrowserViewControllers:](self, "enumerateAllFullBrowserViewControllers:", v5);
}

- (void)presentTab:(unint64_t)a3
{
  -[DOCTabbedBrowserViewController presentTab:rawTabSwitchOnly:](self, "presentTab:rawTabSwitchOnly:", a3, 0);
}

- (void)loadView
{
  DOCTabbedBrowserView *v3;

  v3 = objc_opt_new(DOCTabbedBrowserView);
  -[DOCTabbedBrowserView setDelegate:](v3, "setDelegate:", self);
  -[DOCTabbedBrowserViewController setView:](self, "setView:", v3);

}

- (id)initForOpeningContentTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  v3 = -[DOCTabbedBrowserViewController initForOpeningContentTypes:](&v7, "initForOpeningContentTypes:", a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doc_commonInit");
    v5 = v4;
  }

  return v4;
}

- (DOCFullDocumentManagerViewController)fullSharedViewController
{
  return (DOCFullDocumentManagerViewController *)objc_getProperty(self, a2, 32, 1);
}

- (DOCFullDocumentManagerViewController)fullRecentsViewController
{
  return (DOCFullDocumentManagerViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)fullDocumentManagerDidFinishGatheringItemsAndThumbnails:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  NSMutableDictionary *didLoadStateByTab;
  void *v10;
  void *v11;
  unsigned int v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));

  if (v4 == v18)
  {
    v8 = 0;
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));

    if (v5 == v18)
    {
      v8 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullDocumentManagerViewController"));

      if (v7 != v18)
        goto LABEL_11;
      v8 = -[DOCTabbedBrowserViewController effectiveTabSwitcherTab](self, "effectiveTabSwitcherTab");
    }
  }
  didLoadStateByTab = self->_didLoadStateByTab;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](didLoadStateByTab, "objectForKeyedSubscript:", v10));
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v12 & 1) == 0)
  {
    v13 = self->_didLoadStateByTab;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabbedBrowserViewControllerDelegate](self, "tabbedBrowserViewControllerDelegate"));
  v16 = objc_opt_respondsToSelector(v15, "tabbedBrowserViewController:didFinishInitialLoad:ofTab:");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabbedBrowserViewControllerDelegate](self, "tabbedBrowserViewControllerDelegate"));
    objc_msgSend(v17, "tabbedBrowserViewController:didFinishInitialLoad:ofTab:", self, v12 ^ 1, v8);

  }
LABEL_11:

}

- (id)forceBrowseTabDefaultsValue
{
  if (qword_100658FF0[0] != -1)
    dispatch_once(qword_100658FF0, &stru_1005BEC38);
  return (id)qword_100658FE8;
}

- (unint64_t)fetchLastUsedTab
{
  if (-[DOCTabbedBrowserViewController canHaveTabs](self, "canHaveTabs"))
    return -[DOCTabbedBrowserViewController _mostRecentBrowsedPathEffectiveTab](self, "_mostRecentBrowsedPathEffectiveTab");
  else
    return 2;
}

- (_TtC5Files25DOCDefaultSourceUIManager)defaultSourceUIManager
{
  return (_TtC5Files25DOCDefaultSourceUIManager *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)currentLocationTitle
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)_updateTabButtonsVisibilityForTraits
{
  _BOOL8 v3;
  void *v4;
  id v5;
  void *v6;

  -[DOCTabbedBrowserViewController updateTraitCollectionTabBarSetting](self, "updateTraitCollectionTabBarSetting");
  v3 = -[DOCTabbedBrowserViewController enclosingTabSwitcherStyle](self, "enclosingTabSwitcherStyle") != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "contextPrefersVariableBlurBottomTabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  objc_msgSend(v6, "setUsingVariableBlurBottomBar:", v5);

  -[DOCTabbedBrowserViewController setIsSystemTabBarAllowedByTraits:](self, "setIsSystemTabBarAllowedByTraits:", v3);
}

+ (void)setGlobalTabbedBrowserController:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = objc_sync_enter(v8);
  if (v7)
  {
    if (v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabbedBrowserViewController globalMapTable](DOCTabbedBrowserViewController, "globalMapTable"));
      objc_msgSend(v10, "setObject:forKey:", v6, v7);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabbedBrowserViewController globalMapTable](DOCTabbedBrowserViewController, "globalMapTable"));
      objc_msgSend(v19, "removeObjectForKey:", v7);

      v21 = docUILogHandle;
      if (!docUILogHandle)
      {
        DOCInitLogging(v20);
        v21 = docUILogHandle;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        sub_1004BF8B8((uint64_t)v7, v21);
    }
  }
  else
  {
    v11 = docUILogHandle;
    if (!docUILogHandle)
    {
      DOCInitLogging(v9);
      v11 = docUILogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1004BF884(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  objc_sync_exit(v8);

}

- (DOCTabbedBrowserViewController)initWithConfiguration:(id)a3
{
  DOCTabbedBrowserViewController *v3;
  DOCTabbedBrowserViewController *v4;
  DOCTabbedBrowserViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  v3 = -[DOCTabbedBrowserViewController initWithConfiguration:](&v7, "initWithConfiguration:", a3);
  v4 = v3;
  if (v3)
  {
    -[DOCTabbedBrowserViewController doc_commonInit](v3, "doc_commonInit");
    v5 = v4;
  }

  return v4;
}

- (DOCTabbedBrowserViewController)initWithCoder:(id)a3
{
  DOCTabbedBrowserViewController *v3;
  DOCTabbedBrowserViewController *v4;
  DOCTabbedBrowserViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  v3 = -[DOCTabbedBrowserViewController initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[DOCTabbedBrowserViewController doc_commonInit](v3, "doc_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
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
  objc_super v12;

  if (-[DOCTabbedBrowserViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("editing"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("editing"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sceneIdentifier"));
  +[DOCTabbedBrowserViewController setGlobalTabbedBrowserController:forIdentifier:](DOCTabbedBrowserViewController, "setGlobalTabbedBrowserController:forIdentifier:", 0, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sceneIdentifier"));
  +[DOCInteractionManager clearSharedControllerFor:](_TtC5Files21DOCInteractionManager, "clearSharedControllerFor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sceneIdentifier"));
  +[DOCPreviewController clearSharedControllerFor:](_TtC5Files20DOCPreviewController, "clearSharedControllerFor:", v11);

  -[DOCTabbedBrowserViewController _stopSearchingSources](self, "_stopSearchingSources");
  v12.receiver = self;
  v12.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController dealloc](&v12, "dealloc");
}

- (void)setIsSystemTabBarAllowedByTraits:(BOOL)a3
{
  if (self->_isSystemTabBarAllowedByTraits == a3)
  {
    -[DOCAutoBarHidingTabBarController updateBarVisibilityIfNecessary](self->_tabBarController, "updateBarVisibilityIfNecessary");
  }
  else
  {
    self->_isSystemTabBarAllowedByTraits = a3;
    if (a3)
      -[DOCTabbedBrowserViewController _beginSystemTabBarAllowed](self, "_beginSystemTabBarAllowed");
    else
      -[DOCTabbedBrowserViewController _beginSystemTabBarDisallowed](self, "_beginSystemTabBarDisallowed");
  }
}

- (void)_beginSystemTabBarDisallowed
{
  if (-[DOCTabbedBrowserViewController canHaveTabs](self, "canHaveTabs"))
    -[DOCTabbedBrowserViewController _beginSystemTabBarHidden](self, "_beginSystemTabBarHidden");
  else
    -[DOCTabbedBrowserViewController _beginSystemTabBarAlwaysDisallowed](self, "_beginSystemTabBarAlwaysDisallowed");
}

- (void)_beginSystemTabBarHidden
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
  if ((objc_msgSend(v3, "isEditing") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    v4 = (uint64_t)objc_msgSend(v5, "isEditing");

  }
  -[DOCTabbedBrowserViewController _setShowSystemTabBar:isEditing:](self, "_setShowSystemTabBar:isEditing:", 0, v4);
}

- (void)_beginSystemTabBarAlwaysDisallowed
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v3 = -[DOCTabbedBrowserViewController tabBarCurrentRawTab](self, "tabBarCurrentRawTab");
  if (v3 <= 1
    && (v4 = v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController view](self, "view")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window")),
        v6,
        v5,
        v6))
  {
    if (v4)
      v7 = &OBJC_IVAR___DOCTabbedBrowserViewController__fullSharedViewController;
    else
      v7 = &OBJC_IVAR___DOCTabbedBrowserViewController__fullRecentsViewController;
    v8 = *(id *)((char *)&self->super.super.super.super.isa + *v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hierarchyController"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locations"));

  }
  else
  {
    v11 = 0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BFBF8;
  v13[3] = &unk_1005BE558;
  v13[4] = self;
  -[DOCTabbedBrowserViewController _performWhilePreventingHierarchyControllerLoading:](self, "_performWhilePreventingHierarchyControllerLoading:", v13, v11);
  v10 = v12;
  if (v12)
  {
    -[DOCTabbedBrowserViewController _setLocationsInBrowseTab:](self, "_setLocationsInBrowseTab:", v12);
    v10 = v12;
  }

}

- (void)_performWhilePreventingHierarchyControllerLoading:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  _QWORD v7[4];
  void (**v8)(void);

  v6 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self->_splitBrowserViewController, "fullDocumentManagerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hierarchyController"));
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000BFCE4;
    v7[3] = &unk_1005BE618;
    v8 = v6;
    objc_msgSend(v5, "performWhilePreventingLoading:", v7);

  }
  else
  {
    v6[2]();
  }

}

- (void)_beginSystemTabBarAllowed
{
  _QWORD v2[4];
  DOCTabbedBrowserViewController *v3;
  unint64_t v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000BFD54;
  v2[3] = &unk_1005BEA18;
  v3 = self;
  v4 = -[DOCTabbedBrowserViewController effectiveTabSwitcherTab](self, "effectiveTabSwitcherTab");
  -[DOCTabbedBrowserViewController _performWhilePreventingHierarchyControllerLoading:](v3, "_performWhilePreventingHierarchyControllerLoading:", v2);
}

- (void)_setLocationsInBrowseTab:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));
    v6 = objc_opt_class(_TtC5Files31DOCDocumentPickerViewController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sidebarViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fullDocumentManagerViewController"));

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self->_splitBrowserViewController, "sidebarViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self->_splitBrowserViewController, "fullDocumentManagerViewController"));
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BFF48;
    v14[3] = &unk_1005BEA40;
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    v16 = v10;
    v17 = v9;
    v18 = v4;
    v11 = v9;
    v12 = v10;
    v13 = v15;
    objc_msgSend(v12, "showLocation:fromRootAnimated:withCompletionBlock:", v13, 0, v14);

  }
}

- (void)_viewController:(id)a3 wantsToShowSystemTabBar:(BOOL)a4 isEditing:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v7;
  id v8;

  v5 = a4;
  v8 = a3;
  self->_isSystemTabBarPreferred = v5;
  if (v5)
    v7 = -[DOCTabbedBrowserViewController isSystemTabBarAllowedByTraits](self, "isSystemTabBarAllowedByTraits");
  else
    v7 = 0;
  if (self->_isSystemTabBarVisible != v7)
    -[DOCTabbedBrowserViewController _setShowSystemTabBar:isEditing:](self, "_setShowSystemTabBar:isEditing:");

}

- (void)_setShowSystemTabBar:(BOOL)a3 isEditing:(BOOL)a4
{
  _QWORD *v5;
  void *v6;
  unsigned __int8 v7;
  _QWORD v8[4];
  _QWORD *v9;
  _QWORD v10[5];
  BOOL v11;

  self->_isSystemTabBarVisible = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C01DC;
  v10[3] = &unk_1005BEA68;
  v10[4] = self;
  v11 = a3;
  v5 = objc_retainBlock(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
  if (!objc_msgSend(v6, "prefersAnimatedTabVibilityChanges"))
  {

    goto LABEL_5;
  }
  v7 = -[DOCTabbedBrowserViewController doc_hasAppeared](self, "doc_hasAppeared");

  if ((v7 & 1) == 0)
  {
LABEL_5:
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000C02C0;
    v8[3] = &unk_1005BE618;
    v9 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

    goto LABEL_6;
  }
  ((void (*)(_QWORD *))v5[2])(v5);
LABEL_6:

}

- (void)startSearchingSourcesWithConfiguration:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController sourceObserver](self, "sourceObserver", a3));
  objc_msgSend(v3, "startObservingSources");

}

- (void)_stopSearchingSources
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController sourceObserver](self, "sourceObserver"));
  objc_msgSend(v2, "stopObservingSources");

}

- (void)itemCollectionViewControllerDidLoad
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
  objc_msgSend(v2, "establishFirstResponderIfNeeded");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  self->_isAppLaunchOptimizationsActive = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
  v5 = objc_msgSend(v4, "establishFirstResponder");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
    objc_msgSend(v6, "setNeedsFirstResponder:", 1);

  }
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void **v4;
  void *v5;
  id v7;
  objc_super v8;
  void *v9;
  void *v10;

  if ((id)-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController selectedTabDirectChildViewController](self, "selectedTabDirectChildViewController"));
    v10 = v3;
    v4 = &v10;
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 1));

    return v5;
  }
  if ((id)-[DOCTabbedBrowserViewController tabBarCurrentRawTab](self, "tabBarCurrentRawTab") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController selectedTabReferenceViewController](self, "selectedTabReferenceViewController"));
    v9 = v3;
    v4 = &v9;
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)DOCTabbedBrowserViewController;
  v7 = -[DOCTabbedBrowserViewController preferredFocusEnvironments](&v8, "preferredFocusEnvironments");
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

- (unint64_t)browserContentStrategy
{
  if ((DOCDeviceIsPhone(self, a2) & 1) != 0)
    return 0;
  if (+[DOCFeature _UIPTabInfrastructureEnabled](DOCFeature, "_UIPTabInfrastructureEnabled"))return 2;
  return 1;
}

- (BOOL)canHaveTabs
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "neverAllowsAnyTypeOfTabs");

  return (v4 & 1) == 0
      && (id)-[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy") != (id)1;
}

- (void)configureUIPDocumentLandingStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v5);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

}

- (void)updateForChangedHorizontalSizeClass
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v4, "frame");
  -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v3, v5, v6);

  -[DOCTabbedBrowserViewController _updateTabButtonsVisibilityForTraits](self, "_updateTabButtonsVisibilityForTraits");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v8, "frame");
  v10 = v9;

  if (v10 != width)
  {
    -[DOCTabbedBrowserViewController _updateTabButtonsVisibilityForTraits](self, "_updateTabButtonsVisibilityForTraits");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController traitCollection](self, "traitCollection"));
    -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v11, width, height);

  }
  v12.receiver = self;
  v12.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)_updateColumnViewAvailablityFromTraitCollection:(id)a3 andSize:(CGSize)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v5 = +[DOCColumnViewController supportsDisplayInTraitCollection:availableArea:](_TtC5Files23DOCColumnViewController, "supportsDisplayInTraitCollection:availableArea:", a3, a4.width, a4.height);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullDocumentManagerViewController"));
  objc_msgSend(v6, "setEnvironmentSupportsColumnView:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController viewWillDisappear:](&v10, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DOCInteractionManager sharedManagerFor:](_TtC5Files21DOCInteractionManager, "sharedManagerFor:", v5));
  objc_msgSend(v6, "setLastOpenedItem:", 0);

  v8 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging(v7);
    v8 = docLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Interaction] Clearing lastOpenedItem in DOCTabbedBrowserVC viewWillDisappear", v9, 2u);
  }
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController setAdditionalLeadingNavigationBarButtonItems:](&v5, "setAdditionalLeadingNavigationBarButtonItems:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController selectedTabReferenceViewController](self, "selectedTabReferenceViewController"));
  -[DOCTabbedBrowserViewController updateNavigationBarButtonItemsForViewController:](self, "updateNavigationBarButtonItemsForViewController:", v4);

}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController setAdditionalTrailingNavigationBarButtonItems:](&v5, "setAdditionalTrailingNavigationBarButtonItems:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController selectedTabReferenceViewController](self, "selectedTabReferenceViewController"));
  -[DOCTabbedBrowserViewController updateNavigationBarButtonItemsForViewController:](self, "updateNavigationBarButtonItemsForViewController:", v4);

}

- (_TtC5Files29DOCBrowserContainerController)effectiveBrowserViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveBrowserViewController"));

  return (_TtC5Files29DOCBrowserContainerController *)v3;
}

- (id)selectedTabDirectChildViewController
{
  return -[DOCAutoBarHidingTabBarController selectedOrInflightSelectedViewController](self->_tabBarController, "selectedOrInflightSelectedViewController");
}

- (id)selectedTabReferenceViewController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController selectedTabDirectChildViewController](self, "selectedTabDirectChildViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController _referenceViewControllerForDirectTabChildViewController:](self, "_referenceViewControllerForDirectTabChildViewController:", v3));

  return v4;
}

- (id)_referenceViewControllerForDirectTabChildViewController:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class(DOCTabItemPlaceholderViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actualViewController"));
  }
  else
  {
    v7 = objc_opt_class(_TtC5Files35DOCSharedSplitBrowserViewController);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      v6 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    else
      v6 = v4;
  }
  v8 = v6;

  return v8;
}

- (void)enumerateAllFullBrowserViewControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (self->_fullRecentsViewController)
    objc_msgSend(v8, "addObject:");
  if (self->_fullSharedViewController)
    objc_msgSend(v8, "addObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self->_splitBrowserViewController, "fullDocumentManagerViewController", v8));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self->_splitBrowserViewController, "fullDocumentManagerViewController"));
    objc_msgSend(v9, "addObject:", v6);

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C0BE8;
  v10[3] = &unk_1005BEB00;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

- (id)effectiveFullBrowserForTab:(unint64_t)a3
{
  char *v5;
  uint64_t v6;

  v5 = -[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy");
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (v5)
      return v5;
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        v6 = 32;
      }
      else
      {
        if (a3)
          return v5;
        v6 = 24;
      }
      v5 = (char *)*(id *)((char *)&self->super.super.super.super.isa + v6);
      return v5;
    }
  }
  v5 = (char *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self->_splitBrowserViewController, "fullDocumentManagerViewController"));
  return v5;
}

- (BOOL)isShowingMovePanel
{
  void *v2;
  uint64_t v3;
  void *v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));
  v3 = objc_opt_self(_TtC5Files31DOCDocumentPickerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (unint64_t)tabControllerIndexForTab:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));

  v7 = -[DOCTabbedBrowserViewController tabControllerIndexForTab:inViewControllers:](self, "tabControllerIndexForTab:inViewControllers:", a3, v6);
  return v7;
}

- (unint64_t)tabControllerIndexForTab:(unint64_t)a3 inViewControllers:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;

  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "DOCTabBarItem"));
      v11 = objc_msgSend(v10, "tab");

      if (v11 == (id)a3)
        break;
      ++v8;
      v7 = objc_msgSend(v6, "count");
      if (v8 >= (unint64_t)v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v12 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging(v7);
      v12 = docLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_1004BF92C((uint64_t)self, a3, v12);
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)tabBarCurrentRawTab
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController selectedTabReferenceViewController](self, "selectedTabReferenceViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "DOCTabBarItem"));
  v4 = objc_msgSend(v3, "tab");

  return (unint64_t)v4;
}

- (unint64_t)effectiveTabSwitcherTab
{
  unint64_t result;
  void *v4;
  void *v5;
  id v6;

  result = -[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy");
  if (result - 1 >= 2)
  {
    if (!result)
      return -[DOCTabbedBrowserViewController tabBarCurrentRawTab](self, "tabBarCurrentRawTab");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hierarchyController"));
    v6 = objc_msgSend(v5, "effectiveTabSwitcherTab");

    return (unint64_t)v6;
  }
  return result;
}

- (void)switchToTab:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      -[DOCTabbedBrowserViewController switchToBrowse](self, "switchToBrowse");
      break;
    case 1uLL:
      -[DOCTabbedBrowserViewController switchToShared](self, "switchToShared");
      break;
    case 0uLL:
      -[DOCTabbedBrowserViewController switchToRecents](self, "switchToRecents");
      break;
  }
}

- (void)switchToRecents
{
  -[DOCTabbedBrowserViewController presentTab:](self, "presentTab:", 0);
}

- (void)switchToShared
{
  -[DOCTabbedBrowserViewController presentTab:](self, "presentTab:", 1);
}

- (void)switchToBrowse
{
  -[DOCTabbedBrowserViewController presentTab:](self, "presentTab:", 2);
}

- (void)switchToLocation:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  char v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "effectiveTabSwitcherTab");
  -[DOCTabbedBrowserViewController isSystemTabBarAllowedByTraits](self, "isSystemTabBarAllowedByTraits");
  v6 = -[DOCTabbedBrowserViewController isSystemTabBarAllowedByTraits](self, "isSystemTabBarAllowedByTraits");
  if (v5)
    v7 = 0;
  else
    v7 = v6;
  if (v6)
    -[DOCTabbedBrowserViewController switchToTab:](self, "switchToTab:", v5);
  if ((v7 & 1) == 0)
  {
    v9 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    -[DOCTabbedBrowserViewController _setLocationsInBrowseTab:](self, "_setLocationsInBrowseTab:", v8);

  }
}

- (BOOL)shouldDeferBrowserStateChanges
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (void)presentTab:(unint64_t)a3 rawTabSwitchOnly:(BOOL)a4
{
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unsigned __int8 v27;
  id v28;

  v7 = -[DOCTabbedBrowserViewController browserContentStrategy](self, "browserContentStrategy");
  if (v7)
    v8 = a4;
  else
    v8 = 1;
  if (-[DOCTabbedBrowserViewController shouldDeferBrowserStateChanges](self, "shouldDeferBrowserStateChanges"))
  {
    v28 = objc_alloc_init((Class)DOCUIPBrowserState);
    objc_msgSend(v28, "setTab:", a3);
    -[DOCTabbedBrowserViewController updateDeferredBrowserStateChangesWith:](self, "updateDeferredBrowserStateChangesWith:", v28);
    goto LABEL_26;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DOCDeprecatedUIMenuController shared](DOCDeprecatedUIMenuController, "shared"));
  objc_msgSend(v9, "hideMenu");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fullDocumentManagerViewController"));
  objc_msgSend(v11, "setEditing:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
  objc_msgSend(v12, "setEditing:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
  objc_msgSend(v13, "setEditing:", 0);

  if (v7 == 1)
    v14 = 2;
  else
    v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
  v16 = objc_msgSend(v15, "selectedOrInflightSelectedTab");

  if (v16 != (id)v14)
  {
    v17 = -[DOCTabbedBrowserViewController tabControllerIndexForTab:](self, "tabControllerIndexForTab:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
    v19 = objc_msgSend(v18, "selectedIndex");

    if (v19 != (id)v17)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController tabBarController](self, "tabBarController"));
      objc_msgSend(v20, "setSelectedIndex:", v17);

    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowserForTab:](self, "effectiveFullBrowserForTab:", a3));
  v22 = v21;
  v28 = v21;
  if (!v8)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hierarchyController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "locationForDeterminingCurrentEffectiveTab"));

    if (v24)
    {
      v25 = objc_msgSend(v23, "effectiveTabSwitcherTab");

      v22 = v28;
      if (v25 == (id)a3)
        goto LABEL_24;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
      v27 = objc_msgSend(v26, "isViewLoaded");

      v22 = v28;
      if ((v27 & 1) == 0)
        goto LABEL_24;
    }
    if (a3 == 2)
    {
      -[DOCTabbedBrowserViewController presentBrowseTabFromFullBrowser](self, "presentBrowseTabFromFullBrowser");
    }
    else if (a3 == 1)
    {
      -[DOCTabbedBrowserViewController presentSharedTabFromFullBrowser](self, "presentSharedTabFromFullBrowser");
    }
    else
    {
      if (a3)
        goto LABEL_24;
      -[DOCTabbedBrowserViewController presentRecentsTabFromFullBrowse](self, "presentRecentsTabFromFullBrowse");
    }
    v22 = v28;
  }
LABEL_24:
  -[DOCTabbedBrowserViewController updateNavigationBarButtonItemsForViewController:](self, "updateNavigationBarButtonItemsForViewController:", v22);
  -[DOCTabbedBrowserViewController updateLocationTitleFromCurrentState](self, "updateLocationTitleFromCurrentState");
  if (!self->_isAppLaunchOptimizationsActive)
    -[DOCTabbedBrowserViewController saveSelectedTabState](self, "saveSelectedTabState");
LABEL_26:

}

- (id)fullBrowserHierarchyController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self->_splitBrowserViewController, "fullDocumentManagerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hierarchyController"));

  return v3;
}

- (void)presentRecentsTabFromFullBrowse
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullBrowserHierarchyController](self, "fullBrowserHierarchyController"));
  objc_msgSend(v2, "restoreLastBrowsedStateForTab:", 0);

}

- (void)presentSharedTabFromFullBrowser
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullBrowserHierarchyController](self, "fullBrowserHierarchyController"));
  objc_msgSend(v2, "restoreLastBrowsedStateForTab:", 1);

}

- (void)presentBrowseTabFromFullBrowser
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullBrowserHierarchyController](self, "fullBrowserHierarchyController"));
  objc_msgSend(v2, "restoreLastBrowsedStateForTab:", 2);

}

- (void)showConnectToServer:(id)a3
{
  id v4;

  v4 = a3;
  -[DOCTabbedBrowserViewController presentTab:](self, "presentTab:", 2);
  -[DOCTabbedBrowserViewController presentConnectToServer:](self, "presentConnectToServer:", v4);

}

- (void)willPresentSearchResultsController:(id)a3
{
  -[DOCTabbedBrowserViewController setIsShowingSearchResults:](self, "setIsShowingSearchResults:", 1);
}

- (void)willDismissSearchResultsController:(id)a3
{
  -[DOCTabbedBrowserViewController setIsShowingSearchResults:](self, "setIsShowingSearchResults:", 0);
}

- (void)splitViewController:(id)a3 wantsToShowTabBar:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fullDocumentManagerViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));

  if (v6 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fullDocumentManagerViewController"));
    -[DOCTabbedBrowserViewController _viewController:wantsToShowSystemTabBar:isEditing:](self, "_viewController:wantsToShowSystemTabBar:isEditing:", v9, v4, objc_msgSend(v8, "isEditing"));

  }
}

- (void)splitViewController:(id)a3 didChangeFromState:(id)a4 toState:(id)a5 isUserDisplayModeChange:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;

  v6 = a6;
  v11 = a4;
  v9 = a5;
  if (-[DOCTabbedBrowserViewController enclosedInUIPDocumentLanding](self, "enclosedInUIPDocumentLanding")&& (objc_msgSend(v11, "isSidebarShown") & 1) == 0&& objc_msgSend(v9, "isSidebarShown"))
  {
    v10 = objc_alloc_init((Class)DOCUIPBrowserState);
    objc_msgSend(v10, "setDocumentLandingMode:", 0);
    if (v6)
      -[DOCTabbedBrowserViewController performBrowserStateChange:](self, "performBrowserStateChange:", v10);

  }
}

- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5
{
  -[DOCTabbedBrowserViewController revealDocumentAtURL:importIfNeeded:openDocument:revealContents:updateLastUsedDate:completion:](self, "revealDocumentAtURL:importIfNeeded:openDocument:revealContents:updateLastUsedDate:completion:", a3, a4, 1, 0, 1, a5);
}

- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 openDocument:(BOOL)a5 revealContents:(BOOL)a6 updateLastUsedDate:(BOOL)a7 completion:(id)a8
{
  id v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  id *v26;
  void *v27;
  id v28;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  _QWORD v36[2];
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;
  char v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  _QWORD v47[2];

  v31 = a4;
  v32 = a7;
  v30 = a5;
  v10 = a3;
  v11 = a8;
  v12 = objc_msgSend(v10, "startAccessingSecurityScopedResource");
  v47[0] = NSURLIsDirectoryKey;
  v47[1] = NSURLIsPackageKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));
  v42 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "promisedItemResourceValuesForKeys:error:", v13, &v42));
  v15 = v42;

  if (v15)
  {
    v17 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging(v16);
      v17 = docLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v10;
      v45 = 2112;
      v46 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to get promised item resource values for url: %@ error: %@", buf, 0x16u);
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSURLIsDirectoryKey));
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSURLIsPackageKey));
  v21 = objc_msgSend(v20, "BOOLValue");

  if (v12)
    objc_msgSend(v10, "stopAccessingSecurityScopedResource");
  if (-[DOCTabbedBrowserViewController isShowingMovePanel](self, "isShowingMovePanel"))
    v22 = objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));
  else
    v22 = objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
  v23 = (void *)v22;
  v24 = v19 & (v21 ^ 1);
  if ((v24 & 1) != 0 || !v30)
  {
    -[DOCTabbedBrowserViewController switchToBrowse](self, "switchToBrowse");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fullDocumentManagerViewController"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000C1844;
    v35[3] = &unk_1005BEC18;
    v26 = (id *)v36;
    v28 = v10;
    v36[0] = v28;
    v39 = v31;
    v38 = v11;
    v36[1] = self;
    v37 = v23;
    v40 = a6;
    v41 = v24;
    objc_msgSend(v27, "revealDocumentAtURL:importIfNeeded:updateLastUsedDate:completion:", v28, 0, v32, v35);

    v25 = v38;
  }
  else
  {
    -[DOCTabbedBrowserViewController switchToRecents](self, "switchToRecents");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000C245C;
    v33[3] = &unk_1005BE668;
    v26 = &v34;
    v34 = v11;
    objc_msgSend(v25, "revealDocumentAtURL:importIfNeeded:updateLastUsedDate:completion:", v10, v31, v32, v33);
  }

}

- (id)transitionControllerForDocumentAtURL:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCTabbedBrowserViewController;
  v3 = -[DOCTabbedBrowserViewController transitionControllerForDocumentAtURL:](&v5, "transitionControllerForDocumentAtURL:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (BOOL)documentBrowser:(id)a3 shouldShowActivityViewControllerForDocumentURLs:(id)a4 barButtonItem:(id)a5 popoverTracker:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned __int8 v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", a2))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    v14 = objc_msgSend(v13, "documentBrowser:shouldShowActivityViewControllerForDocumentURLs:barButtonItem:popoverTracker:", self, v10, v11, v12);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)documentBrowser:(id)a3 shouldHandleLocation:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v6 = a4;
  v7 = a3;
  -[DOCTabbedBrowserViewController updateLocationTitleFromCurrentState](self, "updateLocationTitleFromCurrentState");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));

  if (v8 == v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProviderItem"));
    v11 = v10;
    if (v10 && objc_msgSend(v10, "isFolder"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fullDocumentManagerViewController"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000C2660;
      v15[3] = &unk_1005BE558;
      v15[4] = self;
      objc_msgSend(v13, "revealLocation:animated:completion:", v6, 0, v15);

      v9 = 0;
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", a2))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    objc_msgSend(v6, "documentBrowser:didPickDocumentsAtURLs:", self, v7);
LABEL_5:

    goto LABEL_6;
  }
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", "documentBrowser:didPickDocumentURLs:"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    objc_msgSend(v6, "documentBrowser:didPickDocumentURLs:", self, v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", a2))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    objc_msgSend(v6, "documentBrowser:didRequestDocumentCreationWithHandler:", self, v7);

  }
}

- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", a2))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    objc_msgSend(v9, "documentBrowser:didImportDocumentAtURL:toDestinationURL:", self, v10, v8);

  }
}

- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", a2))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    objc_msgSend(v9, "documentBrowser:failedToImportDocumentAtURL:error:", self, v10, v8);

  }
}

- (id)documentBrowser:(id)a3 applicationActivitiesForDocumentURLs:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", a2))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentBrowser:applicationActivitiesForDocumentURLs:", self, v6));

  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)documentBrowser:(id)a3 willPresentActivityViewController:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (-[DOCTabbedBrowserViewController _shouldForwardSelectorToDelegate:](self, "_shouldForwardSelectorToDelegate:", a2))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    objc_msgSend(v8, "documentBrowser:willPresentActivityViewController:", v9, v7);

  }
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController setAllowsPickingMultipleItems:](&v9, "setAllowsPickingMultipleItems:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
  objc_msgSend(v5, "setAllowsPickingMultipleItems:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
  objc_msgSend(v6, "setAllowsPickingMultipleItems:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullDocumentManagerViewController"));
  objc_msgSend(v8, "setAllowsPickingMultipleItems:", v3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  objc_super v15;

  v10 = a4;
  if (off_100640B68 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("editing")))
    {
      v11 = objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
      if ((id)v11 == v10)
      {

      }
      else
      {
        v12 = (void *)v11;
        v13 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));

        if (v13 != v10)
          goto LABEL_9;
      }
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000C2B68;
      v14[3] = &unk_1005BE558;
      v14[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DOCTabbedBrowserViewController;
    -[DOCTabbedBrowserViewController observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }
LABEL_9:

}

- (void)updateTabBarVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
  if ((objc_msgSend(v3, "isEditing") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    if ((objc_msgSend(v5, "isEditing") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullDocumentManagerViewController"));
      v4 = (uint64_t)objc_msgSend(v7, "isEditing");

    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
  if ((objc_msgSend(v8, "prefersTabBarHidden") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
    if ((objc_msgSend(v10, "prefersTabBarHidden") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fullDocumentManagerViewController"));
      v9 = objc_msgSend(v12, "prefersTabBarHidden") ^ 1;

    }
  }

  -[DOCTabbedBrowserViewController _viewController:wantsToShowSystemTabBar:isEditing:](self, "_viewController:wantsToShowSystemTabBar:isEditing:", 0, v9, v4);
}

- (BOOL)_shouldForwardSelectorToDelegate:(SEL)a3
{
  DOCTabbedBrowserViewController *v5;
  void *v6;
  char v7;

  v5 = (DOCTabbedBrowserViewController *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
  if (v5 == self)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, a3);

  }
  return v7 & 1;
}

- (void)updateNavigationBarButtonItemsForViewController:(id)a3
{
  DOCSplitBrowserViewController *v4;
  DOCSplitBrowserViewController *v5;
  uint64_t v6;
  uint64_t v7;
  DOCSplitBrowserViewController *v8;
  void *v9;
  void *v10;
  DOCSplitBrowserViewController *v11;

  v11 = (DOCSplitBrowserViewController *)(id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController _referenceViewControllerForDirectTabChildViewController:](self, "_referenceViewControllerForDirectTabChildViewController:", a3));
  v4 = (DOCSplitBrowserViewController *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self->_splitBrowserViewController, "fullDocumentManagerViewController"));

  v5 = v11;
  if (v11 == v4)
  {
    v5 = self->_splitBrowserViewController;

  }
  v6 = objc_opt_class(DOCFullDocumentManagerViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
    || (v7 = objc_opt_class(DOCSplitBrowserViewController), (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController additionalLeadingNavigationBarButtonItems](self, "additionalLeadingNavigationBarButtonItems"));
    -[DOCSplitBrowserViewController setAdditionalLeadingNavigationBarButtonItems:](v8, "setAdditionalLeadingNavigationBarButtonItems:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController additionalTrailingNavigationBarButtonItems](self, "additionalTrailingNavigationBarButtonItems"));
    -[DOCSplitBrowserViewController setAdditionalTrailingNavigationBarButtonItems:](v8, "setAdditionalTrailingNavigationBarButtonItems:", v10);

  }
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController selectedTabDirectChildViewController](self, "selectedTabDirectChildViewController"));

  if (v6 == v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController _referenceViewControllerForDirectTabChildViewController:](self, "_referenceViewControllerForDirectTabChildViewController:", v5));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    if (v7 != v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));

      if (v7 == v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));

        if (v7 != v10)
        {
LABEL_17:

          goto LABEL_18;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullSharedViewController](self, "fullSharedViewController"));
      }
      v12 = v11;
      objc_msgSend(v11, "resetNavigationStepwise");
LABEL_16:

      goto LABEL_17;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullDocumentManagerViewController"));
    if (!+[UITraitCollection enclosingTabSwitcherCanBeFloating](UITraitCollection, "enclosingTabSwitcherCanBeFloating")|| !objc_msgSend(v12, "_canNavigateBack"))
    {
      if (objc_msgSend(v7, "displayMode") == (id)1)
      {
        objc_msgSend(v7, "showSidebar");
        goto LABEL_16;
      }
      if (objc_msgSend(v7, "displayMode") == (id)3)
      {
        objc_msgSend(v7, "hideSidebar");
        goto LABEL_16;
      }
    }
    objc_msgSend(v12, "popToRootViewControllerAnimated:", 1);
    goto LABEL_16;
  }
  v7 = v5;
LABEL_18:

  return v6 != v5;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController _referenceViewControllerForDirectTabChildViewController:](self, "_referenceViewControllerForDirectTabChildViewController:", a4));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));

  if (v10 != v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController fullRecentsViewController](self, "fullRecentsViewController"));
    objc_msgSend(v6, "dismissSearch");

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));

  if (v10 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fullDocumentManagerViewController"));
    objc_msgSend(v9, "dismissSearch");

  }
  -[DOCTabbedBrowserViewController saveSelectedTabState](self, "saveSelectedTabState");
  -[DOCTabbedBrowserViewController updateNavigationBarButtonItemsForViewController:](self, "updateNavigationBarButtonItemsForViewController:", v10);
  -[DOCTabbedBrowserViewController updateLocationTitleFromCurrentState](self, "updateLocationTitleFromCurrentState");

}

- (unint64_t)defaultInitialBrowsedPathEffectiveTab
{
  unint64_t v3;
  void *v4;
  unsigned int v5;

  v3 = -[DOCTabbedBrowserViewController _mostRecentBrowsedPathEffectiveTab](self, "_mostRecentBrowsedPathEffectiveTab");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v5 = objc_msgSend(v4, "canPresentContentForTab:", v3);

  if (v5)
    return v3;
  else
    return 2;
}

- (unint64_t)_mostRecentBrowsedPathEffectiveTab
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController forceBrowseTabDefaultsValue](self, "forceBrowseTabDefaultsValue"));
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "BOOLValue"))
      v5 = 2;
    else
      v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController deferredBrowserStateChanges](self, "deferredBrowserStateChanges"));
    v7 = v6;
    if (v6 && objc_msgSend(v6, "tabIsSpecified"))
    {
      v5 = (unint64_t)objc_msgSend(v7, "tab");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[DOCUserInterfaceStateStore sharedStore](DOCUserInterfaceStateStore, "sharedStore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interfaceStateForConfiguration:", v9));

      -[DOCTabbedBrowserViewController enclosedInUIPDocumentLanding](self, "enclosedInUIPDocumentLanding");
      v5 = (unint64_t)objc_msgSend(v10, "mostRecentlyVisitedBrowseSourceWithFallback:", 0);

    }
  }

  return v5;
}

- (void)saveSelectedTabState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DOCUserInterfaceStateStore sharedStore](DOCUserInterfaceStateStore, "sharedStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interfaceStateForConfiguration:", v4));

  objc_msgSend(v7, "updateMostRecentlyVisitedBrowseSourceToTab:", -[DOCTabbedBrowserViewController effectiveTabSwitcherTab](self, "effectiveTabSwitcherTab"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DOCUserInterfaceStateStore sharedStore](DOCUserInterfaceStateStore, "sharedStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController configuration](self, "configuration"));
  objc_msgSend(v5, "updateInterfaceState:forConfiguration:", v7, v6);

}

- (void)dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void (**v8)(void);

  v4 = a3;
  v8 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, v8);

  }
  else
  {
    v8[2]();
  }

}

- (void)importDocumentAtURL:(id)a3 nextToDocumentAtURL:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "documentManager"));
  objc_msgSend(v13, "importDocumentAt:nextTo:mode:completionHandler:", v12, v11, a5, v10);

}

- (void)importDocumentAtURL:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[DOCTabbedBrowserViewController effectiveFullBrowser](self, "effectiveFullBrowser"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentManager"));
  objc_msgSend(v10, "importDocumentAt:mode:toCurrentBrowserLocationWithCompletion:", v9, a4, v8);

}

- (BOOL)isAppLaunchOptimizationsActive
{
  return self->_isAppLaunchOptimizationsActive;
}

- (void)setIsAppLaunchOptimizationsActive:(BOOL)a3
{
  self->_isAppLaunchOptimizationsActive = a3;
}

- (DOCSourceObserver)sourceObserver
{
  return (DOCSourceObserver *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSourceObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_TtC5Files24DOCNamedLocationResolver)namedLocationResolver
{
  return (_TtC5Files24DOCNamedLocationResolver *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)safeAreaUpdatesDisabledDuringTransitions
{
  return self->_safeAreaUpdatesDisabledDuringTransitions;
}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (DOCUIPBrowserState)deferredBrowserStateChanges
{
  return self->_deferredBrowserStateChanges;
}

- (void)setDeferredBrowserStateChanges:(id)a3
{
  objc_storeStrong((id *)&self->_deferredBrowserStateChanges, a3);
}

- (BOOL)isSystemTabBarAllowedByTraits
{
  return self->_isSystemTabBarAllowedByTraits;
}

- (BOOL)isSystemTabBarPreferred
{
  return self->_isSystemTabBarPreferred;
}

- (void)setIsSystemTabBarPreferred:(BOOL)a3
{
  self->_isSystemTabBarPreferred = a3;
}

- (BOOL)isSystemTabBarVisible
{
  return self->_isSystemTabBarVisible;
}

- (void)setIsSystemTabBarVisible:(BOOL)a3
{
  self->_isSystemTabBarVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSourceUIManager, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_deferredBrowserStateChanges, 0);
  objc_storeStrong((id *)&self->_currentLocationTitle, 0);
  objc_storeStrong((id *)&self->_namedLocationResolver, 0);
  objc_storeStrong((id *)&self->_sourceObserver, 0);
  objc_destroyWeak((id *)&self->_tabbedBrowserViewControllerDelegate);
  objc_storeStrong((id *)&self->_splitBrowserViewController, 0);
  objc_storeStrong((id *)&self->_fullSharedViewController, 0);
  objc_storeStrong((id *)&self->_fullRecentsViewController, 0);
  objc_storeStrong((id *)&self->_didLoadStateByTab, 0);
}

- (id)newViewControllersSharing:(id)a3 tabBarItems:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  id v9;
  DOCTabbedBrowserViewController *v10;
  uint64_t v11;
  Class isa;

  v7 = type metadata accessor for DOCTabBarItem();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  v11 = sub_100274040(v8, v9, v10);

  swift_bridgeObjectRelease(v8);
  sub_10004F2F0(0, (unint64_t *)&qword_1006434D0, UIViewController_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  return isa;
}

- (void)selectAll:(id)a3
{
  DOCTabbedBrowserViewController *v5;
  uint64_t v6;
  double v7;
  DOCTabbedBrowserViewController *v8;
  DOCSplitBrowserViewController *v9;
  DOCFullDocumentManagerViewController *v10;
  __int128 v11;
  __int128 v12;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v11, v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v8 = self;
  }
  v9 = -[DOCTabbedBrowserViewController splitBrowserViewController](self, "splitBrowserViewController", v7, v11, v12);
  v10 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v9, "fullDocumentManagerViewController");

  sub_10039E974((uint64_t)&v11, 0);
  sub_10000CB4C((uint64_t)&v11, &qword_100642730);
}

- (void)performDeselectAll:(id)a3
{
  DOCTabbedBrowserViewController *v5;
  uint64_t v6;
  DOCTabbedBrowserViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100298FB4();

  sub_10000CB4C((uint64_t)v8, &qword_100642730);
}

- (void)performGoToRecents:(id)a3
{
  -[DOCTabbedBrowserViewController switchToTab:](self, "switchToTab:", 0);
}

- (void)performGoToBrowse:(id)a3
{
  -[DOCTabbedBrowserViewController switchToTab:](self, "switchToTab:", 2);
}

- (void)performGoToEnclosingFolder:(id)a3
{
  id v4;
  DOCTabbedBrowserViewController *v5;
  DOCSplitBrowserViewController *v6;

  v4 = a3;
  v5 = self;
  v6 = -[DOCTabbedBrowserViewController splitBrowserViewController](v5, "splitBrowserViewController");
  -[DOCSplitBrowserViewController showSidebar](v6, "showSidebar");

}

- (void)performConnectToServer:(id)a3
{
  id v4;
  id v5;
  DOCTabbedBrowserViewController *v6;
  _QWORD v7[4];
  char v8;

  v7[0] = 0xD000000000000038;
  v7[1] = 0x8000000100521420;
  v7[2] = 0;
  v7[3] = 0;
  v8 = 3;
  v4 = a3;
  v6 = self;
  v5 = *(id *)DOCAnalyticsManager.shared.unsafeMutableAddressor();
  DOCAnalyticsManager.sendConnectToServerShownEvent(_:)(v7);

  -[DOCTabbedBrowserViewController presentConnectToServer:](v6, "presentConnectToServer:", 0);
}

- (void)performGoToDocuments:(id)a3
{
  id v4;
  DOCTabbedBrowserViewController *v5;
  _TtC5Files24DOCNamedLocationResolver *v6;
  _QWORD *v7;
  DOCTabbedBrowserViewController *v8;

  v4 = a3;
  v5 = self;
  v6 = -[DOCTabbedBrowserViewController namedLocationResolver](v5, "namedLocationResolver");
  v7 = (_QWORD *)swift_allocObject(&unk_1005D8150, 40, 7);
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = v5;
  v8 = v5;
  sub_10036EE38(0, (uint64_t)sub_10021C860, (uint64_t)v7);

  swift_release(v7);
}

- (void)performGoToDesktop:(id)a3
{
  id v4;
  DOCTabbedBrowserViewController *v5;
  _TtC5Files24DOCNamedLocationResolver *v6;
  _QWORD *v7;
  DOCTabbedBrowserViewController *v8;

  v4 = a3;
  v5 = self;
  v6 = -[DOCTabbedBrowserViewController namedLocationResolver](v5, "namedLocationResolver");
  v7 = (_QWORD *)swift_allocObject(&unk_1005D8128, 40, 7);
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = v5;
  v8 = v5;
  sub_10036EE38(1, (uint64_t)sub_10021C860, (uint64_t)v7);

  swift_release(v7);
}

- (void)performGoToDownloads:(id)a3
{
  id v4;
  DOCTabbedBrowserViewController *v5;
  _TtC5Files24DOCNamedLocationResolver *v6;
  _QWORD *v7;
  DOCTabbedBrowserViewController *v8;

  v4 = a3;
  v5 = self;
  v6 = -[DOCTabbedBrowserViewController namedLocationResolver](v5, "namedLocationResolver");
  v7 = (_QWORD *)swift_allocObject(&unk_1005D8100, 40, 7);
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = v5;
  v8 = v5;
  sub_10036EE38(2, (uint64_t)sub_10021C860, (uint64_t)v7);

  swift_release(v7);
}

- (void)performGoToICloudDrive:(id)a3
{
  id v4;
  DOCTabbedBrowserViewController *v5;
  _TtC5Files24DOCNamedLocationResolver *v6;
  _QWORD *v7;
  DOCTabbedBrowserViewController *v8;

  v4 = a3;
  v5 = self;
  v6 = -[DOCTabbedBrowserViewController namedLocationResolver](v5, "namedLocationResolver");
  v7 = (_QWORD *)swift_allocObject(&unk_1005D80D8, 40, 7);
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = v5;
  v8 = v5;
  sub_10036EE38(3, (uint64_t)sub_10021C860, (uint64_t)v7);

  swift_release(v7);
}

- (void)performGoToShared:(id)a3
{
  void *v5;
  id v6;
  DOCTabbedBrowserViewController *v7;
  id v8;

  v5 = (void *)objc_opt_self(DOCConcreteLocation);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "sharedItemsLocation");
  -[DOCTabbedBrowserViewController switchToLocation:](v7, "switchToLocation:", v8);

}

- (void)applyBrowserStateChange:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  DOCTabbedBrowserViewController *v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;

  v5 = swift_allocObject(&unk_1005E4678, 32, 7);
  *(_QWORD *)(v5 + 16) = self;
  *(_QWORD *)(v5 + 24) = a3;
  v11[4] = sub_1003B1F98;
  v12 = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004A82C;
  v11[3] = &unk_1005E4690;
  v6 = _Block_copy(v11);
  v7 = v12;
  v8 = a3;
  v9 = self;
  v10 = v8;
  swift_release(v7);
  DOCRunInMainThread(v6);
  _Block_release(v6);

}

- (void)applyBrowserStateChange:(id)a3 force:(BOOL)a4
{
  -[DOCTabbedBrowserViewController _applyBrowserStateChange:force:](self, "_applyBrowserStateChange:force:", a3, a4);
}

- (void)performBrowserStateChange:(id)a3
{
  id v4;
  DOCTabbedBrowserViewController *v5;

  v4 = a3;
  v5 = self;
  DOCTabbedBrowserViewController.performBrowserStateChange(_:)((uint64_t)v4);

}

- (void)_applyBrowserStateChange:(id)a3 force:(BOOL)a4
{
  id v6;
  DOCTabbedBrowserViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1003AD550(v6, a4);

}

- (void)updateDeferredBrowserStateChangesWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  DOCTabbedBrowserViewController *v7;

  v4 = static DOCUIPBrowserState._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v6 = v5;
  v7 = self;
  sub_1003AD814(v4, v6);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  DOCTabbedBrowserViewController *v7;
  uint64_t v8;
  DOCTabbedBrowserViewController *v9;
  unsigned __int8 v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = DOCTabbedBrowserViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v12);

  sub_10000CB4C((uint64_t)v12, &qword_100642730);
  return v10 & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  DOCTabbedBrowserViewController *v7;
  uint64_t v8;
  DOCTabbedBrowserViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  _QWORD v19[3];
  uint64_t v20;

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v18, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v9 = self;
  }
  DOCTabbedBrowserViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v18, (uint64_t)v19);

  sub_10000CB4C((uint64_t)v18, &qword_100642730);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_10007E7A0(v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  sub_100068588(v19);
  return v16;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_10046BC4C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCTabbedBrowserViewController.pressesBegan(_:with:));
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  sub_10046BC4C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCTabbedBrowserViewController.pressesChanged(_:with:));
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  sub_10046BC4C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCTabbedBrowserViewController.pressesEnded(_:with:));
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  sub_10046BC4C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCTabbedBrowserViewController.pressesCancelled(_:with:));
}

- (void)presentConnectToServer:(id)a3 askPermission:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSURL *v11;
  DOCTabbedBrowserViewController *v12;
  DOCTabbedBrowserViewController *v13;
  DOCTabbedBrowserViewController *v14;
  uint64_t v15;

  v4 = a4;
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = self;
  if (v4)
  {
    sub_10046BD0C((uint64_t)v10);
  }
  else
  {
    URL._bridgeToObjectiveC()(v11);
    v14 = v13;
    -[DOCTabbedBrowserViewController presentConnectToServer:](v12, "presentConnectToServer:", v13);

    v12 = v14;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)presentConnectToServer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  DOCTabbedBrowserViewController *v10;
  uint64_t v11;

  v5 = sub_10006922C(&qword_100643470);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_10046C318((uint64_t)v7);

  sub_10000CB4C((uint64_t)v7, &qword_100643470);
}

- (void)presentGoToLocation
{
  DOCTabbedBrowserViewController *v2;

  v2 = self;
  sub_10046C800();

}

- (void)actionControllerDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  DOCTabbedBrowserViewController *v11;

  if (a4)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v8 = 0;
  v9 = a3;
  v10 = a5;
  v11 = self;
  DOCTabbedBrowserViewController.actionControllerDidFinishAction(_:userInfo:error:)(v9, v8, (uint64_t)a5);

  swift_bridgeObjectRelease(v8);
}

- (void)actionControllerDidFinishAction:(id)a3 error:(id)a4
{
  id v6;
  DOCTabbedBrowserViewController *v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  v7 = self;
  if (a4)
    v8 = _convertErrorToNSError(_:)(a4);
  else
    v8 = 0;
  v9 = (id)v8;
  -[DOCTabbedBrowserViewController actionControllerDidFinishAction:userInfo:error:](v7, "actionControllerDidFinishAction:userInfo:error:", v6, 0);

}

- (void)actionController:(id)a3 presentError:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  DOCTabbedBrowserViewController *v10;
  void *v11;
  id v12;

  v8 = _Block_copy(a5);
  v9 = a3;
  v12 = a4;
  v10 = self;
  v11 = (void *)_convertErrorToNSError(_:)(v12);
  DOCPresentAlertForError(v11, v9);

  _Block_release(v8);
}

- (void)configureTabBarForUIPIfNecessary
{
  DOCTabbedBrowserViewController *v2;

  v2 = self;
  sub_10046D024();

}

- (void)updateTraitCollectionTabBarSetting
{
  DOCTabbedBrowserViewController *v2;

  v2 = self;
  sub_10046D334();

}

@end
