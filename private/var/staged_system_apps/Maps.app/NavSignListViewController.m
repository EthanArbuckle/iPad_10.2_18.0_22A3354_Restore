@implementation NavSignListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavSignListViewController)initWithSignDelegate:(id)a3
{
  id v4;
  NavSignListViewController *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  RouteStepListMetrics *metrics;
  objc_super v14;
  uint8_t buf[4];
  NavSignListViewController *v16;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavSignListViewController;
  v5 = -[NavSignListViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = sub_100328C04();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v8 = (objc_class *)objc_opt_class(v5);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[NavSignListViewController setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v10);

    objc_storeWeak((id *)&v5->_signDelegate, v4);
    v11 = objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics navSignMetrics](RouteStepListMetrics, "navSignMetrics"));
    metrics = v5->_metrics;
    v5->_metrics = (RouteStepListMetrics *)v11;

    v5->_selectedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  NavSignListViewController *v7;

  v3 = sub_100328C04();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController dealloc](&v5, "dealloc");
}

- (void)loadView
{
  PassThroughView *v3;

  v3 = objc_opt_new(PassThroughView);
  -[NavSignListViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  MUBlurView *v4;
  MUBlurView *backgroundView;
  void *v6;
  MUBlurView *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *graphContainerView;
  UIView *v14;
  id v15;
  void *v16;
  MUBlurView *v17;
  MUBlurView *graphBackgroundView;
  id v19;
  void *v20;
  UIView *v21;
  UIView *containerView;
  void *v23;
  UIView *v24;
  id v25;
  void *v26;
  UICollectionViewFlowLayout *v27;
  UICollectionView *v28;
  UICollectionView *collectionView;
  objc_class *v30;
  UICollectionView *v31;
  NSString *v32;
  void *v33;
  UICollectionView *v34;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  MUGradientView *v40;
  MUGradientView *gradientView;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  NavSignFooterView *v51;
  NavSignFooterView *footerView;
  NavSignFooterView *v53;
  id v54;
  NavSignFooterView *v55;
  id v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSLayoutConstraint *v64;
  NSLayoutConstraint *collectionViewTopConstraint;
  void *v66;
  void *v67;
  UIView *v68;
  void *v69;
  void *v70;
  void *v71;
  NSLayoutConstraint *v72;
  NSLayoutConstraint *vioHintLabelTopConstraint;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  NSLayoutConstraint *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSLayoutConstraint *v87;
  NSLayoutConstraint *graphTopConstraint;
  void *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *containerViewHeightConstraint;
  double v92;
  void *v93;
  void *v94;
  NSLayoutConstraint *v95;
  NSLayoutConstraint *gradientViewTopConstraint;
  void *v97;
  void *v98;
  double v99;
  NSLayoutConstraint *v100;
  NSLayoutConstraint *gradientViewBottomConstraint;
  void *v102;
  NSLayoutConstraint *v103;
  NSLayoutConstraint *footerHeightConstraint;
  NSLayoutConstraint *v105;
  NSLayoutConstraint *v106;
  NSLayoutConstraint *v107;
  NSLayoutConstraint *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSLayoutConstraint *v116;
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
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  UICollectionViewFlowLayout *v186;
  void *v187;
  void *v188;
  MUBlurView *v189;
  objc_super v190;
  _QWORD v191[28];
  _QWORD v192[4];
  _QWORD v193[3];

  v190.receiver = self;
  v190.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewDidLoad](&v190, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (MUBlurView *)objc_msgSend(objc_alloc((Class)MUBlurView), "initWithBlurEffectStyle:", 19);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView layer](self->_backgroundView, "layer"));
  objc_msgSend(v6, "setCornerCurve:", kCACornerCurveContinuous);

  v7 = self->_backgroundView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView layer](v7, "layer"));
  objc_msgSend(v8, "setMasksToBounds:", 1);

  v9 = sub_1006E6768();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[MUBlurView setNonBlurredColor:](v7, "setNonBlurredColor:", v10);

  -[MUBlurView setBlurGroupName:](v7, "setBlurGroupName:", CFSTR("NavSignBlur"));
  -[MUBlurView setStyle:](v7, "setStyle:", 2);
  -[MUBlurView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v189 = v7;
  objc_msgSend(v11, "addSubview:", v7);

  v12 = objc_opt_new(UIView);
  graphContainerView = self->_graphContainerView;
  self->_graphContainerView = v12;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_graphContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = self->_graphContainerView;
  v15 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_didTap:");
  -[UIView addGestureRecognizer:](v14, "addGestureRecognizer:", v15);

  -[UIView setAccessibilityIdentifier:](self->_graphContainerView, "setAccessibilityIdentifier:", CFSTR("GraphContainerView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", self->_graphContainerView);

  v17 = (MUBlurView *)objc_msgSend(objc_alloc((Class)MUBlurView), "initWithBlurEffectStyle:", 19);
  graphBackgroundView = self->_graphBackgroundView;
  self->_graphBackgroundView = v17;

  v19 = sub_1006E6768();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[MUBlurView setNonBlurredColor:](self->_graphBackgroundView, "setNonBlurredColor:", v20);

  -[MUBlurView setBlurGroupName:](self->_graphBackgroundView, "setBlurGroupName:", CFSTR("NavSignBlur"));
  -[MUBlurView setStyle:](self->_graphBackgroundView, "setStyle:", 2);
  -[MUBlurView setTranslatesAutoresizingMaskIntoConstraints:](self->_graphBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_graphContainerView, "addSubview:", self->_graphBackgroundView);
  v21 = objc_opt_new(UIView);
  containerView = self->_containerView;
  self->_containerView = v21;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_containerView, "layer"));
  objc_msgSend(v23, "setMasksToBounds:", 1);

  -[UIView setAccessibilityIdentifier:](self->_containerView, "setAccessibilityIdentifier:", CFSTR("NavSignListContainerView"));
  v24 = self->_containerView;
  v25 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_didTap:");
  -[UIView addGestureRecognizer:](v24, "addGestureRecognizer:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  objc_msgSend(v26, "addSubview:", self->_containerView);

  v27 = objc_opt_new(UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v27, "setMinimumLineSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v27, "setMinimumInteritemSpacing:", 0.0);
  v186 = v27;
  v28 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v27, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  collectionView = self->_collectionView;
  self->_collectionView = v28;

  v30 = -[NavSignListViewController cellClassForItemType:](self, "cellClassForItemType:", 1);
  v31 = self->_collectionView;
  v32 = NSStringFromClass(v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v31, "registerClass:forCellWithReuseIdentifier:", v30, v33);

  v34 = self->_collectionView;
  v35 = objc_opt_class(NavManeuverReroutingCell);
  v36 = (objc_class *)objc_opt_class(NavManeuverReroutingCell);
  v37 = NSStringFromClass(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v34, "registerClass:forCellWithReuseIdentifier:", v35, v38);

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v39);

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
  -[UICollectionView setDelaysContentTouches:](self->_collectionView, "setDelaysContentTouches:", 0);
  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("NavSignListCollectionView"));
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_collectionView);
  v40 = objc_opt_new(MUGradientView);
  gradientView = self->_gradientView;
  self->_gradientView = v40;

  -[MUGradientView setTranslatesAutoresizingMaskIntoConstraints:](self->_gradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUGradientView setUserInteractionEnabled:](self->_gradientView, "setUserInteractionEnabled:", 0);
  v42 = sub_1006E6768();
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "colorWithAlphaComponent:", 0.0));
  v193[0] = v44;
  v45 = sub_1006E6768();
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "colorWithAlphaComponent:", 0.25));
  v193[1] = v47;
  v48 = sub_1006E6768();
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v193[2] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v193, 3));
  -[MUGradientView setColors:](self->_gradientView, "setColors:", v50);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_gradientView);
  v51 = objc_opt_new(NavSignFooterView);
  footerView = self->_footerView;
  self->_footerView = v51;

  -[NavSignFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v53 = self->_footerView;
  v54 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_didTap:");
  -[NavSignFooterView addGestureRecognizer:](v53, "addGestureRecognizer:", v54);

  v55 = self->_footerView;
  v56 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "_didPan:");
  -[NavSignFooterView addGestureRecognizer:](v55, "addGestureRecognizer:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  objc_msgSend(v57, "safeAreaInsets");
  -[NavSignFooterView setBottomPadding:](self->_footerView, "setBottomPadding:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView endButton](self->_footerView, "endButton"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
  objc_msgSend(v59, "addTarget:action:forControlEvents:", v60, "pressedEndNavigationWithSender:", 64);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  objc_msgSend(v61, "addSubview:", self->_footerView);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v64 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
  collectionViewTopConstraint = self->_collectionViewTopConstraint;
  self->_collectionViewTopConstraint = v64;

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "route"));

  v184 = v67;
  if (v67
    && objc_msgSend(v67, "transportType") == 2
    && +[VIOSessionTask isVIOModeEnabled](VIOSessionTask, "isVIOModeEnabled"))
  {
    v68 = self->_containerView;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController VIOEnabledHintLabel](self, "VIOEnabledHintLabel"));
    -[UIView addSubview:](v68, "addSubview:", v69);

    self->_vioHintLabelVisible = 1;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_vioHintLabel, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
    v72 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v71));
    vioHintLabelTopConstraint = self->_vioHintLabelTopConstraint;
    self->_vioHintLabelTopConstraint = v72;

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_vioHintLabel, "bottomAnchor"));
    v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));
    v77 = self->_collectionViewTopConstraint;
    self->_collectionViewTopConstraint = v76;

    v192[0] = self->_vioHintLabelTopConstraint;
    v180 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_vioHintLabel, "leadingAnchor"));
    v178 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "constraintEqualToAnchor:constant:", v178, 8.0));
    v192[1] = v78;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_vioHintLabel, "trailingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, -8.0));
    v192[2] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_vioHintLabel, "heightAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintGreaterThanOrEqualToConstant:", 30.0));
    v192[3] = v83;
    v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v192, 4));

  }
  else
  {
    v187 = &__NSArray0__struct;
  }
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_graphContainerView, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "topAnchor"));
  v87 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v86, -92.0));
  graphTopConstraint = self->_graphTopConstraint;
  self->_graphTopConstraint = v87;

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_containerView, "heightAnchor"));
  v90 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToConstant:", 110.0));
  containerViewHeightConstraint = self->_containerViewHeightConstraint;
  self->_containerViewHeightConstraint = v90;

  LODWORD(v92) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_containerViewHeightConstraint, "setPriority:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MUGradientView topAnchor](self->_gradientView, "topAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v95 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, 110.0));
  gradientViewTopConstraint = self->_gradientViewTopConstraint;
  self->_gradientViewTopConstraint = v95;

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MUGradientView bottomAnchor](self->_gradientView, "bottomAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
  -[NavSignFooterView maximumHeight](self->_footerView, "maximumHeight");
  v100 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:constant:", v98, -v99));
  gradientViewBottomConstraint = self->_gradientViewBottomConstraint;
  self->_gradientViewBottomConstraint = v100;

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView heightAnchor](self->_footerView, "heightAnchor"));
  -[NavSignFooterView minimumHeight](self->_footerView, "minimumHeight");
  v103 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToConstant:"));
  footerHeightConstraint = self->_footerHeightConstraint;
  self->_footerHeightConstraint = v103;

  v179 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_graphContainerView, "leadingAnchor"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "leadingAnchor"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "constraintEqualToAnchor:", v177));
  v191[0] = v176;
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_graphContainerView, "trailingAnchor"));
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "trailingAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "constraintEqualToAnchor:", v173));
  v105 = self->_graphTopConstraint;
  v191[1] = v172;
  v191[2] = v105;
  v171 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_graphContainerView, "heightAnchor"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToConstant:", 92.0));
  v191[3] = v170;
  v169 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView leadingAnchor](self->_graphBackgroundView, "leadingAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_graphContainerView, "leadingAnchor"));
  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "constraintEqualToAnchor:", v168));
  v191[4] = v167;
  v166 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView trailingAnchor](self->_graphBackgroundView, "trailingAnchor"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_graphContainerView, "trailingAnchor"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "constraintEqualToAnchor:", v165));
  v191[5] = v164;
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView topAnchor](self->_graphBackgroundView, "topAnchor"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_graphContainerView, "topAnchor"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:", v162));
  v191[6] = v161;
  v183 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView bottomAnchor](self->_graphBackgroundView, "bottomAnchor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_graphContainerView, "bottomAnchor"));
  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "constraintEqualToAnchor:", v160));
  v191[7] = v159;
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "leadingAnchor"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "constraintEqualToAnchor:", v156));
  v191[8] = v155;
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "trailingAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintEqualToAnchor:", v152));
  v191[9] = v151;
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_graphContainerView, "bottomAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "constraintEqualToAnchor:", v185));
  v106 = self->_containerViewHeightConstraint;
  v191[10] = v148;
  v191[11] = v106;
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView leadingAnchor](v189, "leadingAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v146));
  v191[12] = v145;
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView trailingAnchor](v189, "trailingAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:", v143));
  v191[13] = v142;
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView topAnchor](v189, "topAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v140));
  v191[14] = v139;
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView bottomAnchor](v189, "bottomAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView bottomAnchor](self->_footerView, "bottomAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:", v137));
  v191[15] = v136;
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v134));
  v191[16] = v133;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v131));
  v107 = self->_collectionViewTopConstraint;
  v191[17] = v130;
  v191[18] = v107;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
  v182 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "bottomAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v128));
  v191[19] = v127;
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[MUGradientView leadingAnchor](self->_gradientView, "leadingAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v125));
  v191[20] = v124;
  v188 = (void *)objc_claimAutoreleasedReturnValue(-[MUGradientView trailingAnchor](self->_gradientView, "trailingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "constraintEqualToAnchor:", v123));
  v108 = self->_gradientViewTopConstraint;
  v191[21] = v122;
  v191[22] = v108;
  v191[23] = self->_gradientViewBottomConstraint;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView leadingAnchor](self->_footerView, "leadingAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "leadingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v120));
  v191[24] = v119;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView trailingAnchor](self->_footerView, "trailingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "trailingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v111));
  v191[25] = v112;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView topAnchor](self->_footerView, "topAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v114));
  v116 = self->_footerHeightConstraint;
  v191[26] = v115;
  v191[27] = v116;
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v191, 28));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "arrayByAddingObjectsFromArray:", v187));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v118);

  -[NavSignListViewController _applyCornerMask](self, "_applyCornerMask");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _BOOL8 expanded;
  void *v18;
  double Double;
  id v20;
  GCDTimer *v21;
  GCDTimer *vioHintLabelDismissTimer;
  _QWORD v23[4];
  id v24;
  objc_super v25;
  uint8_t buf[4];
  NavSignListViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;

  v3 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewWillAppear:](&v25, "viewWillAppear:");
  if (!self->_firstSetupDone)
  {
    self->_firstSetupDone = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v5, "registerObserver:", self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));

    v8 = sub_100328C04();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueRouteID"));
      v12 = objc_msgSend(v7, "stepsCount");
      *(_DWORD *)buf = 134349826;
      v27 = self;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      v32 = 2048;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Setting up sign list with route %@ (%@) with steps %lu", buf, 0x2Au);

    }
    -[NavSignListViewController setRoute:](self, "setRoute:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v15 = objc_msgSend(v13, "itemIndexForStepIndex:", objc_msgSend(v14, "stepIndex"));

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      v16 = 0;
    else
      v16 = v15;
    -[NavSignListViewController setActiveStepIndex:](self, "setActiveStepIndex:", v16);
    expanded = self->_expanded;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
    objc_msgSend(v18, "setScrollEnabled:", expanded);

    -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", 0);
    -[NavSignListViewController setDebugViewControllerEnabled:](self, "setDebugViewControllerEnabled:", -[NavSignListViewController _shouldShowDebugViewController](self, "_shouldShowDebugViewController"));
    if (self->_vioHintLabelVisible)
    {
      objc_initWeak((id *)buf, self);
      Double = GEOConfigGetDouble(MapsConfig_NavigationTypeSwitchHintTimeout, off_1014B3018);
      v20 = &_dispatch_main_q;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10032A360;
      v23[3] = &unk_1011AE190;
      objc_copyWeak(&v24, (id *)buf);
      v21 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v23, Double));
      vioHintLabelDismissTimer = self->_vioHintLabelDismissTimer;
      self->_vioHintLabelDismissTimer = v21;

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }

  }
  -[NavSignListViewController setDragging:](self, "setDragging:", 0);
  -[NavSignListViewController clearPartialExpansionAnimated:](self, "clearPartialExpansionAnimated:", v3);
}

