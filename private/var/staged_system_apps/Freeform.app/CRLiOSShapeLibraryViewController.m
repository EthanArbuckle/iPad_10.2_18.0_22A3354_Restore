@implementation CRLiOSShapeLibraryViewController

- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3 shouldChangeSelectedShapes:(BOOL)a4
{
  id v6;
  CRLiOSShapeLibraryViewController *v7;
  CRLiOSShapeLibraryViewController *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSShapeLibraryViewController;
  v7 = -[CRLiOSShapeLibraryViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_shouldChangeSelectedShapes = a4;
    v8->_unscaledPopoverAnchorPoint = (CGPoint)xmmword_100EEC438;
    v8->_showLinesInLibrary = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, "p_shapeLibraryIndexingDidFinish:", CFSTR("CRLShapeLibraryIndexingDidFinishNotification"), 0);

  }
  return v8;
}

- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3
{
  return -[CRLiOSShapeLibraryViewController initWithDelegate:shouldChangeSelectedShapes:](self, "initWithDelegate:shouldChangeSelectedShapes:", a3, 0);
}

- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3 unscaledPopoverAnchorPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CRLiOSShapeLibraryViewController *result;

  y = a4.y;
  x = a4.x;
  result = -[CRLiOSShapeLibraryViewController initWithDelegate:shouldChangeSelectedShapes:](self, "initWithDelegate:shouldChangeSelectedShapes:", a3, 0);
  if (result)
  {
    result->_unscaledPopoverAnchorPoint.x = x;
    result->_unscaledPopoverAnchorPoint.y = y;
  }
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  CRLBasicShapeLibrary *v6;
  void *v7;
  CRLBasicShapeLibrary *v8;
  id v9;
  CRLShapeCollectionDataSource *v10;
  CRLShapeCollectionDataSource *v11;
  CRLShapeCollectionDataSource *shapeCollectionDataSource;
  CRLShapeSearchResultsCollection *v13;
  CRLShapeCollectionDataSource *v14;
  CRLShapeCollectionDataSource *v15;
  CRLShapeSearchResultsCollection *shapeSearchResultsCollection;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  CRLAccessibilityTimer *v54;
  void *v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  CRLBasicShapeLibrary *v85;
  objc_super v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  _QWORD v91[6];
  id v92;

  v86.receiver = self;
  v86.super_class = (Class)CRLiOSShapeLibraryViewController;
  -[CRLiOSShapeLibraryViewController viewDidLoad](&v86, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLShapeLibrary sharedLibrary](CRLShapeLibrary, "sharedLibrary"));
  v6 = [CRLBasicShapeLibrary alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLocale currentLocale](CRLLocale, "currentLocale"));
  v8 = -[CRLBasicShapeLibrary initWithLocale:](v6, "initWithLocale:", v7);

  v9 = objc_msgSend(v5, "dataLoadStatus");
  v10 = [CRLShapeCollectionDataSource alloc];
  v84 = v5;
  v85 = v8;
  if (v9 == (id)2)
  {
    v11 = -[CRLShapeCollectionDataSource initWithShapeLibrary:basicShapeLibrary:](v10, "initWithShapeLibrary:basicShapeLibrary:", v5, v8);
    shapeCollectionDataSource = self->_shapeCollectionDataSource;
    self->_shapeCollectionDataSource = v11;

    v13 = -[CRLShapeSearchResultsCollection initWithShapeLibrary:basicShapeLibrary:searchTerm:]([CRLShapeSearchResultsCollection alloc], "initWithShapeLibrary:basicShapeLibrary:searchTerm:", v5, v8, 0);
  }
  else
  {
    v14 = -[CRLShapeCollectionDataSource initWithBasicShapeLibrary:](v10, "initWithBasicShapeLibrary:", v8);
    v15 = self->_shapeCollectionDataSource;
    self->_shapeCollectionDataSource = v14;

    v13 = -[CRLShapeSearchResultsCollection initWithBasicShapeLibrary:searchTerm:]([CRLShapeSearchResultsCollection alloc], "initWithBasicShapeLibrary:searchTerm:", v8, 0);
  }
  shapeSearchResultsCollection = self->_shapeSearchResultsCollection;
  self->_shapeSearchResultsCollection = v13;

  v17 = objc_alloc_init((Class)UINavigationBar);
  -[CRLiOSShapeLibraryViewController setP_navigationBar:](self, "setP_navigationBar:", v17);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setTranslucent:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  objc_msgSend(v17, "setBarTintColor:", v18);

  objc_msgSend(v17, "_setHidesShadow:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
  objc_msgSend(v19, "addSubview:", v17);

  v20 = objc_alloc((Class)UINavigationItem);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Shapes"), 0, 0));
  v23 = objc_msgSend(v20, "initWithTitle:", v22);

  v82 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, self, "p_closeButtonTapped:");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Done"), 0, 0));
  objc_msgSend(v82, "setAccessibilityLabel:", v25);

  v83 = v23;
  objc_msgSend(v23, "setRightBarButtonItem:", v82);
  v92 = v23;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1));
  objc_msgSend(v17, "setItems:animated:", v26, 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_createShapeInsertViewController](self, "p_createShapeInsertViewController"));
  -[CRLiOSShapeLibraryViewController setP_shapeInsertViewController:](self, "setP_shapeInsertViewController:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CRLiOSShapeLibraryViewController addChildViewController:](self, "addChildViewController:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  objc_msgSend(v29, "addSubview:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "safeAreaLayoutGuide"));

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v91[0] = v79;
  v73 = v17;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v91[1] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v69 = v27;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
  v91[2] = v70;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
  v91[3] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v35 = v32;
  v78 = v32;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
  v91[4] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
  v91[5] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v45));
  v90 = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v90, 1));
  -[CRLiOSShapeLibraryViewController setP_constraintsForShowingNavigationBar:](self, "setP_constraintsForShowingNavigationBar:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  v89 = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
  -[CRLiOSShapeLibraryViewController setP_constraintsForHidingNavigationBar:](self, "setP_constraintsForHidingNavigationBar:", v52);

  objc_msgSend(v73, "setHidden:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_constraintsForHidingNavigationBar](self, "p_constraintsForHidingNavigationBar"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v53);

  objc_msgSend(v69, "didMoveToParentViewController:", self);
  v54 = -[CRLAccessibilityTimer initWithTargetSerialQueue:]([CRLAccessibilityTimer alloc], "initWithTargetSerialQueue:", &_dispatch_main_q);
  -[CRLiOSShapeLibraryViewController setP_announcementTimer:](self, "setP_announcementTimer:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_announcementTimer](self, "p_announcementTimer"));
  objc_msgSend(v55, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);

  *(_QWORD *)&v57 = objc_opt_class(UITraitUserInterfaceStyle, v56).n128_u64[0];
  v88 = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1, v57));
  v60 = -[CRLiOSShapeLibraryViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v59, self, "p_reloadAllPresetCollectionViewControllers");

  *(_QWORD *)&v62 = objc_opt_class(UITraitPresentationSemanticContext, v61).n128_u64[0];
  v87 = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1, v62));
  v65 = -[CRLiOSShapeLibraryViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v64, self, "p_updateForPresentationSemanticContext");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CRLShapeCollectionDataSource setShowLinesInLibrary:](self->_shapeCollectionDataSource, "setShowLinesInLibrary:", -[CRLiOSShapeLibraryViewController showLinesInLibrary](self, "showLinesInLibrary"));
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSShapeLibraryViewController;
  -[CRLiOSShapeLibraryViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  -[CRLiOSShapeLibraryViewController p_updateForPresentationSemanticContext](self, "p_updateForPresentationSemanticContext");
}

