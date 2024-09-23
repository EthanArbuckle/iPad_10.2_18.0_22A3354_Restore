@implementation NavVoiceVolumeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavVoiceVolumeViewController)initWithDelegate:(id)a3
{
  id v4;
  NavVoiceVolumeViewController *v5;
  NavVoiceVolumeViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id geoConfigListener;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavVoiceVolumeViewController;
  v5 = -[NavVoiceVolumeViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setBlurInCardView:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v9, "setCardColor:", v8);

    objc_storeWeak((id *)&v6->_voiceVolumeControlDelegate, v4);
  }
  v10 = _GEOConfigAddBlockListenerForKey(NavigationConfig_SpokenGuidanceVolumeUserChoice[0], NavigationConfig_SpokenGuidanceVolumeUserChoice[1], &_dispatch_main_q, &stru_1011E32B8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  geoConfigListener = v6->_geoConfigListener;
  v6->_geoConfigListener = (id)v11;

  return v6;
}

- (void)dealloc
{
  id geoConfigListener;
  objc_super v4;

  GEOConfigRemoveBlockListener(self->_geoConfigListener, a2);
  geoConfigListener = self->_geoConfigListener;
  self->_geoConfigListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)NavVoiceVolumeViewController;
  -[NavVoiceVolumeViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  ContainerHeaderView *v4;
  ContainerHeaderView *trayHeader;
  void *v6;
  UILabel *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  UIView *v12;
  UILayoutGuide *v13;
  UILayoutGuide *labelGrowLayoutGuide;
  UILayoutGuide *v15;
  UILabel *titleLabel;
  UILabel *v17;
  UIView *v18;
  UIView *contentView;
  void *v20;
  VoiceVolumeControlView *v21;
  VoiceVolumeControlView *controlView;
  VoiceVolumeControlView *v23;
  void *v24;
  double v25;
  double v26;
  UILayoutGuide *v27;
  double v28;
  VoiceVolumeControlView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UILabel *v43;
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
  UIView *v73;
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
  objc_super v106;
  _QWORD v107[23];

  v106.receiver = self;
  v106.super_class = (Class)NavVoiceVolumeViewController;
  -[ContaineeViewController viewDidLoad](&v106, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setEdgeAttachedRegularHeightDimmingBehavior:", 2);

  v4 = objc_opt_new(ContainerHeaderView);
  trayHeader = self->_trayHeader;
  self->_trayHeader = v4;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_trayHeader, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_trayHeader, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](self->_trayHeader, "setHairLineAlpha:", 0.0);
  -[ContainerHeaderView setHeaderSize:](self->_trayHeader, "setHeaderSize:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_trayHeader);

  v7 = objc_opt_new(UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 1);
  LODWORD(v8) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v8);
  LODWORD(v9) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Voice Volume [Nav, Tray]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](v7, "setText:", v11);

  -[UILabel setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("HeaderLabel"));
  v12 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v12, "addSubview:", v7);
  v13 = objc_opt_new(UILayoutGuide);
  -[UIView addLayoutGuide:](v12, "addLayoutGuide:", v13);
  labelGrowLayoutGuide = self->_labelGrowLayoutGuide;
  self->_labelGrowLayoutGuide = v13;
  v15 = v13;

  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;
  v17 = v7;

  -[ContainerHeaderView setTitleView:](self->_trayHeader, "setTitleView:", v12);
  v18 = objc_opt_new(UIView);
  contentView = self->_contentView;
  self->_contentView = v18;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("NavVoiceVolumeContent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  objc_msgSend(v20, "addSubview:", self->_contentView);

  v21 = -[VoiceVolumeControlView initWithDelegate:]([VoiceVolumeControlView alloc], "initWithDelegate:", self);
  -[VoiceVolumeControlView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  controlView = self->_controlView;
  self->_controlView = v21;
  v23 = v21;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController contentView](self, "contentView"));
  objc_msgSend(v24, "addSubview:", v23);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_trayHeader, "topAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "topAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
  v107[0] = v102;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_trayHeader, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
  v107[1] = v98;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_trayHeader, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v95));
  v107[2] = v94;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v91));
  v107[3] = v90;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "trailingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v107[4] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_trayHeader, "bottomAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
  v107[5] = v83;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "bottomAnchor"));
  LODWORD(v25) = 1144750080;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:priority:", v80, -32.0, v25));
  v107[6] = v79;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView bottomAnchor](self->_controlView, "bottomAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "bottomAnchor"));
  LODWORD(v26) = 1148846080;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintLessThanOrEqualToAnchor:constant:priority:", v76, 0.0, v26));
  v107[7] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v12, "heightAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToConstant:", 82.0));
  v107[8] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v12, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_trayHeader, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v107[9] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v12, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_trayHeader, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
  v107[10] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v17, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v12, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, 16.0));
  v107[11] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v17, "topAnchor"));
  v73 = v12;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v12, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 16.0));
  v107[12] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v17, "bottomAnchor"));
  v27 = v15;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v15, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v107[13] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v15, "leadingAnchor"));
  v43 = v17;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v17, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v107[14] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v15, "widthAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v17, "widthAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v107[15] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v15, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v12, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v107[16] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v15, "heightAnchor"));
  LODWORD(v28) = 1144750080;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:priority:", 16.0, v28));
  v107[17] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v15, "heightAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToConstant:", 0.0));
  v107[18] = v44;
  v29 = v23;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView topAnchor](v23, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v107[19] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView bottomAnchor](v23, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v107[20] = v37;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView centerXAnchor](v23, "centerXAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_contentView, "centerXAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  v107[21] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView leftAnchor](v23, "leftAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_contentView, "leftAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 16.0));
  v107[22] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 23));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

  -[NavVoiceVolumeViewController _updateFonts](self, "_updateFonts");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavVoiceVolumeViewController;
  -[ContaineeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setHideGrabber:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavVoiceVolumeViewController;
  -[NavVoiceVolumeViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  -[NavVoiceVolumeViewController dismissAfterDelay](self, "dismissAfterDelay");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "updateHeightForCurrentLayout");

}

