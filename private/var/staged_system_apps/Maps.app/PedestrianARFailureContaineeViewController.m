@implementation PedestrianARFailureContaineeViewController

- (PedestrianARFailureContaineeViewController)initWithEntryPoint:(int64_t)a3
{
  PedestrianARFailureContaineeViewController *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  PedestrianARFailureContaineeViewController *v17;
  __int16 v18;
  int64_t v19;

  v15.receiver = self;
  v15.super_class = (Class)PedestrianARFailureContaineeViewController;
  v4 = -[PedestrianARFailureContaineeViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = sub_1008FC1A4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v17 = v4;
      v18 = 2048;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing with entry point: %ld", buf, 0x16u);
    }

    v4->_entryPoint = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    objc_msgSend(v7, "requestSessionWithOwner:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, "pedestrianARViewControllerDidDisappearNotification:", CFSTR("PedestrianARViewControllerDidDisappearNotification"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v9, "setHideGrabber:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v10, "setAllowsSwipeToDismiss:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v11, "setPresentedModally:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v12, "setTakesAvailableHeight:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v13, "setEdgeAttachedRegularHeightDimmingBehavior:", 1);

  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  PedestrianARFailureContaineeViewController *v8;

  v3 = sub_1008FC1A4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  objc_msgSend(v5, "resignSessionWithOwner:", self);

  v6.receiver = self;
  v6.super_class = (Class)PedestrianARFailureContaineeViewController;
  -[PedestrianARFailureContaineeViewController dealloc](&v6, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
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
  id v18;
  double y;
  double width;
  double height;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *topContainerTopConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  void *v37;
  id v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *labelContainerLeadingConstraint;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *labelContainerTrailingConstraint;
  NSLayoutConstraint *v49;
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
  UILabel *v60;
  UILabel *titleLabel;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSLayoutConstraint *v68;
  NSLayoutConstraint *titleLabelFirstBaselineConstraint;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSLayoutConstraint *v78;
  void *v79;
  UILabel *v80;
  UILabel *descriptionLabel;
  double v82;
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
  UIButton *v100;
  UIButton *dismissButton;
  void *v102;
  void *v103;
  UIButton *v104;
  void *v105;
  UIButton *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSLayoutConstraint *v111;
  NSLayoutConstraint *dismissButtonHeightConstraint;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  NSLayoutConstraint *v120;
  void *v121;
  UIButton *v122;
  UIButton *retryButton;
  void *v124;
  UIButton *v125;
  void *v126;
  UIButton *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  NSLayoutConstraint *v134;
  NSLayoutConstraint *retryButtonBottomConstraint;
  void *v136;
  NSLayoutConstraint *v137;
  NSLayoutConstraint *retryButtonHeightConstraint;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  NSLayoutConstraint *v145;
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
  objc_super v171;
  _QWORD v172[5];
  _QWORD v173[4];
  _QWORD v174[4];
  UIFontDescriptorTraitKey v175;
  void *v176;
  UIFontDescriptorAttributeName v177;
  void *v178;
  _QWORD v179[4];
  _QWORD v180[5];
  _QWORD v181[3];
  _QWORD v182[4];

  v171.receiver = self;
  v171.super_class = (Class)PedestrianARFailureContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v171, "viewDidLoad");
  -[PedestrianARFailureContaineeViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_msgSend(objc_alloc((Class)MUBlurView), "initWithBlurEffectStyle:", 19);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v5, "setNonBlurredColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", v5);

  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "leadingAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "constraintEqualToAnchor:", v161));
  v182[0] = v158;
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "trailingAnchor"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:", v149));
  v182[1] = v147;
  v8 = v5;
  v165 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v182[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v182[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v182, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  v18 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v22 = objc_msgSend(v18, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  objc_msgSend(v23, "addSubview:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  topContainerTopConstraint = self->_topContainerTopConstraint;
  self->_topContainerTopConstraint = v27;

  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "constraintEqualToAnchor:", v30));
  v181[0] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  v36 = self->_topContainerTopConstraint;
  v181[1] = v35;
  v181[2] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v181, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  v38 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v39) = 1148846080;
  objc_msgSend(v38, "setContentHuggingPriority:forAxis:", 1, v39);
  v40 = v22;
  objc_msgSend(v22, "addSubview:", v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 26.0));
  labelContainerLeadingConstraint = self->_labelContainerLeadingConstraint;
  self->_labelContainerLeadingConstraint = v43;

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -26.0));
  labelContainerTrailingConstraint = self->_labelContainerTrailingConstraint;
  self->_labelContainerTrailingConstraint = v47;

  v49 = self->_labelContainerTrailingConstraint;
  v180[0] = self->_labelContainerLeadingConstraint;
  v180[1] = v49;
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintGreaterThanOrEqualToAnchor:", v50));
  v180[2] = v51;
  v52 = v38;
  v170 = v38;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v167 = v40;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:", v54));
  v180[3] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "centerYAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "centerYAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v57));
  v180[4] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v180, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v59);

  v60 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v60;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  LODWORD(v62) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_failure_title_text"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_titleLabel, "setText:", v65);

  objc_msgSend(v170, "addSubview:", self->_titleLabel);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "topAnchor"));
  v68 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 60.0));
  titleLabelFirstBaselineConstraint = self->_titleLabelFirstBaselineConstraint;
  self->_titleLabelFirstBaselineConstraint = v68;

  v163 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:", v70));
  v179[0] = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "trailingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v73));
  v179[1] = v74;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "topAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v76));
  v78 = self->_titleLabelFirstBaselineConstraint;
  v179[2] = v77;
  v179[3] = v78;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v179, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v79);

  v80 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v80;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 5);
  LODWORD(v82) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle3));
  v177 = UIFontDescriptorTraitsAttribute;
  v175 = UIFontWeightTrait;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightRegular));
  v176 = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1));
  v178 = v85;
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "fontDescriptorByAddingAttributes:", v86));

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v164, 0.0));
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v88);

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_failure_description_text"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_descriptionLabel, "setText:", v90);

  objc_msgSend(v170, "addSubview:", self->_descriptionLabel);
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_descriptionLabel, "leadingAnchor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "leadingAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "constraintEqualToAnchor:", v152));
  v174[0] = v150;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_descriptionLabel, "trailingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "trailingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintEqualToAnchor:", v91));
  v174[1] = v92;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_descriptionLabel, "topAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, 15.0));
  v174[2] = v95;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_descriptionLabel, "bottomAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "bottomAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v97));
  v174[3] = v98;
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v174, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v99);

  v100 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  dismissButton = self->_dismissButton;
  self->_dismissButton = v100;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_dismissButton, "layer"));
  objc_msgSend(v102, "setCornerRadius:", 12.0);

  v103 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setBackgroundColor:](self->_dismissButton, "setBackgroundColor:", v103);

  v104 = self->_dismissButton;
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UIButton setTitleColor:forState:](v104, "setTitleColor:forState:", v105, 0);

  v106 = self->_dismissButton;
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_failure_dismiss_button_text"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v106, "setTitle:forState:", v108, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_dismissButton, "addTarget:action:forControlEvents:", self, "_dismissButtonTapped:", 64);
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  objc_msgSend(v109, "addSubview:", self->_dismissButton);

  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_dismissButton, "heightAnchor"));
  v111 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToConstant:", 50.0));
  dismissButtonHeightConstraint = self->_dismissButtonHeightConstraint;
  self->_dismissButtonHeightConstraint = v111;

  v159 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_dismissButton, "leadingAnchor"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "leadingAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:", v156));
  v173[0] = v113;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_dismissButton, "trailingAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "trailingAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v115));
  v173[1] = v116;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_dismissButton, "topAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "bottomAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:constant:", v118, 26.0));
  v120 = self->_dismissButtonHeightConstraint;
  v173[2] = v119;
  v173[3] = v120;
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v173, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v121);

  v122 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  retryButton = self->_retryButton;
  self->_retryButton = v122;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_retryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIButton setBackgroundColor:](self->_retryButton, "setBackgroundColor:", v124);

  v125 = self->_retryButton;
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UIButton setTitleColor:forState:](v125, "setTitleColor:forState:", v126, 0);

  v127 = self->_retryButton;
  v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_failure_retry_button_text"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v127, "setTitle:forState:", v129, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_retryButton, "addTarget:action:forControlEvents:", self, "_retryButtonTapped:", 64);
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  objc_msgSend(v130, "addSubview:", self->_retryButton);

  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_retryButton, "bottomAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "bottomAnchor"));
  v134 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v133));
  retryButtonBottomConstraint = self->_retryButtonBottomConstraint;
  self->_retryButtonBottomConstraint = v134;

  v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_retryButton, "heightAnchor"));
  v137 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToConstant:", 50.0));
  retryButtonHeightConstraint = self->_retryButtonHeightConstraint;
  self->_retryButtonHeightConstraint = v137;

  v160 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_retryButton, "leadingAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "leadingAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "constraintEqualToAnchor:", v157));
  v172[0] = v153;
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_retryButton, "trailingAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "trailingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:", v140));
  v172[1] = v141;
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_retryButton, "topAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_dismissButton, "bottomAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:constant:", v143, 4.0));
  v145 = self->_retryButtonBottomConstraint;
  v172[2] = v144;
  v172[3] = v145;
  v172[4] = self->_retryButtonHeightConstraint;
  v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v172, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v146);

  -[PedestrianARFailureContaineeViewController _updateForCurrentLayout](self, "_updateForCurrentLayout");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFailureContaineeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = objc_msgSend(v3, "containerStyle");

  if (v4)
    -[PedestrianARFailureContaineeViewController _updateForCurrentLayout](self, "_updateForCurrentLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARFailureContaineeViewController;
  -[MapsThemeViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController traitCollection](self, "traitCollection")),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory")),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    -[PedestrianARFailureContaineeViewController _updateForCurrentLayout](self, "_updateForCurrentLayout");
  }

}

