@implementation TransitNavigationTrayViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TransitNavigationTrayViewController)initWithRoute:(id)a3 stepsListDelegate:(id)a4
{
  id v6;
  id v7;
  TransitNavigationTrayViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  TransitDirectionsListViewController *v12;
  TransitDirectionsListViewController *listViewController;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TransitNavigationTrayViewController;
  v8 = -[TransitNavigationTrayViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navDisplayName"));
    -[TransitNavigationTrayViewController setTitle:](v8, "setTitle:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v11, "setHideContentInSmallLayout:", 0);

    v12 = -[TransitDirectionsListViewController initWithRoute:forNavigation:]([TransitDirectionsListViewController alloc], "initWithRoute:forNavigation:", v6, 1);
    listViewController = v8->_listViewController;
    v8->_listViewController = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](v8->_listViewController, "dataSource"));
    objc_msgSend(v14, "setDelegate:", v7);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](v8->_listViewController, "dataSource"));
    objc_msgSend(v15, "setAutomaticallyScrollToDisplayedStep:", 0);

  }
  return v8;
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitNavigationTrayViewController;
  v4 = a3;
  -[TransitNavigationTrayViewController setTitle:](&v5, "setTitle:", v4);
  -[ContainerHeaderView setTitle:](self->_containerHeaderView, "setTitle:", v4, v5.receiver, v5.super_class);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ContainerHeaderView *v8;
  ContainerHeaderView *containerHeaderView;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  CardButton *v14;
  void *v15;
  CardButton *v16;
  CardButton *endButton;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *headerBottomConstraint;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  RoutePlanningTransitionController *v34;
  void *v35;
  RoutePlanningTransitionController *v36;
  RoutePlanningTransitionController *transitionController;
  void *v38;
  id v39;
  void *v40;
  UIView *v41;
  UIView *lowLuminanceBackgroundView;
  id v43;
  void *v44;
  void *v45;
  UIView *v46;
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
  id v80;
  objc_super v81;
  _QWORD v82[12];

  v81.receiver = self;
  v81.super_class = (Class)TransitNavigationTrayViewController;
  -[ContaineeViewController viewDidLoad](&v81, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TransitNavigationTray"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  objc_msgSend(v4, "setContentInsetAdjustmentBehavior:", 2);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setFirstCard:", 1);

  -[TransitNavigationTrayViewController addChildViewController:](self, "addChildViewController:", self->_listViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController view](self->_listViewController, "view"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setClipsToBounds:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", v6);

  -[TransitDirectionsListViewController didMoveToParentViewController:](self->_listViewController, "didMoveToParentViewController:", self);
  v8 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 0);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v8;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setButtonHidden:](self->_containerHeaderView, "setButtonHidden:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController title](self, "title"));
  -[ContainerHeaderView setTitle:](self->_containerHeaderView, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle2, UIFontWeightBold));
  -[ContainerHeaderView setCustomTitleFont:](self->_containerHeaderView, "setCustomTitleFont:", v11);

  -[ContainerHeaderView setDelegate:](self->_containerHeaderView, "setDelegate:", self);
  LODWORD(v12) = 1148846080;
  -[ContainerHeaderView setContentHuggingPriority:forAxis:](self->_containerHeaderView, "setContentHuggingPriority:forAxis:", 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  objc_msgSend(v13, "addSubview:", self->_containerHeaderView);

  v14 = [CardButton alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
  v16 = -[CardButton initWithConfiguration:](v14, "initWithConfiguration:", v15);
  endButton = self->_endButton;
  self->_endButton = v16;

  -[CardButton setAccessibilityIdentifier:](self->_endButton, "setAccessibilityIdentifier:", CFSTR("TransitNavigationEndButton"));
  -[CardButton setTranslatesAutoresizingMaskIntoConstraints:](self->_endButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardButton addTarget:action:forControlEvents:](self->_endButton, "addTarget:action:forControlEvents:", self, "_endButtonPressed", 64);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_endButton);

  v80 = objc_alloc_init((Class)NSMutableArray);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_containerHeaderView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  headerBottomConstraint = self->_headerBottomConstraint;
  self->_headerBottomConstraint = v22;

  v82[0] = self->_headerBottomConstraint;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView heightAnchor](self->_containerHeaderView, "heightAnchor"));
  LODWORD(v24) = 1132068864;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:priority:", 60.0, v24));
  v82[1] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView heightAnchor](self->_containerHeaderView, "heightAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintGreaterThanOrEqualToConstant:", 60.0));
  v82[2] = v75;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_containerHeaderView, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v82[3] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_containerHeaderView, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v82[4] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_containerHeaderView, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
  v82[5] = v64;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v82[6] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v79 = v6;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v82[7] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v82[8] = v52;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton topAnchor](self->_endButton, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v82[9] = v48;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton trailingAnchor](self->_endButton, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v82[10] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton bottomAnchor](self->_endButton, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31));
  v82[11] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 12));
  objc_msgSend(v80, "addObjectsFromArray:", v33);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v80);
  v34 = [RoutePlanningTransitionController alloc];
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  v36 = -[RoutePlanningTransitionController initWithScrollView:](v34, "initWithScrollView:", v35);
  transitionController = self->_transitionController;
  self->_transitionController = v36;

  -[RoutePlanningTransitionController setDelegate:](self->_transitionController, "setDelegate:", self);
  -[RoutePlanningTransitionController setShowMaximumContentWhenExpanding:](self->_transitionController, "setShowMaximumContentWhenExpanding:", 0);
  -[TransitDirectionsListViewController setScrollViewDelegate:](self->_listViewController, "setScrollViewDelegate:", self->_transitionController);
  -[TransitNavigationTrayViewController _updateHeaderViewForCurrentCardHeight:](self, "_updateHeaderViewForCurrentCardHeight:", 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v38, "cardHeight");
  -[TransitNavigationTrayViewController _updateListContentInsetWithHeight:](self, "_updateListContentInsetWithHeight:");

  v39 = objc_alloc((Class)UIView);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  objc_msgSend(v40, "bounds");
  v41 = (UIView *)objc_msgSend(v39, "initWithFrame:");
  lowLuminanceBackgroundView = self->_lowLuminanceBackgroundView;
  self->_lowLuminanceBackgroundView = v41;

  -[UIView setAlpha:](self->_lowLuminanceBackgroundView, "setAlpha:", 0.0);
  v43 = sub_1006E6850();
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  -[UIView setBackgroundColor:](self->_lowLuminanceBackgroundView, "setBackgroundColor:", v44);

  -[UIView setAutoresizingMask:](self->_lowLuminanceBackgroundView, "setAutoresizingMask:", 18);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v46 = self->_lowLuminanceBackgroundView;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController view](self->_listViewController, "view"));
  objc_msgSend(v45, "insertSubview:belowSubview:", v46, v47);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)TransitNavigationTrayViewController;
  -[TransitNavigationTrayViewController viewWillLayoutSubviews](&v11, "viewWillLayoutSubviews");
  if (!self->_hasForcedInitialContaineeHeight)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      self->_previousLayoutForTransition = (unint64_t)objc_msgSend(v4, "containeeLayout");

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      self->_previousStyleForTransition = (unint64_t)objc_msgSend(v5, "containerStyle");

      if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) != 0)
      {
        v6 = self->_previousLayoutForTransition == 3;
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
        objc_msgSend(v7, "setScrollEnabled:", v6);

      }
      v8 = self->_previousLayoutForTransition != 3;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
      objc_msgSend(v9, "setUseCollapsedDisplayStyle:", v8);

      -[TransitNavigationTrayViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
      if (CGRectGetHeight(v12) > 0.0)
      {
        self->_hasForcedInitialContaineeHeight = 1;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v10, "updateHeightForCurrentLayout");

      }
    }
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitNavigationTrayViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  if (objc_msgSend(v3, "containeeLayout") != (id)2)
    goto LABEL_4;
  v4 = fabs(self->_previousMediumTransitionHeight);

  if (v4 <= 2.22044605e-16)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v3, "cardHeight");
    self->_previousMediumTransitionHeight = v5;
