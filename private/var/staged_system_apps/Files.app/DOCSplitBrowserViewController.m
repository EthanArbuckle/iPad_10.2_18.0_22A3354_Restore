@implementation DOCSplitBrowserViewController

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[DOCSplitBrowserViewController _arrangeSidebarForCollapsedPresentationForced:](self, "_arrangeSidebarForCollapsedPresentationForced:", 1, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "withIsCollapsed:", 1));
  -[DOCSplitBrowserViewController updateContentEditingOverlaysForState:](self, "updateContentEditingOverlaysForState:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController viewControllerForColumn:](self, "viewControllerForColumn:", 0));
  v8 = objc_opt_self(UINavigationController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  LOBYTE(v6) = objc_opt_isKindOfClass(v7, v9);

  if ((v6 & 1) != 0)
    objc_msgSend(v7, "setNavigationBarHidden:", 1);

  return 3;
}

- (void)viewDidLoad
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _TtC5Files24DOCContentDimmingOverlay *v12;
  _TtC5Files24DOCContentDimmingOverlay *sourcesOverlay;
  void *v14;
  void *v15;
  _TtC5Files24DOCContentDimmingOverlay *v16;
  _TtC5Files24DOCContentDimmingOverlay *browserOverlay;
  void *v18;
  objc_super v19;
  void *v20;

  v19.receiver = self;
  v19.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "isPickerUI");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController view](self, "view"));
  v6 = v5;
  if (v4)
    v7 = CFSTR("Browse View (Picker)");
  else
    v7 = CFSTR("Browse View");
  objc_msgSend(v5, "setAccessibilityIdentifier:", v7);

  -[DOCSidebarViewController setSidebarDelegate:](self->_sidebarViewController, "setSidebarDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  v20 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  -[DOCSidebarPaneNavigationController setViewControllers:](self->_sidebarNavigationController, "setViewControllers:", v9);

  -[DOCFullDocumentManagerViewController ensureInternalNavigationControllerIsInstalled](self->_fullDocumentManagerViewController, "ensureInternalNavigationControllerIsInstalled");
  -[DOCSplitBrowserViewController setViewController:forColumn:](self, "setViewController:forColumn:", self->_sidebarNavigationController, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  -[DOCSplitBrowserViewController setViewController:forColumn:](self, "setViewController:forColumn:", v10, 2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  -[DOCSplitBrowserViewController setViewController:forColumn:](self, "setViewController:forColumn:", v11, 3);

  -[DOCFullDocumentManagerViewController addObserver:forKeyPath:options:context:](self->_fullDocumentManagerViewController, "addObserver:forKeyPath:options:context:", self, CFSTR("editing"), 1, off_1006408B8);
  -[DOCSidebarViewController addObserver:forKeyPath:options:context:](self->_sidebarViewController, "addObserver:forKeyPath:options:context:", self, CFSTR("editing"), 1, off_1006408B8);
  v12 = -[DOCContentDimmingOverlay initForCovering:]([_TtC5Files24DOCContentDimmingOverlay alloc], "initForCovering:", self->_sidebarNavigationController);
  sourcesOverlay = self->_sourcesOverlay;
  self->_sourcesOverlay = v12;

  -[DOCContentDimmingOverlay setAutohideWhenPossibleDropTarget:](self->_sourcesOverlay, "setAutohideWhenPossibleDropTarget:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSidebarViewController navigationController](self->_sidebarViewController, "navigationController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v15, "addSubview:", self->_sourcesOverlay);

  v16 = -[DOCContentDimmingOverlay initForCovering:]([_TtC5Files24DOCContentDimmingOverlay alloc], "initForCovering:", self->_fullDocumentManagerViewController);
  browserOverlay = self->_browserOverlay;
  self->_browserOverlay = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController view](self->_fullDocumentManagerViewController, "view"));
  objc_msgSend(v18, "addSubview:", self->_browserOverlay);

  -[DOCFullDocumentManagerViewController updateRelatedViewControllersWithCurrentHierarchy](self->_fullDocumentManagerViewController, "updateRelatedViewControllersWithCurrentHierarchy");
}

- (void)updateContentEditingOverlaysForState:(id)a3
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[DOCSplitBrowserViewController isCollapsed](self, "isCollapsed"))
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController effectiveBrowserViewController](self->_fullDocumentManagerViewController, "effectiveBrowserViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentViewController"));

    if ((objc_msgSend(v12, "isSidebarShownInOverlay") & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(v7, "isInUserTriggeredSelectionMode");
    v4 = -[DOCSidebarViewController isEditing](self->_sidebarViewController, "isEditing");

  }
  -[DOCContentDimmingOverlay setActive:](self->_sourcesOverlay, "setActive:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentDimmingOverlay superview](self->_sourcesOverlay, "superview"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentDimmingOverlay superview](self->_sourcesOverlay, "superview"));
    objc_msgSend(v9, "bringSubviewToFront:", self->_sourcesOverlay);

  }
  -[DOCContentDimmingOverlay setActive:](self->_browserOverlay, "setActive:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentDimmingOverlay superview](self->_browserOverlay, "superview"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentDimmingOverlay superview](self->_browserOverlay, "superview"));
    objc_msgSend(v11, "bringSubviewToFront:", self->_browserOverlay);

  }
  -[DOCSplitBrowserViewController updateDisplayModeButtonVisibility](self, "updateDisplayModeButtonVisibility");

}

