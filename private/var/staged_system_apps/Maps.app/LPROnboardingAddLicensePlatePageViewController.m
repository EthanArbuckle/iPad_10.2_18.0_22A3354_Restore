@implementation LPROnboardingAddLicensePlatePageViewController

- (LPROnboardingAddLicensePlatePageViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5 region:(id)a6 lprRules:(id)a7 powerTypes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  LPROnboardingAddLicensePlatePageViewController *v19;
  LPROnboardingAddLicensePlatePageViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  v19 = -[LPROnboardingAddLicensePlatePageViewController init](&v26, "init");
  v20 = v19;
  if (v19)
  {
    -[LPROnboardingAddLicensePlatePageViewController setVehicle:](v19, "setVehicle:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "licensePlateTemplate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1011EB268));
    -[LPROnboardingAddLicensePlatePageViewController setRegionCode:](v20, "setRegionCode:", v23);

    -[LPROnboardingAddLicensePlatePageViewController setCurrentRegion:](v20, "setCurrentRegion:", v16);
    -[LPROnboardingAddLicensePlatePageViewController setLprRules:](v20, "setLprRules:", v17);
    -[LPROnboardingAddLicensePlatePageViewController setPowerTypes:](v20, "setPowerTypes:", v18);
    v20->_scenario = a3;
    objc_storeWeak((id *)&v20->_delegate, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v24, "registerObserver:", v20);

  }
  return v20;
}