LABEL_4:

  }
  -[TransitNavigationTrayViewController _updateTransitionProgressForCurrentCard](self, "_updateTransitionProgressForCurrentCard");
}

- (void)_updateTransitionProgressForCurrentCard
{
  void *v3;
  unint64_t v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = (unint64_t)objc_msgSend(v3, "containerStyle");
  if (v4 > 7 || ((1 << v4) & 0xA3) == 0)
  {
    v8 = 1.0;
    v10 = 1.0;
  }
  else
  {

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "transitionProgressToAscendingLayoutFromLayout:", 1);
    v8 = v7;

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v3, "transitionProgressToAscendingLayoutFromLayout:", 2);
    v10 = v9;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  objc_msgSend(v11, "contentOffset");
  if (v12 <= 0.0)
  {
    self->_preTransitionContentOffsetY = 0.0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
    objc_msgSend(v13, "contentOffset");
    self->_preTransitionContentOffsetY = v14;

  }
  -[TransitNavigationTrayViewController _updateHeaderViewForCurrentCardHeight:](self, "_updateHeaderViewForCurrentCardHeight:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v15, "cardHeight");
  -[TransitNavigationTrayViewController _updateListContentInsetWithHeight:](self, "_updateListContentInsetWithHeight:");

  -[TransitNavigationTrayViewController _updateTransitionControllerForTransitionProgressSmallToMedium:mediumToFull:](self, "_updateTransitionControllerForTransitionProgressSmallToMedium:mediumToFull:", v8, v10);
  -[TransitNavigationTrayViewController _updateListBackgroundAlphaForCurrentCardHeight:](self, "_updateListBackgroundAlphaForCurrentCardHeight:", v10);
}

