@implementation MacChromeViewController

- (void)setAppCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacChromeViewController;
  v4 = a3;
  -[IOSBasedChromeViewController setAppCoordinator:](&v6, "setAppCoordinator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformController", v6.receiver, v6.super_class));

  objc_msgSend(v5, "addObserver:", self);
}

- (void)viewDidLoad
{
  SupplementalStackViewController *v3;
  void *v4;
  void *v5;
  PassThroughViewController *v6;
  void *v7;
  BlurInWindowSplitViewController *v8;
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
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
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
  PassThroughViewController *v81;
  objc_super v82;
  _QWORD v83[3];
  _QWORD v84[2];
  _QWORD v85[4];

  v82.receiver = self;
  v82.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController viewDidLoad](&v82, "viewDidLoad");
  v3 = objc_alloc_init(SupplementalStackViewController);
  -[MacChromeViewController setMasterViewController:](self, "setMasterViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setClipsToBounds:", 1);

  v6 = objc_alloc_init(PassThroughViewController);
  -[PassThroughViewController setDelegate:](v6, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughViewController view](v6, "view"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("MacChromeFallbackPassthroughView"));

  v81 = v6;
  -[MacChromeViewController setFallbackDetailViewController:](self, "setFallbackDetailViewController:", v6);
  -[MacChromeViewController setDetailViewController:](self, "setDetailViewController:", v6);
  v8 = objc_alloc_init(BlurInWindowSplitViewController);
  -[MacChromeViewController setSplitViewController:](self, "setSplitViewController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
  v84[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController detailViewController](self, "detailViewController"));
  v84[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v12, "setViewControllers:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v13, "setPreferredPrimaryColumnWidthFraction:", 0.150000006);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v14, "setMinimumPrimaryColumnWidth:", 282.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v15, "setMaximumPrimaryColumnWidth:", 380.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  objc_msgSend(v18, "setBackgroundColor:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  LODWORD(v20) = 1.0;
  objc_msgSend(v19, "setGutterWidth:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v21, "setPrimaryBackgroundStyle:", 1);

  if (-[MacChromeViewController _shouldHideSidebar](self, "_shouldHideSidebar"))
    v22 = 1;
  else
    v22 = 2;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v23, "setPreferredDisplayMode:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v24, "setDelegate:", self);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  -[MacChromeViewController addChildViewController:](self, "addChildViewController:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v26, "insertSubview:aboveSubview:", v28, v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v30, "didMoveToParentViewController:", self);

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v33 = v31;
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
  v85[0] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
  v85[1] = v74;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  v85[2] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "widthAnchor"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "widthAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
  v85[3] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

  v41 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MacChromeViewController setDividerView:](self, "setDividerView:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _separatorColor](self, "_separatorColor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController dividerView](self, "dividerView"));
  objc_msgSend(v43, "setBackgroundColor:", v42);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController dividerView](self, "dividerView"));
  objc_msgSend(v44, "setUserInteractionEnabled:", 0);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController dividerView](self, "dividerView"));
  objc_msgSend(v45, "addSubview:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewportLayoutGuide](self, "viewportLayoutGuide"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "safeAreaLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:constant:", v51, 0.0));
  -[MacChromeViewController setViewportSideBarWidthConstraint:](self, "setViewportSideBarWidthConstraint:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "safeAreaLayoutGuide"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:constant:", v57, 0.0));
  -[MacChromeViewController setMapViewInsetsSideBarWidthConstraint:](self, "setMapViewInsetsSideBarWidthConstraint:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController viewportSideBarWidthConstraint](self, "viewportSideBarWidthConstraint"));
  v83[0] = v59;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController mapViewInsetsSideBarWidthConstraint](self, "mapViewInsetsSideBarWidthConstraint"));
  v83[1] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "safeAreaLayoutGuide"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "topAnchor"));
  v66 = objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:constant:", v65, sub_1005EC29C());
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  v83[2] = v67;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v69, "addObserver:selector:name:object:", self, "_locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSettings settingsUpdatedNotificationKey](MapsSettings, "settingsUpdatedNotificationKey"));
  objc_msgSend(v70, "addObserver:selector:name:object:", self, "updateMapViewSettings:", v71, 0);

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v72, "addObserver:selector:name:object:", self, "notifyToolbarOfRoutePlanningState:", CFSTR("RoutePlanningPresentedDidChangeNotification"), 0);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v73, "_forceFrame");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3));
  if (objc_msgSend(v6, "isLocationServicesEnabled"))
    v4 = objc_msgSend(v6, "isLocationServicesApproved");
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController toolbarController](self, "toolbarController"));
  objc_msgSend(v5, "setLocationServicesEnabled:", v4);

}

