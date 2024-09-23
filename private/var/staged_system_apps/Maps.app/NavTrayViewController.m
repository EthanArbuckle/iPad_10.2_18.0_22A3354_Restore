@implementation NavTrayViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)initForSteppingWithDelegate:(id)a3 platformController:(id)a4
{
  id v6;
  id v7;
  NavTrayViewController *v8;
  NavTrayViewController *v9;
  uint64_t v10;
  NavTrayMetrics *metrics;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NavTrayViewController;
  v8 = -[NavTrayViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    -[NavTrayViewController _commonInit](v8, "_commonInit");
    objc_storeWeak((id *)&v9->_steppingDelegate, v6);
    v9->_isSteppingMode = 1;
    v10 = objc_claimAutoreleasedReturnValue(+[NavTrayMetrics defaultMetrics](NavTrayMetrics, "defaultMetrics"));
    metrics = v9->_metrics;
    v9->_metrics = (NavTrayMetrics *)v10;

    objc_storeWeak((id *)&v9->_platformController, v7);
  }

  return v9;
}

- (id)initForNavigationWithDelegate:(id)a3 guidanceObserver:(id)a4 platformController:(id)a5
{
  id v8;
  id v9;
  id v10;
  NavTrayViewController *v11;
  NavTrayViewController *v12;
  uint64_t v13;
  NavTrayMetrics *metrics;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NavTrayViewController;
  v11 = -[NavTrayViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    -[NavTrayViewController _commonInit](v11, "_commonInit");
    objc_storeWeak((id *)&v12->_navigationDelegate, v8);
    objc_storeStrong((id *)&v12->_guidanceObserver, a4);
    objc_storeWeak((id *)&v12->_platformController, v10);
    v13 = objc_claimAutoreleasedReturnValue(+[NavTrayMetrics defaultMetrics](NavTrayMetrics, "defaultMetrics"));
    metrics = v12->_metrics;
    v12->_metrics = (NavTrayMetrics *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v15, "registerObserver:", v12);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v12, "_resumedFromSAR", CFSTR("NavModeControllerResumeOriginalDestinationNotification"), 0);

  }
  return v12;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setBlurInCardView:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setCardColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setAllowsSwipeToDismiss:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "offlineMapsStateChanged", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_sceneConnectionsDidChange:", UISceneWillConnectNotification, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "_sceneConnectionsDidChange:", UISceneDidDisconnectNotification, 0);

  -[NavTrayViewController setConnectedToCarPlay:](self, "setConnectedToCarPlay:", +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "_maneuverBannerViewEVStationsNotification:", off_1014A6C00, 0);

}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *contentView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOComposedRoute *v11;
  GEOComposedRoute *route;
  StepTrayHeaderView *v13;
  StepTrayHeaderView *stepHeaderView;
  NavTrayHeaderView *v15;
  NavTrayHeaderView *navHeaderView;
  void *v17;
  GuidanceETA *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  GuidanceETA *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  double y;
  double width;
  double height;
  UITableView *v32;
  UITableView *tableView;
  void *v34;
  double v35;
  double v36;
  double v37;
  UITableView *v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  UITableView *v43;
  uint64_t v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  UITableView *v48;
  uint64_t v49;
  objc_class *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  UIView *v55;
  UIView *shareETADisclosureView;
  void *v57;
  ContentSizedTableView *v58;
  ContentSizedTableView *shareETADisclosureTableView;
  void *v60;
  double v61;
  double v62;
  double v63;
  ContentSizedTableView *v64;
  uint64_t v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  NavShareETAFooterView *v69;
  void *v70;
  NavShareETAFooterView *v71;
  NavShareETAFooterView *shareETADisclosureFooterView;
  UIButton *v73;
  UIButton *shareETADisclosureButton;
  void *v75;
  void *v76;
  void *v77;
  UIButton *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSLayoutConstraint *v85;
  NSLayoutConstraint *shareETADisclosureTopConstraint;
  NSLayoutConstraint *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  objc_super v153;
  _QWORD v154[14];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("NavTray"));

  v4 = objc_opt_new(UIView);
  contentView = self->_contentView;
  self->_contentView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);
  -[UIView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("NavTrayContent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_contentView);

  v153.receiver = self;
  v153.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController viewDidLoad](&v153, "viewDidLoad");
  if (!self->_isSteppingMode)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v7, "addSendingObserver:", self);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v8, "setFirstCard:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v9, "setEdgeAttachedRegularHeightDimmingBehavior:", 2);

  if (self->_isSteppingMode)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v11 = (GEOComposedRoute *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
    route = self->_route;
    self->_route = v11;

    v13 = -[StepTrayHeaderView initWithDelegate:metrics:]([StepTrayHeaderView alloc], "initWithDelegate:metrics:", self, self->_metrics);
    stepHeaderView = self->_stepHeaderView;
    self->_stepHeaderView = v13;

    objc_storeStrong((id *)&self->_headerView, self->_stepHeaderView);
    -[NavTrayViewController _computeSections](self, "_computeSections");
  }
  else
  {
    v15 = -[NavTrayHeaderView initWithDelegate:metrics:]([NavTrayHeaderView alloc], "initWithDelegate:metrics:", self, self->_metrics);
    navHeaderView = self->_navHeaderView;
    self->_navHeaderView = v15;

    -[GuidanceObserver addOutlet:forOwner:](self->_guidanceObserver, "addOutlet:forOwner:", self->_navHeaderView, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v18 = [GuidanceETA alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "displayEtaInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remainingDistanceInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "batteryChargeInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "upcomingStop"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timezone"));
    v24 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v18, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v19, v20, v21, v23, objc_msgSend(v17, "navigationTransportType"));
    -[NavTrayHeaderView setETA:](self->_navHeaderView, "setETA:", v24);

    objc_storeStrong((id *)&self->_headerView, self->_navHeaderView);
  }
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v25) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_headerView, "setContentCompressionResistancePriority:forAxis:", 0, v25);
  LODWORD(v26) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_headerView, "setContentCompressionResistancePriority:forAxis:", 1, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  objc_msgSend(v27, "addSubview:", self->_headerView);

  -[GuidanceObserver repeatAllUpdatesForOutlet:](self->_guidanceObserver, "repeatAllUpdatesForOutlet:", self->_navHeaderView);
  v28 = objc_alloc((Class)UITableView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v32 = (UITableView *)objc_msgSend(v28, "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = v32;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 0.0);
  -[UITableView _setTopPadding:](self->_tableView, "_setTopPadding:", 0.0);
  -[UITableView _setBottomPadding:](self->_tableView, "_setBottomPadding:", 0.0);
  -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 0.0);
  -[UITableView setSectionFooterHeight:](self->_tableView, "setSectionFooterHeight:", 0.0);
  -[UITableView setAlwaysBounceVertical:](self->_tableView, "setAlwaysBounceVertical:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v34);

  -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
  v36 = v35;
  -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, v36, 0.0, v37);
  v38 = self->_tableView;
  v39 = objc_opt_class(NavTrayWaypointCell);
  v40 = (objc_class *)objc_opt_class(NavTrayWaypointCell);
  v41 = NSStringFromClass(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  -[UITableView registerClass:forCellReuseIdentifier:](v38, "registerClass:forCellReuseIdentifier:", v39, v42);

  v43 = self->_tableView;
  v44 = objc_opt_class(NavTrayActionCell);
  v45 = (objc_class *)objc_opt_class(NavTrayActionCell);
  v46 = NSStringFromClass(v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  -[UITableView registerClass:forCellReuseIdentifier:](v43, "registerClass:forCellReuseIdentifier:", v44, v47);

  v48 = self->_tableView;
  v49 = objc_opt_class(NavTrayEndCell);
  v50 = (objc_class *)objc_opt_class(NavTrayEndCell);
  v51 = NSStringFromClass(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  -[UITableView registerClass:forCellReuseIdentifier:](v48, "registerClass:forCellReuseIdentifier:", v49, v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavTraySeparatorColor")));
  -[UITableView setSeparatorColor:](self->_tableView, "setSeparatorColor:", v53);

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("NavTrayTableView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  objc_msgSend(v54, "addSubview:", self->_tableView);

  v55 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  shareETADisclosureView = self->_shareETADisclosureView;
  self->_shareETADisclosureView = v55;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_shareETADisclosureView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  objc_msgSend(v57, "addSubview:", self->_shareETADisclosureView);

  v58 = -[ContentSizedTableView initWithFrame:style:]([ContentSizedTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  shareETADisclosureTableView = self->_shareETADisclosureTableView;
  self->_shareETADisclosureTableView = v58;

  -[ContentSizedTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_shareETADisclosureTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContentSizedTableView setDelegate:](self->_shareETADisclosureTableView, "setDelegate:", self);
  -[ContentSizedTableView setDataSource:](self->_shareETADisclosureTableView, "setDataSource:", self);
  -[ContentSizedTableView setSeparatorInset:](self->_shareETADisclosureTableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 0.0);
  -[ContentSizedTableView _setTopPadding:](self->_shareETADisclosureTableView, "_setTopPadding:", 0.0);
  -[ContentSizedTableView _setBottomPadding:](self->_shareETADisclosureTableView, "_setBottomPadding:", 0.0);
  -[ContentSizedTableView setSectionHeaderHeight:](self->_shareETADisclosureTableView, "setSectionHeaderHeight:", 0.0);
  -[ContentSizedTableView setSectionFooterHeight:](self->_shareETADisclosureTableView, "setSectionFooterHeight:", 0.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ContentSizedTableView setBackgroundColor:](self->_shareETADisclosureTableView, "setBackgroundColor:", v60);

  -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
  v62 = v61;
  -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
  -[ContentSizedTableView setLayoutMargins:](self->_shareETADisclosureTableView, "setLayoutMargins:", 0.0, v62, 0.0, v63);
  v64 = self->_shareETADisclosureTableView;
  v65 = objc_opt_class(NavShareETACell);
  v66 = (objc_class *)objc_opt_class(NavShareETACell);
  v67 = NSStringFromClass(v66);
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  -[ContentSizedTableView registerClass:forCellReuseIdentifier:](v64, "registerClass:forCellReuseIdentifier:", v65, v68);

  -[ContentSizedTableView setAccessibilityIdentifier:](self->_shareETADisclosureTableView, "setAccessibilityIdentifier:", CFSTR("ShareETADisclosureTableView"));
  v69 = [NavShareETAFooterView alloc];
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v71 = -[NavShareETAFooterView initWithTextColor:](v69, "initWithTextColor:", v70);
  shareETADisclosureFooterView = self->_shareETADisclosureFooterView;
  self->_shareETADisclosureFooterView = v71;

  v73 = objc_opt_new(UIButton);
  shareETADisclosureButton = self->_shareETADisclosureButton;
  self->_shareETADisclosureButton = v73;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_shareETADisclosureButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setUserInteractionEnabled:](self->_shareETADisclosureButton, "setUserInteractionEnabled:", 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_shareETADisclosureButton, "titleLabel"));
  objc_msgSend(v75, "setTextAlignment:", 1);

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_shareETADisclosureButton, "titleLabel"));
  objc_msgSend(v77, "setFont:", v76);

  -[UIButton setAccessibilityIdentifier:](self->_shareETADisclosureButton, "setAccessibilityIdentifier:", CFSTR("ShareETADisclosureButton"));
  v78 = self->_shareETADisclosureButton;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _systemInteractionTintColor](UIColor, "_systemInteractionTintColor"));
  -[UIButton setTitleColor:forState:](v78, "setTitleColor:forState:", v79, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_shareETADisclosureButton, "addTarget:action:forControlEvents:", self, "_pressedShareETADisclosureButton", 64);
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  objc_msgSend(v80, "bringSubviewToFront:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_shareETADisclosureView, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController headerView](self, "headerView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bottomAnchor"));
  v85 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v84));
  shareETADisclosureTopConstraint = self->_shareETADisclosureTopConstraint;
  self->_shareETADisclosureTopConstraint = v85;

  v152 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController headerView](self, "headerView"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "topAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "topAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v149));
  v154[0] = v148;
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController headerView](self, "headerView"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "leadingAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "leadingAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:", v144));
  v154[1] = v143;
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController headerView](self, "headerView"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "trailingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "trailingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToAnchor:", v139));
  v154[2] = v138;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "leadingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "leadingAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v134));
  v154[3] = v133;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "trailingAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "trailingAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:", v129));
  v154[4] = v128;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "topAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController headerView](self, "headerView"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "bottomAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToAnchor:", v124));
  v154[5] = v123;
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "bottomAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "bottomAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v119));
  v154[6] = v118;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "leadingAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "leadingAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v114));
  v154[7] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "trailingAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "trailingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v109));
  v154[8] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "topAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v104));
  v154[9] = v103;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "bottomAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "bottomAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
  v87 = self->_shareETADisclosureTopConstraint;
  v154[10] = v98;
  v154[11] = v87;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_shareETADisclosureView, "leadingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v90));
  v154[12] = v91;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_shareETADisclosureView, "trailingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v94));
  v154[13] = v95;
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v154, 14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v96);

  -[NavTrayViewController _updateShareETADisclosure](self, "_updateShareETADisclosure");
  if (self->_isSteppingMode)
    -[NavTrayViewController setCurrentStepIndex:](self, "setCurrentStepIndex:", 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointController](self, "waypointController"));
  objc_msgSend(v97, "registerObserver:", self);

}

