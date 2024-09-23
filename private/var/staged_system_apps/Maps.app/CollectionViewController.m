@implementation CollectionViewController

- (CollectionViewController)initWithCollection:(id)a3
{
  id v5;
  CollectionViewController *v6;
  CollectionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CollectionViewController;
  v6 = -[CollectionViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    -[CollectionHandler touch](v7->_collection, "touch");
  }

  return v7;
}

- (id)keyCommands
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CollectionViewController;
  v3 = -[ContaineeViewController keyCommands](&v13, "keyCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController presentedViewController](self, "presentedViewController"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Collection] Add Places"), CFSTR("localized string not found"), 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v8, 0, "_addItemsFromACToCollection", CFSTR("a"), 0x100000, 0));
    objc_msgSend(v5, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource keyCommands](self->_collectionDataSource, "keyCommands"));
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  v11 = objc_msgSend(v5, "copy");

  return v11;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  CollectionDataSource *v9;
  id v10;
  CollectionDataSource *v11;
  objc_super v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource keyCommands](self->_collectionDataSource, "keyCommands"));
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = self->_collectionDataSource;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CollectionViewController;
    v10 = -[CollectionViewController targetForAction:withSender:](&v13, "targetForAction:withSender:", a3, v6);
    v9 = (CollectionDataSource *)objc_claimAutoreleasedReturnValue(v10);
  }
  v11 = v9;

  return v11;
}