- (DOCSplitBrowserViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v7;
  id v8;
  DOCSplitBrowserViewController *v9;
  DOCSplitBrowserViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *shortDebugID;
  DOCSourceObserver **p_sourceObserver;
  DOCConfiguration *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  DOCFullDocumentManagerViewController *v27;
  DOCFullDocumentManagerViewController *fullDocumentManagerViewController;
  id v29;
  _TtC5Files24DOCSidebarViewController *v30;
  _TtC5Files24DOCSidebarViewController *sidebarViewController;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _TtC5Files34DOCSidebarPaneNavigationController *v40;
  _TtC5Files34DOCSidebarPaneNavigationController *sidebarNavigationController;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _TtC5Files16DOCPickerContext *v55;
  _TtC5Files16DOCPickerContext *v56;
  NSObject *v57;
  id v58;
  void *v59;
  id v60;
  _TtC5Files16DOCPickerContext *v61;
  _TtC5Files16DOCPickerContext *v62;
  _TtC5Files16DOCPickerContext *v63;
  NSObject *v64;
  DOCSplitBrowserViewController *v65;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id *p_configuration;
  id obj;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  objc_super v80;
  objc_super v81;
  _BYTE v82[128];
  _QWORD v83[5];
  _QWORD v84[6];

  v7 = a3;
  v8 = a4;
  v81.receiver = self;
  v81.super_class = (Class)DOCSplitBrowserViewController;
  v9 = -[DOCSplitBrowserViewController initWithStyle:](&v81, "initWithStyle:", 1);
  v10 = v9;
  if (v9)
  {
    v70 = v8;
    -[DOCSplitBrowserViewController setDelegate:](v9, "setDelegate:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", 6));
    shortDebugID = v10->_shortDebugID;
    v10->_shortDebugID = (NSString *)v13;

    p_sourceObserver = &v10->_sourceObserver;
    objc_storeStrong((id *)&v10->_sourceObserver, a4);
    p_configuration = (id *)&v10->_configuration;
    objc_storeStrong((id *)&v10->_configuration, a3);
    if (objc_msgSend(v7, "isInUIPDocumentLanding"))
    {
      -[DOCSplitBrowserViewController _setIgnoresSheetContext:](v10, "_setIgnoresSheetContext:", 1);
      v80.receiver = v10;
      v80.super_class = (Class)DOCSplitBrowserViewController;
      v16 = -[DOCSplitBrowserViewController configuration](&v80, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = objc_msgSend(v17, "copy");

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _splitViewBorderColor](UIColor, "_splitViewBorderColor"));
      objc_msgSend(v18, "setBorderColor:", v19);

      v79.receiver = v10;
      v79.super_class = (Class)DOCSplitBrowserViewController;
      -[DOCSplitBrowserViewController setConfiguration:](&v79, "setConfiguration:", v18);

    }
    v10->_includeSidebarInCollapsedNavStack = 1;
    v71 = v7;
    v20 = objc_msgSend(v7, "copy");
    objc_msgSend(v20, "setNeverCreateBookmarkForOpenInPlace:", 1);
    objc_msgSend(v20, "setRestoreLastVisitedLocation:", 1);
    objc_msgSend(v20, "setSaveLastVisitedLocation:", 1);
    objc_msgSend(v20, "setSupportsColumnView:", 1);
    v84[0] = DOCDocumentSourceIdentifierRecentDocuments;
    v84[1] = DOCDocumentSourceIdentifierActivities;
    v84[2] = DOCDocumentSourceIdentifierTaggedItems;
    v84[3] = DOCDocumentSourceIdentifierFavoriteFolders;
    v84[4] = DOCDocumentSourceIdentifierSharedItems;
    v84[5] = DOCDocumentSourceIdentifierSearch;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 6));
    objc_msgSend(v20, "setHiddenSourcesIdentifiers:", v21);

    if (objc_msgSend(v20, "isPickerUI"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "hiddenSourcesIdentifiers"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "arrayByAddingObject:", DOCDocumentSourceIdentifierTrashedItems));
      objc_msgSend(v20, "setHiddenSourcesIdentifiers:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "forbiddenActionIdentifiers"));
      v83[0] = UIDocumentBrowserActionIdentifierMove;
      v83[1] = UIDocumentBrowserActionIdentifierDelete;
      v83[2] = UIDocumentBrowserActionIdentifierTrash;
      v83[3] = UIDocumentBrowserActionIdentifierRename;
      v83[4] = UIDocumentBrowserActionIdentifierNewFolderFromSelection;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 5));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v25));
      objc_msgSend(v20, "setForbiddenActionIdentifiers:", v26);

    }
    v27 = -[DOCFullDocumentManagerViewController initWithConfiguration:sourceObserver:]([DOCFullDocumentManagerViewController alloc], "initWithConfiguration:sourceObserver:", v20, *p_sourceObserver);
    fullDocumentManagerViewController = v10->_fullDocumentManagerViewController;
    v10->_fullDocumentManagerViewController = v27;

    -[DOCFullDocumentManagerViewController setShortDebugID:](v10->_fullDocumentManagerViewController, "setShortDebugID:", v10->_shortDebugID);
    -[DOCFullDocumentManagerViewController setFullDocumentManagerDelegate:](v10->_fullDocumentManagerViewController, "setFullDocumentManagerDelegate:", v10);
    v69 = v20;
    v29 = objc_msgSend(v20, "copy");
    objc_msgSend(v29, "setUseExpandedSourceList:", 1);
    v30 = -[DOCSidebarViewController initWithConfiguration:sourceObserver:]([_TtC5Files24DOCSidebarViewController alloc], "initWithConfiguration:sourceObserver:", v29, *p_sourceObserver);
    sidebarViewController = v10->_sidebarViewController;
    v10->_sidebarViewController = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[DOCConcreteLocation recentDocumentsLocation](DOCConcreteLocation, "recentDocumentsLocation"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController itemCollectionViewPool](v10->_fullDocumentManagerViewController, "itemCollectionViewPool"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController documentManager](v10->_fullDocumentManagerViewController, "documentManager"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController actionManager](v10->_fullDocumentManagerViewController, "actionManager"));
    v68 = v29;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UISearchController docSearchControllerForSearchingIn:configuration:collectionViewPool:documentManager:actionManager:](UISearchController, "docSearchControllerForSearchingIn:configuration:collectionViewPool:documentManager:actionManager:", v32, v29, v33, v34, v35));

    v37 = v36;
    objc_msgSend(v36, "setPresentationDelegate:", v10->_fullDocumentManagerViewController);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "resultCollectionViewController"));
    objc_msgSend(v38, "setActionReporting:", v10);

    -[DOCSidebarViewController setSearchController:](v10->_sidebarViewController, "setSearchController:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSidebarViewController navigationItem](v10->_sidebarViewController, "navigationItem"));
    objc_msgSend(v39, "setHidesSearchBarWhenScrolling:", 0);

    -[DOCSidebarViewController setDefinesPresentationContext:](v10->_sidebarViewController, "setDefinesPresentationContext:", 1);
    v40 = objc_alloc_init(_TtC5Files34DOCSidebarPaneNavigationController);
    sidebarNavigationController = v10->_sidebarNavigationController;
    v10->_sidebarNavigationController = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSidebarPaneNavigationController navigationBar](v10->_sidebarNavigationController, "navigationBar"));
    objc_msgSend(v42, "setPrefersLargeTitles:", 1);

    -[DOCSidebarPaneNavigationController setToolbarHidden:](v10->_sidebarNavigationController, "setToolbarHidden:", 1);
    -[DOCSplitBrowserViewController updatePreferredDisplayModeFromPersistentStore](v10, "updatePreferredDisplayModeFromPersistentStore");
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_configuration, "urls"));
    v44 = objc_msgSend(v43, "count");

    if (v44)
    {
      if (objc_msgSend(*p_configuration, "interactionMode") == (id)3)
      {
        v67 = v37;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_configuration, "urls"));
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v76;
          while (2)
          {
            for (i = 0; i != v47; i = (char *)i + 1)
            {
              if (*(_QWORD *)v76 != v48)
                objc_enumerationMutation(obj);
              v50 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
              v51 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "url"));
              v74 = 0;
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "itemForURL:error:", v52, &v74));
              v54 = v74;

              if (!v53)
              {
                v57 = docUILogHandle;
                if (!docUILogHandle)
                {
                  DOCInitLogging();
                  v57 = docUILogHandle;
                }
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  sub_1004BF630((uint64_t)v50, (uint64_t)v54, v57);

                goto LABEL_23;
              }
              objc_msgSend(v45, "addObject:", v53);

            }
            v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
            if (v47)
              continue;
            break;
          }
        }