- (BOOL)_updateListContentInsetWithHeight:(double)a3
{
  void *v5;
  unsigned __int8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
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
  id v23;
  NSObject *v24;
  void *v25;
  int v27;
  double v28;
  __int16 v29;
  double v30;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  v6 = objc_msgSend(v5, "isDragging");

  if ((v6 & 1) != 0)
    return 0;
  -[NSLayoutConstraint constant](self->_headerBottomConstraint, "constant");
  v8 = a3 - v7;
  -[TransitDirectionsListViewController _heightOfFinalRow](self->_listViewController, "_heightOfFinalRow");
  v10 = v8 - v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v13 = UIRoundToViewScale(v11, v12, v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  objc_msgSend(v14, "contentInset");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (vabdd_f64(v13, v20) <= 2.22044605e-16)
    return 0;
  v23 = sub_10039064C();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v27 = 134218240;
    v28 = v20;
    v29 = 2048;
    v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Updating contentInset.bottom (prev: %#.5lf, new: %#.5lf)", (uint8_t *)&v27, 0x16u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  objc_msgSend(v25, "setContentInset:", v16, v18, v13, v22);

  return 1;
}

- (void)_updateTransitionControllerForTransitionProgressSmallToMedium:(double)a3 mediumToFull:(double)a4
{
  void *v7;
  unsigned __int8 v8;
  void *v9;
  char *v10;
  void *v11;
  id v12;
  int v13;
  _BOOL4 v14;
  unint64_t previousStyleForTransition;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  int v29;
  void *v30;
  __CFString *v31;
  id v32;
  _BOOL4 v33;
  unint64_t previousLayoutForTransition;
  uint8_t buf[4];
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  __CFString *v48;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  v8 = objc_msgSend(v7, "isDragging");

  if ((v8 & 1) != 0)
    return;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v10 = (char *)objc_msgSend(v9, "containeeLayout");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v12 = objc_msgSend(v11, "containerStyle");

  if (fabs(a4) <= 2.22044605e-16)
  {
    v33 = v10 == (char *)2;
LABEL_6:
    if (fabs(a3) <= 2.22044605e-16)
    {
      v13 = 0;
    }
    else
    {
      v14 = fabs(a3 + -1.0) > 2.22044605e-16;
      v13 = (unint64_t)(v10 - 1) <= 1 && v14;
    }
    goto LABEL_11;
  }
  v33 = v10 == (char *)2;
  if (fabs(a4 + -1.0) <= 2.22044605e-16)
    goto LABEL_6;
  v13 = 1;
LABEL_11:
  previousLayoutForTransition = self->_previousLayoutForTransition;
  previousStyleForTransition = self->_previousStyleForTransition;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v16, "cardHeight");
  v18 = v17;

  v19 = 0;
  if ((v13 & 1) == 0 && v33)
    v19 = vabdd_f64(self->_previousMediumTransitionHeight, v18) > 2.22044605e-16;
  v20 = sub_10039064C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    if (v13)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v31 = v22;
    if ((char *)previousLayoutForTransition == v10)
      v23 = CFSTR("NO");
    else
      v23 = CFSTR("YES");
    v24 = v23;
    if ((id)previousStyleForTransition == v12)
      v25 = CFSTR("NO");
    else
      v25 = CFSTR("YES");
    v32 = v12;
    v26 = v25;
    if (v19)
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    v28 = v27;
    *(_DWORD *)buf = 134219522;
    v36 = a4;
    v37 = 2048;
    v38 = a3;
    v39 = 2048;
    v40 = v18;
    v41 = 2112;
    v42 = v31;
    v43 = 2112;
    v44 = v24;
    v45 = 2112;
    v46 = v26;
    v47 = 2112;
    v48 = v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Updating transition controller (progressM-F: %#.5lf, progressS-M: %#.5lf, cardHeight: %lf, transitioning: %@, layoutChanged: %@, styleChanged: %@, currentMediumChangedInPlace: %@)", buf, 0x48u);

    v12 = v32;
  }

  if ((char *)previousLayoutForTransition == v10)
    v29 = v13;
  else
    v29 = 1;
  if ((id)previousStyleForTransition != v12)
    v29 = 1;
  if ((v29 | v19) == 1)
    -[RoutePlanningTransitionController setTransitioning:](self->_transitionController, "setTransitioning:", 1);
  if (((v13 | !-[RoutePlanningTransitionController isTransitioning](self->_transitionController, "isTransitioning")) & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
    objc_msgSend(v30, "setUseCollapsedDisplayStyle:", v10 != (char *)3);

  }
  if (-[RoutePlanningTransitionController isTransitioning](self->_transitionController, "isTransitioning"))
    -[RoutePlanningTransitionController updateTransitionWithHeight:](self->_transitionController, "updateTransitionWithHeight:", v18);
  if ((v13 & 1) == 0)
  {
    self->_previousLayoutForTransition = (unint64_t)v10;
    self->_previousStyleForTransition = (unint64_t)v12;
    if (v33 && vabdd_f64(v18, self->_previousMediumTransitionHeight) > 2.22044605e-16)
      self->_previousMediumTransitionHeight = v18;
    -[RoutePlanningTransitionController setTransitioning:](self->_transitionController, "setTransitioning:", 0);
  }
}

- (void)_updateHeaderViewForCurrentCardHeight:(double)a3
{
  void *v5;
  unint64_t previousLayoutForTransition;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  CGRect v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
  if (objc_msgSend(v5, "isDragging"))
  {
    previousLayoutForTransition = self->_previousLayoutForTransition;

    if (previousLayoutForTransition == 3)
      return;
  }
  else
  {

  }
  -[ContainerHeaderView bounds](self->_containerHeaderView, "bounds");
  v7 = (CGRectGetHeight(v12) + -8.0) * a3 + 8.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
  v10 = UIRoundToViewScale(v8, v9, v7);

  -[NSLayoutConstraint constant](self->_headerBottomConstraint, "constant");
  if (vabdd_f64(v10, v11) > 2.22044605e-16)
  {
    -[NSLayoutConstraint setConstant:](self->_headerBottomConstraint, "setConstant:", v10);
    -[ContainerHeaderView setAlpha:](self->_containerHeaderView, "setAlpha:", a3);
  }
}

- (void)_updateListBackgroundAlphaForCurrentCardHeight:(double)a3
{
  -[TransitDirectionsListViewController _overrideListBackgroundAlpha:](self->_listViewController, "_overrideListBackgroundAlpha:", a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransitNavigationTrayViewController;
  -[ContaineeViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = (unint64_t)objc_msgSend(v4, "containerStyle");
  v6 = (v5 > 7) | (0x5Cu >> v5);

  -[RoutePlanningTransitionController setCardDragEnabled:](self->_transitionController, "setCardDragEnabled:", (v6 & 1) == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  objc_msgSend(v7, "setAutomaticallyScrollToDisplayedStep:", v6 & 1);

}

- (void)updateForClusteredLegSelectedRideIndexChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  objc_msgSend(v2, "updateForClusteredLegSelectedRideIndexChange");

}

- (void)updateForCurrentDisplayedStep
{
  -[TransitNavigationTrayViewController updateForCurrentDisplayedStepAnimated:](self, "updateForCurrentDisplayedStepAnimated:", 1);
}

- (void)updateForCurrentDisplayedStepAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  if (v6 != (id)2)
  {
    v15 = sub_10039064C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "updateForCurrentDisplayedStep: need to switch to Medium layout", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v17, "wantsLayout:animated:", 2, v3);
    goto LABEL_13;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "cardHeight");
  v9 = v8;

  -[TransitNavigationTrayViewController heightForLayout:](self, "heightForLayout:", 2);
  v11 = vabdd_f64(v9, v10);
  v12 = sub_10039064C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v11 <= 2.22044605e-16)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "updateForCurrentDisplayedStep: need to scroll in place", buf, 2u);
    }

    -[TransitNavigationTrayViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
    v19 = v18;
    v21 = v20;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
    objc_msgSend(v17, "setContentOffset:animated:", v3, v19, v21);
LABEL_13:

    return;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "updateForCurrentDisplayedStep: need to reload current tray height", buf, 2u);
  }

  if (v3)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100390E50;
    v23[3] = &unk_1011AC860;
    v23[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v23, 0.25);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v22, "updateHeightForCurrentLayout");

  }
}