- (void)hideVIOLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  GCDTimer *vioHintLabelDismissTimer;
  double v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *collectionViewTopConstraint;
  double v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id location;

  if (self->_vioHintLabelVisible)
  {
    v3 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
    objc_msgSend(v5, "signListHeightWillChangeAnimated:", v3);

    v6 = NSStringFromSelector("collapsedHeight");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v7);

    self->_vioHintLabelVisible = 0;
    v8 = NSStringFromSelector("collapsedHeight");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v9);

    vioHintLabelDismissTimer = self->_vioHintLabelDismissTimer;
    self->_vioHintLabelDismissTimer = 0;

    -[UILabel frame](self->_vioHintLabel, "frame");
    -[NSLayoutConstraint setConstant:](self->_vioHintLabelTopConstraint, "setConstant:", -v11);
    -[NSLayoutConstraint setActive:](self->_collectionViewTopConstraint, "setActive:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    collectionViewTopConstraint = self->_collectionViewTopConstraint;
    self->_collectionViewTopConstraint = v14;

    -[NSLayoutConstraint setActive:](self->_collectionViewTopConstraint, "setActive:", 1);
    objc_initWeak(&location, self);
    if (v3)
      v16 = 0.5;
    else
      v16 = 0.0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10032A5A4;
    v19[3] = &unk_1011AC860;
    v19[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10032A5F8;
    v17[3] = &unk_1011AD4F0;
    objc_copyWeak(&v18, &location);
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v19, v17, v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  -[NavSignListViewController setDragging:](self, "setDragging:", 0);
  -[NavSignListViewController clearPartialExpansionAnimated:](self, "clearPartialExpansionAnimated:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsTestingMapsRegionUpdatedWithGuidanceStep"), self, 0);
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewSafeAreaInsetsDidChange](&v9, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
  objc_msgSend(v6, "setBottomPadding:", v5);

  -[NavSignListViewController updateHeightConstraints](self, "updateHeightConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
  objc_msgSend(v7, "maximumHeight");
  -[NSLayoutConstraint setConstant:](self->_gradientViewBottomConstraint, "setConstant:", -v8);

}

- (void)viewDidLayoutSubviews
{
  NSNumber *computedWidth;
  double v4;
  double v5;
  double cardWidth;
  NSNumber *v7;
  NSNumber *v8;
  _QWORD block[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  computedWidth = self->_computedWidth;
  if (!computedWidth)
  {
    cardWidth = self->_cardWidth;
    goto LABEL_5;
  }
  -[NSNumber cgFloatValue](computedWidth, "cgFloatValue");
  v5 = v4;
  cardWidth = self->_cardWidth;
  if (vabdd_f64(v5, cardWidth) > 2.22044605e-16)
  {
LABEL_5:
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", cardWidth));
    v8 = self->_computedWidth;
    self->_computedWidth = v7;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032A88C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NavSignListViewController;
  v4 = a3;
  -[NavSignListViewController traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController traitCollection](self, "traitCollection"));
  v6 = sub_1002A8A0C(v4, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController traitCollection](self, "traitCollection"));
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v7, "isLuminanceReduced");

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10032AA70;
    v10[3] = &unk_1011ACE58;
    v11 = (char)v9;
    v10[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v9, v10);
    -[NavSignListViewController _updateSelectionBackgrounds](self, "_updateSelectionBackgrounds");
  }
  else
  {
    -[RouteStepListDataSource setTraitCollection:](self->_dataSource, "setTraitCollection:", v7);

  }
}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  id v6;
  NSObject *v7;
  void *v8;
  DirectionsElevationGraphView *graphView;
  void *v10;
  int v11;
  NavSignListViewController *v12;
  __int16 v13;
  void *v14;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v6 = sub_100328C04();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](v5, "uniqueRouteID"));
      v11 = 134349314;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got a new route: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_storeStrong((id *)&self->_route, a3);
    -[RouteStepListDataSource setRoute:](self->_dataSource, "setRoute:", v5);
    graphView = self->_graphView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](v5, "elevationProfile"));
    -[GEOComposedRoute distance](v5, "distance");
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](graphView, "setElevationProfile:routeLength:", v10);

    -[DirectionsElevationGraphView setNavigationProgress:](self->_graphView, "setNavigationProgress:", 0.0);
    -[NavSignListViewController _updateGraphViewIfNeeded](self, "_updateGraphViewIfNeeded");
  }

}

