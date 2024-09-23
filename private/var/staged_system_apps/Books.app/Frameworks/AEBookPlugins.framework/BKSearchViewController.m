@implementation BKSearchViewController

- (BKSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKSearchViewController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSearchViewController;
  v4 = -[BKViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[BKSearchViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)releaseViews
{
  UISearchBar *searchField;
  UITableView *resultsTable;
  UIView *container;
  UIView *footer;
  UIButton *googleButton;
  UIButton *wikipediaButton;
  BEHairlineDividerView *headerDividerView;
  BEHairlineDividerView *footerTopBorderView;
  BESearchResultTableViewCell *dummySearchResultsCell;
  BKSearchLoadingTableViewCell *dummySearchLoadingCell;
  objc_super v13;

  -[UISearchBar setDelegate:](self->_searchField, "setDelegate:", 0);
  searchField = self->_searchField;
  self->_searchField = 0;

  -[UITableView setDelegate:](self->_resultsTable, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_resultsTable, "setDataSource:", 0);
  resultsTable = self->_resultsTable;
  self->_resultsTable = 0;

  container = self->_container;
  self->_container = 0;

  footer = self->_footer;
  self->_footer = 0;

  -[UIButton removeTarget:action:forControlEvents:](self->_googleButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  googleButton = self->_googleButton;
  self->_googleButton = 0;

  -[UIButton removeTarget:action:forControlEvents:](self->_wikipediaButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  wikipediaButton = self->_wikipediaButton;
  self->_wikipediaButton = 0;

  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = 0;

  footerTopBorderView = self->_footerTopBorderView;
  self->_footerTopBorderView = 0;

  dummySearchResultsCell = self->_dummySearchResultsCell;
  self->_dummySearchResultsCell = 0;

  dummySearchLoadingCell = self->_dummySearchLoadingCell;
  self->_dummySearchLoadingCell = 0;

  v13.receiver = self;
  v13.super_class = (Class)BKSearchViewController;
  -[BKViewController releaseViews](&v13, "releaseViews");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  -[BKSearchViewController releaseViews](self, "releaseViews");
  objc_storeWeak((id *)&self->_searchDelegate, 0);
  -[BKSearchController setDelegate:](self->_searchController, "setDelegate:", 0);
  -[BKSearchController cancelSearch](self->_searchController, "cancelSearch");
  -[BKSearchViewController setPaginationController:](self, "setPaginationController:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BKSearchViewController;
  -[BKViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *container;
  void *v9;
  BEHairlineDividerView *v10;
  BEHairlineDividerView *headerDividerView;
  UITableView *v12;
  UITableView *resultsTable;
  id v14;
  uint64_t v15;
  int v16;
  double *v17;
  UITableView *v18;
  double v19;
  uint64_t v20;
  UITableView *v21;
  double v22;
  uint64_t v23;
  UISearchBar *v24;
  UISearchBar *searchField;
  void *v26;
  UIView *v27;
  UIView *footer;
  double v29;
  void *v30;
  double v31;
  double v32;
  BEHairlineDividerView *v33;
  BEHairlineDividerView *footerTopBorderView;
  void *v35;
  UIButton *v36;
  UIButton *googleButton;
  void *v38;
  double v39;
  uint64_t v40;
  UIButton *v41;
  id v42;
  void *v43;
  void *v44;
  UIButton *v45;
  id v46;
  UIButton *v47;
  UIButton *wikipediaButton;
  void *v49;
  double v50;
  uint64_t v51;
  UIButton *v52;
  id v53;
  void *v54;
  void *v55;
  UIButton *v56;
  id v57;
  void *v58;
  objc_super v59;
  CGRect v60;

  v59.receiver = self;
  v59.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController viewDidLoad](&v59, "viewDidLoad");
  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  container = self->_container;
  self->_container = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_container, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_container);

  v10 = (BEHairlineDividerView *)objc_alloc_init((Class)BEHairlineDividerView);
  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = v10;

  -[BEHairlineDividerView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerDividerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BEHairlineDividerView setHorizontal:](self->_headerDividerView, "setHorizontal:", 1);
  -[UIView addSubview:](self->_container, "addSubview:", self->_headerDividerView);
  v12 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
  resultsTable = self->_resultsTable;
  self->_resultsTable = v12;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_resultsTable, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_resultsTable, "setDelegate:", self);
  v14 = -[UITableView setDataSource:](self->_resultsTable, "setDataSource:", self);
  v16 = isPad(v14, v15);
  v17 = (double *)&kBESearchSectionSearchResultCellHeightPad;
  if (!v16)
    v17 = (double *)&kBESearchSectionSearchResultCellHeightPhone;
  -[UITableView setEstimatedRowHeight:](self->_resultsTable, "setEstimatedRowHeight:", *v17);
  -[UITableView setRowHeight:](self->_resultsTable, "setRowHeight:", UITableViewAutomaticDimension);
  -[BKSearchViewController _resultsHeaderHeight](self, "_resultsHeaderHeight");
  -[UITableView setSectionHeaderHeight:](self->_resultsTable, "setSectionHeaderHeight:");
  -[UITableView setSectionFooterHeight:](self->_resultsTable, "setSectionFooterHeight:", 0.0);
  v18 = self->_resultsTable;
  *(_QWORD *)&v19 = objc_opt_class(BESearchResultTableViewCell).n128_u64[0];
  -[UITableView registerClass:forCellReuseIdentifier:](v18, "registerClass:forCellReuseIdentifier:", v20, kBESearchTableViewCellResultsIdentifier, v19);
  v21 = self->_resultsTable;
  *(_QWORD *)&v22 = objc_opt_class(BESearchResultTableViewCell).n128_u64[0];
  -[UITableView registerClass:forCellReuseIdentifier:](v21, "registerClass:forCellReuseIdentifier:", v23, kBESearchTableViewCellResultsNightIdentifier, v22);
  -[UITableView setContentInset:](self->_resultsTable, "setContentInset:", 0.0, 0.0, -1.0, 0.0);
  -[UIView addSubview:](self->_container, "addSubview:", self->_resultsTable);
  v24 = (UISearchBar *)objc_claimAutoreleasedReturnValue(+[BESearchViewController p_standardSearchBar](BESearchViewController, "p_standardSearchBar"));
  searchField = self->_searchField;
  self->_searchField = v24;

  -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](self->_searchField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISearchBar setDelegate:](self->_searchField, "setDelegate:", self);
  -[UISearchBar _setAutoDisableCancelButton:](self->_searchField, "_setAutoDisableCancelButton:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));
  objc_msgSend(v26, "addSubview:", self->_searchField);

  -[UISearchBar sizeToFit](self->_searchField, "sizeToFit");
  v27 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  footer = self->_footer;
  self->_footer = v27;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_footer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_container, "addSubview:", self->_footer);
  -[UIView bounds](self->_footer, "bounds");
  v29 = CGRectGetWidth(v60);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v30, "scale");
  v32 = 1.0 / v31;

  v33 = (BEHairlineDividerView *)objc_msgSend(objc_alloc((Class)BEHairlineDividerView), "initWithFrame:", 0.0, 0.0, v29, v32);
  footerTopBorderView = self->_footerTopBorderView;
  self->_footerTopBorderView = v33;

  -[BEHairlineDividerView setAutoresizingMask:](self->_footerTopBorderView, "setAutoresizingMask:", 2);
  -[BEHairlineDividerView setHorizontal:](self->_footerTopBorderView, "setHorizontal:", 1);
  -[UIView addSubview:](self->_footer, "addSubview:", self->_footerTopBorderView);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v36 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  googleButton = self->_googleButton;
  self->_googleButton = v36;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_googleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_footer, "addSubview:", self->_googleButton);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_googleButton, "titleLabel"));
  objc_msgSend(v38, "setFont:", v35);
  objc_msgSend(v35, "pointSize");
  objc_msgSend(v38, "setMinimumScaleFactor:", 8.0 / v39);
  objc_msgSend(v38, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v38, "setTextAlignment:", 1);
  if (-[BKSearchViewController _isRTL](self, "_isRTL"))
    v40 = 2;
  else
    v40 = 1;
  -[UIButton setContentHorizontalAlignment:](self->_googleButton, "setContentHorizontalAlignment:", v40);
  -[UIButton addTarget:action:forControlEvents:](self->_googleButton, "addTarget:action:forControlEvents:", self, "searchWeb:", 64);
  v41 = self->_googleButton;
  v42 = AEBundle();
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Search Web"), &stru_1C3088, 0));
  -[UIButton setTitle:forState:](v41, "setTitle:forState:", v44, 0);

  v45 = self->_googleButton;
  v46 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
  -[UIButton addInteraction:](v45, "addInteraction:", v46);

  v47 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  wikipediaButton = self->_wikipediaButton;
  self->_wikipediaButton = v47;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_wikipediaButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_footer, "addSubview:", self->_wikipediaButton);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_wikipediaButton, "titleLabel"));
  objc_msgSend(v49, "setFont:", v35);
  objc_msgSend(v35, "pointSize");
  objc_msgSend(v49, "setMinimumScaleFactor:", 8.0 / v50);
  objc_msgSend(v49, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v49, "setTextAlignment:", 1);
  if (-[BKSearchViewController _isRTL](self, "_isRTL"))
    v51 = 1;
  else
    v51 = 2;
  -[UIButton setContentHorizontalAlignment:](self->_wikipediaButton, "setContentHorizontalAlignment:", v51);
  -[UIButton addTarget:action:forControlEvents:](self->_wikipediaButton, "addTarget:action:forControlEvents:", self, "searchWikipedia:", 64);
  v52 = self->_wikipediaButton;
  v53 = AEBundle();
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Search Wikipedia"), &stru_1C3088, 0));
  -[UIButton setTitle:forState:](v52, "setTitle:forState:", v55, 0);

  v56 = self->_wikipediaButton;
  v57 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
  -[UIButton addInteraction:](v56, "addInteraction:", v57);

  -[BKSearchViewController _buildConstraints](self, "_buildConstraints");
  -[BKSearchViewController _updateContentSize:](self, "_updateContentSize:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v58, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_buildConstraints
{
  UISearchBar *searchField;
  void *v4;
  BEHairlineDividerView *headerDividerView;
  void *v6;
  UIView *container;
  void *v8;
  UITableView *resultsTable;
  void *v10;
  UIView *footer;
  void *v12;
  UIButton *googleButton;
  void *v14;
  UIButton *wikipediaButton;
  void *v16;
  BEHairlineDividerView *footerTopBorderView;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *footerHeightConstraint;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *searchBarHeightConstraint;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
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
  _QWORD v125[31];

  searchField = self->_searchField;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar constraints](searchField, "constraints"));
  -[UISearchBar removeConstraints:](searchField, "removeConstraints:", v4);

  headerDividerView = self->_headerDividerView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView constraints](headerDividerView, "constraints"));
  -[BEHairlineDividerView removeConstraints:](headerDividerView, "removeConstraints:", v6);

  container = self->_container;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView constraints](container, "constraints"));
  -[UIView removeConstraints:](container, "removeConstraints:", v8);

  resultsTable = self->_resultsTable;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView constraints](resultsTable, "constraints"));
  -[UITableView removeConstraints:](resultsTable, "removeConstraints:", v10);

  footer = self->_footer;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView constraints](footer, "constraints"));
  -[UIView removeConstraints:](footer, "removeConstraints:", v12);

  googleButton = self->_googleButton;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton constraints](googleButton, "constraints"));
  -[UIButton removeConstraints:](googleButton, "removeConstraints:", v14);

  wikipediaButton = self->_wikipediaButton;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton constraints](wikipediaButton, "constraints"));
  -[UIButton removeConstraints:](wikipediaButton, "removeConstraints:", v16);

  footerTopBorderView = self->_footerTopBorderView;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView constraints](footerTopBorderView, "constraints"));
  -[BEHairlineDividerView removeConstraints:](footerTopBorderView, "removeConstraints:", v18);

  if (!self->_footerHeightConstraint)
  {
    v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_footer, 8, 0, 0, 0, 1.0, 44.0));
    footerHeightConstraint = self->_footerHeightConstraint;
    self->_footerHeightConstraint = v19;

    -[NSLayoutConstraint setActive:](self->_footerHeightConstraint, "setActive:", 1);
  }
  if (!self->_searchBarHeightConstraint)
  {
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_searchField, 8, 0, 0, 0, 1.0, 51.0));
    searchBarHeightConstraint = self->_searchBarHeightConstraint;
    self->_searchBarHeightConstraint = v21;

    -[NSLayoutConstraint setActive:](self->_searchBarHeightConstraint, "setActive:", 1);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar leadingAnchor](self->_searchField, "leadingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v123));
  v125[0] = v122;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar topAnchor](self->_searchField, "topAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v120, 5.0));
  v125[1] = v119;
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar trailingAnchor](self->_searchField, "trailingAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v117));
  v125[2] = v116;
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView leftAnchor](self->_headerDividerView, "leftAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leftAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v114));
  v125[3] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView rightAnchor](self->_headerDividerView, "rightAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rightAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v111));
  v125[4] = v110;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView topAnchor](self->_headerDividerView, "topAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_container, "topAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v108));
  v125[5] = v107;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView heightAnchor](self->_headerDividerView, "heightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v25, "scale");
  v27 = 1.0 / v26;

  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToConstant:", v27));
  v125[6] = v105;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_container, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar bottomAnchor](self->_searchField, "bottomAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
  v125[7] = v102;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_container, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v100));
  v125[8] = v99;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_container, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v97));
  v125[9] = v95;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_container, "bottomAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
  v125[10] = v92;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leftAnchor](self->_resultsTable, "leftAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_container, "leftAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
  v125[11] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_resultsTable, "topAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView bottomAnchor](self->_headerDividerView, "bottomAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v125[12] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView rightAnchor](self->_resultsTable, "rightAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_container, "rightAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
  v125[13] = v82;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_resultsTable, "bottomAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_footer, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
  v125[14] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_footer, "leftAnchor"));
  v96 = v23;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leftAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v125[15] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_footer, "rightAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rightAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v125[16] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_footer, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_container, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v125[17] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_footer, "widthAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_container, "widthAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
  v125[18] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_googleButton, "leadingAnchor"));
  v81 = v24;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, 15.0));
  v125[19] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_googleButton, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_footer, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v125[20] = v60;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_googleButton, "widthAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_footer, "widthAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:multiplier:constant:", v57, 0.5, -15.0));
  v125[21] = v56;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_googleButton, "heightAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_footer, "heightAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v55));
  v125[22] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_wikipediaButton, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, -15.0));
  v125[23] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_wikipediaButton, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_footer, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v125[24] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_wikipediaButton, "widthAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_footer, "widthAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:multiplier:constant:", v46, 0.5, -15.0));
  v125[25] = v45;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_wikipediaButton, "heightAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_footer, "heightAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v44));
  v125[26] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView leadingAnchor](self->_footerTopBorderView, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView leadingAnchor](self->_footerTopBorderView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v125[27] = v40;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView topAnchor](self->_footerTopBorderView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView topAnchor](self->_footerTopBorderView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  v125[28] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView widthAnchor](self->_footerTopBorderView, "widthAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView widthAnchor](self->_footerTopBorderView, "widthAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  v125[29] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView heightAnchor](self->_footerTopBorderView, "heightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v35, "scale");
  v37 = 1.0 / v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToConstant:", v37));
  v125[30] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v125, 31));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

  -[UIView setHidden:](self->_footer, "setHidden:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  UITableView *resultsTable;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v4)
    v5 = -[BKSearchViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", CFSTR("ContentSearch"));
  -[UISearchBar setShowsCancelButton:](self->_searchField, "setShowsCancelButton:", -[BKSearchViewController isModalSheet](self, "isModalSheet"));
  resultsTable = self->_resultsTable;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForSelectedRow](resultsTable, "indexPathForSelectedRow"));
  -[UITableView deselectRowAtIndexPath:animated:](resultsTable, "deselectRowAtIndexPath:animated:", v7, 0);

  -[BKSearchViewController stylizeForTheme](self, "stylizeForTheme");
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController viewIsAppearing:](&v4, "viewIsAppearing:", a3);
  -[BKSearchViewController _updateWebsearchButtonsStatus](self, "_updateWebsearchButtonsStatus");
  -[BKSearchViewController _updateContentSize:](self, "_updateContentSize:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController viewDidAppear:](&v13, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchString](self, "searchString"));
  -[UISearchBar setText:](self->_searchField, "setText:", v4);
  if ((unint64_t)objc_msgSend(v4, "length") > 2
    || -[BKSearchViewController accessibilityRequiresActivateForSearchField](self, "accessibilityRequiresActivateForSearchField"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    if (objc_msgSend(v5, "searchWasCompleted"))
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
      v7 = objc_msgSend(v6, "isSearching");

      if ((v7 & 1) == 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
        v10 = objc_msgSend(v9, "count");

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
        v12 = v11;
        if (v10)
          objc_msgSend(v11, "continueSearch");
        else
          objc_msgSend(v11, "beginSearchWithReportAnalytics:", 1);

      }
    }
  }
  else
  {
    -[UISearchBar becomeFirstResponder](self->_searchField, "becomeFirstResponder");
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v5 = objc_msgSend(v4, "searchWasCompleted");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    objc_msgSend(v6, "pauseSearch");

  }
  -[UISearchBar resignFirstResponder](self->_searchField, "resignFirstResponder");
  -[BKSearchViewController _updateWebsearchButtonsStatus](self, "_updateWebsearchButtonsStatus");
  -[BKSearchViewController _updateContentSize:](self, "_updateContentSize:", 0);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[BKSearchViewController stylizeForTheme](self, "stylizeForTheme", a3, a4);
  -[BKSearchViewController _updateCancelButton](self, "_updateCancelButton");
  -[BKSearchViewController _updateWebsearchButtonsStatus](self, "_updateWebsearchButtonsStatus");
  -[BKSearchViewController _updateContentSize:](self, "_updateContentSize:", 0);
}

