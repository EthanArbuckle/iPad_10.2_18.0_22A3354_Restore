@implementation DOCFullDocumentManagerViewController

- (id)provideContainerControllerAt:(id)a3 from:(id)a4 isUserInteraction:(BOOL)a5 isBrowsingTrash:(BOOL)a6
{
  id v10;
  id v11;
  DOCFullDocumentManagerViewController *v12;
  char *v13;

  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = sub_100056990(v10, a4, a5, a6);

  return v13;
}

- (BOOL)presentationContextShowsProvidersAsBrowserRoot
{
  DOCFullDocumentManagerViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[DOCFullDocumentManagerViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "sourceOutlineStyle");

  return v4 == (id)1;
}

- (void)dataSource:(id)a3 didUpdate:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  char *v10;
  id v11;
  DOCFullDocumentManagerViewController *v12;

  v5 = a5;
  v9 = sub_10004F2F0(0, (unint64_t *)&qword_1006434D0, UIViewController_ptr);
  v10 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = a3;
  v12 = self;
  sub_10005D434((uint64_t)v11, v10, v5);

  swift_bridgeObjectRelease(v10);
}

- (id)currentViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topViewController"));

  return v3;
}

- (UIViewControllerTransitionCoordinator)hierarchyChangeTransitionCoordinator
{
  DOCFullDocumentManagerViewController *v2;
  UINavigationController *v3;
  id v4;

  v2 = self;
  v3 = -[DOCFullDocumentManagerViewController internalNavigationController](v2, "internalNavigationController");
  v4 = -[UINavigationController transitionCoordinator](v3, "transitionCoordinator");

  return (UIViewControllerTransitionCoordinator *)v4;
}

- (void)viewDidLoad
{
  void *v3;
  id WeakRetained;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *multiTapDebugGestureRecognizer;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController viewDidLoad](&v8, "viewDidLoad");
  -[DOCFullDocumentManagerViewController ensureInternalNavigationControllerIsInstalled](self, "ensureInternalNavigationControllerIsInstalled");
  -[DOCFullDocumentManagerViewController updateNavigationBarPrefersLargeTitles](self, "updateNavigationBarPrefersLargeTitles");
  if (!self->_viewDidLoadResetLocationDisabled)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
    objc_msgSend(v3, "resetWithDefaultLocationWithAnimated:", 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceObserver);
  objc_msgSend(WeakRetained, "startObservingSources");

  if (os_variant_has_internal_diagnostics("com.apple.DocumentManager"))
  {
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "invokeDebugGathering");
    multiTapDebugGestureRecognizer = self->_multiTapDebugGestureRecognizer;
    self->_multiTapDebugGestureRecognizer = v5;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_multiTapDebugGestureRecognizer, "setNumberOfTapsRequired:", 4);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_multiTapDebugGestureRecognizer, "setNumberOfTouchesRequired:", 2);
    -[UITapGestureRecognizer setDelegate:](self->_multiTapDebugGestureRecognizer, "setDelegate:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_internalNavigationController, "navigationBar"));
    objc_msgSend(v7, "addGestureRecognizer:", self->_multiTapDebugGestureRecognizer);

  }
  -[DOCFullDocumentManagerViewController swift_viewDidLoad](self, "swift_viewDidLoad");
  -[DOCFullDocumentManagerViewController installDebugMenuGesture](self, "installDebugMenuGesture");
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char isKindOfClass;
  void *v36;
  _BYTE *v37;
  uint64_t v38;
  int64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BYTE *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[DOCFullDocumentManagerViewController endForcedNavigationTransitionChrome:appearingViewController:](self, "endForcedNavigationTransitionChrome:appearingViewController:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  objc_msgSend(v10, "invalidateAllAssertions");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "locations"));

  v59 = v12;
  v13 = objc_msgSend(v12, "count");
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
  v14 = objc_msgSend(v58, "count");
  v15 = objc_opt_class(_TtC5Files29DOCBrowserContainerController);
  if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0
    || (v16 = objc_opt_class(_TtC5Files23DOCColumnViewController),
        (objc_opt_isKindOfClass(v9, v16) & 1) != 0))
  {
    v55 = v13;
    v56 = v5;
    v17 = objc_opt_new(NSMutableArray);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v57 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v65;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v65 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v22);
          v24 = objc_opt_class(_TtC5Files29DOCBrowserContainerController);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0
            || (v25 = objc_opt_class(_TtC5Files23DOCColumnViewController),
                (objc_opt_isKindOfClass(v23, v25) & 1) != 0))
          {
            -[NSMutableArray addObject:](v17, "addObject:", v23);
          }
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      }
      while (v20);
    }

    v26 = objc_opt_class(_TtC5Files23DOCColumnViewController);
    if ((objc_opt_isKindOfClass(v9, v26) & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "effectiveRootLocation"));

      v5 = v56;
      v29 = v55;
      if (v28)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "effectiveLocations"));
        v29 = objc_msgSend(v31, "count");

      }
    }
    else
    {
      v5 = v56;
      v29 = v55;
    }
    if (v29 > -[NSMutableArray count](v17, "count")
      && -[DOCFullDocumentManagerViewController updateLocationsAfterPopTransition](self, "updateLocationsAfterPopTransition"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "childViewControllers"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));
      v34 = objc_opt_class(_TtC5Files24DOCSidebarViewController);
      isKindOfClass = objc_opt_isKindOfClass(v33, v34);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "childViewControllers"));
      v37 = objc_msgSend(v36, "count");
      v38 = isKindOfClass & 1;
      v5 = v56;

      v39 = &v29[v38] - v37;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
      objc_msgSend(v40, "removeTrailingLocationCount:animated:", v39, 0);

    }
    v8 = v57;
  }
  else if (v14)
  {
    v51 = v9;
    v52 = objc_opt_class(_TtC5Files24DOCSidebarViewController);
    objc_opt_isKindOfClass(v51, v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
    LOBYTE(v51) = objc_msgSend(v53, "hasPendingLocationChange");

    if ((v51 & 1) == 0)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
      objc_msgSend(v54, "reset");

    }
  }
  v41 = objc_opt_class(_TtC5Files23DOCColumnViewController);
  if ((objc_opt_isKindOfClass(v9, v41) & 1) != 0)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerControllers"));
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v61;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v61 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v46), "setPreventAppearanceForwarding:", 0);
          v46 = (char *)v46 + 1;
        }
        while (v44 != v46);
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v44);
    }

  }
  else
  {
    v47 = objc_opt_class(_TtC5Files29DOCBrowserContainerController);
    if ((objc_opt_isKindOfClass(v9, v47) & 1) != 0)
      objc_msgSend(v9, "setPreventAppearanceForwarding:", 0);
  }
  -[DOCFullDocumentManagerViewController setUpdateLocationsAfterPopTransition:](self, "setUpdateLocationsAfterPopTransition:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "sceneIdentifier"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabbedBrowserViewController globalTabbedBrowserControllerForIdentifier:](DOCTabbedBrowserViewController, "globalTabbedBrowserControllerForIdentifier:", v49));
  objc_msgSend(v50, "updateLocationTitleFromCurrentState");

  -[DOCFullDocumentManagerViewController swift_navigationController:didShow:animated:](self, "swift_navigationController:didShow:animated:", v8, v9, v5);
}

- (void)updateCustomActions
{
  DOCFullDocumentManagerViewController *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _TtC5Files16DOCActionManager *v6;

  v2 = self;
  v6 = -[DOCFullDocumentManagerViewController actionManager](v2, "actionManager");
  v3 = -[DOCFullDocumentManagerViewController customActions](v2, "customActions");
  v4 = sub_10004F2F0(0, (unint64_t *)&unk_1006475D0, UIDocumentBrowserAction_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v6->super.isa) + 0xB8))(v5);
}