- (void)viewWillAppear:(BOOL)a3
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
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  uint8_t buf[4];
  NavTrayViewController *v28;

  v26.receiver = self;
  v26.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController viewWillAppear:](&v26, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
  -[NavTrayViewController _updateWithRoute:](self, "_updateWithRoute:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  objc_msgSend(v6, "addObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "setHideGrabber:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "receivers"));
  -[NavTrayViewController setReceivingContacts:](self, "setReceivingContacts:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v12, "wantsLayout:", 1);

  }
  if (self->_enableShareETA)
  {
    if (!self->_didDisplayInitialBanner)
    {
      v13 = sub_1007FCE24();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v28 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Starting timer to show Share ETA initial banner", buf, 0xCu);
      }

      -[NavTrayViewController _startTimerToDisplayInitialBanner](self, "_startTimerToDisplayInitialBanner");
    }
  }
  else if (!self->_didDisplayInitialBanner)
  {
    v15 = sub_1007FCE24();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Not presenting Share ETA initial banner as it's not available", buf, 0xCu);
    }

    self->_didDisplayInitialBanner = 1;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arrivalInfo"));
  v19 = (char *)objc_msgSend(v18, "arrivalState");

  if (v19 != (char *)-1)
  {
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "route"));
      v21 = objc_msgSend(v20, "legIndexForStepIndex:", objc_msgSend(v17, "stepIndex"));

      if ((unint64_t)(v19 - 1) > 5)
        v22 = 0;
      else
        v22 = qword_100E3BF90[(_QWORD)(v19 - 1)];
      -[NavTrayHeaderView setArrivalState:](self->_navHeaderView, "setArrivalState:", v22);
      -[NavTrayViewController _handleArrivalAtEndOfLegIndex:service:](self, "_handleArrivalAtEndOfLegIndex:service:", v21, v17);
    }
    else
    {
      -[NavTrayViewController _resumeNavigation](self, "_resumeNavigation");
    }
  }
  objc_initWeak((id *)buf, self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1007FCE64;
  v24[3] = &unk_1011B3220;
  objc_copyWeak(&v25, (id *)buf);
  objc_msgSend(v23, "refreshSharingIdentityWithCompletion:", v24);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavTrayViewController;
  -[NavTrayViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  self->_viewDidAppear = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "updateHeightForCurrentLayout");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavTrayViewController;
  -[NavTrayViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  objc_msgSend(v4, "removeObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_phoneNumberPickerAlertController);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  char v17;
  _QWORD block[5];
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NavTrayViewController;
  -[MapsThemeViewController traitCollectionDidChange:](&v19, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  if (sub_1002A8950(v6, v7))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "accessibilityContrast");
    v10 = objc_msgSend(v4, "accessibilityContrast");

    if (v9 == v10)
      goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
  objc_msgSend(v11, "reloadData");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007FD2D8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_5:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
  v13 = sub_1002A8A0C(v4, v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
    v15 = objc_msgSend(v14, "isLuminanceReduced");

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1007FD308;
    v16[3] = &unk_1011ACE58;
    v17 = (char)v15;
    v16[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v15, v16);
  }

}

- (void)setReceivingContacts:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *receivingContacts;
  id v7;
  NSObject *v8;
  NSArray *usedSections;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NavTrayViewController *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  receivingContacts = self->_receivingContacts;
  self->_receivingContacts = v5;

  v7 = sub_1007FCE24();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = 134349314;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updated receiving contacts: %@", (uint8_t *)&v16, 0x16u);
  }

  -[NavTrayViewController _updateShareETADisclosure](self, "_updateShareETADisclosure");
  usedSections = self->_usedSections;
  if (usedSections)
  {
    v10 = -[NSArray indexOfObject:](usedSections, "indexOfObject:", &off_10126F058);
    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
      v13 = objc_msgSend(v12, "numberOfSections");

      if ((uint64_t)v11 < (uint64_t)v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v11));
        objc_msgSend(v14, "reloadSections:withRowAnimation:", v15, 5);

      }
    }
  }

}

- (void)_updateShareETADisclosure
{
  void *v3;
  void *v4;
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL8 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  _QWORD v98[5];
  _QWORD v99[4];
  _QWORD v100[4];
  uint8_t buf[4];
  NavTrayViewController *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  _QWORD v107[4];

  -[NavTrayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareETAWaypointContacts"));

  v5 = objc_msgSend(v4, "count");
  v6 = -[NavTrayViewController isInArrivalState](self, "isInArrivalState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureTableView](self, "shareETADisclosureTableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
  objc_msgSend(v9, "removeFromSuperview");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureTableView](self, "shareETADisclosureTableView"));
  objc_msgSend(v10, "removeFromSuperview");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController receivingContacts](self, "receivingContacts"));
  v12 = objc_msgSend(v11, "count");

  v96 = v8;
  v97 = v4;
  if (!v12 || (v6 & 1) != 0)
  {
    if (!self->_displayingInitialBanner
      || (v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance")),
          v32 = objc_msgSend(v31, "canAddReceivers"),
          v31,
          ((v32 ^ 1 | v6) & 1) != 0))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
      objc_msgSend(v33, "setTitle:forState:", 0, 0);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
      objc_msgSend(v34, "setUserInteractionEnabled:", 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureView](self, "shareETADisclosureView"));
      v36 = 1;
      objc_msgSend(v35, "setHidden:", 1);

      goto LABEL_14;
    }
    if (v5 == (id)1)
    {
      v37 = sub_1007FCE24();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "contact"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "meCard"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
        *(_DWORD *)buf = 134349571;
        v102 = self;
        v103 = 2113;
        v104 = v40;
        v105 = 2113;
        v106 = v43;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}p] Will show share ETA disclosure for contact: %{private}@, with meIdentifier: %{private}@", buf, 0x20u);

      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureView](self, "shareETADisclosureView"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureTableView](self, "shareETADisclosureTableView"));
      objc_msgSend(v44, "addSubview:", v45);

      v94 = (void *)objc_claimAutoreleasedReturnValue(-[ContentSizedTableView leadingAnchor](self->_shareETADisclosureTableView, "leadingAnchor"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_shareETADisclosureView, "leadingAnchor"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v91));
      v100[0] = v88;
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[ContentSizedTableView trailingAnchor](self->_shareETADisclosureTableView, "trailingAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_shareETADisclosureView, "trailingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v46));
      v100[1] = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ContentSizedTableView topAnchor](self->_shareETADisclosureTableView, "topAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_shareETADisclosureView, "topAnchor"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
      v100[2] = v50;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContentSizedTableView bottomAnchor](self->_shareETADisclosureTableView, "bottomAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_shareETADisclosureView, "bottomAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
      v100[3] = v53;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v54);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureTableView](self, "shareETADisclosureTableView"));
      objc_msgSend(v55, "reloadData");
    }
    else
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v95 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("[NavTray] Share ETA Hint"), CFSTR("localized string not found"), 0));

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
      objc_msgSend(v57, "setTitle:forState:", v95, 0);

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
      objc_msgSend(v58, "setUserInteractionEnabled:", 1);

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureView](self, "shareETADisclosureView"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
      objc_msgSend(v59, "addSubview:", v60);

      v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_shareETADisclosureButton, "leadingAnchor"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_shareETADisclosureView, "leadingAnchor"));
      -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v89));
      v99[0] = v86;
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_shareETADisclosureButton, "trailingAnchor"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_shareETADisclosureView, "trailingAnchor"));
      -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v61, -v62));
      v99[1] = v63;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_shareETADisclosureButton, "topAnchor"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_shareETADisclosureView, "topAnchor"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v65));
      v99[2] = v66;
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_shareETADisclosureButton, "bottomAnchor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_shareETADisclosureView, "bottomAnchor"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v68));
      v99[3] = v69;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v70);

      v55 = (void *)v95;
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureView](self, "shareETADisclosureView"));
    objc_msgSend(v71, "setHidden:", 0);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[NavTray] Sharing with %lu"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController receivingContacts](self, "receivingContacts"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, objc_msgSend(v15, "count")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
    objc_msgSend(v16, "setTitle:forState:", v93, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
    objc_msgSend(v17, "setUserInteractionEnabled:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureView](self, "shareETADisclosureView"));
    objc_msgSend(v18, "setHidden:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureView](self, "shareETADisclosureView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
    objc_msgSend(v19, "addSubview:", v20);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_shareETADisclosureButton, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_shareETADisclosureView, "leadingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v87));
    v107[0] = v84;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_shareETADisclosureButton, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_shareETADisclosureView, "trailingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](self->_metrics, "defaultHorizontalPadding");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v21, -v22));
    v107[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_shareETADisclosureButton, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_shareETADisclosureView, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v107[2] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_shareETADisclosureButton, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_shareETADisclosureView, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    v107[3] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  }
  v36 = 0;
LABEL_14:
  v72 = sub_1007FCE24();
  v73 = objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "titleForState:", 0));
    *(_DWORD *)buf = 134349314;
    v102 = self;
    v103 = 2112;
    v104 = v75;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "[%{public}p] Share ETA disclosure is now: %@", buf, 0x16u);

  }
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_1007FE094;
  v98[3] = &unk_1011AC860;
  v98[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v98);
  -[UIView setHidden:](self->_shareETADisclosureView, "setHidden:", v36);
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "superview"));
  if (v77)
    v78 = -[NavTrayViewController isInArrivalState](self, "isInArrivalState");
  else
    v78 = 1;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView hairlineView](self->_navHeaderView, "hairlineView"));
  objc_msgSend(v79, "setHidden:", v78);

  -[NavTrayViewController _shareETADisclosureTopPosition](self, "_shareETADisclosureTopPosition");
  -[NSLayoutConstraint setConstant:](self->_shareETADisclosureTopConstraint, "setConstant:");
  if (!v96)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureTableView](self, "shareETADisclosureTableView"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "superview"));

    if (v81)
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 45, 91, 0);
  }

}

- (void)_updateWithRoute:(id)a3
{
  GEOComposedRoute *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  id v8;
  GEOComposedRoute *route;
  id v10;
  NSObject *v11;
  char *v12;
  void *v13;
  BOOL v14;
  void *v15;
  _BOOL4 v16;
  NavSARAPIController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  NSObject *v27;
  id v28;
  NavTrayViewController *v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  id v33;
  NSObject *v34;
  id v35;
  NavTrayViewController *v36;
  void *v37;
  void *v38;
  char *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  NavTrayViewController *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;

  v5 = (GEOComposedRoute *)a3;
  v43 = 0;
  v6 = -[NavTrayViewController _shouldEnableShareETAForRoute:disabledForReasons:](self, "_shouldEnableShareETAForRoute:disabledForReasons:", v5, &v43);
  v39 = (char *)v43;
  v42 = 0;
  v7 = -[NavTrayViewController _shouldEnableTrafficIncidentsForRoute:disabledForReasons:](self, "_shouldEnableTrafficIncidentsForRoute:disabledForReasons:", v5, &v42);
  v8 = v42;
  route = self->_route;
  if (route != v5)
  {
    v10 = sub_1007FCE24();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (char *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](v5, "uniqueRouteID"));
      *(_DWORD *)buf = 134349314;
      v45 = self;
      v46 = 2114;
      v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Updating route: %{public}@", buf, 0x16u);

    }
    objc_storeStrong((id *)&self->_route, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
    v14 = objc_msgSend(v13, "transportType") == 2;

    if (v14)
    {
      -[NavTrayViewController setCategoriesAPIController:](self, "setCategoriesAPIController:", 0);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController categoriesAPIController](self, "categoriesAPIController"));
      v16 = v15 == 0;

      if (v16)
      {
        v17 = objc_alloc_init(NavSARAPIController);
        -[NavTrayViewController setCategoriesAPIController:](self, "setCategoriesAPIController:", v17);

      }
      objc_initWeak((id *)buf, self);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController categoriesAPIController](self, "categoriesAPIController"));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1007FE7F0;
      v40[3] = &unk_1011AD260;
      objc_copyWeak(&v41, (id *)buf);
      objc_msgSend(v18, "fetchSARCategoriesOnCompletionHandler:", v40);

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
    }
    self->_analyticsTarget = -[NavTrayViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self->_route, "destination"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navDisplayName"));

    if (objc_msgSend(v20, "length"))
    {
      -[NavTrayHeaderView setDestinationName:](self->_navHeaderView, "setDestinationName:", v20);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[NavTray] Default Rerouting Title"), CFSTR("localized string not found"), 0));
      -[NavTrayHeaderView setDestinationName:](self->_navHeaderView, "setDestinationName:", v22);

    }
    if (self->_isSteppingMode)
      -[NavTrayViewController setCurrentStepIndex:](self, "setCurrentStepIndex:", 0);

  }
  if (self->_enableTrafficIncidents == v7 && self->_enableShareETA == v6)
  {
    if (route == v5)
      goto LABEL_44;
    goto LABEL_43;
  }
  self->_enableShareETA = v6;
  v23 = sub_1007FCE24();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v25)
    {
      *(_DWORD *)buf = 134349314;
      v45 = self;
      v46 = 2114;
      v47 = v39;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Share ETA action is now disabled for reasons: %{public}@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  if (v25)
  {
    *(_DWORD *)buf = 134349056;
    v45 = self;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Share ETA action is now enabled", buf, 0xCu);
  }

  if (objc_msgSend(v39, "count"))
  {
    v26 = sub_1004318FC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v45 = (NavTrayViewController *)"-[NavTrayViewController _updateWithRoute:]";
      v46 = 2080;
      v47 = "NavTrayViewController.m";
      v48 = 1024;
      v49 = 646;
      v50 = 2080;
      v51 = "sharingDisabledReasons.count == 0";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v28 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = (NavTrayViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v45 = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
LABEL_30:

    }
  }
  self->_enableTrafficIncidents = v7;
  v30 = sub_1007FCE24();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v32)
    {
      *(_DWORD *)buf = 134349056;
      v45 = self;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] Report Incident action is now enabled", buf, 0xCu);
    }

    if (!objc_msgSend(v8, "count"))
      goto LABEL_43;
    v33 = sub_1004318FC();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v45 = (NavTrayViewController *)"-[NavTrayViewController _updateWithRoute:]";
      v46 = 2080;
      v47 = "NavTrayViewController.m";
      v48 = 1024;
      v49 = 654;
      v50 = 2080;
      v51 = "reportingDisabledReasons.count == 0";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (!sub_100A70734())
      goto LABEL_43;
    v35 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v36 = (NavTrayViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v45 = v36;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  else if (v32)
  {
    *(_DWORD *)buf = 134349314;
    v45 = self;
    v46 = 2114;
    v47 = (const char *)v8;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] Report Incident action is now disabled for reasons: %{public}@", buf, 0x16u);
  }

