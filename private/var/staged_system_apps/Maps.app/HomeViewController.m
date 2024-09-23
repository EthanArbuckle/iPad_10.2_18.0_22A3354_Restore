@implementation HomeViewController

- (HomeViewController)initWithDelegate:(id)a3
{
  id v4;
  HomeViewController *v5;
  HomeViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HomeViewController;
  v5 = -[HomeViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_homeActionDelegate, v4);

  return v6;
}

- (void)viewDidLoad
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  UICollectionView *v21;
  UICollectionView *collectionView;
  void *v23;
  void *v24;
  HomeOutlineRootControllerConfiguration *v25;
  UICollectionView *v26;
  id v27;
  HomeOutlineRootControllerConfiguration *v28;
  HomeOutlineRootController *v29;
  HomeOutlineRootController *outlineController;
  void *v31;
  void *v32;
  void *v33;
  UIView *v34;
  UIView *footerView;
  void *v36;
  void *v37;
  void *v38;
  MapsRightImageButton *v39;
  MapsRightImageButton *termsAndConditionsButton;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *footerBottomConstraint;
  NSLayoutConstraint *v45;
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
  id v56;
  _TtC4Maps35HomeListRootControllerConfiguration *v57;
  id v58;
  id v59;
  UICollectionView *v60;
  UICollectionView *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  _TtC4Maps22HomeListRootController *v66;
  _TtC4Maps22HomeListRootController *listController;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  UICollectionView *v72;
  void *v73;
  void *v74;
  double left;
  double bottom;
  double right;
  void *v78;
  UITableView *v79;
  UITableView *tableView;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  HomeCellProvider *v85;
  HomeCellProvider *homeCellProvider;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  unsigned int v92;
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
  _TtC4Maps35HomeListRootControllerConfiguration *v138;
  _TtC4Maps35HomeListRootControllerConfiguration *v139;
  void *v140;
  void *v141;
  objc_super v142;
  _QWORD v143[4];
  _QWORD v144[11];

  v142.receiver = self;
  v142.super_class = (Class)HomeViewController;
  -[HomeViewController viewDidLoad](&v142, "viewDidLoad");
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "homeActionCoordinator"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Controller"), &stru_1011EB268));
  objc_msgSend(v5, "setAccessibilityIdentifier:", v9);

  if (sub_1002A8AA0(self) == 5)
  {
    v10 = objc_alloc((Class)UICollectionView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v21 = (UICollectionView *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v20, v13, v15, v17, v19);
    collectionView = self->_collectionView;
    self->_collectionView = v21;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView setPreservesSuperviewLayoutMargins:](self->_collectionView, "setPreservesSuperviewLayoutMargins:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v23);

    -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
    -[UICollectionView setSelectionFollowsFocus:](self->_collectionView, "setSelectionFollowsFocus:", 1);
    -[UICollectionView setAutomaticallyAdjustsScrollIndicatorInsets:](self->_collectionView, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
    -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("HomeCollectionView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    objc_msgSend(v24, "addSubview:", self->_collectionView);

    v25 = [HomeOutlineRootControllerConfiguration alloc];
    v26 = self->_collectionView;
    v27 = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    v140 = v4;
    v28 = -[HomeOutlineRootControllerConfiguration initWithCollectionView:actionCoordinator:homeActionDelegate:homeUpdateDelegate:](v25, "initWithCollectionView:actionCoordinator:homeActionDelegate:homeUpdateDelegate:", v26, v4, v27, self);

    v138 = (_TtC4Maps35HomeListRootControllerConfiguration *)v28;
    v29 = -[HomeOutlineRootController initWithConfiguration:]([HomeOutlineRootController alloc], "initWithConfiguration:", v28);
    outlineController = self->_outlineController;
    self->_outlineController = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController collectionViewLayout](self->_outlineController, "collectionViewLayout"));
    -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController dataSource](self->_outlineController, "dataSource"));
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", v32);

    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self->_outlineController);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
    LODWORD(v26) = objc_msgSend(v33, "deviceSupportsDragAndDrop");

    if ((_DWORD)v26)
    {
      -[UICollectionView setDragDelegate:](self->_collectionView, "setDragDelegate:", self->_outlineController);
      -[UICollectionView setDropDelegate:](self->_collectionView, "setDropDelegate:", self->_outlineController);
    }
    v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    footerView = self->_footerView;
    self->_footerView = v34;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setPreservesSuperviewLayoutMargins:](self->_footerView, "setPreservesSuperviewLayoutMargins:", 1);
    -[UIView setAccessibilityIdentifier:](self->_footerView, "setAccessibilityIdentifier:", CFSTR("HomeFooterView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    objc_msgSend(v36, "addSubview:", self->_footerView);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Terms & Conditions"), CFSTR("localized string not found"), 0));
    v39 = (MapsRightImageButton *)objc_claimAutoreleasedReturnValue(-[HomeViewController _linkButtonWithTitle:](self, "_linkButtonWithTitle:", v38));
    termsAndConditionsButton = self->_termsAndConditionsButton;
    self->_termsAndConditionsButton = v39;

    -[MapsRightImageButton addTarget:action:forControlEvents:](self->_termsAndConditionsButton, "addTarget:action:forControlEvents:", self, "_openTermsAndConditions:", 0x2000);
    -[MapsRightImageButton setAccessibilityIdentifier:](self->_termsAndConditionsButton, "setAccessibilityIdentifier:", CFSTR("HomeTermsAndConditionsButton"));
    -[UIView addSubview:](self->_footerView, "addSubview:", self->_termsAndConditionsButton);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_footerView, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
    v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
    footerBottomConstraint = self->_footerBottomConstraint;
    self->_footerBottomConstraint = v43;

    v136 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "topAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:", v132));
    v144[0] = v130;
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "leadingAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v125));
    v144[1] = v124;
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "trailingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v121));
    v144[2] = v120;
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "bottomAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v117));
    v144[3] = v116;
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_footerView, "leadingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "leadingAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v113));
    v144[4] = v112;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_footerView, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "trailingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v109));
    v45 = self->_footerBottomConstraint;
    v144[5] = v108;
    v144[6] = v45;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton topAnchor](self->_termsAndConditionsButton, "topAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_footerView, "topAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:constant:", v106, 0.0));
    v144[7] = v105;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton leadingAnchor](self->_termsAndConditionsButton, "leadingAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v46));
    v144[8] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton trailingAnchor](self->_termsAndConditionsButton, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:", v50));
    v144[9] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton bottomAnchor](self->_termsAndConditionsButton, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_footerView, "bottomAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, -13.0));
    v144[10] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v144, 11));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

    v56 = v136;
    v57 = v138;
    v4 = v140;
  }
  else if (GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8))
  {
    -[HomeViewController _mapsui_resetViewLayoutMarginsWithPreservesSuperview:](self, "_mapsui_resetViewLayoutMarginsWithPreservesSuperview:", 1);
    v58 = objc_alloc((Class)UICollectionView);
    v59 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v60 = (UICollectionView *)objc_msgSend(v58, "initWithFrame:collectionViewLayout:", v59, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v61 = self->_collectionView;
    self->_collectionView = v60;

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v62);

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView layer](self->_collectionView, "layer"));
    objc_msgSend(v63, "setAllowsGroupOpacity:", 0);

    -[UICollectionView _mapsui_resetLayoutMarginsWithPreservesSuperview:](self->_collectionView, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    objc_msgSend(v64, "addSubview:", self->_collectionView);

    v57 = -[HomeListRootControllerConfiguration initWithCollectionView:]([_TtC4Maps35HomeListRootControllerConfiguration alloc], "initWithCollectionView:", self->_collectionView);
    v65 = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    -[HomeListRootControllerConfiguration setHomeActionDelegate:](v57, "setHomeActionDelegate:", v65);

    -[HomeListRootControllerConfiguration setHomeUpdateDelegate:](v57, "setHomeUpdateDelegate:", self);
    v66 = -[HomeListRootController initWithConfiguration:]([_TtC4Maps22HomeListRootController alloc], "initWithConfiguration:", v57);
    listController = self->_listController;
    self->_listController = v66;

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[HomeListRootController collectionViewLayout](self->_listController, "collectionViewLayout"));
    -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[HomeListRootController dataSource](self->_listController, "dataSource"));
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", v69);

    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self->_listController);
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
    LODWORD(v59) = objc_msgSend(v70, "deviceSupportsDragAndDrop");

    if ((_DWORD)v59)
      -[UICollectionView setDragDelegate:](self->_collectionView, "setDragDelegate:", self->_listController);
    v71 = objc_alloc((Class)MUEdgeLayout);
    v72 = self->_collectionView;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v56 = objc_msgSend(v71, "initWithItem:container:", v72, v73);

    objc_msgSend(v56, "activate");
  }
  else
  {
    -[HomeViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    objc_msgSend(v74, "setPreservesSuperviewLayoutMargins:", 1);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    objc_msgSend(v78, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);

    v79 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = self->_tableView;
    self->_tableView = v79;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v81);

    -[UITableView setEstimatedSectionHeaderHeight:](self->_tableView, "setEstimatedSectionHeaderHeight:", 0.0);
    -[UITableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v82);

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView layer](self->_tableView, "layer"));
    objc_msgSend(v83, "setAllowsGroupOpacity:", 0);

    -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
    -[UITableView setPreservesSuperviewLayoutMargins:](self->_tableView, "setPreservesSuperviewLayoutMargins:", 1);
    -[UITableView _setTopPadding:](self->_tableView, "_setTopPadding:", 0.0);
    -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("HomeTableView"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    objc_msgSend(v84, "addSubview:", self->_tableView);

    v85 = -[HomeCellProvider initWithTableView:viewMode:]([HomeCellProvider alloc], "initWithTableView:viewMode:", self->_tableView, objc_msgSend(v4, "displayedViewMode"));
    homeCellProvider = self->_homeCellProvider;
    self->_homeCellProvider = v85;

    -[DataSource setDelegate:](self->_homeCellProvider, "setDelegate:", self);
    v87 = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    -[HomeCellProvider setHomeActionDelegate:](self->_homeCellProvider, "setHomeActionDelegate:", v87);

    -[HomeCellProvider setHomeUpdateDelegate:](self->_homeCellProvider, "setHomeUpdateDelegate:", self);
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appCoordinator"));
    -[HomeCellProvider setShareDelegate:](self->_homeCellProvider, "setShareDelegate:", v88);

    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appCoordinator"));
    -[HomeCellProvider setPlaceCardActionDelegate:](self->_homeCellProvider, "setPlaceCardActionDelegate:", v89);

    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appCoordinator"));
    -[HomeCellProvider setParkedCarActionDelegate:](self->_homeCellProvider, "setParkedCarActionDelegate:", v90);

    -[HomeCellProvider setPoiEnrichmentActionDelegate:](self->_homeCellProvider, "setPoiEnrichmentActionDelegate:", v4);
    -[HomeCellProvider setTransitPayActionDelegate:](self->_homeCellProvider, "setTransitPayActionDelegate:", v4);
    v141 = v4;
    -[HomeCellProvider setDeleteDelegate:](self->_homeCellProvider, "setDeleteDelegate:", v4);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self->_homeCellProvider);
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
    v92 = objc_msgSend(v91, "deviceSupportsDragAndDrop");

    if (v92)
      -[UITableView setDragDelegate:](self->_tableView, "setDragDelegate:", self->_homeCellProvider);
    v139 = (_TtC4Maps35HomeListRootControllerConfiguration *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "topAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[HomeListRootControllerConfiguration constraintEqualToAnchor:](v139, "constraintEqualToAnchor:", v135));
    v143[0] = v133;
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v127));
    v143[1] = v93;
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "trailingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v96));
    v143[2] = v97;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "bottomAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v100));
    v143[3] = v101;
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v102);

    v56 = v137;
    v57 = v139;

    v4 = v141;
  }

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  double width;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HomeViewController;
  -[HomeViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  if (sub_1002A8AA0(self) == 5)
  {
    -[HomeOutlineRootController updateIfNeeded](self->_outlineController, "updateIfNeeded");
    -[HomeViewController _updateFooterAnimated:](self, "_updateFooterAnimated:", 0);
  }
  else if (GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8))
  {
    -[HomeListRootController setNeedsUpdate](self->_listController, "setNeedsUpdate");
    -[UICollectionView bounds](self->_collectionView, "bounds");
    v5 = v4;
    v6 = v3;
    width = self->_previousCollectionViewSize.width;
    if (v4 == width && width != 0.0 && v3 > self->_previousCollectionViewSize.height)
    {
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100B9FC28;
        v9[3] = &unk_1011AC860;
        v9[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
      }
    }
    self->_previousCollectionViewSize.width = v5;
    self->_previousCollectionViewSize.height = v6;
  }
  else
  {
    -[HomeCellProvider updateIfNeeded](self->_homeCellProvider, "updateIfNeeded");
  }
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)keyCommands
{
  int BOOL;
  uint64_t v4;

  BOOL = GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8);
  v4 = 8;
  if (BOOL)
    v4 = 6;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___HomeViewController__homeActionDelegate[v4]), "keyCommands"));
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int BOOL;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  BOOL = GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8);
  v8 = 8;
  if (BOOL)
    v8 = 6;
  v9 = OBJC_IVAR___HomeViewController__homeActionDelegate[v8];
  v10 = *(id *)((char *)&self->super.super.super.isa + v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "keyCommands"));
  if (objc_msgSend(v11, "containsObject:", v6))
  {
    v12 = v10;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HomeViewController;
    v13 = -[HomeViewController targetForAction:withSender:](&v16, "targetForAction:withSender:", a3, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue(v13);
  }
  v14 = v12;

  return v14;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HomeViewController;
  -[HomeViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[HomeViewController scrollContentToOriginalPosition](self, "scrollContentToOriginalPosition");
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    if (sub_1002A8AA0(self) == 5)
    {
      -[HomeOutlineRootController setActive:](self->_outlineController, "setActive:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
      objc_msgSend(v5, "setUserInteractionEnabled:", v3);

      if (!v3)
        return;
LABEL_9:
      -[HomeViewController _configureForceTouchIfNeeded](self, "_configureForceTouchIfNeeded");
      return;
    }
    if (GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8))
      v6 = 32;
    else
      v6 = 8;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "setActive:", v3);
    if (v3)
      goto LABEL_9;
  }
}

