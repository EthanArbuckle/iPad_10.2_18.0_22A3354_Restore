@implementation NavIndicatorsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavIndicatorsViewController)initWithDelegate:(id)a3 pedestrianARSessionStateManager:(id)a4
{
  id v6;
  NavIndicatorsViewController *v7;
  NavIndicatorsViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v6 = a3;
  v20 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NavIndicatorsViewController;
  v7 = -[NavIndicatorsViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  v8 = v7;
  if (v7)
  {
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NavIndicatorsViewController setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v11);

    objc_storeWeak((id *)&v8->_delegate, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v12, "registerObserver:", v8);

    objc_storeStrong((id *)&v8->_pedestrianARSessionStateManager, a4);
    -[PedestrianARSessionStateManager addObserver:](v8->_pedestrianARSessionStateManager, "addObserver:", v8);
    v8->_observingAudioKeys = 1;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = objc_msgSend(&off_101273EF0, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
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
            objc_enumerationMutation(&off_101273EF0);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v8, v17, 0, &off_1011DE940);

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(&off_101273EF0, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }
  }

  return v8;
}

- (void)loadView
{
  PassThroughView *v3;

  v3 = objc_opt_new(PassThroughView);
  -[NavIndicatorsViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  NavSpeedLimitView *v3;
  NavSpeedLimitView *speedLimitView;
  double v5;
  double v6;
  MKCompassView *v7;
  MKCompassView *compassView;
  MKCompassView *v9;
  id v10;
  double v11;
  double v12;
  UIButton *v13;
  UIButton *toggleForceWindshield;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double height;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIButton *v25;
  UIButton *overviewButton;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NavAudioControlView *v35;
  NavAudioControlView *audioControl;
  double v37;
  double v38;
  void *v39;
  UIButton *v40;
  UIButton *pedestrianARButton;
  UIButton *v42;
  void *v43;
  void *v44;
  UIButton *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  UIButton *v56;
  UIButton *ttrButton;
  UIButton *v58;
  void *v59;
  void *v60;
  UIButton *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  NSLayoutConstraint *ttrButtonTopConstraint;
  void *v78;
  void *v79;
  NSLayoutConstraint *v80;
  NSLayoutConstraint *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSLayoutConstraint *v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
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
  id v148;
  _QWORD v149[4];
  id v150;
  _QWORD v151[4];
  id v152;
  id location;
  objc_super v154;
  _QWORD v155[5];
  _QWORD v156[13];
  _QWORD v157[2];

  v154.receiver = self;
  v154.super_class = (Class)NavIndicatorsViewController;
  -[NavIndicatorsViewController viewDidLoad](&v154, "viewDidLoad");
  v3 = objc_opt_new(NavSpeedLimitView);
  speedLimitView = self->_speedLimitView;
  self->_speedLimitView = v3;

  -[NavSpeedLimitView setTranslatesAutoresizingMaskIntoConstraints:](self->_speedLimitView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1148846080;
  -[NavSpeedLimitView setContentCompressionResistancePriority:forAxis:](self->_speedLimitView, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  -[NavSpeedLimitView setContentHuggingPriority:forAxis:](self->_speedLimitView, "setContentHuggingPriority:forAxis:", 1, v6);
  v7 = objc_opt_new(MKCompassView);
  compassView = self->_compassView;
  self->_compassView = v7;

  -[MKCompassView setTranslatesAutoresizingMaskIntoConstraints:](self->_compassView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKCompassView setAlpha:](self->_compassView, "setAlpha:", 0.0);
  -[MKCompassView setAccessibilityIdentifier:](self->_compassView, "setAccessibilityIdentifier:", CFSTR("CompassView"));
  v9 = self->_compassView;
  v10 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_pressedCompass");
  -[MKCompassView addGestureRecognizer:](v9, "addGestureRecognizer:", v10);

  LODWORD(v11) = 1148846080;
  -[MKCompassView setContentCompressionResistancePriority:forAxis:](self->_compassView, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  LODWORD(v12) = 1148846080;
  -[MKCompassView setContentHuggingPriority:forAxis:](self->_compassView, "setContentHuggingPriority:forAxis:", 1, v12);
  -[NavIndicatorsViewController _updateCompassStyling](self, "_updateCompassStyling");
  v13 = objc_opt_new(UIButton);
  toggleForceWindshield = self->_toggleForceWindshield;
  self->_toggleForceWindshield = v13;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_toggleForceWindshield, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  -[UIButton setBackgroundColor:](self->_toggleForceWindshield, "setBackgroundColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_toggleForceWindshield, "layer"));
  objc_msgSend(v16, "setCornerRadius:", 30.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_toggleForceWindshield, "layer"));
  LODWORD(v18) = 1045220557;
  objc_msgSend(v17, "setShadowOpacity:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_toggleForceWindshield, "layer"));
  height = CGSizeZero.height;
  objc_msgSend(v19, "setShadowOffset:", CGSizeZero.width, height);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_toggleForceWindshield, "layer"));
  objc_msgSend(v21, "setShadowRadius:", 1.0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_toggleForceWindshield, "layer"));
  objc_msgSend(v22, "setShadowPathIsBounds:", 1);

  -[UIButton setAccessibilityIdentifier:](self->_toggleForceWindshield, "setAccessibilityIdentifier:", CFSTR("ToggleForceWindshield"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  objc_msgSend(v23, "addSubview:", self->_toggleForceWindshield);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  LODWORD(v10) = objc_msgSend(v24, "shouldForceWindshieldMode");

  if ((_DWORD)v10)
    -[NavIndicatorsViewController _configureForUnforceWindshield](self, "_configureForUnforceWindshield");
  else
    -[NavIndicatorsViewController _configureForForceWindshield](self, "_configureForForceWindshield");
  v25 = objc_opt_new(UIButton);
  overviewButton = self->_overviewButton;
  self->_overviewButton = v25;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_overviewButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  -[UIButton setBackgroundColor:](self->_overviewButton, "setBackgroundColor:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_overviewButton, "layer"));
  objc_msgSend(v28, "setCornerRadius:", 30.0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_overviewButton, "layer"));
  LODWORD(v30) = 1045220557;
  objc_msgSend(v29, "setShadowOpacity:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_overviewButton, "layer"));
  objc_msgSend(v31, "setShadowOffset:", CGSizeZero.width, height);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_overviewButton, "layer"));
  objc_msgSend(v32, "setShadowRadius:", 1.0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_overviewButton, "layer"));
  objc_msgSend(v33, "setShadowPathIsBounds:", 1);

  -[UIButton _setTouchInsets:](self->_overviewButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  -[UIButton setAccessibilityIdentifier:](self->_overviewButton, "setAccessibilityIdentifier:", CFSTR("OverviewButton"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  objc_msgSend(v34, "addSubview:", self->_overviewButton);

  v35 = -[NavAudioControlView initWithDelegate:]([NavAudioControlView alloc], "initWithDelegate:", self);
  audioControl = self->_audioControl;
  self->_audioControl = v35;

  -[NavAudioControlView setAvailableAudioTypes:](self->_audioControl, "setAvailableAudioTypes:", &off_101274148);
  -[NavAudioControlView setTranslatesAutoresizingMaskIntoConstraints:](self->_audioControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v37) = 1148846080;
  -[NavAudioControlView setContentCompressionResistancePriority:forAxis:](self->_audioControl, "setContentCompressionResistancePriority:forAxis:", 1, v37);
  LODWORD(v38) = 1148846080;
  -[NavAudioControlView setContentHuggingPriority:forAxis:](self->_audioControl, "setContentHuggingPriority:forAxis:", 1, v38);
  -[NavAudioControlView _setTouchInsets:](self->_audioControl, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  objc_msgSend(v39, "addSubview:", self->_audioControl);

  v40 = objc_opt_new(UIButton);
  pedestrianARButton = self->_pedestrianARButton;
  self->_pedestrianARButton = v40;

  -[UIButton addTarget:action:forControlEvents:](self->_pedestrianARButton, "addTarget:action:forControlEvents:", self, "_pressedPedestrianAR", 64);
  v42 = self->_pedestrianARButton;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Pedestrian AR [Accessibility]"), CFSTR("localized string not found"), 0));
  -[UIButton setAccessibilityLabel:](v42, "setAccessibilityLabel:", v44);

  v147 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
  v45 = self->_pedestrianARButton;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arkit"), v147));
  -[UIButton setImage:forState:](v45, "setImage:forState:", v46, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_pedestrianARButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v47) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_pedestrianARButton, "setContentCompressionResistancePriority:forAxis:", 1, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  -[UIButton setBackgroundColor:](self->_pedestrianARButton, "setBackgroundColor:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_pedestrianARButton, "layer"));
  objc_msgSend(v49, "setCornerRadius:", 30.0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_pedestrianARButton, "layer"));
  LODWORD(v51) = 1045220557;
  objc_msgSend(v50, "setShadowOpacity:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_pedestrianARButton, "layer"));
  objc_msgSend(v52, "setShadowOffset:", CGSizeZero.width, height);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_pedestrianARButton, "layer"));
  objc_msgSend(v53, "setShadowRadius:", 1.0);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_pedestrianARButton, "layer"));
  objc_msgSend(v54, "setShadowPathIsBounds:", 1);

  -[UIButton _setTouchInsets:](self->_pedestrianARButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  -[UIButton setAccessibilityIdentifier:](self->_pedestrianARButton, "setAccessibilityIdentifier:", CFSTR("PedestrianARButton"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  objc_msgSend(v55, "addSubview:", self->_pedestrianARButton);

  v56 = objc_opt_new(UIButton);
  ttrButton = self->_ttrButton;
  self->_ttrButton = v56;

  -[UIButton addTarget:action:forControlEvents:](self->_ttrButton, "addTarget:action:forControlEvents:", self, "_pressedTTR", 64);
  v58 = self->_ttrButton;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("Tap-to-Radar"), CFSTR("localized string not found"), 0));
  -[UIButton setAccessibilityLabel:](v58, "setAccessibilityLabel:", v60);

  v146 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
  v61 = self->_ttrButton;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ant.circle.fill"), v146));
  -[UIButton setImage:forState:](v61, "setImage:forState:", v62, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_ttrButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v63) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_ttrButton, "setContentCompressionResistancePriority:forAxis:", 1, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  -[UIButton setBackgroundColor:](self->_ttrButton, "setBackgroundColor:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_ttrButton, "layer"));
  objc_msgSend(v65, "setCornerRadius:", 30.0);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_ttrButton, "layer"));
  LODWORD(v67) = 1045220557;
  objc_msgSend(v66, "setShadowOpacity:", v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_ttrButton, "layer"));
  objc_msgSend(v68, "setShadowOffset:", CGSizeZero.width, height);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_ttrButton, "layer"));
  objc_msgSend(v69, "setShadowRadius:", 1.0);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_ttrButton, "layer"));
  objc_msgSend(v70, "setShadowPathIsBounds:", 1);

  -[UIButton _setTouchInsets:](self->_ttrButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  -[UIButton setAccessibilityIdentifier:](self->_ttrButton, "setAccessibilityIdentifier:", CFSTR("TTRButton"));
  -[UIButton setContextMenuInteractionEnabled:](self->_ttrButton, "setContextMenuInteractionEnabled:", 1);
  objc_initWeak(&location, self);
  v151[0] = _NSConcreteStackBlock;
  v151[1] = 3221225472;
  v151[2] = sub_1009D30A4;
  v151[3] = &unk_1011AF8A0;
  objc_copyWeak(&v152, &location);
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Full"), 0, 0, v151));
  v149[0] = _NSConcreteStackBlock;
  v149[1] = 3221225472;
  v149[2] = sub_1009D3190;
  v149[3] = &unk_1011AF8A0;
  objc_copyWeak(&v150, &location);
  v71 = objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Regular"), 0, 0, v149));
  v157[0] = v145;
  v157[1] = v71;
  v108 = (void *)v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v157, 2));
  v142 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", CFSTR("Log archive type"), 0, 0, 1, v72));

  -[UIButton setMenu:](self->_ttrButton, "setMenu:", v142);
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  objc_msgSend(v73, "addSubview:", self->_ttrButton);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_ttrButton, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView bottomAnchor](self->_audioControl, "bottomAnchor"));
  v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 16.0));
  ttrButtonTopConstraint = self->_ttrButtonTopConstraint;
  self->_ttrButtonTopConstraint = v76;

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_ttrButton, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_pedestrianARButton, "bottomAnchor"));
  v80 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, 16.0));
  v81 = self->_ttrButtonTopConstraint;
  self->_ttrButtonTopConstraint = v80;

  v140 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_overviewButton, "trailingAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trailingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToAnchor:constant:", v138, -16.0));
  v156[0] = v136;
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_overviewButton, "widthAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToConstant:", 60.0));
  v156[1] = v132;
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_overviewButton, "heightAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToConstant:", 60.0));
  v156[2] = v129;
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView trailingAnchor](self->_audioControl, "trailingAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "trailingAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:constant:", v127, -16.0));
  v156[3] = v125;
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView topAnchor](self->_audioControl, "topAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_overviewButton, "bottomAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:constant:", v123, 16.0));
  v156[4] = v122;
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_pedestrianARButton, "trailingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "trailingAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:constant:", v119, -16.0));
  v156[5] = v118;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_pedestrianARButton, "topAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView bottomAnchor](self->_audioControl, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:constant:", v116, 16.0));
  v156[6] = v115;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_pedestrianARButton, "widthAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToConstant:", 60.0));
  v156[7] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_pedestrianARButton, "heightAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_pedestrianARButton, "widthAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v111));
  v156[8] = v110;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_ttrButton, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "trailingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:", v83, -16.0));
  v156[9] = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_ttrButton, "widthAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToConstant:", 60.0));
  v156[10] = v86;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_ttrButton, "heightAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_ttrButton, "widthAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v88));
  v90 = self->_ttrButtonTopConstraint;
  v156[11] = v89;
  v156[12] = v90;
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 13));
  v148 = objc_msgSend(v91, "mutableCopy");

  v92 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  if (!objc_msgSend(v92, "enableWindshieldOverrideButton"))
  {

    goto LABEL_8;
  }
  v93 = sub_100424728();

  if (!v93)
  {
LABEL_8:
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_overviewButton, "topAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "topAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v96, 16.0));
    objc_msgSend(v148, "addObject:", v97);
    v103 = 1;
    goto LABEL_9;
  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_toggleForceWindshield, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v96, -16.0));
  v155[0] = v97;
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_toggleForceWindshield, "topAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "topAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:constant:", v139, 16.0));
  v155[1] = v137;
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_toggleForceWindshield, "widthAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToConstant:", 60.0));
  v155[2] = v133;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_toggleForceWindshield, "heightAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToConstant:", 60.0));
  v155[3] = v98;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_overviewButton, "topAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_toggleForceWindshield, "bottomAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100, 16.0));
  v155[4] = v101;
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v155, 5));
  objc_msgSend(v148, "addObjectsFromArray:", v102);

  v103 = 0;
