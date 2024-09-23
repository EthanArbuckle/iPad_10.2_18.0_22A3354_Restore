@implementation RouteCreationCardView

- (RouteCreationCardView)initWithCoder:(id)a3
{
  RouteCreationCardView *v3;
  RouteCreationCardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteCreationCardView;
  v3 = -[RouteCreationCardView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RouteCreationCardView _commonInit](v3, "_commonInit");
  return v4;
}

- (RouteCreationCardView)initWithFrame:(CGRect)a3
{
  RouteCreationCardView *v3;
  RouteCreationCardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteCreationCardView;
  v3 = -[RouteCreationCardView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RouteCreationCardView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSMeasurement *v9;
  NSMeasurement *zeroMeters;
  void *v11;
  uint64_t v12;
  RouteCreationIconButton *v13;
  void *v14;
  void *v15;
  void *v16;
  RouteCreationIconButton *v17;
  RouteCreationIconButton *reverseButton;
  RouteCreationIconButton *v19;
  void *v20;
  void *v21;
  void *v22;
  RouteCreationIconButton *v23;
  RouteCreationIconButton *outAndBackButton;
  RouteCreationIconButton *v25;
  void *v26;
  void *v27;
  void *v28;
  RouteCreationIconButton *v29;
  RouteCreationIconButton *closeLoopButton;
  UIView *v31;
  UIView *v32;
  UIView *cardContentView;
  void *v34;
  UILabel *v35;
  UILabel *distanceLabel;
  double v37;
  MapsThemeMultiPartLabel *v38;
  MapsThemeMultiPartLabel *descriptionLabel;
  void *v40;
  double v41;
  MultilineStackView *v42;
  MultilineStackView *buttonStackView;
  double v44;
  double v45;
  double v46;
  void *v47;
  UIButton *v48;
  UIButton *directionsButton;
  double v50;
  void *v51;
  UIButton *v52;
  UIButton *saveButton;
  void *v54;
  UIButton *v55;
  void *v56;
  UIButton *v57;
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
  void *v113;
  void *v114;
  UIView *v115;
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
  RouteCreationIconButton *v148;
  void *v149;
  RouteCreationIconButton *v150;
  RouteCreationIconButton *v151;
  void *v152;
  void *v153;
  void *v154;
  _QWORD v155[30];
  _QWORD v156[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  self->_isMetric = objc_msgSend(v3, "_navigation_distanceUsesMetricSystem");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = MNLocaleDidChangeNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_unitsDidChange", v6, 0);

  v7 = objc_alloc((Class)NSMeasurement);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v9 = (NSMeasurement *)objc_msgSend(v7, "initWithDoubleValue:unit:", v8, 0.0);
  zeroMeters = self->_zeroMeters;
  self->_zeroMeters = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightSemibold));
  v12 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v11));

  v13 = [RouteCreationIconButton alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.up.arrow.down"), v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Reverse Button"), CFSTR("localized string not found"), 0));
  v17 = -[RouteCreationIconButton initWithImage:title:](v13, "initWithImage:title:", v14, v16);

  -[RouteCreationIconButton setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RouteCreationIconButton setAccessibilityIdentifier:](v17, "setAccessibilityIdentifier:", CFSTR("CreateARouteReverseButton"));
  -[RouteCreationIconButton addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, "_pressedReverse", 64);
  reverseButton = self->_reverseButton;
  self->_reverseButton = v17;
  v151 = v17;

  v19 = [RouteCreationIconButton alloc];
  v152 = (void *)v12;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill"), v12));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Out-n-Back Button"), CFSTR("localized string not found"), 0));
  v23 = -[RouteCreationIconButton initWithImage:title:](v19, "initWithImage:title:", v20, v22);

  -[RouteCreationIconButton setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RouteCreationIconButton setAccessibilityIdentifier:](v23, "setAccessibilityIdentifier:", CFSTR("CreateARouteOutBackButton"));
  -[RouteCreationIconButton addTarget:action:forControlEvents:](v23, "addTarget:action:forControlEvents:", self, "_pressedOutAndBack", 64);
  outAndBackButton = self->_outAndBackButton;
  self->_outAndBackButton = v23;
  v150 = v23;

  v25 = [RouteCreationIconButton alloc];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("point.forward.to.point.capsulepath.fill"), v12));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Close Loop Button"), CFSTR("localized string not found"), 0));
  v29 = -[RouteCreationIconButton initWithImage:title:](v25, "initWithImage:title:", v26, v28);

  -[RouteCreationIconButton setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RouteCreationIconButton setAccessibilityIdentifier:](v29, "setAccessibilityIdentifier:", CFSTR("CreateARouteCloseLoopButton"));
  -[RouteCreationIconButton addTarget:action:forControlEvents:](v29, "addTarget:action:forControlEvents:", self, "_pressedCloseLoop", 64);
  closeLoopButton = self->_closeLoopButton;
  self->_closeLoopButton = v29;
  v148 = v29;

  v31 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](v31, "setClipsToBounds:", 1);
  v32 = objc_opt_new(UIView);
  cardContentView = self->_cardContentView;
  self->_cardContentView = v32;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_cardContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011DCFF0));
  -[UIView setBackgroundColor:](self->_cardContentView, "setBackgroundColor:", v34);

  -[UIView _setContinuousCornerRadius:](self->_cardContentView, "_setContinuousCornerRadius:", 12.0);
  v35 = objc_opt_new(UILabel);
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v35;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_distanceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v37) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_distanceLabel, "setContentHuggingPriority:forAxis:", 1, v37);
  v38 = objc_opt_new(MapsThemeMultiPartLabel);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v38;

  -[MapsThemeMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MapsThemeMultiPartLabel setTextColor:](self->_descriptionLabel, "setTextColor:", v40);

  -[MapsThemeMultiPartLabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 1);
  LODWORD(v41) = 1148846080;
  -[MapsThemeMultiPartLabel setContentHuggingPriority:forAxis:](self->_descriptionLabel, "setContentHuggingPriority:forAxis:", 1, v41);
  v42 = -[MultilineStackView initWithHorizontalArrangement:verticalArrangement:]([MultilineStackView alloc], "initWithHorizontalArrangement:verticalArrangement:", 3, 0);
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v42;

  -[MultilineStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v44 = kMUPlaceHorizontalStackSpacing;
  -[MultilineStackView setInterItemHorizontalPadding:](self->_buttonStackView, "setInterItemHorizontalPadding:", kMUPlaceHorizontalStackSpacing);
  -[MultilineStackView setInterItemVerticalPadding:](self->_buttonStackView, "setInterItemVerticalPadding:", v44);
  LODWORD(v45) = 1148846080;
  -[MultilineStackView setContentHuggingPriority:forAxis:](self->_buttonStackView, "setContentHuggingPriority:forAxis:", 1, v45);
  LODWORD(v46) = 1148846080;
  -[MultilineStackView setContentCompressionResistancePriority:forAxis:](self->_buttonStackView, "setContentCompressionResistancePriority:forAxis:", 1, v46);
  -[MultilineStackView setAccessibilityIdentifier:](self->_buttonStackView, "setAccessibilityIdentifier:", CFSTR("ButtonStackView"));
  -[MultilineStackView setRowHeightBlock:](self->_buttonStackView, "setRowHeightBlock:", &stru_1011DD030);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_primaryCardFooterActionButtonConfiguration"));
  v48 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v47, 0));
  directionsButton = self->_directionsButton;
  self->_directionsButton = v48;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_directionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v50) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_directionsButton, "setContentCompressionResistancePriority:forAxis:", 1, v50);
  -[UIButton setAccessibilityIdentifier:](self->_directionsButton, "setAccessibilityIdentifier:", CFSTR("DirectionsButton"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_secondaryCardFooterActionButtonConfiguration"));
  v52 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v51, 0));
  saveButton = self->_saveButton;
  self->_saveButton = v52;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_saveButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setAccessibilityIdentifier:](self->_saveButton, "setAccessibilityIdentifier:", CFSTR("SaveButton"));
  -[UIButton addTarget:action:forControlEvents:](self->_saveButton, "addTarget:action:forControlEvents:", self, "_pressedSave", 64);
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Save"), CFSTR("localized string not found"), 0));

  -[UIButton setTitle:forState:](self->_saveButton, "setTitle:forState:", v149, 0);
  v55 = self->_saveButton;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011DD050));
  -[UIButton setTitleColor:forState:](v55, "setTitleColor:forState:", v56, 0);

  -[RouteCreationCardView _updateDirectionsButtonWithSuggestedMode:](self, "_updateDirectionsButtonWithSuggestedMode:", 2);
  -[RouteCreationCardView addSubview:](self, "addSubview:", v31);
  -[UIView addSubview:](v31, "addSubview:", self->_reverseButton);
  -[UIView addSubview:](v31, "addSubview:", self->_outAndBackButton);
  -[UIView addSubview:](v31, "addSubview:", self->_closeLoopButton);
  -[RouteCreationCardView addSubview:](self, "addSubview:", self->_cardContentView);
  -[UIView addSubview:](self->_cardContentView, "addSubview:", self->_distanceLabel);
  -[UIView addSubview:](self->_cardContentView, "addSubview:", self->_descriptionLabel);
  -[RouteCreationCardView addSubview:](self, "addSubview:", self->_buttonStackView);
  v57 = self->_directionsButton;
  v156[0] = self->_saveButton;
  v156[1] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 2));
  -[MultilineStackView setArrangedSubviews:](self->_buttonStackView, "setArrangedSubviews:", v58);

  v147 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v31, "leadingAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView leadingAnchor](self, "leadingAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:constant:", v146, 16.0));
  v155[0] = v145;
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v31, "trailingAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView trailingAnchor](self, "trailingAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:constant:", v143, -16.0));
  v155[1] = v142;
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v31, "topAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView topAnchor](self, "topAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v140));
  v155[2] = v139;
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v31, "heightAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToConstant:", 48.0));
  v155[3] = v137;
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton leadingAnchor](self->_reverseButton, "leadingAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v31, "leadingAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:", v135));
  v155[4] = v134;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton leadingAnchor](self->_outAndBackButton, "leadingAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton trailingAnchor](self->_reverseButton, "trailingAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "constraintEqualToAnchor:constant:", v132, 8.0));
  v155[5] = v131;
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton leadingAnchor](self->_closeLoopButton, "leadingAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton trailingAnchor](self->_outAndBackButton, "trailingAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:constant:", v129, 8.0));
  v155[6] = v128;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton trailingAnchor](self->_closeLoopButton, "trailingAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v31, "trailingAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v126));
  v155[7] = v125;
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton widthAnchor](self->_reverseButton, "widthAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton widthAnchor](self->_outAndBackButton, "widthAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v123));
  v155[8] = v122;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton widthAnchor](self->_reverseButton, "widthAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton widthAnchor](self->_closeLoopButton, "widthAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v120));
  v155[9] = v119;
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton topAnchor](self->_reverseButton, "topAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v31, "topAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v117));
  v155[10] = v116;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton bottomAnchor](self->_reverseButton, "bottomAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v31, "bottomAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v113));
  v155[11] = v112;
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton topAnchor](self->_outAndBackButton, "topAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v31, "topAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v110));
  v155[12] = v109;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton bottomAnchor](self->_outAndBackButton, "bottomAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v31, "bottomAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v107));
  v155[13] = v106;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton topAnchor](self->_closeLoopButton, "topAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v31, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v104));
  v155[14] = v103;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton bottomAnchor](self->_closeLoopButton, "bottomAnchor"));
  v115 = v31;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v31, "bottomAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v101));
  v155[15] = v100;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_cardContentView, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView leadingAnchor](self, "leadingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v98, 16.0));
  v155[16] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_cardContentView, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView trailingAnchor](self, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:constant:", v95, -16.0));
  v155[17] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_cardContentView, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v31, "bottomAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, 16.0));
  v155[18] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_cardContentView, "bottomAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView bottomAnchor](self, "bottomAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintLessThanOrEqualToAnchor:constant:", v89, -16.0));
  v155[19] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_cardContentView, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, 14.0));
  v155[20] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_distanceLabel, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_cardContentView, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, -14.0));
  v155[21] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_distanceLabel, "topAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_cardContentView, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v80, 12.0));
  v155[22] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel leadingAnchor](self->_descriptionLabel, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v155[23] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel trailingAnchor](self->_descriptionLabel, "trailingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_distanceLabel, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v155[24] = v73;
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel topAnchor](self->_descriptionLabel, "topAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_distanceLabel, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "constraintEqualToAnchor:constant:", v153, -7.0));
  v155[25] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView leadingAnchor](self->_buttonStackView, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView leadingAnchor](self, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 16.0));
  v155[26] = v69;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView trailingAnchor](self->_buttonStackView, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView trailingAnchor](self, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, -16.0));
  v155[27] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView topAnchor](self->_buttonStackView, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_cardContentView, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, 16.0));
  v155[28] = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView bottomAnchor](self->_buttonStackView, "bottomAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView bottomAnchor](self, "bottomAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v66));
  v155[29] = v67;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v155, 30));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v68);

}