- (void)_updateForCurrentLayout
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  NSObject *v45;
  const char *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  id v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  id v66;
  int v67;
  PedestrianARFailureContaineeViewController *v68;
  CGRect v69;

  v3 = -[PedestrianARFailureContaineeViewController _isLandscape](self, "_isLandscape");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController titleLabel](self, "titleLabel"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setNumberOfLines:", 2);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v6, "setNumberOfLines:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController topContainerTopConstraint](self, "topContainerTopConstraint"));
    objc_msgSend(v7, "setConstant:", 24.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController titleLabelFirstBaselineConstraint](self, "titleLabelFirstBaselineConstraint"));
    objc_msgSend(v8, "setActive:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController labelContainerLeadingConstraint](self, "labelContainerLeadingConstraint"));
    objc_msgSend(v9, "setConstant:", 24.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController labelContainerTrailingConstraint](self, "labelContainerTrailingConstraint"));
    objc_msgSend(v10, "setConstant:", -24.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v12 = objc_msgSend(v11, "containerStyle");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
    v14 = v13;
    if (v12 == (id)6)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "window"));
      objc_msgSend(v14, "convertRect:toView:", v25, v17, v19, v21, v23);
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "window"));
      objc_msgSend(v35, "frame");
      v37 = v36;
      v69.origin.x = v27;
      v69.origin.y = v29;
      v69.size.width = v31;
      v69.size.height = v33;
      v38 = v37 - CGRectGetMaxY(v69);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "window"));
      objc_msgSend(v40, "frame");
      v42 = -(v41 * 0.07 - v38);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController retryButtonBottomConstraint](self, "retryButtonBottomConstraint"));
      objc_msgSend(v43, "setConstant:", v42);

      v44 = sub_1008FC1A4();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        v67 = 134349056;
        v68 = self;
        v46 = "[%{public}p] Laying out for landscape floating";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, v46, (uint8_t *)&v67, 0xCu);
      }
    }
    else
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
      objc_msgSend(v62, "frame");
      v64 = v63 * -0.07;
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController retryButtonBottomConstraint](self, "retryButtonBottomConstraint"));
      objc_msgSend(v65, "setConstant:", v64);

      v66 = sub_1008FC1A4();
      v45 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        v67 = 134349056;
        v68 = self;
        v46 = "[%{public}p] Laying out for landscape fixed";
        goto LABEL_12;
      }
    }
  }
  else
  {
    objc_msgSend(v4, "setNumberOfLines:", 3);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController traitCollection](self, "traitCollection"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "preferredContentSizeCategory"));
    v49 = sub_1002A8950(v48, UIContentSizeCategoryExtraLarge);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController descriptionLabel](self, "descriptionLabel"));
    v51 = v50;
    if (v49 == 1)
      v52 = 6;
    else
      v52 = 5;
    objc_msgSend(v50, "setNumberOfLines:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController topContainerTopConstraint](self, "topContainerTopConstraint"));
    objc_msgSend(v53, "setConstant:", 0.0);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController titleLabelFirstBaselineConstraint](self, "titleLabelFirstBaselineConstraint"));
    objc_msgSend(v54, "setActive:", 1);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController labelContainerLeadingConstraint](self, "labelContainerLeadingConstraint"));
    objc_msgSend(v55, "setConstant:", 26.0);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController labelContainerTrailingConstraint](self, "labelContainerTrailingConstraint"));
    objc_msgSend(v56, "setConstant:", -26.0);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v57, "bottomSafeOffset");
    v59 = -(v58 + 10.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController retryButtonBottomConstraint](self, "retryButtonBottomConstraint"));
    objc_msgSend(v60, "setConstant:", v59);

    v61 = sub_1008FC1A4();
    v45 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      v67 = 134349056;
      v68 = self;
      v46 = "[%{public}p] Laying out for portrait";
      goto LABEL_12;
    }
  }

  -[PedestrianARFailureContaineeViewController _updateFonts](self, "_updateFonts");
}