- (id)_separatorColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
  v9[0] = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray6Color](UIColor, "systemGray6Color"));
  v9[1] = v3;
  v10[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor opaqueSeparatorColor](UIColor, "opaqueSeparatorColor"));
  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v6));
  return v7;
}

- (void)_updateDividerFrame
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MinX;
  void *v28;
  double MaxY;
  void *v30;
  double v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = v6;
  if (v4 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
    objc_msgSend(v7, "convertRect:toView:", v18, v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v33.origin.x = v20;
    v33.origin.y = v22;
    v33.size.width = v24;
    v33.size.height = v26;
    MinX = CGRectGetMinX(v33);
  }
  else
  {
    objc_msgSend(v6, "frame");
    MinX = CGRectGetMaxX(v34);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  objc_msgSend(v28, "bounds");
  MaxY = CGRectGetMaxY(v35);

  LODWORD(v28) = -[MacChromeViewController _sidebarVisible](self, "_sidebarVisible");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController dividerView](self, "dividerView"));
  v32 = v30;
  v31 = 0.0;
  if ((_DWORD)v28)
    v31 = MinX;
  objc_msgSend(v30, "setFrame:", v31, 0.0, 1.0, MaxY);

}

- (void)_updateSidebarConstraints
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  v4 = 0.0;
  if (objc_msgSend(v3, "displayMode") != (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v5, "primaryColumnWidth");
    v4 = v6;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController viewportSideBarWidthConstraint](self, "viewportSideBarWidthConstraint"));
  objc_msgSend(v7, "constant");
  v9 = v8;

  if (v9 != v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController viewportSideBarWidthConstraint](self, "viewportSideBarWidthConstraint"));
    objc_msgSend(v10, "setConstant:", v4);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController mapViewInsetsSideBarWidthConstraint](self, "mapViewInsetsSideBarWidthConstraint"));
    objc_msgSend(v11, "setConstant:", v4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
    objc_msgSend(v12, "layoutIfNeeded");

    -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapInsets"), 0);
    -[IOSBasedChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
  }
}

- (BOOL)supportsDefaultFullscreenViewControllerPresentation
{
  return 0;
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  MacChromeViewController *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  unsigned __int8 v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController contextStackWillUpdateFrom:to:withAnimation:](&v28, "contextStackWillUpdateFrom:to:withAnimation:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  v13 = objc_opt_class(BaseModeController);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
    || (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08) & 1) != 0)
  {
    v14 = objc_opt_class(LookAroundModeController);
    if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10066682C;
      v24[3] = &unk_1011AC860;
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
      v15 = v25;
      objc_msgSend(v10, "addPreparation:animations:completion:", v24, 0, 0);

    }
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10066680C;
    v26[3] = &unk_1011ACE58;
    v26[4] = self;
    v27 = objc_msgSend(v10, "isAnimated");
    objc_msgSend(v10, "addPreparation:animations:completion:", v26, 0, 0);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100666840;
  v20[3] = &unk_1011AD238;
  v16 = v11;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  v23 = self;
  objc_msgSend(v10, "addPreparation:", v20);
  if (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100666A48;
    v18[3] = &unk_1011ACCB8;
    v18[4] = self;
    v19 = v9;
    objc_msgSend(v10, "addCompletion:", v18);

  }
}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  char v20;
  char v21;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController contextStackDidUpdateFrom:to:withAnimation:](&v22, "contextStackDidUpdateFrom:to:withAnimation:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v11 = objc_opt_class(BaseModeController);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v14 = objc_opt_class(LookAroundModeController);
  v15 = objc_opt_isKindOfClass(v13, v14);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100666D4C;
  v19[3] = &unk_1011BF3D8;
  v19[4] = self;
  v20 = isKindOfClass & 1;
  v21 = v15 & 1;
  objc_msgSend(v9, "addPreparation:", v19);
  if ((isKindOfClass & 1) != 0 && (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08) & 1) == 0)
    -[MacChromeViewController hideSideBar:animated:completion:](self, "hideSideBar:animated:completion:", -[MacChromeViewController _shouldHideSidebar](self, "_shouldHideSidebar"), objc_msgSend(v9, "isAnimated"), 0);
  if ((v15 & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100666E5C;
    v17[3] = &unk_1011AE8F8;
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
    v16 = v18;
    objc_msgSend(v9, "addCompletion:", v17);

  }
}

- (void)prepareMapViewForFirstUse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController prepareMapViewForFirstUse](&v6, "prepareMapViewForFirstUse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v5, "_setAutomaticallySnapsToNorth:", 1);

}