- (void)_pressedUndo
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  objc_msgSend(v3, "pressedUndo");

  -[RouteCreationCardView _updateButtons](self, "_updateButtons");
}

- (void)_pressedReverse
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  objc_msgSend(v3, "pressedReverse");

  -[RouteCreationCardView _updateButtons](self, "_updateButtons");
}

- (void)_pressedOutAndBack
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  objc_msgSend(v3, "pressedOutAndBack");

  -[RouteCreationCardView _updateButtons](self, "_updateButtons");
}

- (void)_pressedCloseLoop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  objc_msgSend(v3, "pressedCloseLoop");

  -[RouteCreationCardView _updateButtons](self, "_updateButtons");
}

- (void)_pressedStepping
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[UIButton setEnabled:](self->_directionsButton, "setEnabled:", 0);
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100974BA8;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "pressedStartSteppingWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_pressedNav
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[UIButton setEnabled:](self->_directionsButton, "setEnabled:", 0);
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100974D5C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "pressedStartNavigationWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_pressedRoutePlanning
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  objc_msgSend(v2, "pressedRoutePlanning");

}

- (void)_pressedSave
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  objc_msgSend(v2, "pressedSave");

}

- (void)_unitsDidChange
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  self->_isMetric = objc_msgSend(v3, "_navigation_distanceUsesMetricSystem");

  -[RouteCreationCardView _drawChart](self, "_drawChart");
}