- (SuggestionsItemSource)suggestionsItemSource
{
  int *v3;
  int BOOL;
  uint64_t v5;

  -[HomeViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (sub_1002A8AA0(self) == 5)
  {
    v3 = &OBJC_IVAR___HomeViewController__outlineController;
  }
  else
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8);
    v5 = 8;
    if (BOOL)
      v5 = 6;
    v3 = &OBJC_IVAR___HomeViewController__homeActionDelegate[v5];
  }
  return (SuggestionsItemSource *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "suggestionsItemSource"));
}

- (UIScrollView)scrollView
{
  int *v3;
  int BOOL;
  uint64_t v5;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = &OBJC_IVAR___HomeViewController__collectionView;
  }
  else
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8);
    v5 = 7;
    if (BOOL)
      v5 = 1;
    v3 = &OBJC_IVAR___HomeViewController__homeActionDelegate[v5];
  }
  return (UIScrollView *)*(id *)((char *)&self->super.super.super.isa + *v3);
}

- (BOOL)shouldShowTopHairline
{
  double v3;
  void *v5;
  double v6;
  double v7;

  if (sub_1002A8AA0(self) == 5)
    return 0;
  if (GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8))
  {
    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    return v3 > 0.0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  if (v7 <= 0.0)
    return 0;
  else
    return -[UITableView _maps_shouldShowTopHairline](self->_tableView, "_maps_shouldShowTopHairline");
}

