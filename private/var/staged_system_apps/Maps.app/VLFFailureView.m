@implementation VLFFailureView

- (VLFFailureView)initWithFrame:(CGRect)a3
{
  VLFFailureView *v3;
  VLFFailureView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  VLFSessionStateManager *stateManager;
  uint64_t v12;
  UIButton *retryButton;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v17;
  UIButton *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *retryButtonHeightConstraint;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  UIButton *dismissButton;
  void *v35;
  void *v36;
  UIButton *v37;
  void *v38;
  UIButton *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *dismissButtonHeightConstraint;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UIView *v53;
  UIView *topContentView;
  void *v55;
  void *v56;
  uint64_t v57;
  NSLayoutConstraint *topConstraint;
  void *v59;
  void *v60;
  uint64_t v61;
  NSLayoutConstraint *buttonPaddingConstraint;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  UIView *v70;
  UIView *textContainerView;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  double y;
  double width;
  double height;
  UILabel *v84;
  UILabel *titleLabel;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSLayoutConstraint *titleLabelLeadingConstraint;
  void *v94;
  void *v95;
  uint64_t v96;
  NSLayoutConstraint *titleLabelTrailingConstraint;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  UILabel *v102;
  UILabel *descriptionLabel;
  void *v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  id v108;
  NSObject *v109;
  id v110;
  NSObject *v111;
  char *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  NSLayoutConstraint *labelPaddingConstraint;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
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
  objc_super v142;
  _QWORD v143[4];
  uint8_t buf[4];
  const char *v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  int v149;
  __int16 v150;
  const char *v151;
  _QWORD v152[3];
  _QWORD v153[5];
  _QWORD v154[4];
  _QWORD v155[4];
  _QWORD v156[4];

  v142.receiver = self;
  v142.super_class = (Class)VLFFailureView;
  v3 = -[VLFFailureView initWithFrame:](&v142, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentLayout = 2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "auxiliaryTasksManager"));
    v8 = objc_msgSend(v7, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    v140 = v9;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateManager"));
    stateManager = v4->_stateManager;
    v4->_stateManager = (VLFSessionStateManager *)v10;

    -[VLFSessionStateManager addObserver:](v4->_stateManager, "addObserver:", v4);
    -[VLFFailureView _updateBackgroundColor](v4, "_updateBackgroundColor");
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    retryButton = v4->_retryButton;
    v4->_retryButton = (UIButton *)v12;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_retryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v4->_retryButton, "layer"));
    objc_msgSend(v14, "setCornerRadius:", 8.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIButton setBackgroundColor:](v4->_retryButton, "setBackgroundColor:", v15);

    v16 = v4->_retryButton;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setTitleColor:forState:](v16, "setTitleColor:forState:", v17, 0);

    v18 = v4->_retryButton;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("VLF_localization_failed_try_again_button_text"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v18, "setTitle:forState:", v20, 0);

    -[UIButton addTarget:action:forControlEvents:](v4->_retryButton, "addTarget:action:forControlEvents:", v4, "_retryButtonTapped:", 64);
    -[UIButton setHidden:](v4->_retryButton, "setHidden:", -[VLFSessionStateManager currentState](v4->_stateManager, "currentState") == 0);
    -[VLFFailureView addSubview:](v4, "addSubview:", v4->_retryButton);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v4->_retryButton, "heightAnchor"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 0.0));
    retryButtonHeightConstraint = v4->_retryButtonHeightConstraint;
    v4->_retryButtonHeightConstraint = (NSLayoutConstraint *)v22;

    v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v4->_retryButton, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView leadingAnchor](v4, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:constant:", v24, 24.0));
    v156[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v4->_retryButton, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView trailingAnchor](v4, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -24.0));
    v156[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v4->_retryButton, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView bottomAnchor](v4, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
    v156[2] = v31;
    v156[3] = v4->_retryButtonHeightConstraint;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 4));
    objc_msgSend(v141, "addObjectsFromArray:", v32);

    v33 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    dismissButton = v4->_dismissButton;
    v4->_dismissButton = (UIButton *)v33;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v4->_dismissButton, "layer"));
    objc_msgSend(v35, "setCornerRadius:", 8.0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setBackgroundColor:](v4->_dismissButton, "setBackgroundColor:", v36);

    v37 = v4->_dismissButton;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UIButton setTitleColor:forState:](v37, "setTitleColor:forState:", v38, 0);

    v39 = v4->_dismissButton;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("VLF_localization_failed_dismiss_button_text"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v39, "setTitle:forState:", v41, 0);

    -[UIButton addTarget:action:forControlEvents:](v4->_dismissButton, "addTarget:action:forControlEvents:", v4, "_dismissButtonTapped:", 64);
    -[VLFFailureView addSubview:](v4, "addSubview:", v4->_dismissButton);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v4->_dismissButton, "heightAnchor"));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 0.0));
    dismissButtonHeightConstraint = v4->_dismissButtonHeightConstraint;
    v4->_dismissButtonHeightConstraint = (NSLayoutConstraint *)v43;

    v135 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v4->_dismissButton, "leadingAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v4->_retryButton, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v132));
    v155[0] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v4->_dismissButton, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v4->_retryButton, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
    v155[1] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v4->_dismissButton, "bottomAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v4->_retryButton, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
    v155[2] = v51;
    v155[3] = v4->_dismissButtonHeightConstraint;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v155, 4));
    objc_msgSend(v141, "addObjectsFromArray:", v52);

    v53 = objc_opt_new(UIView);
    topContentView = v4->_topContentView;
    v4->_topContentView = v53;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_topContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VLFFailureView addSubview:](v4, "addSubview:", v4->_topContentView);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_topContentView, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView topAnchor](v4, "topAnchor"));
    v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 14.0));
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v57;

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_topContentView, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v4->_dismissButton, "topAnchor"));
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, -20.0));
    buttonPaddingConstraint = v4->_buttonPaddingConstraint;
    v4->_buttonPaddingConstraint = (NSLayoutConstraint *)v61;

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_topContentView, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView leadingAnchor](v4, "leadingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
    v154[0] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_topContentView, "trailingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView trailingAnchor](v4, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
    v154[1] = v68;
    v154[2] = v4->_topConstraint;
    v154[3] = v4->_buttonPaddingConstraint;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v154, 4));
    objc_msgSend(v141, "addObjectsFromArray:", v69);

    v70 = objc_opt_new(UIView);
    textContainerView = v4->_textContainerView;
    v4->_textContainerView = v70;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4->_topContentView, "addSubview:", v4->_textContainerView);
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_textContainerView, "leadingAnchor"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_topContentView, "leadingAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:constant:", v136, 24.0));
    v153[0] = v133;
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_textContainerView, "trailingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_topContentView, "trailingAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:constant:", v130, -24.0));
    v153[1] = v129;
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_textContainerView, "topAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_topContentView, "topAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintGreaterThanOrEqualToAnchor:", v127));
    v153[2] = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_textContainerView, "bottomAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_topContentView, "bottomAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintLessThanOrEqualToAnchor:", v74));
    v153[3] = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v4->_textContainerView, "centerYAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v4->_topContentView, "centerYAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v77));
    v153[4] = v78;
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v153, 5));
    objc_msgSend(v141, "addObjectsFromArray:", v79);

    v80 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v84 = (UILabel *)objc_msgSend(v80, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v84;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v86) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v86);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setMinimumScaleFactor:](v4->_titleLabel, "setMinimumScaleFactor:", 0.0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v87);

    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("VLF_localization_failed_title_text"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](v4->_titleLabel, "setText:", v89);

    -[UIView addSubview:](v4->_textContainerView, "addSubview:", v4->_titleLabel);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_textContainerView, "leadingAnchor"));
    v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, 4.0));
    titleLabelLeadingConstraint = v4->_titleLabelLeadingConstraint;
    v4->_titleLabelLeadingConstraint = (NSLayoutConstraint *)v92;

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_textContainerView, "trailingAnchor"));
    v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, -4.0));
    titleLabelTrailingConstraint = v4->_titleLabelTrailingConstraint;
    v4->_titleLabelTrailingConstraint = (NSLayoutConstraint *)v96;

    v152[0] = v4->_titleLabelLeadingConstraint;
    v152[1] = v4->_titleLabelTrailingConstraint;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_titleLabel, "topAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_textContainerView, "topAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v99));
    v152[2] = v100;
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v152, 3));
    objc_msgSend(v141, "addObjectsFromArray:", v101);

    v102 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v102;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setMinimumScaleFactor:](v4->_descriptionLabel, "setMinimumScaleFactor:", 0.0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](v4->_descriptionLabel, "setTextAlignment:", 1);
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_descriptionLabel, "setTextColor:", v104);

    switch(GEOConfigGetInteger(MapsConfig_VLFSessionTextExperimentConfig, off_1014B4238))
    {
      case 0:
        goto LABEL_12;
      case 1:
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v106 = v105;
        v107 = CFSTR("VLF_localization_failed_description_text_1");
        break;
      case 2:
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v106 = v105;
        v107 = CFSTR("VLF_localization_failed_description_text_2");
        break;
      case 3:
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v106 = v105;
        v107 = CFSTR("VLF_localization_failed_description_text_3");
        break;
      default:
        v108 = sub_1004318FC();
        v109 = objc_claimAutoreleasedReturnValue(v108);
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v145 = "-[VLFFailureView initWithFrame:]";
          v146 = 2080;
          v147 = "VLFFailureView.m";
          v148 = 1024;
          v149 = 158;
          v150 = 2080;
          v151 = "experimentConfig == 0";
          _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v110 = sub_1004318FC();
          v111 = objc_claimAutoreleasedReturnValue(v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            v112 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v145 = v112;
            _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
LABEL_12:
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v106 = v105;
        v107 = CFSTR("VLF_localization_failed_description_text");
        break;
    }
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "localizedStringForKey:value:table:", v107, CFSTR("localized string not found"), 0));
    -[UILabel setText:](v4->_descriptionLabel, "setText:", v113);

    -[UIView addSubview:](v4->_textContainerView, "addSubview:", v4->_descriptionLabel);
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_descriptionLabel, "topAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    v116 = objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:constant:", v115, 11.0));
    labelPaddingConstraint = v4->_labelPaddingConstraint;
    v4->_labelPaddingConstraint = (NSLayoutConstraint *)v116;

    v139 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_descriptionLabel, "leadingAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_textContainerView, "leadingAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:", v137));
    v143[0] = v118;
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_descriptionLabel, "trailingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_textContainerView, "trailingAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v120));
    v143[1] = v121;
    v143[2] = v4->_labelPaddingConstraint;
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_descriptionLabel, "bottomAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_textContainerView, "bottomAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v123));
    v143[3] = v124;
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 4));
    objc_msgSend(v141, "addObjectsFromArray:", v125);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v141);
    -[VLFFailureView _updateFonts](v4, "_updateFonts");

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[VLFSessionStateManager removeObserver:](self->_stateManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFFailureView;
  -[VLFFailureView dealloc](&v3, "dealloc");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VLFFailureView;
  -[VLFFailureView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[VLFFailureView _updateBackgroundColor](self, "_updateBackgroundColor");
  -[VLFFailureView _updateFonts](self, "_updateFonts");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VLFFailureView;
  -[VLFFailureView layoutSubviews](&v3, "layoutSubviews");
  -[VLFFailureView _updateForCurrentLayout](self, "_updateForCurrentLayout");
  -[VLFFailureView _updateFonts](self, "_updateFonts");
}

- (void)setCurrentLayout:(unint64_t)a3
{
  if (self->_currentLayout != a3)
  {
    self->_currentLayout = a3;
    -[VLFFailureView _updateForCurrentLayout](self, "_updateForCurrentLayout");
    -[VLFFailureView _updateFonts](self, "_updateFonts");
  }
}

- (void)updateFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "-[VLFFailureView updateFont:]";
      v13 = 2080;
      v14 = "VLFFailureView.m";
      v15 = 1024;
      v16 = 222;
      v17 = 2080;
      v18 = "font != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v11, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

}