- (void)_updateGraphView
{
  void *v3;
  UIViewController *graphViewController;
  double v5;
  NSNumber *v6;
  NSNumber *renderedGraphWidth;
  void *v8;
  void *v9;
  _BOOL8 isMetric;
  void *v11;
  UIViewController *v12;
  UIViewController *v13;
  UIViewController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
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
  id v32;
  NSObject *v33;
  id v34;
  char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  CGRect v50;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_graphViewController, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  graphViewController = self->_graphViewController;
  self->_graphViewController = 0;

  -[RouteCreationCardView frame](self, "frame");
  v5 = CGRectGetWidth(v50) + -32.0;
  if (v5 >= 2.22044605e-16)
  {
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
    renderedGraphWidth = self->_renderedGraphWidth;
    self->_renderedGraphWidth = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsElevationChartStyle navigationLineStyle](_TtC4Maps23MapsElevationChartStyle, "navigationLineStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    isMetric = self->_isMetric;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView traitCollection](self, "traitCollection"));
    v12 = (UIViewController *)objc_claimAutoreleasedReturnValue(+[MapsElevationGraphViewController makeHostingControllerFor:width:isMetric:traitCollection:shouldHighlight:chartStyle:currentPosition:](_TtC4Maps32MapsElevationGraphViewController, "makeHostingControllerFor:width:isMetric:traitCollection:shouldHighlight:chartStyle:currentPosition:", v9, isMetric, v11, 0, v8, self->_zeroMeters, v5));
    v13 = self->_graphViewController;
    self->_graphViewController = v12;

    v14 = self->_graphViewController;
    if (v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(-[UIViewController view](v14, "view"));
      -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[NSObject setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[NSObject setBackgroundColor:](v15, "setBackgroundColor:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
      if (objc_msgSend(v17, "isValid"))
        v18 = -8.0;
      else
        v18 = -3.0;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
      v20 = 0.0;
      if (objc_msgSend(v19, "isValid"))
        v21 = 82.0;
      else
        v21 = 0.0;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
      if (objc_msgSend(v22, "isValid"))
        v20 = 10.0;

      -[UIView addSubview:](self->_cardContentView, "addSubview:", v15);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject leadingAnchor](v15, "leadingAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_cardContentView, "leadingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
      v43[0] = v40;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject trailingAnchor](v15, "trailingAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_cardContentView, "trailingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
      v43[1] = v37;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bottomAnchor](v15, "bottomAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_cardContentView, "bottomAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v23, v18));
      v43[2] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject heightAnchor](v15, "heightAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", v21));
      v43[3] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject topAnchor](v15, "topAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel bottomAnchor](self->_descriptionLabel, "bottomAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, v20));
      v43[4] = v29;
      v30 = v8;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 5));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

      v8 = v30;
    }
    else
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v45 = "-[RouteCreationCardView _updateGraphView]";
        v46 = 2080;
        v47 = "RouteCreationCardView.m";
        v48 = 1024;
        v49 = 317;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (!sub_100A70734())
        goto LABEL_13;
      v34 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v45 = v35;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }

LABEL_13:
  }
}

- (void)_drawChart
{
  void *v3;

  if (self->_graphViewController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));

    if (v3)
      -[RouteCreationCardView _updateGraphView](self, "_updateGraphView");
  }
}

- (void)_updateButtons
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  -[RouteCreationIconButton setEnabled:](self->_reverseButton, "setEnabled:", objc_msgSend(v3, "reverseEnabled"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  -[RouteCreationIconButton setEnabled:](self->_outAndBackButton, "setEnabled:", objc_msgSend(v4, "outAndBackEnabled"));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView editingDelegate](self, "editingDelegate"));
  -[RouteCreationIconButton setEnabled:](self->_closeLoopButton, "setEnabled:", objc_msgSend(v5, "closeLoopEnabled"));

}

- (void)_updateDirectionsButtonWithSuggestedMode:(unint64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  UIButton **p_saveButton;
  UIButton *directionsButton;
  void *v10;
  void *v11;
  UIButton *v12;
  _QWORD *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  UIButton *v24;
  void *v25;
  void *v26;
  UIButton *v27;
  void *v28;
  UIButton *v29;
  void *v30;
  void *v31;
  UIButton *v32;
  id v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[8];
  _QWORD v38[2];
  _QWORD v39[2];
  UIButton *v40;
  _QWORD v41[2];
  UIButton *saveButton;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_primaryCardFooterActionButtonConfiguration"));
  if (a3 == 4)
  {
    directionsButton = self->_directionsButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Directions"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](directionsButton, "setTitle:forState:", v11, 0);

    -[UIButton removeTarget:action:forControlEvents:](self->_directionsButton, "removeTarget:action:forControlEvents:", self, 0, 64);
    -[UIButton addTarget:action:forControlEvents:](self->_directionsButton, "addTarget:action:forControlEvents:", self, "_pressedRoutePlanning", 64);
    v12 = self->_directionsButton;
    v38[0] = self->_saveButton;
    v38[1] = v12;
    v13 = v38;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      v6 = sub_1004320DC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Hiding stepping button because it is not supported on this platform", buf, 2u);
      }

      saveButton = self->_saveButton;
      p_saveButton = &saveButton;
LABEL_15:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_saveButton, 1));
      goto LABEL_16;
    }
    v29 = self->_directionsButton;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Directions"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v29, "setTitle:forState:", v31, 0);

    -[UIButton removeTarget:action:forControlEvents:](self->_directionsButton, "removeTarget:action:forControlEvents:", self, 0, 64);
    -[UIButton addTarget:action:forControlEvents:](self->_directionsButton, "addTarget:action:forControlEvents:", self, "_pressedStepping", 64);
    v32 = self->_directionsButton;
    v41[0] = self->_saveButton;
    v41[1] = v32;
    v13 = v41;