- (void)audioControlView:(id)a3 didSelectAudioType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];

  v6 = sub_100431C0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "User setting volume %d", (uint8_t *)v9, 8u);
  }

  GEOConfigSetSyncInteger(NavigationConfig_SpokenGuidanceVolumeUserChoice[0], NavigationConfig_SpokenGuidanceVolumeUserChoice[1], a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController voiceVolumeControlDelegate](self, "voiceVolumeControlDelegate"));
  objc_msgSend(v8, "voiceVolumeViewController:selectedVoiceVolumeOption:", self, a4);

  -[NavVoiceVolumeViewController dismissAfterDelay](self, "dismissAfterDelay");
}

- (int64_t)currentSelectionForAudioControlView:(id)a3
{
  return GEOConfigGetInteger(NavigationConfig_SpokenGuidanceVolumeUserChoice[0], NavigationConfig_SpokenGuidanceVolumeUserChoice[1]);
}

- (void)dismissAfterDelay
{
  id v3;
  GCDTimer *v4;
  GCDTimer *dismissTimer;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B2939C;
  v6[3] = &unk_1011AE190;
  objc_copyWeak(&v7, &location);
  v4 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v6, 10.0));
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)headerView
{
  return self->_trayHeader;
}

- (id)contentView
{
  return self->_contentView;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  if (a3 == 2)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v8 = v9 + 150.0;
    goto LABEL_5;
  }
  v4 = -1.0;
  if (a3 == 1)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v6 = v5;
    -[UILayoutGuide layoutFrame](self->_labelGrowLayoutGuide, "layoutFrame");
    v8 = v6 - v7;
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "bottomSafeOffset");
    v4 = v8 + v11;

  }
  return v4;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController voiceVolumeControlDelegate](self, "voiceVolumeControlDelegate", a3, a4));
  objc_msgSend(v5, "dismissVoiceVolumeControlViewController:", self);

}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  v5 = objc_msgSend(v4, "containeeLayout");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v8 = v6;
  if (v5 == (id)1)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v6, "wantsLayout:", v7);

}

- (void)_updateFonts
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController _effectiveTraitCollection](self, "_effectiveTraitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system28BoldCompatibleWithTraitCollection:](UIFont, "system28BoldCompatibleWithTraitCollection:", v4));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavVoiceVolumeViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[NavVoiceVolumeViewController _updateFonts](self, "_updateFonts");
}

- (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

- (id)_effectiveTraitCollection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavVoiceVolumeViewController _maximumContentSizeCategory](self, "_maximumContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, v4));

  return v5;
}

- (NavVoiceVolumeControlContaineeViewControllerDelegate)voiceVolumeControlDelegate
{
  return (NavVoiceVolumeControlContaineeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_voiceVolumeControlDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceVolumeControlDelegate);
  objc_storeStrong(&self->_geoConfigListener, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_labelGrowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_controlView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_trayHeader, 0);
}

@end
