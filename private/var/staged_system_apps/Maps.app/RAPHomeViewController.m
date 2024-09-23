@implementation RAPHomeViewController

- (RAPHomeViewController)init
{
  RAPHomeViewController *v2;
  id v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  RAPHomeViewController *v16;

  v14.receiver = self;
  v14.super_class = (Class)RAPHomeViewController;
  v2 = -[RAPHomeViewController init](&v14, "init");
  if (v2)
  {
    v3 = sub_100B2EC28();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v16 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = (objc_class *)objc_opt_class(v2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[RAPHomeViewController setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v8, "setPresentedModally:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v9, "setTakesAvailableHeight:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "observers"));
    objc_msgSend(v11, "registerObserver:", v2);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, "_contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPHomeViewController;
  -[ContaineeViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RAPHomeView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RAPHomeViewController _setupViews](self, "_setupViews");
  v7 = -[RAPHomeViewController _createLayout](self, "_createLayout");
  -[RAPHomeViewController _updateConstraints](self, "_updateConstraints");
  -[RAPHomeViewController _updateChinaDisclaimerView](self, "_updateChinaDisclaimerView");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPHomeViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[RAPHomeViewController loadDataSource](self, "loadDataSource");
  -[RAPHomeViewController _updateEmptyStateLayoutIfNeeded](self, "_updateEmptyStateLayoutIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPHomeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[RAPHomeViewController _updateReportButtonIfNeeded](self, "_updateReportButtonIfNeeded");
}

- (void)_setupViews
{
  void *v3;
  uint64_t v4;
  ContainerHeaderView *v5;
  double y;
  double width;
  double height;
  ContainerHeaderView *v9;
  ContainerHeaderView *titleHeaderView;
  void *v11;
  void *v12;
  id v13;
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
  UICollectionView *v24;
  UICollectionView *collectionView;
  void *v26;
  RAPHomeFooterToolBarView *v27;
  RAPHomeFooterToolBarView *footerToolBarView;
  id v29;

  v29 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v4 = sub_1002A8AA0(self);
  v5 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[ContainerHeaderView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v9;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
  -[ContainerHeaderView setHeaderSize:](self->_titleHeaderView, "setHeaderSize:", v4 != 5);
  -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Reports] Reports"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](self->_titleHeaderView, "setTitle:", v12);

  objc_msgSend(v29, "addSubview:", self->_titleHeaderView);
  v13 = objc_alloc((Class)UICollectionView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeViewController view](self, "view"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeViewController _createLayout](self, "_createLayout"));
  v24 = (UICollectionView *)objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v23, v16, v18, v20, v22);
  collectionView = self->_collectionView;
  self->_collectionView = v24;

  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("RAPHomeCollectionView"));
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v26);

  -[UICollectionView _mapsui_resetLayoutMarginsWithPreservesSuperview:](self->_collectionView, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
  objc_msgSend(v3, "addSubview:", self->_collectionView);
  if (v4 != 5 && -[RAPHomeViewController _isRAPNewUI](self, "_isRAPNewUI"))
  {
    v27 = -[RAPHomeFooterToolBarView initWithFrame:]([RAPHomeFooterToolBarView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    footerToolBarView = self->_footerToolBarView;
    self->_footerToolBarView = v27;

    -[RAPHomeFooterToolBarView setDelegate:](self->_footerToolBarView, "setDelegate:", self);
    -[RAPHomeFooterToolBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerToolBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", self->_footerToolBarView);
  }

}

- (void)_updateChinaDisclaimerView
{
  void *v3;
  unsigned int v4;
  UserProfileSectionFooterView *chinaDisclaimerView;
  UserProfileSectionFooterViewModel *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  UserProfileSectionFooterView *v11;
  UserProfileSectionFooterView *v12;
  void *v13;
  UserProfileSectionFooterView *v14;
  UserProfileSectionFooterViewModel *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "isChinaUserOutsideOfChina");

  chinaDisclaimerView = self->_chinaDisclaimerView;
  if (v4)
  {
    if (!chinaDisclaimerView)
    {
      v6 = [UserProfileSectionFooterViewModel alloc];
      v7 = objc_alloc((Class)NSAttributedString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Reports - China] You can view the issues you reported in China when you are in China."), CFSTR("localized string not found"), 0));
      v10 = objc_msgSend(v7, "initWithString:", v9);
      v15 = -[UserProfileSectionFooterViewModel initWithContentString:](v6, "initWithContentString:", v10);

      v11 = objc_alloc_init(UserProfileSectionFooterView);
      v12 = self->_chinaDisclaimerView;
      self->_chinaDisclaimerView = v11;

      -[UserProfileSectionFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_chinaDisclaimerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UserProfileSectionFooterView configureWithViewModel:](self->_chinaDisclaimerView, "configureWithViewModel:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v13, "addSubview:", self->_chinaDisclaimerView);

      -[RAPHomeViewController _updateConstraints](self, "_updateConstraints");
    }
  }
  else if (chinaDisclaimerView)
  {
    -[UserProfileSectionFooterView removeFromSuperview](chinaDisclaimerView, "removeFromSuperview");
    v14 = self->_chinaDisclaimerView;
    self->_chinaDisclaimerView = 0;

    -[RAPHomeViewController _updateConstraints](self, "_updateConstraints");
  }
}

- (void)_updateConstraints
{
  NSArray *constraints;
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
  NSArray *v14;
  NSArray *v15;
  UserProfileSectionFooterView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  UserProfileSectionFooterView *chinaDisclaimerView;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
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
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[7];
  _QWORD v91[7];

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  constraints = self->_constraints;
  self->_constraints = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v76));
  v91[0] = v72;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v64));
  v91[1] = v61;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v57));
  v91[2] = v55;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v86 = v4;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v51));
  v91[3] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v6));
  v91[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v91[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
  v85 = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v91[6] = v13;
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 7));
  v15 = self->_constraints;
  self->_constraints = v14;

  if (sub_1002A8AA0(self) == 5 || !-[RAPHomeViewController _isRAPNewUI](self, "_isRAPNewUI"))
  {
    chinaDisclaimerView = self->_chinaDisclaimerView;
    if (!chinaDisclaimerView)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
      v18 = v85;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bottomAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -8.0));
      v87 = v27;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
      goto LABEL_10;
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView leadingAnchor](chinaDisclaimerView, "leadingAnchor"));
    v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
    v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v74, 16.0));
    v88[0] = v81;
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView trailingAnchor](self->_chinaDisclaimerView, "trailingAnchor"));
    v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trailingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v70, -16.0));
    v88[1] = v63;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView bottomAnchor](self->_chinaDisclaimerView, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeViewController view](self, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
    v88[2] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView topAnchor](self->_chinaDisclaimerView, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -8.0));
    v88[3] = v36;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 4));

    v27 = (void *)v81;
    v17 = v66;

    v18 = v85;
    v19 = (void *)v74;

    v28 = (void *)v70;
  }
  else
  {
    v16 = self->_chinaDisclaimerView;
    if (!v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView topAnchor](self->_footerToolBarView, "topAnchor"));
      v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -8.0));
      v89[0] = v82;
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView leadingAnchor](self->_footerToolBarView, "leadingAnchor"));
      v18 = v85;
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v78));
      v89[1] = v75;
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView trailingAnchor](self->_footerToolBarView, "trailingAnchor"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trailingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v67));
      v89[2] = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView bottomAnchor](self->_footerToolBarView, "bottomAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "safeAreaLayoutGuide"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
      v89[3] = v44;
      v45 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 4));

      v26 = (void *)v45;
      v27 = (void *)v82;

      v37 = v84;
      goto LABEL_8;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView leadingAnchor](v16, "leadingAnchor"));
    v18 = v85;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
    v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 16.0));
    v90[0] = v80;
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView trailingAnchor](self->_chinaDisclaimerView, "trailingAnchor"));
    v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v73, -16.0));
    v90[1] = v69;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView bottomAnchor](self->_chinaDisclaimerView, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView topAnchor](self->_footerToolBarView, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v62));
    v90[2] = v60;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView topAnchor](self->_chinaDisclaimerView, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v58, -8.0));
    v90[3] = v56;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView leadingAnchor](self->_footerToolBarView, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v52));
    v90[4] = v50;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView trailingAnchor](self->_footerToolBarView, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v46));
    v90[5] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView bottomAnchor](self->_footerToolBarView, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "safeAreaLayoutGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v90[6] = v24;
    v25 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 7));

    v26 = (void *)v25;
    v27 = (void *)v80;

    v28 = (void *)v73;
  }

  v37 = v77;