- (void)viewDidAppear:(BOOL)a3
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CRLiOSShapeLibraryViewController;
  -[CRLiOSShapeLibraryViewController viewDidAppear:](&v21, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneWillResignActive](NSNotification, "CRLiOSSceneWillResignActive"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_workspaceWillDeactivate:", v8, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneDidEnterBackground](NSNotification, "CRLiOSSceneDidEnterBackground"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_workspaceDidEnterBackground:", v9, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneDidBecomeActive](NSNotification, "CRLiOSSceneDidBecomeActive"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_workspaceDidActivate:", v10, v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "changeNotifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController associatedBoardItems](self, "associatedBoardItems"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentContainerItem"));
  objc_msgSend(v12, "addObserver:forChangeSource:", self, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController associatedBoardItems](self, "associatedBoardItems"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crl_firstObjectPassingTest:", &stru_101243378));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "changeNotifier"));
  objc_msgSend(v20, "addObserver:forChangeSource:", self, v18);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneWillResignActive](NSNotification, "CRLiOSSceneWillResignActive"));
  objc_msgSend(v8, "removeObserver:name:object:", self, v9, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneDidEnterBackground](NSNotification, "CRLiOSSceneDidEnterBackground"));
  objc_msgSend(v8, "removeObserver:name:object:", self, v10, v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneDidBecomeActive](NSNotification, "CRLiOSSceneDidBecomeActive"));
  objc_msgSend(v8, "removeObserver:name:object:", self, v11, v7);

  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapeLibraryViewController;
  -[CRLiOSShapeLibraryViewController viewWillDisappear:](&v12, "viewWillDisappear:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
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
  objc_super v16;

  v3 = a3;
  -[CRLiOSShapeLibraryViewController setP_didDragOutsidePopover:](self, "setP_didDragOutsidePopover:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeSearchResultsCollection](self, "p_shapeSearchResultsCollection"));
  objc_msgSend(v5, "setSearchTerm:completionHandler:", 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "changeNotifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController associatedBoardItems](self, "associatedBoardItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentContainerItem"));
  objc_msgSend(v7, "removeObserver:forChangeSource:", self, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController associatedBoardItems](self, "associatedBoardItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crl_firstObjectPassingTest:", &stru_101243398));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "changeNotifier"));
  objc_msgSend(v15, "removeObserver:forChangeSource:", self, v13);

  -[CRLiOSShapeLibraryViewController setAssociatedBoardItems:](self, "setAssociatedBoardItems:", 0);
  v16.receiver = self;
  v16.super_class = (Class)CRLiOSShapeLibraryViewController;
  -[CRLiOSShapeLibraryViewController viewDidDisappear:](&v16, "viewDidDisappear:", v3);

}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "userInterfaceIdiom") != (id)1)
  {

    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController presentingViewController](self, "presentingViewController"));

  if (!v4)
  {
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)CRLiOSShapeLibraryViewController;
    -[CRLiOSShapeLibraryViewController preferredContentSize](&v7, "preferredContentSize");
    goto LABEL_6;
  }
  v5 = 496.0;
  v6 = 375.0;
LABEL_6:
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapeLibraryViewController;
  -[CRLiOSShapeLibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));
  v9 = objc_msgSend(v8, "isViewLoaded");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));
    objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E3DBC;
  v11[3] = &unk_10123ACD8;
  v11[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);

}

- (void)p_workspaceWillDeactivate:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view", a3));
  objc_msgSend(v6, "frame");
  -[CRLiOSShapeLibraryViewController setP_cachedViewFrameSize:](self, "setP_cachedViewFrameSize:", v4, v5);

}

- (void)p_workspaceDidEnterBackground:(id)a3
{
  -[CRLiOSShapeLibraryViewController setP_didEnterBackground:](self, "setP_didEnterBackground:", 1);
}

- (void)p_workspaceDidActivate:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;

  if (!-[CRLiOSShapeLibraryViewController p_didEnterBackground](self, "p_didEnterBackground", a3))
    goto LABEL_7;
  -[CRLiOSShapeLibraryViewController setP_didEnterBackground:](self, "setP_didEnterBackground:", 0);
  -[CRLiOSShapeLibraryViewController p_cachedViewFrameSize](self, "p_cachedViewFrameSize");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  if (v5 == v10 && v7 == v12)
  {
LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pages](self, "p_pages"));
    -[CRLiOSShapeLibraryViewController p_reloadPagesIfNeeded:](self, "p_reloadPagesIfNeeded:", v14);

  }
  else
  {
    -[CRLiOSShapeLibraryViewController p_reloadAllPresetCollectionViewControllers](self, "p_reloadAllPresetCollectionViewControllers");
  }
  -[CRLiOSShapeLibraryViewController p_setAllPresetCollectionViewControllersHidden:](self, "p_setAllPresetCollectionViewControllersHidden:", 0);
}