- (void)updateBacklightSceneEnvironment
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "isLuminanceReduced");

  if (v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_backlightSceneEnvironment"));
    objc_msgSend(v7, "invalidateAllTimelinesForReason:", CFSTR("TransitNavigationTray didReceiveUpdate"));

  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitNavigationTrayViewController;
  -[ContaineeViewController willChangeLayout:](&v6, "willChangeLayout:");
  if (a3 <= 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
    objc_msgSend(v5, "collapseAllItems");

  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitNavigationTrayViewController;
  -[ContaineeViewController didChangeLayout:](&v7, "didChangeLayout:");
  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
    objc_msgSend(v5, "setScrollEnabled:", a3 == 3);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  objc_msgSend(v6, "setUseCollapsedDisplayStyle:", a3 != 3);

  -[TransitNavigationTrayViewController _recordChangeToLayout:](self, "_recordChangeToLayout:", a3);
  -[TransitNavigationTrayViewController _updateTransitionProgressForCurrentCard](self, "_updateTransitionProgressForCurrentCard");
}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TransitNavigationTrayViewController;
  -[ContaineeViewController didChangeContainerStyle:](&v11, "didChangeContainerStyle:");
  v5 = (a3 > 7) | (0x5Cu >> a3);
  -[RoutePlanningTransitionController setCardDragEnabled:](self->_transitionController, "setCardDragEnabled:", ((a3 > 7) | (0x5Cu >> a3) & 1) == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  v7 = v6;
  v8 = v5 & 1;
  if ((v5 & 1) != 0)
    v9 = 3;
  else
    v9 = 2;
  objc_msgSend(v6, "setAutomaticallyScrollToDisplayedStep:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v10, "wantsLayout:", v9);

  -[TransitNavigationTrayViewController _updateTransitionProgressForCurrentCard](self, "_updateTransitionProgressForCurrentCard");
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  CGRect v25;
  CGRect v26;

  if (a3 - 3 < 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "availableHeight");
    v4 = v14;
LABEL_17:

    return v4;
  }
  if (a3 == 1)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v16 = v15 + 8.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "bottomSafeOffset");
    v4 = v16 + v17;
    goto LABEL_17;
  }
  v4 = 0.0;
  if (a3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "verticalSizeClass");

    v4 = -1.0;
    if (v6 != (id)1)
    {
      -[TransitNavigationTrayViewController _maximumMediumCardHeight](self, "_maximumMediumCardHeight");
      v8 = v7;
      -[TransitNavigationTrayViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
      v9 = CGRectGetHeight(v25) + 8.0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v10, "bottomSafeOffset");
      v12 = v11;
      v13 = 48.0;
      if (v12 >= 48.0)
      {
        v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v6, "bottomSafeOffset");
      }
      if (v8 < v9 + v13)
      {
        -[TransitNavigationTrayViewController _maximumMediumCardHeight](self, "_maximumMediumCardHeight");
        v4 = v23;
      }
      else
      {
        -[TransitNavigationTrayViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
        v18 = CGRectGetHeight(v26) + 8.0;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v19, "bottomSafeOffset");
        if (v20 < 48.0)
        {
          v4 = v18 + 48.0;
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
          objc_msgSend(v21, "bottomSafeOffset");
          v4 = v18 + v22;

        }
      }
      if (v12 >= 48.0)

      goto LABEL_17;
    }
  }
  return v4;
}

