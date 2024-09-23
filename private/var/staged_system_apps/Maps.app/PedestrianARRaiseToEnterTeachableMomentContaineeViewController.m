@implementation PedestrianARRaiseToEnterTeachableMomentContaineeViewController

- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *result;

  v5 = a3;
  v6 = a4;
  result = (PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)initWithCoder:(id)a3
{
  id v3;
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *result;

  v3 = a3;
  result = (PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)init
{
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *v12;

  v10.receiver = self;
  v10.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  v2 = -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = sub_100C041B4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v12 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v5, "setHideGrabber:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v6, "setAllowsSwipeToDismiss:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v7, "setPresentedModally:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v8, "setTakesAvailableHeight:", 1);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *v7;

  v3 = sub_100C041B4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController dealloc](&v5, "dealloc");
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
  double v70;
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
  _QWORD v113[4];
  id v114;
  id location;
  objc_super v116;
  _QWORD v117[6];
  _QWORD v118[6];
  _QWORD v119[4];
  _QWORD v120[3];
  void *v121;

  v116.receiver = self;
  v116.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v116, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v121 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v121, 1));
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
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_raise_to_enter_teachable_moment_card_title_text"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_titleLabel, "setText:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v23, "addSubview:", self->_titleLabel);

  if (+[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice"))
    v24 = 56.0;
  else
    v24 = 50.0;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](*p_titleLabel, "leadingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "leadingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v101, 30.0));
  v120[0] = v97;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](*p_titleLabel, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v26, -27.0));
  v120[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](*p_titleLabel, "firstBaselineAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, v24));
  v120[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v120, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

  v33 = (UIView *)objc_alloc_init((Class)UIView);
  animationContainer = self->_animationContainer;
  self->_animationContainer = v33;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_animationContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v35, "addSubview:", self->_animationContainer);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_animationContainer, "leadingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v102));
  v119[0] = v98;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_animationContainer, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v87));
  v119[1] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_animationContainer, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](*p_titleLabel, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
  v119[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_animationContainer, "heightAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_animationContainer, "widthAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:multiplier:constant:", v41, 0.720000029, 0.0));
  v119[3] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v43);

  v44 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  playerView = self->_playerView;
  self->_playerView = v44;

  -[MapsLoopingVideoPlayerView setTranslatesAutoresizingMaskIntoConstraints:](self->_playerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_animationContainer, "addSubview:", self->_playerView);
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView leadingAnchor](self->_playerView, "leadingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_animationContainer, "leadingAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v107));
  v118[0] = v103;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView trailingAnchor](self->_playerView, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_animationContainer, "trailingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v95));
  v118[1] = v91;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView topAnchor](self->_playerView, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_animationContainer, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintGreaterThanOrEqualToAnchor:", v85));
  v118[2] = v83;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView bottomAnchor](self->_playerView, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_animationContainer, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintLessThanOrEqualToAnchor:", v46));
  v118[3] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView centerYAnchor](self->_playerView, "centerYAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_animationContainer, "centerYAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
  v118[4] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView heightAnchor](self->_playerView, "heightAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView widthAnchor](self->_playerView, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:multiplier:constant:", v52, 0.580817044, 0.0));
  v118[5] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v118, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v54);

  objc_initWeak(&location, self);
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_100C04F68;
  v113[3] = &unk_1011AF8A0;
  objc_copyWeak(&v114, &location);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v113));
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
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_raise_to_enter_teachable_moment_card_ok_button_text"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v61, "setTitle:forState:", v63, 0);

  v64 = self->_closeButton;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UIButton setTitleColor:forState:](v64, "setTitleColor:forState:", v65, 0);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v66, "addSubview:", self->_closeButton);

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_closeButton, "leadingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:constant:", v104, 24.0));
  v117[0] = v100;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_closeButton, "trailingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "trailingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v89, -24.0));
  v117[1] = v86;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_closeButton, "topAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_animationContainer, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v82));
  v117[2] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_closeButton, "heightAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToConstant:", 50.0));
  v117[3] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_closeButton, "bottomAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "safeAreaLayoutGuide"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bottomAnchor"));
  LODWORD(v70) = 1148829696;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:priority:", v69, -10.0, v70));
  v117[4] = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_closeButton, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:constant:", v74, -24.0));
  v117[5] = v75;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v76);

  -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
  objc_destroyWeak(&v114);
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
  v8.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3);
  if (v4)
    -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  objc_msgSend((id)objc_opt_class(self), "setShownTeachableMoment:", 1);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, 15, 0);
}