LABEL_23:

        v58 = objc_msgSend(v45, "count");
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_configuration, "urls"));
        v60 = objc_msgSend(v59, "count");

        v61 = [_TtC5Files16DOCPickerContext alloc];
        v62 = v61;
        if (v58 == v60)
        {
          v56 = -[DOCPickerContext initWithItems:](v61, "initWithItems:", v45);
          -[DOCSplitBrowserViewController setPickerContext:](v10, "setPickerContext:", v56);
        }
        else
        {
          v56 = (_TtC5Files16DOCPickerContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_configuration, "urls"));
          v63 = -[DOCPickerContext initWithURLs:](v62, "initWithURLs:", v56);
          -[DOCSplitBrowserViewController setPickerContext:](v10, "setPickerContext:", v63);

        }
        v37 = v67;
      }
      else
      {
        v55 = [_TtC5Files16DOCPickerContext alloc];
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_configuration, "urls"));
        v56 = -[DOCPickerContext initWithURLs:](v55, "initWithURLs:", v45);
        -[DOCSplitBrowserViewController setPickerContext:](v10, "setPickerContext:", v56);
      }

    }
    v7 = v71;
    if (-[DOCSplitBrowserViewController isViewLoaded](v10, "isViewLoaded"))
    {
      v64 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v64 = docLogHandle;
      }
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        sub_1004BF588(v64, (uint64_t)v10);
    }
    -[DOCSplitBrowserViewController swift_commonInit](v10, "swift_commonInit");
    v65 = v10;

    v8 = v70;
  }

  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCFullDocumentManagerViewController view](self->_fullDocumentManagerViewController, "view"));
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController itemToFocusDuringAppearance](self, "itemToFocusDuringAppearance"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController itemToFocusDuringAppearance](self, "itemToFocusDuringAppearance"));
    objc_msgSend(v6, "requestFocusUpdateToEnvironment:", v7);

    objc_msgSend(v6, "updateFocusIfNeeded");
    -[DOCSplitBrowserViewController setItemToFocusDuringAppearance:](self, "setItemToFocusDuringAppearance:", 0);

  }
  -[DOCSplitBrowserViewController forceSidebarHiddenByDefaultForUIPDocLandingIfNecessary](self, "forceSidebarHiddenByDefaultForUIPDocLandingIfNecessary");
}

- (void)updatePreferredDisplayModeFromPersistentStore
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[DOCSplitBrowserViewController _sidebarVisibilityPinnedToWindowSizingOnly](self, "_sidebarVisibilityPinnedToWindowSizingOnly"))
  {
    if ((-[DOCConfiguration isPickerUI](self->_configuration, "isPickerUI") & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[DOCUserInterfaceStateStore sharedStore](DOCUserInterfaceStateStore, "sharedStore"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController configuration](self, "configuration"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceStateForConfiguration:", v5));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userPrefersTiledSidebarHidden"));
      LODWORD(v5) = objc_msgSend(v7, "BOOLValue");

      v3 = v5;
    }
    if (-[DOCSplitBrowserViewController preferredDisplayMode](self, "preferredDisplayMode") != (id)v3)
      -[DOCSplitBrowserViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", v3);
    -[DOCSplitBrowserViewController updatePreferredSplitBehavior](self, "updatePreferredSplitBehavior");
    -[DOCSplitBrowserViewController updateDisplayModeButtonVisibility](self, "updateDisplayModeButtonVisibility");
  }
}