- (id)_fontWithTextStyle:(id)a3 weight:(double)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  const UIContentSizeCategory *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIFontDescriptorTraitKey v18;
  void *v19;
  UIFontDescriptorAttributeName v20;
  void *v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView traitCollection](self, "traitCollection"));
  v8 = -[VLFFailureView currentLayout](self, "currentLayout");
  v9 = &UIContentSizeCategoryAccessibilityMedium;
  if (v8 != 2)
    v9 = &UIContentSizeCategoryExtraLarge;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_traitCollectionWithMaximumContentSizeCategory:", *v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v6, v10));
  v20 = UIFontDescriptorTraitsAttribute;
  v18 = UIFontWeightTrait;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v19 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v21 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v15, 0.0));
  return v16;
}

- (id)_descriptionFont
{
  return -[VLFFailureView _fontWithTextStyle:weight:](self, "_fontWithTextStyle:weight:", UIFontTextStyleBody, UIFontWeightRegular);
}

- (id)_buttonFont
{
  return -[VLFFailureView _fontWithTextStyle:weight:](self, "_fontWithTextStyle:weight:", UIFontTextStyleHeadline, UIFontWeightSemibold);
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[VLFFailureView _buttonFont](self, "_buttonFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView retryButton](self, "retryButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v4, "setFont:", v19);

  objc_msgSend(v19, "lineHeight");
  v6 = v5;
  objc_msgSend(v19, "leading");
  v8 = v6 + v7 + 28.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView retryButtonHeightConstraint](self, "retryButtonHeightConstraint"));
  objc_msgSend(v9, "setConstant:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView dismissButton](self, "dismissButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleLabel"));
  objc_msgSend(v11, "setFont:", v19);

  objc_msgSend(v19, "lineHeight");
  v13 = v12;
  objc_msgSend(v19, "leading");
  v15 = v13 + v14 + 28.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView dismissButtonHeightConstraint](self, "dismissButtonHeightConstraint"));
  objc_msgSend(v16, "setConstant:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView _descriptionFont](self, "_descriptionFont"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v18, "setFont:", v17);

}