- (double)mediumContentHeight
{
  double result;

  if (sub_1002A8AA0(self) == 5)
    return 0.0;
  -[HomeCellProvider contentHeight](self->_homeCellProvider, "contentHeight");
  return result;
}

- (void)scrollContentToOriginalPosition
{
  void ***v3;
  void **v4;
  uint64_t v5;
  id (*v6)(uint64_t);
  void *v7;
  HomeViewController *v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  HomeViewController *v13;

  if (sub_1002A8AA0(self) == 5)
  {
    -[UICollectionView _maps_scrollContentToOriginalPosition](self->_collectionView, "_maps_scrollContentToOriginalPosition");
  }
  else
  {
    if (GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8))
    {
      v9 = _NSConcreteStackBlock;
      v10 = 3221225472;
      v11 = sub_100BA01A0;
      v12 = &unk_1011AC860;
      v13 = self;
      v3 = &v9;
    }
    else
    {
      v4 = _NSConcreteStackBlock;
      v5 = 3221225472;
      v6 = sub_100BA01E0;
      v7 = &unk_1011AC860;
      v8 = self;
      v3 = &v4;
    }
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  -[HomeOutlineRootController presentVenueWithVenueCardItem:](self->_outlineController, "presentVenueWithVenueCardItem:", a3);
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  -[HomeOutlineRootController handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:](self->_outlineController, "handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:", a3, a4, a5);
}