- (void)viewDidLoad
{
  void *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  void *v6;
  UIView *v7;
  UIView *containerView;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
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
  double v44;
  double v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  MapsThemeLabel *v55;
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
  MapsThemeLabel *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _BOOL8 v87;
  void *v88;
  void *v89;
  MapsThemeLabel *v90;
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
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  unsigned __int8 v113;
  void *v114;
  id v115;
  id v116;
  NSObject *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
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
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  MapsThemeLabel *v236;
  void *v237;
  void *v238;
  MapsThemeLabel *v239;
  void *v240;
  MapsThemeLabel *v241;
  MapsThemeLabel *v242;
  MapsThemeLabel *v243;
  MapsThemeLabel *v244;
  uint8_t buf[16];
  objc_super v246;
  _QWORD v247[36];

  v246.receiver = self;
  v246.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  -[LPROnboardingAddLicensePlatePageViewController viewDidLoad](&v246, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("LPROnboardingAddLicensePlatePageView"));

  v4 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setAccessibilityIdentifier:](self->_scrollView, "setAccessibilityIdentifier:", CFSTR("ScrollView"));
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1);
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
  -[UIScrollView setKeyboardDismissMode:](self->_scrollView, "setKeyboardDismissMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_scrollView);

  v7 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_containerView);
  v9 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleSingleTap:");
  objc_msgSend(v9, "setCancelsTouchesInView:", 0);
  v125 = v9;
  -[UIView addGestureRecognizer:](self->_containerView, "addGestureRecognizer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypes](self, "powerTypes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
  -[LPROnboardingAddLicensePlatePageViewController setPowerTypesKey:](self, "setPowerTypesKey:", v11);

  v12 = objc_alloc_init((Class)UIPickerView);
  -[LPROnboardingAddLicensePlatePageViewController setPowerPicker:](self, "setPowerPicker:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("PowerPicker"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  objc_msgSend(v14, "setDataSource:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  objc_msgSend(v15, "setDelegate:", self);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v17 = self->_containerView;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  -[UIView addSubview:](v17, "addSubview:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  objc_msgSend(v20, "setBackgroundColor:", v19);

  v21 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v21, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v21, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v21, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTextAlignment:](v21, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v21, "setLineBreakMode:", 0);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v21, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v21, "setMinimumScaleFactor:", 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleLargeTitle));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", 2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v23, 0.0));
  -[MapsThemeLabel setFont:](v21, "setFont:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add License Plate"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v21, "setText:", v26);

  v244 = v21;
  -[UIView addSubview:](self->_containerView, "addSubview:", v21);
  v27 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v27, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v27, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v27, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTextAlignment:](v27, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v27, "setLineBreakMode:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fontDescriptorWithSymbolicTraits:", 2));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v29, 0.0));
  -[MapsThemeLabel setFont:](v27, "setFont:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("[LPR] Onboarding"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v27, "setText:", v32);

  v243 = v27;
  -[UIView addSubview:](self->_containerView, "addSubview:", v27);
  v33 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v33, "setAccessibilityIdentifier:", CFSTR("PlateLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v33, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v33, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTextAlignment:](v33, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v33, "setLineBreakMode:", 4);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v33, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v33, "setMinimumScaleFactor:", 0.699999988);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v35, 0.0));
  -[MapsThemeLabel setFont:](v33, "setFont:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Plate Number"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v33, "setText:", v38);

  LODWORD(v39) = 1148846080;
  -[MapsThemeLabel setContentHuggingPriority:forAxis:](v33, "setContentHuggingPriority:forAxis:", 0, v39);
  v242 = v33;
  -[UIView addSubview:](self->_containerView, "addSubview:", v33);
  v40 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v40, "setAccessibilityIdentifier:", CFSTR("PlateRegionLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v40, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v40, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTextAlignment:](v40, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v40, "setLineBreakMode:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v41, 0.0));
  -[MapsThemeLabel setFont:](v40, "setFont:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController regionCode](self, "regionCode"));
  -[MapsThemeLabel setText:](v40, "setText:", v43);

  LODWORD(v44) = 1148846080;
  -[MapsThemeLabel setContentHuggingPriority:forAxis:](v40, "setContentHuggingPriority:forAxis:", 0, v44);
  LODWORD(v45) = 1148846080;
  -[MapsThemeLabel setContentCompressionResistancePriority:forAxis:](v40, "setContentCompressionResistancePriority:forAxis:", 0, v45);
  v241 = v40;
  -[UIView addSubview:](self->_containerView, "addSubview:", v40);
  v46 = objc_alloc_init((Class)UITextField);
  objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v46, "setAccessibilityIdentifier:", CFSTR("LicensePlateTextField"));
  objc_msgSend(v46, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v46, "setDelegate:", self);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] plate number text"), CFSTR("localized string not found"), 0));
  objc_msgSend(v46, "setPlaceholder:", v48);

  objc_msgSend(v46, "setAutocorrectionType:", 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v49, 0.0));
  objc_msgSend(v46, "setFont:", v50);

  objc_msgSend(v46, "setAutocapitalizationType:", 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "licensePlate"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController regionCode](self, "regionCode"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByReplacingOccurrencesOfString:withString:", v53, &stru_1011EB268));
  objc_msgSend(v46, "setText:", v54);

  objc_msgSend(v46, "addTarget:action:forControlEvents:", self, "_didEditTextField:", 0x20000);
  -[UIView addSubview:](self->_containerView, "addSubview:", v46);
  v240 = v46;
  -[LPROnboardingAddLicensePlatePageViewController setLicensePlateTextField:](self, "setLicensePlateTextField:", v46);
  v55 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v55, "setAccessibilityIdentifier:", CFSTR("PowerLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v55, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v55, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTextAlignment:](v55, "setTextAlignment:", 1);
  -[MapsThemeLabel setLineBreakMode:](v55, "setLineBreakMode:", 4);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v55, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v55, "setMinimumScaleFactor:", 0.699999988);
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v56, 0.0));
  -[MapsThemeLabel setFont:](v55, "setFont:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] power type"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v55, "setText:", v59);

  v239 = v55;
  -[UIView addSubview:](self->_containerView, "addSubview:", v55);
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 1));
  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v60, "setAccessibilityIdentifier:", CFSTR("PowerButton"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "titleLabel"));
  objc_msgSend(v61, "setAdjustsFontForContentSizeCategory:", 1);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController _powerTitleAtRow:](self, "_powerTitleAtRow:", 0));
  objc_msgSend(v60, "setTitle:forState:", v62, 0);

  v124 = v34;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 2));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v63, 0.0));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "titleLabel"));
  objc_msgSend(v65, "setFont:", v64);

  objc_msgSend(v60, "_accessibilitySetInterfaceStyleIntent:", 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "layer"));
  objc_msgSend(v66, "setCornerRadius:", 8.0);

  objc_msgSend(v60, "setContentHorizontalAlignment:", 4);
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "titleLabel"));
  objc_msgSend(v67, "setMinimumScaleFactor:", 0.5);

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "titleLabel"));
  objc_msgSend(v68, "setAdjustsFontSizeToFitWidth:", 1);

  -[LPROnboardingAddLicensePlatePageViewController setPowerButton:](self, "setPowerButton:", v60);
  v238 = v60;
  -[UIView addSubview:](self->_containerView, "addSubview:", v60);
  v69 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v69, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v69, "setAccessibilityIdentifier:", CFSTR("PrivacyLabel"));
  -[MapsThemeLabel setAdjustsFontForContentSizeCategory:](v69, "setAdjustsFontForContentSizeCategory:", 1);
  -[MapsThemeLabel setNumberOfLines:](v69, "setNumberOfLines:", 0);
  -[MapsThemeLabel setTextAlignment:](v69, "setTextAlignment:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[MapsThemeLabel setFont:](v69, "setFont:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel font](v69, "font"));
  objc_msgSend(v71, "pointSize");
  if (10.0 / v72 > 1.0)
  {
    -[MapsThemeLabel setMinimumScaleFactor:](v69, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel font](v69, "font"));
    objc_msgSend(v73, "pointSize");
    -[MapsThemeLabel setMinimumScaleFactor:](v69, "setMinimumScaleFactor:", 10.0 / v74);

  }
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v69, "setAdjustsFontSizeToFitWidth:", 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MapsThemeLabel setTextColor:](v69, "setTextColor:", v75);

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add License Plate privacy"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v69, "setText:", v77);

  -[UIView addSubview:](self->_containerView, "addSubview:", v69);
  v78 = objc_alloc((Class)UIBarButtonItem);
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("Next"), CFSTR("localized string not found"), 0));
  v81 = objc_msgSend(v78, "initWithTitle:style:target:action:", v80, 0, self, "nextButtonPressed");
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v82, "setRightBarButtonItem:", v81);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController navigationItem](self, "navigationItem"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "rightBarButtonItem"));
  objc_msgSend(v84, "setAccessibilityIdentifier:", CFSTR("RightBarButtonItem"));

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "licensePlate"));
  v87 = objc_msgSend(v86, "length") != 0;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController navigationItem](self, "navigationItem"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "rightBarButtonItem"));
  objc_msgSend(v89, "setEnabled:", v87);

  v237 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  v234 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v235 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "topAnchor"));
  v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "constraintEqualToAnchor:", v233));
  v247[0] = v232;
  v230 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v231 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v231, "leadingAnchor"));
  v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "constraintEqualToAnchor:", v229));
  v247[1] = v228;
  v226 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v227 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "trailingAnchor"));
  v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "constraintEqualToAnchor:", v225));
  v247[2] = v224;
  v223 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "widthAnchor"));
  v222 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "widthAnchor"));
  v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "constraintEqualToAnchor:", v220));
  v247[3] = v219;
  v217 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v218 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view"));
  v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "bottomAnchor"));
  v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "constraintEqualToAnchor:", v216));
  v247[4] = v215;
  v214 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v213 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "constraintEqualToAnchor:", v213));
  v247[5] = v212;
  v211 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v210 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "constraintEqualToAnchor:", v210));
  v247[6] = v209;
  v208 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v207 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "constraintEqualToAnchor:", v207));
  v247[7] = v206;
  v205 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v204 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "constraintEqualToAnchor:", v204));
  v247[8] = v203;
  v201 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v244, "topAnchor"));
  v202 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide"));
  v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "topAnchor"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "constraintEqualToAnchor:constant:", v200, 25.0));
  v247[9] = v199;
  v198 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerXAnchor](v244, "centerXAnchor"));
  v197 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "constraintEqualToAnchor:", v197));
  v247[10] = v196;
  v195 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel widthAnchor](v244, "widthAnchor"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "constraintEqualToAnchor:multiplier:", v194, 0.899999976));
  v247[11] = v193;
  v192 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v243, "topAnchor"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v244, "bottomAnchor"));
  v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "constraintEqualToAnchor:constant:", v191, 15.0));
  v247[12] = v190;
  v189 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerXAnchor](v243, "centerXAnchor"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerXAnchor](v244, "centerXAnchor"));
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "constraintEqualToAnchor:", v188));
  v247[13] = v187;
  v186 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel widthAnchor](v243, "widthAnchor"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "constraintEqualToAnchor:multiplier:", v185, 0.899999976));
  v247[14] = v184;
  v183 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v242, "topAnchor"));
  v182 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v243, "bottomAnchor"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "constraintEqualToAnchor:constant:", v182, 45.0));
  v247[15] = v181;
  v180 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v242, "leadingAnchor"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "constraintEqualToAnchor:constant:", v179, 15.0));
  v247[16] = v178;
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v242, "trailingAnchor"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v241, "leadingAnchor"));
  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "constraintLessThanOrEqualToAnchor:constant:", v176, -2.0));
  v247[17] = v175;
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v241, "leadingAnchor"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "constraintEqualToAnchor:constant:", v173, -15.0));
  v247[18] = v172;
  v171 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v241, "centerYAnchor"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v242, "centerYAnchor"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToAnchor:", v170));
  v247[19] = v169;
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "leadingAnchor"));
  v167 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v241, "trailingAnchor"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToAnchor:constant:", v167, 15.0));
  v247[20] = v166;
  v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "centerYAnchor"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v242, "centerYAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "constraintEqualToAnchor:", v164));
  v247[21] = v163;
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "trailingAnchor"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToAnchor:constant:", v161, -15.0));
  v247[22] = v160;
  v159 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v239, "topAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v242, "bottomAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:constant:", v158, 25.0));
  v247[23] = v157;
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v239, "leadingAnchor"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v242, "leadingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToAnchor:", v155));
  v247[24] = v154;
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v239, "trailingAnchor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "leadingAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintLessThanOrEqualToAnchor:", v152));
  v247[25] = v151;
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "leadingAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:constant:", v149, -15.0));
  v247[26] = v148;
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "centerYAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v239, "centerYAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v146));
  v247[27] = v145;
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "trailingAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:constant:", v143, -15.0));
  v247[28] = v142;
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v69, "topAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v239, "bottomAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:constant:", v140, 25.0));
  v247[29] = v139;
  v90 = v69;
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v69, "leadingAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v242, "leadingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:", v137));
  v247[30] = v136;
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel widthAnchor](v69, "widthAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:multiplier:", v134, 0.899999976));
  v247[31] = v133;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "widthAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v130));
  v247[32] = v129;
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "heightAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToConstant:", 170.0));
  v247[33] = v126;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "bottomAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v93));
  v247[34] = v94;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "topAnchor"));
  v236 = v90;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v90, "bottomAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:", v97));
  v247[35] = v98;
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v247, 36));
  objc_msgSend(v237, "addConstraints:", v99);

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "lprPowerType"));

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypesKey](self, "powerTypesKey"));
  v103 = v102;
  if (v101)
  {
    v104 = (uint64_t)objc_msgSend(v102, "count");

    if (v104 >= 1)
    {
      v105 = 0;
      do
      {
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
        v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "lprPowerType"));
        if (v107)
        {
          v108 = (void *)v107;
          v109 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "lprPowerType"));
          v111 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypesKey](self, "powerTypesKey"));
          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectAtIndexedSubscript:", v105));
          v113 = objc_msgSend(v110, "isEqualToString:", v112);

          if ((v113 & 1) != 0)
          {
            v123 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
            objc_msgSend(v123, "selectRow:inComponent:animated:", v105, 0, 1);

            v103 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerPicker](self, "powerPicker"));
            -[LPROnboardingAddLicensePlatePageViewController pickerView:didSelectRow:inComponent:](self, "pickerView:didSelectRow:inComponent:", v103, v105, 0);
            goto LABEL_16;
          }
        }
        else
        {

        }
        ++v105;
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypesKey](self, "powerTypesKey"));
        v115 = objc_msgSend(v114, "count");

      }
      while (v105 < (uint64_t)v115);
    }
    v116 = sub_1004326FC();
    v117 = objc_claimAutoreleasedReturnValue(v116);
    v118 = v125;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "Failed to match current power type onto new region. Will fallback to the first available power type", buf, 2u);
    }

    v103 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypesKey](self, "powerTypesKey"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "firstObject"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
    objc_msgSend(v120, "setLprPowerType:", v119);

  }
  else
  {
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "firstObject"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
    objc_msgSend(v122, "setLprPowerType:", v121);

LABEL_16:
    v118 = v125;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  -[LPROnboardingAddLicensePlatePageViewController viewWillAppear:](&v10, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController licensePlateTextField](self, "licensePlateTextField"));
  objc_msgSend(v9, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  -[LPROnboardingAddLicensePlatePageViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)handleSingleTap:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController view](self, "view", a3));
  objc_msgSend(v3, "endEditing:", 1);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypesKey](self, "powerTypesKey", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[LPROnboardingAddLicensePlatePageViewController _powerTitleAtRow:](self, "_powerTitleAtRow:", a4);
}