- (DirectionsElevationGraphView)graphView
{
  DirectionsElevationGraphView *graphView;
  DirectionsElevationGraphConfiguration *v4;
  void *v5;
  DirectionsElevationGraphConfiguration *v6;
  DirectionsElevationGraphView *v7;
  DirectionsElevationGraphView *v8;
  DirectionsElevationGraphView *v9;
  void *v10;
  void *v11;
  void *v12;

  graphView = self->_graphView;
  if (!graphView)
  {
    v4 = [DirectionsElevationGraphConfiguration alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController traitCollection](self, "traitCollection"));
    v6 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v4, "initWithUseType:userInterfaceIdiom:", 2, objc_msgSend(v5, "userInterfaceIdiom"));

    v7 = -[DirectionsElevationGraphView initWithConfiguration:]([DirectionsElevationGraphView alloc], "initWithConfiguration:", v6);
    v8 = self->_graphView;
    self->_graphView = v7;

    -[DirectionsElevationGraphView setTranslatesAutoresizingMaskIntoConstraints:](self->_graphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DirectionsElevationGraphView setOverrideUserInterfaceStyle:](self->_graphView, "setOverrideUserInterfaceStyle:", 2);
    v9 = self->_graphView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "elevationProfile"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route"));
    objc_msgSend(v12, "distance");
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](v9, "setElevationProfile:routeLength:", v11);

    graphView = self->_graphView;
  }
  return graphView;
}

- (void)setCardWidth:(double)a3
{
  NSNumber *computedWidth;
  double v6;
  void *v7;
  id v8;

  if (vabdd_f64(a3, self->_cardWidth) > 2.22044605e-16)
  {
    self->_cardWidth = a3;
    computedWidth = self->_computedWidth;
    if (computedWidth)
    {
      -[NSNumber cgFloatValue](computedWidth, "cgFloatValue");
      if (vabdd_f64(v6, a3) > 2.22044605e-16)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
        objc_msgSend(v7, "setNeedsLayout");

        v8 = (id)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
        objc_msgSend(v8, "layoutIfNeeded");

      }
    }
  }
}

- (void)setDragging:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 dragging;
  int v8;
  NavSignListViewController *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;

  if (self->_dragging != a3)
  {
    v3 = a3;
    v5 = sub_100328C04();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dragging = self->_dragging;
      v8 = 134349568;
      v9 = self;
      v10 = 1024;
      v11 = dragging;
      v12 = 1024;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Changing dragging from: %d to %d", (uint8_t *)&v8, 0x18u);
    }

    self->_dragging = v3;
  }
}

- (id)VIOEnabledHintLabel
{
  UILabel *vioHintLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  vioHintLabel = self->_vioHintLabel;
  if (!vioHintLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_vioHintLabel;
    self->_vioHintLabel = v4;

    -[UILabel setClipsToBounds:](self->_vioHintLabel, "setClipsToBounds:", 1);
    -[UILabel setNumberOfLines:](self->_vioHintLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_vioHintLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController theme](self, "theme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navSignMinorTextColor"));
    -[UILabel setTextColor:](self->_vioHintLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](self->_vioHintLabel, "setTextAlignment:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 17.0));
    -[UILabel setFont:](self->_vioHintLabel, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Walking_Navigation_Hint_Enhanced_Accuracy_On"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_vioHintLabel, "setText:", v10);

    LODWORD(v11) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_vioHintLabel, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    vioHintLabel = self->_vioHintLabel;
  }
  return vioHintLabel;
}

- (RouteStepListDataSource)dataSource
{
  RouteStepListDataSource *dataSource;
  RouteStepListDataSource *v4;
  void *v5;
  RouteStepListDataSource *v6;
  RouteStepListDataSource *v7;
  void *v8;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [RouteStepListDataSource alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController traitCollection](self, "traitCollection"));
    v6 = -[RouteStepListDataSource initWithTraitCollection:options:metrics:context:](v4, "initWithTraitCollection:options:metrics:context:", v5, 8, self->_metrics, 1);
    v7 = self->_dataSource;
    self->_dataSource = v6;

    -[RouteStepListDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route"));
    -[RouteStepListDataSource setRoute:](self->_dataSource, "setRoute:", v8);

    -[RouteStepListDataSource setActiveStepIndex:](self->_dataSource, "setActiveStepIndex:", -[NavSignListViewController activeStepIndex](self, "activeStepIndex"));
    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (BOOL)hasElevationGraph
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView superview](self->_graphView, "superview"));
  v3 = v2 != 0;

  return v3;
}

- (void)setLayoutProgress:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (vabdd_f64(self->_layoutProgress, v3) > 2.22044605e-16)
  {
    self->_layoutProgress = v3;
    -[NavSignListViewController _applyCornerMask](self, "_applyCornerMask");
  }
}

- (void)setSelectedStepIndex:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  int v11;
  NavSignListViewController *v12;
  __int16 v13;
  unint64_t v14;

  if (self->_selectedStepIndex != a3)
  {
    v5 = sub_100328C04();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 134349312;
      v12 = self;
      v13 = 2048;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating selected step index: %lu", (uint8_t *)&v11, 0x16u);
    }

    v7 = NSStringFromSelector("collapsedHeight");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v8);

    self->_selectedStepIndex = a3;
    v9 = NSStringFromSelector("collapsedHeight");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v10);

  }
}

- (void)setActiveStepIndex:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t selectedStepIndex;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  int v13;
  NavSignListViewController *v14;
  __int16 v15;
  unint64_t v16;

  if (self->_activeStepIndex != a3)
  {
    v5 = sub_100328C04();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 134349312;
      v14 = self;
      v15 = 2048;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating active step index: %lu", (uint8_t *)&v13, 0x16u);
    }

    selectedStepIndex = self->_selectedStepIndex;
    v8 = NSStringFromSelector("collapsedHeight");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v9);

    self->_selectedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_activeStepIndex = a3;
    -[RouteStepListDataSource setActiveStepIndex:](self->_dataSource, "setActiveStepIndex:", a3);
    v10 = NSStringFromSelector("collapsedHeight");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v11);

    if (selectedStepIndex != self->_selectedStepIndex)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
      objc_msgSend(v12, "selectStep:", 0);

    }
  }
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  self->_cornerRadius = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MUBlurView layer](self->_backgroundView, "layer"));
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setCornerMask:(unint64_t)a3
{
  if (self->_cornerMask != a3)
  {
    self->_cornerMask = a3;
    -[NavSignListViewController _applyCornerMask](self, "_applyCornerMask");
  }
}