- (void)p_updateForPresentationSemanticContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "_presentationSemanticContext");

  if (v4 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_navigationBar](self, "p_navigationBar"));
    objc_msgSend(v7, "setHidden:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_constraintsForShowingNavigationBar](self, "p_constraintsForShowingNavigationBar"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_constraintsForHidingNavigationBar](self, "p_constraintsForHidingNavigationBar"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController view](self, "view"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_navigationBar](self, "p_navigationBar"));
    objc_msgSend(v12, "setHidden:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_constraintsForHidingNavigationBar](self, "p_constraintsForHidingNavigationBar"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v13);

    v9 = objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_constraintsForShowingNavigationBar](self, "p_constraintsForShowingNavigationBar"));
  }
  v14 = (id)v9;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");

}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  objc_opt_class(_TtC8Freeform16CRLContainerItem, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    objc_opt_class(_TtC8Freeform16CRLContainerItem, v10);
    v12 = sub_1002223BC(v11, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController associatedBoardItems](self, "associatedBoardItems"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001E41C8;
    v19[3] = &unk_1012433C0;
    v16 = v13;
    v20 = v16;
    if ((objc_msgSend(v15, "crl_allObjectsPassTest:", v19) & 1) == 0)
      -[CRLiOSShapeLibraryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v10);
    if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001E421C;
      v18[3] = &unk_1012433E8;
      v18[4] = self;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
    }
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[CRLiOSShapeLibraryViewController setP_infoIsInsertingViaDrag:](self, "setP_infoIsInsertingViaDrag:", 0, a4);
}

- (id)p_editingCoordinator
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingCoordinatorForShapeLibraryViewController:", self));

  return v4;
}

- (id)p_boardItemFactory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_editingCoordinator](self, "p_editingCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "boardItemFactory"));

  return v3;
}

- (id)p_interactiveCanvasController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasControllerForShapeLibraryViewController:", self));

  return v4;
}

- (id)insertPageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  char *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pages](self, "p_pages"));
  objc_opt_class(CRLiOSPresetCollectionViewController, v9);
  v11 = sub_1002223BC(v10, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (char *)objc_msgSend(v8, "indexOfObject:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v14 != v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243408);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A718();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243428);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:viewControllerBeforeViewController:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 411, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = 0;
  }
  else
  {
    v18 = 0;
    if ((unint64_t)objc_msgSend(v8, "count") >= 2 && v13)
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v13 - 1));
  }

  return v18;
}

- (id)insertPageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  char *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pages](self, "p_pages"));
  objc_opt_class(CRLiOSPresetCollectionViewController, v9);
  v11 = sub_1002223BC(v10, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (char *)objc_msgSend(v8, "indexOfObject:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v14 != v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243448);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A798();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243468);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:viewControllerAfterViewController:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 428, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL
    || (unint64_t)objc_msgSend(v8, "count") < 2
    || v13 >= (char *)objc_msgSend(v8, "count") - 1)
  {
    v18 = 0;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v13 + 1));
  }

  return v18;
}

- (id)insertPageViewController:(id)a3 viewControllerForPageAtIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v7 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243488);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A818();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012434A8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:viewControllerForPageAtIndex:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 441, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pages](self, "p_pages"));
  if ((unint64_t)objc_msgSend(v11, "count") <= a4)
    v12 = 0;
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", a4));

  return v12;
}

- (id)insertPageViewControllerViewControllerForSearch:(id)a3
{
  CRLiOSPresetCollectionViewController *v4;

  v4 = -[CRLiOSPresetCollectionViewController initWithPresetCollectionType:delegate:]([CRLiOSPresetCollectionViewController alloc], "initWithPresetCollectionType:delegate:", 0, self);
  -[CRLiOSShapeLibraryViewController setP_searchViewController:](self, "setP_searchViewController:", v4);
  return v4;
}

- (unint64_t)presentationCountForInsertPageViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012434C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A898();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012434E8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController presentationCountForInsertPageViewController:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 457, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pages](self, "p_pages"));
  v10 = objc_msgSend(v9, "count");

  return (unint64_t)v10;
}

- (unint64_t)insertPageViewController:(id)a3 presentationIndexForViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  unint64_t v16;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v8 != v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243508);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A918();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243528);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:presentationIndexForViewController:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 462, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  objc_opt_class(CRLiOSPresetCollectionViewController, v9);
  v14 = sub_1002223BC(v13, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = -[CRLiOSShapeLibraryViewController p_pageNumberForPresetCollectionViewController:](self, "p_pageNumberForPresetCollectionViewController:", v15);
  return v16;
}

- (unint64_t)selectedSubpageIndexForInsertPageViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243548);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A998();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243568);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController selectedSubpageIndexForInsertPageViewController:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 469, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  return 0;
}

- (void)insertPageViewController:(id)a3 didSelectPageNumber:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedPageNumberAutosaveName"));
  -[CRLiOSShapeLibraryViewController p_setIntegerDefault:forKey:](self, "p_setIntegerDefault:forKey:", a4, v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));
  if (v8 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243588);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AA18();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012435A8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:didSelectPageNumber:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 480, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pages](self, "p_pages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a4));

  objc_msgSend(v13, "accessibilityFocusFirstVisiblePreset");
}

- (void)insertPageViewController:(id)a3 didSelectSubpageAtIndex:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v6 != v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012435C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AA98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012435E8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:didSelectSubpageAtIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 487, 0, "Delegate callback called for unexpected insert page view controller.");

  }
}

- (void)insertPageViewControllerWillBeginSearch:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243608);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AB18();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243628);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerWillBeginSearch:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 492, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  objc_msgSend(v9, "shapeLibraryViewControllerWillBeginSearch:", self);

}

- (void)insertPageViewControllerDidBeginSearch:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243648);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AB98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243668);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerDidBeginSearch:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 497, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  -[CRLiOSShapeLibraryViewController setP_searchState:](self, "setP_searchState:", 1);
}

- (BOOL)insertPageViewControllerShouldChangeSearchText:(id)a3
{
  return !-[CRLiOSShapeLibraryViewController p_didDragOutsidePopover](self, "p_didDragOutsidePopover", a3);
}