- (void)didReceiveMemoryWarning
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (-[BKSearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
      objc_msgSend(v5, "didReceiveMemoryWarning");

    }
  }
  v6.receiver = self;
  v6.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController didReceiveMemoryWarning](&v6, "didReceiveMemoryWarning");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  unsigned int v15;
  char v16;
  void *v17;
  _QWORD v18[7];
  char v19;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (v10 != width || v12 != height)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
    objc_msgSend(WeakRetained, "searchViewController:willTransitionToSize:", self, width, height);

    v15 = -[BKSearchViewController sizeChangesRequireBookRepagination](self, "sizeChangesRequireBookRepagination");
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
      objc_msgSend(v17, "cancelSearch");

    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_8BE54;
    v18[3] = &unk_1C0D18;
    v18[4] = self;
    *(double *)&v18[5] = width;
    *(double *)&v18[6] = height;
    v19 = v16;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v18);
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[BKSearchViewController isModalSheet](self, "isModalSheet"))
    return 26;
  else
    return 30;
}

- (BOOL)isModalSheet
{
  return -[BKSearchViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") ^ 1;
}

- (void)setTheme:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKSearchViewController;
  v5 = -[BKSearchViewController theme](&v8, "theme");
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (v6 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKSearchViewController;
    -[BKSearchViewController setTheme:](&v7, "setTheme:", v4);
    -[BKSearchViewController stylizeForTheme](self, "stylizeForTheme");
  }

}