- (void)venueDidReceiveEVChargersUpdate:(id)a3
{
  -[HomeOutlineRootController venueDidReceiveEVChargersUpdate:](self->_outlineController, "venueDidReceiveEVChargersUpdate:", a3);
}

- (void)showCollection:(id)a3
{
  -[HomeOutlineRootController showCollection:](self->_outlineController, "showCollection:", a3);
}

- (void)editCollection:(id)a3
{
  -[HomeOutlineRootController editCollection:](self->_outlineController, "editCollection:", a3);
}

- (void)clearSelectionWithReason:(id)a3
{
  -[HomeOutlineRootController clearSelectionWithReason:](self->_outlineController, "clearSelectionWithReason:", a3);
}

- (void)_configureForceTouchIfNeeded
{
  _TtC4Maps32MapsHomeQuickActionMenuPresenter *v3;
  QuickActionMenuPresenter *quickActionMenuPresenter;
  id WeakRetained;

  if (sub_1002A8AA0(self) != 5 && !self->_quickActionMenuPresenter)
  {
    if (GEOConfigGetBOOL(MapsConfig_MapsHomeEnableUICollectionView, off_1014B3ED8))
      v3 = -[MapsHomeQuickActionMenuPresenter initWithCollectionView:]([_TtC4Maps32MapsHomeQuickActionMenuPresenter alloc], "initWithCollectionView:", self->_collectionView);
    else
      v3 = -[SearchResultQuickActionMenuPresenter initWithTableView:]([SearchResultQuickActionMenuPresenter alloc], "initWithTableView:", self->_tableView);
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = &v3->super;

    WeakRetained = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    -[QuickActionMenuPresenter setDelegate:](self->_quickActionMenuPresenter, "setDelegate:", WeakRetained);

  }
}