- (void)_applyCornerMask
{
  unint64_t cornerMask;
  unint64_t v4;
  double v5;
  void *v6;
  id v7;

  cornerMask = self->_cornerMask;
  v4 = cornerMask;
  if (-[NavSignListViewController hasElevationGraph](self, "hasElevationGraph"))
  {
    -[NavSignListViewController layoutProgress](self, "layoutProgress");
    if (v5 > 0.01)
      v4 = cornerMask & 0xFFFFFFFFFFFFFFFDLL;
    else
      v4 = cornerMask;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView layer](self->_backgroundView, "layer"));
  objc_msgSend(v6, "setMaskedCorners:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MUBlurView layer](self->_graphBackgroundView, "layer"));
  objc_msgSend(v7, "setMaskedCorners:", cornerMask & 3);

}

- (void)setConnectedToCarPlay:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  double v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  NavSignListViewController *v13;
  __int16 v14;
  _BOOL4 v15;

  if (self->_connectedToCarPlay == a3)
    return;
  v4 = a4;
  v5 = a3;
  self->_connectedToCarPlay = a3;
  v7 = sub_100328C04();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v13 = self;
    v14 = 1024;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] setConnectedToCarPlay: %d", buf, 0x12u);
  }

  if (v5)
  {
    if (!self->_expanded)
      goto LABEL_8;
  }
  else if (self->_expanded)
  {
LABEL_8:
    -[NavSignListViewController toggleExpansionAnimated:](self, "toggleExpansionAnimated:", v4);
  }
  v9 = 0.0;
  if (v4)
    v9 = 0.25;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10032B860;
  v10[3] = &unk_1011ACE58;
  v10[4] = self;
  v11 = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, v9);
  -[NavSignListViewController setDebugViewControllerEnabled:](self, "setDebugViewControllerEnabled:", -[NavSignListViewController _shouldShowDebugViewController](self, "_shouldShowDebugViewController"));
}

- (double)_collapsedSignHeight
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double height;
  double v10;
  double v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController _displayIndexPath](self, "_displayIndexPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
    -[NavSignListViewController collectionView:layout:sizeForItemAtIndexPath:](self, "collectionView:layout:sizeForItemAtIndexPath:", v7, 0, v6);
    height = v8;

  }
  else
  {
    height = CGSizeZero.height;
  }
  -[RouteStepListMetrics textBottomMargin](self->_metrics, "textBottomMargin");
  v11 = v10;
  if (self->_vioHintLabelVisible)
    -[UILabel frame](self->_vioHintLabel, "frame");
  else
    v12 = 0.0;
  return height - v11 + v12;
}

- (double)collapsedHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[NavSignListViewController _collapsedSignHeight](self, "_collapsedSignHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
  objc_msgSend(v5, "minimumHeight");
  v7 = v4 + v6;

  return v7;
}

- (double)_lastSignHeight
{
  void *v3;
  void *v4;
  id v5;
  char *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return CGSizeZero.height;
  if (self->_isRerouting)
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
    v6 = (char *)objc_msgSend(v9, "count") - 1;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  -[NavSignListViewController collectionView:layout:sizeForItemAtIndexPath:](self, "collectionView:layout:sizeForItemAtIndexPath:", v11, 0, v10);
  v7 = v12;

  return v7;
}

- (double)footerBottomPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView superview](self->_graphView, "superview"));

  if (v3)
  {
    -[NavSignListViewController _graphTopPosition](self, "_graphTopPosition");
    v5 = v4 + 92.0;
  }
  else
  {
    v5 = 0.0;
  }
  -[NSLayoutConstraint constant](self->_containerViewHeightConstraint, "constant");
  v7 = v5 + v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
  objc_msgSend(v8, "currentHeight");
  v10 = v7 + v9;

  return v10;
}

- (void)setLaneGuidanceActive:(BOOL)a3
{
  if (self->_laneGuidanceActive != a3)
  {
    self->_laneGuidanceActive = a3;
    -[NavSignListViewController _updateLaneGuidancePositioning](self, "_updateLaneGuidancePositioning");
  }
}

- (unint64_t)_displayStepIndex
{
  unint64_t selectedStepIndex;

  if (self->_isRerouting)
    return 0;
  selectedStepIndex = self->_selectedStepIndex;
  if (selectedStepIndex == 0x7FFFFFFFFFFFFFFFLL)
    return self->_activeStepIndex;
  return selectedStepIndex;
}

- (id)_displayIndexPath
{
  unint64_t v2;

  if (self->_isRerouting)
    v2 = 0;
  else
    v2 = -[NavSignListViewController _displayStepIndex](self, "_displayStepIndex");
  return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v2, 0));
}

- (void)updateFooterConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  if (self->_expanded)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
    objc_msgSend(v7, "signListHeight");
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
    objc_msgSend(v5, "currentHeight");
    -[NSLayoutConstraint setConstant:](self->_containerViewHeightConstraint, "setConstant:", v4 - v6);

  }
}

- (void)clearSelectionAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[NavSignListViewController setSelectedStepIndex:](self, "setSelectedStepIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", v3);
}

- (void)clearDragState
{
  id v3;
  NSObject *v4;
  int v5;
  NavSignListViewController *v6;

  if (-[NavSignListViewController isDragging](self, "isDragging"))
  {
    v3 = sub_100328C04();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 134349056;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[%{public}p] Drag state was leaked as true! Removing...", (uint8_t *)&v5, 0xCu);
    }

    -[NavSignListViewController setDragging:](self, "setDragging:", 0);
  }
}

- (void)clearPartialExpansionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[5];
  BOOL v19;
  uint8_t buf[4];
  NavSignListViewController *v21;

  v3 = a3;
  if (!-[NavSignListViewController isDragging](self, "isDragging"))
  {
    -[NavSignListViewController layoutProgress](self, "layoutProgress");
    v6 = v5;
    v8 = fabs(v5) > 2.22044605e-16;
    v7 = fabs(v5 + -1.0);
    v8 = v8 && v7 > 2.22044605e-16;
    if (v8)
    {
      v9 = sub_100328C04();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v6 <= 0.5)
      {
        v12 = 0.0;
        if (v11)
        {
          *(_DWORD *)buf = 134349056;
          v21 = self;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Clearing partial expansion by force collapsing the list", buf, 0xCu);
        }
        v13 = 0;
      }
      else
      {
        v12 = 1.0;
        if (v11)
        {
          *(_DWORD *)buf = 134349056;
          v21 = self;
          v13 = 1;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Clearing partial expansion by forcing full expansion", buf, 0xCu);
        }
        else
        {
          v13 = 1;
        }
      }

      self->_expanded = v13;
      -[NavSignListViewController setLayoutProgress:](self, "setLayoutProgress:", v12);
      v14 = 1.0 - v6;
      if (v6 <= 0.5)
        v14 = v6;
      v15 = v14 * 0.25;
      if (v3)
        v16 = v15;
      else
        v16 = 0.0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
      objc_msgSend(v17, "signListHeightWillChangeAnimated:", v3);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10032BF80;
      v18[3] = &unk_1011ACE58;
      v18[4] = self;
      v19 = v3;
      -[NavSignListViewController _updateLayoutProgressWithDuration:completion:](self, "_updateLayoutProgressWithDuration:completion:", v18, v16);
    }
  }
}

- (void)_updateCollectionViewBottomInset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double Height;
  double v14;
  double v15;
  id v16;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController viewIfLoaded](self, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "contentInset");
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
    objc_msgSend(v12, "frame");
    Height = CGRectGetHeight(v17);
    -[NavSignListViewController _lastSignHeight](self, "_lastSignHeight");
    v15 = Height - v14;

    v16 = (id)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "setContentInset:", v7, v9, v15, v11);

  }
}

- (void)cell:(id)a3 setPressed:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NavSignListViewController *v10;
  uint64_t v11;
  id v12;
  double v13;
  id v14;
  NSObject *v15;
  int v16;
  NavSignListViewController *v17;
  __int16 v18;
  id v19;

  v6 = a3;
  if (GEOConfigGetBOOL(MapsConfig_NavigationStepSelectionEnabled, off_1014B4628) && self->_expanded)
  {
    if (a4)
    {
      objc_msgSend(v6, "setSelectedWithLayoutProgress:", 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

      if (v8)
      {
        v9 = objc_msgSend(v8, "row");
        if (v9 != (id)-[NavSignListViewController activeStepIndex](self, "activeStepIndex"))
        {
          v10 = self;
          v11 = (uint64_t)v9;
LABEL_14:
          -[NavSignListViewController setSelectedStepIndex:](v10, "setSelectedStepIndex:", v11);

          goto LABEL_15;
        }
      }
      else
      {
        v14 = sub_100328C04();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = 134349314;
          v17 = self;
          v18 = 2112;
          v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}p] Selected cell: %@ but no indexPath available", (uint8_t *)&v16, 0x16u);
        }

      }
      v10 = self;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_14;
    }
    v12 = objc_msgSend(v6, "state");
    v13 = 0.0;
    if (v12 == (id)1)
      v13 = 1.0;
    objc_msgSend(v6, "setSelectedWithLayoutProgress:", v13);
    -[NavSignListViewController setSelectedStepIndex:](self, "setSelectedStepIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
LABEL_15:

}