- (id)headerView
{
  return self->_containerHeaderView;
}

- (id)contentView
{
  return -[TransitDirectionsListViewController view](self->_listViewController, "view");
}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  v5 = objc_msgSend(v4, "containeeLayout");

  if (v5 == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView"));
    objc_msgSend(v6, "stopScrollingAndZooming");

    v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "wantsMinimizeLayout");
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "wantsExpandLayout");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TransitNavigationTrayViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController traitCollection](self, "traitCollection"));
  v6 = sub_1002A8A0C(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "isLuminanceReduced");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100391484;
    v9[3] = &unk_1011ACE58;
    v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v8, v9);
  }
}

- (id)transitionContextForTransitionController:(id)a3
{
  id v4;
  double Height;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  RoutePlanningTransitionContext *v17;
  double v18;
  _BOOL8 v19;
  double preTransitionContentOffsetY;
  RoutePlanningTransitionContext *v21;
  _QWORD v23[4];
  id v24;
  id location;
  CGRect v26;

  v4 = a3;
  -[TransitNavigationTrayViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
  Height = CGRectGetHeight(v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "bottomSafeOffset");
  v8 = Height + v7;

  -[TransitNavigationTrayViewController _maximumMediumCardHeight](self, "_maximumMediumCardHeight");
  v9 = v8;
  if (v8 >= v10)
  {
    -[TransitNavigationTrayViewController _maximumMediumCardHeight](self, "_maximumMediumCardHeight");
    v9 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v12, "availableHeight");
  v14 = v13;
  -[ContaineeViewController headerHeight](self, "headerHeight");
  v16 = v15;

  objc_initWeak(&location, self);
  v17 = [RoutePlanningTransitionContext alloc];
  v18 = v14 - v16;
  v19 = self->_previousLayoutForTransition == 3;
  preTransitionContentOffsetY = self->_preTransitionContentOffsetY;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10039169C;
  v23[3] = &unk_1011B3718;
  objc_copyWeak(&v24, &location);
  v21 = -[RoutePlanningTransitionContext initWithFullTableHeight:initiatedFromFullLayout:withInitialOffsetY:heightToFrame:originToFrameHandler:](v17, "initWithFullTableHeight:initiatedFromFullLayout:withInitialOffsetY:heightToFrame:originToFrameHandler:", v19, v23, v18, preTransitionContentOffsetY, v8 + v9 - v8);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v21;
}

- (CGRect)_rectOfRowToKeepVisible
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  objc_msgSend(v2, "frameOfDisplayedComposedRouteStepCell");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)_maximumMediumCardHeight
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));

  if (!v3)
    return 1.79769313e308;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = (unint64_t)objc_msgSend(v4, "containerStyle");
  if (v5 <= 7 && ((1 << v5) & 0xA3) != 0)
  {

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "availableHeight");
    v8 = v7 * 0.5;
  }
  else
  {

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "availableHeight");
    v8 = v9;
  }

  return v8;
}