LABEL_43:
  -[NavTrayViewController _computeSections](self, "_computeSections");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
  objc_msgSend(v37, "reloadData");

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v38, "updateHeightForCurrentLayout");

LABEL_44:
}

- (void)setConnectedToCarPlay:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  if (self->_connectedToCarPlay != a3)
  {
    self->_connectedToCarPlay = a3;
    if (-[NavTrayViewController isInArrivalState](self, "isInArrivalState"))
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
      v5 = objc_msgSend(v4, "legIndexForStepIndex:", objc_msgSend(v6, "stepIndex"));

      -[NavTrayViewController _handleArrivalAtEndOfLegIndex:forced:service:](self, "_handleArrivalAtEndOfLegIndex:forced:service:", v5, 1, v6);
    }
  }
}

- (id)_delegate
{
  return objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                                                + OBJC_IVAR___NavTrayViewController__steppingDelegate[4 * !self->_isSteppingMode])));
}

- (_TtC4Maps28NavigationWaypointController)waypointController
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  NavTrayViewController *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentNavigationSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypointController"));

  if (!v5)
  {
    v6 = sub_1007FCE24();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "[%{public}p] Couldn't find a navigation waypoint controller within NavTrayViewController.", (uint8_t *)&v9, 0xCu);
    }

  }
  return (_TtC4Maps28NavigationWaypointController *)v5;
}

- (NSArray)waypointRows
{
  NSArray *waypointRows;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;

  waypointRows = self->_waypointRows;
  if (!waypointRows)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointController](self, "waypointController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayedWaypoints"));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NavTrayWaypointRow waypointRowsFromNavigationService:withWaypoints:](NavTrayWaypointRow, "waypointRowsFromNavigationService:withWaypoints:", v4, v6));
    v8 = self->_waypointRows;
    self->_waypointRows = v7;

    waypointRows = self->_waypointRows;
  }
  return waypointRows;
}

- (void)_computeSections
{
  NSMutableDictionary *v3;
  NSMutableArray *v4;
  void *v5;
  NSMutableArray *v6;
  _UNKNOWN **v7;
  NSDictionary *traySections;
  NSMutableDictionary *v9;
  NSArray *usedSections;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  NavTrayViewController *v15;
  __int16 v16;
  void *v17;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointRows](self, "waypointRows"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, &off_10126F040);

  -[NSMutableArray addObject:](v4, "addObject:", &off_10126F040);
  v6 = objc_opt_new(NSMutableArray);
  if (self->_isSteppingMode)
  {
    v7 = &off_10126F088;
LABEL_11:
    -[NSMutableArray addObject:](v6, "addObject:", v7);
    goto LABEL_12;
  }
  if (-[NavTrayViewController _shouldEnableAddStop](self, "_shouldEnableAddStop"))
    -[NSMutableArray addObject:](v6, "addObject:", &off_10126F0A0);
  if (-[NavTrayViewController enableShareETA](self, "enableShareETA"))
    -[NSMutableArray addObject:](v6, "addObject:", &off_10126F0B8);
  if (-[NavTrayViewController enableTrafficIncidents](self, "enableTrafficIncidents"))
    -[NSMutableArray addObject:](v6, "addObject:", &off_10126F0D0);
  if (-[NavTrayViewController _shouldEnableVoiceVolumeControl](self, "_shouldEnableVoiceVolumeControl"))
  {
    v7 = &off_10126F0E8;
    goto LABEL_11;
  }
LABEL_12:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, &off_10126F058);
  -[NSMutableArray addObject:](v4, "addObject:", &off_10126F058);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &off_101273DB8, &off_10126F070);
  -[NSMutableArray addObject:](v4, "addObject:", &off_10126F070);
  traySections = self->_traySections;
  self->_traySections = &v3->super;
  v9 = v3;

  usedSections = self->_usedSections;
  self->_usedSections = &v4->super;

  v11 = sub_1007FCE24();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _traySectionsDescription](self, "_traySectionsDescription"));
    v14 = 134349314;
    v15 = self;
    v16 = 2114;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Tray sections are now: %{public}@", (uint8_t *)&v14, 0x16u);

  }
}

- (id)_traySectionsDescription
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const char *v17;
  id v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  unint64_t v32;
  const __CFString *v33;
  id v34;
  NSObject *v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  char *v39;
  const __CFString *v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  char *v45;
  id v46;
  NSArray *v48;
  NavTrayViewController *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id obj;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  int v75;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("["));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v4 = self->_usedSections;
  v51 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v51)
  {
    v5 = *(_QWORD *)v64;
    v49 = self;
    v50 = *(_QWORD *)v64;
    v48 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v64 != v5)
          objc_enumerationMutation(v4);
        v52 = v6;
        v7 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "unsignedIntegerValue");
        if (v8 == (id)2)
        {
          v40 = CFSTR("End");
LABEL_54:
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ {"), v40);
          goto LABEL_55;
        }
        if (v8 != (id)1)
        {
          if (!v8)
          {
            objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ {"), CFSTR("Waypoints"));
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v7));
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            obj = v9;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
            if (!v10)
              goto LABEL_29;
            v11 = v10;
            v54 = *(_QWORD *)v60;
            while (1)
            {
              v12 = 0;
              do
              {
                v13 = v3;
                if (*(_QWORD *)v60 != v54)
                  objc_enumerationMutation(obj);
                v14 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v12);
                v15 = objc_msgSend(v14, "waypointIndex");
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waypoint"));
                if (objc_msgSend(v16, "isServerProvidedWaypoint"))
                  v17 = " (server-provided)";
                else
                  v17 = "";
                v18 = v14;
                v19 = v18;
                if (v18)
                {
                  v20 = (objc_class *)objc_opt_class(v18);
                  v21 = NSStringFromClass(v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                  if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) == 0)
                    goto LABEL_22;
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "performSelector:", "accessibilityIdentifier"));
                  v24 = v23;
                  if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
                  {
                    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

                  }
                  else
                  {

LABEL_22:
                    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
                  }

                  goto LABEL_25;
                }
                v25 = CFSTR("<nil>");
LABEL_25:

                v3 = v13;
                objc_msgSend(v13, "appendFormat:", CFSTR("\n\t\tWaypoint %lu%s (%@)"), v15, v17, v25);

                v12 = (char *)v12 + 1;
              }
              while (v11 != v12);
              v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
              v11 = v26;
              if (!v26)
              {
LABEL_29:

                v4 = v48;
                self = v49;
                v5 = v50;
                goto LABEL_55;
              }
            }
          }
          v41 = sub_1004318FC();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v71 = "NSString *NavTrayViewControllerSectionToString(NavTrayViewControllerSection)";
            v72 = 2080;
            v73 = "NavTrayViewController.m";
            v74 = 1024;
            v75 = 124;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v43 = sub_1004318FC();
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = 138412290;
              v71 = v45;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
          }
          v40 = CFSTR("(Unknown)");
          goto LABEL_54;
        }
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ {"), CFSTR("Actions"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v7));
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v30)
                objc_enumerationMutation(v27);
              v32 = (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue");
              if (v32 >= 5)
              {
                v34 = sub_1004318FC();
                v35 = objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v71 = "NSString *NavTrayViewControllerActionToString(NavTrayViewControllerAction)";
                  v72 = 2080;
                  v73 = "NavTrayViewController.m";
                  v74 = 1024;
                  v75 = 104;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
                }

                v36 = sub_100A70734();
                v33 = CFSTR("(Unknown)");
                if (v36)
                {
                  v37 = sub_1004318FC();
                  v38 = objc_claimAutoreleasedReturnValue(v37);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                    *(_DWORD *)buf = 138412290;
                    v71 = v39;
                    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                  }
                  v33 = CFSTR("(Unknown)");
                }
              }
              else
              {
                v33 = off_1011C9950[v32];
              }
              objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t%@"), v33);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          }
          while (v29);
        }

        v5 = v50;
LABEL_55:
        objc_msgSend(v3, "appendString:", CFSTR("\n\t}"));
        v6 = v52 + 1;
      }
      while ((id)(v52 + 1) != v51);
      v51 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v51);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n]"));
  v46 = objc_msgSend(v3, "copy");

  return v46;
}

- (BOOL)_shouldEnableShareETAForRoute:(id)a3 disabledForReasons:(id *)a4
{
  id v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  char v18;
  char v19;
  id v20;
  void *v21;

  v6 = a3;
  v8 = MSPSharedTripSharingAvailable(v6, v7);
  v9 = objc_msgSend(v6, "transportType");

  if (v9 - 1 > 5)
    v10 = 1;
  else
    v10 = qword_100E3BF60[v9 - 1];
  v11 = MSPSharedTripSharingSupportedForTransportType(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v13 = objc_msgSend(v12, "canAddReceivers");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "receivers"));
  v16 = objc_msgSend(v15, "count");

  if (self->_isSteppingMode)
    v17 = 0;
  else
    v17 = v8;
  if (v17 != 1)
  {
    v19 = 0;
    if (!a4)
      return v19;
LABEL_14:
    if ((v19 & 1) != 0)
      return v19;
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
    v21 = v20;
    if (self->_isSteppingMode)
      objc_msgSend(v20, "addObject:", CFSTR("stepping navigation"));
    if ((v8 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(v21, "addObject:", CFSTR("sharing not available"));
      if ((v11 & 1) != 0)
      {
LABEL_19:
        if ((v13 & 1) != 0)
          goto LABEL_20;
        goto LABEL_26;
      }
    }
    objc_msgSend(v21, "addObject:", CFSTR("incompatible transport type"));
    if ((v13 & 1) != 0)
    {
LABEL_20:
      if (!v16)
      {
LABEL_22:
        *a4 = objc_msgSend(v21, "copy");

        return v19;
      }
LABEL_21:
      objc_msgSend(v21, "addObject:", CFSTR("no current receivers"));
      goto LABEL_22;
    }
LABEL_26:
    objc_msgSend(v21, "addObject:", CFSTR("cannot add receivers"));
    if (!v16)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v16)
    v18 = 1;
  else
    v18 = v13;
  v19 = v11 & v18;
  if (a4)
    goto LABEL_14;
  return v19;
}

- (BOOL)_isSharingTrip
{
  return -[NSArray count](self->_receivingContacts, "count") != 0;
}

- (BOOL)_shouldEnableTrafficIncidentsForRoute:(id)a3 disabledForReasons:(id *)a4
{
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  id v9;
  void *v10;

  v5 = objc_msgSend(a3, "transportType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v7 = objc_msgSend(v6, "isIncidentReportingEnabled");

  if (v5)
    v8 = 0;
  else
    v8 = v7;
  if (a4 && !v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
    v10 = v9;
    if (v5)
      objc_msgSend(v9, "addObject:", CFSTR("incompatible transport type"));
    if ((v7 & 1) == 0)
      objc_msgSend(v10, "addObject:", CFSTR("incident reporting disabled"));
    *a4 = objc_msgSend(v10, "copy");

  }
  return v8;
}

- (BOOL)_shouldEnableAddStop
{
  uint64_t UInteger;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  char IsEnabled_Maps182;
  char v13;
  void *v14;
  void *v15;

  UInteger = GEOConfigGetUInteger(MapsConfig_MPRWaypointLimit, off_1014B4858);
  if (UInteger)
  {
    v4 = UInteger;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userRequestedWaypoints"));
    v7 = objc_msgSend(v6, "count");

    if ((unint64_t)v7 >= v4)
      return 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v9 = objc_msgSend(v8, "transportType");
  switch((int)v9)
  {
    case 1:
    case 6:

      goto LABEL_11;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v9);
      break;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v9);
      break;
    default:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v9, v10);
      break;
  }
  v13 = IsEnabled_Maps182;

  if ((v13 & 1) != 0)
    return 1;
LABEL_11:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController categoriesAPIController](self, "categoriesAPIController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "categories"));
  v11 = objc_msgSend(v15, "count") != 0;

  return v11;
}

- (BOOL)_shouldEnableVoiceVolumeControl
{
  return GEOConfigGetBOOL(MapsConfig_EnableVoiceVolumeControl, off_1014B48E8);
}