- (_TtC5Files19DOCSearchController)effectiveSearchController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchController"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController currentViewController](self, "currentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchController"));

  }
  return (_TtC5Files19DOCSearchController *)v7;
}

- (void)doc_commonInitWithSourceObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *shortDebugID;
  _TtC5Files27DOCDisplayModeChangeHandler *v9;
  _TtC5Files27DOCDisplayModeChangeHandler *displayModeHandler;
  _TtC5Files25DOCItemCollectionViewPool *v11;
  void *v12;
  _TtC5Files25DOCItemCollectionViewPool *v13;
  _TtC5Files25DOCItemCollectionViewPool *itemCollectionViewPool;
  _TtC5Files42DOCFullDocumentManagerNavigationController *v15;
  void *v16;
  UINavigationController *v17;
  UINavigationController *internalNavigationController;
  _TtC5Files22DOCHierarchyController *v19;
  void *v20;
  _TtC5Files22DOCHierarchyController *v21;
  id v22;
  NSObject *v23;
  _TtC5Files18DOCDocumentManager *v24;
  void *v25;
  void *v26;
  _TtC5Files18DOCDocumentManager *v27;
  _TtC5Files22DOCLocationChangePacer *v28;
  void *v29;
  _TtC5Files22DOCLocationChangePacer *v30;
  _TtC5Files22DOCLocationChangePacer *locationChangePacer;
  _TtC5Files30DOCBrowserNavigationDataSource *v32;
  void *v33;
  void *v34;
  _TtC5Files30DOCBrowserNavigationDataSource *v35;
  _TtC5Files30DOCBrowserNavigationDataSource *dataSource;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id WeakRetained;
  void *v43;
  void *v44;
  const char *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id location;

  v4 = a3;
  -[DOCFullDocumentManagerViewController preloadLaunchServiceDatabase](self, "preloadLaunchServiceDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", 6));
  shortDebugID = self->_shortDebugID;
  self->_shortDebugID = v7;

  v9 = objc_alloc_init(_TtC5Files27DOCDisplayModeChangeHandler);
  displayModeHandler = self->_displayModeHandler;
  self->_displayModeHandler = v9;

  objc_storeWeak((id *)&self->_sourceObserver, v4);
  v11 = [_TtC5Files25DOCItemCollectionViewPool alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v13 = -[DOCItemCollectionViewPool initWithConfiguration:](v11, "initWithConfiguration:", v12);
  itemCollectionViewPool = self->_itemCollectionViewPool;
  self->_itemCollectionViewPool = v13;

  v15 = [_TtC5Files42DOCFullDocumentManagerNavigationController alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v17 = -[DOCFullDocumentManagerNavigationController initWithConfiguration:](v15, "initWithConfiguration:", v16);
  internalNavigationController = self->_internalNavigationController;
  self->_internalNavigationController = v17;

  v19 = [_TtC5Files22DOCHierarchyController alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v21 = -[DOCHierarchyController initWithConfiguration:sourceObserver:minParentLocations:](v19, "initWithConfiguration:sourceObserver:minParentLocations:", v20, v4, 100);
  -[DOCFullDocumentManagerViewController setHierarchyController:](self, "setHierarchyController:", v21);

  -[DOCHierarchyController addObserver:forKeyPath:options:context:](self->_hierarchyController, "addObserver:forKeyPath:options:context:", self, CFSTR("lastLocation"), 1, off_100640790);
  -[DOCHierarchyController addObserver:forKeyPath:options:context:](self->_hierarchyController, "addObserver:forKeyPath:options:context:", self, CFSTR("effectiveRootLocation"), 1, off_100640790);
  v22 = -[DOCHierarchyController addObserver:forKeyPath:options:context:](self->_hierarchyController, "addObserver:forKeyPath:options:context:", self, CFSTR("locations"), 1, off_100640790);
  v23 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging(v22);
    v23 = docUILogHandle;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    sub_1004BF1CC(self, v23);
  v24 = [_TtC5Files18DOCDocumentManager alloc];
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v27 = -[DOCDocumentManager initWithConfiguration:sourceObserver:hierarchyController:](v24, "initWithConfiguration:sourceObserver:hierarchyController:", v25, v4, v26);
  -[DOCFullDocumentManagerViewController setDocumentManager:](self, "setDocumentManager:", v27);

  v28 = [_TtC5Files22DOCLocationChangePacer alloc];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v30 = -[DOCLocationChangePacer initWithHierarchyController:](v28, "initWithHierarchyController:", v29);
  locationChangePacer = self->_locationChangePacer;
  self->_locationChangePacer = v30;

  v32 = [_TtC5Files30DOCBrowserNavigationDataSource alloc];
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController sourceObserver](self, "sourceObserver"));
  v35 = -[DOCBrowserNavigationDataSource initWithConfiguration:sourceObserver:](v32, "initWithConfiguration:sourceObserver:", v33, v34);
  dataSource = self->_dataSource;
  self->_dataSource = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController dataSource](self, "dataSource"));
  objc_msgSend(v37, "setItemProvider:", self);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController dataSource](self, "dataSource"));
  objc_msgSend(v38, "setUpdateObserver:", self);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController dataSource](self, "dataSource"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  objc_msgSend(v40, "setDelegate:", v39);

  -[UINavigationController setDelegate:](self->_internalNavigationController, "setDelegate:", self);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController documentManager](self, "documentManager"));
  objc_msgSend(v41, "setDocumentBrowser:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceObserver);
  -[DOCFullDocumentManagerViewController swift_commonInitWith:](self, "swift_commonInitWith:", WeakRetained);

  -[DOCFullDocumentManagerViewController setCustomActions:](self, "setCustomActions:", &__NSArray0__struct);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v43, "addObserver:selector:name:object:", self, "fullDocumentManagerViewControllerDidFinishLoading:", CFSTR("DOCFullDocumentManagerViewControllerDidFinishLoadingNotificationName"), 0);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v44, "addObserver:selector:name:object:", self, "itemCollectionViewControllerDidLoad", CFSTR("DOCItemCollectionViewDidLoadContents"), 0);

  self->_userChangedDefaultSaveLocationToken = 0;
  objc_initWeak(&location, self);
  v45 = (const char *)DOCUserPickedNewDefaultSaveLocationNotification;
  v46 = &_dispatch_main_q;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000B7880;
  v47[3] = &unk_1005BE5F0;
  objc_copyWeak(&v48, &location);
  notify_register_dispatch(v45, &self->_userChangedDefaultSaveLocationToken, (dispatch_queue_t)&_dispatch_main_q, v47);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

}

- (_TtC5Files29DOCBrowserContainerController)effectiveBrowserViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  unint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locations"));

  v6 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging(v5);
    v6 = docUILogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1004BF44C(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileProviderItem"));

  if (v8 && (objc_msgSend(v8, "isFolder") & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController dataSource](self, "dataSource"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentContainers"));
    v17 = (unint64_t)objc_msgSend(v16, "count") - 2;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController dataSource](self, "dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentContainers"));
    v11 = v10;
    if ((v17 & 0x8000000000000000) == 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v17));
      goto LABEL_9;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController dataSource](self, "dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentContainers"));
    v11 = v10;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
LABEL_9:
  v13 = (void *)v12;

  return (_TtC5Files29DOCBrowserContainerController *)v13;
}

- (UINavigationController)internalNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 40, 1);
}

- (void)updateRelatedViewControllersWithCurrentHierarchy
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_100060DF4();

}