- (void)stylizeForTheme
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  id v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController viewIfLoaded](self, "viewIfLoaded"));
  if (v3)
  {
    v33 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController themePage](self, "themePage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorForTraitEnvironment:", self));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryTextColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleBody));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithConfiguration:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithTintColor:", v6));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithRenderingMode:", 1));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleBody));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v13));

    v15 = (void *)v6;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithTintColor:", v6));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
    objc_msgSend(v33, "setTintColor:", v17);

    -[UIView setBackgroundColor:](self->_container, "setBackgroundColor:", v5);
    objc_msgSend(v33, "setBackgroundColor:", v5);
    -[UITableView setBackgroundColor:](self->_resultsTable, "setBackgroundColor:", v5);
    -[UIView setBackgroundColor:](self->_footer, "setBackgroundColor:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableViewSeparatorColor"));
    -[UITableView setSeparatorColor:](self->_resultsTable, "setSeparatorColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController popoverPresentationController](self, "popoverPresentationController"));
    objc_msgSend(v19, "setBackgroundColor:", v5);

    -[UISearchBar setBarStyle:](self->_searchField, "setBarStyle:", objc_msgSend(v4, "isNight:", self));
    -[UISearchBar setBackgroundColor:](self->_searchField, "setBackgroundColor:", v5);
    -[UISearchBar setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", objc_msgSend(v4, "keyboardAppearance"));
    v32 = (void *)v11;
    v20 = v11;
    v21 = (void *)v16;
    -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchField, "setImage:forSearchBarIcon:state:", v20, 1, 0);
    -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchField, "setImage:forSearchBarIcon:state:", v16, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar searchField](self->_searchField, "searchField"));
    if ((-[BKSearchViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0
      || -[BKSearchViewController im_isCompactHeight](self, "im_isCompactHeight"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryBackgroundColor"));
      objc_msgSend(v22, "setBackgroundColor:", v23);

    }
    else
    {
      objc_msgSend(v22, "setBackgroundColor:", 0);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryTextColor"));
    objc_msgSend(v22, "setTextColor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_placeholderLabel"));
    v26 = v15;
    objc_msgSend(v25, "setTextColor:", v15);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leftView"));
    objc_msgSend(v27, "setTintColor:", v15);

    if (objc_msgSend(v22, "isFirstResponder"))
      objc_msgSend(v22, "reloadInputViewsWithoutReset");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "separatorColor"));
    -[BEHairlineDividerView setDividerColor:](self->_headerDividerView, "setDividerColor:", v28);
    -[BEHairlineDividerView setDividerColor:](self->_footerTopBorderView, "setDividerColor:", v28);
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "window"));
    if (v29)
    {
      v30 = (void *)v29;
      v31 = -[BKSearchViewController isModalSheet](self, "isModalSheet");

      if (v31)
        -[BKSearchViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    }
    -[UITableView reloadData](self->_resultsTable, "reloadData");

    v3 = v33;
  }

}