- (id)allComponents
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacChromeViewController;
  v2 = -[IOSBasedChromeViewController allComponents](&v6, "allComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", CFSTR("sidebar")));

  return v4;
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  __CFString *v8;
  id v9;
  _QWORD v10[5];
  objc_super v11;

  v8 = (__CFString *)a3;
  v9 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController updateComponent:forTiming:withAnimation:](&v11, "updateComponent:forTiming:withAnimation:", v8, a4, v9);
  if (v8 == CFSTR("sidebar"))
  {
    -[MacChromeViewController _updateSidebarWithAnimation:](self, "_updateSidebarWithAnimation:", v9);
  }
  else if (CFSTR("mapInsets") == v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10066703C;
    v10[3] = &unk_1011AC860;
    v10[4] = self;
    objc_msgSend(v9, "addAnimations:", v10);
  }

}

- (void)pushSidebarViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController nextTopContext](self, "nextTopContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_sidebarControllersForContext, "objectForKey:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    if (v7 != v8)
    {
      objc_msgSend(v6, "addObject:", v8);
      -[MacChromeViewController _setSidebarContentControllers:forContext:](self, "_setSidebarContentControllers:forContext:", v6, v4);
    }

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
    objc_msgSend(v4, "pushContainee:animated:completion:", v8, 1, 0);
  }

}

- (void)popSidebarViewController
{
  NSMapTable *sidebarControllersForContext;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08))
  {
    sidebarControllersForContext = self->_sidebarControllersForContext;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](sidebarControllersForContext, "objectForKey:", v4));
    v7 = objc_msgSend(v5, "mutableCopy");

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "removeLastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
      -[MacChromeViewController _setSidebarContentControllers:forContext:](self, "_setSidebarContentControllers:forContext:", v7, v6);

    }
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
    objc_msgSend(v7, "popContainee:completion:", 1, 0);
  }

}

- (void)setSidebarViewControllers:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10066742C;
  v6[3] = &unk_1011AD4F0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setContainees:animated:completion:", v4, 1, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (id)topSidebarController_forTests
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topContainee_forTests"));

  return v3;
}

- (ToolbarController)toolbarController
{
  ToolbarController *toolbarController;
  ToolbarController *v4;
  void *v5;
  ToolbarController *v6;
  ToolbarController *v7;

  toolbarController = self->_toolbarController;
  if (!toolbarController)
  {
    v4 = [ToolbarController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
    v6 = -[ToolbarController initWithSettingsController:](v4, "initWithSettingsController:", v5);
    v7 = self->_toolbarController;
    self->_toolbarController = v6;

    toolbarController = self->_toolbarController;
  }
  return toolbarController;
}

- (void)hideSideBar:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  double v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", v5));
  v11 = v9;
  v10 = 0.200000003;
  if (!v5)
    v10 = 0.0;
  objc_msgSend(v9, "setDuration:", v10);
  -[MacChromeViewController hideSideBar:animation:completion:](self, "hideSideBar:animation:completion:", v6, v11, v8);

  objc_msgSend(v11, "runWithDefaultOptions");
}

- (void)hideSideBar:(BOOL)a3 animation:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, uint64_t);
  uint64_t v15;
  unsigned __int8 v16;
  BOOL v17;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (v6)
    v10 = 1;
  else
    v10 = 2;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  v12 = objc_msgSend(v11, "preferredDisplayMode");

  if (v12 == (id)v10)
  {
    if (v9)
      v9[2](v9, 1);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1006676D4;
    v13[3] = &unk_1011BC3C8;
    v16 = objc_msgSend(v8, "isAnimated");
    v13[4] = self;
    v15 = v10;
    v17 = v6;
    v14 = v9;
    objc_msgSend(v8, "addAnimations:", v13);

  }
}

- (void)tapLocateMe:(id)a3
{
  int IsEnabled_SearchAndDiscovery;
  void *v5;
  void *v6;

  IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v6 = v5;
  if (IsEnabled_SearchAndDiscovery)
    objc_msgSend(v5, "_setUserTrackingMode:animated:fromTrackingButton:", 1, 1, 1);
  else
    objc_msgSend(v5, "setUserTrackingMode:animated:", 1, 1);

  -[MacChromeViewController _showLocationServicesAlertIfNeeded](self, "_showLocationServicesAlertIfNeeded");
}

- (void)_showLocationServicesAlertIfNeeded
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v2, "promptLocationServicesAuthorizationWithHandler:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = 0;
  v4 = objc_msgSend(v3, "isLocationServicesPossiblyAvailable:", &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    v7 = objc_msgSend(v6, "isEqualToString:", MKLocationErrorDomain);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      objc_msgSend(v8, "showLocationServicesAlertWithError:", v5);

    }
  }

}