- (_TtC5Files22DOCHierarchyController)hierarchyController
{
  return (_TtC5Files22DOCHierarchyController *)objc_getProperty(self, a2, 64, 1);
}

- (DOCConcreteLocation)displayedRootLocation
{
  DOCFullDocumentManagerViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100060F98();
  v4 = v3;

  return (DOCConcreteLocation *)v4;
}

- (_TtC5Files30DOCBrowserNavigationDataSource)dataSource
{
  return (_TtC5Files30DOCBrowserNavigationDataSource *)objc_getProperty(self, a2, 96, 1);
}

- (DOCFullDocumentManagerViewControllerDelegate)fullDocumentManagerDelegate
{
  return (DOCFullDocumentManagerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_fullDocumentManagerDelegate);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a3;
  v11 = v10;
  if (off_100640790 == a6)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("locations")) & 1) != 0
      || (objc_msgSend(v11, "isEqualToString:", CFSTR("lastLocation")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("effectiveRootLocation")))
    {
      -[DOCFullDocumentManagerViewController updateRelatedViewControllersWithCurrentHierarchy](self, "updateRelatedViewControllersWithCurrentHierarchy");
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DOCFullDocumentManagerViewController;
    -[DOCFullDocumentManagerViewController observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", v10, a4, a5, a6);
  }

}

- (UITraitCollection)traitCollectionExpectedForSearchPresentation
{
  DOCFullDocumentManagerViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100004460();

  return (UITraitCollection *)v3;
}

- (void)updateNavigationBarPrefersLargeTitles
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_1000333E8();

}

- (void)didFinishGatheringItemsAndThumbnailsWithSender:(id)a3
{
  id v5;
  DOCFullDocumentManagerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100083760(a3);

}

- (void)updateAvailableDisplayModesWithAnimated:(BOOL)a3
{
  DOCFullDocumentManagerViewController *v4;

  v4 = self;
  sub_100018D08(a3);

}

- (void)installDebugMenuGesture
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_100083F2C();

}

- (BOOL)establishFirstResponder
{
  DOCFullDocumentManagerViewController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = DOCFullDocumentManagerViewController.establishFirstResponder()();

  return v3;
}

- (void)viewDidLayoutSubviews
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  DOCFullDocumentManagerViewController.viewDidLayoutSubviews()();

}

- (void)swift_viewDidLoad
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_1000111C4();

}

- (void)swift_commonInitWith:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10004943C(v4, (uint64_t)v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  DOCFullDocumentManagerViewController *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DOCFullDocumentManagerViewController;
  v4 = self;
  -[DOCFullDocumentManagerViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_10013A618();
  -[DOCFullDocumentManagerViewController updateAvailableDisplayModesWithAnimated:](v4, "updateAvailableDisplayModesWithAnimated:", 0, v5.receiver, v5.super_class);
  sub_100084458();
  sub_100084E78();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  DOCFullDocumentManagerViewController *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DOCFullDocumentManagerViewController;
  v4 = self;
  -[DOCFullDocumentManagerViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  -[DOCFullDocumentManagerViewController updateCustomActions](v4, "updateCustomActions", v5.receiver, v5.super_class);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  DOCFullDocumentManagerViewController *v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)DOCFullDocumentManagerViewController;
  v6 = self;
  v7 = a3;
  -[DOCFullDocumentManagerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, "viewDidMoveToWindow:shouldAppearOrDisappear:", v7, v4);
  if (v7)
  {
    -[DOCFullDocumentManagerViewController updateAvailableDisplayModesWithAnimated:](v6, "updateAvailableDisplayModesWithAnimated:", 1, v8.receiver, v8.super_class);

  }
}

- (void)dataSource:(id)a3 willSwitchFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7;
  DOCFullDocumentManagerViewController *v8;

  v7 = a3;
  v8 = self;
  sub_10000B2C8(a5);

}

- (void)splitViewWillChangeFrom:(int64_t)a3 to:(int64_t)a4 alongsideCoordinator:(id)a5
{
  DOCFullDocumentManagerViewController *v7;

  swift_unknownObjectRetain(a5);
  v7 = self;
  sub_100084C3C(a5);
  swift_unknownObjectRelease(a5);

}

- (void)fullDocumentManagerViewControllerDidFinishLoading:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  DOCFullDocumentManagerViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10001EE68();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)clearDroppedLocationsAfterSwitchingViewStyle
{
  DOCFullDocumentManagerViewController *v3;
  Class isa;

  sub_10004F2F0(0, (unint64_t *)&unk_1006442E0, DOCConcreteLocation_ptr);
  v3 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  -[DOCFullDocumentManagerViewController setDroppedLocationsAfterSwitchingDisplayMode:](v3, "setDroppedLocationsAfterSwitchingDisplayMode:", isa);

}

- (void)activateContainerViewControllersIfNeeded
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_100085250();

}

- (void)swift_navigationController:(id)a3 willShow:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  DOCFullDocumentManagerViewController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_100027BB0(v8, v9, a5);

}

- (void)swift_navigationController:(id)a3 didShow:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  DOCFullDocumentManagerViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1000854FC(v8);

}

- (void)itemCollectionViewControllerDidLoad
{
  -[DOCFullDocumentManagerViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (BOOL)updateLocationsAfterPopTransition
{
  return self->_updateLocationsAfterPopTransition;
}

- (DOCSourceObserver)sourceObserver
{
  return (DOCSourceObserver *)objc_loadWeakRetained((id *)&self->_sourceObserver);
}

- (NSString)shortDebugID
{
  return self->_shortDebugID;
}

- (void)set_postSearchInitializationBufferStorage:(id)a3
{
  objc_storeStrong(&self->__postSearchInitializationBufferStorage, a3);
}

- (void)setUpdateLocationsAfterPopTransition:(BOOL)a3
{
  self->_updateLocationsAfterPopTransition = a3;
}

- (void)setSourceObserver:(id)a3
{
  objc_storeWeak((id *)&self->_sourceObserver, a3);
}

- (void)setShortDebugID:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_shortDebugID, a3);
  v5 = a3;
  -[DOCBrowserNavigationDataSource setShortDebugID:](self->_dataSource, "setShortDebugID:", v5);

}

- (void)setRootViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  UIViewController *v13;

  v5 = (UIViewController *)a3;
  if (self->_rootViewController != v5)
  {
    v13 = v5;
    -[UIViewController doc_removeFromParentWithRemoveSubviewBlock:](v5, "doc_removeFromParentWithRemoveSubviewBlock:", 0);
    v6 = self->_rootViewController;
    objc_storeStrong((id *)&self->_rootViewController, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
    v9 = objc_msgSend(v8, "mutableCopy");

    if (v6)
      objc_msgSend(v9, "removeObject:", v6);
    v10 = objc_msgSend(v9, "count");
    if (v13 || v10)
    {
      if (v13)
      {
        if (objc_msgSend(v9, "containsObject:", v13))
        {
          DOCLogAssertionFailure("NO", "/Library/Caches/com.apple.xbs/Sources/DocumentManager_executables/DocumentManager/DOCFullDocumentManagerViewController.m", "-[DOCFullDocumentManagerViewController setRootViewController:]", 309, CFSTR("Trying to add duplicate VCs to the navigation controller. see <rdar://problem/35752822>"));
          objc_msgSend(v9, "removeObject:", v13);
        }
        objc_msgSend(v9, "insertObject:atIndex:", v13, 0);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
      objc_msgSend(v12, "setViewControllers:", v9);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
      objc_msgSend(v11, "setViewControllers:", &__NSArray0__struct);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
      objc_msgSend(v12, "resetWithDefaultLocationWithAnimated:", 0);
    }

    v5 = v13;
  }

}

- (void)setProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertion, a3);
}