- (void)insertPageViewController:(id)a3 willSearchWithText:(id)a4 inViewController:(id)a5 searchViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29[3];
  BOOL v30;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v14 != v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243688);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0ACB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012436A8);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AC18(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:willSearchWithText:inViewController:searchViewController:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 506, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  v18 = -[CRLiOSShapeLibraryViewController p_searchState](self, "p_searchState");
  if (objc_msgSend(v11, "length"))
    v19 = 2;
  else
    v19 = 1;
  v20 = -[CRLiOSShapeLibraryViewController p_searchState](self, "p_searchState");
  if (v20 != v19)
    -[CRLiOSShapeLibraryViewController setP_searchState:](self, "setP_searchState:", v19);
  objc_initWeak(&location, self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeSearchResultsCollection](self, "p_shapeSearchResultsCollection"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001E5B50;
  v25[3] = &unk_1012436D0;
  v30 = v20 != v19;
  v22 = v12;
  v26 = v22;
  v29[1] = v18;
  v29[2] = (id)v19;
  v23 = v13;
  v27 = v23;
  v24 = v11;
  v28 = v24;
  objc_copyWeak(v29, &location);
  objc_msgSend(v21, "setSearchTerm:completionHandler:", v24, v25);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

- (void)insertPageViewControllerWillEndSearch:(id)a3 cancelledExplicitly:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v6 != v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012436F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AD38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243710);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerWillEndSearch:cancelledExplicitly:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 546, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  -[CRLiOSShapeLibraryViewController setP_searchState:](self, "setP_searchState:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeSearchResultsCollection](self, "p_shapeSearchResultsCollection"));
  objc_msgSend(v10, "setSearchTerm:completionHandler:", 0, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  objc_msgSend(v11, "shapeLibraryViewControllerDidCancelSearch:", self);

}

- (void)insertPageViewControllerDidEndSearch:(id)a3 cancelledExplicitly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v7 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243730);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0ADB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243750);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerDidEndSearch:cancelledExplicitly:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 553, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  if (v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
    objc_msgSend(v12, "becomeFirstResponder");

  }
}

- (BOOL)insertPageViewControllerShouldAppearInSearchMode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243770);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AE38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243790);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerShouldAppearInSearchMode:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 560, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  v10 = objc_msgSend(v9, "shapeLibraryViewControllerShouldAppearInSearchMode:", self);

  return v10;
}

- (void)insertPageViewControllerWillDisappear:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012437B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AEB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012437D0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerWillDisappear:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 565, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  if ((id)-[CRLiOSShapeLibraryViewController p_searchState](self, "p_searchState") == (id)2
    || (id)-[CRLiOSShapeLibraryViewController p_searchState](self, "p_searchState") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeSearchResultsCollection](self, "p_shapeSearchResultsCollection"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchTerm"));

    v11 = &stru_1012A72B0;
    if (v10)
      v11 = v10;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  objc_msgSend(v13, "shapeLibraryViewController:willDisappearWithSearchTerm:", self, v12);

}

- (id)insertPageViewControllerDefaultSearchTerm:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012437F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0AF38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243810);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerDefaultSearchTerm:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 575, 0, "Delegate callback called for unexpected insert page view controller.");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shapeLibraryViewControllerDefaultSearchTerm:", self));

  return v10;
}

- (BOOL)allowsInsertDrag
{
  CRLiOSShapeLibraryViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  LOBYTE(v2) = objc_msgSend(v3, "shapeLibraryViewControllerShouldAllowInsertDrag:", v2);

  return (char)v2;
}

- (id)backgroundColorForPresetCollectionViewController:(id)a3
{
  return +[UIColor clearColor](UIColor, "clearColor", a3);
}

- (id)contextWithPresetCollectionViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  _BOOL8 v12;
  CRLiOSPresetCollectionContext *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CRLiOSPresetCollectionContext *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v5, "userInterfaceIdiom") == (id)1
    && (v6 = objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController presentingViewController](self, "presentingViewController"))) != 0)
  {
    v7 = (void *)v6;
    -[CRLiOSShapeLibraryViewController p_contentSize](self, "p_contentSize");
    v9 = v8;

    if (v9 <= 496.0)
    {
      v10 = 1;
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (-[CRLiOSShapeLibraryViewController p_isSidebarLike](self, "p_isSidebarLike"))
    v10 = 2;
  else
    v10 = 0;
LABEL_9:
  v11 = -[CRLiOSShapeLibraryViewController p_pageNumberForPresetCollectionViewController:](self, "p_pageNumberForPresetCollectionViewController:", v4);
  v12 = (id)-[CRLiOSShapeLibraryViewController p_searchState](self, "p_searchState") == (id)2;
  v13 = [CRLiOSPresetCollectionContext alloc];
  -[CRLiOSShapeLibraryViewController p_contentSize](self, "p_contentSize");
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_editingCoordinator](self, "p_editingCoordinator"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController traitCollection](self, "traitCollection"));
  v20 = -[CRLiOSPresetCollectionContext initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:](v13, "initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:", v10, v18, v12, v11, 0, v19, v15, v17);

  return v20;
}

- (void)presetCollectionViewController:(id)a3 didSelectPresetAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_editingCoordinator](self, "p_editingCoordinator"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E69E8;
  v11[3] = &unk_101243838;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "canPerformUserActionUsingBlock:", v11);

}