LABEL_8:

LABEL_10:
  v38 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](self->_constraints, "arrayByAddingObjectsFromArray:", v26));
  v39 = self->_constraints;
  self->_constraints = v38;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (id)_createLayout
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B2FBA4;
  v3[3] = &unk_1011AFFC0;
  v3[4] = self;
  return objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", v3);
}

- (void)_updateReportButtonIfNeeded
{
  CardButton *v3;
  void *v4;
  CardButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CardButton *reportButton;
  void *v15;
  void *v16;
  _QWORD v17[2];

  if (!self->_reportButton && sub_1002A8AA0(self) == 5)
  {
    if (-[RAPHomeViewController _isRAPNewUI](self, "_isRAPNewUI"))
    {
      v3 = [CardButton alloc];
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration edit](CardButtonConfiguration, "edit"));
      v5 = -[CardButton initWithConfiguration:](v3, "initWithConfiguration:", v4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource RAPHomeReportMenu](self->_reportsDataSource, "RAPHomeReportMenu"));
      -[CardButton setMenu:](v5, "setMenu:", v6);

      -[CardButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[ContainerHeaderView addSubview:](self->_titleHeaderView, "addSubview:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton trailingAnchor](v5, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView titleViewLayoutGuide](self->_titleHeaderView, "titleViewLayoutGuide"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v7));
      v17[0] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton centerYAnchor](v5, "centerYAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView titleViewLayoutGuide](self->_titleHeaderView, "titleViewLayoutGuide"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
      v17[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

      reportButton = self->_reportButton;
      self->_reportButton = v5;

    }
  }
}