- (id)preferredFocusEnvironments
{
  UITableView *tableView;

  tableView = self->_tableView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &tableView, 1));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CollectionView *v5;
  CollectionView *collectionHeaderView;
  ContainerHeaderView *v7;
  double y;
  double width;
  double height;
  ContainerHeaderView *v11;
  ContainerHeaderView *titleHeaderView;
  double v13;
  void *v14;
  UIView *v15;
  UIView *subHeaderView;
  double v17;
  void *v18;
  CollectionSubHeaderView *v19;
  CollectionSubHeaderView *subHeaderContentView;
  MapsThemeTableView *v21;
  UITableView *tableView;
  void *v23;
  void *v24;
  UIView *v25;
  UIView *emptyStateView;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  MKVibrantView *v30;
  MKVibrantView *addPlaceVibrantView;
  UIButton *v32;
  UIButton *addPlaceButton;
  void *v34;
  void *v35;
  UIButton *v36;
  void *v37;
  void *v38;
  UIButton *v39;
  void *v40;
  UIView *v41;
  UIView *hideableFooterView;
  void *v43;
  CollectionFooterToolBarView *v44;
  CollectionFooterToolBarView *footerContentView;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  NSLayoutConstraint *v51;
  NSLayoutConstraint *hideableFooterViewBottomConstraint;
  NSLayoutConstraint *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
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
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  unsigned __int8 v174;
  void *v175;
  objc_super v176;
  _QWORD v177[8];
  _QWORD v178[26];

  v176.receiver = self;
  v176.super_class = (Class)CollectionViewController;
  -[ContaineeViewController viewDidLoad](&v176, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CollectionView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("CollectionContent"));

  v5 = -[CollectionView initWithCollectionViewSize:]([CollectionView alloc], "initWithCollectionViewSize:", 1);
  collectionHeaderView = self->_collectionHeaderView;
  self->_collectionHeaderView = v5;

  -[CollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CollectionView setCollectionInfo:](self->_collectionHeaderView, "setCollectionInfo:", self->_collection);
  -[CollectionView setDelegate:](self->_collectionHeaderView, "setDelegate:", self);
  -[CollectionView setMaxContentSizeCategory:](self->_collectionHeaderView, "setMaxContentSizeCategory:", UIContentSizeCategoryAccessibilityMedium);
  -[CollectionView setAllowAccessibilityTextWrapping:](self->_collectionHeaderView, "setAllowAccessibilityTextWrapping:", 0);
  v7 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[ContainerHeaderView initWithFrame:](v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v11;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1148846080;
  -[ContainerHeaderView setContentCompressionResistancePriority:forAxis:](self->_titleHeaderView, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", 0.0);
  -[ContainerHeaderView setTitleView:](self->_titleHeaderView, "setTitleView:", self->_collectionHeaderView);
  -[ContainerHeaderView setTitleViewInsets:](self->_titleHeaderView, "setTitleViewInsets:", 4.0, 0.0, 0.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v14, "addSubview:", self->_titleHeaderView);

  v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  subHeaderView = self->_subHeaderView;
  self->_subHeaderView = v15;

  LODWORD(v17) = 1148829696;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_subHeaderView, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_subHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_subHeaderView, "setAccessibilityIdentifier:", CFSTR("CollectionSubHeader"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v18, "addSubview:", self->_subHeaderView);

  v19 = -[CollectionSubHeaderView initWithType:]([CollectionSubHeaderView alloc], "initWithType:", -[CollectionViewController _subHeaderTypeForCurrentState](self, "_subHeaderTypeForCurrentState"));
  subHeaderContentView = self->_subHeaderContentView;
  self->_subHeaderContentView = v19;

  -[CollectionSubHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_subHeaderContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CollectionSubHeaderView setDelegate:](self->_subHeaderContentView, "setDelegate:", self);
  -[CollectionSubHeaderView setSortType:](self->_subHeaderContentView, "setSortType:", -[CollectionHandler sortType](self->_collection, "sortType"));
  -[UIView addSubview:](self->_subHeaderView, "addSubview:", self->_subHeaderContentView);
  v21 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = &v21->super;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v23);

  -[UITableView setPreservesSuperviewLayoutMargins:](self->_tableView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("CollectionTable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v24, "insertSubview:atIndex:", self->_tableView, 0);

  -[UITableView setDropDelegate:](self->_tableView, "setDropDelegate:", self);
  v25 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  emptyStateView = self->_emptyStateView;
  self->_emptyStateView = v25;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_emptyStateView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_emptyStateView, "setAccessibilityIdentifier:", CFSTR("CollectionEmptyStateView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v27, "addSubview:", self->_emptyStateView);

  -[UIView setAlpha:](self->_emptyStateView, "setAlpha:", 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v29 = objc_msgSend(v28, "isUsingOfflineMaps");

  v174 = v29;
  if ((v29 & 1) == 0)
  {
    v30 = (MKVibrantView *)objc_msgSend(objc_alloc((Class)MKVibrantView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    addPlaceVibrantView = self->_addPlaceVibrantView;
    self->_addPlaceVibrantView = v30;

    -[MKVibrantView setTranslatesAutoresizingMaskIntoConstraints:](self->_addPlaceVibrantView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKVibrantView setAccessibilityIdentifier:](self->_addPlaceVibrantView, "setAccessibilityIdentifier:", CFSTR("CollectionAddPlaceView"));
    -[MKVibrantView setContinuousCornerRadius:](self->_addPlaceVibrantView, "setContinuousCornerRadius:", 8.0);
    -[UIView addSubview:](self->_emptyStateView, "addSubview:", self->_addPlaceVibrantView);
    v32 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    addPlaceButton = self->_addPlaceButton;
    self->_addPlaceButton = v32;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_addPlaceButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_addPlaceButton, "titleLabel"));
    objc_msgSend(v34, "setAdjustsFontSizeToFitWidth:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_addPlaceButton, "titleLabel"));
    objc_msgSend(v35, "setMinimumScaleFactor:", 0.6);

    -[UIButton _setTouchInsets:](self->_addPlaceButton, "_setTouchInsets:", -8.0, -10.0, -8.0, -10.0);
    v36 = self->_addPlaceButton;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("[Collection] Add a Place"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v36, "setTitle:forState:", v38, 0);

    v39 = self->_addPlaceButton;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.square.fill")));
    -[UIButton setImage:forState:](v39, "setImage:forState:", v40, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_addPlaceButton, "addTarget:action:forControlEvents:", self, "_addAPlaceAction:", 64);
    -[UIButton setAccessibilityIdentifier:](self->_addPlaceButton, "setAccessibilityIdentifier:", CFSTR("CollectionAddPlaceButton"));
    -[UIView addSubview:](self->_emptyStateView, "addSubview:", self->_addPlaceButton);
  }
  v41 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  hideableFooterView = self->_hideableFooterView;
  self->_hideableFooterView = v41;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_hideableFooterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_hideableFooterView, "setAccessibilityIdentifier:", CFSTR("CollectionFooter"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  objc_msgSend(v43, "addSubview:", self->_hideableFooterView);

  v44 = -[FooterToolBarView initWithFrame:]([CollectionFooterToolBarView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  footerContentView = self->_footerContentView;
  self->_footerContentView = v44;

  -[CollectionFooterToolBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (sub_1002A8AA0(self) == 5)
  {
    -[CollectionFooterToolBarView setUseMacConfig:](self->_footerContentView, "setUseMacConfig:", 1);
    if (-[CollectionHandler canEditImage](self->_collection, "canEditImage"))
      v46 = 0;
    else
      v46 = -[CollectionHandler canEditTitle](self->_collection, "canEditTitle") ^ 1;
    -[CollectionFooterToolBarView setHideEditButton:](self->_footerContentView, "setHideEditButton:", v46);
  }
  -[FooterToolBarView setDelegate:](self->_footerContentView, "setDelegate:", self);
  -[UIView addSubview:](self->_hideableFooterView, "addSubview:", self->_footerContentView);
  -[CollectionViewController _resetFooterState:](self, "_resetFooterState:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v50 = 0.0;
  v51 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, 0.0));
  hideableFooterViewBottomConstraint = self->_hideableFooterViewBottomConstraint;
  self->_hideableFooterViewBottomConstraint = v51;

  if (sub_1002A8AA0(self) == 5)
    v50 = 16.0;
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "topAnchor"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "constraintEqualToAnchor:", v168));
  v178[0] = v166;
  v162 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "leadingAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToAnchor:", v160));
  v178[1] = v158;
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "trailingAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "constraintEqualToAnchor:", v153));
  v178[2] = v151;
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "bottomAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:constant:", v145, 5.0));
  v178[3] = v143;
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_subHeaderView, "topAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "topAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v140));
  v178[4] = v139;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_subHeaderView, "leadingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "leadingAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:", v136));
  v178[5] = v135;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_subHeaderView, "trailingAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "trailingAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "constraintEqualToAnchor:", v132));
  v178[6] = v131;
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_subHeaderView, "topAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView topAnchor](self->_subHeaderContentView, "topAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:", v129));
  v178[7] = v128;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_subHeaderView, "bottomAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView bottomAnchor](self->_subHeaderContentView, "bottomAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v126));
  v178[8] = v125;
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_subHeaderView, "leadingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView leadingAnchor](self->_subHeaderContentView, "leadingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v123));
  v178[9] = v122;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_subHeaderView, "trailingAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView trailingAnchor](self->_subHeaderContentView, "trailingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v120));
  v178[10] = v119;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "topAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:", v116));
  v178[11] = v115;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "leadingAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v112, v50));
  v178[12] = v111;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "trailingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:", v108, -v50));
  v178[13] = v107;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "bottomAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v103));
  v178[14] = v102;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
  v178[15] = v98;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v95));
  v53 = self->_hideableFooterViewBottomConstraint;
  v178[16] = v94;
  v178[17] = v53;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_hideableFooterView, "topAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView topAnchor](self->_footerContentView, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v93));
  v178[18] = v92;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView bottomAnchor](self->_footerContentView, "bottomAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v90));
  v178[19] = v89;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView leadingAnchor](self->_footerContentView, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v178[20] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView trailingAnchor](self->_footerContentView, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
  v178[21] = v83;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_emptyStateView, "leadingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v178[22] = v79;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_emptyStateView, "trailingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v178[23] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_emptyStateView, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v55));
  v178[24] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_emptyStateView, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "safeAreaLayoutGuide"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bottomAnchor"));
  LODWORD(v61) = 1140457472;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:priority:", v60, 0.0, v61));
  v178[25] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v178, 26));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v63);

  if ((v174 & 1) == 0)
  {
    v175 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView centerXAnchor](self->_addPlaceVibrantView, "centerXAnchor"));
    v173 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_emptyStateView, "centerXAnchor"));
    v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "constraintEqualToAnchor:", v173));
    v177[0] = v171;
    v169 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView centerYAnchor](self->_addPlaceVibrantView, "centerYAnchor"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_emptyStateView, "centerYAnchor"));
    v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "constraintEqualToAnchor:", v167));
    v177[1] = v165;
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView leadingAnchor](self->_addPlaceVibrantView, "leadingAnchor"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_emptyStateView, "leadingAnchor"));
    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintGreaterThanOrEqualToAnchor:constant:", v161, 16.0));
    v177[2] = v159;
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView trailingAnchor](self->_addPlaceVibrantView, "trailingAnchor"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_emptyStateView, "trailingAnchor"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintLessThanOrEqualToAnchor:constant:", v154, -16.0));
    v177[3] = v152;
    v150 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_addPlaceButton, "leadingAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView leadingAnchor](self->_addPlaceVibrantView, "leadingAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:constant:", v148, 10.0));
    v177[4] = v146;
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_addPlaceButton, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView trailingAnchor](self->_addPlaceVibrantView, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:constant:", v64, -10.0));
    v177[5] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_addPlaceButton, "topAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView topAnchor](self->_addPlaceVibrantView, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 8.0));
    v177[6] = v68;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_addPlaceButton, "bottomAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView bottomAnchor](self->_addPlaceVibrantView, "bottomAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, -8.0));
    v177[7] = v71;
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v177, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v72);

  }
  self->_emptyState = 0;
  -[UIView setHidden:](self->_emptyStateView, "setHidden:", -[CollectionHandler handlerType](self->_collection, "handlerType") != 0);
  -[CollectionViewController _loadDataSource](self, "_loadDataSource");
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v73, "addObserver:selector:name:object:", self, "contentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  -[CollectionViewController _updateFonts](self, "_updateFonts");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2067, 0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CollectionViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  self->_hasScrolled = 0;
  -[ContainerHeaderView sizeToFit](self->_titleHeaderView, "sizeToFit");
  -[CollectionDataSource setActive:](self->_collectionDataSource, "setActive:", 1);
  -[CollectionHandler addObserver:](self->_collection, "addObserver:", self);
  -[CollectionViewController _updateState](self, "_updateState");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CollectionViewController;
  -[ContaineeViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[ContainerHeaderView sizeToFit](self->_titleHeaderView, "sizeToFit");
  -[CollectionDataSource setActive:](self->_collectionDataSource, "setActive:", 0);
  -[CollectionHandler removeObserver:](self->_collection, "removeObserver:", self);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CollectionViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[CollectionViewController _updateFooterBottomConstraint](self, "_updateFooterBottomConstraint");
  -[CollectionViewController _updateTableInsets](self, "_updateTableInsets");
}