- (void)_updateFonts
{
  unsigned int v3;
  UIContentSizeCategory v4;
  unsigned int v5;
  UIContentSizeCategory v6;
  NSString *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSString *v31;

  v3 = -[PedestrianARFailureContaineeViewController _isLandscape](self, "_isLandscape");
  v4 = UIContentSizeCategoryExtraExtraExtraLarge;
  if (!v3)
    v4 = UIContentSizeCategoryAccessibilityLarge;
  v31 = v4;
  v5 = -[PedestrianARFailureContaineeViewController _isLandscape](self, "_isLandscape");
  v6 = UIContentSizeCategoryExtraLarge;
  if (!v5)
    v6 = UIContentSizeCategoryAccessibilityLarge;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController traitCollection](self, "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_traitCollectionWithMaximumContentSizeCategory:", v31));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController traitCollection](self, "traitCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_traitCollectionWithMaximumContentSizeCategory:", v7));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v9, UIFontWeightBold));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setFont:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle3, v11, UIFontWeightRegular));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v15, "setFont:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, v11, UIFontWeightSemibold));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController retryButton](self, "retryButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
  objc_msgSend(v18, "setFont:", v16);

  objc_msgSend(v16, "lineHeight");
  v20 = v19;
  objc_msgSend(v16, "leading");
  v22 = v20 + v21 + 28.0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController retryButtonHeightConstraint](self, "retryButtonHeightConstraint"));
  objc_msgSend(v23, "setConstant:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController dismissButton](self, "dismissButton"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleLabel"));
  objc_msgSend(v25, "setFont:", v16);

  objc_msgSend(v16, "lineHeight");
  v27 = v26;
  objc_msgSend(v16, "leading");
  v29 = v27 + v28 + 28.0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController dismissButtonHeightConstraint](self, "dismissButtonHeightConstraint"));
  objc_msgSend(v30, "setConstant:", v29);

}