- (void)_resumedFromSAR
{
  id v3;
  NSObject *v4;
  int v5;
  NavTrayViewController *v6;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Resuming navigation to original destination", (uint8_t *)&v5, 0xCu);
  }

  -[NavTrayViewController _resumeNavigation](self, "_resumeNavigation");
}

- (void)_startTimerToDisplayInitialBanner
{
  id v3;
  GCDTimer *v4;
  GCDTimer *sharedTripAnimationTimer;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007FF970;
  v6[3] = &unk_1011AE190;
  objc_copyWeak(&v7, &location);
  v4 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v6, 2.0));
  sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
  self->_sharedTripAnimationTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_startTimerToDismissInitialBanner
{
  double Double;
  id v4;
  GCDTimer *v5;
  GCDTimer *sharedTripAnimationTimer;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  Double = GEOConfigGetDouble(MapsConfig_ShareETANavigationBannerDismissInterval, off_1014B3E08);
  v4 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007FFBE8;
  v7[3] = &unk_1011AE190;
  objc_copyWeak(&v8, &location);
  v5 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v7, Double));
  sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
  self->_sharedTripAnimationTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4
{
  NSArray *waypointRows;
  void *v6;
  id v7;

  waypointRows = self->_waypointRows;
  self->_waypointRows = 0;

  -[NavTrayViewController _computeSections](self, "_computeSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "updateHeightForCurrentLayout");

}

- (void)pressedHeaderView
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = objc_msgSend(v3, "containeeLayout");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v7 = v5;
  if (v4 == (id)1)
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v5, "wantsLayout:", v6);

}

- (void)updatedHeight
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v2, "updateHeightForCurrentLayout");

}

- (id)tourMuid
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));

  if (objc_msgSend(v4, "tourMuid"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v4, "tourMuid")));
  else
    v5 = 0;

  return v5;
}

- (void)styleButton:(id)a3 ofType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NavTrayViewController *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  const char *v30;
  NavTrayViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  NavTrayViewController *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  NavTrayViewController *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  unsigned int v90;
  const __CFString *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  NSObject *v103;
  id v104;
  NSObject *v105;
  char *v106;
  id v107;
  void *v108;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  _QWORD v116[2];
  _QWORD v117[2];
  uint8_t buf[4];
  const char *v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  int v123;
  __int16 v124;
  const char *v125;
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];

  v115 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v5, "setTitleLineBreakMode:", 4);
  objc_msgSend(v5, "setCornerStyle:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
  -[NavTrayMetrics cornerRadius](self->_metrics, "cornerRadius");
  objc_msgSend(v6, "setCornerRadius:");
  objc_msgSend(v5, "setBackground:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics endButtonTextStyle](self->_metrics, "endButtonTextStyle"));
  -[NavTrayMetrics endButtonFontWeight](self->_metrics, "endButtonFontWeight");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v7, v11, v9));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics endButtonIconTextStyle](self->_metrics, "endButtonIconTextStyle"));
  -[NavTrayMetrics endButtonIconFontWeight](self->_metrics, "endButtonIconFontWeight");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v18 = v115;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v13, v17, v15));

  v20 = v6;
  v21 = self;
  objc_msgSend(v115, "removeTarget:action:forControlEvents:", self, 0, 64);
  switch(a4)
  {
    case 1uLL:
      v22 = objc_alloc((Class)NSAttributedString);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v110 = v19;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("[NavTray] End Title"), CFSTR("localized string not found"), 0));
      v137[0] = v12;
      v136[0] = NSFontAttributeName;
      v136[1] = NSForegroundColorAttributeName;
      v25 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v21, "_foregroundColorForButtonType:", 1));
      v137[1] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v137, v136, 2));
      v28 = objc_msgSend(v22, "initWithString:attributes:", v24, v27);
      objc_msgSend(v5, "setAttributedTitle:", v28);

      v20 = v25;
      v19 = v110;

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      objc_msgSend(v20, "setBackgroundColor:", v29);

      v30 = "_pressedEndRoute";
      goto LABEL_8;
    case 2uLL:
      v65 = objc_alloc((Class)NSAttributedString);
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v112 = v19;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("[NavTray] Pause Title"), CFSTR("localized string not found"), 0));
      v135[0] = v12;
      v134[0] = NSFontAttributeName;
      v134[1] = NSForegroundColorAttributeName;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v21, "_foregroundColorForButtonType:", 2));
      v135[1] = v68;
      v69 = v20;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v135, v134, 2));
      v71 = objc_msgSend(v65, "initWithString:attributes:", v67, v70);
      objc_msgSend(v5, "setAttributedTitle:", v71);

      v20 = v69;
      v19 = v112;

      v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      objc_msgSend(v20, "setBackgroundColor:", v72);

      v30 = "_pressedPauseRoute";
LABEL_8:
      v18 = v115;
      v52 = v115;
      v53 = v21;
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(v5, "setImagePadding:", 8.0);
      v111 = v19;
      v31 = self;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v19, -[NavTrayMetrics endButtonIconImageSymbolScale](self->_metrics, "endButtonIconImageSymbolScale")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v32));
      objc_msgSend(v5, "setImage:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v21, "_foregroundColorForButtonType:", 3));
      objc_msgSend(v5, "setBaseForegroundColor:", v34);

      v35 = objc_alloc((Class)NSAttributedString);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("[NavTray] Other Stations Title"), CFSTR("localized string not found"), 0));
      v133[0] = v12;
      v132[0] = NSFontAttributeName;
      v132[1] = NSForegroundColorAttributeName;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v31, "_foregroundColorForButtonType:", 3));
      v133[1] = v38;
      v39 = v20;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v133, v132, 2));
      v41 = objc_msgSend(v35, "initWithString:attributes:", v37, v40);
      objc_msgSend(v5, "setAttributedTitle:", v41);

      v20 = v39;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      objc_msgSend(v39, "setBackgroundColor:", v42);

      v30 = "_pressedOtherStations";
      goto LABEL_6;
    case 4uLL:
      v43 = self;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](self, "_foregroundColorForButtonType:", 4));
      objc_msgSend(v5, "setBaseForegroundColor:", v44);

      v45 = objc_alloc((Class)NSAttributedString);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("[NavTray] Resume Title"), CFSTR("localized string not found"), 0));
      v131[0] = v12;
      v130[0] = NSFontAttributeName;
      v130[1] = NSForegroundColorAttributeName;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v43, "_foregroundColorForButtonType:", 4));
      v131[1] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v131, v130, 2));
      v50 = objc_msgSend(v45, "initWithString:attributes:", v47, v49);
      objc_msgSend(v5, "setAttributedTitle:", v50);

      v20 = v6;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      objc_msgSend(v6, "setBackgroundColor:", v51);

      v30 = "_pressedResumeRoute";
      v18 = v115;
      v52 = v115;
      v53 = v43;
      goto LABEL_9;
    case 5uLL:
      objc_msgSend(v5, "setImagePadding:", 8.0);
      v111 = v19;
      v31 = self;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v19, -[NavTrayMetrics endButtonIconImageSymbolScale](self->_metrics, "endButtonIconImageSymbolScale")));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("findmy"), v54));
      objc_msgSend(v5, "setImage:", v55);

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v21, "_foregroundColorForButtonType:", 5));
      objc_msgSend(v5, "setBaseForegroundColor:", v56);

      v57 = objc_alloc((Class)NSAttributedString);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("[NavTray] Find My Title"), CFSTR("localized string not found"), 0));
      v129[0] = v12;
      v128[0] = NSFontAttributeName;
      v128[1] = NSForegroundColorAttributeName;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v31, "_foregroundColorForButtonType:", 5));
      v129[1] = v60;
      v61 = v20;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v129, v128, 2));
      v63 = objc_msgSend(v57, "initWithString:attributes:", v59, v62);
      objc_msgSend(v5, "setAttributedTitle:", v63);

      v20 = v61;
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      objc_msgSend(v61, "setBackgroundColor:", v64);

      v30 = "_pressedFindMy";
LABEL_6:
      v19 = v111;
      v18 = v115;
      v52 = v115;
      v53 = v31;
LABEL_9:
      objc_msgSend(v52, "addTarget:action:forControlEvents:", v53, v30, 64);
      break;
    case 6uLL:
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "alternateWalkingRouteDisplayETAInfo"));

      v74 = GEOStringForDuration(2, (double)(unint64_t)objc_msgSend(v113, "remainingMinutesToEndOfRoute") * 60.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
      objc_msgSend(v5, "setImagePadding:", 8.0);
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v19, -[NavTrayMetrics endButtonIconImageSymbolScale](self->_metrics, "endButtonIconImageSymbolScale")));
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("figure.walk"), v76));
      objc_msgSend(v5, "setImage:", v77);

      v78 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](self, "_foregroundColorForButtonType:", 6));
      objc_msgSend(v5, "setBaseForegroundColor:", v78);

      v79 = objc_alloc((Class)NSAttributedString);
      v127[0] = v12;
      v126[0] = NSFontAttributeName;
      v126[1] = NSForegroundColorAttributeName;
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](self, "_foregroundColorForButtonType:", 6));
      v127[1] = v80;
      v81 = v20;
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126, 2));
      v83 = objc_msgSend(v79, "initWithString:attributes:", v75, v82);
      objc_msgSend(v5, "setAttributedTitle:", v83);

      v20 = v81;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      objc_msgSend(v81, "setBackgroundColor:", v84);

      v18 = v115;
      objc_msgSend(v115, "addTarget:action:forControlEvents:", self, "_pressedWalkingRoute", 64);

      break;
    case 7uLL:
      v85 = v19;
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "destination"));

      v114 = v87;
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "route"));
      v89 = v12;
      if (!v88)
      {
        v102 = sub_1004318FC();
        v103 = objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v119 = "-[NavTrayViewController styleButton:ofType:]";
          v120 = 2080;
          v121 = "NavTrayViewController.m";
          v122 = 1024;
          v123 = 997;
          v124 = 2080;
          v125 = "customRoute != nil";
          _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v104 = sub_1004318FC();
          v105 = objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
          {
            v106 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v119 = v106;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
          v89 = v12;
        }
      }
      v90 = objc_msgSend(v88, "transportType") - 1;
      v108 = v20;
      if (v90 > 5)
        v91 = CFSTR("car.fill");
      else
        v91 = off_1011C9978[v90];
      objc_msgSend(v5, "setImagePadding:", 8.0, v88);
      v19 = v85;
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v85, -[NavTrayMetrics endButtonIconImageSymbolScale](v21->_metrics, "endButtonIconImageSymbolScale")));
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v91, v92));
      objc_msgSend(v5, "setImage:", v93);

      v94 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v21, "_foregroundColorForButtonType:", 7));
      objc_msgSend(v5, "setBaseForegroundColor:", v94);

      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("[NavTray] Start"), CFSTR("localized string not found"), 0));

      v97 = objc_alloc((Class)NSAttributedString);
      v117[0] = v89;
      v116[0] = NSFontAttributeName;
      v116[1] = NSForegroundColorAttributeName;
      v98 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _foregroundColorForButtonType:](v21, "_foregroundColorForButtonType:", 7));
      v117[1] = v98;
      v12 = v89;
      v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v117, v116, 2));
      v100 = objc_msgSend(v97, "initWithString:attributes:", v96, v99);
      objc_msgSend(v5, "setAttributedTitle:", v100);

      v101 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      v20 = v108;
      objc_msgSend(v108, "setBackgroundColor:", v101);

      v18 = v115;
      objc_msgSend(v115, "addTarget:action:forControlEvents:", v21, "_pressedCustomRoute", 64);

      break;
    default:
      break;
  }
  objc_msgSend(v18, "setConfiguration:", v5);

}

- (void)feedbackViewDidSelectThumbsUp
{
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v4 = objc_msgSend(v3, "transportType");
  if (v4 >= 7)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v4));
  else
    v5 = *(&off_1011C99A8 + (int)v4);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 243, 31, v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "pressedEndWithSender:feedback:", self, 1);

}

- (void)feedbackViewDidSelectThumbsDown
{
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v4 = objc_msgSend(v3, "transportType");
  if (v4 >= 7)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v4));
  else
    v5 = *(&off_1011C99A8 + (int)v4);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 228, 31, v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "pressedEndWithSender:feedback:", self, 2);

}