- (void)didChangeLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CollectionViewController;
  -[ContaineeViewController didChangeLayout:](&v4, "didChangeLayout:", a3);
  -[CollectionViewController _updateTableInsets](self, "_updateTableInsets");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  UIButton *addPlaceButton;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, UIContentSizeCategoryAccessibilityExtraLarge));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system15MediumCompatibleWithTraitCollection:](UIFont, "system15MediumCompatibleWithTraitCollection:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_addPlaceButton, "titleLabel"));
  objc_msgSend(v5, "setFont:", v8);

  addPlaceButton = self->_addPlaceButton;
  objc_msgSend(v8, "pointSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5));
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](addPlaceButton, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);

}

- (void)contentSizeChanged:(id)a3
{
  id v4;

  -[CollectionViewController _updateFonts](self, "_updateFonts", a3);
  -[CollectionView invalidateIntrinsicContentSize](self->_collectionHeaderView, "invalidateIntrinsicContentSize");
  -[CollectionSubHeaderView invalidateIntrinsicContentSize](self->_subHeaderContentView, "invalidateIntrinsicContentSize");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CollectionViewController;
  -[MapsThemeViewController updateTheme](&v5, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
  -[UIButton setTintColor:](self->_addPlaceButton, "setTintColor:", v4);

}

- (id)loadingModeView
{
  LoadingModeView *loadingModeView;
  LoadingModeView *v4;
  void *v5;
  void *v6;
  LoadingModeView *v7;
  LoadingModeView *v8;

  loadingModeView = self->_loadingModeView;
  if (!loadingModeView)
  {
    v4 = [LoadingModeView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Loading ..."), CFSTR("localized string not found"), 0));
    v7 = -[LoadingModeView initWithTitle:](v4, "initWithTitle:", v6);
    v8 = self->_loadingModeView;
    self->_loadingModeView = v7;

    -[LoadingModeView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingModeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    loadingModeView = self->_loadingModeView;
  }
  return loadingModeView;
}

- (void)showLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
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
  LoadingModeView *loadingModeView;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView superview](self->_loadingModeView, "superview"));
  v6 = v5 == 0;

  if (((v6 ^ v3) & 1) == 0)
  {
    if (v3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController loadingModeView](self, "loadingModeView"));
      objc_msgSend(v7, "addSubview:", v8);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView topAnchor](self->_loadingModeView, "topAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
      v24[0] = v21;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView bottomAnchor](self->_loadingModeView, "bottomAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
      v24[1] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView leadingAnchor](self->_loadingModeView, "leadingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      v24[2] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView trailingAnchor](self->_loadingModeView, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      v24[3] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController loadingModeView](self, "loadingModeView"));
      objc_msgSend(v19, "removeFromSuperview");

      loadingModeView = self->_loadingModeView;
      self->_loadingModeView = 0;

    }
  }
}