- (void)contentSizeCategoryDidChange
{
  self->_maxContentHeightWasReached = 0;
  -[BKSearchViewController _reloadResultsAndResizeIfNecessary:](self, "_reloadResultsAndResizeIfNecessary:", 0);
}

- (id)searchController
{
  BKSearchController *searchController;
  BKSearchController *v4;
  BKSearchController *v5;

  searchController = self->_searchController;
  if (!searchController)
  {
    v4 = objc_alloc_init(BKSearchController);
    v5 = self->_searchController;
    self->_searchController = v4;

    -[BKSearchController setDelegate:](self->_searchController, "setDelegate:", self);
    -[BKSearchController setPageCount:](self->_searchController, "setPageCount:", -[BKPaginationController pageTotal](self->_paginationController, "pageTotal"));
    searchController = self->_searchController;
  }
  return searchController;
}

- (id)physicalPageMapForPageTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchBook"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "physicalPageMap"));

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_8C554;
  v18 = sub_8C564;
  v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8C56C;
  v11[3] = &unk_1C0D40;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "indexOfObjectWithOptions:passingTest:", 1, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)searchStringIsPageNumber
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  int v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchString](self, "searchString"));
  if (-[BKSearchViewController showPhysicalPages](self, "showPhysicalPages"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController physicalPageMapForPageTitle:](self, "physicalPageMapForPageTitle:", v3));
    v5 = v4 != 0;
LABEL_7:

    goto LABEL_8;
  }
  v6 = objc_msgSend(v3, "intValue");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    v9 = objc_msgSend(v8, "pageCount");

    if ((unint64_t)v9 >= v7)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v7));
      v5 = objc_msgSend(v10, "isEqualToString:", v11);

      goto LABEL_7;
    }
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)_shouldShowSearchResultsView
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[BKSearchViewController isModalSheet](self, "isModalSheet"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchString](self, "searchString"));
  if ((unint64_t)objc_msgSend(v4, "length") <= 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
    if (objc_msgSend(v6, "count"))
    {
      v3 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
      if ((objc_msgSend(v7, "searchWasCompleted") & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
        if ((objc_msgSend(v8, "isSearching") & 1) != 0)
          v3 = 1;
        else
          v3 = -[BKSearchViewController searchStringIsPageNumber](self, "searchStringIsPageNumber");

      }
    }

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (CGSize)_preferredContentSizeIsMinimum:(BOOL *)a3
{
  void *v5;
  double width;
  char v7;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unsigned int v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  if (!-[BKSearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    v7 = 0;
    width = CGSizeZero.width;
    height = CGSizeZero.height;
    if (!a3)
      goto LABEL_20;
    goto LABEL_19;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityMedium))
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge))width = 640.0;
    else
      width = 480.0;
  }
  else
  {
    width = 320.0;
  }
  -[BKSearchViewController maxContentHeight](self, "maxContentHeight");
  if (v9 <= 0.0)
  {
    v11 = kBESearchPopoverViewMaxContentHeight;
  }
  else
  {
    -[BKSearchViewController maxContentHeight](self, "maxContentHeight");
    v11 = v10;
  }
  -[UISearchBar layoutIfNeeded](self->_searchField, "layoutIfNeeded");
  -[UISearchBar sizeThatFits:](self->_searchField, "sizeThatFits:", width, v11);
  v13 = v12 + 5.0;
  -[NSLayoutConstraint setConstant:](self->_searchBarHeightConstraint, "setConstant:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar superview](self->_searchField, "superview"));
  objc_msgSend(v14, "layoutIfNeeded");

  v15 = -[BKSearchViewController _shouldShowSearchResultsView](self, "_shouldShowSearchResultsView");
  v16 = 0.0;
  if (v15)
  {
    -[UISearchBar frame](self->_searchField, "frame", 0.0);
    v17 = CGRectGetMaxY(v22) + 44.0;
    -[UITableView preferredContentHeightWithMax:](self->_resultsTable, "preferredContentHeightWithMax:", v11 - v17);
    v19 = v17 + v18;
    if (v11 < v19)
      v19 = v11;
    if (v19 >= v13)
      v13 = v19;
    v16 = 1.0;
  }
  -[UIView setAlpha:](self->_container, "setAlpha:", v16);
  v7 = v15 ^ 1;
  height = ceil(v13);
  if (a3)
LABEL_19:
    *a3 = v7;
LABEL_20:
  v20 = width;
  result.height = height;
  result.width = v20;
  return result;
}

- (void)_updateCancelButton
{
  -[UISearchBar setShowsCancelButton:](self->_searchField, "setShowsCancelButton:", -[BKSearchViewController isModalSheet](self, "isModalSheet"));
}

- (void)_updateContentSize:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  char v12;

  v12 = 0;
  -[BKSearchViewController _preferredContentSizeIsMinimum:](self, "_preferredContentSizeIsMinimum:", &v12);
  v6 = v5;
  v8 = v7;
  if (-[BKSearchViewController resizeAnimationInProgress](self, "resizeAnimationInProgress") && a3)
  {
    -[BKSearchViewController setResizeRequestPending:](self, "setResizeRequestPending:", 1);
  }
  else
  {
    -[BKSearchViewController maxContentHeight](self, "maxContentHeight");
    if (v9 <= 0.0)
      v10 = kBESearchPopoverViewMaxContentHeight;
    else
      -[BKSearchViewController maxContentHeight](self, "maxContentHeight");
    self->_maxContentHeightWasReached = v8 >= v10;
    +[CATransaction begin](CATransaction, "begin");
    -[BKSearchViewController setResizeAnimationInProgress:](self, "setResizeAnimationInProgress:", 1);
    -[BKSearchViewController setResizeRequestPending:](self, "setResizeRequestPending:", 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_8CB3C;
    v11[3] = &unk_1BEA38;
    v11[4] = self;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v11);
    -[BKSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
    +[CATransaction commit](CATransaction, "commit");
    -[BKSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
    -[UITableView reloadData](self->_resultsTable, "reloadData");
  }
}

- (void)_updateWebsearchButtonsStatus
{
  void *v3;
  id v4;
  double v5;
  _BOOL8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchString](self, "searchString"));
  v4 = objc_msgSend(v3, "length");

  v5 = 1.0;
  if (!v4 && (-[BKSearchViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0)
    v5 = (double)-[BKSearchViewController im_isCompactHeight](self, "im_isCompactHeight");
  v6 = v4 != 0;
  -[UIButton setEnabled:](self->_wikipediaButton, "setEnabled:", v6);
  -[UIButton setEnabled:](self->_googleButton, "setEnabled:", v6);
  -[UIButton setAlpha:](self->_wikipediaButton, "setAlpha:", v5);
  -[UIButton setAlpha:](self->_googleButton, "setAlpha:", v5);
  -[BKSearchViewController _updateFooterConstraint](self, "_updateFooterConstraint");
}

- (void)_updateFooterConstraint
{
  double v3;
  double v4;
  unsigned int v5;

  if (-[UIButton isEnabled](self->_wikipediaButton, "isEnabled")
    && (-[UIView alpha](self->_container, "alpha"), v3 > 0.0)
    || (-[BKSearchViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0)
  {
    v4 = 44.0;
  }
  else
  {
    v5 = -[BKSearchViewController im_isCompactHeight](self, "im_isCompactHeight");
    v4 = 44.0;
    if (!v5)
      v4 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](self->_footerHeightConstraint, "setConstant:", v4);
  -[UIView layoutIfNeeded](self->_container, "layoutIfNeeded");
}

- (NSString)searchString
{
  return -[BKSearchController searchString](self->_searchController, "searchString");
}

- (void)setSearchString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar text](self->_searchField, "text"));
  v5 = objc_msgSend(v8, "caseInsensitiveCompare:", v4);

  if (v5)
  {
    -[UISearchBar setText:](self->_searchField, "setText:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    objc_msgSend(v6, "setSearchString:", v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    objc_msgSend(v7, "beginSearchWithReportAnalytics:", 1);

  }
}

- (void)setShowPhysicalPages:(BOOL)a3
{
  if (self->_showPhysicalPages != a3)
  {
    self->_showPhysicalPages = a3;
    -[UITableView reloadData](self->_resultsTable, "reloadData");
  }
}

- (void)paginationComplete
{
  -[BKSearchController setPageCount:](self->_searchController, "setPageCount:", -[BKPaginationController pageTotal](self->_paginationController, "pageTotal"));
  -[UITableView reloadData](self->_resultsTable, "reloadData");
}

- (void)setPaginationController:(id)a3
{
  BKPaginationController *v5;
  BKPaginationController **p_paginationController;
  BKPaginationController *paginationController;
  void *v8;
  void *v9;
  BKPaginationController *v10;

  v5 = (BKPaginationController *)a3;
  p_paginationController = &self->_paginationController;
  paginationController = self->_paginationController;
  v10 = v5;
  if (paginationController != v5)
  {
    if (paginationController)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "removeObserver:name:object:", self, BKPaginationCompleteForBookNotification, *p_paginationController);

    }
    objc_storeStrong((id *)&self->_paginationController, a3);
    if (*p_paginationController)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v9, "addObserver:selector:name:object:", self, "paginationComplete", BKPaginationCompleteForBookNotification, *p_paginationController);

    }
  }

}