- (void)updateDisplayModeButtonVisibility
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (!-[DOCSplitBrowserViewController _sidebarVisibilityPinnedToWindowSizingOnly](self, "_sidebarVisibilityPinnedToWindowSizingOnly"))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
    v3 = objc_msgSend(v12, "isCollapsed");
    v4 = -[DOCFullDocumentManagerViewController isInUserTriggeredSelectionMode](self->_fullDocumentManagerViewController, "isInUserTriggeredSelectionMode");
    v5 = v4 & v3 ^ 1;
    v6 = v4 ^ 1;
    if (-[DOCConfiguration isPickerUI](self->_configuration, "isPickerUI"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController traitCollection](self, "traitCollection"));
      v8 = DOCUsePadIdiomForTraits(v7);

      if (v8)
      {
        v6 = 0;
        v5 = (id)-[DOCSplitBrowserViewController displayMode](self, "displayMode") == (id)1;
      }
    }
    v9 = +[UITraitCollection enclosingTabSwitcherCanBeFloating](UITraitCollection, "enclosingTabSwitcherCanBeFloating");
    v10 = 2;
    if ((v5 & ~(_DWORD)v6) == 0)
      v10 = 0;
    if (v9)
      v11 = 1;
    else
      v11 = v10;
    -[DOCSplitBrowserViewController setDisplayModeButtonVisibility:](self, "setDisplayModeButtonVisibility:", v11);
    -[DOCSplitBrowserViewController setPresentsWithGesture:](self, "setPresentsWithGesture:", v6);

  }
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  char v18;
  uint64_t v19;
  unsigned int v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unsigned __int8 v25;
  void *v26;
  BOOL v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  BOOL v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  int64_t v41;
  char v42;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController transitionCoordinator](self, "transitionCoordinator"));
  if (v7)
    v28 = self->_sizeTransitionCoordinator == 0;
  else
    v28 = 0;

  v8 = objc_msgSend(v6, "displayMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _activeTransitionCoordinator](self, "_activeTransitionCoordinator"));
  v27 = v9 != 0;
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _definiteTransitionCoordinator](self, "_definiteTransitionCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewStateTransitionStart](self, "doc_splitViewStateTransitionStart"));
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
  v13 = v12;

  -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionEnd:](self, "setDoc_splitViewStateTransitionEnd:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "withDisplayMode:", a4));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "withIsCollapsed:", objc_msgSend(v6, "isCollapsed")));

  -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionStart:](self, "setDoc_splitViewStateTransitionStart:", v13);
  -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionEnd:](self, "setDoc_splitViewStateTransitionEnd:", v15);
  v16 = +[DOCSplitViewState isShowOverlayTransitionFromState:toState:](DOCSplitViewState, "isShowOverlayTransitionFromState:toState:", v13, v15);
  if (v9)
    v17 = v16;
  else
    v17 = 1;
  v18 = (v17 | +[DOCSplitViewState isHideOverlayTransitionFromState:toState:](DOCSplitViewState, "isHideOverlayTransitionFromState:toState:", v13, v15)) ^ 1;
  if (self->_sizeTransitionCoordinator)
  {
    v19 = 0;
  }
  else
  {
    v20 = objc_msgSend(v13, "isSidebarShown");
    v19 = v20 ^ objc_msgSend(v15, "isSidebarShown");
  }
  -[DOCSplitBrowserViewController setPrefersAnimatedTabVibilityChanges:](self, "setPrefersAnimatedTabVibilityChanges:", v19);
  if (v17)
    -[DOCSplitBrowserViewController updateContentEditingOverlaysForState:](self, "updateContentEditingOverlaysForState:", v15);
  -[DOCSplitBrowserViewController updateDisplayModeButtonVisibility](self, "updateDisplayModeButtonVisibility");
  -[DOCSplitBrowserViewController prepareSnapshotForSplitStateChangingFromState:toState:alongside:](self, "prepareSnapshotForSplitStateChangingFromState:toState:alongside:", v13, v15, v9);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000BBD90;
  v36[3] = &unk_1005BE8C8;
  v36[4] = self;
  v37 = v9;
  v38 = v13;
  v39 = v15;
  v40 = v8;
  v41 = a4;
  v42 = v18;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000BBE20;
  v29[3] = &unk_1005BE8F0;
  v29[4] = self;
  v30 = v39;
  v34 = v28;
  v32 = v38;
  v33 = v8;
  v35 = v27;
  v31 = v6;
  v21 = v38;
  v22 = v6;
  v23 = v39;
  v24 = v9;
  objc_msgSend(v24, "animateAlongsideTransition:completion:", v36, v29);
  v25 = -[DOCSplitBrowserViewController doc_inWindowPerformingSnapshotting](self, "doc_inWindowPerformingSnapshotting");
  if (a4 == 1 && (v25 & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
    if (objc_msgSend(v26, "isEditing"))
      objc_msgSend(v26, "setEditing:", 0);

  }
}

- (_TtC5Files24DOCSidebarViewController)sidebarViewController
{
  return (_TtC5Files24DOCSidebarViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSplitViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_splitViewDelegate, a3);
}

- (void)setShortDebugID:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_shortDebugID, a3);
  v5 = a3;
  -[DOCFullDocumentManagerViewController setShortDebugID:](self->_fullDocumentManagerViewController, "setShortDebugID:", v5);

}

- (DOCFullDocumentManagerViewController)fullDocumentManagerViewController
{
  return (DOCFullDocumentManagerViewController *)objc_getProperty(self, a2, 72, 1);
}

- (void)fullDocumentManagerViewController:(id)a3 didUpdateHierarchy:(id)a4 displayedRootLocation:(id)a5
{
  -[DOCSidebarViewController noteBrowserDidUpdateHierarchy:displayedRootLocation:](self->_sidebarViewController, "noteBrowserDidUpdateHierarchy:displayedRootLocation:", a4, a5);
}

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)_sidebarVisibilityPinnedToWindowSizingOnly
{
  return -[DOCSidebarViewController sidebarVisibilityPinnedToWindowSizingOnly](self->_sidebarViewController, "sidebarVisibilityPinnedToWindowSizingOnly");
}

- (NSString)shortDebugID
{
  return self->_shortDebugID;
}

- (void)updatePreferredSplitBehavior
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController viewIfLoaded](self, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));

  v5 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "_isEmbeddedScreen"))
      v6 = -[DOCSplitBrowserViewController _customPreferredSplitBehavior_EmbeddedScreen](self, "_customPreferredSplitBehavior_EmbeddedScreen");
    else
      v6 = -[DOCSplitBrowserViewController _customPreferredSplitBehavior_ExternalScreen](self, "_customPreferredSplitBehavior_ExternalScreen");
    -[DOCSplitBrowserViewController setPreferredSplitBehavior:](self, "setPreferredSplitBehavior:", v6);
    v5 = v7;
  }

}

- (int64_t)_customPreferredSplitBehavior_EmbeddedScreen
{
  char *v3;
  char *v4;

  v3 = (char *)-[DOCSplitBrowserViewController doc_deprecated_interfaceOrientation](self, "doc_deprecated_interfaceOrientation");
  v4 = (char *)-[DOCSplitBrowserViewController _rotatingToInterfaceOrientation](self, "_rotatingToInterfaceOrientation");
  if (v4)
    v3 = v4;
  if (-[DOCConfiguration isPickerUI](self->_configuration, "isPickerUI"))
    return 0;
  else
    return 2 * ((unint64_t)(v3 - 1) < 2);
}

- (int64_t)_customPreferredSplitBehavior_ExternalScreen
{
  return 0;
}

- (void)_saveUserPrefersTiledSidebarForChangeFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4
{
  if (-[DOCSplitBrowserViewController _contextAllowsPersistingColumnVisibilityChanges](self, "_contextAllowsPersistingColumnVisibilityChanges")&& (a3 == 2 || a4 == 2))
  {
    -[DOCSplitBrowserViewController saveUserPrefersSidebarHidden:](self, "saveUserPrefersSidebarHidden:", a4 != 2);
  }
}