- (BOOL)_isLandscape
{
  void *v2;
  unint64_t v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v3 = (unint64_t)objc_msgSend(v2, "containerStyle");
  v4 = (v3 > 7) | (0x5Cu >> v3);

  return v4 & 1;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = -1.0;
  if (a3 == 5)
  {
    -[PedestrianARFailureContaineeViewController _updateForCurrentLayout](self, "_updateForCurrentLayout");
    if (-[PedestrianARFailureContaineeViewController _isLandscape](self, "_isLandscape"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v5, "availableHeight");
      v3 = v6;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController view](self, "view"));
      objc_msgSend(v7, "frame");
      v9 = v8;
      LODWORD(v8) = 1148846080;
      LODWORD(v10) = 1112014848;
      objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v9, UILayoutFittingCompressedSize.height, v8, v10);
      v3 = v11;

    }
  }
  return v3;
}

- (void)didChangeLayout:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  PedestrianARFailureContaineeViewController *v9;
  __int16 v10;
  unint64_t v11;

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARFailureContaineeViewController;
  -[ContaineeViewController didChangeLayout:](&v7, "didChangeLayout:");
  v5 = sub_1008FC1A4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Did change layout to: %lu", buf, 0x16u);
  }

  -[PedestrianARFailureContaineeViewController _updateForCurrentLayout](self, "_updateForCurrentLayout");
}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  PedestrianARFailureContaineeViewController *v9;
  __int16 v10;
  unint64_t v11;

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARFailureContaineeViewController;
  -[ContaineeViewController didChangeContainerStyle:](&v7, "didChangeContainerStyle:");
  v5 = sub_1008FC1A4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Did change style to: %lu", buf, 0x16u);
  }

  -[PedestrianARFailureContaineeViewController _updateForCurrentLayout](self, "_updateForCurrentLayout");
}