- (id)_powerTitleAtRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypes](self, "powerTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypesKey](self, "powerTypesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titles"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v9, 0));

  if (v10)
    v11 = v10;
  else
    v11 = &stru_1011EB268;
  v12 = v11;

  return v12;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a6;
  v9 = v8;
  if (!v8)
  {
    v9 = objc_alloc_init((Class)UILabel);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightMedium));
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(v9, "setTextAlignment:", 1);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController _powerTitleAtRow:](self, "_powerTitleAtRow:", a4));
  objc_msgSend(v9, "setText:", v11);

  return v9;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 50.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerButton](self, "powerButton", a3, a4, a5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController _powerTitleAtRow:](self, "_powerTitleAtRow:", a4));
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerButton](self, "powerButton"));
  objc_msgSend(v9, "sizeToFit");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerTypesKey](self, "powerTypesKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
  objc_msgSend(v11, "setLprPowerType:", v10);

}

- (void)_didEditTextField:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v4 = objc_msgSend(v7, "length") != 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItem"));
  objc_msgSend(v6, "setEnabled:", v4);

}

- (id)licensePlateRules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController currentRegion](self, "currentRegion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "licensePlateValidationRules"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController currentRegion](self, "currentRegion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "licensePlateValidationRules"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController lprRules](self, "lprRules"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "regions"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "licensePlateValidationRules"));

  }
  return v8;
}