- (void)reloadDataSource:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;

  v4 = NSStringFromSelector("collapsedHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = objc_msgSend(v6, "itemIndexForStepIndex:", objc_msgSend(v7, "stepIndex"));

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = (unint64_t)v8;
  self->_activeStepIndex = v9;
  -[NavSignListViewController _reapplySignCountdown](self, "_reapplySignCountdown");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "reloadData");

  -[RouteStepListDataSource setActiveStepIndex:](self->_dataSource, "setActiveStepIndex:", self->_activeStepIndex);
  v11 = NSStringFromSelector("collapsedHeight");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v12);

  -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", 0);
}

- (void)reloadUIForDataSource:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;

  v4 = NSStringFromSelector("collapsedHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  -[NavSignListViewController _reapplySignCountdown](self, "_reapplySignCountdown");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "reloadData");

  v7 = NSStringFromSelector("collapsedHeight");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v8);

  -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", 0);
}

- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4
{
  id v5;
  void *v6;
  NSMutableArray *v7;
  _QWORD v8[4];
  NSMutableArray *v9;

  if (!self->_isRerouting)
  {
    v5 = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10032C4BC;
    v8[3] = &unk_1011B1E88;
    v9 = objc_opt_new(NSMutableArray);
    v7 = v9;
    objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "reloadItemsAtIndexPaths:", v7);

  }
}

- (void)_reapplySignCountdown
{
  unint64_t activeStepIndex;
  void *v4;
  id v5;
  MNGuidanceSignInfo **p_latestSignGuidance;
  void *v7;
  void *v8;
  MNGuidanceSignInfo *v9;

  activeStepIndex = self->_activeStepIndex;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self->_dataSource, "items"));
  v5 = objc_msgSend(v4, "count");

  if (activeStepIndex < (unint64_t)v5)
  {
    if (!-[NavSignListViewController isLaneGuidanceActive](self, "isLaneGuidanceActive")
      || (p_latestSignGuidance = &self->_latestLaneInfo,
          -[MNGuidanceLaneInfo isForManeuver](self->_latestLaneInfo, "isForManeuver")))
    {
      p_latestSignGuidance = &self->_latestSignGuidance;
    }
    v9 = *p_latestSignGuidance;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListDataSource items](self->_dataSource, "items"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", activeStepIndex));
    objc_msgSend(v8, "setUserInfo:", v9);

  }
}

- (Class)cellClassForItemType:(unint64_t)a3
{
  uint64_t v3;

  if (a3 != 1)
    return (Class)0;
  v3 = objc_opt_class(NavSignManeuverCell, a2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  if (self->_isRerouting)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  unint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;

  if (self->_isRerouting)
  {
    v6 = a4;
    v7 = a3;
    v8 = (objc_class *)objc_opt_class(NavManeuverReroutingCell);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6));

    objc_msgSend(v11, "startAnimating");
    -[NavSignListViewController layoutProgress](self, "layoutProgress");
    objc_msgSend(v11, "setSelectedWithLayoutProgress:");
    return v11;
  }
  else
  {
    v13 = a4;
    v14 = a3;
    v15 = objc_msgSend(v13, "row");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v15));

    v19 = NSStringFromClass((Class)objc_msgSend(v18, "cellClass"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v20, v13));

    objc_msgSend(v18, "setShowsHairline:", -[NavSignListViewController _showsHairlineForItemIndex:](self, "_showsHairlineForItemIndex:", v15));
    objc_msgSend(v21, "setItem:", v18);
    if (-[NavSignListViewController isLaneGuidanceActive](self, "isLaneGuidanceActive"))
      v22 = v15 == (id)-[NavSignListViewController activeStepIndex](self, "activeStepIndex");
    else
      v22 = 0;
    objc_msgSend(v21, "setHideManeuverArrow:", v22);
    v23 = -[NavSignListViewController _stateForItemIndex:](self, "_stateForItemIndex:", v15);
    -[NavSignListViewController layoutProgress](self, "layoutProgress");
    objc_msgSend(v21, "setState:layoutProgress:", v23);
    objc_msgSend(v21, "setDelegate:", self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10032C8B4;
    v25[3] = &unk_1011AC860;
    v24 = v21;
    v26 = v24;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);

    return v24;
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NavSignListViewController *v17;
  id v18;
  id v19;

  v14 = a4;
  v7 = a5;
  v8 = objc_opt_class(NavSignManeuverCell);
  if ((objc_opt_isKindOfClass(v14, v8) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "row");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v9));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10032C9D4;
    v15[3] = &unk_1011B1C08;
    v16 = v12;
    v17 = self;
    v18 = v14;
    v19 = v9;
    v13 = v12;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

  }
}

- (BOOL)_showsHairlineForItemIndex:(unint64_t)a3
{
  _BOOL8 v5;

  v5 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex") > a3;
  return (char *)-[NavSignListViewController activeStepIndex](self, "activeStepIndex") - v5 != (_BYTE *)a3;
}

- (unint64_t)_stateForItemIndex:(unint64_t)a3
{
  if (-[NavSignListViewController activeStepIndex](self, "activeStepIndex") > a3)
    return 0;
  if (-[NavSignListViewController activeStepIndex](self, "activeStepIndex") == a3)
    return 1;
  return 2;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSNumber *computedWidth;
  double v12;
  double cardWidth;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  computedWidth = self->_computedWidth;
  if (computedWidth)
  {
    -[NSNumber cgFloatValue](computedWidth, "cgFloatValue");
    cardWidth = v12;
  }
  else
  {
    cardWidth = self->_cardWidth;
  }
  if (self->_isRerouting)
  {
    v14 = 96.0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v10, "row")));

    v18 = objc_msgSend(v17, "cellClass");
    if (sub_100B229E4())
      v19 = 160.0;
    else
      v19 = 200.0;
    objc_msgSend(v18, "heightForItem:width:maximumHeight:", v17, cardWidth, v19);
    v21 = v20;
    if (sub_100B229E4())
      v22 = 160.0;
    else
      v22 = 200.0;
    if (v21 >= v22)
    {
      if (sub_100B229E4())
        v14 = 160.0;
      else
        v14 = 200.0;
    }
    else
    {
      v23 = objc_msgSend(v17, "cellClass");
      v24 = sub_100B229E4();
      v25 = 160.0;
      if (!v24)
        v25 = 200.0;
      objc_msgSend(v23, "heightForItem:width:maximumHeight:", v17, cardWidth, v25);
      v14 = v26;
    }

  }
  v27 = cardWidth;
  v28 = v14;
  result.height = v28;
  result.width = v27;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v5, "safeAreaInsets");
  v6 = 20.0;
  if (v7 <= 20.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
    objc_msgSend(v9, "safeAreaInsets");
    v6 = v10;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "contentOffset");
  v13 = v12;

  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", -[NavSignListViewController activeStepIndex](self, "activeStepIndex"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v21));

  v16 = 0.0;
  if (v15)
  {
    objc_msgSend(v15, "frame");
    if (v13 >= v17 - v6)
    {
      if (v13 >= v17)
      {
        v19 = v17 + v18;
        v16 = 1.0;
        if (v13 >= v17 + v18)
        {
          v16 = 0.0;
          if (v13 < v19 + 20.0)
            v16 = (v13 - v19) / -20.0 + 1.0;
        }
      }
      else
      {
        v16 = (v13 - (v17 - v6)) / v6;
      }
    }
  }
  self->_activeStepFadeIn = v16;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
  objc_msgSend(v20, "signListDidScroll");

}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char isKindOfClass;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  id v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NavSignListViewController *v39;
  uint64_t v40;
  int v41;
  NavSignListViewController *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  id v46;

  v6 = a3;
  v7 = a4;
  v8 = sub_100328C04();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v41 = 134349314;
    v42 = self;
    v43 = 2112;
    v44 = (unint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Got an updated sign info: %@", (uint8_t *)&v41, 0x16u);
  }

  objc_storeStrong((id *)&self->_latestSignGuidance, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route"));
    v30 = objc_msgSend(v6, "navigationState");
    v31 = sub_100328C04();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (!v29 && v22 && v30 == 2)
    {
      if (v33)
      {
        v41 = 134349056;
        v42 = self;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Our data source is empty; attempting to recover",
          (uint8_t *)&v41,
          0xCu);
      }

      -[NavSignListViewController _handleNewRoute:](self, "_handleNewRoute:", v22);
    }
    else
    {
      if (v33)
      {
        v41 = 134349056;
        v42 = self;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Our data source is empty; ignoring sign info update",
          (uint8_t *)&v41,
          0xCu);
      }

    }
    goto LABEL_26;
  }
  v13 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "items"));
  v16 = objc_msgSend(v15, "count");

  if (v13 < (unint64_t)v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v18 = objc_msgSend(v17, "itemIndexForStepIndex:", objc_msgSend(v7, "stepIndex"));

    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
      v18 = 0;
    v19 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
    -[NavSignListViewController setActiveStepIndex:](self, "setActiveStepIndex:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "items"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v18));

    v23 = sub_100328C04();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v22, "userInfo"));
      v41 = 134349314;
      v42 = self;
      v43 = 2112;
      v44 = (unint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Existing item user info: %@", (uint8_t *)&v41, 0x16u);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v22, "userInfo"));
    v27 = objc_opt_class(MNGuidanceLaneInfo);
    isKindOfClass = objc_opt_isKindOfClass(v26, v27);

    if ((isKindOfClass & 1) == 0)
    {
      -[NSObject setUserInfo:](v22, "setUserInfo:", v7);
      -[NSObject setState:](v22, "setState:", 2);
      -[NavSignListViewController _processSignUpdate](self, "_processSignUpdate");
    }
    if ((id)v19 == v18)
    {
      if (self->_expanded || self->_layoutProgress > 0.0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
        -[NavSignListViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", v29);
LABEL_26:

        goto LABEL_29;
      }
      v39 = self;
      v40 = 0;
    }
    else
    {
      v39 = self;
      v40 = 1;
    }
    -[NavSignListViewController _updateActiveStepIndexAnimated:](v39, "_updateActiveStepIndexAnimated:", v40);
    goto LABEL_29;
  }
  v34 = sub_100328C04();
  v22 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v35 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "items"));
    v38 = objc_msgSend(v37, "count");
    v41 = 134349568;
    v42 = self;
    v43 = 2048;
    v44 = v35;
    v45 = 2048;
    v46 = v38;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] The active step index (%lu) is larger than our data source items (%lu); ignoring sign info update",
      (uint8_t *)&v41,
      0x20u);

  }