- (void)setNeedsFirstResponder:(BOOL)a3
{
  self->_needsFirstResponder = a3;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (void)setHierarchyController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setFullDocumentManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_fullDocumentManagerDelegate, a3);
}

- (void)setEnvironmentSupportsColumnView:(BOOL)a3
{
  if (self->_environmentSupportsColumnView != a3)
  {
    self->_environmentSupportsColumnView = a3;
    -[DOCFullDocumentManagerViewController didChangeEnvironmentSupportsColumnView](self, "didChangeEnvironmentSupportsColumnView");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  if (-[DOCFullDocumentManagerViewController isEditing](self, "isEditing") != a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)DOCFullDocumentManagerViewController;
    -[DOCFullDocumentManagerViewController setEditing:animated:](&v11, "setEditing:animated:", v5, v4);
    -[DOCFullDocumentManagerViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("editing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));

    v9 = (id)v8;
    v10 = objc_opt_class(_TtC5Files24DOCSidebarViewController);
    LOBYTE(v8) = objc_opt_isKindOfClass(v9, v10);

    if ((v8 & 1) == 0)
      objc_msgSend(v9, "setEditing:animated:", v5, v4);
    -[DOCFullDocumentManagerViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("editing"));

  }
}

- (void)setDroppedLocationsAfterSwitchingDisplayMode:(id)a3
{
  objc_storeStrong((id *)&self->_droppedLocationsAfterSwitchingDisplayMode, a3);
}

- (void)setDocumentManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCFullDocumentManagerViewController;
  v4 = a3;
  -[DOCFullDocumentManagerViewController setDelegate:](&v6, "setDelegate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController documentManager](self, "documentManager", v6.receiver, v6.super_class));
  objc_msgSend(v5, "setUiBrowserDelegate:", v4);

}

- (void)setCustomActions:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController setCustomActions:](&v4, "setCustomActions:", a3);
  -[DOCFullDocumentManagerViewController updateCustomActions](self, "updateCustomActions");
}

- (void)setActionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)preloadLaunchServiceDatabase
{
  if (qword_100658FB0 != -1)
    dispatch_once(&qword_100658FB0, &stru_1005BE5A8);
}

- (_TtC5Files21DOCPickerFilenameView)pickerFilenameView
{
  return self->_pickerFilenameView;
}

- (_TtC5Files16DOCPickerContext)pickerContext
{
  return self->_pickerContext;
}

- (BOOL)needsFirstResponder
{
  return self->_needsFirstResponder;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (a4)
    -[DOCFullDocumentManagerViewController swift_navigationController:willShow:animated:](self, "swift_navigationController:willShow:animated:", a3, a4, a5);
}

- (_TtC5Files22DOCLocationChangePacer)locationChangePacer
{
  return (_TtC5Files22DOCLocationChangePacer *)objc_getProperty(self, a2, 112, 1);
}

- (_TtC5Files25DOCItemCollectionViewPool)itemCollectionViewPool
{
  return (_TtC5Files25DOCItemCollectionViewPool *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (DOCFullDocumentManagerViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v6;
  DOCFullDocumentManagerViewController *v7;
  DOCFullDocumentManagerViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DOCFullDocumentManagerViewController;
  v7 = -[DOCFullDocumentManagerViewController initWithConfiguration:](&v10, "initWithConfiguration:", a3);
  v8 = v7;
  if (v7)
    -[DOCFullDocumentManagerViewController doc_commonInitWithSourceObserver:](v7, "doc_commonInitWithSourceObserver:", v6);

  return v8;
}

- (BOOL)environmentSupportsColumnView
{
  return self->_environmentSupportsColumnView;
}

- (void)endForcedNavigationTransitionChrome:(id)a3 appearingViewController:(id)a4
{
  void *v5;

  if (self->_resetNavBarScrollEdgeAfterPop)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "navigationItem", a3));
    objc_msgSend(v5, "setScrollEdgeAppearance:", 0);

    self->_resetNavBarScrollEdgeAfterPop = 0;
  }
}

- (NSArray)droppedLocationsAfterSwitchingDisplayMode
{
  return self->_droppedLocationsAfterSwitchingDisplayMode;
}

- (_TtC5Files18DOCDocumentManager)documentManager
{
  return (_TtC5Files18DOCDocumentManager *)objc_getProperty(self, a2, 72, 1);
}

- (_TtC5Files27DOCDisplayModeChangeHandler)displayModeHandler
{
  return (_TtC5Files27DOCDisplayModeChangeHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)beginForcedNavigationTransitionChromeIfNeeded:(id)a3 appearingViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  v9 = objc_msgSend(v16, "lastOperation");
  v10 = sub_10000EED8(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v5 && v9 == (id)2 && objc_msgSend(v11, "needsForcedUnderNavBarAppearanceOnAppear"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationBar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "standardAppearance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
    objc_msgSend(v15, "setScrollEdgeAppearance:", v14);

    self->_resetNavBarScrollEdgeAfterPop = 1;
  }

}

- (_TtC5Files16DOCActionManager)actionManager
{
  return (_TtC5Files16DOCActionManager *)objc_getProperty(self, a2, 80, 1);
}

- (id)_postSearchInitializationBufferStorage
{
  return self->__postSearchInitializationBufferStorage;
}

- (NSString)description
{
  NSString *shortDebugID;
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  shortDebugID = self->_shortDebugID;
  v7.receiver = self;
  v7.super_class = (Class)DOCFullDocumentManagerViewController;
  v3 = -[DOCFullDocumentManagerViewController description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), shortDebugID, v4));

  return (NSString *)v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int userChangedDefaultSaveLocationToken;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("DOCFullDocumentManagerViewControllerDidFinishLoadingNotificationName"), 0);

  -[DOCHierarchyController removeObserver:forKeyPath:](self->_hierarchyController, "removeObserver:forKeyPath:", self, CFSTR("lastLocation"));
  -[DOCHierarchyController removeObserver:forKeyPath:](self->_hierarchyController, "removeObserver:forKeyPath:", self, CFSTR("effectiveRootLocation"));
  -[DOCHierarchyController removeObserver:forKeyPath:](self->_hierarchyController, "removeObserver:forKeyPath:", self, CFSTR("locations"));
  if (-[DOCFullDocumentManagerViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:", self);

  }
  userChangedDefaultSaveLocationToken = self->_userChangedDefaultSaveLocationToken;
  if (userChangedDefaultSaveLocationToken)
  {
    notify_cancel(userChangedDefaultSaveLocationToken);
    self->_userChangedDefaultSaveLocationToken = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController dealloc](&v6, "dealloc");
}

- (BOOL)_defaultLocationIsRecentsTab
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sourceIdentifier"));
  v5 = (void *)DOCDocumentSourceIdentifierRecentDocuments;

  if (v4 == v5)
    return DOCUsePhoneIdiomForTraits(0);
  else
    return 0;
}

- (BOOL)_canNavigateBack
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (void)_navigateBack
{
  id v3;
  id v4;

  if (-[DOCFullDocumentManagerViewController _canPopViewController](self, "_canPopViewController"))
  {
    if (-[DOCFullDocumentManagerViewController _canNavigateBack](self, "_canNavigateBack"))
    {
      -[DOCFullDocumentManagerViewController setEditing:](self, "setEditing:", 0);
      v4 = (id)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
      v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

    }
  }
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController setAllowsPickingMultipleItems:](&v17, "setAllowsPickingMultipleItems:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(_TtC5Files29DOCBrowserContainerController);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          objc_msgSend(v11, "setAllowsPickingMultipleItems:", v3);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  -[DOCFullDocumentManagerViewController updateCustomActions](self, "updateCustomActions");
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController rootViewController](self, "rootViewController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
  v13 = v6;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController rootViewController](self, "rootViewController"));
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (!v9)
      return;
    v13 = (id)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController rootViewController](self, "rootViewController"));
    v11 = objc_msgSend(v13, "popToViewController:animated:", v10, v3);

  }
  else
  {
    v12 = objc_msgSend(v6, "popToRootViewControllerAnimated:", v3);
  }

}

