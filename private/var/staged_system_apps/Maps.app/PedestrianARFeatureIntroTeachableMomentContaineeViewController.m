@implementation PedestrianARFeatureIntroTeachableMomentContaineeViewController

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)init
{
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *result;

  result = (PedestrianARFeatureIntroTeachableMomentContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *result;

  v5 = a3;
  v6 = a4;
  result = (PedestrianARFeatureIntroTeachableMomentContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithCoder:(id)a3
{
  id v3;
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *result;

  v3 = a3;
  result = (PedestrianARFeatureIntroTeachableMomentContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithCoordinator:(id)a3
{
  id v4;
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  v4 = a3;
  if (!v4)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[PedestrianARFeatureIntroTeachableMomentContaineeViewController initWithCoordinator:]";
      v21 = 2080;
      v22 = "PedestrianARFeatureIntroTeachableMomentContaineeViewController.m";
      v23 = 1024;
      v24 = 79;
      v25 = 2080;
      v26 = "coordinator != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  v5 = -[PedestrianARFeatureIntroTeachableMomentContaineeViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = sub_100C6F7B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v20 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_coordinator, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v8, "setHideGrabber:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v9, "setAllowsSwipeToDismiss:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v10, "setPresentedModally:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v11, "setEdgeAttachedRegularHeightDimmingBehavior:", 2);

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *v7;

  v3 = sub_100C6F7B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  -[PedestrianARFeatureIntroTeachableMomentContaineeViewController dealloc](&v5, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double y;
  double width;
  double height;
  UILabel *v16;
  UILabel **p_titleLabel;
  UILabel *titleLabel;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIView *v33;
  UIView *animationContainer;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MapsLoopingVideoPlayerView *v44;
  MapsLoopingVideoPlayerView *playerView;
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
  UIButton *v56;
  UIButton *closeButton;
  double v58;
  void *v59;
  void *v60;
  UIButton *v61;
  void *v62;
  void *v63;
  UIButton *v64;
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
  uint64_t v76;
  uint64_t v77;
  double v78;
  UILabel *v79;
  UILabel *privacyLabel;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
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
  _QWORD v136[4];
  id v137;
  id location;
  objc_super v139;
  _QWORD v140[2];
  _QWORD v141[5];
  _QWORD v142[4];
  _QWORD v143[6];
  _QWORD v144[4];
  _QWORD v145[3];
  void *v146;

  v139.receiver = self;
  v139.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v139, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v146 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v146, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("TeachableMomentCardBackgoundColor")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v16 = (UILabel *)objc_msgSend(v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v19) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v19);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 4);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_feature_intro_teachable_moment_card_title_text"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_titleLabel, "setText:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v23, "addSubview:", self->_titleLabel);

  if (+[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice"))
    v24 = 56.0;
  else
    v24 = 50.0;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](*p_titleLabel, "leadingAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "leadingAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:constant:", v122, 30.0));
  v145[0] = v117;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](*p_titleLabel, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:constant:", v26, -27.0));
  v145[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](*p_titleLabel, "firstBaselineAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, v24));
  v145[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v145, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

  v33 = (UIView *)objc_alloc_init((Class)UIView);
  animationContainer = self->_animationContainer;
  self->_animationContainer = v33;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_animationContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v35, "addSubview:", self->_animationContainer);

  v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_animationContainer, "leadingAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "leadingAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:", v123));
  v144[0] = v118;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_animationContainer, "trailingAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v105));
  v144[1] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_animationContainer, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](*p_titleLabel, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
  v144[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_animationContainer, "heightAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_animationContainer, "widthAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:multiplier:constant:", v41, 0.597333312, 0.0));
  v144[3] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v144, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v43);

  v44 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  playerView = self->_playerView;
  self->_playerView = v44;

  -[MapsLoopingVideoPlayerView setTranslatesAutoresizingMaskIntoConstraints:](self->_playerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_animationContainer, "addSubview:", self->_playerView);
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView leadingAnchor](self->_playerView, "leadingAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_animationContainer, "leadingAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v129));
  v143[0] = v124;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView trailingAnchor](self->_playerView, "trailingAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_animationContainer, "trailingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v114));
  v143[1] = v109;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView topAnchor](self->_playerView, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_animationContainer, "topAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintGreaterThanOrEqualToAnchor:", v103));
  v143[2] = v101;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView bottomAnchor](self->_playerView, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_animationContainer, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintLessThanOrEqualToAnchor:", v46));
  v143[3] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView centerYAnchor](self->_playerView, "centerYAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_animationContainer, "centerYAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
  v143[4] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView heightAnchor](self->_playerView, "heightAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView widthAnchor](self->_playerView, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:multiplier:constant:", v52, 0.580817044, 0.0));
  v143[5] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v54);

  objc_initWeak(&location, self);
  v136[0] = _NSConcreteStackBlock;
  v136[1] = 3221225472;
  v136[2] = sub_100C70904;
  v136[3] = &unk_1011AF8A0;
  objc_copyWeak(&v137, &location);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v136));
  v56 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v55));
  closeButton = self->_closeButton;
  self->_closeButton = v56;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v58) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_closeButton, "setContentCompressionResistancePriority:forAxis:", 1, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_closeButton, "layer"));
  objc_msgSend(v59, "setCornerRadius:", 12.0);

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setBackgroundColor:](self->_closeButton, "setBackgroundColor:", v60);

  v61 = self->_closeButton;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_feature_intro_teachable_moment_card_ok_button_text"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v61, "setTitle:forState:", v63, 0);

  v64 = self->_closeButton;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UIButton setTitleColor:forState:](v64, "setTitleColor:forState:", v65, 0);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v66, "addSubview:", self->_closeButton);

  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_closeButton, "leadingAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "leadingAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToAnchor:constant:", v120, 24.0));
  v142[0] = v115;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_closeButton, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:", v68, -24.0));
  v142[1] = v69;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_closeButton, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_animationContainer, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v71));
  v142[2] = v72;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_closeButton, "heightAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToConstant:", 50.0));
  v142[3] = v74;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v75);

  if (GEOVisualLocalizationCrowdsourcingIsSupported(v76, v77)
    && GEOVisualLocalizationCrowdsourcingIsAllowed()
    && (GEOVisualLocalizationCrowdsourcingIsEnabled() & 1) != 0)
  {
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_closeButton, "bottomAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "safeAreaLayoutGuide"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "bottomAnchor"));
    LODWORD(v78) = 1148829696;
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:priority:", v116, 0.0, v78));
    v140[0] = v107;
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_closeButton, "bottomAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "bottomAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintLessThanOrEqualToAnchor:constant:", v102, -16.0));
    v140[1] = v100;
    v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v140, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v135);
  }
  else
  {
    v79 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    privacyLabel = self->_privacyLabel;
    self->_privacyLabel = v79;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_privacyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](self->_privacyLabel, "setTextAlignment:", 1);
    LODWORD(v81) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_privacyLabel, "setContentCompressionResistancePriority:forAxis:", 1, v81);
    -[UILabel setNumberOfLines:](self->_privacyLabel, "setNumberOfLines:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_feature_intro_teachable_moment_card_privacy_caption_text"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_privacyLabel, "setText:", v83);

    v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[UILabel setTextColor:](self->_privacyLabel, "setTextColor:", v84);

    v85 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v85, "addSubview:", self->_privacyLabel);

    if (+[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice"))
      v86 = 20.0;
    else
      v86 = 18.0;
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_privacyLabel, "leadingAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "leadingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v126, 24.0));
    v141[0] = v116;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_privacyLabel, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "trailingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:constant:", v104, -24.0));
    v141[1] = v102;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_privacyLabel, "topAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_closeButton, "bottomAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:constant:", v135, v86));
    v141[2] = v98;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_privacyLabel, "bottomAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "safeAreaLayoutGuide"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "bottomAnchor"));
    LODWORD(v90) = 1148829696;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:constant:priority:", v89, 0.0, v90));
    v141[3] = v91;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_privacyLabel, "bottomAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "bottomAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintLessThanOrEqualToAnchor:constant:", v94, -16.0));
    v141[4] = v95;
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v141, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v96);

  }
  -[PedestrianARFeatureIntroTeachableMomentContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
  objc_destroyWeak(&v137);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[PedestrianARFeatureIntroTeachableMomentContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  -[PedestrianARFeatureIntroTeachableMomentContaineeViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3);
  if (v4)
  {
    -[PedestrianARFeatureIntroTeachableMomentContaineeViewController _configureFloatingButtonHighlightIfNecessary](self, "_configureFloatingButtonHighlightIfNecessary");
    -[PedestrianARFeatureIntroTeachableMomentContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  -[PedestrianARFeatureIntroTeachableMomentContaineeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  objc_msgSend((id)objc_opt_class(self), "setShownTeachableMoment:", 1);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, 14, 0);
}

- (void)didResignCurrent
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  -[ContaineeViewController didResignCurrent](&v5, "didResignCurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
  objc_msgSend(v4, "removeFromSuperview");

}

+ (BOOL)hasShownTeachableMoment
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  double Double;
  void *v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  BOOL v17;
  id v18;
  int v20;
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  char *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("kLastDateShownPedestrianARFeatureIntroTeachableMomentKey")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = (char *)objc_msgSend(v5, "integerForKey:", CFSTR("kTimesShownPedestrianARFeatureIntroTeachableMomentKey"));

    if ((unint64_t)(v6 - 1) >= 3)
    {
      v18 = sub_100C6F7B8();
      v13 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v20 = 134349312;
        v21 = a1;
        v22 = 2048;
        v23 = *(double *)&v6;
        v14 = "[%{public}p] User has been shown the feature intro teachable moment card too many times (%ld)";
        v15 = v13;
        v16 = 22;
        goto LABEL_9;
      }
    }
    else
    {
      Double = GEOConfigGetDouble(*off_1011EA630[(_QWORD)(v6 - 1)], *off_1011EA648[(_QWORD)(v6 - 1)]);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v8, "timeIntervalSinceDate:", v4);
      v10 = v9;

      v11 = sub_100C6F7B8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v10 >= Double)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v20 = 134349824;
          v21 = a1;
          v22 = 2048;
          v23 = v10;
          v24 = 2048;
          v25 = Double;
          v26 = 2048;
          v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Time since the last time the feature intro teachable moment card was shown (%f) is greater than the maximum time interval (%f) based on the number of times it has been shown (%ld); treating as though car"
            "d has never been shown",
            (uint8_t *)&v20,
            0x2Au);
        }
        v17 = 0;
        goto LABEL_14;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v20 = 134349824;
        v21 = a1;
        v22 = 2048;
        v23 = v10;
        v24 = 2048;
        v25 = Double;
        v26 = 2048;
        v27 = v6;
        v14 = "[%{public}p] Time since the last time the feature intro teachable moment card was shown (%f) is less than "
              "the maximum time interval (%f) based on the number of times it has been shown (%ld); treating as though ca"
              "rd has already been shown";
        v15 = v13;
        v16 = 42;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v20, v16);
      }
    }
    v17 = 1;