- (void)_updateEmptyStateLayoutIfNeeded
{
  unsigned int v3;
  _TtC4Maps14EmptyStateView *emptyStateView;
  _TtC4Maps14EmptyStateView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC4Maps14EmptyStateView *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _TtC4Maps14EmptyStateView *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[3];

  v3 = -[RAPHomeDataSource isEmpty](self->_reportsDataSource, "isEmpty");
  emptyStateView = self->_emptyStateView;
  if (v3)
  {
    if (!emptyStateView)
    {
      v5 = -[EmptyStateView initWithFrame:]([_TtC4Maps14EmptyStateView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[EmptyStateView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("RAPReportHomeEmptyStateView"));
      -[EmptyStateView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v6, "addSubview:", v5);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView centerYAnchor](v5, "centerYAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView centerYAnchor](self->_collectionView, "centerYAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
      v43[0] = v40;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView leadingAnchor](v5, "leadingAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v7, 16.0));
      v43[1] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView trailingAnchor](v5, "trailingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -16.0));
      v43[2] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

      v14 = self->_emptyStateView;
      self->_emptyStateView = v5;

    }
    v15 = objc_alloc_init((Class)NSTextAttachment);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.pencil")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    objc_msgSend(v17, "pointSize");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithConfiguration:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageWithRenderingMode:", 2));
    objc_msgSend(v15, "setImage:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "image"));
    objc_msgSend(v21, "size");
    objc_msgSend(v15, "setBounds:", 0.0, -2.0, v22, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v15));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Reports] No Reports"), CFSTR("localized string not found"), 0));
    -[EmptyStateView setTitle:](self->_emptyStateView, "setTitle:", v26);

    v27 = sub_1002A8AA0(self);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    if (v27 == 5)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Reports][Mac] You can report a street issue, place issue, route issue by tapping \"%@ %@\"), CFSTR("localized string not found"), 0));

      v31 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v31, v24));
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Reports] You can report a street issue, place issue, route issue by tapping \"%@ %@\"), CFSTR("localized string not found"), 0));

      v31 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v30);
      v34 = objc_alloc((Class)NSAttributedString);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("[Reports] Report a New Issue"), CFSTR("localized string not found"), 0));
      v37 = objc_msgSend(v34, "initWithString:", v36);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v31, v24, v37));
    }

    -[EmptyStateView setAttributedSubtitle:](self->_emptyStateView, "setAttributedSubtitle:", v32);
  }
  else
  {
    -[EmptyStateView removeFromSuperview](emptyStateView, "removeFromSuperview");
    v33 = self->_emptyStateView;
    self->_emptyStateView = 0;

  }
}