- (id)currentItemCollectionViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController effectiveBrowserViewController](self, "effectiveBrowserViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentViewController"));

  v4 = objc_opt_class(_TtC5Files31DOCItemCollectionViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_multiTapDebugGestureRecognizer == a3;
}

- (void)showLocation:(id)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging(v9);
    v11 = docUILogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1004BF294((uint64_t)v8, v11);
  self->_viewDidLoadResetLocationDisabled = v8 != 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, "resetWith:animated:completionHandler:", v8, v6, v10);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DOCConcreteLocation emptyLocation](DOCConcreteLocation, "emptyLocation"));
    objc_msgSend(v13, "resetWith:animated:completionHandler:", v14, v6, v10);

  }
}

- (void)showLocation:(id)a3 fromRootAnimated:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging(v9);
    v11 = docUILogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1004BF32C();
  self->_viewDidLoadResetLocationDisabled = v8 != 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, "resetFromRootWith:animated:completionHandler:", v8, v6, v10);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DOCConcreteLocation emptyLocation](DOCConcreteLocation, "emptyLocation"));
    objc_msgSend(v13, "resetFromRootWith:animated:completionHandler:", v14, v6, v10);

  }
}

- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging(v9);
    v11 = docUILogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1004BF3BC();
  self->_viewDidLoadResetLocationDisabled = v8 != 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v13 = v8;
  if (!v8)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DOCConcreteLocation emptyLocation](DOCConcreteLocation, "emptyLocation"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B8214;
  v15[3] = &unk_1005BE618;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v12, "revealLocation:animated:completion:", v13, v6, v15);
  if (!v8)

}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v22.receiver = self;
  v22.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController setAdditionalTrailingNavigationBarButtonItems:](&v22, "setAdditionalTrailingNavigationBarButtonItems:", a3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(_TtC5Files29DOCBrowserContainerController);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0
          || (v12 = v10,
              v13 = objc_opt_class(_TtC5Files24DOCSidebarViewController),
              isKindOfClass = objc_opt_isKindOfClass(v12, v13),
              v12,
              (isKindOfClass & 1) != 0))
        {
          v15 = objc_alloc((Class)NSArray);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController additionalTrailingNavigationBarButtonItems](self, "additionalTrailingNavigationBarButtonItems"));
          v17 = objc_msgSend(v15, "initWithArray:copyItems:", v16, 1);
          objc_msgSend(v10, "setAdditionalTrailingNavigationBarButtonItems:", v17);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v7);
  }

}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v19.receiver = self;
  v19.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController setAdditionalLeadingNavigationBarButtonItems:](&v19, "setAdditionalLeadingNavigationBarButtonItems:", a3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(_TtC5Files29DOCBrowserContainerController);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = objc_alloc((Class)NSArray);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController additionalLeadingNavigationBarButtonItems](self, "additionalLeadingNavigationBarButtonItems"));
          v14 = objc_msgSend(v12, "initWithArray:copyItems:", v13, 1);
          objc_msgSend(v10, "setAdditionalLeadingNavigationBarButtonItems:", v14);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

}

- (BOOL)_canPopViewController
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v3 = objc_msgSend(v2, "isFetchingLocations") ^ 1;

  return v3;
}

- (BOOL)canGoToEnclosingFolder
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCHierarchyController lastLocation](self->_hierarchyController, "lastLocation"));
  if ((objc_msgSend(v3, "isRoot") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCHierarchyController lastLocation](self->_hierarchyController, "lastLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileProviderItem"));
    v4 = v6 != 0;

  }
  return v4;
}

- (BOOL)prefersTabBarHidden
{
  if (-[DOCFullDocumentManagerViewController enclosingTabSwitcherStyle](self, "enclosingTabSwitcherStyle") == (id)2)
    return 0;
  if (-[UINavigationController isToolbarHidden](self->_internalNavigationController, "isToolbarHidden"))
    return -[DOCFullDocumentManagerViewController isInUserTriggeredSelectionMode](self, "isInUserTriggeredSelectionMode");
  return 1;
}

- (void)dismissSearch
{
  -[DOCFullDocumentManagerViewController dismissSearchAlongsideCoordinator:](self, "dismissSearchAlongsideCoordinator:", 0);
}

- (void)dismissSearchAlongsideCoordinator:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController effectiveSearchController](self, "effectiveSearchController"));
  if (objc_msgSend(v4, "isActive"))
    objc_msgSend(v4, "deactivateAlongsideContainingTransitionCoordinator:", v5);

}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController", a3));
  if ((objc_msgSend(v4, "isFetchingLocations") & 1) != 0)
    LOBYTE(v5) = 0;
  else
    v5 = -[DOCFullDocumentManagerViewController isEditing](self, "isEditing") ^ 1;

  return v5;
}

- (id)_navigationControllerDimmingColorForParallaxTransition:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController traitCollection](self, "traitCollection", a3));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.03));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)columnViewController:(id)a3 didShowItemControllers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  objc_msgSend(v7, "invalidateAllAssertions");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "locations"));

  v10 = objc_msgSend(v9, "count");
  if (a3)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "effectiveRootLocation"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "effectiveLocations"));
      v11 = objc_msgSend(v16, "count");

    }
    if (v11 > objc_msgSend(v12, "count")
      && -[DOCFullDocumentManagerViewController updateLocationsAfterPopTransition](self, "updateLocationsAfterPopTransition"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController hierarchyController](self, "hierarchyController"));
      objc_msgSend(v17, "removeTrailingLocationCount:animated:", 1, 0);

    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v22), "setPreventAppearanceForwarding:", 0, (_QWORD)v26);
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }

  -[DOCFullDocumentManagerViewController setUpdateLocationsAfterPopTransition:](self, "setUpdateLocationsAfterPopTransition:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sceneIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[DOCTabbedBrowserViewController globalTabbedBrowserControllerForIdentifier:](DOCTabbedBrowserViewController, "globalTabbedBrowserControllerForIdentifier:", v24));
  objc_msgSend(v25, "updateLocationTitleFromCurrentState");

}

- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 updateLastUsedDate:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id *v21;
  _QWORD *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  void *v26;
  _QWORD v27[4];
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  DOCFullDocumentManagerViewController *v31;
  id v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[DOCFullDocumentManagerViewController dismissSearch](self, "dismissSearch");
  -[DOCFullDocumentManagerViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000B8C0C;
  v34[3] = &unk_1005BE668;
  v12 = v11;
  v35 = v12;
  v13 = objc_retainBlock(v34);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController configuration](self, "configuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sceneIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[DOCInteractionManager sharedManagerFor:](_TtC5Files21DOCInteractionManager, "sharedManagerFor:", v15));
  objc_msgSend(v16, "setLastSelectedItem:", 0);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B8CD4;
  v29[3] = &unk_1005BE6B8;
  v17 = v13;
  v32 = v17;
  v18 = v10;
  v33 = a4;
  v30 = v18;
  v31 = self;
  v19 = objc_retainBlock(v29);
  v20 = v19;
  if (v7)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000B8E78;
    v27[3] = &unk_1005BE6E0;
    v21 = (id *)&v28;
    v28 = v19;
    v22 = v19;
    objc_msgSend(v18, "bumpLastOpenDateWithCompletionHandler:", v27);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000B8E84;
    v25[3] = &unk_1005BE708;
    v21 = &v26;
    v26 = v20;
    v24 = v20;
    objc_msgSend(v23, "fetchItemForURL:completionHandler:", v18, v25);

  }
}