LABEL_11:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
LABEL_16:
    -[MultilineStackView setArrangedSubviews:](self->_buttonStackView, "setArrangedSubviews:", v19);
    goto LABEL_17;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v15 = objc_msgSend(v14, "supportsNavigation");

  if ((v15 & 1) == 0)
  {
    v33 = sub_1004320DC();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Hiding GO button because it is not supported on this platform", buf, 2u);
    }

    v40 = self->_saveButton;
    p_saveButton = &v40;
    goto LABEL_15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "background"));
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleTitle3, UIFontWeightBold));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_cappedFont:withMaxPoint:](UIFont, "_maps_cappedFont:withMaxPoint:", v18, 34.0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fontDescriptor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fontDescriptorWithDesign:", UIFontDescriptorSystemDesignRounded));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v21, 0.0));

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100975A04;
  v35[3] = &unk_1011AFCC0;
  v36 = v22;
  v23 = v22;
  objc_msgSend(v5, "setTitleTextAttributesTransformer:", v35);
  v24 = self->_directionsButton;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Route Creation] GO"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v24, "setTitle:forState:", v26, 0);

  -[UIButton removeTarget:action:forControlEvents:](self->_directionsButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_directionsButton, "addTarget:action:forControlEvents:", self, "_pressedNav", 64);
  v27 = self->_directionsButton;
  v39[0] = self->_saveButton;
  v39[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  -[MultilineStackView setArrangedSubviews:](self->_buttonStackView, "setArrangedSubviews:", v28);

LABEL_17:
  -[UIButton setConfiguration:](self->_directionsButton, "setConfiguration:", v5);
  -[MultilineStackView invalidateLayout](self->_buttonStackView, "invalidateLayout");

}