- (void)saveUserPrefersSidebarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DOCUserInterfaceStateStore sharedStore](DOCUserInterfaceStateStore, "sharedStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interfaceStateForConfiguration:", v8));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v6, "setUserPrefersTiledSidebarHidden:", v7);

    objc_msgSend(v5, "updateInterfaceState:forConfiguration:", v6, v8);
    -[DOCSplitBrowserViewController updatePreferredDisplayModeFromPersistentStore](self, "updatePreferredDisplayModeFromPersistentStore");
  }

}

- (void)setPickerContext:(id)a3
{
  _TtC5Files16DOCPickerContext *v5;

  v5 = (_TtC5Files16DOCPickerContext *)a3;
  if (self->_pickerContext != v5)
  {
    objc_storeStrong((id *)&self->_pickerContext, a3);
    -[DOCFullDocumentManagerViewController setPickerContext:](self->_fullDocumentManagerViewController, "setPickerContext:", v5);
    -[DOCSidebarViewController setPickerContext:](self->_sidebarViewController, "setPickerContext:", v5);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  objc_msgSend(v4, "setEditing:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  objc_msgSend(v5, "setEditing:", 0);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  -[DOCSplitBrowserViewController updatePreferredSplitBehavior](self, "updatePreferredSplitBehavior");
  -[DOCSplitBrowserViewController updateDisplayModeButtonVisibility](self, "updateDisplayModeButtonVisibility");
}

- (id)_tapToCloseSidebarGestureRecognizer
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _primaryDimmingView](self, "_primaryDimmingView", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "gestureRecognizers"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(UITapGestureRecognizer);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_swipeToCloseSidebarGestureRecognizer
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _primaryDimmingView](self, "_primaryDimmingView", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "gestureRecognizers"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(UIPanGestureRecognizer);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _TtC5Files24DOCSidebarViewController *v10;
  unsigned __int8 v11;
  unsigned int v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  BOOL v21;
  unsigned __int8 v22;
  char v23;
  objc_super v24;

  v10 = (_TtC5Files24DOCSidebarViewController *)a4;
  if (off_1006408B8 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("editing")))
    {
      v11 = -[DOCFullDocumentManagerViewController prefersTabBarHidden](self->_fullDocumentManagerViewController, "prefersTabBarHidden");
      if (-[DOCFullDocumentManagerViewController isEditing](self->_fullDocumentManagerViewController, "isEditing")&& -[DOCSplitBrowserViewController enclosingTabSwitcherStyle](self, "enclosingTabSwitcherStyle") == (id)2)
      {
        v11 = 1;
      }
      v12 = -[DOCSidebarViewController isEditing](self->_sidebarViewController, "isEditing");
      if (+[UITraitCollection enclosingTabSwitcherCanBeFloating](UITraitCollection, "enclosingTabSwitcherCanBeFloating"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController traitCollection](self, "traitCollection"));
        v14 = objc_msgSend(v13, "horizontalSizeClass") == (id)2;

      }
      else
      {
        v14 = 0;
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000BB270;
      v20[3] = &unk_1005BE7C8;
      v20[4] = self;
      v21 = v14;
      v22 = v11;
      v23 = v12;
      +[UIView doc_performAllowingAnimations:block:](UIView, "doc_performAllowingAnimations:block:", v14, v20);
      -[DOCSplitBrowserViewController updateDisplayModeButtonVisibility](self, "updateDisplayModeButtonVisibility");
      if (!-[DOCSplitBrowserViewController isCollapsed](self, "isCollapsed"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _swipeToCloseSidebarGestureRecognizer](self, "_swipeToCloseSidebarGestureRecognizer"));
        objc_msgSend(v15, "setEnabled:", v12 ^ 1);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _tapToCloseSidebarGestureRecognizer](self, "_tapToCloseSidebarGestureRecognizer"));
        objc_msgSend(v16, "setEnabled:", v12 ^ 1);

        if (self->_sidebarViewController == v10 && v12)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
          objc_msgSend(v17, "dismissSearch");

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
          objc_msgSend(v18, "setEditing:animated:", 0, 1);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
        -[DOCSplitBrowserViewController updateContentEditingOverlaysForState:](self, "updateContentEditingOverlaysForState:", v19);

      }
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)DOCSplitBrowserViewController;
    -[DOCSplitBrowserViewController observeValueForKeyPath:ofObject:change:context:](&v24, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (-[DOCSplitBrowserViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("editing"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("editing"));

  }
  v5.receiver = self;
  v5.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController dealloc](&v5, "dealloc");
}

- (void)setIncludeSidebarInCollapsedNavStack:(BOOL)a3
{
  if (-[DOCSplitBrowserViewController includeSidebarInCollapsedNavStack](self, "includeSidebarInCollapsedNavStack") != a3)
  {
    self->_includeSidebarInCollapsedNavStack = a3;
    -[DOCSplitBrowserViewController _arrangeSidebarForCollapsedPresentationForced:](self, "_arrangeSidebarForCollapsedPresentationForced:", 0);
  }
}

- (void)showSidebarAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v6 = a4;
  if (-[DOCSplitBrowserViewController isCollapsed](self, "isCollapsed"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
    objc_msgSend(v7, "popToRootViewControllerAnimated:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitionCoordinator"));

    if (!v9)
LABEL_6:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _definiteTransitionCoordinator](self, "_definiteTransitionCoordinator"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
    v11 = objc_msgSend(v10, "isSidebarShown");

    if ((v11 & 1) != 0)
      goto LABEL_6;
    -[DOCSplitBrowserViewController toggleSidebarShown](self, "toggleSidebarShown");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController transitionCoordinator](self, "transitionCoordinator"));
    if (!v9)
      goto LABEL_6;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BB514;
  v13[3] = &unk_1005BE830;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v9, "animateAlongsideTransition:completion:", &stru_1005BE808, v13);

}

- (void)showSidebar
{
  -[DOCSplitBrowserViewController showSidebarAnimated:withCompletion:](self, "showSidebarAnimated:withCompletion:", 1, &stru_1005BE850);
}

- (void)hideSidebar
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
  v4 = objc_msgSend(v3, "isSidebarShown");

  if (v4)
    -[DOCSplitBrowserViewController toggleSidebarShown](self, "toggleSidebarShown");
}

- (void)toggleSidebarShown
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
  v4 = objc_msgSend(v3, "isSidebarShown");

  if (v4)
    -[DOCSplitBrowserViewController hideColumn:](self, "hideColumn:", 0);
  else
    -[DOCSplitBrowserViewController showColumn:](self, "showColumn:", 0);
}