- (void)resetNavigationStepwise
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (-[DOCFullDocumentManagerViewController _canPopViewController](self, "_canPopViewController")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController internalNavigationController](self, "internalNavigationController")), v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers")), v5 = objc_msgSend(v4, "count"), v4, v3, (unint64_t)v5 >= 2))
  {
    -[DOCFullDocumentManagerViewController _navigateBack](self, "_navigateBack");
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController primaryContentScrollView](self, "primaryContentScrollView"));
    objc_msgSend(v6, "_scrollToTopIfPossible:", 1);

  }
}

- (void)setPickerContext:(id)a3
{
  _TtC5Files16DOCPickerContext *v5;
  _TtC5Files16DOCPickerContext **p_pickerContext;
  _TtC5Files16DOCPickerContext *v7;

  v5 = (_TtC5Files16DOCPickerContext *)a3;
  p_pickerContext = &self->_pickerContext;
  if (self->_pickerContext != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_pickerContext, a3);
    -[DOCPickerFilenameView setPickerContext:](self->_pickerFilenameView, "setPickerContext:", *p_pickerContext);
    -[DOCHierarchyController setPickerContext:](self->_hierarchyController, "setPickerContext:", *p_pickerContext);
    v5 = v7;
  }

}

- (_TtC5Files22DOCSourceOrderObserver)sourceOrderObserver
{
  return self->_sourceOrderObserver;
}

- (void)setSourceOrderObserver:(id)a3
{
  objc_storeStrong((id *)&self->_sourceOrderObserver, a3);
}

- (_TtC5Files21DOCFileProviderSource)currentGoToFileProviderSource
{
  return self->_currentGoToFileProviderSource;
}

- (void)setCurrentGoToFileProviderSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentGoToFileProviderSource, a3);
}

- (NSArray)goToFileProviderSources
{
  return self->_goToFileProviderSources;
}

- (void)setGoToFileProviderSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)goToFileProviderCandidateSource
{
  return self->_goToFileProviderCandidateSource;
}

- (void)setGoToFileProviderCandidateSource:(id)a3
{
  objc_storeStrong(&self->_goToFileProviderCandidateSource, a3);
}

- (id)goToHiddenFileProviderCandidateSource
{
  return self->_goToHiddenFileProviderCandidateSource;
}

- (void)setGoToHiddenFileProviderCandidateSource:(id)a3
{
  objc_storeStrong(&self->_goToHiddenFileProviderCandidateSource, a3);
}

- (void)setPickerFilenameView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerFilenameView, a3);
}

- (UIViewController)pickerPresentingController
{
  return self->_pickerPresentingController;
}

- (void)setPickerPresentingController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerPresentingController, a3);
}

- (void)setCanGoToEnclosingFolder:(BOOL)a3
{
  self->_canGoToEnclosingFolder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__postSearchInitializationBufferStorage, 0);
  objc_storeStrong((id *)&self->_droppedLocationsAfterSwitchingDisplayMode, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_pickerPresentingController, 0);
  objc_storeStrong((id *)&self->_pickerFilenameView, 0);
  objc_storeStrong((id *)&self->_pickerContext, 0);
  objc_storeStrong(&self->_goToHiddenFileProviderCandidateSource, 0);
  objc_storeStrong(&self->_goToFileProviderCandidateSource, 0);
  objc_storeStrong((id *)&self->_goToFileProviderSources, 0);
  objc_storeStrong((id *)&self->_currentGoToFileProviderSource, 0);
  objc_storeStrong((id *)&self->_sourceOrderObserver, 0);
  objc_destroyWeak((id *)&self->_sourceObserver);
  objc_storeStrong((id *)&self->_locationChangePacer, 0);
  objc_storeStrong((id *)&self->_itemCollectionViewPool, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_displayModeHandler, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_documentManager, 0);
  objc_storeStrong((id *)&self->_hierarchyController, 0);
  objc_destroyWeak((id *)&self->_fullDocumentManagerDelegate);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_internalNavigationController, 0);
  objc_storeStrong((id *)&self->_shortDebugID, 0);
  objc_storeStrong((id *)&self->_multiTapDebugGestureRecognizer, 0);
}

- (BOOL)isInUserTriggeredSelectionMode
{
  DOCFullDocumentManagerViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1001310F8();

  return v3 & 1;
}

- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  DOCFullDocumentManagerViewController *v12;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100131318(v10, a4, v7, v6);

}

- (void)didSelectLocation:(id)a3 atParentLocation:(id)a4
{
  char *v6;
  id v7;
  DOCFullDocumentManagerViewController *v8;

  v6 = (char *)a3;
  v7 = a4;
  v8 = self;
  sub_100132804(v6, a4);

}

- (void)didCommitPreviewOf:(id)a3
{
  void *v5;
  id v6;
  DOCFullDocumentManagerViewController *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  DOCFullDocumentManagerViewController *v13;
  _QWORD v14[5];
  uint64_t v15;

  v5 = (void *)objc_opt_self(FPItemManager);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "defaultManager");
  v9 = swift_allocObject(&unk_1005CA230, 32, 7);
  *(_QWORD *)(v9 + 16) = v6;
  *(_QWORD *)(v9 + 24) = v7;
  v14[4] = sub_10014607C;
  v15 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_100175118;
  v14[3] = &unk_1005CA248;
  v10 = _Block_copy(v14);
  v11 = v15;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "fetchURLForItem:completionHandler:", v12, v10, swift_release(v11).n128_f64[0]);
  _Block_release(v10);

}

- (void)didTapLocationOf:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100134258(v4);

}

- (void)didIndicateCancelPicker
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_100134754();

}

- (void)didToggleEditStateWithEditing:(BOOL)a3 in:(id)a4
{
  id v5;
  DOCFullDocumentManagerViewController *v6;

  v5 = a4;
  v6 = self;
  sub_100144F64();

}

- (BOOL)canLoadAdditionalParents
{
  DOCFullDocumentManagerViewController *v2;
  _TtC5Files22DOCHierarchyController *v3;
  char v4;

  v2 = self;
  v3 = -[DOCFullDocumentManagerViewController hierarchyController](v2, "hierarchyController");
  v4 = sub_1001D38B4();

  return v4 & 1;
}

- (void)beginLoadingAdditionalParents:(id)a3
{
  void *v4;
  uint64_t v5;
  DOCFullDocumentManagerViewController *v6;
  _TtC5Files22DOCHierarchyController *v7;
  uint64_t v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1005CA050, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = -[DOCFullDocumentManagerViewController hierarchyController](v6, "hierarchyController");
  v8 = swift_allocObject(&unk_1005CA078, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_100145FB4;
  *(_QWORD *)(v8 + 24) = v5;
  swift_retain();
  sub_1001D3A64((uint64_t)sub_100066584, v8);

  swift_release(v5);
  swift_release(v8);
}

- (BOOL)isBrowserCurrentLocation:(id)a3
{
  DOCFullDocumentManagerViewController *v5;
  char v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_100134BEC((uint64_t)a3);
  swift_unknownObjectRelease(a3);

  return v6 & 1;
}

- (BOOL)infoPanelPreviewingMultipleItems
{
  DOCFullDocumentManagerViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_100134DA4();

  return v3 & 1;
}

- (void)beginRenameOf:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100134F44(v4);

}