- (void)_updateTableInsets
{
  double headerMaxY;
  CGFloat MaxY;
  double Height;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  headerMaxY = self->_headerMaxY;
  -[UIView frame](self->_subHeaderView, "frame");
  if (headerMaxY <= CGRectGetMaxY(v12))
  {
    -[UIView frame](self->_subHeaderView, "frame");
    MaxY = CGRectGetMaxY(v13);
  }
  else
  {
    MaxY = self->_headerMaxY;
  }
  self->_headerMaxY = MaxY;
  if (!self->_hasScrolled)
  {
    -[UITableView setContentOffset:](self->_tableView, "setContentOffset:", 0.0, -MaxY);
    MaxY = self->_headerMaxY;
  }
  -[UIView frame](self->_hideableFooterView, "frame");
  Height = CGRectGetHeight(v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "bottomSafeOffset");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", MaxY, 0.0, Height - v7, 0.0);

  v8 = self->_headerMaxY;
  -[UIView frame](self->_hideableFooterView, "frame");
  v9 = CGRectGetHeight(v15);
  v11 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v11, "bottomSafeOffset");
  -[UITableView setVerticalScrollIndicatorInsets:](self->_tableView, "setVerticalScrollIndicatorInsets:", v8, 0.0, v9 - v10, 0.0);

}

- (void)_updateFooterBottomConstraint
{
  void *v3;
  double Height;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  CGRect v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v12);

  -[ContaineeViewController heightForLayout:](self, "heightForLayout:", 2);
  v6 = v5;
  -[ContaineeViewController heightForLayout:](self, "heightForLayout:", 3);
  v8 = 0.0;
  if (Height > v6)
  {
    v8 = 1.0;
    if (Height < v7 && v7 > v6)
      v8 = (Height - v6) / (v7 - v6);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  objc_msgSend(v10, "layoutIfNeeded");

  -[UIView frame](self->_hideableFooterView, "frame");
  -[NSLayoutConstraint setConstant:](self->_hideableFooterViewBottomConstraint, "setConstant:", (1.0 - v8) * v11);
}

- (void)_resetFooterState:(unint64_t)a3
{
  -[FooterToolBarView setCanDeleteOnly:](self->_footerContentView, "setCanDeleteOnly:", -[CollectionHandler handlerType](self->_collection, "handlerType") != 0);
  -[FooterToolBarView setCanBeSaved:](self->_footerContentView, "setCanBeSaved:", (id)-[CollectionHandler handlerType](self->_collection, "handlerType") == (id)3);
  -[FooterToolBarView setCanMove:](self->_footerContentView, "setCanMove:", (id)-[CollectionHandler contentType](self->_collection, "contentType") == (id)1);
  -[FooterToolBarView setState:](self->_footerContentView, "setState:", 0);
  -[FooterToolBarView setState:](self->_footerContentView, "setState:", a3);
}