- (BOOL)plateIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  BOOL v29;
  void *v31;
  id v32;
  LPROnboardingAddLicensePlatePageViewController *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v4 = a3;
  v33 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController licensePlateRules](self, "licensePlateRules"));
  v6 = v5;
  if (v5)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v8)
    {
      v9 = v8;
      v31 = v6;
      v32 = v7;
      v10 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v13 = objc_msgSend(v4, "length");
          if ((unint64_t)v13 >= objc_msgSend(v12, "minLength")
            && (unint64_t)v13 <= objc_msgSend(v12, "maxLength"))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "regularExpression"));
            v34 = 0;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v14, 1, &v34));
            v16 = v34;

            if (objc_msgSend(v15, "numberOfMatchesInString:options:range:", v4, 0, 0, v13))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "validCharacters"));

              if (v17)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "validCharacters"));
                v19 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController regionCode](v33, "regionCode"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v18, v19));

                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", v20));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "invertedSet"));

                v23 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v22);
                if (v23 != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  v29 = 0;
                  goto LABEL_22;
                }
              }
              v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "impliedPowerTypeKeys"));
              if (!v24
                || (v25 = (void *)v24,
                    v26 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](v33, "vehicle")),
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lprPowerType")),
                    v28 = objc_msgSend(v25, "containsObject:", v27),
                    v27,
                    v26,
                    v25,
                    (v28 & 1) != 0))
              {
                v29 = 1;
LABEL_22:

                v6 = v31;
                v7 = v32;
                goto LABEL_23;
              }
            }

            v7 = v32;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v9)
          continue;
        break;
      }
      v29 = 0;
      v6 = v31;
    }
    else
    {
      v29 = 0;
    }