LABEL_29:

}

- (void)_processSignUpdate
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  NavSignListViewController *v23;
  id v24;
  uint8_t buf[4];
  NavSignListViewController *v26;
  __int16 v27;
  unint64_t v28;

  v3 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));

  v7 = objc_opt_class(NavSignManeuverCell);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);
  v9 = sub_100328C04();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((isKindOfClass & 1) != 0)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134349314;
      v26 = self;
      v27 = 2112;
      v28 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating cell content: %@", buf, 0x16u);
    }

    objc_msgSend(v6, "redrawContent");
    v12 = NSStringFromSelector("collapsedHeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v13);

    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10032D550;
    v22 = &unk_1011AC8B0;
    v23 = self;
    v24 = v4;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v19);
    v14 = NSStringFromSelector("collapsedHeight");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v15, v19, v20, v21, v22, v23);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));
    v18 = (char *)objc_msgSend(v17, "count") - 1;

    if ((char *)v3 == v18)
      -[NavSignListViewController _updateCollectionViewBottomInset](self, "_updateCollectionViewBottomInset");

  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134349312;
      v26 = self;
      v27 = 2048;
      v28 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Cell for active step index (%lu) is not a nav sign maneuver cell; ignoring sign update",
        buf,
        0x16u);
    }

  }
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  id v29;
  NavSignListViewController *v30;
  uint64_t v31;
  int v32;
  NavSignListViewController *v33;
  __int16 v34;
  void *v35;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route", a3, a4, a5));
  v10 = objc_msgSend(v9, "isWalkingOnlyTransitRoute");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      v29 = sub_100328C04();
      v20 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v32 = 134349056;
        v33 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Our data source is empty; ignoring distance info update",
          (uint8_t *)&v32,
          0xCu);
      }
      goto LABEL_18;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v15 = objc_msgSend(v14, "itemIndexForStepIndex:", a6);

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      v16 = 0;
    else
      v16 = v15;
    v17 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
    -[NavSignListViewController setActiveStepIndex:](self, "setActiveStepIndex:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "items"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v16));

    v21 = sub_100328C04();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v20, "userInfo"));
      v32 = 134349314;
      v33 = self;
      v34 = 2112;
      v35 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Existing item user info: %@", (uint8_t *)&v32, 0x16u);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v20, "userInfo"));
    v25 = objc_opt_class(MNGuidanceLaneInfo);
    isKindOfClass = objc_opt_isKindOfClass(v24, v25);

    if ((isKindOfClass & 1) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
      -[NSObject setUserInfo:](v20, "setUserInfo:", v27);

      -[NSObject setState:](v20, "setState:", 2);
      -[NavSignListViewController _processSignUpdate](self, "_processSignUpdate");
    }
    if ((id)v17 == v16)
    {
      if (self->_expanded || self->_layoutProgress > 0.0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
        -[NavSignListViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", v28);

LABEL_18:
        return;
      }
      v30 = self;
      v31 = 0;
    }
    else
    {
      v30 = self;
      v31 = 1;
    }
    -[NavSignListViewController _updateActiveStepIndexAnimated:](v30, "_updateActiveStepIndexAnimated:", v31);
    goto LABEL_18;
  }
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route"));
  objc_msgSend(v7, "distance");
  v9 = v8;
  objc_msgSend(v15, "distanceRemainingToEndOfLeg");
  if (v9 - v10 < 0.0)
  {
    -[DirectionsElevationGraphView setNavigationProgress:](self->_graphView, "setNavigationProgress:", 0.0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route"));
    objc_msgSend(v11, "distance");
    v13 = v12;
    objc_msgSend(v15, "distanceRemainingToEndOfLeg");
    -[DirectionsElevationGraphView setNavigationProgress:](self->_graphView, "setNavigationProgress:", v13 - v14);

  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MNGuidanceSignInfo *v26;
  MNGuidanceSignInfo *latestSignGuidance;
  unsigned __int8 v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  v32 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "titles"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = v32;
  }
  else
  {
    v31 = objc_alloc((Class)MNGuidanceLaneInfo);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "uniqueID"));
    v9 = objc_msgSend(v32, "isForManeuver");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lanes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceSignInfo primarySign](self->_latestSignGuidance, "primarySign"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titles"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "instructions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "variableOverrides"));
    v15 = objc_msgSend(v32, "distanceDetailLevel");
    LODWORD(v30) = objc_msgSend(v32, "composedGuidanceEventIndex");
    v29 = v15;
    v16 = (void *)v8;
    v17 = objc_msgSend(v31, "initWithID:isForManeuver:lanes:titles:instructions:variableOverrides:distanceDetailLevel:composedGuidanceEventIndex:", v8, v9, v10, v12, v13, v14, v29, v30);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceSignInfo primarySign](self->_latestSignGuidance, "primarySign"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "primaryStrings"));
    objc_msgSend(v17, "setPrimaryStrings:", v19);

    v7 = v17;
  }
  v33 = v7;
  objc_storeStrong((id *)&self->_latestLaneInfo, v7);
  -[NavSignListViewController setLaneGuidanceActive:](self, "setLaneGuidanceActive:", 1);
  v20 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "items"));
  if (v20 >= (unint64_t)objc_msgSend(v22, "count"))
  {
    v25 = 0;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "items"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v20));

  }
  v26 = (MNGuidanceSignInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userInfo"));
  if (objc_msgSend(v33, "isForManeuver")
    && (latestSignGuidance = self->_latestSignGuidance, v26 != latestSignGuidance)
    || (objc_msgSend(v33, "isForManeuver") & 1) == 0
    && (v28 = objc_msgSend(v33, "isEqual:", v26),
        latestSignGuidance = (MNGuidanceSignInfo *)v33,
        (v28 & 1) == 0))
  {
    objc_msgSend(v25, "setUserInfo:", latestSignGuidance);
  }
  -[NavSignListViewController _processSignUpdate](self, "_processSignUpdate", latestSignGuidance);

}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NavSignListViewController *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v5 = (unint64_t)a4;
  -[NavSignListViewController setLaneGuidanceActive:](self, "setLaneGuidanceActive:", 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
        v14 = objc_opt_class(MNGuidanceLaneInfo);
        isKindOfClass = objc_opt_isKindOfClass(v13, v14);

        if ((isKindOfClass & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
          v17 = (unint64_t)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueID"));
          v18 = (id)v5;
          if (!(v5 | v17)
            || (v19 = v18,
                v20 = objc_msgSend((id)v17, "isEqual:", v18),
                v19,
                (id)v17,
                (id)v17,
                v20))
          {
            objc_msgSend(v12, "setUserInfo:", 0);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  v21 = -[NavSignListViewController activeStepIndex](v27, "activeStepIndex");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](v27, "dataSource"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "items"));
  if (v21 >= objc_msgSend(v23, "count"))
  {
    v26 = 0;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](v27, "dataSource"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "items"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v21));

  }
  objc_msgSend(v26, "setUserInfo:", v27->_latestSignGuidance);
  -[NavSignListViewController _processSignUpdate](v27, "_processSignUpdate");

}

- (void)navigationServiceWillReroute:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;

  if (objc_msgSend(a3, "arrivalState") == (id)1)
  {
    v4 = NSStringFromSelector("collapsedHeight");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v5);

    self->_isRerouting = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "reloadData");

    -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", 1);
    v7 = NSStringFromSelector("collapsedHeight");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v8);

    -[NavSignListViewController _updateCollectionViewBottomInset](self, "_updateCollectionViewBottomInset");
  }
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  -[NavSignListViewController _cancelReroute](self, "_cancelReroute", a3);
}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
  -[NavSignListViewController _cancelReroute](self, "_cancelReroute", a3, a4);
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[NavSignListViewController _handleNewRoute:](self, "_handleNewRoute:", a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  -[NavSignListViewController _handleNewRoute:](self, "_handleNewRoute:", a5, *(_QWORD *)&a4);
}