- (double)estimatedItemHeight
{
  return _UICollectionViewListLayoutSectionAutomaticDimension;
}

- (id)menuForRAPHomeFooterToolBarView:(id)a3
{
  return -[RAPHomeDataSource RAPHomeReportMenu](self->_reportsDataSource, "RAPHomeReportMenu", a3);
}

- (void)tappedMenuForRAPHomeFooterToolBarView:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_maps_mapsSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rapPresenter"));
  v5 = objc_msgSend(v4, "presentOfflineAlertIfNecessaryWithCompletion:", 0);

  if (v5)
  {
    v6 = sub_100B2EC28();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "can't present RAP menu because Maps is offline", v8, 2u);
    }

  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 5013, 39, 0);
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", a3, a4);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 10109, -[RAPHomeDataSource analyticsTarget](self->_reportsDataSource, "analyticsTarget"), 0);
}

- (void)loadDataSource
{
  RAPHomeDataSource *v3;
  RAPHomeDataSource *reportsDataSource;

  v3 = -[RAPHomeDataSource initWithCollectionView:updateLocation:]([RAPHomeDataSource alloc], "initWithCollectionView:updateLocation:", self->_collectionView, 0);
  reportsDataSource = self->_reportsDataSource;
  self->_reportsDataSource = v3;

  -[DataSource setDelegate:](self->_reportsDataSource, "setDelegate:", self);
  -[RAPHomeDataSource setSupplementaryElementsDelegate:](self->_reportsDataSource, "setSupplementaryElementsDelegate:", self);
  -[RAPHomeDataSource setEntryPoint:](self->_reportsDataSource, "setEntryPoint:", -[RAPHomeViewController entryPoint](self, "entryPoint"));
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self->_reportsDataSource);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self->_reportsDataSource);
  -[DataSource setActive:](self->_reportsDataSource, "setActive:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPHomeViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[RAPHomeViewController _updateHeaderHairline](self, "_updateHeaderHairline");
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_reportsDataSource == a3)
  {
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    -[RAPHomeViewController _updateHeaderHairline](self, "_updateHeaderHairline");
    -[RAPHomeViewController _updateEmptyStateLayoutIfNeeded](self, "_updateEmptyStateLayoutIfNeeded");
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_opt_class(RAPRecord);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v6, "viewController:presentReportDetail:fromEntryPoint:", self, v10, 39);

    v7 = v10;
    if (objc_msgSend(v7, "reportStatus") == 2)
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 358, 39, 0);
    }
    else if (objc_msgSend(v7, "reportStatus") == 1)
    {
      v8 = objc_msgSend(v7, "reportType");
      if (v8 >= 0x16)
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v8));
      else
        v9 = *(&off_1011E3868 + (int)v8);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 357, 39, v9);

    }
  }

}

- (void)didTapOnPrivacyText
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.mapsrap")));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)didTapOnMoreButtonForSectionType:(unint64_t)a3 sectionTitle:(id)a4
{
  id v6;
  void *v7;
  AllRAPHistoryViewController *v8;

  v6 = a4;
  v8 = -[AllRAPHistoryViewController initWithReportSection:sectionTitle:]([AllRAPHistoryViewController alloc], "initWithReportSection:sectionTitle:", a3, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  -[ControlContaineeViewController setDelegate:](v8, "setDelegate:", v7);

  -[RAPHomeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (int)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int)a3
{
  self->_entryPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportsDataSource, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_reportButton, 0);
  objc_storeStrong((id *)&self->_footerToolBarView, 0);
  objc_storeStrong((id *)&self->_chinaDisclaimerView, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end