LABEL_14:

    goto LABEL_15;
  }
  v17 = 0;
LABEL_15:

  return v17;
}

+ (void)setShownTeachableMoment:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  __CFString *v19;

  v3 = a3;
  v5 = sub_100C6F7B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = v7;
    v16 = 134349314;
    v17 = a1;
    v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Setting hasShownTeachableMoment flag: %@", (uint8_t *)&v16, 0x16u);

  }
  if (v3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = (char *)objc_msgSend(v10, "integerForKey:", CFSTR("kTimesShownPedestrianARFeatureIntroTeachableMomentKey"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("kLastDateShownPedestrianARFeatureIntroTeachableMomentKey"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11 + 1));
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("kTimesShownPedestrianARFeatureIntroTeachableMomentKey"));

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v15, "removeObjectForKey:", CFSTR("kLastDateShownPedestrianARFeatureIntroTeachableMomentKey"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("kTimesShownPedestrianARFeatureIntroTeachableMomentKey"));
  }

}

+ (BOOL)shouldShowTeachableMoment
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  const char *v7;
  unsigned int v8;
  id v9;
  _BOOL4 v10;
  BOOL v11;
  int v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasUserEnteredAR");

  if (v4)
  {
    v5 = sub_100C6F7B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134349056;
      v14 = a1;
      v7 = "[%{public}p] User has entered AR; should NOT show feaure intro teachable moment card";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v13, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v8 = objc_msgSend(a1, "hasShownTeachableMoment");
  v9 = sub_100C6F7B8();
  v6 = objc_claimAutoreleasedReturnValue(v9);
  v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      v13 = 134349056;
      v14 = a1;
      v7 = "[%{public}p] User has seen the TM card within time threshold; should NOT show feaure intro teachable moment card";
      goto LABEL_7;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_12;
  }
  if (v10)
  {
    v13 = 134349056;
    v14 = a1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Feature intro teachable moment card is eligible to be shown", (uint8_t *)&v13, 0xCu);
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)_isDarkMode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle") == (id)2;

  return v3;
}