LABEL_9:

  -[UIButton setHidden:](self->_toggleForceWindshield, "setHidden:", v103);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v148);
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "route"));

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
  -[NavIndicatorsViewController setCurrentVoiceGuidanceLevel:](self, "setCurrentVoiceGuidanceLevel:", objc_msgSend(v106, "guidanceLevelForTransportType:", objc_msgSend(v105, "transportType")));

  -[NavIndicatorsViewController setRoute:](self, "setRoute:", v105);
  v107 = &_dispatch_main_q;
  _GEOConfigAddDelegateListenerForKey(MapsConfig_NavigationShowSpeedLimit, off_1014B2FE8, &_dispatch_main_q, self);

  _GEOConfigAddDelegateListenerForKey(MapsConfig_NavigationShowHeading, off_1014B2FD8, &_dispatch_main_q, self);
  objc_destroyWeak(&v150);

  objc_destroyWeak(&v152);
  objc_destroyWeak(&location);

}

- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NavSpeedLimitView *speedLimitView;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  NavSpeedLimitView *v16;
  __int16 v17;
  _BOOL4 v18;

  v4 = (uint64_t (**)(id, void *))a3;
  -[NavIndicatorsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v6 = v4[2](v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = sub_100432E6C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    speedLimitView = self->_speedLimitView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView superview](speedLimitView, "superview"));
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = speedLimitView;
    v17 = 1024;
    v18 = v11 != 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Inserting %{public}@ below %{public}@ (hasSuperview: %d)", (uint8_t *)&v13, 0x1Cu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  objc_msgSend(v12, "insertSubview:belowSubview:", v7, self->_speedLimitView);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavIndicatorsViewController;
  v4 = a3;
  -[NavIndicatorsViewController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  -[NavIndicatorsViewController _updateCompassStyling](self, "_updateCompassStyling");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController traitCollection](self, "traitCollection"));
  v6 = sub_1002A8A0C(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "isLuminanceReduced");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1009D34C0;
    v9[3] = &unk_1011AC860;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v8, v9);
  }
}