LABEL_23:

  }
  else
  {
    v29 = 1;
  }

  return v29;
}

- (void)nextButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  LPRConfirmPageViewController *v8;
  int64_t scenario;
  VGVehicle *vehicle;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  LPRConfirmPageViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController regionCode](self, "regionCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController licensePlateTextField](self, "licensePlateTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uppercaseString"));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, v6));

  if (-[LPROnboardingAddLicensePlatePageViewController plateIsValid:](self, "plateIsValid:", v21))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController vehicle](self, "vehicle"));
    objc_msgSend(v7, "setLicensePlate:", v21);

    self->_isAddingVehicle = self->_scenario == 0;
    self->_isSubmittingLicensePlate = 1;
    v8 = [LPRConfirmPageViewController alloc];
    scenario = self->_scenario;
    vehicle = self->_vehicle;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController powerButton](self, "powerButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));
    v15 = -[LPRConfirmPageViewController initWithScenario:vehicle:delegate:vehicleTypeTitle:](v8, "initWithScenario:vehicle:delegate:vehicleTypeTitle:", scenario, vehicle, WeakRetained, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingAddLicensePlatePageViewController navigationController](self, "navigationController"));
    objc_msgSend(v16, "pushViewController:animated:", v15, 1);
  }
  else
  {
    v15 = (LPRConfirmPageViewController *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LPRConfirmPageViewController localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] error message title"), CFSTR("localized string not found"), 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] error message body"), CFSTR("localized string not found"), 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] error confirmation"), CFSTR("localized string not found"), 0));
    -[LPROnboardingAddLicensePlatePageViewController _maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:](self, "_maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:", v16, v18, v20);

  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_isAddingVehicle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vehicles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2107, 660, v7);

    self->_isAddingVehicle = 0;
  }
  if (self->_isSubmittingLicensePlate)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vehicles"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 2114, 660, v11);

    self->_isSubmittingLicensePlate = 0;
  }

}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_storeStrong((id *)&self->_regionCode, a3);
}