- (void)_loadDataSource
{
  CollectionDataSource *v3;
  CollectionDataSource *collectionDataSource;
  void *v5;
  void *v6;

  v3 = -[CollectionDataSource initWithTableView:collection:]([CollectionDataSource alloc], "initWithTableView:collection:", self->_tableView, self->_collection);
  collectionDataSource = self->_collectionDataSource;
  self->_collectionDataSource = v3;

  -[DataSource setDelegate:](self->_collectionDataSource, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
  -[CollectionDataSource setShareDelegate:](self->_collectionDataSource, "setShareDelegate:", v6);

  -[CollectionDataSource setDeleteDelegate:](self->_collectionDataSource, "setDeleteDelegate:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self->_collectionDataSource);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self->_collectionDataSource);
}

- (BOOL)_isCollectionEmpty
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self->_collection, "content"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (unint64_t)_subHeaderTypeForCurrentState
{
  if ((id)-[CollectionHandler handlerType](self->_collection, "handlerType") == (id)3)
    return 2;
  else
    return -[CollectionViewController _isCollectionEmpty](self, "_isCollectionEmpty") ^ 1;
}

- (void)_updateState
{
  _BOOL4 v3;
  _BOOL4 v4;
  double v5;
  double v6;

  v3 = -[CollectionViewController _isCollectionEmpty](self, "_isCollectionEmpty");
  if (self->_emptyState != v3)
  {
    v4 = v3;
    self->_emptyState = v3;
    -[CollectionSubHeaderView setType:](self->_subHeaderContentView, "setType:", -[CollectionViewController _subHeaderTypeForCurrentState](self, "_subHeaderTypeForCurrentState"));
    if (v4)
      v5 = 0.0;
    else
      v5 = 1.0;
    -[UITableView setAlpha:](self->_tableView, "setAlpha:", v5);
    -[UIView setAlpha:](self->_hideableFooterView, "setAlpha:", v5);
    if ((id)-[CollectionHandler contentType](self->_collection, "contentType") == (id)1)
    {
      if (v4)
        v6 = 1.0;
      else
        v6 = 0.0;
      -[UIView setAlpha:](self->_emptyStateView, "setAlpha:", v6);
    }
    if (self->_emptyState && (id)-[CollectionHandler handlerType](self->_collection, "handlerType") == (id)3)
    {
      -[UIView setAlpha:](self->_emptyStateView, "setAlpha:", 0.0);
      -[CollectionViewController showLoading:](self, "showLoading:", 1);
    }
    else
    {
      -[CollectionViewController showLoading:](self, "showLoading:", 0);
    }
  }
}

- (void)_addAPlaceAction:(id)a3
{
  -[CollectionViewController view:requestsCollectionFooterAction:](self, "view:requestsCollectionFooterAction:", a3, 9);
}

- (id)_searchResults
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  SearchResult *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((id)-[CollectionHandler contentType](self->_collection, "contentType") == (id)1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self->_collection, "content", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8));
          objc_msgSend(v3, "addObject:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  v10 = objc_msgSend(v3, "copy");

  return v10;
}

- (void)addContentToMapView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CollectionViewController _searchResults](self, "_searchResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchPinsManager"));
  objc_msgSend(v5, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:completion:", v3, 1, 0, 1, 0);

}

- (void)removeContentFromMapView
{
  void *v3;
  id v4;

  if (-[CollectionViewController shouldClearSearchPins](self, "shouldClearSearchPins"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchPinsManager"));
    objc_msgSend(v3, "clearSearchPins");

  }
}

- (BOOL)shouldClearSearchPins
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allSearchResults"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController _searchResults](self, "_searchResults"));
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "count");
    if (v7 == objc_msgSend(v6, "count"))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 1;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100B49428;
      v10[3] = &unk_1011BE900;
      v11 = v6;
      v12 = &v13;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
      v8 = *((_BYTE *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  self->_hasScrolled = 1;
  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "contentInset");
  v8 = v7;

  v9 = v6 + v8;
  -[CollectionView setShrinkFactor:](self->_collectionHeaderView, "setShrinkFactor:", fmin(fmax(v9 / 35.0, 0.0), 1.0));
  -[CollectionSubHeaderView setShrinkFactor:](self->_subHeaderContentView, "setShrinkFactor:", fmin(fmax((v9 + -20.0) / 35.0, 0.0), 1.0));
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  void *v4;
  void (**v5)(id, CollectionViewController *);

  -[CollectionViewController _updateState](self, "_updateState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController updateContentInjection](self, "updateContentInjection"));

  if (v4)
  {
    v5 = (void (**)(id, CollectionViewController *))objc_claimAutoreleasedReturnValue(-[CollectionViewController updateContentInjection](self, "updateContentInjection"));
    v5[2](v5, self);

  }
}

- (void)_transformURLCollectionInMSPCollection
{
  _BOOL8 v3;
  CollectionHandler *v4;
  CollectionHandler *collection;
  id v6;
  void *v7;
  CollectionHandler *v8;

  v8 = self->_collection;
  v3 = -[DataSource active](self->_collectionDataSource, "active");
  -[CollectionHandler removeObserver:](self->_collection, "removeObserver:", self);
  v4 = (CollectionHandler *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collectionWithCollectionHandler:](CollectionHandler, "collectionWithCollectionHandler:", self->_collection));
  collection = self->_collection;
  self->_collection = v4;

  if (v3)
    -[CollectionHandler addObserver:](self->_collection, "addObserver:", self);
  v6 = -[CollectionHandler sortType](v8, "sortType");
  -[CollectionHandler setSortType:](self->_collection, "setSortType:", v6);
  -[CollectionSubHeaderView setSortType:](self->_subHeaderContentView, "setSortType:", v6);
  -[CollectionSubHeaderView setType:](self->_subHeaderContentView, "setType:", 1);
  -[CollectionViewController _resetFooterState:](self, "_resetFooterState:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  objc_msgSend(v7, "layoutIfNeeded");

  self->_hasScrolled = 0;
  self->_headerMaxY = 0.0;
  -[CollectionViewController _updateTableInsets](self, "_updateTableInsets");
  -[CollectionViewController _loadDataSource](self, "_loadDataSource");
  -[CollectionDataSource setActive:](self->_collectionDataSource, "setActive:", v3);
  -[UITableView reloadData](self->_tableView, "reloadData");

}

- (void)collectionEditSessionUpdated:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectedObjectSet"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
    v6 = 2;
  else
    v6 = 3;
  -[FooterToolBarView setState:](self->_footerContentView, "setState:", v6);
}