- (void)handleDismissAction:(id)a3
{
  -[NavTrayViewController _pressedEndRoute](self, "_pressedEndRoute", a3);
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int analyticsTarget;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  id WeakRetained;
  double v16;
  _QWORD v17[6];
  BOOL v18;
  _QWORD block[4];
  int v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController willChangeLayout:](&v21, "willChangeLayout:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  if (v6 && (unint64_t)v6 < a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
    objc_msgSend(v7, "reloadData");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
    v9 = (uint64_t)objc_msgSend(v8, "numberOfSections");

    if (v9 >= 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 2));
      objc_msgSend(v10, "scrollToRowAtIndexPath:atScrollPosition:animated:", v11, 3, 0);

    }
    analyticsTarget = self->_analyticsTarget;
    global_queue = dispatch_get_global_queue(33, 0);
    v14 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100801070;
    block[3] = &unk_1011C9840;
    v20 = analyticsTarget;
    dispatch_async(v14, block);

    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    objc_msgSend(WeakRetained, "hideJunctionViewIfNeeded");

  }
  v16 = 0.0;
  v17[1] = 3221225472;
  v17[0] = _NSConcreteStackBlock;
  if (a3 == 2)
    v16 = 1.0;
  v17[2] = sub_10080108C;
  v17[3] = &unk_1011AFB78;
  v17[4] = self;
  v18 = a3 == 2;
  *(double *)&v17[5] = v16;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, 0.25);
}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v5;
  int v6;
  dispatch_queue_global_t v7;
  NSObject *v8;
  NSObject *WeakRetained;
  uint64_t v10;
  int analyticsTarget;
  dispatch_queue_global_t global_queue;
  _QWORD v13[4];
  int v14;
  _QWORD block[4];
  int v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController didChangeLayout:](&v17, "didChangeLayout:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (a3 == 2)
  {
    analyticsTarget = self->_analyticsTarget;
    global_queue = dispatch_get_global_queue(33, 0);
    WeakRetained = objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100801290;
    v13[3] = &unk_1011C9840;
    v14 = analyticsTarget;
    dispatch_async(WeakRetained, v13);
    v10 = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v6 = self->_analyticsTarget;
    v7 = dispatch_get_global_queue(33, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100801274;
    block[3] = &unk_1011C9840;
    v16 = v6;
    dispatch_async(v8, block);

    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    -[NSObject showJunctionViewIfNeeded](WeakRetained, "showJunctionViewIfNeeded");
    v10 = 0;
LABEL_5:

    objc_msgSend(v5, "setIsDisplayingNavigationTray:", v10);
  }

}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v10, "willChangeContainerStyle:");
  if (a3 <= 7 && ((1 << a3) & 0xE3) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
    v6 = (uint64_t)objc_msgSend(v5, "numberOfSections");

    if (v6 >= 2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
      objc_msgSend(v7, "reloadData");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 2));
      objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 3, 0);

    }
  }
}

- (void)applyAlphaToContent:(double)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController applyAlphaToContent:](&v7, "applyAlphaToContent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView hairlineView](self->_navHeaderView, "hairlineView"));
  objc_msgSend(v5, "setAlpha:", 1.0 - a3);

  if (-[NavTrayViewController isInArrivalState](self, "isInArrivalState") || !self->_viewDidAppear)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController contentView](self, "contentView"));
    objc_msgSend(v6, "setAlpha:", 0.0);

  }
}

- (double)_shareETADisclosureTopPosition
{
  void *v2;
  void *v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));

  result = 10.0;
  if (!v3)
    return 0.0;
  return result;
}

- (double)_shareETADisclosureHeight
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureView](self, "shareETADisclosureView"));
  v4 = objc_msgSend(v3, "isHidden");

  v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

    if (v7)
    {
      -[NavTrayViewController _shareETADisclosureTopPosition](self, "_shareETADisclosureTopPosition");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureButton](self, "shareETADisclosureButton"));
      objc_msgSend(v10, "intrinsicContentSize");
      v5 = v11 + v9 * 2.0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController shareETADisclosureTableView](self, "shareETADisclosureTableView"));
      objc_msgSend(v10, "intrinsicContentSize");
      v5 = v12;
    }

  }
  return v5;
}

- (BOOL)_isEligibleToShowWalkingButton
{
  void *v2;
  void *v3;
  unsigned int v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destination"));
  v4 = objc_msgSend(v3, "hasFindMyHandleID");

  if (v4)
    v5 = &MapsConfig_AllowWalkingRouteSuggestionForGTHandles;
  else
    v5 = &MapsConfig_AllowWalkingRouteSuggestionForPOIs;
  v6 = &off_1014B4E48;
  if (!v4)
    v6 = &off_1014B4E58;
  return GEOConfigGetBOOL(*v5, *v6);
}

- (BOOL)_isEligibleToShowFindMyButton
{
  return GEOConfigGetBOOL(MapsConfig_AllowGTSuggestionForGTHandles, off_1014B4F98);
}

- (BOOL)forceCurrentWidthForHeaderHeightCalculations
{
  return 1;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  v4 = -1.0;
  if (a3 == 2)
  {
    if (!-[NavTrayViewController isInArrivalState](self, "isInArrivalState"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
      objc_msgSend(v8, "setNeedsLayout");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
      objc_msgSend(v9, "layoutIfNeeded");

      -[NavTrayMetrics defaultVerticalPadding](self->_metrics, "defaultVerticalPadding");
      if (self->_usedSections)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
        objc_msgSend(v11, "contentSize");
        v6 = v12;

      }
      else
      {
        v6 = v10;
      }
      -[ContaineeViewController headerHeight](self, "headerHeight");
      goto LABEL_9;
    }
  }
  else if (a3 == 1)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v6 = v5;
    -[NavTrayViewController _shareETADisclosureHeight](self, "_shareETADisclosureHeight");
LABEL_9:
    v13 = v6 + v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v14, "bottomSafeOffset");
    v4 = v13 + v15;

  }
  return v4;
}

- (void)_pressedSAR
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  NavTrayViewController *v9;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed SAR", (uint8_t *)&v8, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6097, self->_analyticsTarget, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController categoriesAPIController](self, "categoriesAPIController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "categories"));
  objc_msgSend(WeakRetained, "presentAddStopUsingCategories:", v7);

}

- (void)_pressedShareETAInTray
{
  id v3;
  NSObject *v4;
  uint64_t analyticsTarget;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  uint8_t buf[4];
  NavTrayViewController *v11;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed share ETA in tray", buf, 0xCu);
  }

  analyticsTarget = self->_analyticsTarget;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v7 = objc_msgSend(v6, "transportType");
  if (v7 >= 7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v7));
  else
    v8 = *(&off_1011C99A8 + (int)v7);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9022, analyticsTarget, v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "senderShareNavigation:", self);

}

- (void)_pressedShareETADisclosureButton
{
  id v3;
  NSObject *v4;
  NSUInteger v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  uint8_t buf[4];
  NavTrayViewController *v12;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed share ETA disclosure button", buf, 0xCu);
  }

  v5 = -[NSArray count](self->_receivingContacts, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v7 = objc_msgSend(v6, "transportType");
  if (v7 >= 7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v7));
  else
    v8 = *(&off_1011C99A8 + (int)v7);
  if (v5)
    v9 = 102;
  else
    v9 = 9022;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v9, 505, v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "senderShareNavigation:", self);

}

- (void)_pressedReport
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  NavTrayViewController *v7;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed report incident", (uint8_t *)&v6, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 115, self->_analyticsTarget, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "displayIncidentReporting");

}

- (void)_pressedVoiceVolume
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  NavTrayViewController *v7;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed voice volume", (uint8_t *)&v6, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3003, 505, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "displayVoiceVolumeControl");

}

- (void)_pressedDetails
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NavTrayViewController *v7;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed details", (uint8_t *)&v6, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3004, 505, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _delegate](self, "_delegate"));
  objc_msgSend(v5, "pressedShowDirectionsListWithSender:", self);

}

- (void)_pressedEndRoute
{
  id v3;
  NSObject *v4;
  uint64_t analyticsTarget;
  void *v6;
  void *v7;
  int v8;
  NavTrayViewController *v9;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed end route", (uint8_t *)&v8, 0xCu);
  }

  analyticsTarget = self->_analyticsTarget;
  if (!-[NavTrayHeaderView arrivalState](self->_navHeaderView, "arrivalState"))
    goto LABEL_10;
  if ((id)-[NavTrayHeaderView currentAlternateButtonType](self->_navHeaderView, "currentAlternateButtonType") != (id)6)
  {
    if ((id)-[NavTrayHeaderView currentAlternateButtonType](self->_navHeaderView, "currentAlternateButtonType") == (id)5)
    {
      v6 = 0;
      analyticsTarget = 125;
      goto LABEL_11;
    }
    if ((id)-[NavTrayHeaderView currentAlternateButtonType](self->_navHeaderView, "currentAlternateButtonType") == (id)7)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tourMuid](self, "tourMuid"));
      analyticsTarget = 136;
      goto LABEL_11;
    }
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v6 = 0;
  analyticsTarget = 124;
LABEL_11:
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3002, analyticsTarget, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _delegate](self, "_delegate"));
  objc_msgSend(v7, "pressedEndWithSender:feedback:", self, 0);

}

- (void)_pressedPauseRoute
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  NavTrayViewController *v7;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed pause route", (uint8_t *)&v6, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6096, self->_analyticsTarget, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "pauseNavigation");

}

- (void)_pressedOtherStations
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NavTrayViewController *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NavTrayViewController *v24;
  int v25;
  NavTrayViewController *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = 136316418;
        v26 = (NavTrayViewController *)"-[NavTrayViewController _pressedOtherStations]";
        v27 = 2080;
        v28 = "NavTrayViewController.m";
        v29 = 1024;
        v30 = 1241;
        v31 = 2080;
        v32 = "dispatch_get_main_queue()";
        v33 = 2080;
        v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v35 = 2080;
        v36 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v25,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v22 = sub_1004318FC();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (NavTrayViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v25 = 138412290;
          v26 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

        }
      }
    }
  }
  v6 = sub_1007FCE24();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v25 = 134349056;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Pressed other stations", (uint8_t *)&v25, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrivalInfo"));
  if (objc_msgSend(v8, "isArrivedAtEVCharger"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destination"));
    v11 = objc_msgSend(v10, "muid");

    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    objc_msgSend(WeakRetained, "sendOtherEVStationsRequest:", v11);
  }
  else
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315650;
      v26 = (NavTrayViewController *)"-[NavTrayViewController _pressedOtherStations]";
      v27 = 2080;
      v28 = "NavTrayViewController.m";
      v29 = 1024;
      v30 = 1250;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v25, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (NavTrayViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v25 = 138412290;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

      }
    }
    v18 = sub_1007FCE24();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = 134349056;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[%{public}p] The charging info at this waypoint couldn't be found.", (uint8_t *)&v25, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    objc_msgSend(WeakRetained, "pauseNavigation");
  }

}

- (void)_pressedResumeRoute
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  NavTrayViewController *v7;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed resume route", (uint8_t *)&v6, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 292, self->_analyticsTarget, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "resumeNavigation");

}

- (void)_pressedFindMy
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  NavTrayViewController *v13;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 457, 125, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyHandleID"));

  v6 = sub_1007FCE24();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Pressed Find My button. Will prompt to unlock phone if necessary.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008025C4;
  v9[3] = &unk_1011B2260;
  objc_copyWeak(&v11, (id *)buf);
  v8 = v5;
  v10 = v8;
  +[UIApplication _maps_unlockApplicationWithCompletion:](UIApplication, "_maps_unlockApplicationWithCompletion:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (void)_pressedWalkingRoute
{
  unsigned int analyticsTarget;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v13;
  NavTrayViewController *v14;

  analyticsTarget = self->_analyticsTarget;
  if (-[NavTrayHeaderView arrivalState](self->_navHeaderView, "arrivalState"))
    v4 = 124;
  else
    v4 = analyticsTarget;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 456, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
  objc_msgSend(v5, "userAcceptedWalkingRoute");

  v6 = sub_1007FCE24();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Pressed walking button. Will transition to walking transport type.", (uint8_t *)&v13, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alternateWalkingRoute"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v10, "changeTransportType:route:", 2, v9);

    v11 = objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    -[NSObject wantsLayout:](v11, "wantsLayout:", 1);
  }
  else
  {
    v12 = sub_1007FCE24();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 134349056;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}p] No alternate walking route found. Cannot transition to walking transport type.", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)_pressedCustomRoute
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  NavTrayViewController *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tourMuid](self, "tourMuid"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 470, 136, v3);

  v4 = sub_1007FCE24();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 134349056;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Pressed custom route arrival transition button", (uint8_t *)&v11, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));

  if (v8)
  {
    objc_msgSend(v6, "switchToDestinationRoute");
  }
  else
  {
    v9 = sub_1007FCE24();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 134349056;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}p] No custom route found on the destination. Cannot transition the route.", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (id)_titleTextForAction:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  unsigned __int8 v7;

  switch(a3)
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[NavTray] Add Stop");
      goto LABEL_10;
    case 1uLL:
      v7 = -[NavTrayViewController _isSharingTrip](self, "_isSharingTrip");
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      if ((v7 & 1) != 0)
        v6 = CFSTR("[NavTray] Sharing ETA");
      else
        v6 = CFSTR("[NavTray] Share ETA");
      goto LABEL_10;
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[NavTray] Report an Incident");
      goto LABEL_10;
    case 3uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[NavTray] Voice Volume");
      goto LABEL_10;
    case 4uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[NavTray] Details");
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_imageForAction:(unint64_t)a3
{
  NavTrayViewController *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char IsEnabled_Maps182;
  char v10;

  v4 = self;
  if (qword_1014D34B8 != -1)
    dispatch_once(&qword_1014D34B8, &stru_1011C9860);
  v5 = CFSTR("exclamationmark.bubble.fill");
  switch(a3)
  {
    case 0uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](v4, "route", CFSTR("exclamationmark.bubble.fill")));
      v7 = objc_msgSend(v6, "transportType");
      switch((int)v7)
      {
        case 1:
        case 6:

          goto LABEL_16;
        case 2:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v7);
          break;
        case 3:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v7);
          break;
        default:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v7, v8);
          break;
      }
      v10 = IsEnabled_Maps182;

      if ((v10 & 1) != 0)
        v5 = CFSTR("plus");
      else