- (void)dealloc
{
  _UNKNOWN **v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  if (self->_observingAudioKeys)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = &off_101273EF0;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          objc_msgSend(v9, "removeObserver:forKeyPath:", self, v8);

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
  -[PedestrianARSessionStateManager removeObserver:](self->_pedestrianARSessionStateManager, "removeObserver:", self);
  v10.receiver = self;
  v10.super_class = (Class)NavIndicatorsViewController;
  -[NavIndicatorsViewController dealloc](&v10, "dealloc");
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  double v13;
  double v14;
  _QWORD v15[6];
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  __CFString *v19;

  if (self->_controlsHidden != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_controlsHidden = a3;
    v7 = sub_100432E6C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v5)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      if (v4)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setControlsHidden: %{public}@ animated: %@", buf, 0x16u);

    }
    if (v5)
      v13 = 0.0;
    else
      v13 = 1.0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v14 = 0.25;
    v15[2] = sub_1009D3804;
    v15[3] = &unk_1011AD518;
    if (!v4)
      v14 = 0.0;
    v15[4] = self;
    *(double *)&v15[5] = v13;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v15, v14);
  }
}

- (void)setIndicatorsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  double v13;
  _QWORD v14[5];
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  __CFString *v18;

  if (self->_indicatorsHidden != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_indicatorsHidden = a3;
    v7 = sub_100432E6C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v5)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      if (v4)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setIndicatorsHidden: %{public}@ animated: %@", buf, 0x16u);

    }
    v13 = 0.0;
    if (v4)
      v13 = 0.25;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1009D39F8;
    v14[3] = &unk_1011AC860;
    v14[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v14, v13);
    -[NavIndicatorsViewController _animateSpeedLimitViewAnimated:](self, "_animateSpeedLimitViewAnimated:", v4);
  }
}