- (void)collectionViewTextFieldDidBecomeSelected:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  if (objc_msgSend(v4, "containeeLayout") == (id)1)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v6 = objc_msgSend(v5, "containeeLayout");

    if (v6 != (id)2)
      return;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "wantsLayout:", 3);

}

- (void)collectionViewTextFieldDidResign:(id)a3
{
  -[CollectionViewController view:requestsCollectionFooterAction:](self, "view:requestsCollectionFooterAction:", a3, 1);
}

- (void)requestsCollectionHeaderSaveActionForView:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CollectionHandler *collection;
  CollectionHandler *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  CollectionHandler *v12;

  v4 = a3;
  v5 = sub_1004315EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    collection = self->_collection;
    *(_DWORD *)buf = 138412290;
    v12 = collection;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Saving URL collection: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8 = self->_collection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B49984;
  v9[3] = &unk_1011E0558;
  objc_copyWeak(&v10, (id *)buf);
  -[CollectionHandler createCollection:](v8, "createCollection:", v9);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2071, 256, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)requestsCollectionHeaderSortActionForView:(id)a3 forSortType:(int64_t)a4
{
  uint64_t v4;

  if ((unint64_t)a4 >= 3)
    v4 = 0;
  else
    v4 = (2077 - a4);
  -[CollectionViewController _updateSorting:](self, "_updateSorting:");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v4, 252, 0);
}

- (void)view:(id)a3 requestsCollectionFooterAction:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  CollectionHandler *collection;
  CollectionFooterToolBarView *footerContentView;
  id v23;
  void *v24;
  void *v25;
  CollectionPicker *v26;
  CollectionPicker *v27;
  CollectionPicker *collectionPicker;
  CollectionPicker *v29;
  CollectionFooterToolBarView *v30;
  void *v31;
  CollectionHandler *v32;
  CollectionFooterToolBarView *v33;
  _QWORD *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  CollectionHandler *v62;
  _QWORD v63[4];
  _QWORD *v64;
  _QWORD v65[4];
  id v66;
  CollectionHandler *v67;
  CollectionFooterToolBarView *v68;
  id v69;
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[5];
  _QWORD v81[5];
  _BYTE location[12];
  __int16 v83;
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];

  v6 = a3;
  v7 = sub_1002A8AA0(self);
  switch(a4)
  {
    case 0uLL:
      v8 = v7 == 5;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_100B4A4B4;
      v81[3] = &unk_1011AC860;
      v81[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v81, 0.25);
      if (!v8)
        -[CollectionDataSource setEditing:](self->_collectionDataSource, "setEditing:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource editSession](self->_collectionDataSource, "editSession"));
      objc_msgSend(v9, "setDelegate:", self);

      -[FooterToolBarView setState:](self->_footerContentView, "setState:", 3);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2120, 252, 0);
      break;
    case 1uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
      objc_msgSend(v10, "endEditing:", 1);

      -[CollectionDataSource setEditing:](self->_collectionDataSource, "setEditing:", 0);
      if (-[CollectionHandler canEditImage](self->_collection, "canEditImage")
        || -[CollectionHandler canEditTitle](self->_collection, "canEditTitle"))
      {
        -[CollectionHandler updateCollection:](self->_collection, "updateCollection:", &stru_1011E3D78);
      }
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_100B4A5DC;
      v80[3] = &unk_1011AC860;
      v80[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v80, 0.25);
      -[FooterToolBarView setState:](self->_footerContentView, "setState:", 1);
      break;
    case 2uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource editSession](self->_collectionDataSource, "editSession"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectedObjectSet"));
      v13 = objc_msgSend(v12, "count");

      if (!v13)
      {
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self->_collection, "content"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v73 != v16)
                objc_enumerationMutation(v14);
              objc_msgSend(v11, "addSelectedObject:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i));
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
          }
          while (v15);
        }

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionEditSession collectionSessionWithSession:](CollectionDeleteSession, "collectionSessionWithSession:", v11));
      objc_msgSend(v11, "clearSelectedobjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectedObjectSet"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));

      collection = self->_collection;
      footerContentView = self->_footerContentView;
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100B4A6E8;
      v70[3] = &unk_1011AE8F8;
      v71 = v18;
      v23 = v18;
      -[CollectionViewController _presentDeletionConfirmationFor:inCollection:sourceView:completion:](self, "_presentDeletionConfirmationFor:inCollection:sourceView:completion:", v20, collection, footerContentView, v70);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 48, 252, 0);

      break;
    case 6uLL:
      -[CollectionDataSource selectAll](self->_collectionDataSource, "selectAll");
      break;
    case 7uLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource editSession](self->_collectionDataSource, "editSession"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionEditSession collectionSessionWithSession:](CollectionSaveSession, "collectionSessionWithSession:", v24));
      v26 = [CollectionPicker alloc];
      objc_msgSend(v6, "bounds");
      v27 = -[CollectionPicker initWithCollectionEditSession:sourceView:sourceRect:](v26, "initWithCollectionEditSession:sourceView:sourceRect:", v25, v6);
      collectionPicker = self->_collectionPicker;
      self->_collectionPicker = v27;

      -[CollectionPicker setDelegate:](self->_collectionPicker, "setDelegate:", self);
      objc_initWeak((id *)location, self);
      v29 = self->_collectionPicker;
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_100B4A624;
      v78[3] = &unk_1011BC2E8;
      objc_copyWeak(&v79, (id *)location);
      v78[4] = self;
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100B4A690;
      v76[3] = &unk_1011BC310;
      objc_copyWeak(&v77, (id *)location);
      -[CollectionPicker viewControllerToPresentIfContainee:ifAlertController:](v29, "viewControllerToPresentIfContainee:ifAlertController:", v78, v76);
      objc_destroyWeak(&v77);
      objc_destroyWeak(&v79);
      objc_destroyWeak((id *)location);

      break;
    case 9uLL:
      -[CollectionViewController _addItemsFromACToCollection](self, "_addItemsFromACToCollection");
      break;
    case 0xAuLL:
      if (-[CollectionHandler canShare](self->_collection, "canShare"))
      {
        v30 = self->_footerContentView;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler sharingURL](self->_collection, "sharingURL"));
        v32 = self->_collection;
        objc_initWeak((id *)location, self);
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_100B4A818;
        v65[3] = &unk_1011B2288;
        v61 = v31;
        v66 = v61;
        v62 = v32;
        v67 = v62;
        v33 = v30;
        v68 = v33;
        objc_copyWeak(&v69, (id *)location);
        v34 = objc_retainBlock(v65);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        if ((objc_msgSend(v35, "BOOLForKey:", CFSTR("__internal_CollectionSharingWarning")) & 1) != 0)
        {
          ((void (*)(_QWORD *))v34[2])(v34);
        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("[Guide] Alert's text confirmation"), CFSTR("localized string not found"), 0));

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("[Guide] Alert's Share Guide button title"), CFSTR("localized string not found"), 0));

          v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v60, 0));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "popoverPresentationController"));
          objc_msgSend(v45, "setSourceView:", v33);

          -[CollectionFooterToolBarView bounds](v33, "bounds");
          v47 = v46;
          v49 = v48;
          v51 = v50;
          v53 = v52;
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "popoverPresentationController"));
          objc_msgSend(v54, "setSourceRect:", v47, v49, v51, v53);

          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_100B4A930;
          v63[3] = &unk_1011AD960;
          v64 = v34;
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v59, 0, v63));
          objc_msgSend(v44, "addAction:", v55);

          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("[Collection] Alert's cancel button title"), CFSTR("localized string not found"), 0));
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v57, 1, &stru_1011E3D98));
          objc_msgSend(v44, "addAction:", v58);

          -[CollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v44, 1, 0);
          objc_msgSend(v35, "setBool:forKey:", 1, CFSTR("__internal_CollectionSharingWarning"));

        }
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2082, 252, 0, v59);

        objc_destroyWeak(&v69);
        objc_destroyWeak((id *)location);

      }
      else
      {
        v36 = sub_1004318FC();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting to share an empty collection. Share action should be disabled or hidden on the UI")));
          *(_DWORD *)location = 136315906;
          *(_QWORD *)&location[4] = "-[CollectionViewController view:requestsCollectionFooterAction:]";
          v83 = 2080;
          v84 = "CollectionViewController.m";
          v85 = 1024;
          v86 = 720;
          v87 = 2112;
          v88 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", location, 0x26u);

        }
        if (sub_100A70734())
        {
          v39 = sub_1004318FC();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)location = 138412290;
            *(_QWORD *)&location[4] = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

          }
        }
      }
      break;
    default:
      break;
  }

}

