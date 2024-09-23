@implementation LPRConfirmPageViewController

- (LPRConfirmPageViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5 vehicleTypeTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  LPRConfirmPageViewController *v13;
  LPRConfirmPageViewController *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)LPRConfirmPageViewController;
  v13 = -[LPRConfirmPageViewController init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    -[LPRConfirmPageViewController setVehicle:](v13, "setVehicle:", v10);
    -[LPRConfirmPageViewController setVehicleTypeTitle:](v14, "setVehicleTypeTitle:", v12);
    v14->_scenario = a3;
    objc_storeWeak((id *)&v14->_delegate, v11);
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  int64_t scenario;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  char **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIScrollView *v16;
  UIScrollView *scrollView;
  void *v18;
  UIView *v19;
  UIView *containerView;
  MapsThemeLabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MapsThemeLabel *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MapsThemeLabel *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  MapsThemeLabel *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  MapsThemeLabel *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  MapsThemeLabel *v51;
  void *v52;
  void *v53;
  void *v54;
  MapsThemeLabel *v55;
  MapsThemeLabel *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  MapsThemeLabel *v61;
  MapsThemeLabel *v62;
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
  MapsThemeLabel *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  MapsThemeLabel *v115;
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
  MapsThemeLabel *v127;
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
  id v168;
  MapsThemeLabel *v169;
  MapsThemeLabel *v170;
  MapsThemeLabel *v171;
  MapsThemeLabel *v172;
  void *v173;
  objc_super v174;
  _QWORD v175[31];

  v174.receiver = self;
  v174.super_class = (Class)LPRConfirmPageViewController;
  -[LPRConfirmPageViewController viewDidLoad](&v174, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("LPRConfirmPageView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  scenario = self->_scenario;
  v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (scenario)
    v10 = CFSTR("[LPR Onboarding] done");
  else
    v10 = CFSTR("[LPR Onboarding] next page");
  if (scenario)
    v11 = &selRef_doneButtonPressed;
  else
    v11 = &selRef_nextButtonPressed;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
  v168 = objc_msgSend(v7, "initWithTitle:style:target:action:", v12, 0, self, *v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setRightBarButtonItem:", v168);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController navigationItem](self, "navigationItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rightBarButtonItem"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("RightBarButtonItem"));

  v16 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v16;

  -[UIScrollView setAccessibilityIdentifier:](self->_scrollView, "setAccessibilityIdentifier:", CFSTR("ScrollView"));
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1);
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_scrollView);

  v19 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v19;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_containerView);
  v21 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v21, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v21, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v21, "setNumberOfLines:", 0);
  -[MapsThemeLabel setTextAlignment:](v21, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v21, "setLineBreakMode:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleLargeTitle));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", 2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v23, 0.0));
  v172 = v21;
  -[MapsThemeLabel setFont:](v21, "setFont:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding confirm title]"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v21, "setText:", v26);

  -[UIView addSubview:](self->_containerView, "addSubview:", v21);
  v27 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v27, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v27, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v27, "setNumberOfLines:", 0);
  -[MapsThemeLabel setTextAlignment:](v27, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v27, "setLineBreakMode:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fontDescriptorWithSymbolicTraits:", 2));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v29, 0.0));
  v171 = v27;
  -[MapsThemeLabel setFont:](v27, "setFont:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding confirm description"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v27, "setText:", v32);

  -[UIView addSubview:](self->_containerView, "addSubview:", v27);
  v33 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v33, "setAccessibilityIdentifier:", CFSTR("PlateLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v33, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v33, "setNumberOfLines:", 0);
  -[MapsThemeLabel setTextAlignment:](v33, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v33, "setLineBreakMode:", 4);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v33, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v33, "setMinimumScaleFactor:", 0.699999988);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v35, 0.0));
  -[MapsThemeLabel setFont:](v33, "setFont:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding confirm plate number"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v33, "setText:", v38);

  LODWORD(v39) = 1148846080;
  -[MapsThemeLabel setContentHuggingPriority:forAxis:](v33, "setContentHuggingPriority:forAxis:", 0, v39);
  v169 = v33;
  -[UIView addSubview:](self->_containerView, "addSubview:", v33);
  v40 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v40, "setAccessibilityIdentifier:", CFSTR("LicensePlateLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v40, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setTextAlignment:](v40, "setTextAlignment:", 0);
  -[MapsThemeLabel setLineBreakMode:](v40, "setLineBreakMode:", 4);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v40, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v40, "setMinimumScaleFactor:", 0.699999988);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v41, 0.0));
  -[MapsThemeLabel setFont:](v40, "setFont:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController vehicle](self, "vehicle"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "licensePlate"));
  -[MapsThemeLabel setText:](v40, "setText:", v44);

  LODWORD(v45) = 1148846080;
  -[MapsThemeLabel setContentHuggingPriority:forAxis:](v40, "setContentHuggingPriority:forAxis:", 0, v45);
  -[UIView addSubview:](self->_containerView, "addSubview:", v40);
  v46 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v46, "setAccessibilityIdentifier:", CFSTR("PowerLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v46, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v46, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTextAlignment:](v46, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v46, "setLineBreakMode:", 4);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v46, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v33, "setMinimumScaleFactor:", 0.699999988);
  v167 = v34;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v47, 0.0));
  v170 = v46;
  -[MapsThemeLabel setFont:](v46, "setFont:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding confirm power type"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v46, "setText:", v50);

  -[UIView addSubview:](self->_containerView, "addSubview:", v46);
  v51 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v51, "setAccessibilityIdentifier:", CFSTR("PowerValue"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v51, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v51, "setNumberOfLines:", 0);
  -[MapsThemeLabel setTextAlignment:](v51, "setTextAlignment:", 4);
  -[MapsThemeLabel setLineBreakMode:](v51, "setLineBreakMode:", 4);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v51, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v51, "setMinimumScaleFactor:", 0.699999988);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v52, 0.0));
  -[MapsThemeLabel setFont:](v51, "setFont:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController vehicleTypeTitle](self, "vehicleTypeTitle"));
  -[MapsThemeLabel setText:](v51, "setText:", v54);

  v55 = v51;
  -[UIView addSubview:](self->_containerView, "addSubview:", v51);
  v56 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v56, "setAccessibilityIdentifier:", CFSTR("PrivacyLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v56, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v56, "setNumberOfLines:", 0);
  -[MapsThemeLabel setTextAlignment:](v56, "setTextAlignment:", 0);
  -[MapsThemeLabel setLineBreakMode:](v56, "setLineBreakMode:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[MapsThemeLabel setFont:](v56, "setFont:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MapsThemeLabel setTextColor:](v56, "setTextColor:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add License Plate privacy"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v56, "setText:", v60);

  -[UIView addSubview:](self->_containerView, "addSubview:", v56);
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "topAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "constraintEqualToAnchor:", v164));
  v175[0] = v163;
  v161 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "leadingAnchor"));
  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "constraintEqualToAnchor:", v160));
  v175[1] = v159;
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "trailingAnchor"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "constraintEqualToAnchor:", v156));
  v175[2] = v155;
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "widthAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "widthAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToAnchor:", v151));
  v175[3] = v150;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController view](self, "view"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "bottomAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintEqualToAnchor:", v147));
  v175[4] = v146;
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:", v144));
  v175[5] = v143;
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:", v141));
  v175[6] = v140;
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:", v138));
  v175[7] = v137;
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:", v135));
  v175[8] = v134;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v172, "topAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "topAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:constant:", v131, 40.0));
  v175[9] = v130;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerXAnchor](v172, "centerXAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v128));
  v175[10] = v126;
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel widthAnchor](v172, "widthAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToAnchor:multiplier:", v124, 0.899999976));
  v175[11] = v123;
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v171, "topAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v172, "bottomAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:constant:", v121, 10.0));
  v175[12] = v120;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerXAnchor](v171, "centerXAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerXAnchor](v172, "centerXAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v118));
  v175[13] = v117;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel widthAnchor](v171, "widthAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:multiplier:", v114, 0.899999976));
  v175[14] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v33, "topAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v171, "bottomAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:constant:", v111, 55.0));
  v175[15] = v110;
  v61 = v33;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v33, "leadingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:", v108, 18.0));
  v175[16] = v106;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v33, "trailingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v40, "leadingAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintLessThanOrEqualToAnchor:", v104));
  v175[17] = v103;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v40, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v101, -15.0));
  v175[18] = v100;
  v127 = v40;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v40, "centerYAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v33, "centerYAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v98));
  v175[19] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v40, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:constant:", v95, -15.0));
  v175[20] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v46, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v33, "bottomAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, 40.0));
  v175[21] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v46, "leadingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v33, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
  v175[22] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v46, "trailingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v55, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintLessThanOrEqualToAnchor:", v86));
  v175[23] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v55, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, -15.0));
  v175[24] = v82;
  v115 = v55;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v55, "centerYAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v46, "centerYAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v175[25] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v55, "trailingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -15.0));
  v175[26] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v56, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v46, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, 40.0));
  v175[27] = v73;
  v62 = v56;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v56, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v61, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
  v175[28] = v65;
  v107 = v56;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel widthAnchor](v56, "widthAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:multiplier:", v67, 0.899999976));
  v175[29] = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v62, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, -15.0));
  v175[30] = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v175, 31));
  objc_msgSend(v173, "addConstraints:", v72);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPRConfirmPageViewController;
  -[LPRConfirmPageViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPRConfirmPageViewController;
  -[LPRConfirmPageViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)doneButtonPressed
{
  void *v3;
  int64_t scenario;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  id WeakRetained;
  int v13;
  int64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 41, 660, 0);

  scenario = self->_scenario;
  v5 = sub_1004326FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (scenario == 1)
  {
    if (v7)
    {
      v8 = self->_scenario;
      v13 = 134217984;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "LPR onboarding: doneButtonPressed scenario: %ld, will add vehicle", (uint8_t *)&v13, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v9, "virtualGarageAddVehicle:", self->_vehicle);
  }
  else
  {
    if (v7)
    {
      v10 = self->_scenario;
      v13 = 134217984;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "LPR onboarding: doneButtonPressed scenario: %ld, will add vehicle", (uint8_t *)&v13, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v9, "virtualGarageSaveVehicle:", self->_vehicle);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v11, "virtualGarageSelectVehicle:", self->_vehicle);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didFinishConfiguringLPRForVehicle:", self->_vehicle);

}

- (void)nextButtonPressed
{
  id v3;
  NSObject *v4;
  int64_t scenario;
  void *v6;
  void *v7;
  LPRCustomizeInterstitialViewController *v8;
  void *v9;
  id WeakRetained;
  LPRCustomizeInterstitialViewController *v11;
  void *v12;
  int v13;
  int64_t v14;

  v3 = sub_1004326FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    scenario = self->_scenario;
    v13 = 134217984;
    v14 = scenario;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "LPR onboarding: nextButtonPressed scenario: %ld, will add vehicle", (uint8_t *)&v13, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v6, "virtualGarageAddVehicle:", self->_vehicle);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v7, "virtualGarageSelectVehicle:", self->_vehicle);

  v8 = [LPRCustomizeInterstitialViewController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController vehicle](self, "vehicle"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = -[LPRCustomizeInterstitialViewController initWithVehicle:delegate:](v8, "initWithVehicle:delegate:", v9, WeakRetained);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController navigationController](self, "navigationController"));
  objc_msgSend(v12, "pushViewController:animated:", v11, 1);

}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_vehicle, a3);
}

- (NSString)vehicleTypeTitle
{
  return self->_vehicleTypeTitle;
}

- (void)setVehicleTypeTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeTitle, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