- (double)_compassViewAlpha
{
  void *v3;
  unsigned __int8 v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "isLuminanceReduced");

  v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    if ((id)-[NavIndicatorsViewController indicatorsType](self, "indicatorsType") == (id)1)
    {
      v5 = 1.0;
      if (self->_temporarilyShowingCompass)
        return v5;
    }
    else if (self->_indicatorsHidden)
    {
      return v5;
    }
    if (-[NavIndicatorsViewController _alwaysShowCompass](self, "_alwaysShowCompass"))
      return 1.0;
    else
      return 0.0;
  }
  return v5;
}

- (double)_speedLimitViewAlpha
{
  double result;
  int BOOL;
  void *v5;
  unsigned int v6;
  BOOL v7;
  int v8;

  result = 0.0;
  if (!self->_indicatorsHidden)
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_NavigationShowSpeedLimit, off_1014B2FE8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController route](self, "route"));
    v6 = objc_msgSend(v5, "transportType");
    if (v6)
      v7 = v6 == 3;
    else
      v7 = 1;
    v8 = v7;

    result = 0.0;
    if ((BOOL & v8) != 0)
      return 1.0;
  }
  return result;
}

- (void)setIndicatorsType:(unint64_t)a3
{
  -[NavIndicatorsViewController _setIndicatorsType:route:](self, "_setIndicatorsType:route:", a3, self->_route);
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
  -[MKCompassView setYaw:](self->_compassView, "setYaw:");
}

- (void)setRoute:(id)a3
{
  -[NavIndicatorsViewController _setIndicatorsType:route:](self, "_setIndicatorsType:route:", self->_indicatorsType, a3);
}

- (AudioPreferences)audioPreferences
{
  AudioPreferences *audioPreferences;
  AudioPreferences *v4;
  void *v5;
  AudioPreferences *v6;
  AudioPreferences *v7;

  audioPreferences = self->_audioPreferences;
  if (!audioPreferences)
  {
    v4 = [AudioPreferences alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = -[AudioPreferences initWithDefaults:](v4, "initWithDefaults:", v5);
    v7 = self->_audioPreferences;
    self->_audioPreferences = v6;

    audioPreferences = self->_audioPreferences;
  }
  return audioPreferences;
}

- (NSLayoutConstraint)speedLimitToViewTopConstraint
{
  NSLayoutConstraint *speedLimitToViewTopConstraint;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *v8;

  speedLimitToViewTopConstraint = self->_speedLimitToViewTopConstraint;
  if (!speedLimitToViewTopConstraint)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView topAnchor](self->_speedLimitView, "topAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 16.0));
    v8 = self->_speedLimitToViewTopConstraint;
    self->_speedLimitToViewTopConstraint = v7;

    speedLimitToViewTopConstraint = self->_speedLimitToViewTopConstraint;
  }
  return speedLimitToViewTopConstraint;
}

- (NSLayoutConstraint)speedLimitToCompassBottomConstraint
{
  NSLayoutConstraint *speedLimitToCompassBottomConstraint;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *v7;

  speedLimitToCompassBottomConstraint = self->_speedLimitToCompassBottomConstraint;
  if (!speedLimitToCompassBottomConstraint)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView topAnchor](self->_speedLimitView, "topAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKCompassView bottomAnchor](self->_compassView, "bottomAnchor"));
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 16.0));
    v7 = self->_speedLimitToCompassBottomConstraint;
    self->_speedLimitToCompassBottomConstraint = v6;

    speedLimitToCompassBottomConstraint = self->_speedLimitToCompassBottomConstraint;
  }
  return speedLimitToCompassBottomConstraint;
}

- (void)_setIndicatorsType:(unint64_t)a3 route:(id)a4
{
  unint64_t indicatorsType;
  unint64_t v8;
  void *v9;
  unsigned __int8 v10;
  unint64_t v11;

  v11 = (unint64_t)a4;
  indicatorsType = self->_indicatorsType;
  v8 = self->_route;
  v9 = (void *)v8;
  if (v11 | v8)
    v10 = objc_msgSend((id)v8, "isEqual:");
  else
    v10 = 1;

  if (indicatorsType != a3 || (v10 & 1) == 0)
  {
    self->_indicatorsType = a3;
    objc_storeStrong((id *)&self->_route, a4);
    if ((v10 & 1) != 0)
      -[NavIndicatorsViewController _updateOverviewButton](self, "_updateOverviewButton");
    else
      -[NavIndicatorsViewController _updateContent](self, "_updateContent");
  }

}

- (BOOL)_alwaysShowCompass
{
  return GEOConfigGetBOOL(MapsConfig_NavigationShowHeading, off_1014B2FD8);
}