- (void)setRoute:(id)a3
{
  GEOComposedGeometryRoutePersistentData *v5;
  GEOComposedGeometryRoutePersistentData *routeData;
  GEOComposedGeometryRoutePersistentData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];

  v21 = a3;
  objc_storeStrong((id *)&self->_route, a3);
  v5 = (GEOComposedGeometryRoutePersistentData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "persistentData"));
  routeData = self->_routeData;
  self->_routeData = v5;

  v7 = self->_routeData;
  v28[0] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleTitle2, UIFontWeightSemibold));
  v29[0] = v8;
  v28[1] = NSForegroundColorAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v29[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData distanceStringWithAttributes:](v7, "distanceStringWithAttributes:", v10));
  -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v11);

  v26[0] = NSFontAttributeName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v26[1] = NSForegroundColorAttributeName;
  v27[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v27[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeAndElevationDescriptionStringWithAttributes:", v14));
  -[MapsThemeMultiPartLabel setMultiPartString:](self->_descriptionLabel, "setMultiPartString:", v15);

  -[RouteCreationCardView _updateGraphView](self, "_updateGraphView");
  -[RouteCreationCardView _updateButtons](self, "_updateButtons");
  if (self->_route)
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100975DA8;
    v22[3] = &unk_1011DD078;
    objc_copyWeak(&v24, &location);
    v23 = v21;
    v16 = objc_retainBlock(v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastLocation"));
    ((void (*)(_QWORD *, void *, _QWORD))v16[2])(v16, v18, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "singleLocationUpdateWithHandler:", v16));

    objc_msgSend(v20, "start");
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    -[RouteCreationCardView _updateDirectionsButtonWithSuggestedMode:](self, "_updateDirectionsButtonWithSuggestedMode:", 2);
  }

}

- (void)setEditingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editingDelegate, a3);
  -[RouteCreationCardView _updateButtons](self, "_updateButtons");
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  NSNumber *renderedGraphWidth;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)RouteCreationCardView;
  -[RouteCreationCardView layoutSubviews](&v9, "layoutSubviews");
  v3 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
  if (v3)
  {
    v4 = (void *)v3;
    renderedGraphWidth = self->_renderedGraphWidth;
    if (renderedGraphWidth)
    {
      -[NSNumber cgFloatValue](renderedGraphWidth, "cgFloatValue");
      v7 = v6;
      -[RouteCreationCardView frame](self, "frame");
      v8 = vabdd_f64(v7, CGRectGetWidth(v10));

      if (v8 < 1.0)
        return;
    }
    else
    {

    }
    -[RouteCreationCardView _updateGraphView](self, "_updateGraphView");
  }
}

- (UIButton)saveButton
{
  return self->_saveButton;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (RouteCreationEditingDelegate)editingDelegate
{
  return (RouteCreationEditingDelegate *)objc_loadWeakRetained((id *)&self->_editingDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editingDelegate);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_closeLoopButton, 0);
  objc_storeStrong((id *)&self->_outAndBackButton, 0);
  objc_storeStrong((id *)&self->_reverseButton, 0);
  objc_storeStrong((id *)&self->_graphViewController, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_cardContentView, 0);
  objc_storeStrong((id *)&self->_renderedGraphWidth, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_zeroMeters, 0);
}

@end