- (void)p_changeSelectedShapesToItemAtIndexPath:(id)a3 forPresetCollectionViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
  *(_QWORD *)&v10 = objc_opt_class(CRLShapeEditor, v9).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostSpecificCurrentEditorOfClass:", v11, v10));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController contextWithPresetCollectionViewController:](self, "contextWithPresetCollectionViewController:", v6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeAtIndexPath:context:](self, "p_shapeAtIndexPath:context:", v19, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathSourceWithSize:", 100.0, 100.0));
    +[CRLShapeLibraryPopoverHelper changeShapeForEditor:shapePathSource:interactiveCanvasController:](_TtC8Freeform28CRLShapeLibraryPopoverHelper, "changeShapeForEditor:shapePathSource:interactiveCanvasController:", v12, v15, v7);

  }
  -[CRLiOSShapeLibraryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (-[CRLiOSShapeLibraryViewController p_isCompact](self, "p_isCompact"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "miniFormatterPresenter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
    objc_msgSend(v17, "presentMiniFormatterForSelectionPath:", v18);

  }
}

- (id)itemsForBeginningDragSessionForPresetCollectionViewController:(id)a3 forCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  objc_class *v12;
  objc_class *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  CRLSwatchRenderingContext *v49;
  CRLItemProviderItemWriter *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[6];
  _QWORD v55[7];
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  void *v61;
  void *v62;

  v8 = a3;
  v52 = a4;
  v9 = a5;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController contextWithPresetCollectionViewController:](self, "contextWithPresetCollectionViewController:", v8));
  *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v10).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_boardItemForPresetCollectionType:atIndexPath:context:](self, "p_boardItemForPresetCollectionType:atIndexPath:context:", objc_msgSend(v8, "presetCollectionType", v11), v9, v53));
  v15 = sub_1002223BC(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    v50 = objc_alloc_init(CRLItemProviderItemWriter);
    v62 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLItemProviderItemWriter createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:](v50, "createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:", v17, v18, 0));

    if (v51)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cellForItemAtIndexPath:", v9));
      objc_opt_class(UICollectionViewCell, v20);
      v27 = sub_1002220C8(v19, v21, 1, v22, v23, v24, v25, v26, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x3032000000;
      v58[3] = sub_1001E7240;
      v58[4] = sub_1001E7250;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "presetButton"));
      v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageView"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeAtIndexPath:context:](self, "p_shapeAtIndexPath:context:", v9, v53));
      v31 = (unint64_t)objc_msgSend(v30, "shapeType");

      v49 = objc_alloc_init(CRLSwatchRenderingContext);
      if (v31 <= 0x14 && ((1 << v31) & 0x1D8006) != 0)
      {
        v32 = 45.0;
      }
      else if ((v31 & 0xFFFFFFFFFFFFFFEFLL) == 2 || v31 == 19)
      {
        v32 = 45.0;
      }
      else
      {
        v32 = 0.0;
      }
      v56[0] = 0;
      v56[1] = v56;
      v56[2] = 0x3032000000;
      v56[3] = sub_1001E7240;
      v56[4] = sub_1001E7250;
      v57 = 0;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwatchCache swatchCache](CRLSwatchCache, "swatchCache"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "presetButton"));
      objc_msgSend(v34, "bounds");
      v36 = v35;
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathSource"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_editingCoordinator](self, "p_editingCoordinator"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "shapeItemWithPresetsForSize:shapeType:shapePathSource:angle:editingCoordinator:renderingContext:", v31, v39, v40, v49, v36, v38, v32));

      v61 = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1001E7258;
      v55[3] = &unk_1012438A0;
      v55[4] = v41;
      v55[5] = v56;
      v55[6] = v31;
      +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:useInBlock:](CRLCanvasLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v42, v55);

      v43 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v51);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1001E760C;
      v54[3] = &unk_1012438C8;
      v54[4] = v56;
      v54[5] = v58;
      objc_msgSend(v43, "setPreviewProvider:", v54);
      v60 = v43;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));

      _Block_object_dispose(v56, 8);
      _Block_object_dispose(v58, 8);

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243858);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0B058();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243878);
      v45 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0AFB8(v45);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController itemsForBeginningDragSessionForPresetCollectionViewController:forCollectionView:atIndexPath:]"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v46, 687, 0, "invalid nil value for '%{public}s'", "itemProvider");

      v44 = &__NSArray0__struct;
    }

  }
  else
  {
    v44 = &__NSArray0__struct;
  }

  return v44;
}

- (BOOL)staysOpenOnSelectionChange
{
  if (-[CRLiOSShapeLibraryViewController p_canInsertAndConnectBoardItemToSelectedConnectionLine:](self, "p_canInsertAndConnectBoardItemToSelectedConnectionLine:", 0))
  {
    return 0;
  }
  else
  {
    return !-[CRLiOSShapeLibraryViewController p_shouldChangeSelectedShapes](self, "p_shouldChangeSelectedShapes");
  }
}

- (id)p_boardItemForPresetCollectionType:(unint64_t)a3 atIndexPath:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_boardItemFactory](self, "p_boardItemFactory"));
  if (a3)
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInfoAtIndexPath:boardItemFactory:context:](self, "p_shapeInfoAtIndexPath:boardItemFactory:context:", v8, v10, v9));

  return v11;
}

- (id)p_shapeInfoAtIndexPath:(id)a3 boardItemFactory:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v38;
  void *v39;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeAtIndexPath:context:](self, "p_shapeAtIndexPath:context:", a3, a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathSourceWithSize:", 100.0, 100.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionModelTranslator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "infosForSelectionPath:", v14));

  *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v16).n128_u64[0];
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject", v17));
  v21 = sub_100221D0C(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  *(_QWORD *)&v24 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v23).n128_u64[0];
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "board", v24));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getConnectedFromWithBoardItemOwner:", v27));
  if (v28)
  {
    v29 = sub_100221D0C(v26, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  }
  else
  {
    v38 = v8;
    v39 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "board"));
    v32 = v10;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getConnectedToWithBoardItemOwner:", v31));
    v34 = sub_100221D0C(v26, v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v34);

    v10 = v32;
    v8 = v38;
    v9 = v39;
  }

  if (!-[CRLiOSShapeLibraryViewController showLinesInLibrary](self, "showLinesInLibrary")
    && v22
    && v30
    && objc_msgSend(v15, "count") == (id)1)
  {
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "makeShapeItemForDiagramWithConnectingTo:with:shapeType:", v30, v10, objc_msgSend(v9, "shapeType")));
  }
  else
  {
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "makeShapeItemWithShapeType:pathSource:", objc_msgSend(v9, "shapeType"), v10));
  }
  v36 = (void *)v35;

  return v36;
}