- (void)_cancelReroute
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;

  v3 = NSStringFromSelector("collapsedHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[NavSignListViewController willChangeValueForKey:](self, "willChangeValueForKey:", v4);

  self->_isRerouting = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "reloadData");

  -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", 0);
  v6 = NSStringFromSelector("collapsedHeight");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v7);

  -[NavSignListViewController _updateCollectionViewBottomInset](self, "_updateCollectionViewBottomInset");
}

- (void)_handleNewRoute:(id)a3
{
  self->_isRerouting = 0;
  self->_selectedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[NavSignListViewController _updateRoute:](self, "_updateRoute:", a3);
  -[NavSignListViewController _updateCollectionViewBottomInset](self, "_updateCollectionViewBottomInset");
}

- (void)_updateRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int IsNavigating;
  id v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  void *v19;
  int v20;
  NavSignListViewController *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = sub_100328C04();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueRouteID"));
      v20 = 134349314;
      v21 = self;
      v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Updating route (%@) from navigation callback", (uint8_t *)&v20, 0x16u);

    }
    -[NavSignListViewController setRoute:](self, "setRoute:", v5);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));

    v11 = objc_msgSend(v9, "state");
    IsNavigating = MNNavigationServiceStateIsNavigating(v11, v12);
    v14 = sub_100328C04();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (IsNavigating)
      v17 = v5 == 0;
    else
      v17 = 1;
    if (v17)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = 134349056;
        v21 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}p] Skipped updating route from navigation service", (uint8_t *)&v20, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueRouteID"));
        v20 = 134349314;
        v21 = self;
        v22 = 2112;
        v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Updating route (%@) from navigation service", (uint8_t *)&v20, 0x16u);

      }
      -[NavSignListViewController setRoute:](self, "setRoute:", v5);
    }

  }
}

- (void)_updateActiveStepIndexAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("MapsPPTGuidanceWillUpdateNotifcation"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));
    objc_msgSend(v10, "layoutIfNeeded");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController _displayIndexPath](self, "_displayIndexPath"));
    if (v3)
      v12 = 0.25;
    else
      v12 = 0.0;
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10032E3C8;
    v15[3] = &unk_1011AC8B0;
    v15[4] = self;
    v16 = v11;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10032E4E4;
    v14[3] = &unk_1011AE8F8;
    v13 = v11;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v15, v14, v12);

  }
}

- (void)_updateLayoutProgressWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  objc_msgSend(v8, "layoutIfNeeded");

  v11 = v6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10032E614;
  v12[3] = &unk_1011AC860;
  v12[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10032E670;
  v10[3] = &unk_1011B1EB0;
  v10[4] = self;
  v9 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v10, a3);

}

- (void)_updateLaneGuidancePositioning
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10032E770;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.3);
}

- (void)updateHeightConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double top;
  double left;
  double bottom;
  double right;
  NavSignFooterView *footerView;

  -[NavSignListViewController layoutProgress](self, "layoutProgress");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
  objc_msgSend(v5, "setLayoutProgress:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
  objc_msgSend(v6, "currentHeight");
  v8 = v7;

  -[NSLayoutConstraint setConstant:](self->_footerHeightConstraint, "setConstant:", v8);
  -[NavSignListViewController _updateGraphContainerTop](self, "_updateGraphContainerTop");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView superview](self->_graphView, "superview"));
  if (v9)
    v10 = 92.0;
  else
    v10 = 0.0;

  -[NavSignListViewController _collapsedSignHeight](self, "_collapsedSignHeight");
  v12 = v11;
  -[NavSignListViewController _signContainerAvailableHeight](self, "_signContainerAvailableHeight");
  v14 = v13 - v10;
  -[NavSignListViewController layoutProgress](self, "layoutProgress");
  v16 = v12 + v14 * v15;
  -[NSLayoutConstraint setConstant:](self->_containerViewHeightConstraint, "setConstant:", v16);
  -[NSLayoutConstraint setConstant:](self->_gradientViewTopConstraint, "setConstant:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
  objc_msgSend(v17, "setSignListHeight:", v8 + v16);

  if (self->_expanded)
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    footerView = self->_footerView;
  }
  else
  {
    footerView = self->_footerView;
    top = -30.0;
    left = 0.0;
    bottom = 0.0;
    right = 0.0;
  }
  -[NavSignFooterView _setTouchInsets:](footerView, "_setTouchInsets:", top, left, bottom, right);
  -[NavSignListViewController _updateCurrentManeuverBackground](self, "_updateCurrentManeuverBackground");
  -[NavSignListViewController _updateCollectionViewBottomInset](self, "_updateCollectionViewBottomInset");
}

- (void)_cleanupStepCountdowns
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSMutableArray *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));

  v5 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
  v6 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v4, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v7));
      v9 = v8;
      if (v5 != v7)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v7, 0));
          -[NSMutableArray addObject:](v6, "addObject:", v11);

          objc_msgSend(v9, "setUserInfo:", 0);
        }
      }

      ++v7;
    }
    while (v7 < (unint64_t)objc_msgSend(v4, "count"));
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v6;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView", (_QWORD)v21));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cellForItemAtIndexPath:", v17));

        v20 = objc_opt_class(NavSignManeuverCell);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
          objc_msgSend(v19, "redrawContent");

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

}

- (void)_updateSelectionBackgrounds
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[NavSignListViewController activeStepIndex](self, "activeStepIndex"), 0));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v10));

        v13 = objc_opt_class(NavSignManeuverCell);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = objc_msgSend(v3, "isEqual:", v10);
          v15 = 0.0;
          if (v14)
            -[NavSignListViewController layoutProgress](self, "layoutProgress", 0.0);
          objc_msgSend(v12, "setSelectedWithLayoutProgress:", v15);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)_updateGraphViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DirectionsElevationGraphView *graphView;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "elevationProfile"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView superview](self->_graphView, "superview"));
  v6 = v5;
  if (v4)
  {

    if (v6)
      return;
    -[NavSignListViewController _insertGraphView](self, "_insertGraphView");
  }
  else
  {

    if (!v6)
      return;
    -[DirectionsElevationGraphView removeFromSuperview](self->_graphView, "removeFromSuperview");
    graphView = self->_graphView;
    self->_graphView = 0;

    -[NavSignListViewController _updateGraphContainerTop](self, "_updateGraphContainerTop");
  }
  -[NavSignListViewController _applyCornerMask](self, "_applyCornerMask");
}

- (void)_updateGraphContainerTop
{
  void *v3;
  UIView *graphContainerView;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView superview](self->_graphView, "superview"));

  graphContainerView = self->_graphContainerView;
  if (v3)
  {
    -[UIView setAlpha:](graphContainerView, "setAlpha:", 1.0);
    -[NavSignListViewController _graphTopPosition](self, "_graphTopPosition");
  }
  else
  {
    -[UIView setAlpha:](graphContainerView, "setAlpha:", 0.0);
    v5 = -92.0;
  }
  -[NSLayoutConstraint setConstant:](self->_graphTopConstraint, "setConstant:", v5);
}

- (void)_insertGraphView
{
  UIView *graphContainerView;
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
  _QWORD v21[4];

  graphContainerView = self->_graphContainerView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController graphView](self, "graphView"));
  -[UIView addSubview:](graphContainerView, "addSubview:", v4);

  -[NavSignListViewController _updateGraphContainerTop](self, "_updateGraphContainerTop");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController graphView](self, "graphView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_graphContainerView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 16.0));
  v21[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController graphView](self, "graphView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_graphContainerView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v5, -16.0));
  v21[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController graphView](self, "graphView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_graphContainerView, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 16.0));
  v21[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController graphView](self, "graphView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", 60.0));
  v21[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (double)_signContainerAvailableHeight
{
  void *v3;
  double Height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v11);
  -[NavSignListViewController _collapsedSignHeight](self, "_collapsedSignHeight");
  v6 = Height - v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
  objc_msgSend(v7, "maximumHeight");
  v9 = v6 - v8;

  return v9;
}

- (void)_updateCurrentManeuverBackground
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  if (self->_isRerouting)
    v3 = 0;
  else
    v3 = -[NavSignListViewController activeStepIndex](self, "activeStepIndex");
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellForItemAtIndexPath:", v14));

  v6 = objc_opt_class(NavSignManeuverCell);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    -[NavSignListViewController layoutProgress](self, "layoutProgress");
    objc_msgSend(v5, "setState:layoutProgress:", 1);
  }
  else
  {
    v7 = objc_opt_class(NavManeuverReroutingCell);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      -[NavSignListViewController layoutProgress](self, "layoutProgress");
      objc_msgSend(v5, "setSelectedWithLayoutProgress:");
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "isLuminanceReduced");

  if ((v9 & 1) == 0)
  {
    v10 = sub_1006E66E4();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NavSignListViewController layoutProgress](self, "layoutProgress");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", v12 * 0.239999995));
    -[MUBlurView setOverlayColor:](self->_graphBackgroundView, "setOverlayColor:", v13);

  }
}