- (void)createNewFolderIn:(id)a3 moving:(id)a4
{
  id v4;
  uint64_t v7;
  id v8;
  DOCFullDocumentManagerViewController *v9;

  v4 = a4;
  if (a4)
  {
    v7 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
    v4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }
  v8 = a3;
  v9 = self;
  sub_100135DEC(v8, (uint64_t)v4);

  swift_bridgeObjectRelease(v4);
}

- (void)importScannedDocumentAt:(id)a3 presentingController:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  DOCFullDocumentManagerViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a4;
  v12 = self;
  sub_100136610((uint64_t)v10, v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4;
  UIViewController *v5;
  UIViewController *v6;
  uint64_t v7;
  void *v8;
  DOCFullDocumentManagerViewController *v9;

  v4 = a3;
  v9 = self;
  v5 = -[DOCFullDocumentManagerViewController pickerPresentingController](v9, "pickerPresentingController");
  if (v5)
  {
    v6 = v5;
    v7 = objc_opt_self(VNDocumentCameraViewController);
    v8 = (void *)swift_dynamicCastObjCClass(v6, v7);
    if (v8)
      objc_msgSend(v8, "removeSaveActionBlockerForFiles");

  }
  -[DOCFullDocumentManagerViewController setPickerPresentingController:](v9, "setPickerPresentingController:", 0);

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5;
  UIViewController *v6;
  UIViewController *v7;
  DOCFullDocumentManagerViewController *v8;

  v5 = a3;
  v8 = self;
  v6 = -[DOCFullDocumentManagerViewController pickerPresentingController](v8, "pickerPresentingController");
  if (v6)
  {
    v7 = v6;
    -[UIViewController dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[DOCFullDocumentManagerViewController setPickerPresentingController:](v8, "setPickerPresentingController:", 0);

}

- (BOOL)establishFirstResponderIfNeeded
{
  DOCFullDocumentManagerViewController *v2;
  BOOL v3;

  v2 = self;
  if (-[DOCFullDocumentManagerViewController needsFirstResponder](v2, "needsFirstResponder")
    && -[DOCFullDocumentManagerViewController establishFirstResponder](v2, "establishFirstResponder"))
  {
    -[DOCFullDocumentManagerViewController setNeedsFirstResponder:](v2, "setNeedsFirstResponder:", 0);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)effectiveTabSwitcherTab
{
  DOCFullDocumentManagerViewController *v2;
  _TtC5Files22DOCHierarchyController *v3;
  _TtC5Files22DOCHierarchyController *v4;
  _TtC5Files22DOCHierarchyController *v5;
  unint64_t v6;

  v2 = self;
  v3 = -[DOCFullDocumentManagerViewController hierarchyController](v2, "hierarchyController");
  sub_1001D3F78();
  if (v4)
  {
    v5 = v4;
    v6 = -[DOCHierarchyController effectiveTabSwitcherTab](v4, "effectiveTabSwitcherTab");

    v2 = (DOCFullDocumentManagerViewController *)v3;
    v3 = v5;
  }
  else
  {
    v6 = *(unint64_t *)((char *)&v3->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_defaultTab);
  }

  return v6;
}

- (NSArray)preferredFocusEnvironments
{
  DOCFullDocumentManagerViewController *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = self;
  DOCFullDocumentManagerViewController.preferredFocusEnvironments.getter();
  v4 = v3;

  sub_10006922C((uint64_t *)&unk_100648EE0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  DOCFullDocumentManagerViewController *v7;
  uint64_t v8;
  DOCFullDocumentManagerViewController *v9;
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
  v10 = DOCFullDocumentManagerViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v12);

  sub_10000CB4C((uint64_t)v12, &qword_100642730);
  return v10 & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  DOCFullDocumentManagerViewController *v7;
  uint64_t v8;
  DOCFullDocumentManagerViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  uint64_t v19[3];
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
  DOCFullDocumentManagerViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v18, v19);

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

- (void)ensureInternalNavigationControllerIsInstalled
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_10013D2F8();

}

- (void)viewWillDisappear:(BOOL)a3
{
  DOCFullDocumentManagerViewController *v4;

  v4 = self;
  DOCFullDocumentManagerViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
}

- (void)didChangeEnvironmentSupportsColumnView
{
  id v2;
  id v3;
  DOCFullDocumentManagerViewController *v4;

  v4 = self;
  v2 = -[DOCFullDocumentManagerViewController viewIfLoaded](v4, "viewIfLoaded");
  v3 = objc_msgSend(v2, "window");

  if (v3)
    -[DOCFullDocumentManagerViewController updateAvailableDisplayModesWithAnimated:](v4, "updateAvailableDisplayModesWithAnimated:", 1);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  DOCFullDocumentManagerViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  DOCFullDocumentManagerViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)splitViewWillDidExpand
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_10013DE48();

}

- (UIScrollView)primaryContentScrollView
{
  DOCFullDocumentManagerViewController *v2;
  UINavigationController *v3;
  DOCFullDocumentManagerViewController *v4;
  id v5;

  v2 = self;
  v3 = -[DOCFullDocumentManagerViewController internalNavigationController](v2, "internalNavigationController");
  v4 = -[UINavigationController topViewController](v3, "topViewController");

  if (v4)
  {
    v5 = -[DOCFullDocumentManagerViewController contentScrollViewForEdge:](v4, "contentScrollViewForEdge:", 1);

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return (UIScrollView *)v5;
}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013E550((uint64_t)v4);

}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013E02C((uint64_t)v4, objc_msgSend(v4, "showsSearchResultsController"));

}

- (void)willDismissSearchController:(id)a3
{
  char *v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_10013E804(v4);

}

- (void)didDismissSearchController:(id)a3
{
  _BYTE *v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013E9EC(v4);

}

- (void)willPresentSearchResultsController:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013EF78((uint64_t)v4);

}

- (void)didPresentSearchResultsController:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013E02C((uint64_t)v4, 1u);

}

- (void)willDismissSearchResultsController:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013F190((uint64_t)v4);

}

- (void)didDismissSearchResultsController:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013E02C((uint64_t)v4, 0);

}

- (void)invokeDebugGathering
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_1001FDBF8();

}

- (void)presentDebugMenuForLongPress:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)1)
    sub_1001FDE74();

}

- (void)presentDebugMenuForMultipleTaps:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)3)
    sub_1001FDE74();

}

- (void)performShowDebugMenu:(id)a3
{
  DOCFullDocumentManagerViewController *v5;
  uint64_t v6;
  DOCFullDocumentManagerViewController *v7;
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
  sub_1001FDE74();

  sub_10007EB54((uint64_t)v8);
}

- (_TtP5Files27DOCScannedDocumentReceiving_)doc_documentScannerReceivingTarget
{
  DOCFullDocumentManagerViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1002BD410();

  return (_TtP5Files27DOCScannedDocumentReceiving_ *)v3;
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  DOCFullDocumentManagerViewController.documentCameraViewControllerDidCancel(_:)((VNDocumentCameraViewController)v4);

}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  DOCFullDocumentManagerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  DOCFullDocumentManagerViewController.documentCameraViewController(_:didFinishWith:)((VNDocumentCameraViewController)v6, (VNDocumentCameraScan)v7);

}

- (void)didTapOnUnselectableItem:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002EC544(v4);

}

- (void)didConfirmPickIn:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002EC6E4((uint64_t)v4);

}

- (int64_t)pickerOperationFor:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1002EF3F4(v4);

  return v6;
}