- (id)_videoNameForCurrentState
{
  if (-[PedestrianARFeatureIntroTeachableMomentContaineeViewController _isDarkMode](self, "_isDarkMode"))
    return CFSTR("PedestrianAR_feature_intro_dark");
  else
    return CFSTR("PedestrianAR_feature_intro_light");
}

- (void)_updateForCurrentState
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
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
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *v25;
  __int16 v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController _videoNameForCurrentState](self, "_videoNameForCurrentState"));
  v4 = sub_100C6F7B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v25 = self;
    v26 = 2112;
    v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating video: %@", buf, 0x16u);
  }

  v6 = objc_msgSend(objc_alloc((Class)NSDataAsset), "initWithName:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
  v22[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v22[1] = AVAssetReferenceRestrictionsKey;
  v23[0] = &__kCFBooleanFalse;
  v23[1] = &off_1012714A0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithData:contentType:options:](AVAsset, "assetWithData:contentType:options:", v7, AVFileTypeAppleM4V, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController playerView](self, "playerView"));
  objc_msgSend(v11, "replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v10, 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle1, v12, UIFontWeightBold));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, v15, UIFontWeightSemibold));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController closeButton](self, "closeButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
  objc_msgSend(v18, "setFont:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleFootnote, v19, UIFontWeightRegular));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController privacyLabel](self, "privacyLabel"));
  objc_msgSend(v21, "setFont:", v20);

}

- (void)_configureFloatingButtonHighlightIfNecessary
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  double y;
  double width;
  double height;
  id v39;
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
  id v55;
  id v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  _UNKNOWN **v60;
  _UNKNOWN **v61;
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
  double v80;
  double v81;
  double v82;
  double v83;
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
  _UNKNOWN **v103;
  void *v104;
  void *v105;
  void *v106;
  _UNKNOWN **v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  _QWORD v112[4];
  _QWORD v113[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController coordinator](self, "coordinator"));
  v4 = objc_opt_class(NavActionCoordinator);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewWithTag:", &off_1011EA608));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
      -[PedestrianARFeatureIntroTeachableMomentContaineeViewController setButtonReplica:](self, "setButtonReplica:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      objc_msgSend(v11, "setClipsToBounds:", 1);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
      objc_msgSend(v13, "setMasksToBounds:", 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
      objc_msgSend(v15, "setCornerRadius:", 8.0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Pedestrian AR [Accessibility]"), CFSTR("localized string not found"), 0));
      objc_msgSend(v16, "setAccessibilityLabel:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      objc_msgSend(v19, "addTarget:action:forControlEvents:", self, "enterPedestrianAR:", 64);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arkit")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      objc_msgSend(v21, "setImage:forState:", v20, 0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme floatingControlsTintColor](MapsTheme, "floatingControlsTintColor"));
      objc_msgSend(v22, "setTintColor:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      objc_msgSend(v25, "setBackgroundColor:", v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredSymbolConfigurationForImageInState:", 0));
      objc_msgSend(v26, "setPreferredSymbolConfiguration:forImageInState:", v27, 0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController presentationController](self, "presentationController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "containerView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      objc_msgSend(v29, "addSubview:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
      LODWORD(v32) = 1148846080;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_maps_constraintsEqualToEdgesOfView:priority:", v8, v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

      if (GEOConfigGetBOOL(MapsConfig_PedestrianARFloatingControlButtonArrowEnabled, off_1014B45F8))
      {
        v35 = objc_alloc((Class)UIView);
        y = CGRectZero.origin.y;
        width = CGRectZero.size.width;
        height = CGRectZero.size.height;
        v39 = objc_msgSend(v35, "initWithFrame:", CGRectZero.origin.x, y, width, height);
        -[PedestrianARFeatureIntroTeachableMomentContaineeViewController setArrowContainerView:](self, "setArrowContainerView:", v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController presentationController](self, "presentationController"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "containerView"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        objc_msgSend(v42, "addSubview:", v43);

        v108 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "trailingAnchor"));
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "leadingAnchor"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintLessThanOrEqualToAnchor:constant:", v102, -10.0));
        v113[0] = v100;
        v98 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "centerYAnchor"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "centerYAnchor"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v92));
        v113[1] = v89;
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "widthAnchor"));
        v110 = v20;
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "widthAnchor"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v45));
        v113[2] = v46;
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "heightAnchor"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController buttonReplica](self, "buttonReplica"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "heightAnchor"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v50));
        v113[3] = v51;
        v111 = v8;
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v52);

        v53 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController presentationController](self, "presentationController"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "containerView"));
        v55 = objc_msgSend(v54, "effectiveUserInterfaceLayoutDirection");

        v56 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
        objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v56, "setContentMode:", 4);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
        objc_msgSend(v56, "setTintColor:", v57);

        v109 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleLargeTitle, UIFontWeightBold));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v109));
        objc_msgSend(v56, "setPreferredSymbolConfiguration:", v58);

        if (v55 == (id)1)
          v59 = CFSTR("arrow.left");
        else
          v59 = CFSTR("arrow.right");
        v60 = &off_101271500;
        if (v55 == (id)1)
          v60 = &off_1012714E8;
        v103 = v60;
        v61 = &off_101271518;
        if (v55 != (id)1)
          v61 = &off_101271530;
        v107 = v61;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v59));
        objc_msgSend(v56, "setImage:", v62);

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        objc_msgSend(v63, "addSubview:", v56);

        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "leadingAnchor"));
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v97));
        v112[0] = v95;
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "trailingAnchor"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v90));
        v112[1] = v87;
        v105 = v56;
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v66));
        v112[2] = v67;
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "bottomAnchor"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v70));
        v112[3] = v71;
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v72);

        v20 = v110;
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
        objc_msgSend(v73, "setFromValue:", &off_1012714B8);
        objc_msgSend(v73, "setToValue:", &off_1012714D0);
        objc_msgSend(v73, "setBeginTime:", CACurrentMediaTime());
        objc_msgSend(v73, "setDuration:", 0.1);
        objc_msgSend(v73, "setRemovedOnCompletion:", 1);
        objc_msgSend(v73, "setFillMode:", kCAFillModeForwards);
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
        objc_msgSend(v73, "setTimingFunction:", v74);

        v75 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        objc_msgSend(v75, "addAnimation:forKey:", v73, CFSTR("fadeIn"));

        v76 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.translation.x")));
        objc_msgSend(v76, "setFromValue:", v103);
        objc_msgSend(v76, "setToValue:", &off_1012714B8);
        objc_msgSend(v76, "setBeginTime:", CACurrentMediaTime());
        objc_msgSend(v76, "setDuration:", 0.5);
        objc_msgSend(v76, "setRemovedOnCompletion:", 1);
        objc_msgSend(v76, "setFillMode:", kCAFillModeForwards);
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
        objc_msgSend(v76, "setTimingFunction:", v77);

        v78 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        objc_msgSend(v78, "addAnimation:forKey:", v76, CFSTR("slideIn"));

        v79 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.translation.x")));
        objc_msgSend(v76, "beginTime");
        v81 = v80;
        objc_msgSend(v76, "duration");
        objc_msgSend(v79, "setBeginTime:", v81 + v82);
        objc_msgSend(v79, "setFromValue:", &off_1012714B8);
        objc_msgSend(v79, "setToValue:", v107);
        objc_msgSend(v79, "setDuration:", 0.5);
        objc_msgSend(v79, "setAutoreverses:", 1);
        LODWORD(v83) = 2139095039;
        objc_msgSend(v79, "setRepeatCount:", v83);
        objc_msgSend(v79, "setFillMode:", kCAFillModeForwards);
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
        objc_msgSend(v79, "setTimingFunction:", v84);

        v85 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController arrowContainerView](self, "arrowContainerView"));
        objc_msgSend(v85, "addAnimation:forKey:", v79, CFSTR("backAndForth"));

        v8 = v111;
      }

    }
  }
}