- (void)_insertCompassView
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
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  _QWORD v16[5];

  v15 = objc_opt_new(NSMutableArray);
  -[MKCompassView removeFromSuperview](self->_compassView, "removeFromSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  objc_msgSend(v3, "addSubview:", self->_compassView);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1009D4000;
  v16[3] = &unk_1011AC860;
  v16[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKCompassView leadingAnchor](self->_compassView, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 16.0));
  -[NSMutableArray addObject:](v15, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKCompassView topAnchor](self->_compassView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 16.0));
  -[NSMutableArray addObject:](v15, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView superview](self->_speedLimitView, "superview"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToViewTopConstraint](self, "speedLimitToViewTopConstraint"));
    -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v13, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToCompassBottomConstraint](self, "speedLimitToCompassBottomConstraint"));
    -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v14, 1);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)_removeCompassView
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView superview](self->_speedLimitView, "superview"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToCompassBottomConstraint](self, "speedLimitToCompassBottomConstraint"));
    -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v4, 0);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToViewTopConstraint](self, "speedLimitToViewTopConstraint"));
    -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v5, 1);

  }
}

- (void)_setConstraint:(id)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  unsigned __int8 v21;
  uint8_t buf[4];
  void *v23;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (!v4)
    goto LABEL_8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));
  v11 = v8;
  v12 = v10;
  if (!(v11 | v12))
  {
    v13 = 0;
    v11 = 0;
LABEL_7:

LABEL_8:
    objc_msgSend(v6, "setActive:", v4);
    goto LABEL_9;
  }
  v13 = (void *)v12;
  v14 = objc_msgSend((id)v11, "isEqual:", v12);

  if ((v14 & 1) != 0)
    goto LABEL_7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstItem"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondItem"));
  if ((objc_msgSend(v15, "isDescendantOfView:", v16) & 1) != 0)
  {

    goto LABEL_7;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstItem"));
  v21 = objc_msgSend(v17, "isDescendantOfView:", v18);

  if ((v21 & 1) != 0)
    goto LABEL_8;
  v19 = sub_100432E6C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Misuse of constraint: %@", buf, 0xCu);
  }

LABEL_9:
}

- (void)_updateContent
{
  NSMutableArray *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  MKCompassView *compassView;
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
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  _UNKNOWN **v38;
  UIButton **p_pedestrianARButton;
  void *v40;
  void *v41;
  NavAudioControlView **p_audioControl;
  void *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *ttrButtonTopConstraint;
  uint64_t v46;
  void *v47;
  int v48;
  _BYTE v49[10];
  _BOOL4 v50;

  v3 = objc_opt_new(NSMutableArray);
  -[NavIndicatorsViewController _compassViewAlpha](self, "_compassViewAlpha");
  v5 = v4;
  -[NavIndicatorsViewController _speedLimitViewAlpha](self, "_speedLimitViewAlpha");
  v7 = v6;
  v8 = sub_100432E6C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v48 = 67109376;
    *(_DWORD *)v49 = v5 > 0.0;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v7 > 0.0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Drawing content with compass: %d speed limit: %d", (uint8_t *)&v48, 0xEu);
  }

  compassView = self->_compassView;
  if (v5 <= 0.0)
  {
    -[MKCompassView removeFromSuperview](compassView, "removeFromSuperview");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKCompassView superview](compassView, "superview"));

    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
      objc_msgSend(v12, "addSubview:", self->_compassView);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKCompassView leadingAnchor](self->_compassView, "leadingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 16.0));
      -[NSMutableArray addObject:](v3, "addObject:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MKCompassView topAnchor](self->_compassView, "topAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 16.0));
      -[NSMutableArray addObject:](v3, "addObject:", v20);

    }
  }
  -[MKCompassView setAlpha:](self->_compassView, "setAlpha:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView superview](self->_speedLimitView, "superview"));
  v22 = v21;
  if (v7 <= 0.0)
  {

    if (v22)
    {
      v32 = sub_100432E6C();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(v48) = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Removing speedLimitView from the view hierarchy", (uint8_t *)&v48, 2u);
      }

      -[NavSpeedLimitView removeFromSuperview](self->_speedLimitView, "removeFromSuperview");
    }
  }
  else
  {

    if (!v22)
    {
      v23 = sub_100432E6C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v48 = 136315394;
        *(_QWORD *)v49 = "-[NavIndicatorsViewController _updateContent]";
        *(_WORD *)&v49[8] = 1024;
        v50 = v5 > 0.0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s: Inserting speedLimitView into the view hierarchy, below compass: %d", (uint8_t *)&v48, 0x12u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
      objc_msgSend(v25, "addSubview:", self->_speedLimitView);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView leadingAnchor](self->_speedLimitView, "leadingAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, 16.0));
      -[NSMutableArray addObject:](v3, "addObject:", v29);

    }
    if (v5 <= 0.0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToCompassBottomConstraint](self, "speedLimitToCompassBottomConstraint"));
      -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v34, 0);

      v31 = objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToViewTopConstraint](self, "speedLimitToViewTopConstraint"));
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToViewTopConstraint](self, "speedLimitToViewTopConstraint"));
      -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v30, 0);

      v31 = objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToCompassBottomConstraint](self, "speedLimitToCompassBottomConstraint"));
    }
    v35 = (void *)v31;
    -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v31, 1);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
  -[NavIndicatorsViewController _updateOverviewButton](self, "_updateOverviewButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController route](self, "route"));
  v37 = objc_msgSend(v36, "transportType");

  if (v37)
    v38 = &off_101274178;
  else
    v38 = &off_101274160;
  -[NavAudioControlView setAvailableAudioTypes:](self->_audioControl, "setAvailableAudioTypes:", v38);
  -[NavAudioControlView setCurrentAudioType:](self->_audioControl, "setCurrentAudioType:", +[NavAudioControlView navAudioTypeForGuidanceLevel:](NavAudioControlView, "navAudioTypeForGuidanceLevel:", -[NavIndicatorsViewController currentVoiceGuidanceLevel](self, "currentVoiceGuidanceLevel")));
  if (-[PedestrianARSessionStateManager shouldShowPedestrianAR](self->_pedestrianARSessionStateManager, "shouldShowPedestrianAR"))
  {
    p_pedestrianARButton = &self->_pedestrianARButton;
    -[UIButton setHidden:](self->_pedestrianARButton, "setHidden:", 0);
  }
  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    p_pedestrianARButton = &self->_pedestrianARButton;
    -[UIButton setHidden:](self->_pedestrianARButton, "setHidden:", objc_msgSend(v40, "BOOLForKey:", CFSTR("PedestrianARForceShowAffordanceKey")) ^ 1);

  }
  -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", self->_ttrButtonTopConstraint, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_ttrButton, "topAnchor"));
  if (-[UIButton isHidden](*p_pedestrianARButton, "isHidden"))
    p_audioControl = &self->_audioControl;
  else
    p_audioControl = (NavAudioControlView **)p_pedestrianARButton;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView bottomAnchor](*p_audioControl, "bottomAnchor"));
  v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, 16.0));
  ttrButtonTopConstraint = self->_ttrButtonTopConstraint;
  self->_ttrButtonTopConstraint = v44;

  v46 = 1;
  -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", self->_ttrButtonTopConstraint, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (objc_msgSend(v47, "isInternalInstall"))
    v46 = GEOConfigGetBOOL(MapsConfig_EnableTapToRadarFloatingControlButton, off_1014B4B48) ^ 1;
  -[UIButton setHidden:](self->_ttrButton, "setHidden:", v46);

}