- (void)keyboardProxyViewCreated:(id)a3
{
  -[HomeOutlineRootController setKeyboardProxy:](self->_outlineController, "setKeyboardProxy:", a3);
}

- (id)sourceViewForProfileTipPopoverWithViewController:(id)a3
{
  return -[HomeOutlineRootController viewForProfileToolTipPopoverWithType:](self->_outlineController, "viewForProfileToolTipPopoverWithType:", objc_msgSend(a3, "userProfileLinkType"));
}

- (id)_linkButtonWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRightImageButton buttonWithType:](MapsRightImageButton, "buttonWithType:", 0));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v5, "setTintColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v7, "setFont:", v4);

  objc_msgSend(v5, "setTitle:forState:", v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v5, "setTitleColor:forState:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
  objc_msgSend(v5, "setImage:forState:", v9, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v4, 2));
  objc_msgSend(v5, "setPreferredSymbolConfiguration:forImageInState:", v10, 0);

  return v5;
}

- (void)_openTermsAndConditions:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HomeViewController homeActionDelegate](self, "homeActionDelegate", a3));
  objc_msgSend(v3, "homeDidTapTermsAndConditions");

}

- (void)_updateFooterAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  void *v22;
  _QWORD v23[6];
  BOOL v24;
  CGRect v25;
  CGRect v26;

  v3 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    -[HomeViewController _footerHeight](self, "_footerHeight");
    v6 = v5;
    -[HomeViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
    if (v6 != v7)
      -[HomeViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v6, 0.0);
    -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
    -[UICollectionView adjustedContentInset](self->_collectionView, "adjustedContentInset");
    v9 = v8;
    v11 = v10;
    -[UICollectionView contentSize](self->_collectionView, "contentSize");
    v13 = v12;
    -[UICollectionView bounds](self->_collectionView, "bounds");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v18 = v11 + v9 + v13;
    v19 = v18 - CGRectGetMaxY(v25);
    v20 = 0.0;
    if (v19 >= 0.0)
    {
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v20 = v18 - CGRectGetMaxY(v26);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100BA06A8;
    v23[3] = &unk_1011AFB78;
    v23[4] = self;
    v24 = v13 == 0.0;
    *(double *)&v23[5] = v20;
    v21 = objc_retainBlock(v23);
    v22 = v21;
    if (v3)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v21, 0.25);
    else
      ((void (*)(_QWORD *))v21[2])(v21);

  }
}