- (void)updateMapViewDisplayOptions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController updateMapViewDisplayOptions](&v3, "updateMapViewDisplayOptions");
  -[MacChromeViewController updateMapViewSettings:](self, "updateMapViewSettings:", self);
}

- (void)toggleSidebar:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  _BOOL8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext", a3));
  v5 = objc_opt_class(BaseModeController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = -[MacChromeViewController _sidebarVisible](self, "_sidebarVisible");
    -[MacChromeViewController hideSideBar:animated:completion:](self, "hideSideBar:animated:completion:", v7, 1, 0);
    -[MacChromeViewController _updateSidebarHiddenUserDefault:](self, "_updateSidebarHiddenUserDefault:", v7);
  }
}

- (void)tapToggleSidebar:(id)a3
{
  -[MacChromeViewController toggleSidebar:](self, "toggleSidebar:", a3);
}

- (void)tapDirectionButton:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator", a3));
  objc_msgSend(v3, "toggleRoutePlanning");

}

- (void)tapShareButton:(id)a3
{
  double Width;
  double MinY;
  void *v6;
  id v7;
  double v8;
  void *v9;
  MapsActivityViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view", a3));
  objc_msgSend(v14, "bounds");
  Width = CGRectGetWidth(v15);
  objc_msgSend(v14, "bounds");
  MinY = CGRectGetMinY(v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v7 = objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection");

  if (v7 == (id)1)
  {
    objc_msgSend(v14, "bounds");
    MinY = CGRectGetMinY(v17);
    v8 = 50.0;
  }
  else
  {
    v8 = Width + -50.0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentShareItemSource](self, "currentShareItemSource"));
  v10 = -[MapsActivityViewController initWithShareItem:]([MapsActivityViewController alloc], "initWithShareItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController popoverPresentationController](v10, "popoverPresentationController"));
  objc_msgSend(v11, "setSourceView:", v14);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController popoverPresentationController](v10, "popoverPresentationController"));
  objc_msgSend(v12, "setSourceRect:", v8, MinY + 33.0, 1.0, 1.0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController popoverPresentationController](v10, "popoverPresentationController"));
  objc_msgSend(v13, "setPermittedArrowDirections:", 1);

  -[MacChromeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)tapUserProfileButton:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator", a3));
  objc_msgSend(v3, "openUserProfile");

}

- (BOOL)_sidebarVisible
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
  v3 = objc_msgSend(v2, "displayMode") == (id)2;

  return v3;
}

- (UIEdgeInsets)mapAttributionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)labelEdgeInsets
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v3 = 0.0;
  if (-[MacChromeViewController _sidebarVisible](self, "_sidebarVisible"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v4, "primaryColumnWidth");
    v3 = v5;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  v7 = objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController view](self, "view"));
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;

  if (v7 == (id)1)
    v11 = 0.0;
  else
    v11 = v3;
  if (v7 == (id)1)
    v12 = v3;
  else
    v12 = 0.0;
  v13 = 0.0;
  v14 = v10;
  result.right = v12;
  result.bottom = v13;
  result.left = v11;
  result.top = v14;
  return result;
}

- (void)validateCommand:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "action");
  if (v5 == "toggleSidebar:")
  {
    v7 = -[MacChromeViewController _sidebarVisible](self, "_sidebarVisible");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7)
      v10 = CFSTR("[Menu] Hide Sidebar");
    else
      v10 = CFSTR("[Menu] Show Sidebar");
    goto LABEL_14;
  }
  v6 = v5;
  if (v5 == "toggleDirections")
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
    objc_msgSend(v4, "_maps_setUseDisableFeatureTitle:", objc_msgSend(v9, "isRoutePlanningPresented"));
LABEL_15:

    goto LABEL_16;
  }
  if (v5 == "toggleMapScale")
  {
    objc_msgSend(v4, "_maps_setUseDisableFeatureTitle:", +[MapsSettings alwaysShowScale](MapsSettings, "alwaysShowScale"));
    goto LABEL_16;
  }
  if (v5 == "deleteStop" && !-[MacChromeViewController canDeleteStop](self, "canDeleteStop")
    || v6 == "delete:"
    || v6 == "pasteAndMatchStyle:")
  {
    objc_msgSend(v4, "setAttributes:", 4);
    goto LABEL_16;
  }
  if (v6 == "copy:")
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("Copy Link");
LABEL_14:
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
    objc_msgSend(v4, "setTitle:", v11);

    goto LABEL_15;
  }
  v12.receiver = self;
  v12.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController validateCommand:](&v12, "validateCommand:", v4);