- (void)p_insertShapeAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD);
  void *v35;
  void *v36;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_boardItemFactory](self, "p_boardItemFactory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commandController"));
  objc_msgSend(v10, "openGroup");
  objc_msgSend(v10, "enableProgressiveEnqueuingInCurrentGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeAtIndexPath:context:](self, "p_shapeAtIndexPath:context:", v7, v6));
  v12 = objc_msgSend(v11, "shapeType");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInfoAtIndexPath:boardItemFactory:context:](self, "p_shapeInfoAtIndexPath:boardItemFactory:context:", v7, v8, v6));
  objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "infosToConnect"));
    v19 = objc_msgSend(v18, "count");

    if (v19 == (id)2)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "connectionLineItemToUseForConnecting"));

      if (v21)
      {
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "makeDuplicateOfBoardItem:", v21));
        v23 = (void *)v22;
        if (v22)
          v24 = (void *)v22;
        else
          v24 = v13;
        v25 = v24;

        v13 = v25;
      }

    }
  }
  objc_opt_class(_TtC8Freeform12CRLShapeItem, v16);
  v27 = sub_100221D0C(v26, v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v28)
  {
    if (v12 == (id)21)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pathSource"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizationKey"));

    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBasicShapeLibraryShape baseNameForShapeType:](CRLBasicShapeLibraryShape, "baseNameForShapeType:", v12));
    }
    +[CRLAnalyticsShapeInserted sendShapeInsertedAnalyticsWithShapeIdentifier:isMiniShapePicker:](_TtC8Freeform25CRLAnalyticsShapeInserted, "sendShapeInsertedAnalyticsWithShapeIdentifier:isMiniShapePicker:", v31, 0);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "infosToConnect"));
  v34 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "blockToRunCommandToPostProcessWithNewBoardItem:shapeType:infosToConnect:commandController:", v13, v12, v33, v10));

  v36 = v13;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  -[CRLiOSShapeLibraryViewController p_positionAndInsertBoardItems:](self, "p_positionAndInsertBoardItems:", v35);

  v34[2](v34);
  objc_msgSend(v10, "closeGroup");
  -[CRLiOSShapeLibraryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)p_isCompact
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardViewControllerTraitCollectionForShapeLibraryViewController:", self));

  if ((objc_msgSend(v4, "crl_isCompactWidth") & 1) != 0)
    v5 = 1;
  else
    v5 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");

  return v5;
}

- (id)p_pages
{
  return -[CRLiOSShapeLibraryViewController p_pagesForSegment:](self, "p_pagesForSegment:", 0);
}

- (id)p_pagesForSegment:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_allPresetCollectionViewControllers](self, "p_allPresetCollectionViewControllers"));
  v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)objc_msgSend(v5, "count") <= a3)
  {
    v8 = &__NSArray0__struct;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_allPresetCollectionViewControllers](self, "p_allPresetCollectionViewControllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  return v8;
}

- (id)p_createShapeInsertViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pagesForPresetCollectionType:](self, "p_pagesForPresetCollectionType:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pageViewControllerWithPages:presetCollectionType:](self, "p_pageViewControllerWithPages:presetCollectionType:", v3, 0));
  v7 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[CRLiOSShapeLibraryViewController setP_allPresetCollectionViewControllers:](self, "setP_allPresetCollectionViewControllers:", v5);

  return v4;
}

- (unint64_t)p_totalNumberOfPagesNeededForPresetCollectionType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012438E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0B0EC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243908);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_totalNumberOfPagesNeededForPresetCollectionType:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 910, 0, "This method only knows how to count pages of shapes.");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categoryNames"));
  v9 = objc_msgSend(v8, "count");

  return (unint64_t)v9;
}

- (id)p_pagesForPresetCollectionType:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  CRLiOSPresetCollectionViewController *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  unsigned int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;

  v5 = -[CRLiOSShapeLibraryViewController p_totalNumberOfPagesNeededForPresetCollectionType:](self, "p_totalNumberOfPagesNeededForPresetCollectionType:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v5));
  if (v5)
  {
    v7 = v5;
    do
    {
      v8 = -[CRLiOSPresetCollectionViewController initWithPresetCollectionType:delegate:]([CRLiOSPresetCollectionViewController alloc], "initWithPresetCollectionType:delegate:", a3, self);
      objc_msgSend(v6, "addObject:", v8);

      --v7;
    }
    while (v7);
  }
  if (!objc_msgSend(v6, "count"))
  {
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243928);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      v16 = v9;
      v17 = 2082;
      v18 = "-[CRLiOSShapeLibraryViewController p_pagesForPresetCollectionType:]";
      v19 = 2082;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m";
      v21 = 1024;
      v22 = 924;
      v23 = 2048;
      v24 = a3;
      v25 = 2048;
      v26 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Insert pages are empty for type %zi! Requested %zi pages.", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243948);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_pagesForPresetCollectionType:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 924, 0, "Insert pages are empty for type %zi! Requested %zi pages.", a3, v5);

  }
  return v6;
}

- (id)p_pageViewControllerWithPages:(id)a3 presetCollectionType:(unint64_t)a4
{
  id v6;
  CRLiOSInsertPageViewController *v7;
  CRLiOSInsertPageViewController *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v6 = a3;
  v7 = -[CRLiOSInsertPageViewController initWithTransitionStyle:navigationOrientation:options:]([CRLiOSInsertPageViewController alloc], "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
  v8 = v7;
  v9 = 0;
  if (!a4)
  {
    -[CRLiOSInsertPageViewController setSelectedPageNumberAutosaveName:](v7, "setSelectedPageNumberAutosaveName:", CFSTR("CRLiOSInsertPageViewControllerSelectedPageShapes"));
    -[CRLiOSInsertPageViewController setSelectedSubpageAutosaveName:](v8, "setSelectedSubpageAutosaveName:", CFSTR("CRLiOSInsertPageViewControllerSelectedSubpageShapes"));
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController selectedPageNumberAutosaveName](v8, "selectedPageNumberAutosaveName"));
  v11 = -[CRLiOSShapeLibraryViewController p_integerDefaultForKey:](self, "p_integerDefaultForKey:", v10);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < (unint64_t)objc_msgSend(v6, "count"))
    v9 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v9));
  -[CRLiOSInsertPageViewController setInsertPageViewControllerDataSource:](v8, "setInsertPageViewControllerDataSource:", self);
  -[CRLiOSInsertPageViewController setInsertPageViewControllerDelegate:](v8, "setInsertPageViewControllerDelegate:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
  -[CRLiOSInsertPageViewController setInsertPageViewControllerNavigationDataSource:](v8, "setInsertPageViewControllerNavigationDataSource:", v13);

  -[CRLiOSShapeLibraryViewController preferredContentSize](self, "preferredContentSize");
  -[CRLiOSInsertPageViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
  v16 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  -[CRLiOSInsertPageViewController setViewControllers:](v8, "setViewControllers:", v14);

  return v8;
}

- (void)p_reloadPages:(id)a3
{
  objc_msgSend(a3, "makeObjectsPerformSelector:", "reloadData");
}

- (void)p_reloadPagesIfNeeded:(id)a3
{
  objc_msgSend(a3, "makeObjectsPerformSelector:", "reloadDataIfNeeded");
}

- (unint64_t)p_pageNumberForPresetCollectionViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_pages](self, "p_pages"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return (unint64_t)v6;
}