- (void)revealSearchResult:(id)a3
{
  -[BKSearchViewController revealSearchResult:animated:](self, "revealSearchResult:animated:", a3, 1);
}

- (void)revealSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v4 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "searchViewController:revealSearchResult:animated:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_searchDelegate);
    objc_msgSend(v8, "searchViewController:revealSearchResult:animated:", self, v9, v4);

  }
}

- (void)searchWebForString:(id)a3
{
  -[BKSearchViewController setSearchString:](self, "setSearchString:", a3);
  -[BKSearchViewController searchWeb:](self, "searchWeb:", 0);
}

- (void)searchEncyclopediaForString:(id)a3
{
  -[BKSearchViewController setSearchString:](self, "setSearchString:", a3);
  -[BKSearchViewController searchWikipedia:](self, "searchWikipedia:", 0);
}

- (void)openURLUsingNSString:(id)a3
{
  id v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = a3;
    v5 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v3);

    if (v5)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v4, "openURL:options:completionHandler:", v5, &__NSDictionary0__struct, 0);

    }
  }
}

- (id)_escapedSearchString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchString](self, "searchString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", v3));

  return v4;
}

- (void)searchWeb:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController _escapedSearchString](self, "_escapedSearchString", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("x-web-search://?%@"), v4));

  v5 = v6;
  if (v6)
  {
    -[BKSearchViewController openURLUsingNSString:](self, "openURLUsingNSString:", v6);
    v5 = v6;
  }

}

- (void)searchWikipedia:(id)a3
{
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages", a3));
  if (objc_msgSend(v11, "count"))
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", 0));
  else
    v4 = CFSTR("en");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v4, "substringToIndex:", 2));

  v6 = AEBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("https://%2$@.wikipedia.org/wiki/%1$@"), &stru_1C3088, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController _escapedSearchString](self, "_escapedSearchString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v5));

  if (v10)
    -[BKSearchViewController openURLUsingNSString:](self, "openURLUsingNSString:", v10);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[UISearchBar resignFirstResponder](self->_searchField, "resignFirstResponder", a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController", a3));
  v7 = v6;
  if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
    v9 = objc_msgSend(v8, "count");

    v10 = (int64_t)v9
        + -[BKSearchViewController _shouldShowSearchResultsView](self, "_shouldShowSearchResultsView");
  }
  else
  {
    v10 = -[BKSearchViewController searchStringIsPageNumber](self, "searchStringIsPageNumber");
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __CFString *v46;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") == (char *)&dword_0 + 1)
  {
    v8 = objc_msgSend(v7, "row");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
    v11 = objc_msgSend(v10, "count");

    if (v8 == v11)
      v12 = objc_claimAutoreleasedReturnValue(-[BKSearchViewController _loadingCellForTableView:](self, "_loadingCellForTableView:", v6));
    else
      v12 = objc_claimAutoreleasedReturnValue(-[BKSearchViewController _resultsCellForRow:inTableView:](self, "_resultsCellForRow:inTableView:", objc_msgSend(v7, "row"), v6));
    v17 = (id)v12;
    if (!v12)
LABEL_13:
      v17 = objc_alloc_init((Class)UITableViewCell);
  }
  else
  {
    if (objc_msgSend(v7, "section"))
      goto LABEL_13;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController themePage](self, "themePage"));
    v14 = objc_msgSend(v13, "isNight:", self);
    v15 = CFSTR("pageNumberCell");
    if (v14)
      v15 = CFSTR("pageNumberCell-night");
    v16 = v15;
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v16));
    if (!v17)
    {
      v17 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", (double)kBESearchResultFontSize));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
      objc_msgSend(v19, "setFont:", v18);

      v20 = objc_alloc((Class)UIView);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
      objc_msgSend(v21, "bounds");
      v22 = objc_msgSend(v20, "initWithFrame:");
      objc_msgSend(v17, "setSelectedBackgroundView:", v22);

    }
    v46 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchString"));

    v45 = v24;
    if (-[BKSearchViewController showPhysicalPages](self, "showPhysicalPages"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController physicalPageMapForPageTitle:](self, "physicalPageMapForPageTitle:", v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", CFSTR("name")));

      v27 = AEBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v26));
    }
    else
    {
      v32 = objc_msgSend(v24, "integerValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchDelegate](self, "searchDelegate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "searchViewController:chapterNameForSearchResult:pageNumber:", self, 0, v32));

      v34 = AEBundle();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v28 = v35;
      if (v26)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Page %@, %@"), &stru_1C3088, 0));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v32, 0));
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v36, v26);
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v32, 0));
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v36, v44);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(v37);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
    objc_msgSend(v38, "setText:", v30);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView backgroundColor](self->_resultsTable, "backgroundColor"));
    objc_msgSend(v17, "setBackgroundColor:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "primaryTextColor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
    objc_msgSend(v41, "setTextColor:", v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tableViewCellSelectedColor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedBackgroundView"));
    objc_msgSend(v43, "setBackgroundColor:", v42);

    if (!v17)
      goto LABEL_13;
  }

  return v17;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  -[BKSearchViewController _resultsEstimatedRowHeight](self, "_resultsEstimatedRowHeight", a3, a4);
  return result;
}