LABEL_16:

}

- (void)toggleDirections
{
  -[MacChromeViewController tapDirectionButton:](self, "tapDirectionButton:", self);
}

- (void)toggleMapScale
{
  +[MapsSettings setAlwaysShowScale:](MapsSettings, "setAlwaysShowScale:", +[MapsSettings alwaysShowScale](MapsSettings, "alwaysShowScale") ^ 1);
}

- (BOOL)canDeleteStop
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  if (objc_msgSend(v3, "isRoutePlanningPresented"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _currentRouteSearchViewController](self, "_currentRouteSearchViewController"));
    v5 = objc_msgSend(v4, "canDeleteCurrentFieldIndex");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)deleteStop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _currentRouteSearchViewController](self, "_currentRouteSearchViewController"));
  objc_msgSend(v2, "deleteCurrentFieldIndex");

}

- (id)_currentRouteSearchViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "baseActionCoordinator"));

  v4 = objc_opt_class(ActionCoordinator);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));

  v9 = objc_opt_class(RoutePlanningOverviewViewController);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeSearchViewController"));
  return v12;
}

- (void)find:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext", a3));
  v5 = objc_opt_class(BaseModeController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100668184;
    v7[3] = &unk_1011AE8F8;
    v7[4] = self;
    -[MacChromeViewController hideSideBar:animated:completion:](self, "hideSideBar:animated:completion:", 0, 1, v7);
    -[MacChromeViewController _updateSidebarHiddenUserDefault:](self, "_updateSidebarHiddenUserDefault:", 0);
  }
}

- (id)mapItemFromWaypoint:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v4, 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));
    objc_msgSend(v6, "coordinate");
    v8 = v7;
    v10 = v9;

    v11 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v8, v10);
    v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", v11);

  }
  return v5;
}

- (id)urlForRoute:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v18;

  v4 = a3;
  v5 = objc_alloc_init((Class)MKURLSerializer);
  if (objc_msgSend(v4, "transportType") == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeAttributes"));
    v7 = objc_msgSend(v6, "hasTimepoint");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeAttributes", 0));
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "timepoint");
      else
        v18 = 0;

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin", v18));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController mapItemFromWaypoint:](self, "mapItemFromWaypoint:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController mapItemFromWaypoint:](self, "mapItemFromWaypoint:", v12));

  v14 = 0;
  if (v11 && v13)
  {
    v15 = objc_msgSend(v4, "transportType");
    if (v15 > 5)
      v16 = 1;
    else
      v16 = qword_100E39B68[v15];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "urlForDirectionsFromMapItem:toMapItem:transportType:options:", v11, v13, v16, 0));
  }

  return v14;
}

- (void)presentAddNewCollection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collection](CollectionHandler, "collection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Collections] New Guide"), CFSTR("localized string not found"), 0));

  objc_msgSend(v3, "updateTitle:", v5);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006685EC;
  v7[3] = &unk_1011B2260;
  objc_copyWeak(&v9, &location);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v6, "createCollection:", v7);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2072, 0, 0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)presentAddToCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  CollectionSaveSession *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "propertyList"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCollections"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if ((v13 & 1) != 0)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_13;
    v15 = -[CollectionEditSession initWithCollection:]([CollectionSaveSession alloc], "initWithCollection:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "baseActionCoordinator"));
    objc_msgSend(v17, "viewController:addItemsFromACToCollection:", self, v15);

    v6 = v14;
  }
LABEL_12:

LABEL_13:
}

- (void)presentAddToFavorites
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "baseActionCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSession](ShortcutEditSession, "addSession"));
  objc_msgSend(v3, "viewController:showAddShortcut:", self, v4);

}

- (void)requestNewTab:(id)a3
{
  -[MacChromeViewController newSceneInTab:](self, "newSceneInTab:", 1);
}

- (void)requestNewWindow:(id)a3
{
  -[MacChromeViewController newSceneInTab:](self, "newSceneInTab:", 0);
}

- (void)newSceneInTab:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entryPointsCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchAlertsManager"));
  if ((objc_msgSend(v5, "currentlyShowingAlert") & 1) != 0)
  {

  }
  else
  {
    v6 = +[MapsWelcomeScreenViewController mapsWelcomeCurrentlyBeingPresented](MapsWelcomeScreenViewController, "mapsWelcomeCurrentlyBeingPresented");

    if ((v6 & 1) == 0)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.NewWindow"));
      objc_msgSend(v7, "setEligibleForHandoff:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapsActivityWithFidelity:", 2));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bzip2CompressedData"));

      if (v11)
      {
        v17 = CFSTR("bs");
        v18 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
        objc_msgSend(v7, "setUserInfo:", v12);

      }
      v13 = objc_alloc_init((Class)UISceneActivationRequestOptions);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _maps_uiScene](self, "_maps_uiScene"));
      objc_msgSend(v13, "setRequestingScene:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v15, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v7, v13, 0);

    }
  }
}