LABEL_16:
        v5 = CFSTR("magnifyingglass");
      goto LABEL_17;
    case 1uLL:
      if (-[NavTrayViewController _isSharingTrip](v4, "_isSharingTrip", CFSTR("exclamationmark.bubble.fill")))
        v5 = CFSTR("person.crop.circle.badge.checkmark");
      else
        v5 = CFSTR("person.crop.circle.badge.plus");
      goto LABEL_17;
    case 2uLL:
      goto LABEL_17;
    case 3uLL:
      v5 = CFSTR("speaker.wave.2.fill");
      goto LABEL_17;
    case 4uLL:
      v5 = CFSTR("list.bullet");
LABEL_17:
      self = (NavTrayViewController *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v5, qword_1014D34C0));
      break;
    default:
      return self;
  }
  return self;
}

- (id)_imageTintColorForAction:(unint64_t)a3
{
  if (a3 >= 4)
  {
    if (a3 == 4)
      self = (NavTrayViewController *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  else
  {
    self = (NavTrayViewController *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  }
  return self;
}

- (id)_backgroundImageTintColorForAction:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  switch(a3)
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
      if (objc_msgSend(v4, "accessibilityContrast") == (id)1)
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemDarkBlueColor](UIColor, "systemDarkBlueColor"));
      else
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      goto LABEL_15;
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
      if (objc_msgSend(v4, "accessibilityContrast") == (id)1)
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGreenColor](UIColor, "systemDarkGreenColor"));
      else
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      goto LABEL_15;
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
      if (objc_msgSend(v4, "accessibilityContrast") == (id)1)
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemDarkPinkColor](UIColor, "systemDarkPinkColor"));
      else
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemPinkColor](UIColor, "systemPinkColor"));
      goto LABEL_15;
    case 3uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
      if (objc_msgSend(v4, "accessibilityContrast") == (id)1)
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](UIColor, "systemDarkGrayColor"));
      else
        v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
LABEL_15:
      v3 = (void *)v5;

      break;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_foregroundColorForButtonType:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a3 - 3 >= 5)
  {
    if (a3 <= 2)
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v4, "userInterfaceStyle") == (id)2)
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    else
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v3 = (void *)v5;

  }
  return v3;
}

- (void)setCurrentStepIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  StepTrayHeaderView *v43;
  void *v44;
  void *v45;
  StepTrayHeaderView *stepHeaderView;
  uint64_t v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 > a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3));

    v10 = objc_msgSend(v5, "legIndexForRouteCoordinate:", -[NSObject startRouteCoordinate](v9, "startRouteCoordinate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
    v12 = objc_msgSend(v11, "count");

    if (v10 < v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startRouteStep"));
      objc_msgSend(v5, "remainingTimeToEndOfRouteFrom:etaRoute:", objc_msgSend(v13, "startRouteCoordinate"), 0);
      v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navDisplayName"));

      if (objc_msgSend(v17, "length"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[NavTray] To Destination"), CFSTR("localized string not found"), 0));
        v47 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v17));

      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[NavTray] Default Title"), CFSTR("localized string not found"), 0));
      }

      if (v15 <= 0.0)
        v32 = 0;
      else
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", (unint64_t)v15, 1));
      if (objc_msgSend(v17, "length"))
      {
        -[NavTrayHeaderView setDestinationName:](self->_navHeaderView, "setDestinationName:", v17);
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("[NavTray] Default Rerouting Title"), CFSTR("localized string not found"), 0));
        -[NavTrayHeaderView setDestinationName:](self->_navHeaderView, "setDestinationName:", v34);

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
      v36 = (char *)objc_msgSend(v35, "count") - 1;

      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR(" · [Route description delimiter]"), CFSTR("localized string not found"), 0));

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("count_of_stops"), CFSTR("localized string not found"), 0));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v36));

        if (v32)
          v42 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v32, v38, v41));
        else
          v42 = v41;
        v45 = v42;
        stepHeaderView = self->_stepHeaderView;
        v44 = (void *)v47;
        -[StepTrayHeaderView setDefaultTitle:defaultSubtitle:](stepHeaderView, "setDefaultTitle:defaultSubtitle:", v47, v45);

      }
      else
      {
        v43 = self->_stepHeaderView;
        v44 = (void *)v47;
        -[StepTrayHeaderView setDefaultTitle:defaultSubtitle:](v43, "setDefaultTitle:defaultSubtitle:", v47, v32);
      }

      goto LABEL_30;
    }
    v26 = sub_1004318FC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current leg index (%lu) is greater than the number of steps (%lu)"), v10, objc_msgSend(v28, "count")));
      *(_DWORD *)buf = 136315906;
      v49 = "-[NavTrayViewController setCurrentStepIndex:]";
      v50 = 2080;
      v51 = "NavTrayViewController.m";
      v52 = 1024;
      v53 = 1434;
      v54 = 2112;
      v55 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

    }
    if (!sub_100A70734())
      goto LABEL_30;
    v30 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v49 = v31;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    goto LABEL_15;
  }
  v20 = sub_1004318FC();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current step index (%lu) is greater than the number of steps (%lu)"), a3, objc_msgSend(v22, "count")));
    *(_DWORD *)buf = 136315906;
    v49 = "-[NavTrayViewController setCurrentStepIndex:]";
    v50 = 2080;
    v51 = "NavTrayViewController.m";
    v52 = 1024;
    v53 = 1427;
    v54 = 2112;
    v55 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

  }
  if (sub_100A70734())
  {
    v24 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

      goto LABEL_31;
    }
    v25 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412290;
    v49 = (const char *)v25;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_15:

    goto LABEL_30;
  }
LABEL_31:

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[NavTrayViewController _updateWithRoute:](self, "_updateWithRoute:", a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  NavTrayViewController *v13;
  __int16 v14;
  void *v15;

  v6 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = sub_1007FCE24();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v6 >= 7)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6));
    else
      v11 = *(&off_1011C99A8 + (int)v6);
    *(_DWORD *)buf = 134349314;
    v13 = self;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Got new transport type: %@", buf, 0x16u);

  }
  -[NavTrayViewController _updateWithRoute:](self, "_updateWithRoute:", v8);

  -[NavTrayViewController _resumeNavigation](self, "_resumeNavigation");
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  NSUInteger v34;
  _QWORD v35[5];
  id v36;
  id v37;
  NSUInteger v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  NavTrayViewController *v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  unsigned int v49;

  v7 = a4;
  v34 = -[NSArray indexOfObject:](self->_usedSections, "indexOfObject:", &off_10126F040);
  if (v34 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](self->_route, "uniqueRouteID"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legInfos"));
      v12 = objc_msgSend(v11, "count");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointRows](self, "waypointRows"));
      v14 = objc_msgSend(v13, "count");

      if (v12 != v14)
      {
        v15 = sub_1007FCE24();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legInfos"));
          v18 = objc_msgSend(v17, "count");
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointRows](self, "waypointRows"));
          *(_DWORD *)buf = 134349568;
          v45 = self;
          v46 = 1024;
          v47 = v18;
          v48 = 1024;
          v49 = objc_msgSend(v19, "count");
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}p] NavTrayViewController number of legs in MNDisplayETAInfo (%d) does not match number of waypoint rows in table (%d). Attempting to continue but ETA will likely be wrong.", buf, 0x18u);

        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "indexPathsForVisibleRows"));

      v22 = objc_alloc((Class)NSMutableArray);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legInfos"));
      v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = v7;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legInfos"));
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(obj);
            v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointRows](self, "waypointRows"));
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100803C0C;
            v35[3] = &unk_1011C9888;
            v35[4] = v29;
            v38 = v34;
            v36 = v21;
            v37 = v24;
            objc_msgSend(v30, "enumerateObjectsUsingBlock:", v35);

          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v26);
      }

      if (objc_msgSend(v24, "count"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
        objc_msgSend(v31, "reloadRowsAtIndexPaths:withRowAnimation:", v24, 5);

      }
      v7 = v32;
    }
  }

}

- (void)navigationService:(id)a3 didUpdateAlternateWalkingRoute:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  NavTrayHeaderView *navHeaderView;
  unint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  int v31;
  NavTrayViewController *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = sub_1007FCE24();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueRouteID"));
    v31 = 134349314;
    v32 = self;
    v33 = 2112;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Updating alternate walking route: %@", (uint8_t *)&v31, 0x16u);

  }
  v11 = -[NavTrayViewController _isEligibleToShowWalkingButton](self, "_isEligibleToShowWalkingButton");
  if (v7)
    v12 = v11;
  else
    v12 = 0;
  -[NavTrayEndCell setHasWalkingETAInfo:](self->_navTrayEndCell, "setHasWalkingETAInfo:", v12);
  -[NavTrayEndCell updateAlternateWalkingRouteDuration](self->_navTrayEndCell, "updateAlternateWalkingRouteDuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "findMyHandleID"));
  if (!v14)
    goto LABEL_14;
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrivalInfo"));
  if ((objc_msgSend(v16, "isInArrivalState") & 1) == 0)
  {

LABEL_14:
LABEL_15:
    v20 = sub_1007FCE24();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v31 = 134349056;
      v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show find my button", (uint8_t *)&v31, 0xCu);
    }

    -[NavTrayHeaderView setAlternateButtonTypes:](self->_navHeaderView, "setAlternateButtonTypes:", -[NavTrayHeaderView alternateButtonTypes](self->_navHeaderView, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFFELL);
    if (!(_DWORD)v12)
      goto LABEL_22;
    goto LABEL_18;
  }
  v17 = -[NavTrayViewController _isEligibleToShowFindMyButton](self, "_isEligibleToShowFindMyButton");

  if (!v17)
    goto LABEL_15;
  v18 = sub_1007FCE24();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v31 = 134349056;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show find my button", (uint8_t *)&v31, 0xCu);
  }

  -[NavTrayHeaderView setAlternateButtonTypes:](self->_navHeaderView, "setAlternateButtonTypes:", -[NavTrayHeaderView alternateButtonTypes](self->_navHeaderView, "alternateButtonTypes") | 1);
  if (!(_DWORD)v12)
    goto LABEL_22;
LABEL_18:
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrivalInfo"));
  v23 = objc_msgSend(v22, "isInParkingState");

  if (!v23)
  {
LABEL_22:
    v28 = sub_1007FCE24();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v31 = 134349056;
      v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show walking button", (uint8_t *)&v31, 0xCu);
    }

    navHeaderView = self->_navHeaderView;
    v27 = -[NavTrayHeaderView alternateButtonTypes](navHeaderView, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFFDLL;
    goto LABEL_25;
  }
  v24 = sub_1007FCE24();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v31 = 134349056;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show walking button", (uint8_t *)&v31, 0xCu);
  }

  navHeaderView = self->_navHeaderView;
  v27 = -[NavTrayHeaderView alternateButtonTypes](navHeaderView, "alternateButtonTypes") | 2;
LABEL_25:
  -[NavTrayHeaderView setAlternateButtonTypes:](navHeaderView, "setAlternateButtonTypes:", v27);
  -[NavTrayHeaderView applyArrivalState](self->_navHeaderView, "applyArrivalState");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v30, "updateHeightForCurrentLayout");

}

- (void)navigationService:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  NavTrayHeaderView *navHeaderView;
  unint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  NavTrayViewController *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = sub_1007FCE24();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v21 = 134349314;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Updating vehicle parking info: %@", (uint8_t *)&v21, 0x16u);
  }

  if (-[NavTrayViewController _isEligibleToShowWalkingButton](self, "_isEligibleToShowWalkingButton")
    && (v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateWalkingRoute"))) != 0
    && (v11 = (void *)v10,
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrivalInfo")),
        v13 = objc_msgSend(v12, "isInParkingState"),
        v12,
        v11,
        v13))
  {
    v14 = sub_1007FCE24();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v21 = 134349056;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Will show walking route alongside parking info", (uint8_t *)&v21, 0xCu);
    }

    navHeaderView = self->_navHeaderView;
    v17 = -[NavTrayHeaderView alternateButtonTypes](navHeaderView, "alternateButtonTypes") | 2;
  }
  else
  {
    v18 = sub_1007FCE24();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = 134349056;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Will NOT show walking route alongside parking info", (uint8_t *)&v21, 0xCu);
    }

    navHeaderView = self->_navHeaderView;
    v17 = -[NavTrayHeaderView alternateButtonTypes](navHeaderView, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFFDLL;
  }
  -[NavTrayHeaderView setAlternateButtonTypes:](navHeaderView, "setAlternateButtonTypes:", v17);
  -[NavTrayHeaderView clearAnimations](self->_navHeaderView, "clearAnimations");
  -[NavTrayHeaderView applyArrivalState](self->_navHeaderView, "applyArrivalState");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v20, "updateHeightForCurrentLayout");

}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  if ((id)-[NavTrayHeaderView arrivalState](self->_navHeaderView, "arrivalState", a3, a4) == (id)3
    || (id)-[NavTrayHeaderView arrivalState](self->_navHeaderView, "arrivalState") == (id)4)
  {
    -[NavTrayHeaderView applyArrivalState](self->_navHeaderView, "applyArrivalState");
  }
}

- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  NavTrayViewController *v9;
  __int16 v10;
  unint64_t v11;

  v6 = sub_1007FCE24();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134349312;
    v9 = self;
    v10 = 2048;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Updated target leg index: %lu", (uint8_t *)&v8, 0x16u);
  }

  -[NavTrayViewController _updateArrivalState](self, "_updateArrivalState");
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NavTrayViewController *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;

  v5 = a4;
  v6 = sub_1007FCE24();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
    v9 = 134349570;
    v10 = self;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got updated arrival info: %@ for destination: %@", (uint8_t *)&v9, 0x20u);

  }
  -[NavTrayViewController _updateArrivalState](self, "_updateArrivalState");

}