- (void)_updateBackgroundColor
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v6 = (id)v5;
  -[VLFFailureView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)_updateForCurrentLayout
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;
  double v6;
  void *v7;
  NSString *v8;
  NSComparisonResult v9;
  double v10;
  NSString *v11;
  NSComparisonResult v12;
  double v13;
  id v14;

  if (self->_currentLayout == 2)
  {
    -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", 14.0);
    -[NSLayoutConstraint setConstant:](self->_titleLabelLeadingConstraint, "setConstant:", 4.0);
    -[NSLayoutConstraint setConstant:](self->_titleLabelTrailingConstraint, "setConstant:", -4.0);
    -[NSLayoutConstraint setConstant:](self->_labelPaddingConstraint, "setConstant:", 11.0);
    -[NSLayoutConstraint setConstant:](self->_buttonPaddingConstraint, "setConstant:", -20.0);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView traitCollection](self, "traitCollection"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
    v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryLarge);
    v6 = 18.0;
    if (v5 == NSOrderedDescending)
      v6 = 15.0;
    -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v6);

    -[NSLayoutConstraint setConstant:](self->_titleLabelLeadingConstraint, "setConstant:", 0.0);
    -[NSLayoutConstraint setConstant:](self->_titleLabelTrailingConstraint, "setConstant:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView traitCollection](self, "traitCollection"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
    v9 = UIContentSizeCategoryCompareToCategory(v8, UIContentSizeCategoryLarge);
    v10 = 10.0;
    if (v9 == NSOrderedDescending)
      v10 = 7.0;
    -[NSLayoutConstraint setConstant:](self->_labelPaddingConstraint, "setConstant:", v10);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[VLFFailureView traitCollection](self, "traitCollection"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "preferredContentSizeCategory"));
    v12 = UIContentSizeCategoryCompareToCategory(v11, UIContentSizeCategoryLarge);
    v13 = -32.0;
    if (v12 == NSOrderedDescending)
      v13 = -12.0;
    -[NSLayoutConstraint setConstant:](self->_buttonPaddingConstraint, "setConstant:", v13);

  }
}