- (void)select3dMode
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController select3dMode](&v2, "select3dMode");
}

- (void)orderFrontStandardAboutPanel:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = objc_claimAutoreleasedReturnValue(-[MacChromeViewController _mapAndWeatherAttribution](self, "_mapAndWeatherAttribution", a3));
  v4 = (void *)v3;
  if (v3)
  {
    v7 = CFSTR("Credits");
    v8 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(objc_msgSend(v6, "appKitBundleClass"), "orderFrontStandardAboutPanelWithOptions:", v5);

}

- (id)_mapAndWeatherAttribution
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];

  v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v3, "setAlignment:", 1);
  v11[0] = NSForegroundColorAttributeName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v12[0] = v4;
  v11[1] = NSFontAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.0));
  v11[2] = NSParagraphStyleAttributeName;
  v12[1] = v5;
  v12[2] = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapAttributionWithStringAttributes:underlineText:linkAttribution:", v6, 1, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));
  return v9;
}

- (id)currentCollectionShareItemSource
{
  id v3;
  void *v4;
  void *v5;
  PersonalCollectionShareItemSource *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MacChromeViewController;
  v3 = -[IOSBasedChromeViewController currentCollectionShareItemSource](&v10, "currentCollectionShareItemSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _macBaseActionCoordinator](self, "_macBaseActionCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "injectedCollection"));
    if (v8)
      v6 = -[PersonalCollectionShareItemSource initWithCollectionHandlerInfo:]([PersonalCollectionShareItemSource alloc], "initWithCollectionHandlerInfo:", v8);
    else
      v6 = 0;

  }
  return v6;
}

- (void)notifyToolbarOfRoutePlanningState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "baseActionCoordinator"));

  if (v4 == v6)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "baseActionCoordinator"));
    v8 = objc_msgSend(v7, "isRoutePlanningPresented");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController toolbarController](self, "toolbarController"));
    objc_msgSend(v9, "setRoutePlanningButtonActive:", v8);

  }
}

- (BOOL)_sharingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRouteCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentRoute"));
    if (objc_msgSend(v8, "isMultipointRoute"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentShareItemSource](self, "currentShareItemSource"));
      v10 = v9 != 0;

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_updateShareButton
{
  _BOOL8 v3;
  id v4;

  v3 = -[MacChromeViewController _sharingEnabled](self, "_sharingEnabled");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacChromeViewController toolbarController](self, "toolbarController"));
  objc_msgSend(v4, "setShareButtonEnabled:", v3);

}

- (id)_macBaseActionCoordinator
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "baseActionCoordinator"));

  v4 = objc_opt_class(MacBaseActionCoordinator);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)mapViewWillStartRenderingMap:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacChromeViewController;
  -[MacChromeViewController mapViewWillStartRenderingMap:](&v4, "mapViewWillStartRenderingMap:", a3);
  self->_mapLoadedWithoutError = 1;
}

- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController mapViewDidFailLoadingMap:withError:](&v23, "mapViewDidFailLoadingMap:withError:", a3, v6);
  self->_mapLoadedWithoutError = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController checkForInternetError:](self, "checkForInternetError:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = v7;

    v6 = v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v11 = objc_msgSend(v6, "code");
  v12 = objc_msgSend(v10, "isEqualToString:", NSURLErrorDomain);
  if ((_DWORD)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = v13;
    if (v11 == (id)-1009)
      v15 = CFSTR("No Internet Connection");
    else
      v15 = CFSTR("Connection Issue.");
  }
  else
  {
    v16 = GEOErrorDomain(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v10, "isEqualToString:", v17);

    v19 = 0;
    if (!v18 || v11 != (id)-9)
      goto LABEL_13;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = v13;
    v15 = CFSTR("No Internet Connection");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, CFSTR("localized string not found"), 0));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController errorString](self, "errorString"));
    v21 = objc_msgSend(v20, "isEqualToString:", v19);

    if ((v21 & 1) == 0)
    {
      -[IOSBasedChromeViewController setErrorString:](self, "setErrorString:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
      objc_msgSend(v22, "refreshTitle");

    }
  }