- (void)navigationService:(id)a3 didUpdateNavTrayGuidance:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  NavTrayViewController *v9;
  __int16 v10;
  id v11;

  v5 = a4;
  v6 = sub_1007FCE24();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got updated nav tray guidance event: %@", (uint8_t *)&v8, 0x16u);
  }

  -[NavTrayViewController _updateArrivalState](self, "_updateArrivalState");
}

- (void)_updateArrivalState
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NavTrayHeaderView *navHeaderView;
  unint64_t v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  NavTrayHeaderView *v26;
  unint64_t v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  id v33;
  NSObject *v34;
  NavTrayHeaderView *v35;
  unint64_t v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unsigned int v43;
  id v44;
  NSObject *v45;
  NavTrayHeaderView *v46;
  unint64_t v47;
  id v48;
  NSObject *v49;
  _QWORD v50[5];
  uint8_t buf[4];
  NavTrayViewController *v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrivalInfo"));
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "arrivalState"))
  {
    -[NavTrayViewController _resumeNavigation](self, "_resumeNavigation");
    goto LABEL_50;
  }
  v6 = (char *)objc_msgSend(v5, "arrivalState");
  if ((unint64_t)(v6 - 1) > 5)
    v7 = 0;
  else
    v7 = qword_100E3BF90[(_QWORD)(v6 - 1)];
  -[NavTrayHeaderView setArrivalState:](self->_navHeaderView, "setArrivalState:", v7);
  v8 = objc_msgSend(v5, "legIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));
  v10 = objc_msgSend(v9, "isLegIndexOfLastLeg:", v8);

  if ((v10 & 1) != 0)
  {
    v11 = sub_1007FCE24();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Arrived at end of route", buf, 0xCu);
    }

    -[NavTrayHeaderView setAlternateButtonTypes:](self->_navHeaderView, "setAlternateButtonTypes:", -[NavTrayHeaderView alternateButtonTypes](self->_navHeaderView, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFF7);
    navHeaderView = self->_navHeaderView;
    v14 = -[NavTrayHeaderView alternateButtonTypes](navHeaderView, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFFBLL;
  }
  else
  {
    v15 = objc_msgSend(v3, "isArrivedAtEVCharger");
    v16 = sub_1007FCE24();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v18)
      {
        *(_DWORD *)buf = 134349056;
        v52 = self;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Arrived at EV stop", buf, 0xCu);
      }

      navHeaderView = self->_navHeaderView;
      v14 = -[NavTrayHeaderView alternateButtonTypes](navHeaderView, "alternateButtonTypes") | 8;
    }
    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 134349056;
        v52 = self;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Arrived at mid way stop", buf, 0xCu);
      }

      navHeaderView = self->_navHeaderView;
      v14 = -[NavTrayHeaderView alternateButtonTypes](navHeaderView, "alternateButtonTypes") | 4;
    }
  }
  -[NavTrayHeaderView setAlternateButtonTypes:](navHeaderView, "setAlternateButtonTypes:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "findMyHandleID"));
  if (!v20)
    goto LABEL_25;
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrivalInfo"));
  if ((objc_msgSend(v22, "isInArrivalState") & 1) == 0)
  {

LABEL_25:
    goto LABEL_26;
  }
  v23 = -[NavTrayViewController _isEligibleToShowFindMyButton](self, "_isEligibleToShowFindMyButton");

  if (!v23)
  {
LABEL_26:
    v28 = sub_1007FCE24();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show find my button", buf, 0xCu);
    }

    v26 = self->_navHeaderView;
    v27 = -[NavTrayHeaderView alternateButtonTypes](v26, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_29;
  }
  v24 = sub_1007FCE24();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v52 = self;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show find my button", buf, 0xCu);
  }

  v26 = self->_navHeaderView;
  v27 = -[NavTrayHeaderView alternateButtonTypes](v26, "alternateButtonTypes") | 1;
LABEL_29:
  -[NavTrayHeaderView setAlternateButtonTypes:](v26, "setAlternateButtonTypes:", v27);
  if (-[NavTrayViewController _isEligibleToShowWalkingButton](self, "_isEligibleToShowWalkingButton")
    && (v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alternateWalkingRoute"))) != 0
    && (v31 = (void *)v30, v32 = objc_msgSend(v5, "isInParkingState"), v31, v32))
  {
    v33 = sub_1007FCE24();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show walking button", buf, 0xCu);
    }

    v35 = self->_navHeaderView;
    v36 = -[NavTrayHeaderView alternateButtonTypes](v35, "alternateButtonTypes") | 2;
  }
  else
  {
    v37 = sub_1007FCE24();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show walking button", buf, 0xCu);
    }

    v35 = self->_navHeaderView;
    v36 = -[NavTrayHeaderView alternateButtonTypes](v35, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFFDLL;
  }
  -[NavTrayHeaderView setAlternateButtonTypes:](v35, "setAlternateButtonTypes:", v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "route"));
  if (v40
    && (v41 = (void *)v40,
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrivalInfo")),
        v43 = objc_msgSend(v42, "isInArrivalState"),
        v42,
        v41,
        v43))
  {
    v44 = sub_1007FCE24();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show arrival button for custom route", buf, 0xCu);
    }

    v46 = self->_navHeaderView;
    v47 = -[NavTrayHeaderView alternateButtonTypes](v46, "alternateButtonTypes") | 0x10;
  }
  else
  {
    v48 = sub_1007FCE24();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show arrival button for custom route", buf, 0xCu);
    }

    v46 = self->_navHeaderView;
    v47 = -[NavTrayHeaderView alternateButtonTypes](v46, "alternateButtonTypes") & 0xFFFFFFFFFFFFFFEFLL;
  }
  -[NavTrayHeaderView setAlternateButtonTypes:](v46, "setAlternateButtonTypes:", v47);
  if (-[NavTrayViewController isInArrivalState](self, "isInArrivalState"))
  {
    -[NavTrayHeaderView clearAnimations](self->_navHeaderView, "clearAnimations");
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100804BBC;
    v50[3] = &unk_1011AC860;
    v50[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v50, 0, 0.25, 0.0);
  }
  else
  {
    -[NavTrayViewController _handleArrivalAtEndOfLegIndex:service:](self, "_handleArrivalAtEndOfLegIndex:service:", v8, v3);
  }

LABEL_50:
}

- (void)_handleArrivalAtEndOfLegIndex:(unint64_t)a3 service:(id)a4
{
  -[NavTrayViewController _handleArrivalAtEndOfLegIndex:forced:service:](self, "_handleArrivalAtEndOfLegIndex:forced:service:", a3, 0, a4);
}

- (void)_handleArrivalAtEndOfLegIndex:(unint64_t)a3 forced:(BOOL)a4 service:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id WeakRetained;
  id v26;
  uint64_t v27;
  uint64_t analyticsTarget;
  void *v29;
  char v30;
  uint64_t v31;
  GCDTimer *sharedTripAnimationTimer;
  void *v33;
  id v34;
  _QWORD v35[5];
  uint8_t buf[4];
  NavTrayViewController *v37;
  __int16 v38;
  unint64_t v39;

  v8 = a5;
  if (!-[NavTrayViewController isInArrivalState](self, "isInArrivalState") || a4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "legs"));
    if ((unint64_t)objc_msgSend(v16, "count") <= a3)
    {

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "legs"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", a3));

      if (v10)
      {
        v19 = sub_1007FCE24();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349312;
          v37 = self;
          v38 = 2048;
          v39 = a3;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Handling arrival at end of leg index: %lu", buf, 0x16u);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
        v22 = objc_msgSend(v21, "isLegIndexOfLastLeg:", a3);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrivalChargingStationInfo"));
        -[NavTrayViewController setIsInArrivalState:](self, "setIsInArrivalState:", 1);
        -[NavTrayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
        -[NavTrayViewController _updateShareETADisclosure](self, "_updateShareETADisclosure");
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v24, "wantsLayout:", 1);

        WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
        objc_msgSend(WeakRetained, "presentTray");

        v26 = objc_loadWeakRetained((id *)&self->_navigationDelegate);
        v27 = objc_msgSend(v26, "canPresentRapFeedbackView") & v22;

        -[NavTrayHeaderView setShowFeedbackView:](self->_navHeaderView, "setShowFeedbackView:", v27);
        -[NavTrayHeaderView clearAnimations](self->_navHeaderView, "clearAnimations");
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100804FF8;
        v35[3] = &unk_1011AC860;
        v35[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v35, 0, 0.25, 0.0);
        if ((v27 & 1) != 0)
          +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 234, self->_analyticsTarget, 0);
        analyticsTarget = self->_analyticsTarget;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 293, analyticsTarget, v29);

        if (v23)
          v30 = 0;
        else
          v30 = v22;
        if ((v30 & 1) == 0)
        {
          if (v23)
            v31 = 295;
          else
            v31 = 296;
          +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v31, self->_analyticsTarget, 0);
        }
        sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
        self->_sharedTripAnimationTimer = 0;

        self->_displayingInitialBanner = 0;
        -[NavTrayViewController _updateShareETADisclosure](self, "_updateShareETADisclosure");
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v33, "updateHeightForCurrentLayout");

        goto LABEL_24;
      }
    }
    v34 = sub_1007FCE24();
    v10 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349312;
      v37 = self;
      v38 = 2048;
      v39 = a3;
      v11 = "[%{public}p] _handleDidArriveAtEndOfLegIndex:service: received an invalid legIndex: %lu";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 22;
      goto LABEL_23;
    }
  }
  else
  {
    v9 = sub_1007FCE24();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v37 = self;
      v11 = "[%{public}p] _handleDidArriveAtEndOfLegIndex:service: already in arrival state";
      v12 = v10;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 12;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
    }
  }
LABEL_24:

}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  if (a6 - 3 <= 1)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 297, self->_analyticsTarget, 0);
  -[NavTrayViewController _resumeNavigation](self, "_resumeNavigation");
}

- (void)_resumeNavigation
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  uint8_t buf[4];
  NavTrayViewController *v8;

  v3 = sub_1007FCE24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Resuming navigation", buf, 0xCu);
  }

  -[NavTrayViewController setIsInArrivalState:](self, "setIsInArrivalState:", 0);
  -[NavTrayViewController _updateShareETADisclosure](self, "_updateShareETADisclosure");
  -[NavTrayHeaderView resetContent](self->_navHeaderView, "resetContent");
  -[NavTrayHeaderView clearAnimations](self->_navHeaderView, "clearAnimations");
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008051CC;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008051E0;
  v5[3] = &unk_1011AE8F8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v6, v5, 0.25, 0.0);
}

- (int)currentUITargetForAnalytics
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  v3 = objc_msgSend(v2, "transportType");

  if (v3 > 3)
    return 0;
  else
    return dword_100E3BFC0[v3];
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  -[NavTrayViewController _updateWithRoute:](self, "_updateWithRoute:", v3);

}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route", a3));
  -[NavTrayViewController _updateWithRoute:](self, "_updateWithRoute:", v4);

  -[NavTrayViewController _updateShareETADisclosure](self, "_updateShareETADisclosure");
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  -[NavTrayViewController setReceivingContacts:](self, "setReceivingContacts:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "updateHeightForCurrentLayout");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  objc_msgSend(v7, "setNeedsUserActivityUpdate");

  v8 = objc_msgSend(v5, "count");
  if (!v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
    -[NavTrayViewController _updateWithRoute:](self, "_updateWithRoute:", v9);

  }
}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
  -[NavTrayViewController sharedTripService:didUpdateReceivers:](self, "sharedTripService:didUpdateReceivers:", a3, &__NSArray0__struct);
}