- (void)_addItemsFromACToCollection
{
  void *v3;
  CollectionSaveSession *v4;

  v4 = -[CollectionEditSession initWithCollection:]([CollectionSaveSession alloc], "initWithCollection:", self->_collection);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v3, "viewController:addItemsFromACToCollection:", self, v4);

}

- (void)_updateSorting:(int64_t)a3
{
  -[CollectionHandler setSortType:](self->_collection, "setSortType:");
  -[CollectionSubHeaderView setSortType:](self->_subHeaderContentView, "setSortType:", a3);
}

- (BOOL)collectionSubHeaderViewShouldShowSortByDistance
{
  void *v2;
  unsigned __int8 v3;

  if ((id)-[CollectionHandler contentType](self->_collection, "contentType") != (id)1)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v3 = objc_msgSend(v2, "isAuthorizedForPreciseLocation");

  return v3;
}

- (void)collectionPickerClosed:(id)a3
{
  CollectionPicker *collectionPicker;
  id v5;

  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  -[CollectionViewController view:requestsCollectionFooterAction:](self, "view:requestsCollectionFooterAction:", v5, 1);

}

- (void)collectionPickerNewCollection:(id)a3
{
  CollectionPicker *collectionPicker;
  id v5;
  void *v6;
  void *v7;
  id v8;

  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;
  v5 = a3;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editSession"));

  objc_msgSend(v6, "viewController:createNewCollectionWithSession:", self, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  -[CollectionViewController view:requestsCollectionFooterAction:](self, "view:requestsCollectionFooterAction:", v8, 1);

}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  CollectionHandler *v7;
  void *v8;
  uint64_t v9;
  id v10;
  CollectionHandler *v11;
  id v12;
  _QWORD v13[5];
  CollectionHandler *v14;
  id v15;

  v6 = a3;
  v7 = self->_collection;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "session"));
  v9 = objc_opt_class(MKMapItem);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100B4AC3C;
  v13[3] = &unk_1011E3DC0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  v12 = objc_msgSend(v8, "loadObjectsOfClass:completion:", v9, v13);

}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v4;
  unsigned __int8 v5;

  v4 = a4;
  v5 = objc_msgSend(v4, "canLoadObjectsOfClass:", objc_opt_class(MKMapItem));

  return v5;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  return objc_msgSend(objc_alloc((Class)UITableViewDropProposal), "initWithDropOperation:intent:", 2, 2);
}