- (void)_dismissButtonTapped:(id)a3
{
  id v4;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 125, 669, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[VLFFailureView delegate](self, "delegate"));
  objc_msgSend(v4, "failureViewDismissButtonTapped:", self);

}

- (void)_retryButtonTapped:(id)a3
{
  id v4;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 128, 669, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[VLFFailureView delegate](self, "delegate"));
  objc_msgSend(v4, "failureViewRetryButtonTapped:", self);

}

- (void)stateManager:(id)a3 didChangeState:(int64_t)a4
{
  -[UIButton setHidden:](self->_retryButton, "setHidden:", a4 == 0);
}

- (VLFFailureViewDelegate)delegate
{
  return (VLFFailureViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (VLFSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (UIView)topContentView
{
  return self->_topContentView;
}

- (void)setTopContentView:(id)a3
{
  objc_storeStrong((id *)&self->_topContentView, a3);
}

- (UIView)textContainerView
{
  return self->_textContainerView;
}

- (void)setTextContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_textContainerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (UIButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
  objc_storeStrong((id *)&self->_retryButton, a3);
}

- (NSLayoutConstraint)retryButtonHeightConstraint
{
  return self->_retryButtonHeightConstraint;
}

- (void)setRetryButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_retryButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)dismissButtonHeightConstraint
{
  return self->_dismissButtonHeightConstraint;
}

- (void)setDismissButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)titleLabelLeadingConstraint
{
  return self->_titleLabelLeadingConstraint;
}

- (void)setTitleLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)titleLabelTrailingConstraint
{
  return self->_titleLabelTrailingConstraint;
}

- (void)setTitleLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, a3);
}

- (NSLayoutConstraint)labelPaddingConstraint
{
  return self->_labelPaddingConstraint;
}

- (void)setLabelPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelPaddingConstraint, a3);
}

- (NSLayoutConstraint)buttonPaddingConstraint
{
  return self->_buttonPaddingConstraint;
}

- (void)setButtonPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonPaddingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_labelPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_dismissButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_topContentView, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