- (void)offlineMapsStateChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
  -[NavTrayViewController _updateWithRoute:](self, "_updateWithRoute:", v3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_tableView == a3)
    return -[NSArray count](self->_usedSections, "count");
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  if (self->_tableView != a3)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (BOOL)_isWaypointRemovable:(id)a3
{
  BOOL v4;
  id v5;
  void *v6;

  if (self->_isSteppingMode || (objc_msgSend(a3, "isServerProvidedWaypoint") & 1) != 0)
    return 0;
  v5 = sub_10039E080(self->_waypointRows, &stru_1011C98C8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v4 = (unint64_t)objc_msgSend(v6, "count") > 1;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UITableView *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  UITableViewCell *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  NSString *v30;
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
  void *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  void *v45;
  void *v46;

  v6 = (UITableView *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_tableView == v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
    v18 = objc_msgSend(v10, "integerValue");
    v19 = objc_msgSend(v8, "row");
    if (v18 == (id)2)
    {
      v42 = (objc_class *)objc_opt_class(NavTrayEndCell);
      v43 = NSStringFromClass(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v14 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableCellWithIdentifier:](v6, "dequeueReusableCellWithIdentifier:", v44));

      -[UITableViewCell setMetrics:](v14, "setMetrics:", self->_metrics);
      -[UITableViewCell setButtonStylingDelegate:](v14, "setButtonStylingDelegate:", self);
      if (-[NavTrayViewController _isEligibleToShowWalkingButton](self, "_isEligibleToShowWalkingButton"))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "alternateWalkingRouteDisplayETAInfo"));

        -[UITableViewCell setHasWalkingETAInfo:](v14, "setHasWalkingETAInfo:", v46 != 0);
      }
      objc_storeStrong((id *)&self->_navTrayEndCell, v14);
    }
    else
    {
      v20 = v19;
      if (v18 == (id)1)
      {
        v29 = (objc_class *)objc_opt_class(NavTrayActionCell);
        v30 = NSStringFromClass(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v14 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableCellWithIdentifier:](v6, "dequeueReusableCellWithIdentifier:", v31));

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v10));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v20));

        v33 = objc_msgSend(v25, "unsignedIntegerValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _imageForAction:](self, "_imageForAction:", v33));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell leadingImageView](v14, "leadingImageView"));
        objc_msgSend(v35, "setImage:", v34);

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _imageTintColorForAction:](self, "_imageTintColorForAction:", v33));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell leadingImageView](v14, "leadingImageView"));
        objc_msgSend(v37, "setTintColor:", v36);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _backgroundImageTintColorForAction:](self, "_backgroundImageTintColorForAction:", v33));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell leadingImageBackgroundView](v14, "leadingImageBackgroundView"));
        objc_msgSend(v39, "setBackgroundColor:", v38);

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _titleTextForAction:](self, "_titleTextForAction:", v33));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell titleLabel](v14, "titleLabel"));
        objc_msgSend(v41, "setText:", v40);

      }
      else
      {
        if (v18)
        {
          v14 = objc_opt_new(UITableViewCell);
          goto LABEL_13;
        }
        v21 = (objc_class *)objc_opt_class(NavTrayWaypointCell);
        v22 = NSStringFromClass(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v14 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableCellWithIdentifier:](v6, "dequeueReusableCellWithIdentifier:", v23));

        -[UITableViewCell setDelegate:](v14, "setDelegate:", self);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v10));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v20));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "waypoint"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "etaInfo"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "waypoint"));
        -[UITableViewCell updateWithWaypoint:etaInfo:shouldDisplayDeleteButton:](v14, "updateWithWaypoint:etaInfo:shouldDisplayDeleteButton:", v26, v27, -[NavTrayViewController _isWaypointRemovable:](self, "_isWaypointRemovable:", v28));

      }
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController route](self, "route"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shareETAWaypointContacts"));

    v11 = (objc_class *)objc_opt_class(NavShareETACell);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableCellWithIdentifier:](v6, "dequeueReusableCellWithIdentifier:", v13));

    -[UITableViewCell setIsStandaloneSharingSuggestion:](v14, "setIsStandaloneSharingSuggestion:", 1);
    -[UITableViewCell setDelegate:](v14, "setDelegate:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    -[UITableViewCell setContact:](v14, "setContact:", v15);

    -[UITableViewCell setSharingState:animated:](v14, "setSharingState:animated:", 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    -[UITableViewCell setCapabilityType:](v14, "setCapabilityType:", objc_msgSend(v16, "capabilityLevelForContact:", v17));

  }
LABEL_13:

  return v14;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4;
  NSArray *usedSections;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Width;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  CGRect v40;

  if (self->_tableView == a3)
  {
    usedSections = self->_usedSections;
    v8 = a4;
    v9 = a3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](usedSections, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));
    v11 = objc_msgSend(v10, "integerValue");
    v12 = objc_msgSend(v8, "row");

    objc_msgSend(v9, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v40.origin.x = v14;
    v40.origin.y = v16;
    v40.size.width = v18;
    v40.size.height = v20;
    Width = CGRectGetWidth(v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
    objc_msgSend(v22, "layoutMargins");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController tableView](self, "tableView"));
    objc_msgSend(v25, "layoutMargins");
    v27 = v26;

    if (v11 == (id)2)
    {
      v4 = UITableViewAutomaticDimension;
    }
    else
    {
      v28 = Width - v24 - v27;
      if (v11 == (id)1)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v10));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", v12));

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _titleTextForAction:](self, "_titleTextForAction:", objc_msgSend(v30, "unsignedIntegerValue")));
        +[NavTrayActionCell heightForCellWithText:width:](NavTrayActionCell, "heightForCellWithText:width:", v37, v28);
        v4 = v38;

        goto LABEL_9;
      }
      v4 = 0.0;
      if (!v11)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v10));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v12));

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "waypoint"));
        v32 = -[NavTrayViewController _isWaypointRemovable:](self, "_isWaypointRemovable:", v31);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "waypoint"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "etaInfo"));
        +[NavTrayWaypointCell heightForCellWithWaypoint:etaInfo:shouldDisplayDeleteButton:width:](NavTrayWaypointCell, "heightForCellWithWaypoint:etaInfo:shouldDisplayDeleteButton:width:", v33, v34, v32, v28);
        v4 = v35;

LABEL_9:
      }
    }

    return v4;
  }
  return 78.0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  UITableView *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = (UITableView *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_tableView != v6)
    goto LABEL_5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  if (objc_msgSend(v9, "integerValue") != (id)2)
  {

LABEL_5:
    v11 = UITableViewAutomaticDimension;
    goto LABEL_6;
  }
  -[NavTrayMetrics endButtonHeight](self->_metrics, "endButtonHeight");
  v11 = v10;

LABEL_6:
  return v11;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  NavShareETAFooterView *v4;

  if (self->_shareETADisclosureTableView == a3)
    v4 = self->_shareETADisclosureFooterView;
  else
    v4 = objc_opt_new(UIView);
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  ContentSizedTableView *v6;
  ContentSizedTableView *v7;
  NavTrayMetrics *metrics;
  double v9;
  double Width;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  v6 = (ContentSizedTableView *)a3;
  v7 = v6;
  if (self->_shareETADisclosureTableView == v6)
  {
    -[ContentSizedTableView frame](v6, "frame");
    Width = CGRectGetWidth(v16);
    -[ContentSizedTableView layoutMargins](v7, "layoutMargins");
    v12 = Width - v11;
    -[ContentSizedTableView layoutMargins](v7, "layoutMargins");
    -[NavShareETAFooterView heightForWidth:](self->_shareETADisclosureFooterView, "heightForWidth:", v12 - v13);
  }
  else
  {
    metrics = self->_metrics;
    if (a4 == 2)
      -[NavTrayMetrics actionButtonBottomPadding](metrics, "actionButtonBottomPadding");
    else
      -[NavTrayMetrics defaultVerticalPadding](metrics, "defaultVerticalPadding");
  }
  v14 = v9;

  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  UITableView *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;

  v6 = (UITableView *)a3;
  v7 = a4;
  v8 = v7;
  v11 = 1;
  if (self->_tableView == v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
    v10 = (unint64_t)objc_msgSend(v9, "integerValue") & 0xFFFFFFFFFFFFFFFDLL;

    if (!v10)
      v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  UITableView *tableView;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  GCDTimer *sharedTripAnimationTimer;
  void *v21;
  void *v22;
  int v23;
  NavTrayViewController *v24;
  __int16 v25;
  id v26;

  v6 = a4;
  tableView = self->_tableView;
  v8 = a3;
  v9 = v8;
  if (tableView == a3)
  {
    v11 = sub_1007FCE24();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v23 = 134349314;
      v24 = self;
      v25 = 2112;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] NavTrayViewController tableView:didSelectRowAtIndexPath: %@", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
    v13 = objc_msgSend(v10, "integerValue");
    v14 = objc_msgSend(v6, "row");
    if (v13 == (id)1)
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController _delegate](self, "_delegate"));
      objc_msgSend(v16, "suppressTransitionsOfContainee:", self);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v17, "wantsLayout:", 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_traySections, "objectForKeyedSubscript:", v10));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v15));

      switch((unint64_t)objc_msgSend(v19, "unsignedIntegerValue"))
      {
        case 0uLL:
          -[NavTrayViewController _pressedSAR](self, "_pressedSAR");
          break;
        case 1uLL:
          -[NavTrayViewController _pressedShareETAInTray](self, "_pressedShareETAInTray");
          break;
        case 2uLL:
          -[NavTrayViewController _pressedReport](self, "_pressedReport");
          break;
        case 3uLL:
          -[NavTrayViewController _pressedVoiceVolume](self, "_pressedVoiceVolume");
          break;
        case 4uLL:
          -[NavTrayViewController _pressedDetails](self, "_pressedDetails");
          break;
        default:
          break;
      }

    }
  }
  else
  {
    objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v6, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForRowAtIndexPath:", v6));

    if (objc_msgSend(v10, "sharingState"))
    {
      if (objc_msgSend(v10, "sharingState") == (id)1)
      {
        objc_msgSend(v10, "setSharingState:animated:", 0, 0);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contact"));
        objc_msgSend(v21, "stopSharingWithContact:completion:", v22, &stru_1011C98E8);

      }
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 402, 91, 0);
      -[NavTrayViewController _startTimerToDismissInitialBanner](self, "_startTimerToDismissInitialBanner");
    }
    else
    {
      objc_msgSend(v10, "setSharingState:animated:", 1, 1);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 400, 91, 0);
      sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
      self->_sharedTripAnimationTimer = 0;

    }
  }

}

- (void)pressedDeleteOnCell:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  NavTrayViewController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = sub_1007FCE24();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v16 = 134349056;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Handle delete waypoint cell tap", (uint8_t *)&v16, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypoint"));
  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointController](self, "waypointController")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayedWaypoints")),
        v10 = objc_msgSend(v9, "indexOfObject:", v7),
        v9,
        v8,
        v10 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 294, self->_analyticsTarget, 0);
    v14 = sub_1007FCE24();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 134349312;
      v17 = self;
      v18 = 2048;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Deleting waypoint at index %lu", (uint8_t *)&v16, 0x16u);
    }

    v12 = objc_claimAutoreleasedReturnValue(-[NavTrayViewController waypointController](self, "waypointController"));
    -[NSObject removeWaypointAt:](v12, "removeWaypointAt:", v10);
  }
  else
  {
    v11 = sub_1007FCE24();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortDescription"));
      v16 = 134349570;
      v17 = self;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}p] Couldn't delete cell: %@ waypoint: %@", (uint8_t *)&v16, 0x20u);

    }
  }

}

- (void)pressedPhoneCallOnCell:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
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
  NavTrayViewController *v25;
  id obj;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  NavTrayViewController *v34;

  v4 = a3;
  v5 = sub_1007FCE24();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Handle phone call cell tap", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationPhoneNumbers"));
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unformattedInternationalStringValue"));
    objc_msgSend(v10, "callPhoneNumber:completion:", v22, 0);
  }
  else
  {
    v25 = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[NavTray] Phone number prompt"), CFSTR("localized string not found"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, 0, 0));

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100806724;
          v27[3] = &unk_1011AD938;
          v27[4] = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v27));
          objc_msgSend(v10, "addAction:", v17);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 1, 0));
    objc_msgSend(v10, "addAction:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInternalAlertPresentationController sharedInstance](MapsInternalAlertPresentationController, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](v25, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "window"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "windowScene"));
    objc_msgSend(v21, "presentAlertController:fromWindowScene:", v10, v24);

  }
}

- (void)cellDidFinishRingAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100806840;
  v8[3] = &unk_1011C9910;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "startSharingWithContact:completion:", v6, v8);

  -[NavTrayViewController _startTimerToDismissInitialBanner](self, "_startTimerToDismissInitialBanner");
}

- (void)_sceneConnectionsDidChange:(id)a3
{
  -[NavTrayViewController setConnectedToCarPlay:](self, "setConnectedToCarPlay:", +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay));
}

- (void)_maneuverBannerViewEVStationsNotification:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[NavTrayViewController isConnectedToCarPlay](self, "isConnectedToCarPlay", a3))
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100806964;
    v4[3] = &unk_1011AD260;
    objc_copyWeak(&v5, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)enableTrafficIncidents
{
  return self->_enableTrafficIncidents;
}

- (BOOL)enableShareETA
{
  return self->_enableShareETA;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)isInArrivalState
{
  return self->_isInArrivalState;
}

- (void)setIsInArrivalState:(BOOL)a3
{
  self->_isInArrivalState = a3;
}

- (NSArray)receivingContacts
{
  return self->_receivingContacts;
}

- (UIView)shareETADisclosureView
{
  return self->_shareETADisclosureView;
}

- (ContentSizedTableView)shareETADisclosureTableView
{
  return self->_shareETADisclosureTableView;
}

- (NavShareETAFooterView)shareETADisclosureFooterView
{
  return self->_shareETADisclosureFooterView;
}

- (UIButton)shareETADisclosureButton
{
  return self->_shareETADisclosureButton;
}

- (NavSARAPIController)categoriesAPIController
{
  return self->_categoriesAPIController;
}

- (void)setCategoriesAPIController:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesAPIController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesAPIController, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureButton, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureFooterView, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureTableView, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureView, 0);
  objc_storeStrong((id *)&self->_receivingContacts, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_waypointRows, 0);
  objc_destroyWeak((id *)&self->_phoneNumberPickerAlertController);
  objc_storeStrong((id *)&self->_sharedTripAnimationTimer, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureTopConstraint, 0);
  objc_storeStrong((id *)&self->_navTrayEndCell, 0);
  objc_storeStrong((id *)&self->_stepHeaderView, 0);
  objc_storeStrong((id *)&self->_navHeaderView, 0);
  objc_storeStrong((id *)&self->_usedSections, 0);
  objc_storeStrong((id *)&self->_traySections, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_destroyWeak((id *)&self->_steppingDelegate);
}

@end