- (BOOL)isShowingCollapsedSidebarViewController
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[DOCSplitBrowserViewController isCollapsed](self, "isCollapsed"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  v6 = v4 == v5;

  return v6;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController itemToFocusDuringAppearance](self, "itemToFocusDuringAppearance"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController itemToFocusDuringAppearance](self, "itemToFocusDuringAppearance"));
    v12 = v4;
    v5 = &v12;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
    v7 = objc_msgSend(v6, "sidebarHasActiveFocus");

    if (v7)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
      v11 = v4;
      v5 = &v11;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
      v10 = v4;
      v5 = &v10;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 1, v10, v11, v12));

  return v8;
}

- (void)_splitViewController:(id)a3 animateTransitionToStateRequest:(id)a4 detailSize:(CGSize)a5 duration:(double)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  double v14;
  id v15;
  _QWORD v16[4];
  id v17;
  DOCSplitBrowserViewController *v18;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController traitCollection](self, "traitCollection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredNavigationBarStyle_objc"));
  v13 = objc_msgSend(v12, "hasHistoryButtons");

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v10, "leadingWidth");
    if (v14 < 0.5)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000BB85C;
      v16[3] = &unk_1005BE508;
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayModeButtonItem"));
      v18 = self;
      v15 = v17;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, a6);

    }
  }

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
  -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionStart:](self, "setDoc_splitViewStateTransitionStart:", v8);
  -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionEnd:](self, "setDoc_splitViewStateTransitionEnd:", 0);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "withIsCollapsed:", objc_msgSend(v7, "horizontalSizeClass") == (id)1));

  -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionEnd:](self, "setDoc_splitViewStateTransitionEnd:", v10);
  v12.receiver = self;
  v12.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v12, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BB9D0;
  v11[3] = &unk_1005BE878;
  v11[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v11);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  UIViewControllerTransitionCoordinator *sizeTransitionCoordinator;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[DOCSplitBrowserViewController updatePreferredSplitBehavior](self, "updatePreferredSplitBehavior");
  v8 = v7;
  if (!v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _definiteTransitionCoordinator](self, "_definiteTransitionCoordinator"));
  objc_storeStrong((id *)&self->_sizeTransitionCoordinator, v8);
  if (!v7)

  v14.receiver = self;
  v14.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  sizeTransitionCoordinator = self->_sizeTransitionCoordinator;
  v11[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BBAF8;
  v12[3] = &unk_1005BE8A0;
  v12[4] = self;
  v13 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BBB24;
  v11[3] = &unk_1005BE878;
  v10 = v7;
  -[UIViewControllerTransitionCoordinator animateAlongsideTransition:completion:](sizeTransitionCoordinator, "animateAlongsideTransition:completion:", v12, v11);

}

- (id)_activeTransitionCoordinator
{
  UIViewControllerTransitionCoordinator *sizeTransitionCoordinator;
  UIViewControllerTransitionCoordinator *v4;
  UIViewControllerTransitionCoordinator *v5;

  sizeTransitionCoordinator = (UIViewControllerTransitionCoordinator *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController transitionCoordinator](self, "transitionCoordinator"));
  v4 = sizeTransitionCoordinator;
  if (!sizeTransitionCoordinator)
    sizeTransitionCoordinator = self->_sizeTransitionCoordinator;
  v5 = sizeTransitionCoordinator;

  return v5;
}

- (void)clearSplitViewStateTransitionStateIfNecessary
{
  void *v3;

  if (!self->_sizeTransitionCoordinator)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewStateTransitionStart](self, "doc_splitViewStateTransitionStart"));

    if (v3)
    {
      -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionStart:](self, "setDoc_splitViewStateTransitionStart:", 0);
      -[DOCSplitBrowserViewController setDoc_splitViewStateTransitionEnd:](self, "setDoc_splitViewStateTransitionEnd:", 0);
      -[DOCSplitBrowserViewController updateTraitCollectionTabBarSetting](self, "updateTraitCollectionTabBarSetting");
    }
  }
}

- (BOOL)isCollapsed
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  id v8;
  objc_super v9;

  if ((objc_msgSend((id)objc_opt_class(self), "disableWorkaroundFor124376396") & 1) != 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewStateTransitionEnd](self, "doc_splitViewStateTransitionEnd"))) == 0)
  {
    if (+[DOCFeature _UIPTabInfrastructureEnabled](DOCFeature, "_UIPTabInfrastructureEnabled")&& (v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController traitCollection](self, "traitCollection")), v8 = objc_msgSend(v7, "horizontalSizeClass"), v7, v8 == (id)1))
    {
      return 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)DOCSplitBrowserViewController;
      return -[DOCSplitBrowserViewController isCollapsed](&v9, "isCollapsed");
    }
  }
  else
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "isCollapsed");

    return v5;
  }
}

- (int64_t)displayMode
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  if ((objc_msgSend((id)objc_opt_class(self), "disableWorkaroundFor124376396") & 1) != 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewStateTransitionEnd](self, "doc_splitViewStateTransitionEnd"))) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCSplitBrowserViewController;
    return -[DOCSplitBrowserViewController displayMode](&v7, "displayMode");
  }
  else
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "displayMode");

    return (int64_t)v5;
  }
}

- (void)_splitViewController:(id)a3 didFinishExpandToDisplayMode:(int64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController", a3, a4));
  objc_msgSend(v4, "splitViewWillDidExpand");

}

- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5
{
  -[DOCSplitBrowserViewController clearSplitViewStateTransitionStateIfNecessary](self, "clearSplitViewStateTransitionStateIfNecessary", a3, a4, a5);
  -[DOCSplitBrowserViewController updateTraitCollectionTabBarSetting](self, "updateTraitCollectionTabBarSetting");
}