LABEL_13:

}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacChromeViewController;
  -[MacChromeViewController mapViewDidFinishRenderingMap:fullyRendered:](&v7, "mapViewDidFinishRenderingMap:fullyRendered:", a3, a4);
  if (self->_mapLoadedWithoutError)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController errorString](self, "errorString"));

    if (v5)
    {
      -[IOSBasedChromeViewController setErrorString:](self, "setErrorString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
      objc_msgSend(v6, "refreshTitle");

    }
  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MacChromeViewController;
  -[MacChromeViewController mapView:didChangeUserTrackingMode:animated:](&v8, "mapView:didChangeUserTrackingMode:animated:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController toolbarController](self, "toolbarController"));
  objc_msgSend(v7, "setLocationButtonActive:", a4 == 1);

}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController mapView:didChangeLookAroundAvailability:](&v7, "mapView:didChangeLookAroundAvailability:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController toolbarController](self, "toolbarController"));
  objc_msgSend(v6, "setLookAroundEnabled:", a4 == 2);

}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController mapView:canEnter3DModeDidChange:](&v7, "mapView:canEnter3DModeDidChange:", a3, a4);
  v5 = -[IOSBasedChromeViewController canEnter3dMode](self, "canEnter3dMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController toolbarController](self, "toolbarController"));
  objc_msgSend(v6, "setThirdDimensionButtonEnabled:", v5);

}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[MacChromeViewController setCurrentInteractionDidDeselect:](self, "setCurrentInteractionDidDeselect:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v6 = objc_opt_respondsToSelector(v5, "mapViewDidStartUserInteraction:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    objc_msgSend(v7, "mapViewDidStartUserInteraction:", v4);

  }
  v8.receiver = self;
  v8.super_class = (Class)MacChromeViewController;
  -[MacChromeViewController mapViewDidStartUserInteraction:](&v8, "mapViewDidStartUserInteraction:", v4);

}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[MacChromeViewController setCurrentInteractionDidDeselect:](self, "setCurrentInteractionDidDeselect:", 1);
  v8.receiver = self;
  v8.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController mapView:didDeselectLabelMarker:](&v8, "mapView:didDeselectLabelMarker:", v7, v6);

}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if (-[MacChromeViewController isCurrentInteractionDidDeselect](self, "isCurrentInteractionDidDeselect"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedLabelMarker"));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
      objc_msgSend(v10, "clearPreviouslySelectedLabelMarker");

    }
    v13.receiver = self;
    v13.super_class = (Class)MacChromeViewController;
    v5 = -[IOSBasedChromeViewController mapViewShouldHandleTapToDeselect:](&v13, "mapViewShouldHandleTapToDeselect:", v4);
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController _macBaseActionCoordinator](self, "_macBaseActionCoordinator"));
      objc_msgSend(v11, "handleMapViewTapToDeselect");

    }
    -[MacChromeViewController setCurrentInteractionDidDeselect:](self, "setCurrentInteractionDidDeselect:", 1);
  }

  return v5;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController masterViewController](self, "masterViewController", v3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacChromeViewController detailViewController](self, "detailViewController"));
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));

  return v6;
}

- (id)checkForInternetError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (!objc_msgSend(v5, "isEqualToString:", NSURLErrorDomain))
  {

LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("UnderlyingErrors")));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("UnderlyingErrors")));

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v33;
LABEL_8:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_claimAutoreleasedReturnValue(-[MacChromeViewController checkForInternetError:](self, "checkForInternetError:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17)));
          if (v18)
            goto LABEL_25;
          if (v15 == (id)++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v15)
              goto LABEL_8;
            break;
          }
        }
      }

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("SimpleTileRequesterUnderlyingErrors")));
    v7 = objc_msgSend(v20, "count");

    if (!v7)
      goto LABEL_26;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("SimpleTileRequesterUnderlyingErrors")));

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v22;
    v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (!v23)
    {
LABEL_24:

      v7 = 0;
      goto LABEL_26;
    }
    v24 = v23;
    v25 = *(_QWORD *)v29;
LABEL_18:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v25)
        objc_enumerationMutation(v13);
      v18 = objc_claimAutoreleasedReturnValue(-[MacChromeViewController checkForInternetError:](self, "checkForInternetError:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v26), (_QWORD)v28));
      if (v18)
        break;
      if (v24 == (id)++v26)
      {
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v24)
          goto LABEL_18;
        goto LABEL_24;
      }
    }
LABEL_25:
    v7 = (id)v18;

    goto LABEL_26;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != (id)-1009)
    goto LABEL_5;
  v7 = v4;
LABEL_26:

  return v7;
}