- (void)_endButtonPressed
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10039064C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User pressed end button", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController trayDelegate](self, "trayDelegate"));
  objc_msgSend(v5, "transitNavigationTrayDidTapClose:", self);

}

- (BOOL)pptTestSupportStepping
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  v3 = objc_msgSend(v2, "pptTestSupportStepping");

  return v3;
}

- (int64_t)pptTestCurrentStepIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  v3 = objc_msgSend(v2, "pptTestCurrentStepIndex");

  return (int64_t)v3;
}

- (BOOL)pptTestHasNextStep
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  v3 = objc_msgSend(v2, "pptTestHasNextStep");

  return v3;
}

- (void)pptTestMoveToNextStep
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  objc_msgSend(v2, "pptTestMoveToNextStep");

}

- (BOOL)pptTestMoveToBoardStep
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  v3 = objc_msgSend(v2, "pptTestMoveToBoardStep");

  return v3;
}

- (UIScrollView)pptTestScrollView
{
  return -[TransitDirectionsListViewController scrollView](self->_listViewController, "scrollView");
}

- (int)currentUITargetForAnalytics
{
  return 610;
}

- (void)_recordChangeToLayout:(unint64_t)a3
{
  unint64_t previousLayoutForTransition;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  previousLayoutForTransition = self->_previousLayoutForTransition;
  if (previousLayoutForTransition)
  {
    if (previousLayoutForTransition >= a3)
    {
      if (previousLayoutForTransition <= a3)
        return;
      v9 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v5 = -[TransitNavigationTrayViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController displayedItemIndexForAnalytics](self, "displayedItemIndexForAnalytics"));
      v7 = v9;
      v8 = 2;
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v5 = -[TransitNavigationTrayViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController displayedItemIndexForAnalytics](self, "displayedItemIndexForAnalytics"));
      v7 = v9;
      v8 = 1;
    }
    objc_msgSend(v7, "captureUserAction:onTarget:eventValue:transitStep:", v8, v5, 0, v6);

  }
}

- (NSNumber)displayedItemIndexForAnalytics
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_listViewController, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayedItemIndexForAnalytics"));

  return (NSNumber *)v3;
}

- (TransitNavigationTrayDelegate)trayDelegate
{
  return (TransitNavigationTrayDelegate *)objc_loadWeakRetained((id *)&self->_trayDelegate);
}

- (void)setTrayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_trayDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trayDelegate);
  objc_storeStrong((id *)&self->_lowLuminanceBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end