- (void)_arrangeSidebarForCollapsedPresentationForced:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  if (a3 || -[DOCSplitBrowserViewController isCollapsed](self, "isCollapsed"))
  {
    if (-[DOCSplitBrowserViewController includeSidebarInCollapsedNavStack](self, "includeSidebarInCollapsedNavStack"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));

      if (v6 != v5)
      {
        -[DOCSidebarPaneNavigationController setViewControllers:](self->_sidebarNavigationController, "setViewControllers:", &__NSArray0__struct);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
        objc_msgSend(v10, "setRootViewController:", v7);

        if (objc_msgSend(v5, "isEditing"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internalNavigationController"));
          v9 = objc_msgSend(v8, "popToViewController:animated:", v5, 0);

        }
      }
    }
    else
    {
      objc_msgSend(v10, "setRootViewController:", 0);
    }
  }

}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  void *v28;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController viewControllerForColumn:](self, "viewControllerForColumn:", 0));
  v7 = objc_opt_self(UINavigationController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v6, "setNavigationBarHidden:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  v11 = objc_msgSend(v10, "isEditing");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "effectiveBrowserViewController"));
  v14 = objc_msgSend(v13, "isEditing");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hierarchyController"));
  objc_msgSend(v16, "invalidateAllAssertions");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hierarchyController"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000BC254;
  v27[3] = &unk_1005BE558;
  v27[4] = self;
  objc_msgSend(v18, "performWhileForcingChangeInPreparationQueue:", v27);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  objc_msgSend(v19, "doc_removeFromParentWithRemoveSubviewBlock:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  v28 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  -[DOCSidebarPaneNavigationController setViewControllers:](self->_sidebarNavigationController, "setViewControllers:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  objc_msgSend(v22, "setEditing:", v11);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  objc_msgSend(v23, "setEditing:", v14);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController doc_splitViewState](self, "doc_splitViewState"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "withIsCollapsed:", 0));
  -[DOCSplitBrowserViewController updateContentEditingOverlaysForState:](self, "updateContentEditingOverlaysForState:", v25);

  return a4;
}

- (BOOL)_contextAllowsPersistingColumnVisibilityChanges
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[DOCSplitBrowserViewController _sidebarVisibilityPinnedToWindowSizingOnly](self, "_sidebarVisibilityPinnedToWindowSizingOnly"))
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));

  if (v6)
    v3 = objc_msgSend(v6, "activationState") == 0;
  else
    v3 = 0;

  return v3;
}

- (void)dismissSidebarViewControllerIfNeeded
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController viewControllers](self, "viewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
    -[DOCSidebarViewController dismissViewControllerAnimated:completion:](self->_sidebarViewController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setSceneIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  objc_msgSend(v5, "setSceneIdentifier:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  objc_msgSend(v6, "setSceneIdentifier:", v4);

}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  objc_msgSend(v5, "setAdditionalTrailingNavigationBarButtonItems:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController sidebarViewController](self, "sidebarViewController"));
  objc_msgSend(v6, "setAdditionalTrailingNavigationBarButtonItems:", v4);

}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  objc_msgSend(v5, "setAdditionalLeadingNavigationBarButtonItems:", v4);

}

- (id)_viewControllerForOverlayTabBar
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController fullDocumentManagerViewController](self, "fullDocumentManagerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "internalNavigationController"));

  return v3;
}

- (BOOL)_shouldOverlayTabBar
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _viewControllerForOverlayTabBar](self, "_viewControllerForOverlayTabBar"));
  v3 = objc_msgSend(v2, "_shouldOverlayTabBar");

  return v3;
}

- (id)_hostingNavigationBar
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSplitBrowserViewController _viewControllerForOverlayTabBar](self, "_viewControllerForOverlayTabBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_hostingNavigationBar"));

  return v3;
}

+ (BOOL)disableWorkaroundFor124376396
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableWorkaroundFor124376396"));

  return v3;
}

- (DOCSplitViewControllerDelegate)splitViewDelegate
{
  return (DOCSplitViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_splitViewDelegate);
}

- (UIFocusItem)itemToFocusDuringAppearance
{
  return (UIFocusItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setItemToFocusDuringAppearance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (DOCSourceObserver)sourceObserver
{
  return (DOCSourceObserver *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)includeSidebarInCollapsedNavStack
{
  return self->_includeSidebarInCollapsedNavStack;
}

- (_TtC5Files16DOCPickerContext)pickerContext
{
  return self->_pickerContext;
}

- (BOOL)prefersAnimatedTabVibilityChanges
{
  return self->_prefersAnimatedTabVibilityChanges;
}

- (void)setPrefersAnimatedTabVibilityChanges:(BOOL)a3
{
  self->_prefersAnimatedTabVibilityChanges = a3;
}

- (_TtC5Files24DOCContentDimmingOverlay)sourcesOverlay
{
  return self->_sourcesOverlay;
}

- (void)setSourcesOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_sourcesOverlay, a3);
}

- (_TtC5Files24DOCContentDimmingOverlay)browserOverlay
{
  return self->_browserOverlay;
}

- (void)setBrowserOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_browserOverlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserOverlay, 0);
  objc_storeStrong((id *)&self->_sourcesOverlay, 0);
  objc_storeStrong((id *)&self->_pickerContext, 0);
  objc_storeStrong((id *)&self->_sourceObserver, 0);
  objc_storeStrong((id *)&self->_fullDocumentManagerViewController, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_itemToFocusDuringAppearance, 0);
  objc_destroyWeak((id *)&self->_splitViewDelegate);
  objc_storeStrong((id *)&self->_shortDebugID, 0);
  objc_storeStrong((id *)&self->_sizeTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_sidebarNavigationController, 0);
}

- (void)sidebarViewController:(id)a3 didSelect:(id)a4
{
  id v6;
  id v7;
  id v8;
  DOCSplitBrowserViewController *v9;

  v6 = a3;
  v7 = a4;
  v9 = self;
  v8 = -[DOCSplitBrowserViewController doc_splitViewState](v9, "doc_splitViewState");
  LODWORD(self) = objc_msgSend(v8, "isSidebarShownInOverlay");

  if ((_DWORD)self)
    -[DOCSplitBrowserViewController toggleSidebarShown](v9, "toggleSidebarShown");
  _sSo29DOCSplitBrowserViewControllerC5FilesE9didSelect_2atySo19DOCConcreteLocationC_AGSgtF_0(v7);

}

- (void)sidebarViewController:(id)a3 wantsToReveal:(id)a4
{
  id v6;
  DOCSplitBrowserViewController *v7;
  id v8;
  void *v9;
  DOCFullDocumentManagerViewController *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  v8 = objc_msgSend(v6, "fileProviderItem");
  if (v8)
  {
    v9 = v8;
    v10 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v7, "fullDocumentManagerViewController");
    DOCFullDocumentManagerViewController.reveal(item:showEnclosingFolder:completionBlock:)(v9, 1, (uint64_t)DOCSplitBrowserViewController.didCommitPreview(of:), 0);

    v6 = v9;
    v7 = (DOCSplitBrowserViewController *)v10;
  }

}