- (void)dataSourceUpdated:(id)a3
{
  -[UITableView reloadData](self->_tableView, "reloadData", a3);
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  uint64_t v5;
  SearchResult *v6;
  void *v7;
  id lastItemTapped;
  id v9;

  v9 = a4;
  v5 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
  {
    v6 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v7, "viewController:focusSearchResult:", self, v6);

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = 0;

LABEL_5:
    goto LABEL_6;
  }
  if (!self->_lastItemTapped)
  {
    v6 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    -[SearchResult viewControllerRemoveSearchResultFocus:](v6, "viewControllerRemoveSearchResultFocus:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  id v6;
  SearchResult *v7;
  void *v8;
  void *v9;
  id lastItemTapped;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v5 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v16, v5) & 1) != 0)
  {
    v6 = v16;
    v7 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapSelectionManager"));
    objc_msgSend(v9, "selectSearchResult:animated:", v7, 1);

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = v6;
    v11 = v6;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "muid")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
    objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 478, 254, v15);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v16, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
  {
    v7 = -[IncompleteTransitLineItem initWithTransitLine:]([IncompleteTransitLineItem alloc], "initWithTransitLine:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v12, "viewController:selectTransitLineItem:zoomToMapRegion:", self, v7, 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dataSource:(id)a3 searchResultNeedsEditing:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B4B384;
  v16[3] = &unk_1011BF100;
  v16[4] = self;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mapItem"));
  v18 = v7;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100B4B4DC;
  v14 = &unk_1011ADA00;
  v15 = v18;
  v8 = v18;
  v9 = v17;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController _maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:](UIViewController, "_maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:", v9, v16, &v11));
  -[CollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0, v11, v12, v13, v14);

}

- (int)listForDataSource:(id)a3
{
  return 7;
}

- (void)deleteItem:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if (a3)
  {
    v12 = a3;
    v8 = a5;
    v9 = a4;
    v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[CollectionViewController _presentDeletionConfirmationFor:inCollection:sourceView:completion:](self, "_presentDeletionConfirmationFor:inCollection:sourceView:completion:", v11, self->_collection, v9, v8, v12);

  }
}

- (void)_presentDeletionConfirmationFor:(id)a3 inCollection:(id)a4 sourceView:(id)a5 completion:(id)a6
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
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CollectionViewController *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "count");
  if (v12 && v11 && v14)
  {
    if (objc_msgSend(v11, "handlerType") == (id)2)
    {
      v39 = self;
      if (objc_msgSend(v10, "count") == (id)1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[Guide] Alert's Title when deleting a place"), CFSTR("localized string not found"), 0));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
        v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18));

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Guide] Alert's Title when deleting multiple place"), CFSTR("localized string not found"), 0));
      }
      v38 = (void *)v19;

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v19, 0, 0));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "popoverPresentationController"));
      objc_msgSend(v21, "setSourceView:", v12);

      objc_msgSend(v12, "bounds");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "popoverPresentationController"));
      objc_msgSend(v30, "setSourceRect:", v23, v25, v27, v29);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("[Collection] Alert's Delete button title"), CFSTR("localized string not found"), 0));
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100B4B96C;
      v42[3] = &unk_1011AD960;
      v33 = v13;
      v43 = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v32, 2, v42));
      objc_msgSend(v20, "addAction:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("[Collection] Alert's cancel button title"), CFSTR("localized string not found"), 0));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100B4B97C;
      v40[3] = &unk_1011AD960;
      v41 = v33;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v36, 1, v40));
      objc_msgSend(v20, "addAction:", v37);

      -[CollectionViewController presentViewController:animated:completion:](v39, "presentViewController:animated:completion:", v20, 1, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

- (void)handleDismissAction:(id)a3
{
  CollectionView *collectionHeaderView;
  id v5;
  objc_super v6;

  collectionHeaderView = self->_collectionHeaderView;
  v5 = a3;
  -[CollectionView setEditing:](collectionHeaderView, "setEditing:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CollectionViewController;
  -[ContaineeViewController handleDismissAction:](&v6, "handleDismissAction:", v5);

}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CollectionViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v5, "willChangeContainerStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController view](self, "view"));
  objc_msgSend(v4, "endEditing:", 1);

}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateContentInjection, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_hideableFooterViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_addPlaceButton, 0);
  objc_storeStrong((id *)&self->_addPlaceVibrantView, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
  objc_storeStrong((id *)&self->_hideableFooterView, 0);
  objc_storeStrong((id *)&self->_subHeaderView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionPicker, 0);
  objc_storeStrong((id *)&self->_subHeaderContentView, 0);
  objc_storeStrong((id *)&self->_footerContentView, 0);
  objc_storeStrong((id *)&self->_collectionHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