- (void)_updateCompassStyling
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle") != (id)2;

  -[MKCompassView setCompassViewSize:style:](self->_compassView, "setCompassViewSize:style:", 2, v4);
}

- (void)_updateOverviewButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIButton **p_overviewButton;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 22.0));
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "background"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "background"));
  objc_msgSend(v7, "setCornerRadius:", 30.0);

  objc_msgSend(v3, "setCornerStyle:", -1);
  if ((id)-[NavIndicatorsViewController indicatorsType](self, "indicatorsType") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location.north.line.fill")));
    objc_msgSend(v3, "setImage:", v8);

    objc_msgSend(v3, "contentInsets");
    v10 = v9;
    objc_msgSend(v3, "contentInsets");
    v12 = v11;
    objc_msgSend(v3, "contentInsets");
    v14 = v13 + 3.0;
    objc_msgSend(v3, "contentInsets");
    objc_msgSend(v3, "setContentInsets:", v10, v12, v14);
    p_overviewButton = &self->_overviewButton;
    -[UIButton removeTarget:action:forControlEvents:](self->_overviewButton, "removeTarget:action:forControlEvents:", self, "_pressedViewOverview", 64);
    -[UIButton addTarget:action:forControlEvents:](self->_overviewButton, "addTarget:action:forControlEvents:", self, "_pressedViewTbT", 64);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = v16;
    v18 = CFSTR("[Overview] Turn-by-Turn Mode");
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("CameraModeOverview")));
    objc_msgSend(v3, "setImage:", v19);

    p_overviewButton = &self->_overviewButton;
    -[UIButton removeTarget:action:forControlEvents:](self->_overviewButton, "removeTarget:action:forControlEvents:", self, "_pressedViewTbT", 64);
    -[UIButton addTarget:action:forControlEvents:](self->_overviewButton, "addTarget:action:forControlEvents:", self, "_pressedViewOverview", 64);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = v16;
    v18 = CFSTR("[Overview] Overview Mode");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, CFSTR("localized string not found"), 0));
  -[UIButton setAccessibilityLabel:](*p_overviewButton, "setAccessibilityLabel:", v20);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1009D4BC4;
  v22[3] = &unk_1011AC8B0;
  v22[4] = self;
  v23 = v3;
  v21 = v3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);

}

- (void)_configureForForceWindshield
{
  UIButton *toggleForceWindshield;
  void *v4;
  id v5;

  -[UIButton removeTarget:action:forControlEvents:](self->_toggleForceWindshield, "removeTarget:action:forControlEvents:", self, "_pressedUnforceWindshield", 64);
  -[UIButton addTarget:action:forControlEvents:](self->_toggleForceWindshield, "addTarget:action:forControlEvents:", self, "_pressedForceWindshield", 64);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
  toggleForceWindshield = self->_toggleForceWindshield;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("w.circle"), v5));
  -[UIButton setImage:forState:](toggleForceWindshield, "setImage:forState:", v4, 0);

}

- (void)_configureForUnforceWindshield
{
  UIButton *toggleForceWindshield;
  void *v4;
  id v5;

  -[UIButton removeTarget:action:forControlEvents:](self->_toggleForceWindshield, "removeTarget:action:forControlEvents:", self, "_pressedForceWindshield", 64);
  -[UIButton addTarget:action:forControlEvents:](self->_toggleForceWindshield, "addTarget:action:forControlEvents:", self, "_pressedUnforceWindshield", 64);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
  toggleForceWindshield = self->_toggleForceWindshield;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("w.circle.fill"), v5));
  -[UIButton setImage:forState:](toggleForceWindshield, "setImage:forState:", v4, 0);

}

- (void)_pressedForceWindshield
{
  id v2;

  -[NavIndicatorsViewController _configureForUnforceWindshield](self, "_configureForUnforceWindshield");
  v2 = (id)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v2, "setShouldForceWindshieldMode:", 1);

}

- (void)_pressedUnforceWindshield
{
  id v2;

  -[NavIndicatorsViewController _configureForForceWindshield](self, "_configureForForceWindshield");
  v2 = (id)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v2, "setShouldForceWindshieldMode:", 0);

}

- (void)_pressedViewOverview
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100432E6C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Switching to overview mode", v6, 2u);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9017, 505, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController delegate](self, "delegate"));
  objc_msgSend(v5, "switchToOverviewMode");

  -[NavIndicatorsViewController _animateInCompassIfNeededWithTimeout:](self, "_animateInCompassIfNeededWithTimeout:", 1);
  -[NavIndicatorsViewController _animateSpeedLimitViewAnimated:](self, "_animateSpeedLimitViewAnimated:", 1);
}

- (void)_pressedViewTbT
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100432E6C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Switching to zoomed in mode", v6, 2u);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9018, 505, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController delegate](self, "delegate"));
  objc_msgSend(v5, "switchToZoomedInMode");

  -[NavIndicatorsViewController _animateOutCompassIfNeeded](self, "_animateOutCompassIfNeeded");
  -[NavIndicatorsViewController _animateSpeedLimitViewAnimated:](self, "_animateSpeedLimitViewAnimated:", 1);
}