- (BOOL)sidebarViewControllerWithIsCollapsed:(id)a3
{
  id v4;
  DOCSplitBrowserViewController *v5;
  id v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = self;
  v6 = -[DOCSplitBrowserViewController doc_splitViewState](v5, "doc_splitViewState");
  v7 = objc_msgSend(v6, "isCollapsed");

  return v7;
}

- (void)importScannedDocumentAt:(id)a3 presentingController:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  DOCSplitBrowserViewController *v12;
  DOCFullDocumentManagerViewController *v13;
  NSURL *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a4;
  v12 = self;
  v13 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v12, "fullDocumentManagerViewController");
  URL._bridgeToObjectiveC()(v14);
  v16 = v15;
  -[DOCFullDocumentManagerViewController importScannedDocumentAt:presentingController:](v13, "importScannedDocumentAt:presentingController:", v15, v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  DOCSplitBrowserViewController *v12;
  DOCFullDocumentManagerViewController *v13;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v12, "fullDocumentManagerViewController");
  -[DOCFullDocumentManagerViewController didSelectItem:atParentLocation:wasAlreadySelected:onlyRevealIfColumn:](v13, "didSelectItem:atParentLocation:wasAlreadySelected:onlyRevealIfColumn:", v10, v11, v7, v6);

}

- (void)didConfirmPickIn:(id)a3
{
  sub_1003151B4(self, (uint64_t)a2, a3, (SEL *)&selRef_didConfirmPickIn_);
}

- (int64_t)pickerOperationFor:(id)a3
{
  id v4;
  DOCSplitBrowserViewController *v5;
  DOCFullDocumentManagerViewController *v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  v6 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v5, "fullDocumentManagerViewController");
  v7 = -[DOCFullDocumentManagerViewController pickerOperationFor:](v6, "pickerOperationFor:", v4);

  return v7;
}

- (void)didSelectLocation:(id)a3 atParentLocation:(id)a4
{
  id v6;
  id v7;
  DOCSplitBrowserViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _sSo29DOCSplitBrowserViewControllerC5FilesE9didSelect_2atySo19DOCConcreteLocationC_AGSgtF_0(v6);

}

- (void)didTapLocationOf:(id)a3
{
  sub_1003151B4(self, (uint64_t)a2, a3, (SEL *)&selRef_didTapLocationOf_);
}

- (void)didTapOnUnselectableItem:(id)a3
{
  sub_1003151B4(self, (uint64_t)a2, a3, (SEL *)&selRef_didTapOnUnselectableItem_);
}

- (void)didIndicateCancelPicker
{
  DOCSplitBrowserViewController *v2;
  DOCFullDocumentManagerViewController *v3;

  v2 = self;
  v3 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v2, "fullDocumentManagerViewController");
  -[DOCFullDocumentManagerViewController didIndicateCancelPicker](v3, "didIndicateCancelPicker");

}

- (void)didToggleEditStateWithEditing:(BOOL)a3 in:(id)a4
{
  _BOOL8 v4;
  id v6;
  DOCFullDocumentManagerViewController *v7;
  DOCSplitBrowserViewController *v8;

  v4 = a3;
  v6 = a4;
  v8 = self;
  v7 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v8, "fullDocumentManagerViewController");
  -[DOCFullDocumentManagerViewController didToggleEditStateWithEditing:in:](v7, "didToggleEditStateWithEditing:in:", v4, v6);

  -[DOCSplitBrowserViewController updateTraitCollectionTabBarSetting](v8, "updateTraitCollectionTabBarSetting");
}

- (BOOL)canLoadAdditionalParents
{
  return 0;
}

- (void)beginLoadingAdditionalParents:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (BOOL)isBrowserCurrentLocation:(id)a3
{
  DOCSplitBrowserViewController *v5;
  DOCFullDocumentManagerViewController *v6;
  unsigned __int8 v7;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v5, "fullDocumentManagerViewController");
  v7 = -[DOCFullDocumentManagerViewController isBrowserCurrentLocation:](v6, "isBrowserCurrentLocation:", a3);
  swift_unknownObjectRelease(a3);

  return v7;
}

- (BOOL)infoPanelPreviewingMultipleItems
{
  return 0;
}

- (void)prepareSnapshotForSplitStateChangingFromState:(id)a3 toState:(id)a4 alongside:(id)a5
{
  id v8;
  id v9;
  DOCSplitBrowserViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  DOCSplitBrowserViewController.prepareSnapshotForSplitStateChanging(fromState:toState:alongside:)((uint64_t)v8, (uint64_t)v9, a5);

  swift_unknownObjectRelease(a5);
}

- (void)forceSidebarHiddenByDefaultForUIPDocLandingIfNecessary
{
  DOCSplitBrowserViewController *v2;

  v2 = self;
  if (-[DOCSplitBrowserViewController enclosedInUIPDocumentLanding](v2, "enclosedInUIPDocumentLanding")
    && (id)-[DOCSplitBrowserViewController displayMode](v2, "displayMode") == (id)1)
  {
    -[DOCSplitBrowserViewController saveUserPrefersSidebarHidden:](v2, "saveUserPrefersSidebarHidden:", 1);
  }

}

- (void)updateUIPHorizontalInsetsIfNecessaryWithCoordinator:(id)a3
{
  DOCSplitBrowserViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1003760F8(a3);
  swift_unknownObjectRelease(a3);

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  DOCSplitBrowserViewController *v7;
  uint64_t v8;
  DOCSplitBrowserViewController *v9;
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
  DOCSplitBrowserViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v18, (uint64_t)v19);

  sub_10007EB54((uint64_t)v18);
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

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  DOCSplitBrowserViewController *v7;
  uint64_t v8;
  DOCSplitBrowserViewController *v9;
  BOOL v10;
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
  v10 = DOCSplitBrowserViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v12);

  sub_10007EB54((uint64_t)v12);
  return v10;
}

- (void)updateTraitCollectionTabBarSetting
{
  DOCSplitBrowserViewController *v2;
  DOCFullDocumentManagerViewController *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = self;
  v3 = -[DOCSplitBrowserViewController fullDocumentManagerViewController](v2, "fullDocumentManagerViewController");
  v4 = (void *)objc_opt_self(DOCTabbedBrowserViewController);
  v5 = -[DOCFullDocumentManagerViewController configuration](v3, "configuration");
  v6 = objc_msgSend(v5, "sceneIdentifier");

  v7 = objc_msgSend(v4, "globalTabbedBrowserControllerForIdentifier:", v6);
  objc_msgSend(v7, "updateTraitCollectionTabBarSetting");

}

@end