- (void)p_reloadAllPresetCollectionViewControllers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
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

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_allPresetCollectionViewControllers](self, "p_allPresetCollectionViewControllers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v7);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), "reloadData");
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v11);
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_searchViewController](self, "p_searchViewController"));
  objc_msgSend(v14, "reloadData");

}

- (void)p_setAllPresetCollectionViewControllersHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_allPresetCollectionViewControllers](self, "p_allPresetCollectionViewControllers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1)
                                                                                 + 8 * (_QWORD)v14), "view"));
              objc_msgSend(v15, "setHidden:", v3);

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

}

- (void)p_setIntegerDefault:(unint64_t)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v7, "setObject:forKey:", v6, v5);

}

- (unint64_t)p_integerDefaultForKey:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(NSNumber, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v3));

  v10 = sub_1002223BC(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
    v12 = (unint64_t)objc_msgSend(v11, "integerValue");
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;

  return v12;
}

- (CGSize)p_contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeInsertViewController](self, "p_shapeInsertViewController"));
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)p_isSidebarLike
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;

  -[CRLiOSShapeLibraryViewController p_contentSize](self, "p_contentSize");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom") == (id)1
    && objc_msgSend(v7, "verticalSizeClass") == (id)2
    && objc_msgSend(v7, "horizontalSizeClass") == (id)1
    && v6 >= 736.0
    && v4 <= 375.0;

  return v8;
}

- (void)p_closeButtonTapped:(id)a3
{
  -[CRLiOSShapeLibraryViewController p_dismissIfNeededWithBlock:](self, "p_dismissIfNeededWithBlock:", 0);
}

- (void)p_dismissIfNeededWithBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[CRLiOSShapeLibraryViewController p_isCompact](self, "p_isCompact"))
  {
    -[CRLiOSShapeLibraryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
  }
  else if (v4)
  {
    v4[2]();
  }

}

- (BOOL)p_canInsertAndConnectBoardItemToSelectedConnectionLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  unsigned __int8 v14;
  BOOL v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  *(_QWORD *)&v8 = objc_opt_class(CRLConnectionLineEditor, v7).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostSpecificCurrentEditorOfClass:", v9, v8));

  if (!v10
    || ((-[CRLiOSShapeLibraryViewController p_unscaledPopoverAnchorPoint](self, "p_unscaledPopoverAnchorPoint"),
         v12 == INFINITY)
      ? (v13 = v11 == INFINITY)
      : (v13 = 0),
        v13))
  {
    v15 = 0;
  }
  else
  {
    if (v4)
      v14 = objc_msgSend(v10, "canHandleInsertAndConnectBoardItem:", v4);
    else
      v14 = objc_msgSend(v10, "currentSelectionIsValidForInsertAndConnectBoardItem");
    v15 = v14;
  }

  return v15;
}

- (void)p_positionAndInsertBoardItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext nonInteractiveInsertionContext](CRLInsertionContext, "nonInteractiveInsertionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_interactiveCanvasController](self, "p_interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  *(_QWORD *)&v9 = objc_opt_class(CRLConnectionLineEditor, v8).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mostSpecificCurrentEditorOfClass:", v10, v9));

  if (objc_msgSend(v4, "count") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v13 = -[CRLiOSShapeLibraryViewController p_canInsertAndConnectBoardItemToSelectedConnectionLine:](self, "p_canInsertAndConnectBoardItemToSelectedConnectionLine:", v12);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyConnectionLine"));
      v16 = (void *)v15;
      if (v11)
      {
        if (v15)
        {
LABEL_31:
          objc_msgSend(v11, "insertAndConnectBoardItem:postProcessBlock:", v14, 0);
          +[CRLInsertionAnimationHelper addInsertionAnimationsToInfo:connectionLineLayout:onInteractiveCanvasController:](_TtC8Freeform27CRLInsertionAnimationHelper, "addInsertionAnimationsToInfo:connectionLineLayout:onInteractiveCanvasController:", v14, v16, v6);

          goto LABEL_32;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101243968);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0B200();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101243988);
        v26 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_positionAndInsertBoardItems:]"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 1065, 0, "invalid nil value for '%{public}s'", "connectionLineEditor");

        if (v16)
          goto LABEL_31;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012439A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0B16C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012439C8);
      v29 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_positionAndInsertBoardItems:]"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 1066, 0, "invalid nil value for '%{public}s'", "selectedConnectionLineLayout");

      goto LABEL_31;
    }
  }
  -[CRLiOSShapeLibraryViewController p_unscaledPopoverAnchorPoint](self, "p_unscaledPopoverAnchorPoint");
  if (v18 != INFINITY || v17 != INFINITY)
  {
    -[CRLiOSShapeLibraryViewController p_unscaledPopoverAnchorPoint](self, "p_unscaledPopoverAnchorPoint");
    if ((sub_1000637EC() & 1) == 0)
    {
      -[CRLiOSShapeLibraryViewController p_unscaledPopoverAnchorPoint](self, "p_unscaledPopoverAnchorPoint");
      v20 = objc_claimAutoreleasedReturnValue(+[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL));

      v5 = (void *)v20;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  *(_QWORD *)&v23 = objc_opt_class(NSObject, v22).n128_u64[0];
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mostSpecificCurrentEditorOfClass:conformingToProtocol:", v24, &OBJC_PROTOCOL___CRLBoardItemInsertionEditor, v23));

  objc_msgSend(v25, "prepareGeometryForInsertingBoardItems:withInsertionContext:", v4, v5);
  objc_msgSend(v25, "insertBoardItems:withInsertionContext:postProcessBlock:", v4, v5, 0);
  +[CRLInsertionAnimationHelper addInsertionAnimationsToInfos:onInteractiveCanvasController:](_TtC8Freeform27CRLInsertionAnimationHelper, "addInsertionAnimationsToInfos:onInteractiveCanvasController:", v4, v6);

LABEL_32:
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_delegate](self, "p_delegate"));
  objc_msgSend(v32, "shapeLibraryViewController:didInsertBoardItems:", self, v4);

}