- (void)_didPan:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 expanded;
  double v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  void *v26;
  void *v27;
  int v28;
  NavSignListViewController *v29;

  v4 = a3;
  if (-[NavSignListViewController isConnectedToCarPlay](self, "isConnectedToCarPlay"))
  {
    v5 = sub_100328C04();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v28 = 134349056;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring pan gesture, CarPlay is connected", (uint8_t *)&v28, 0xCu);
    }

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
    objc_msgSend(v4, "translationInView:", v7);
    v9 = v8;

    if (objc_msgSend(v4, "state") == (id)3)
    {
      -[NavSignListViewController setDragging:](self, "setDragging:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController footerView](self, "footerView"));
      objc_msgSend(v4, "velocityInView:", v10);
      v12 = v11;

      v13 = v9 + v12 * 0.1;
      expanded = self->_expanded;
      -[NavSignListViewController _signContainerAvailableHeight](self, "_signContainerAvailableHeight");
      if (expanded)
      {
        v13 = v13 + v15;
        -[NavSignListViewController _signContainerAvailableHeight](self, "_signContainerAvailableHeight");
      }
      v16 = v13 / v15;
      -[NavSignListViewController setLayoutProgress:](self, "setLayoutProgress:", round(v16));
      v17 = self->_expanded;
      -[NavSignListViewController layoutProgress](self, "layoutProgress");
      v19 = v18 > 0.5;
      self->_expanded = v19;
      if (v17 != v19)
      {
        -[NavSignListViewController _triggerSignListAnalytics](self, "_triggerSignListAnalytics");
        v17 = self->_expanded;
      }
      v20 = 1.0 - v16;
      if (!v17)
        v20 = v16;
      v21 = v20 * 0.25;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
      objc_msgSend(v22, "signListHeightWillChangeAnimated:", 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
      -[NavSignListViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", v23);

      -[NavSignListViewController _updateLayoutProgressWithDuration:completion:](self, "_updateLayoutProgressWithDuration:completion:", 0, v21);
      -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", 0);
    }
    else
    {
      -[NavSignListViewController setDragging:](self, "setDragging:", 1);
      v24 = self->_expanded;
      -[NavSignListViewController _signContainerAvailableHeight](self, "_signContainerAvailableHeight");
      if (v24)
      {
        v9 = v9 + v25;
        -[NavSignListViewController _signContainerAvailableHeight](self, "_signContainerAvailableHeight");
      }
      -[NavSignListViewController setLayoutProgress:](self, "setLayoutProgress:", v9 / v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
      objc_msgSend(v26, "signListHeightWillChangeAnimated:", 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
      -[NavSignListViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", v27);

      -[NavSignListViewController _updateLayoutProgressWithDuration:completion:](self, "_updateLayoutProgressWithDuration:completion:", 0, 0.0);
    }
  }

}

- (void)_didTap:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NavSignListViewController *v7;

  if (-[NavSignListViewController isConnectedToCarPlay](self, "isConnectedToCarPlay", a3))
  {
    v4 = sub_100328C04();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134349056;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring tap gesture, CarPlay is connected", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    -[NavSignListViewController toggleExpansionAnimated:](self, "toggleExpansionAnimated:", 1);
  }
}

- (void)toggleExpansionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = 1.0;
  if (self->_expanded)
    v5 = 0.0;
  -[NavSignListViewController setLayoutProgress:](self, "setLayoutProgress:", v5);
  self->_expanded ^= 1u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
  objc_msgSend(v6, "signListHeightWillChangeAnimated:", v3);

  -[NavSignListViewController hideVIOLabel:](self, "hideVIOLabel:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  -[NavSignListViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", v7);

  -[NavSignListViewController _triggerSignListAnalytics](self, "_triggerSignListAnalytics");
  v8 = 0.25;
  if (!v3)
    v8 = 0.0;
  -[NavSignListViewController _updateLayoutProgressWithDuration:completion:](self, "_updateLayoutProgressWithDuration:completion:", 0, v8);
  -[NavSignListViewController _updateActiveStepIndexAnimated:](self, "_updateActiveStepIndexAnimated:", v3);
  if (!self->_expanded)
  {
    if (-[NavSignListViewController selectedStepIndex](self, "selectedStepIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
      objc_msgSend(v13, "selectStep:", 0);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController dataSource](self, "dataSource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", -[NavSignListViewController selectedStepIndex](self, "selectedStepIndex")));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController signDelegate](self, "signDelegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "step"));
      objc_msgSend(v11, "selectStep:", v12);

    }
  }
}

- (void)scrollToIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionViewLayout"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "frame");
  objc_msgSend(v9, "setContentOffset:animated:", v4);

}

- (double)_graphTopPosition
{
  double v2;

  -[NavSignListViewController layoutProgress](self, "layoutProgress");
  return (1.0 - v2) * -92.0;
}

- (void)_triggerSignListAnalytics
{
  uint64_t v2;

  if (self->_expanded)
    v2 = 3004;
  else
    v2 = 140;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v2, 505, 0);
}

- (NavigationDebugViewsController)debugViewController
{
  NavigationDebugViewsController *debugViewController;
  NavigationDebugViewsController *v4;
  NavigationDebugViewsController *v5;

  debugViewController = self->_debugViewController;
  if (!debugViewController)
  {
    v4 = objc_opt_new(NavigationDebugViewsController);
    v5 = self->_debugViewController;
    self->_debugViewController = v4;

    -[NavigationDebugViewsController setShowTraceControlsForStaleLocations:](self->_debugViewController, "setShowTraceControlsForStaleLocations:", 0);
    -[NavigationDebugViewsController setAutomaticallyHideTraceControls:](self->_debugViewController, "setAutomaticallyHideTraceControls:", 0);
    -[NavigationDebugViewsController setUpCameraSnapshotPickerVCFromViewController:](self->_debugViewController, "setUpCameraSnapshotPickerVCFromViewController:", self);
    debugViewController = self->_debugViewController;
  }
  return debugViewController;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NavigationDebugViewsController *debugViewController;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  if (self->_debugViewControllerEnabled != a3)
  {
    self->_debugViewControllerEnabled = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController debugViewController](self, "debugViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugControlsView"));

      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController view](self, "view"));
      objc_msgSend(v6, "addSubview:", v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController collectionView](self, "collectionView"));
      objc_msgSend(v7, "layoutMargins");
      v9 = v8;
      v11 = v10;

      objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
      v13 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, v9));
      v29[0] = v26;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v14, -v11));
      v29[1] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", v13));
      v29[2] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView topAnchor](self->_footerView, "topAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -10.0));
      v29[3] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignListViewController debugViewController](self, "debugViewController"));
      objc_msgSend(v22, "didManuallyAddDebugViews");

    }
    else
    {
      debugViewController = self->_debugViewController;
      if (debugViewController)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController debugControlsView](debugViewController, "debugControlsView"));
        objc_msgSend(v24, "removeFromSuperview");

        -[NavigationDebugViewsController didManuallyRemoveDebugViews](self->_debugViewController, "didManuallyRemoveDebugViews");
      }
    }
  }
}

- (BOOL)_shouldShowDebugViewController
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (objc_msgSend(v3, "isInternalInstall"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (objc_msgSend(v4, "BOOLForKey:", CFSTR("PlaybackControls")) && self->_connectedToCarPlay)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      if ((char *)objc_msgSend(v5, "simulationType") - 1 >= (char *)4)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v6 = objc_msgSend(v7, "isNavigatingFromTrace");

      }
      else
      {
        v6 = 1;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (double)activeStepFadeIn
{
  return self->_activeStepFadeIn;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (NavSignListViewControllerDelegate)signDelegate
{
  return (NavSignListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_signDelegate);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (double)cardWidth
{
  return self->_cardWidth;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (MUBlurView)graphBackgroundView
{
  return self->_graphBackgroundView;
}

- (void)setGraphBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_graphBackgroundView, a3);
}

- (void)setGraphView:(id)a3
{
  objc_storeStrong((id *)&self->_graphView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NavSignFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (unint64_t)activeStepIndex
{
  return self->_activeStepIndex;
}

- (unint64_t)selectedStepIndex
{
  return self->_selectedStepIndex;
}

- (BOOL)isLaneGuidanceActive
{
  return self->_laneGuidanceActive;
}

- (void)setDebugViewController:(id)a3
{
  objc_storeStrong((id *)&self->_debugViewController, a3);
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugViewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_graphBackgroundView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_signDelegate);
  objc_storeStrong((id *)&self->_footerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphTopConstraint, 0);
  objc_storeStrong((id *)&self->_gradientViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_gradientViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_containerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_graphContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_latestLaneInfo, 0);
  objc_storeStrong((id *)&self->_latestSignGuidance, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_computedWidth, 0);
  objc_storeStrong((id *)&self->_vioHintLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_vioHintLabelDismissTimer, 0);
  objc_storeStrong((id *)&self->_vioHintLabel, 0);
}

@end