- (void)_pressedPedestrianAR
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController delegate](self, "delegate"));
  objc_msgSend(v2, "enterPedestrianAR");

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 126, 402, 0);
}

- (void)_pressedTTR
{
  id v3;
  NSObject *v4;
  NavIndicatorsViewController *v5;
  NavIndicatorsViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_100432E6C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from nav indicators", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v13, "launchTTR");

}

- (void)_pressedCompass
{
  void *v3;

  if ((id)-[NavIndicatorsViewController indicatorsType](self, "indicatorsType") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController delegate](self, "delegate"));
    objc_msgSend(v3, "toggleHeadingMode");

    -[NavIndicatorsViewController _animateOutCompassIfNeeded](self, "_animateOutCompassIfNeeded");
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 1040, 505, 0);
  }
}

- (void)_updateAudioPreferences
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
  objc_msgSend(v3, "loadValuesFromDefaults");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController route](self, "route"));
  -[NavIndicatorsViewController setCurrentVoiceGuidanceLevel:](self, "setCurrentVoiceGuidanceLevel:", objc_msgSend(v4, "guidanceLevelForTransportType:", objc_msgSend(v5, "transportType")));

  v6 = sub_100432E6C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NavIndicatorsViewController currentVoiceGuidanceLevel](self, "currentVoiceGuidanceLevel");
    if (v8 + 1 >= 4)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v8));
    else
      v9 = *(&off_1011DE980 + v8 + 1);
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated voice guidance level from audio preferences: %@", buf, 0xCu);

  }
  -[NavIndicatorsViewController _updateContent](self, "_updateContent");
}

- (unint64_t)_guidanceLevel:(unint64_t)a3 supportingTransportType:(int)a4
{
  unint64_t v4;
  unint64_t v5;

  if (a3 == 1)
    v4 = 0;
  else
    v4 = a3;
  if (a4)
    v5 = 0;
  else
    v5 = a3;
  if ((a4 - 2) >= 2)
    return v5;
  else
    return v4;
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  NavSpeedLimitView *speedLimitView;
  id v6;
  uint64_t v7;
  NavSpeedLimitView *v8;
  id v9;
  id v10;

  speedLimitView = self->_speedLimitView;
  v6 = a4;
  LODWORD(speedLimitView) = -[NavSpeedLimitView isVisible](speedLimitView, "isVisible");
  v7 = objc_msgSend(v6, "speedLimitIsMPH") ^ 1;
  v8 = self->_speedLimitView;
  v9 = objc_msgSend(v6, "speedLimit");
  v10 = objc_msgSend(v6, "speedLimitShieldType");

  -[NavSpeedLimitView setSpeedLimit:units:shieldType:](v8, "setSpeedLimit:units:shieldType:", v9, v7, v10);
  if ((_DWORD)speedLimitView != -[NavSpeedLimitView isVisible](self->_speedLimitView, "isVisible"))
    -[NavIndicatorsViewController _updateContent](self, "_updateContent");
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[NavIndicatorsViewController setRoute:](self, "setRoute:", a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;

  v6 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
  v10 = objc_msgSend(v9, "guidanceLevelForTransportType:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController route](self, "route"));
  v13 = objc_msgSend(v11, "guidanceLevelForTransportType:", objc_msgSend(v12, "transportType"));

  v14 = -[NavIndicatorsViewController _guidanceLevel:supportingTransportType:](self, "_guidanceLevel:supportingTransportType:", v13, v6);
  v15 = sub_100432E6C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v10 == (id)v14)
  {
    if (!v17)
      goto LABEL_22;
    if (v6 >= 7)
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6));
    else
      v18 = *(&off_1011DE948 + (int)v6);
    v20 = v18;
    if ((unint64_t)v10 + 1 >= 4)
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v10));
    else
      v21 = *(&off_1011DE980 + (_QWORD)v10 + 1);
    *(_DWORD *)buf = 138412546;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Transport type changed. Guidance level for '%@' is '%@'", buf, 0x16u);

  }
  else
  {
    if (!v17)
      goto LABEL_22;
    if (v6 >= 7)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6));
    else
      v19 = *(&off_1011DE948 + (int)v6);
    v20 = v19;
    if ((unint64_t)v10 + 1 >= 4)
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v10));
    else
      v22 = *(&off_1011DE980 + (_QWORD)v10 + 1);
    v21 = v22;
    if (v14 + 1 >= 4)
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v14));
    else
      v23 = *(&off_1011DE980 + v14 + 1);
    *(_DWORD *)buf = 138412802;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    v30 = 2112;
    v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Transport type changed. Updating guidance level for '%@' from '%@' to '%@'", buf, 0x20u);

  }
LABEL_22:

  -[NavIndicatorsViewController setCurrentVoiceGuidanceLevel:](self, "setCurrentVoiceGuidanceLevel:", v10);
  -[NavIndicatorsViewController setRoute:](self, "setRoute:", v8);

  if (v10 != (id)v14)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
    objc_msgSend(v24, "setGuidanceLevel:forTransportType:", v14, v6);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
    objc_msgSend(v25, "synchronize");

  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  BOOL v3;
  BOOL v4;

  v3 = a3.var0 == (_DWORD)MapsConfig_NavigationShowSpeedLimit && a3.var1 == off_1014B2FE8;
  if (v3 || (a3.var0 == (_DWORD)MapsConfig_NavigationShowHeading ? (v4 = a3.var1 == off_1014B2FD8) : (v4 = 0), v4))
    -[NavIndicatorsViewController _updateContent](self, "_updateContent");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10 && a6 == &off_1011DE940 && objc_msgSend(&off_101273EF0, "containsObject:", v10))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009D581C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NavIndicatorsViewController;
    -[NavIndicatorsViewController observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = 1;
  if (a4 != 1)
    v5 = 2;
  if (a4 == 2)
    v6 = 0;
  else
    v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController route](self, "route"));
  objc_msgSend(v7, "setGuidanceLevel:forTransportType:", v6, objc_msgSend(v8, "transportType"));

  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController audioPreferences](self, "audioPreferences"));
  objc_msgSend(v9, "synchronize");

}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  if ((id)-[NavIndicatorsViewController indicatorsType](self, "indicatorsType", a3, a4.x, a4.y) == (id)1)
    -[NavIndicatorsViewController _animateInCompassIfNeededWithTimeout:](self, "_animateInCompassIfNeededWithTimeout:", 1);
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  if ((id)-[NavIndicatorsViewController indicatorsType](self, "indicatorsType", a3) == (id)1)
    -[NavIndicatorsViewController _animateInCompassIfNeededWithTimeout:](self, "_animateInCompassIfNeededWithTimeout:", 0);
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  if ((id)-[NavIndicatorsViewController indicatorsType](self, "indicatorsType", a3) == (id)1)
    -[NavIndicatorsViewController _animateInCompassIfNeededWithTimeout:](self, "_animateInCompassIfNeededWithTimeout:", 0);
}