- (BESearchResultTableViewCell)dummySearchResultsCell
{
  BESearchResultTableViewCell *dummySearchResultsCell;
  BESearchResultTableViewCell *v4;
  BESearchResultTableViewCell *v5;

  dummySearchResultsCell = self->_dummySearchResultsCell;
  if (!dummySearchResultsCell)
  {
    v4 = (BESearchResultTableViewCell *)objc_msgSend(objc_alloc((Class)BESearchResultTableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
    v5 = self->_dummySearchResultsCell;
    self->_dummySearchResultsCell = v4;

    dummySearchResultsCell = self->_dummySearchResultsCell;
  }
  return dummySearchResultsCell;
}

- (BKSearchLoadingTableViewCell)dummySearchLoadingCell
{
  BKSearchLoadingTableViewCell *dummySearchLoadingCell;
  BKSearchLoadingTableViewCell *v4;
  BKSearchLoadingTableViewCell *v5;

  dummySearchLoadingCell = self->_dummySearchLoadingCell;
  if (!dummySearchLoadingCell)
  {
    v4 = -[BKSearchLoadingTableViewCell initWithStyle:reuseIdentifier:]([BKSearchLoadingTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, 0);
    v5 = self->_dummySearchLoadingCell;
    self->_dummySearchLoadingCell = v4;

    -[BKSearchViewController _configureLoadingCell:](self, "_configureLoadingCell:", self->_dummySearchLoadingCell);
    dummySearchLoadingCell = self->_dummySearchLoadingCell;
  }
  return dummySearchLoadingCell;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  if (a4 == 1)
  {
    v12 = AEBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v9 = v8;
    v10 = CFSTR("Text");
  }
  else
  {
    if (a4 || !-[BKSearchViewController searchStringIsPageNumber](self, "searchStringIsPageNumber"))
    {
      v11 = 0;
      goto LABEL_8;
    }
    v7 = AEBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    v10 = CFSTR("Page Number");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1C3088, 0));

LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController themePage](self, "themePage"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("BKSearchTableHeaderViewIdentifier")));
  if (!v14)
    v14 = objc_msgSend(objc_alloc((Class)UITableViewHeaderFooterView), "initWithReuseIdentifier:", CFSTR("BKSearchTableHeaderViewIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textLabel"));
  objc_msgSend(v15, "setText:", v11);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secondaryTextColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textLabel"));
  objc_msgSend(v17, "setTextColor:", v16);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_8D998;
  v21[3] = &unk_1C0D68;
  v22 = v13;
  v23 = v6;
  v18 = v6;
  v19 = v13;
  objc_msgSend(v14, "_setBackgroundViewConfigurationProvider:", v21);

  return v14;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  if (a4 == 1
    || (v7 = 0.0, !a4) && -[BKSearchViewController searchStringIsPageNumber](self, "searchStringIsPageNumber"))
  {
    -[BKSearchViewController _resultsHeaderHeight](self, "_resultsHeaderHeight");
    v7 = v8;
  }

  return v7;
}

- (void)_updateLoadingCell:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  void *v27;
  char *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v5 = objc_msgSend(v4, "isSearching");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "activityIndicator"));
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(v6, "isAnimating");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "activityIndicator"));
      objc_msgSend(v9, "startAnimating");

    }
    v10 = AEBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Searching…"), &stru_1C3088, 0));
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v6, "stopAnimating");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v15 = objc_msgSend(v14, "wasAborted");

  if (v15)
  {
    v16 = AEBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    v19 = CFSTR("Search Cancelled");
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    v21 = objc_msgSend(v20, "hasPartialResults");

    if (v21)
    {
      v22 = AEBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v18 = v17;
      v19 = CFSTR("Load More…");
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
      v24 = objc_msgSend(v23, "searchWasCompleted");

      if (!v24)
      {
        v12 = 0;
        goto LABEL_19;
      }
      v25 = AEBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v18 = v17;
      v19 = CFSTR("Search Completed");
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1C3088, 0));

  if (!v12)
  {
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "results"));
  v28 = (char *)objc_msgSend(v27, "count");

  if (v28 == (_BYTE *)&dword_0 + 1)
  {
    v30 = AEBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@ match found"), &stru_1C3088, 0));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", 1, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v32));

  }
  else
  {
    v29 = AEBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (v28)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@ matches found"), &stru_1C3088, 0));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v28, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v34));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("No matches found"), &stru_1C3088, 0));
    }
  }
LABEL_5:

LABEL_20:
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "textLabel"));
  objc_msgSend(v35, "setText:", v12);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "detailTextLabel"));
  objc_msgSend(v36, "setText:", v13);

}

- (void)_configureLoadingCell:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "setSelectionStyle:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
    v4 = (double)kBESearchResultFontSize;
    objc_msgSend(v11, "_scaledValueForValue:", (double)kBESearchResultFontSize);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textLabel"));
    objc_msgSend(v6, "setFont:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textLabel"));
    objc_msgSend(v7, "setTextAlignment:", 1);

    objc_msgSend(v11, "_scaledValueForValue:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textLabel"));
    objc_msgSend(v9, "setFont:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "detailTextLabel"));
    objc_msgSend(v10, "setTextAlignment:", 1);

  }
}

- (id)_loadingCellForTableView:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  BKSearchLoadingTableViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController themePage](self, "themePage"));
  v6 = objc_msgSend(v5, "isNight:", self);
  v7 = CFSTR("loadingCell");
  if (v6)
    v7 = CFSTR("loadingCell-night");
  v8 = v7;
  v9 = (BKSearchLoadingTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v8));

  if (!v9)
  {
    v9 = -[BKSearchLoadingTableViewCell initWithStyle:reuseIdentifier:]([BKSearchLoadingTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, v8);
    -[BKSearchViewController _configureLoadingCell:](self, "_configureLoadingCell:", v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryTextColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView backgroundColor](self->_resultsTable, "backgroundColor"));
  -[BKSearchLoadingTableViewCell setBackgroundColor:](v9, "setBackgroundColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell contentView](v9, "contentView"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell activityIndicator](v9, "activityIndicator"));
  objc_msgSend(v13, "setColor:", v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell textLabel](v9, "textLabel"));
  objc_msgSend(v14, "setTextColor:", v10);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell detailTextLabel](v9, "detailTextLabel"));
  objc_msgSend(v15, "setTextColor:", v10);

  -[BKSearchViewController _updateLoadingCell:](self, "_updateLoadingCell:", v9);
  return v9;
}