- (BOOL)_shouldHideSidebar
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;

  if (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("MapsDefaultHideSidebar"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    if (v3 && (v5 = objc_opt_class(BaseModeController), (objc_opt_isKindOfClass(v3, v5) & 1) == 0))
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v4 = objc_msgSend(v6, "BOOLForKey:", CFSTR("MapsDefaultHideSidebar"));

    }
  }

  return v4;
}

- (void)_updateSidebarHiddenUserDefault:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v7, "setBool:forKey:", v3, CFSTR("MapsDefaultHideSidebar"));
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    if (!v7 || (v5 = objc_opt_class(BaseModeController), (objc_opt_isKindOfClass(v7, v5) & 1) != 0))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v6, "setBool:forKey:", v3, CFSTR("MapsDefaultHideSidebar"));

    }
  }

}

- (void)_updateSidebarWithAnimation:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  v4 = a3;
  if (GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08))
  {
    objc_initWeak(&location, v4);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100669C4C;
    v5[3] = &unk_1011AEAA0;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "addPreparation:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (void)_setSidebarContentControllers:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  NSMapTable *v8;
  NSMapTable *sidebarControllersForContext;
  id v10;
  NSMapTable *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  if ((GEOConfigGetBOOL(MapsConfig_EnableMacChromeOwnedSidebar, off_1014B4B08) & 1) != 0)
  {
    if (!self->_sidebarControllersForContext)
    {
      v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
      sidebarControllersForContext = self->_sidebarControllersForContext;
      self->_sidebarControllersForContext = v8;

    }
    v10 = objc_msgSend(v6, "count");
    v11 = self->_sidebarControllersForContext;
    if (v10)
    {
      v12 = objc_msgSend(v6, "copy");
      -[NSMapTable setObject:forKey:](v11, "setObject:forKey:", v12, v7);

    }
    else
    {
      -[NSMapTable setObject:forKey:](v11, "setObject:forKey:", 0, v7);
    }
    -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("sidebar"), 1);
  }
  else
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting to store sidebar controllers for context but sidebar isn't a chrome component")));
      v19 = 136315906;
      v20 = "-[MacChromeViewController _setSidebarContentControllers:forContext:]";
      v21 = 2080;
      v22 = "MacChromeViewController.m";
      v23 = 1024;
      v24 = 1163;
      v25 = 2112;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v19, 0x26u);

    }
    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

      }
    }
  }

}

- (void)_maps_splitViewControllerDidChangePrimaryColumnWidth:(id)a3
{
  -[MacChromeViewController _updateDividerFrame](self, "_updateDividerFrame", a3);
  -[MacChromeViewController _updateSidebarConstraints](self, "_updateSidebarConstraints");
}

- (BOOL)isEligibleForMapViewFrameRateLimiting
{
  return 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v10, v8) & 1) != 0)
    objc_msgSend(v10, "removeObserver:", self);
  v9 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    objc_msgSend(v7, "addObserver:", self);
  -[MacChromeViewController _updateShareButton](self, "_updateShareButton");

}

- (UISplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (UIViewController)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_detailViewController, a3);
}

- (PassThroughViewController)fallbackDetailViewController
{
  return self->_fallbackDetailViewController;
}

- (void)setFallbackDetailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackDetailViewController, a3);
}

- (SupplementalStackViewController)masterViewController
{
  return self->_masterViewController;
}

- (void)setMasterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_masterViewController, a3);
}

- (NSLayoutConstraint)viewportSideBarWidthConstraint
{
  return self->_viewportSideBarWidthConstraint;
}

- (void)setViewportSideBarWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_viewportSideBarWidthConstraint, a3);
}

- (NSLayoutConstraint)mapViewInsetsSideBarWidthConstraint
{
  return self->_mapViewInsetsSideBarWidthConstraint;
}

- (void)setMapViewInsetsSideBarWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewInsetsSideBarWidthConstraint, a3);
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (void)setToolbarController:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarController, a3);
}

- (BOOL)mapLoadedWithoutError
{
  return self->_mapLoadedWithoutError;
}

- (void)setMapLoadedWithoutError:(BOOL)a3
{
  self->_mapLoadedWithoutError = a3;
}

- (BOOL)isCurrentInteractionDidDeselect
{
  return self->_currentInteractionDidDeselect;
}

- (void)setCurrentInteractionDidDeselect:(BOOL)a3
{
  self->_currentInteractionDidDeselect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_mapViewInsetsSideBarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewportSideBarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_masterViewController, 0);
  objc_storeStrong((id *)&self->_fallbackDetailViewController, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_sidebarControllersForContext, 0);
  objc_storeStrong((id *)&self->_popoverSettingsViewController, 0);
}

@end