- (NSArray)keyCommands
{
  DOCFullDocumentManagerViewController *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = DOCFullDocumentManagerViewController.keyCommands.getter();

  if (v3)
  {
    sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)performFind:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A1B80();

}

- (BOOL)canPerformGoToEnclosingFolder
{
  DOCFullDocumentManagerViewController *v2;
  _TtC5Files30DOCBrowserNavigationDataSource *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = -[DOCFullDocumentManagerViewController dataSource](v2, "dataSource");
  v4 = *(uint64_t *)((char *)&v3->super.isa + OBJC_IVAR____TtC5Files30DOCBrowserNavigationDataSource_viewStyle);

  if (v4 == 2)
    v5 = 0;
  else
    v5 = -[DOCFullDocumentManagerViewController _canNavigateBack](v2, "_canNavigateBack");

  return v5;
}

- (void)performGoToEnclosingFolder:(id)a3
{
  -[DOCFullDocumentManagerViewController _navigateBack](self, "_navigateBack", a3);
}

- (void)performGoBackInHistory:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A1C74();

}

- (void)performGoForwardInHistory:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A1E10();

}

- (void)performViewAsIcons:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A05C4(0);

}

- (void)performViewAsList:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A05C4((uint64_t *)1);

}

- (void)performViewAsColumns:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A05C4((uint64_t *)2);

}

- (void)performViewAsUserSizeSmaller:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  char v9;
  char v10;
  DOCFullDocumentManagerViewController *v11;

  v5 = (void *)objc_opt_self(DOCFeature);
  v6 = a3;
  v11 = self;
  v7 = objc_msgSend(v5, "viewOptionsSizeSetting");
  LODWORD(v5) = objc_msgSend(v7, "isEnabled");

  if ((_DWORD)v5)
  {
    v8 = -[DOCFullDocumentManagerViewController configuration](v11, "configuration");
    v9 = sub_1001FD214((uint64_t)v8);

    v10 = sub_1003B8900(1, v9 & 1);
    if (v10 != 2)
      sub_100139258(v10 & 1);
  }

}

- (void)performViewAsUserSizeLarger:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  char v9;
  char v10;
  DOCFullDocumentManagerViewController *v11;

  v5 = (void *)objc_opt_self(DOCFeature);
  v6 = a3;
  v11 = self;
  v7 = objc_msgSend(v5, "viewOptionsSizeSetting");
  LODWORD(v5) = objc_msgSend(v7, "isEnabled");

  if ((_DWORD)v5)
  {
    v8 = -[DOCFullDocumentManagerViewController configuration](v11, "configuration");
    v9 = sub_1001FD214((uint64_t)v8);

    v10 = sub_1003B8900(0, v9 & 1);
    if (v10 != 2)
      sub_100139258(v10 & 1);
  }

}

- (void)performUseGrouping:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A1FAC();

}

- (void)performSortByName:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A09D0();

}

- (void)performSortByDate:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A2094();

}

- (void)performSortBySize:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A09D0();

}

- (void)performSortByKind:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A09D0();

}

- (void)performSortByTags:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A09D0();

}

- (void)performSortBySharedBy:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A09D0();

}

- (void)performGroupByKind:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A0D1C();

}

- (void)performGroupByDate:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A0D1C();

}

- (void)performGroupBySize:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A0D1C();

}

- (void)performGroupBySharedBy:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A0D1C();

}

- (void)performCreateFolder:(id)a3
{
  sub_1003A1018(self, (uint64_t)a2, a3, (uint64_t *)&selRef_performCreateFolder_, (SEL *)&selRef_performCreateFolder_);
}

- (void)performCreateFolderWithSelection:(id)a3
{
  sub_1003A1018(self, (uint64_t)a2, a3, (uint64_t *)&selRef_performCreateFolderWithSelection_, (SEL *)&selRef_performCreateFolderWithSelection_);
}

- (void)performCreateDocumentOrOpenNewWindow:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A23B8();

}

- (void)performCreateDocument
{
  DOCFullDocumentManagerViewController *v2;
  _TtC5Files18DOCDocumentManager *v3;

  v2 = self;
  v3 = -[DOCFullDocumentManagerViewController documentManager](v2, "documentManager");
  sub_10041A310(0);

}

- (void)performEjectMedium:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A281C();

}

- (void)performGoToLocation:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A28FC();

}

- (void)performConnectToServer:(id)a3
{
  void *v5;
  id v6;
  DOCFullDocumentManagerViewController *v7;
  id v8;
  id v9;
  id v10;

  v5 = (void *)objc_opt_self(DOCTabbedBrowserViewController);
  v6 = a3;
  v7 = self;
  v8 = -[DOCFullDocumentManagerViewController configuration](v7, "configuration");
  v9 = objc_msgSend(v8, "sceneIdentifier");

  v10 = objc_msgSend(v5, "globalTabbedBrowserControllerForIdentifier:", v9);
  objc_msgSend(v10, "performConnectToServer:", v6);

}

- (void)performCommandReturnKey:(id)a3
{
  sub_1003A1018(self, (uint64_t)a2, a3, (uint64_t *)&selRef_performRename_, (SEL *)&selRef_performCommandReturnKey_);
}

- (void)performConfirmPickerExportOrDrillIn:(id)a3
{
  sub_1003A1018(self, (uint64_t)a2, a3, (uint64_t *)&selRef_performConfirmPickerExportOrDrillIn_, (SEL *)&selRef_performConfirmPickerExportOrDrillIn_);
}

- (void)performRename:(id)a3
{
  sub_1003A1018(self, (uint64_t)a2, a3, (uint64_t *)&selRef_performRename_, (SEL *)&selRef_performRename_);
}

- (void)performDismiss:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A1324(v4);

}

- (void)performMoveHere:(id)a3
{
  sub_1003A1018(self, (uint64_t)a2, a3, (uint64_t *)&selRef_performMoveHere_, (SEL *)&selRef_performMoveHere_);
}

- (void)validateCommand:(id)a3
{
  id v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = a3;
  v5 = self;
  DOCFullDocumentManagerViewController.validate(_:)((UICommand)v4);

}

- (void)doc_updateBarButtonTrackingViewsIfNecessary
{
  DOCFullDocumentManagerViewController *v2;

  v2 = self;
  sub_1003AD948();

}

- (void)dataSource:(id)a3 willSet:(id)a4 on:(id)a5 animated:(BOOL)a6
{
  sub_1003C1008(self, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, (SEL *)&selRef_columnViewController_willShowItemControllers_);
}

- (void)dataSource:(id)a3 didSet:(id)a4 on:(id)a5 animated:(BOOL)a6
{
  sub_1003C1008(self, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, (SEL *)&selRef_columnViewController_didShowItemControllers_);
}

- (id)provideColumnViewControllerWithContains:(id)a3
{
  uint64_t v5;
  char **v6;
  DOCFullDocumentManagerViewController *v7;
  _BYTE *v8;

  v5 = type metadata accessor for DOCBrowserContainerController();
  v6 = (char **)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  v8 = sub_1003C1134(v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)configureColumnViewController:(id)a3
{
  char *v4;
  DOCFullDocumentManagerViewController *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_1003C3A10(v4);

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  DOCFullDocumentManagerViewController *v13;
  id v14;

  v9 = objc_allocWithZone((Class)type metadata accessor for DOCModalBlurViewControllerTransition());
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = sub_1003C4F48(0);

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5;
  id v6;
  DOCFullDocumentManagerViewController *v7;
  id v8;

  v5 = objc_allocWithZone((Class)type metadata accessor for DOCModalBlurViewControllerTransition());
  v6 = a3;
  v7 = self;
  v8 = sub_1003C4F48(1);

  return v8;
}

@end