- (void)_configureResultsCell:(id)a3 forRow:(unint64_t)a4 inTableView:(id)a5
{
  void *v5;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unsigned __int8 v49;
  void *v50;
  __CFString *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  CGRect v69;

  v68 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController themePage](self, "themePage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryTextColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView backgroundColor](self->_resultsTable, "backgroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "titleLabel"));
  objc_msgSend(v13, "setTextColor:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "resultLabel"));
  objc_msgSend(v14, "setTextColor:", v11);

  v15 = objc_msgSend(v10, "isNight:", self);
  if (v15)
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "buttonTitleColor"));
  else
    v16 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "resultLabel"));
  objc_msgSend(v17, "setBoldColor:", v16);

  if (v15)
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryTextColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "pageNumberLabel"));
  objc_msgSend(v19, "setTextColor:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableViewCellSelectedColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "selectedBackgroundView"));
  objc_msgSend(v21, "setBackgroundColor:", v20);

  objc_msgSend(v68, "setBackgroundColor:", v12);
  objc_msgSend(v9, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v69.origin.x = v23;
  v69.origin.y = v25;
  v69.size.width = v27;
  v69.size.height = v29;
  objc_msgSend(v68, "setMaxWidth:", CGRectGetWidth(v69));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "results"));
  v32 = objc_msgSend(v31, "count");

  if ((unint64_t)v32 > a4)
  {
    *(_QWORD *)&v33 = objc_opt_class(BKSearchResult).n128_u64[0];
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController", v33));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "results"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndex:", a4));
    v39 = BUDynamicCast(v35, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchDelegate](self, "searchDelegate"));
    v42 = objc_msgSend(v41, "searchViewController:pageNumberForDocumentOrdinal:", self, objc_msgSend(v40, "ordinal"));

    v43 = 0x7FFFFFFFFFFFFFFFLL;
    if (v42 == (id)0x7FFFFFFFFFFFFFFFLL
      || (v43 = (uint64_t)v42 + (_QWORD)objc_msgSend(v40, "pageOffset"),
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController")),
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "searchBook")),
          v45 = objc_msgSend(v37, "suppressTOC"),
          v37,
          v44,
          (v45 & 1) != 0))
    {
      v46 = 0;
    }
    else
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController paginationController](self, "paginationController"));

      if (v47)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController paginationController](self, "paginationController"));
        v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "titleForChapterAtPageNumber:", v43));
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchDelegate](self, "searchDelegate"));
        v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "searchViewController:chapterNameForSearchResult:pageNumber:", self, v40, v43));
      }
      v46 = (void *)v48;

    }
    v49 = -[BKSearchViewController showPhysicalPages](self, "showPhysicalPages");
    if ((v49 & 1) != 0
      || (v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController")),
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "searchBook")),
          (objc_msgSend(v5, "isFixedLayout") & 1) != 0))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pageTitle"));

      if ((v49 & 1) == 0)
      {

      }
      if (!v50)
      {
LABEL_22:
        if ((unint64_t)(v43 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
        {
          if (v46)
            v51 = v46;
          else
            v51 = &stru_1C3088;
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v43, 0));
          goto LABEL_35;
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pageTitle"));
        v53 = objc_msgSend(v52, "length");

        if (v53)
        {
          if (v46)
          {
            v54 = AEBundle();
            v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
            v56 = &stru_1C3088;
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("%@, %@"), &stru_1C3088, 0));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pageTitle"));
            v51 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v57, v46, v58));

LABEL_35:
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "titleLabel"));
            objc_msgSend(v60, "setText:", v51);

            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "text"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "resultLabel"));
            objc_msgSend(v62, "setText:", v61);

            v63 = objc_msgSend(v40, "searchStringRange");
            v65 = v64;
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "resultLabel"));
            objc_msgSend(v66, "setBoldRange:", v63, v65);

            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "pageNumberLabel"));
            objc_msgSend(v67, "setText:", v56);

            objc_msgSend(v68, "applyLabelFonts");
            objc_msgSend(v68, "updateConstraintsIfNeeded");

            goto LABEL_36;
          }
          v59 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pageTitle"));
        }
        else
        {
          if (!v46)
          {
            v56 = &stru_1C3088;
            v51 = &stru_1C3088;
            goto LABEL_35;
          }
          v59 = v46;
        }
        v51 = v59;
        v56 = &stru_1C3088;
        goto LABEL_35;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pageTitle"));
      v43 = (uint64_t)objc_msgSend(v37, "integerValue");
    }
    else
    {

    }
    goto LABEL_22;
  }
LABEL_36:

}

- (id)_resultsCellForRow:(unint64_t)a3 inTableView:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController themePage](self, "themePage"));
  v8 = objc_msgSend(v7, "isNight:", self);

  v9 = (id *)&kBESearchTableViewCellResultsNightIdentifier;
  if (!v8)
    v9 = (id *)&kBESearchTableViewCellResultsIdentifier;
  v10 = *v9;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v10));
  if (!v11)
    v11 = objc_msgSend(objc_alloc((Class)BESearchResultTableViewCell), "initWithStyle:reuseIdentifier:", 0, v10);
  -[BKSearchViewController _configureResultsCell:forRow:inTableView:](self, "_configureResultsCell:forRow:inTableView:", v11, a3, v6);

  return v11;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") == (char *)&dword_0 + 1
    && (v8 = (char *)objc_msgSend(v7, "row"),
        (uint64_t)v8 >= (uint64_t)((char *)objc_msgSend(v6, "numberOfRowsInSection:", 1) - 1))
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController")),
        v10 = objc_msgSend(v9, "hasPartialResults"),
        v9,
        !v10))
  {
    v11 = 0;
  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  BKAnchorPathLocation *v18;
  id WeakRetained;
  void *v20;
  unsigned int v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") != (char *)&dword_0 + 1)
  {
    if (objc_msgSend(v6, "section"))
      goto LABEL_14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchString](self, "searchString"));
    if (-[BKSearchViewController showPhysicalPages](self, "showPhysicalPages"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController physicalPageMapForPageTitle:](self, "physicalPageMapForPageTitle:", v15));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("href")));

      if (!v17)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = -[BKAnchorPathLocation initWithPath:]([BKAnchorPathLocation alloc], "initWithPath:", v17);
      WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
      objc_msgSend(WeakRetained, "searchViewController:turnToLocation:animated:", self, v18, 1);

    }
    else
    {
      v17 = objc_loadWeakRetained((id *)&self->_searchDelegate);
      v18 = (BKAnchorPathLocation *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchString](self, "searchString"));
      objc_msgSend(v17, "searchViewController:turnToPageNumber:animated:", self, (int)-[BKAnchorPathLocation intValue](v18, "intValue"), 1);
    }

    goto LABEL_12;
  }
  v7 = (char *)objc_msgSend(v6, "row");
  if ((uint64_t)v7 < (uint64_t)((char *)objc_msgSend(v22, "numberOfRowsInSection:", 1) - 1))
  {
    *(_QWORD *)&v8 = objc_opt_class(BKSearchResult).n128_u64[0];
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController", v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "results"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v6, "row")));
    v14 = BUDynamicCast(v10, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    -[BKSearchViewController revealSearchResult:](self, "revealSearchResult:", v15);
LABEL_13:

    goto LABEL_14;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v21 = objc_msgSend(v20, "hasPartialResults");

  if (v21)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    objc_msgSend(v15, "loadMore");
    goto LABEL_13;
  }
LABEL_14:

}

- (double)_resultsEstimatedRowHeight
{
  double v2;
  double *v3;

  if (!-[BKSearchViewController isModalSheet](self, "isModalSheet"))
  {
    v3 = (double *)&kBESearchSectionSearchResultCellHeightPad;
    return *v3;
  }
  v2 = kBESearchSectionSearchResultCellHeightPhone;
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge))
    {
      v3 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargestHeightPhone;
      return *v3;
    }
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge))return kBESearchSectionSearchResultCellAccessibilityLargerHeightPhone;
  }
  return v2;
}