- (id)p_shapeAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v6, "isSearching") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeSearchResultsCollection](self, "p_shapeSearchResultsCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shapeAtIndexPath:", v7));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
    v10 = objc_msgSend(v7, "row");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shapeAtIndex:categoryIndex:", v10, objc_msgSend(v6, "pageIndex")));
  }

  return v9;
}

- (id)p_shapeWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
  v9 = objc_msgSend(v6, "pageIndex");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shapeWithIdentifier:categoryIndex:", v7, v9));
  return v10;
}

- (void)p_shapeLibraryIndexingDidFinish:(id)a3
{
  void *v4;
  id v5;

  if (-[CRLiOSShapeLibraryViewController p_searchState](self, "p_searchState", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_shapeSearchResultsCollection](self, "p_shapeSearchResultsCollection"));
    objc_msgSend(v4, "resetSearchResults");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSShapeLibraryViewController p_searchViewController](self, "p_searchViewController"));
    objc_msgSend(v5, "reloadData");

  }
}

- (CRLiOSInsertPageViewController)p_shapeInsertViewController
{
  return self->_shapeInsertViewController;
}

- (void)setP_shapeInsertViewController:(id)a3
{
  objc_storeStrong((id *)&self->_shapeInsertViewController, a3);
}

- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource
{
  return self->_shapeCollectionDataSource;
}

- (void)setP_shapeCollectionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_shapeCollectionDataSource, a3);
}

- (CRLShapeSearchResultsCollection)p_shapeSearchResultsCollection
{
  return self->_shapeSearchResultsCollection;
}

- (void)setP_shapeSearchResultsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_shapeSearchResultsCollection, a3);
}

- (NSArray)p_allPresetCollectionViewControllers
{
  return self->_allPresetCollectionViewControllers;
}

- (void)setP_allPresetCollectionViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CGSize)p_cachedViewFrameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedViewFrameSize.width;
  height = self->_cachedViewFrameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setP_cachedViewFrameSize:(CGSize)a3
{
  self->_cachedViewFrameSize = a3;
}

- (CRLiOSShapeLibraryViewControllerDelegate)p_delegate
{
  return (CRLiOSShapeLibraryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setP_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)p_didEnterBackground
{
  return self->_didEnterBackground;
}

- (void)setP_didEnterBackground:(BOOL)a3
{
  self->_didEnterBackground = a3;
}

- (BOOL)p_dragEnded
{
  return self->_dragEnded;
}

- (void)setP_dragEnded:(BOOL)a3
{
  self->_dragEnded = a3;
}

- (UIView)p_draggingView
{
  return self->_draggingView;
}

- (void)setP_draggingView:(id)a3
{
  objc_storeStrong((id *)&self->_draggingView, a3);
}

- (BOOL)p_infoIsInsertingViaDrag
{
  return self->_infoIsInsertingViaDrag;
}

- (void)setP_infoIsInsertingViaDrag:(BOOL)a3
{
  self->_infoIsInsertingViaDrag = a3;
}

- (unint64_t)p_searchState
{
  return self->_searchState;
}

- (void)setP_searchState:(unint64_t)a3
{
  self->_searchState = a3;
}

- (CRLiOSPresetCollectionViewController)p_searchViewController
{
  return self->_searchViewController;
}

- (void)setP_searchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchViewController, a3);
}

- (CRLAccessibilityTimer)p_announcementTimer
{
  return self->_announcementTimer;
}

- (void)setP_announcementTimer:(id)a3
{
  objc_storeStrong((id *)&self->_announcementTimer, a3);
}

- (BOOL)p_didDragOutsidePopover
{
  return self->_didDragOutsidePopover;
}

- (void)setP_didDragOutsidePopover:(BOOL)a3
{
  self->_didDragOutsidePopover = a3;
}

- (UINavigationBar)p_navigationBar
{
  return self->_navigationBar;
}

- (void)setP_navigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (NSArray)p_constraintsForShowingNavigationBar
{
  return self->_constraintsForShowingNavigationBar;
}

- (void)setP_constraintsForShowingNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsForShowingNavigationBar, a3);
}

- (NSArray)p_constraintsForHidingNavigationBar
{
  return self->_constraintsForHidingNavigationBar;
}

- (void)setP_constraintsForHidingNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsForHidingNavigationBar, a3);
}

- (BOOL)p_shouldChangeSelectedShapes
{
  return self->_shouldChangeSelectedShapes;
}

- (void)setP_shouldChangeSelectedShapes:(BOOL)a3
{
  self->_shouldChangeSelectedShapes = a3;
}

- (CGPoint)p_unscaledPopoverAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unscaledPopoverAnchorPoint.x;
  y = self->_unscaledPopoverAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setP_unscaledPopoverAnchorPoint:(CGPoint)a3
{
  self->_unscaledPopoverAnchorPoint = a3;
}

- (NSSet)associatedBoardItems
{
  return self->_associatedBoardItems;
}

- (void)setAssociatedBoardItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)showLinesInLibrary
{
  return self->_showLinesInLibrary;
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
  self->_showLinesInLibrary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedBoardItems, 0);
  objc_storeStrong((id *)&self->_constraintsForHidingNavigationBar, 0);
  objc_storeStrong((id *)&self->_constraintsForShowingNavigationBar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_announcementTimer, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_draggingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allPresetCollectionViewControllers, 0);
  objc_storeStrong((id *)&self->_shapeSearchResultsCollection, 0);
  objc_storeStrong((id *)&self->_shapeCollectionDataSource, 0);
  objc_storeStrong((id *)&self->_shapeInsertViewController, 0);
}

@end