- (void)_animateInCompassIfNeededWithTimeout:(BOOL)a3
{
  _QWORD *v4;
  void *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  BOOL v10;

  self->_temporarilyShowingCompass = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009D5A8C;
  v9[3] = &unk_1011ACE58;
  v10 = a3;
  v9[4] = self;
  v4 = objc_retainBlock(v9);
  ((void (*)(void))v4[2])();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKCompassView superview](self->_compassView, "superview"));

  if (!v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1009D5AB0;
    v8[3] = &unk_1011AC860;
    v8[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009D5B20;
    v6[3] = &unk_1011B1B90;
    v7 = v4;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v6, 0.25);

  }
}

- (void)_scheduleTimerToDismissCompass
{
  double Double;
  id v4;
  GCDTimer *v5;
  GCDTimer *compassDismissTimer;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  Double = GEOConfigGetDouble(MapsConfig_NavigationCompassAutoHideTimeout, off_1014B3008);
  v4 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009D5C40;
  v7[3] = &unk_1011AE190;
  objc_copyWeak(&v8, &location);
  v5 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v7, Double));
  compassDismissTimer = self->_compassDismissTimer;
  self->_compassDismissTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_animateOutCompassIfNeeded
{
  GCDTimer *compassDismissTimer;
  _QWORD v4[5];
  _QWORD v5[5];

  self->_temporarilyShowingCompass = 0;
  compassDismissTimer = self->_compassDismissTimer;
  self->_compassDismissTimer = 0;

  if (!-[NavIndicatorsViewController _alwaysShowCompass](self, "_alwaysShowCompass"))
  {
    v4[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1009D5D28;
    v5[3] = &unk_1011AC860;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1009D5D98;
    v4[3] = &unk_1011AE8F8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v5, v4, 0.25, 0.0);
  }
}

- (void)_animateSpeedLimitViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  _QWORD v20[6];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  _BOOL4 v24;

  v3 = a3;
  -[NavIndicatorsViewController _speedLimitViewAlpha](self, "_speedLimitViewAlpha");
  v6 = v5;
  if (v5 > 0.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView superview](self->_speedLimitView, "superview"));

    if (!v7)
    {
      -[NavIndicatorsViewController _compassViewAlpha](self, "_compassViewAlpha");
      v9 = v8;
      v10 = sub_100432E6C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[NavIndicatorsViewController _animateSpeedLimitViewAnimated:]";
        v23 = 1024;
        v24 = v9 > 0.0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: Inserting speedLimitView into the view hierarchy, below compass: %d", buf, 0x12u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
      objc_msgSend(v12, "addSubview:", self->_speedLimitView);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView leadingAnchor](self->_speedLimitView, "leadingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 16.0));
      objc_msgSend(v16, "setActive:", 1);

      if (v9 <= 0.0)
        v17 = objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToViewTopConstraint](self, "speedLimitToViewTopConstraint"));
      else
        v17 = objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitToCompassBottomConstraint](self, "speedLimitToCompassBottomConstraint"));
      v18 = (void *)v17;
      -[NavIndicatorsViewController _setConstraint:active:](self, "_setConstraint:active:", v17, 1);

    }
  }
  v19 = 0.0;
  if (v3)
    v19 = 0.25;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1009D5FD0;
  v20[3] = &unk_1011AD518;
  v20[4] = self;
  *(double *)&v20[5] = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v20, 0, v19, 0.0);
}

- (NavIndicatorsViewControllerDelegate)delegate
{
  return (NavIndicatorsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)indicatorsType
{
  return self->_indicatorsType;
}

- (NavSpeedLimitView)speedLimitView
{
  return self->_speedLimitView;
}

- (double)yaw
{
  return self->_yaw;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setAudioPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_audioPreferences, a3);
}

- (unint64_t)currentVoiceGuidanceLevel
{
  return self->_currentVoiceGuidanceLevel;
}

- (void)setCurrentVoiceGuidanceLevel:(unint64_t)a3
{
  self->_currentVoiceGuidanceLevel = a3;
}

- (void)setSpeedLimitToViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_speedLimitToViewTopConstraint, a3);
}

- (void)setSpeedLimitToCompassBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_speedLimitToCompassBottomConstraint, a3);
}

- (NSLayoutConstraint)ttrButtonTopConstraint
{
  return self->_ttrButtonTopConstraint;
}

- (void)setTtrButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ttrButtonTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_speedLimitToCompassBottomConstraint, 0);
  objc_storeStrong((id *)&self->_speedLimitToViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_audioPreferences, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_speedLimitView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toggleForceWindshield, 0);
  objc_storeStrong((id *)&self->_compassDismissTimer, 0);
  objc_storeStrong((id *)&self->_ttrButton, 0);
  objc_storeStrong((id *)&self->_pedestrianARSessionStateManager, 0);
  objc_storeStrong((id *)&self->_pedestrianARButton, 0);
  objc_storeStrong((id *)&self->_audioControl, 0);
  objc_storeStrong((id *)&self->_overviewButton, 0);
  objc_storeStrong((id *)&self->_compassView, 0);
}

@end