- (int64_t)floatingControlsOptions
{
  return 267;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  int v6;
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *v7;

  if (a3 > 7 || ((1 << a3) & 0xA3) == 0)
  {
    v4 = sub_100C6F7B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134349056;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Layout changed to landscape; dismissing",
        (uint8_t *)&v6,
        0xCu);
    }

    -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  v3 = -1.0;
  if (a3 == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController view](self, "view"));
    objc_msgSend(v6, "frame");
    v8 = v7;
    LODWORD(v7) = 1148846080;
    LODWORD(v9) = 1112014848;
    objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, UILayoutFittingCompressedSize.height, v7, v9);
    v3 = v10;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController view](self, "view"));
    objc_msgSend(v11, "safeAreaInsets");
    v13 = v12;

    if (v13 == 0.0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v14, "bottomSafeOffset");
      v3 = v3 + v15;

    }
  }
  return v3;
}

- (void)enterPedestrianAR:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C723DC;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C72460;
  v6[3] = &unk_1011AD4F0;
  objc_copyWeak(&v7, &location);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v6, 0.35);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFeatureIntroTeachableMomentContaineeViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "enterPedestrianAR");

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (PedestrianARCoordination)coordinator
{
  return (PedestrianARCoordination *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (MapsThemeButton)buttonReplica
{
  return self->_buttonReplica;
}

- (void)setButtonReplica:(id)a3
{
  objc_storeStrong((id *)&self->_buttonReplica, a3);
}

- (UIView)arrowContainerView
{
  return self->_arrowContainerView;
}

- (void)setArrowContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_arrowContainerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)animationContainer
{
  return self->_animationContainer;
}

- (void)setAnimationContainer:(id)a3
{
  objc_storeStrong((id *)&self->_animationContainer, a3);
}

- (MapsLoopingVideoPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UILabel)privacyLabel
{
  return self->_privacyLabel;
}

- (void)setPrivacyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLabel, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_arrowContainerView, 0);
  objc_storeStrong((id *)&self->_buttonReplica, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