- (void)_dismissButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  PedestrianARFailureContaineeViewController *v9;

  v4 = sub_1008FC1A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Dismiss button tapped", (uint8_t *)&v8, 0xCu);
  }

  if (-[PedestrianARFailureContaineeViewController entryPoint](self, "entryPoint"))
    v6 = 402;
  else
    v6 = 302;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 125, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController failureContaineeDelegate](self, "failureContaineeDelegate"));
  objc_msgSend(v7, "failureViewDismissButtonTapped:", self);

}

- (void)_retryButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  PedestrianARFailureContaineeViewController *v9;

  v4 = sub_1008FC1A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Retry button tapped", (uint8_t *)&v8, 0xCu);
  }

  if (-[PedestrianARFailureContaineeViewController entryPoint](self, "entryPoint"))
    v6 = 402;
  else
    v6 = 302;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 128, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFailureContaineeViewController failureContaineeDelegate](self, "failureContaineeDelegate"));
  objc_msgSend(v7, "failureViewRetryButtonTapped:", self);

}

- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  PedestrianARFailureContaineeViewController *v9;

  v4 = sub_1008FC1A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR was dismissed; resigning session ownership",
      (uint8_t *)&v8,
      0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PedestrianARViewControllerDidDisappearNotification"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  objc_msgSend(v7, "resignSessionWithOwner:", self);

}

- (PedestrianARFailureContaineeDelegate)failureContaineeDelegate
{
  return (PedestrianARFailureContaineeDelegate *)objc_loadWeakRetained((id *)&self->_failureContaineeDelegate);
}

- (void)setFailureContaineeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_failureContaineeDelegate, a3);
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
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

- (NSLayoutConstraint)topContainerTopConstraint
{
  return self->_topContainerTopConstraint;
}

- (void)setTopContainerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topContainerTopConstraint, a3);
}

- (NSLayoutConstraint)titleLabelFirstBaselineConstraint
{
  return self->_titleLabelFirstBaselineConstraint;
}

- (void)setTitleLabelFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)labelContainerLeadingConstraint
{
  return self->_labelContainerLeadingConstraint;
}

- (void)setLabelContainerLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainerLeadingConstraint, a3);
}

- (NSLayoutConstraint)labelContainerTrailingConstraint
{
  return self->_labelContainerTrailingConstraint;
}

- (void)setLabelContainerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainerTrailingConstraint, a3);
}

- (NSLayoutConstraint)retryButtonBottomConstraint
{
  return self->_retryButtonBottomConstraint;
}

- (void)setRetryButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_retryButtonBottomConstraint, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_failureContaineeDelegate);
}

@end