+ (BOOL)hasShownTeachableMoment
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kHasShownPedestrianARRaiseToEnterTeachableMomentKey"));

  return v3;
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
  int v11;
  id v12;
  __int16 v13;
  __CFString *v14;

  v3 = a3;
  v5 = sub_100C041B4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = v7;
    v11 = 134349314;
    v12 = a1;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Setting hasShownTeachableMoment flag: %@", (uint8_t *)&v11, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = v9;
  if (v3)
    objc_msgSend(v9, "setBool:forKey:", 1, CFSTR("kHasShownPedestrianARRaiseToEnterTeachableMomentKey"));
  else
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("kHasShownPedestrianARRaiseToEnterTeachableMomentKey"));

}

- (BOOL)_isDarkMode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle") == (id)2;

  return v3;
}

- (id)_videoNameForCurrentState
{
  unsigned int v2;
  unsigned __int8 v3;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;

  v2 = -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController _isDarkMode](self, "_isDarkMode");
  v3 = +[VLFDeviceInfo isIslandDevice](VLFDeviceInfo, "isIslandDevice");
  if (v2)
  {
    if ((v3 & 1) != 0)
      return CFSTR("PedestrianAR_raise_to_enter_island_dark");
    v5 = +[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice");
    v6 = CFSTR("PedestrianAR_raise_to_enter_notchless_dark");
    v7 = CFSTR("PedestrianAR_raise_to_enter_notch_dark");
  }
  else
  {
    if ((v3 & 1) != 0)
      return CFSTR("PedestrianAR_raise_to_enter_island_light");
    v5 = +[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice");
    v6 = CFSTR("PedestrianAR_raise_to_enter_notchless_light");
    v7 = CFSTR("PedestrianAR_raise_to_enter_notch_light");
  }
  if (v5)
    return (id)v7;
  else
    return (id)v6;
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
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *v22;
  __int16 v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController _videoNameForCurrentState](self, "_videoNameForCurrentState"));
  v4 = sub_100C041B4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v22 = self;
    v23 = 2112;
    v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating video: %@", buf, 0x16u);
  }

  v6 = objc_msgSend(objc_alloc((Class)NSDataAsset), "initWithName:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
  v19[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v19[1] = AVAssetReferenceRestrictionsKey;
  v20[0] = &__kCFBooleanFalse;
  v20[1] = &off_1012712C0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithData:contentType:options:](AVAsset, "assetWithData:contentType:options:", v7, AVFileTypeAppleM4V, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController playerView](self, "playerView"));
  objc_msgSend(v11, "replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v10, 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle1, v12, UIFontWeightBold));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController traitCollection](self, "traitCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, v15, UIFontWeightSemibold));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController closeButton](self, "closeButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
  objc_msgSend(v18, "setFont:", v16);

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
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *v7;

  if (a3 > 7 || ((1 << a3) & 0xA3) == 0)
  {
    v4 = sub_100C041B4();
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController view](self, "view"));
    objc_msgSend(v6, "frame");
    v8 = v7;
    LODWORD(v7) = 1148846080;
    LODWORD(v9) = 1112014848;
    objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, UILayoutFittingCompressedSize.height, v7, v9);
    v3 = v10;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRaiseToEnterTeachableMomentContaineeViewController view](self, "view"));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