- (NSMutableDictionary)powerTypes
{
  return self->_powerTypes;
}

- (void)setPowerTypes:(id)a3
{
  objc_storeStrong((id *)&self->_powerTypes, a3);
}

- (NSArray)powerTypesKey
{
  return self->_powerTypesKey;
}

- (void)setPowerTypesKey:(id)a3
{
  objc_storeStrong((id *)&self->_powerTypesKey, a3);
}

- (UIPickerView)powerPicker
{
  return self->_powerPicker;
}

- (void)setPowerPicker:(id)a3
{
  objc_storeStrong((id *)&self->_powerPicker, a3);
}

- (UIButton)powerButton
{
  return self->_powerButton;
}

- (void)setPowerButton:(id)a3
{
  objc_storeStrong((id *)&self->_powerButton, a3);
}

- (UITextField)licensePlateTextField
{
  return self->_licensePlateTextField;
}

- (void)setLicensePlateTextField:(id)a3
{
  objc_storeStrong((id *)&self->_licensePlateTextField, a3);
}

- (unint64_t)selectedPowerType
{
  return self->_selectedPowerType;
}

- (void)setSelectedPowerType:(unint64_t)a3
{
  self->_selectedPowerType = a3;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_vehicle, a3);
}

- (GEOLPRRegion)currentRegion
{
  return self->_currentRegion;
}

- (void)setCurrentRegion:(id)a3
{
  objc_storeStrong((id *)&self->_currentRegion, a3);
}

- (GEOLPRRoot)lprRules
{
  return self->_lprRules;
}

- (void)setLprRules:(id)a3
{
  objc_storeStrong((id *)&self->_lprRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lprRules, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_licensePlateTextField, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_powerPicker, 0);
  objc_storeStrong((id *)&self->_powerTypesKey, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