- (double)_resultsHeaderHeight
{
  double *v2;
  double result;
  double v4;
  unsigned int v5;

  if (!+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))
  {
    v2 = (double *)&kBESearchTableViewHeaderHeight;
    return *v2;
  }
  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge))
  {
    v2 = (double *)&kBESearchTableViewAccessibilityHeaderLargestHeight;
    return *v2;
  }
  v4 = kBESearchTableViewAccessibilityHeaderLargeHeight;
  v5 = +[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge);
  result = kBESearchTableViewAccessibilityHeaderLargerHeight;
  if (!v5)
    return v4;
  return result;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar text](self->_searchField, "text", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  objc_msgSend(v6, "setSearchString:", v5);

  -[BKSearchViewController _updateWebsearchButtonsStatus](self, "_updateWebsearchButtonsStatus");
  -[BKSearchViewController _updateContentSize:](self, "_updateContentSize:", 1);
  -[BKSearchViewController _updateFooterConstraint](self, "_updateFooterConstraint");
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchString"));
  if (!objc_msgSend(v4, "isEqualToString:", v6))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
  if (!v8)
  {

LABEL_6:
LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "text"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    objc_msgSend(v15, "setSearchString:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
    objc_msgSend(v16, "beginSearchWithReportAnalytics:", 1);

    v13 = v17;
    goto LABEL_8;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "results"));
  v12 = objc_msgSend(v11, "count");

  v13 = v17;
  if (!v12)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v13, "resignFirstResponder");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchController](self, "searchController", a3));
  objc_msgSend(v4, "pauseSearch");

  -[BKSearchViewController revealSearchResult:](self, "revealSearchResult:", 0);
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_searchField == a3)
    return 3;
  else
    return 0;
}

- (void)searchControllerResultsChanged:(id)a3
{
  -[BKSearchViewController _reloadResultsAndResizeIfNecessary:](self, "_reloadResultsAndResizeIfNecessary:", 1);
}

- (void)searchControllerWillBeginSearching:(id)a3 reportAnalytics:(BOOL)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchString"));
  -[BKSearchViewController _analyticsSubmitInBookSearchEventWithSearchText:](self, "_analyticsSubmitInBookSearchEventWithSearchText:", v5);

  self->_maxContentHeightWasReached = 0;
  -[BKSearchViewController _reloadResultsAndResizeIfNecessary:](self, "_reloadResultsAndResizeIfNecessary:", 1);
}

- (void)searchControllerDidFinishSearching:(id)a3
{
  -[BKSearchViewController _reloadResultsAndResizeIfNecessary:](self, "_reloadResultsAndResizeIfNecessary:", 1);
}

- (void)_reloadResultsAndResizeIfNecessary:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[BKSearchViewController isModalSheet](self, "isModalSheet") && !self->_maxContentHeightWasReached)
  {
    -[BKSearchViewController _updateContentSize:](self, "_updateContentSize:", v3);
    -[BKSearchViewController _updateFooterConstraint](self, "_updateFooterConstraint");
  }
  -[UITableView reloadData](self->_resultsTable, "reloadData");
}

- (void)searchControllerFinishedSearchingChapter:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchViewController _loadingCellForTableView:](self, "_loadingCellForTableView:", self->_resultsTable));
  -[BKSearchViewController _updateLoadingCell:](self, "_updateLoadingCell:", v4);

}

- (id)environmentOverrideViewForSearchController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[BKSearchViewController isModalSheet](self, "isModalSheet", a3))
    goto LABEL_6;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController viewIfLoaded](self, "viewIfLoaded"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (!v5)
  {

LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchDelegate](self, "searchDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "environmentOverrideViewForSearchViewController:", self));

    return v7;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));

  if (!v7)
    goto LABEL_6;
  return v7;
}

- (BOOL)_isRTL
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController view](self, "view"));
  v3 = (char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v2, "semanticContentAttribute")) == (char *)&dword_0 + 1;

  return v3;
}

- (void)_analyticsSubmitInBookSearchEventWithSearchText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKSearchViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchDelegate](self, "searchDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingSessionDataForSearchViewController:", self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewController searchDelegate](self, "searchDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentDataForSearchViewController:", self));

  if (v9 && v5 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v8, "emitInBookSearchEventWithTracker:readingSessionData:contentData:", v9, v5, v7);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  CGPoint v25;
  CGRect v26;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
  objc_msgSend(v10, "bounds");
  objc_msgSend(v10, "convertRect:toView:", v9);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v7, "rect");
  v16 = v15;
  v18 = v17;

  objc_msgSend(v8, "location");
  v20 = v19;
  v22 = v21;

  v26.origin.x = v12;
  v26.origin.y = v16;
  v26.size.width = v14;
  v26.size.height = v18;
  v25.x = v20;
  v25.y = v22;
  if (CGRectContainsPoint(v26, v25))
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v12, v16, v14, v18));
  else
    v23 = 0;

  return v23;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v5, "bounds");
  v7 = v6 + -8.0;
  v9 = v8 + -4.0;
  v11 = v10 + 16.0;
  v13 = v12 + 8.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v16, v18, v20, v22));
  v24 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHighlightEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v25, v23));

  return v26;
}

- (BOOL)accessibilityRequiresActivateForSearchField
{
  return 0;
}

- (BOOL)showPhysicalPages
{
  return self->_showPhysicalPages;
}

- (BKSearchViewControllerDelegate)searchDelegate
{
  return (BKSearchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_searchDelegate);
}

- (void)setSearchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchDelegate, a3);
}

- (BKPaginationController)paginationController
{
  return self->_paginationController;
}

- (double)maxContentHeight
{
  return self->_maxContentHeight;
}

- (void)setMaxContentHeight:(double)a3
{
  self->_maxContentHeight = a3;
}

- (BEHairlineDividerView)headerDividerView
{
  return self->_headerDividerView;
}

- (void)setHeaderDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDividerView, a3);
}

- (BEHairlineDividerView)footerTopBorderView
{
  return self->_footerTopBorderView;
}

- (void)setFooterTopBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTopBorderView, a3);
}

- (void)setDummySearchResultsCell:(id)a3
{
  objc_storeStrong((id *)&self->_dummySearchResultsCell, a3);
}

- (void)setDummySearchLoadingCell:(id)a3
{
  objc_storeStrong((id *)&self->_dummySearchLoadingCell, a3);
}

- (BOOL)resizeAnimationInProgress
{
  return self->_resizeAnimationInProgress;
}

- (void)setResizeAnimationInProgress:(BOOL)a3
{
  self->_resizeAnimationInProgress = a3;
}

- (BOOL)resizeRequestPending
{
  return self->_resizeRequestPending;
}

- (void)setResizeRequestPending:(BOOL)a3
{
  self->_resizeRequestPending = a3;
}

- (NSLayoutConstraint)footerHeightConstraint
{
  return self->_footerHeightConstraint;
}

- (void)setFooterHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_footerHeightConstraint, a3);
}

- (NSLayoutConstraint)searchBarHeightConstraint
{
  return self->_searchBarHeightConstraint;
}

- (void)setSearchBarHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_footerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_dummySearchLoadingCell, 0);
  objc_storeStrong((id *)&self->_dummySearchResultsCell, 0);
  objc_storeStrong((id *)&self->_footerTopBorderView, 0);
  objc_storeStrong((id *)&self->_headerDividerView, 0);
  objc_storeStrong((id *)&self->_paginationController, 0);
  objc_destroyWeak((id *)&self->_searchDelegate);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_wikipediaButton, 0);
  objc_storeStrong((id *)&self->_googleButton, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_resultsTable, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
}

@end