- (double)_footerHeight
{
  double v2;

  -[UIView systemLayoutSizeFittingSize:](self->_footerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v2;
}

- (void)homeSetNeedsUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self, "view"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (int)listForDataSource:(id)a3
{
  return 1;
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  HomeActionDelegate **p_homeActionDelegate;
  id v5;
  id WeakRetained;

  p_homeActionDelegate = &self->_homeActionDelegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  objc_msgSend(WeakRetained, "homeItemTapped:", v5);

}

- (void)dataSource:(id)a3 sectionHeaderTapped:(id)a4
{
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a4;
  v5 = objc_opt_class(HomeSection);
  isKindOfClass = objc_opt_isKindOfClass(v11, v5);
  v7 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v11;
    if (objc_msgSend(v8, "type") == (id)3)
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2065, 8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController homeActionDelegate](self, "homeActionDelegate"));
    v10 = objc_msgSend(v8, "type");

    objc_msgSend(v9, "homeSectionHeaderButtonTapped:", v10);
    v7 = v11;
  }

}

- (id)newTraits
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController homeActionDelegate](self, "homeActionDelegate"));
  v3 = objc_msgSend(v2, "newTraits");

  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  HomeActionDelegate **p_homeActionDelegate;
  id v5;
  id WeakRetained;
  void *v7;

  p_homeActionDelegate = &self->_homeActionDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "homeContaineeViewController"));
  objc_msgSend(v7, "scrollViewDidScroll:", v5);

  -[HomeViewController _updateFooterAnimated:](self, "_updateFooterAnimated:", 0);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  HomeActionDelegate **p_homeActionDelegate;
  id v4;
  void *v5;
  id WeakRetained;

  p_homeActionDelegate = &self->_homeActionDelegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "homeContaineeViewController"));
  objc_msgSend(v5, "scrollViewWillBeginDragging:", v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  HomeActionDelegate **p_homeActionDelegate;
  id v9;
  void *v10;
  id WeakRetained;

  y = a4.y;
  x = a4.x;
  p_homeActionDelegate = &self->_homeActionDelegate;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "homeContaineeViewController"));
  objc_msgSend(v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);

}

- (HomeActionDelegate)homeActionDelegate
{
  return (HomeActionDelegate *)objc_loadWeakRetained((id *)&self->_homeActionDelegate);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeActionDelegate);
  objc_storeStrong((id *)&self->_termsAndConditionsButton, 0);
  objc_storeStrong((id *)&self->_footerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_outlineController, 0);
  objc_storeStrong((id *)&self->_listController, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_homeCellProvider, 0);
}

@end
