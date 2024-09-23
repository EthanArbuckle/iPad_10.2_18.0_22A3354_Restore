@implementation ManeuverBannerView

- (ManeuverBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  ManeuverBannerView *v5;
  ManeuverBannerView *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  GuidanceManeuverView *v10;
  double y;
  double width;
  double height;
  GuidanceManeuverView *v14;
  GuidanceManeuverView *maneuverImageView;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ManeuverAccessoryView *v27;
  ManeuverAccessoryView *leadingManeuverView;
  ManeuverAccessoryView *v29;
  ManeuverAccessoryView *minimalManeuverView;
  ManeuverAccessoryView *v31;
  ManeuverAccessoryView *detachedMinimalManeuverView;
  DistanceAccessoryView *v33;
  DistanceAccessoryView *apertureDistanceLabel;
  UIView *v35;
  UIView *leadingConcentricContent;
  void *v37;
  UIView *v38;
  UIView *obstructedArea;
  void *v40;
  UIView *v41;
  UIView *trailingConcentricContent;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  UIActivityIndicatorView *v60;
  UIActivityIndicatorView *activityView;
  NavSignLaneGuidanceView *v62;
  NavSignLaneGuidanceView *laneGuidanceView;
  void *v64;
  void *v65;
  void *v66;
  UILabel *v67;
  UILabel *distanceLabel;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  UILabel *v74;
  UILabel *descriptionLabel;
  double v76;
  void *v77;
  UIImageView *v78;
  UIImageView *exitShield;
  double v80;
  double v81;
  double v82;
  double v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  UIButton *endButton;
  void *v89;
  void *v90;
  uint64_t v91;
  UIButton *pauseButton;
  void *v93;
  void *v94;
  uint64_t v95;
  UIButton *nextButton;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  UIButton *walkingButton;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  UIButton *findMyButton;
  void *v107;
  void *v108;
  void *v109;
  id *v110;
  uint64_t v111;
  id v112;
  AxisAdjustingStackView *v113;
  id v114;
  AxisAdjustingStackView *v115;
  MapsBannerContent *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  NSLayoutConstraint *distanceLabelTopConstraint;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  NSLayoutConstraint *laneGuidanceTopConstraint;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  NSLayoutConstraint *leadingViewLeadingConstraint;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  uint64_t v142;
  NSArray *collapsedConstraints;
  UIView *v144;
  void *v145;
  double v146;
  void *v147;
  UIView *v148;
  void *v149;
  double v150;
  void *v151;
  UIView *v152;
  void *v153;
  double v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  NSArray *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  NSArray *expandedConstraints;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
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
  id v189;
  _QWORD v190[4];
  id *v191;
  objc_super v192;
  _QWORD v193[4];
  _QWORD v194[2];

  v192.receiver = self;
  v192.super_class = (Class)ManeuverBannerView;
  v5 = -[MapsBannerView initWithTarget:item:aperturePresentation:](&v192, "initWithTarget:item:aperturePresentation:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[ManeuverBannerView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v9);

    v10 = [GuidanceManeuverView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v14 = -[GuidanceManeuverView initWithFrame:textureProvider:](v10, "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    maneuverImageView = v6->_maneuverImageView;
    v6->_maneuverImageView = v14;

    -[GuidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:](v6->_maneuverImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1148846080;
    -[GuidanceManeuverView _maps_setAllContentHuggingAndCompressionResistancePriorities:](v6->_maneuverImageView, "_maps_setAllContentHuggingAndCompressionResistancePriorities:", v16);
    -[GuidanceManeuverView setContentMode:](v6->_maneuverImageView, "setContentMode:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](v6->_maneuverImageView, "widthAnchor"));
    LODWORD(v18) = 1132068864;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:priority:", 46.0, v18));
    objc_msgSend(v19, "setActive:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](v6->_maneuverImageView, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToConstant:", 46.0));
    objc_msgSend(v21, "setActive:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](v6->_maneuverImageView, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 46.0));
    objc_msgSend(v23, "setActive:", 1);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView theme](v6, "theme"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "navSignGuidanceManeuverColor"));
    -[GuidanceManeuverView setArrowColor:](v6->_maneuverImageView, "setArrowColor:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bannerJunctionColor](UIColor, "bannerJunctionColor"));
    -[GuidanceManeuverView setAccentColor:](v6->_maneuverImageView, "setAccentColor:", v26);

    -[GuidanceManeuverView setFraming:](v6->_maneuverImageView, "setFraming:", 1);
    if (-[MapsBannerView aperturePresentation](v6, "aperturePresentation"))
    {
      v27 = -[ManeuverAccessoryView initForDetached:]([ManeuverAccessoryView alloc], "initForDetached:", 0);
      leadingManeuverView = v6->_leadingManeuverView;
      v6->_leadingManeuverView = v27;

      -[ManeuverAccessoryView setUsesArrowMetricsReferenceSize:](v6->_leadingManeuverView, "setUsesArrowMetricsReferenceSize:", 0);
      -[ManeuverAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v6->_leadingManeuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[ManeuverBannerView addSubview:](v6, "addSubview:", v6->_leadingManeuverView);
      v29 = -[ManeuverAccessoryView initForDetached:]([ManeuverAccessoryView alloc], "initForDetached:", 0);
      minimalManeuverView = v6->_minimalManeuverView;
      v6->_minimalManeuverView = v29;

      -[ManeuverAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v6->_minimalManeuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[ManeuverBannerView addSubview:](v6, "addSubview:", v6->_minimalManeuverView);
      v31 = -[ManeuverAccessoryView initForDetached:]([ManeuverAccessoryView alloc], "initForDetached:", 1);
      detachedMinimalManeuverView = v6->_detachedMinimalManeuverView;
      v6->_detachedMinimalManeuverView = v31;

      -[ManeuverAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v6->_detachedMinimalManeuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[ManeuverBannerView addSubview:](v6, "addSubview:", v6->_detachedMinimalManeuverView);
      v33 = -[DistanceAccessoryView initWithFrame:]([DistanceAccessoryView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      apertureDistanceLabel = v6->_apertureDistanceLabel;
      v6->_apertureDistanceLabel = v33;

      -[DistanceAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v6->_apertureDistanceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[ManeuverBannerView addSubview:](v6, "addSubview:", v6->_apertureDistanceLabel);
      if (GEOConfigGetBOOL(MapsConfig_DebugShowApertureLayoutGuideAreas, off_1014B4AA8))
      {
        v35 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
        leadingConcentricContent = v6->_leadingConcentricContent;
        v6->_leadingConcentricContent = v35;

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](UIColor, "systemDarkGrayColor"));
        -[UIView setBackgroundColor:](v6->_leadingConcentricContent, "setBackgroundColor:", v37);

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_leadingConcentricContent, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[ManeuverAccessoryView insertSubview:atIndex:](v6->_leadingManeuverView, "insertSubview:atIndex:", v6->_leadingConcentricContent, 0);
        v38 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
        obstructedArea = v6->_obstructedArea;
        v6->_obstructedArea = v38;

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](UIColor, "systemDarkGrayColor"));
        -[UIView setBackgroundColor:](v6->_obstructedArea, "setBackgroundColor:", v40);

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_obstructedArea, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[ManeuverAccessoryView insertSubview:atIndex:](v6->_leadingManeuverView, "insertSubview:atIndex:", v6->_obstructedArea, 1);
        v41 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
        trailingConcentricContent = v6->_trailingConcentricContent;
        v6->_trailingConcentricContent = v41;

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](UIColor, "systemDarkGrayColor"));
        -[UIView setBackgroundColor:](v6->_trailingConcentricContent, "setBackgroundColor:", v43);

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_trailingConcentricContent, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[DistanceAccessoryView insertSubview:atIndex:](v6->_apertureDistanceLabel, "insertSubview:atIndex:", v6->_trailingConcentricContent, 0);
      }
      if (GEOConfigGetBOOL(MapsConfig_DebugShowApertureViewFrames, off_1014B4AB8))
      {
        v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor")));
        v45 = objc_msgSend(v44, "CGColor");
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView layer](v6->_leadingManeuverView, "layer"));
        objc_msgSend(v46, "setBorderColor:", v45);

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView layer](v6->_leadingManeuverView, "layer"));
        objc_msgSend(v47, "setBorderWidth:", 1.0);

        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor")));
        v49 = objc_msgSend(v48, "CGColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView layer](v6->_apertureDistanceLabel, "layer"));
        objc_msgSend(v50, "setBorderColor:", v49);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView layer](v6->_apertureDistanceLabel, "layer"));
        objc_msgSend(v51, "setBorderWidth:", 1.0);

        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor")));
        v53 = objc_msgSend(v52, "CGColor");
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView layer](v6->_minimalManeuverView, "layer"));
        objc_msgSend(v54, "setBorderColor:", v53);

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView layer](v6->_minimalManeuverView, "layer"));
        objc_msgSend(v55, "setBorderWidth:", 1.0);

        v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor")));
        v57 = objc_msgSend(v56, "CGColor");
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView layer](v6->_detachedMinimalManeuverView, "layer"));
        objc_msgSend(v58, "setBorderColor:", v57);

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView layer](v6->_detachedMinimalManeuverView, "layer"));
        objc_msgSend(v59, "setBorderWidth:", 1.0);

      }
      v60 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      activityView = v6->_activityView;
      v6->_activityView = v60;

      -[UIActivityIndicatorView setAccessibilityIdentifier:](v6->_activityView, "setAccessibilityIdentifier:", CFSTR("ActivityView"));
      -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v6->_activityView, "setActivityIndicatorViewStyle:", 101);
      -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v6->_activityView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIActivityIndicatorView setHidden:](v6->_activityView, "setHidden:", 0);
      -[ManeuverBannerView addSubview:](v6, "addSubview:", v6->_activityView);
    }
    v62 = -[NavSignLaneGuidanceView initWithLaneStyle:]([NavSignLaneGuidanceView alloc], "initWithLaneStyle:", 0);
    laneGuidanceView = v6->_laneGuidanceView;
    v6->_laneGuidanceView = v62;

    -[NavSignLaneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:](v6->_laneGuidanceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bannerJunctionColor](UIColor, "bannerJunctionColor"));
    -[NavSignLaneGuidanceView setInvalidArrowColor:](v6->_laneGuidanceView, "setInvalidArrowColor:", v64);

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView heightAnchor](v6->_laneGuidanceView, "heightAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintLessThanOrEqualToConstant:", 46.0));
    objc_msgSend(v66, "setActive:", 1);

    v67 = objc_opt_new(UILabel);
    distanceLabel = v6->_distanceLabel;
    v6->_distanceLabel = v67;

    -[UILabel setAccessibilityIdentifier:](v6->_distanceLabel, "setAccessibilityIdentifier:", CFSTR("DistanceLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_distanceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v69) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_distanceLabel, "setContentHuggingPriority:forAxis:", 0, v69);
    LODWORD(v70) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_distanceLabel, "setContentHuggingPriority:forAxis:", 1, v70);
    LODWORD(v71) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_distanceLabel, "setContentCompressionResistancePriority:forAxis:", 0, v71);
    LODWORD(v72) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_distanceLabel, "setContentCompressionResistancePriority:forAxis:", 1, v72);
    -[UILabel setNumberOfLines:](v6->_distanceLabel, "setNumberOfLines:", 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](v6, "_distanceFont"));
    -[UILabel setFont:](v6->_distanceLabel, "setFont:", v73);

    v74 = objc_opt_new(UILabel);
    descriptionLabel = v6->_descriptionLabel;
    v6->_descriptionLabel = v74;

    -[UILabel setAccessibilityIdentifier:](v6->_descriptionLabel, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v76) = 1148846080;
    -[UILabel _maps_setAllContentHuggingAndCompressionResistancePriorities:](v6->_descriptionLabel, "_maps_setAllContentHuggingAndCompressionResistancePriorities:", v76);
    -[UILabel setNumberOfLines:](v6->_descriptionLabel, "setNumberOfLines:", 3);
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _descriptionFont](v6, "_descriptionFont"));
    -[UILabel setFont:](v6->_descriptionLabel, "setFont:", v77);

    v78 = objc_opt_new(UIImageView);
    exitShield = v6->_exitShield;
    v6->_exitShield = v78;

    -[UIImageView setAccessibilityIdentifier:](v6->_exitShield, "setAccessibilityIdentifier:", CFSTR("ExitShield"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_exitShield, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v6->_exitShield, "setContentMode:", 1);
    LODWORD(v80) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v6->_exitShield, "setContentHuggingPriority:forAxis:", 0, v80);
    LODWORD(v81) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v6->_exitShield, "setContentHuggingPriority:forAxis:", 1, v81);
    LODWORD(v82) = 1144750080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v6->_exitShield, "setContentCompressionResistancePriority:forAxis:", 0, v82);
    LODWORD(v83) = 1144750080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v6->_exitShield, "setContentCompressionResistancePriority:forAxis:", 1, v83);
    v84 = 0;
    if (-[MapsBannerView aperturePresentation](v6, "aperturePresentation"))
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("[Nav Banner] End Route"), CFSTR("localized string not found"), 0));
      v185 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v86, 0, 0, &stru_1011B2768));

      objc_msgSend(v185, "setAttributes:", (unint64_t)objc_msgSend(v185, "attributes") | 2);
      v87 = objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _buttonWithAction:](v6, "_buttonWithAction:", v185));
      endButton = v6->_endButton;
      v6->_endButton = (UIButton *)v87;

      -[UIButton setAccessibilityIdentifier:](v6->_endButton, "setAccessibilityIdentifier:", CFSTR("EndButton"));
      -[UIButton setHidden:](v6->_endButton, "setHidden:", 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("[Nav Banner] Pause Route"), CFSTR("localized string not found"), 0));
      v184 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v90, 0, 0, &stru_1011B2788));

      objc_msgSend(v184, "setAttributes:", (unint64_t)objc_msgSend(v184, "attributes") | 2);
      v91 = objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _buttonWithAction:](v6, "_buttonWithAction:", v184));
      pauseButton = v6->_pauseButton;
      v6->_pauseButton = (UIButton *)v91;

      -[UIButton setAccessibilityIdentifier:](v6->_pauseButton, "setAccessibilityIdentifier:", CFSTR("PauseButton"));
      -[UIButton setHidden:](v6->_pauseButton, "setHidden:", 1);
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("[Nav Banner] Next Stop"), CFSTR("localized string not found"), 0));
      v183 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v94, 0, 0, &stru_1011B27A8));

      v95 = objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _buttonWithAction:](v6, "_buttonWithAction:", v183));
      nextButton = v6->_nextButton;
      v6->_nextButton = (UIButton *)v95;

      -[UIButton setAccessibilityIdentifier:](v6->_nextButton, "setAccessibilityIdentifier:", CFSTR("NextButton"));
      -[UIButton setHidden:](v6->_nextButton, "setHidden:", 1);
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "alternateWalkingRouteDisplayETAInfo"));

      v98 = GEOStringForDuration(2, (double)(unint64_t)objc_msgSend(v182, "remainingMinutesToEndOfRoute") * 60.0);
      v181 = (void *)objc_claimAutoreleasedReturnValue(v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("figure.walk")));
      v180 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v181, v99, 0, &stru_1011B27C8));

      v100 = objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _buttonWithAction:](v6, "_buttonWithAction:", v180));
      walkingButton = v6->_walkingButton;
      v6->_walkingButton = (UIButton *)v100;

      -[UIButton setAccessibilityIdentifier:](v6->_walkingButton, "setAccessibilityIdentifier:", CFSTR("WalkingButton"));
      -[UIButton setHidden:](v6->_walkingButton, "setHidden:", 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("[Nav Banner] Find My"), CFSTR("localized string not found"), 0));
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("findmy")));
      v179 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v103, v104, 0, &stru_1011B27E8));

      v105 = objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _buttonWithAction:](v6, "_buttonWithAction:", v179));
      findMyButton = v6->_findMyButton;
      v6->_findMyButton = (UIButton *)v105;

      -[UIButton setAccessibilityIdentifier:](v6->_findMyButton, "setAccessibilityIdentifier:", CFSTR("FindMyButton"));
      -[UIButton setHidden:](v6->_findMyButton, "setHidden:", 1);
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "localizedStringForKey:value:table:", CFSTR("[Nav Banner] EV Stations"), CFSTR("localized string not found"), 0));
      v109 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("magnifyingglass")));
      v190[0] = _NSConcreteStackBlock;
      v190[1] = 3221225472;
      v190[2] = sub_10034E7AC;
      v190[3] = &unk_1011B2810;
      v110 = v6;
      v191 = v110;
      v178 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v108, v109, 0, v190));

      v111 = objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "_buttonWithAction:", v178));
      v112 = v110[19];
      v110[19] = (id)v111;

      objc_msgSend(v110[19], "setAccessibilityIdentifier:", CFSTR("EVStationsButton"));
      objc_msgSend(v110[19], "setHidden:", 1);
      v113 = -[AxisAdjustingStackView initWithFrame:]([AxisAdjustingStackView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      -[AxisAdjustingStackView setTranslatesAutoresizingMaskIntoConstraints:](v113, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[AxisAdjustingStackView setDistribution:](v113, "setDistribution:", 1);
      -[AxisAdjustingStackView setAlignment:](v113, "setAlignment:", 0);
      -[AxisAdjustingStackView setAccessibilityIdentifier:](v113, "setAccessibilityIdentifier:", CFSTR("ActionButtonStackView"));
      -[AxisAdjustingStackView setSpacing:](v113, "setSpacing:", 10.0);
      -[AxisAdjustingStackView setDelegate:](v113, "setDelegate:", v110);
      -[AxisAdjustingStackView _maps_addArrangedExpandingSubview:](v113, "_maps_addArrangedExpandingSubview:", v110[19]);
      -[AxisAdjustingStackView _maps_addArrangedExpandingSubview:](v113, "_maps_addArrangedExpandingSubview:", v6->_nextButton);
      -[AxisAdjustingStackView _maps_addArrangedExpandingSubview:](v113, "_maps_addArrangedExpandingSubview:", v6->_findMyButton);
      -[AxisAdjustingStackView _maps_addArrangedExpandingSubview:](v113, "_maps_addArrangedExpandingSubview:", v6->_walkingButton);
      -[AxisAdjustingStackView _maps_addArrangedExpandingSubview:](v113, "_maps_addArrangedExpandingSubview:", v6->_pauseButton);
      -[AxisAdjustingStackView _maps_addArrangedExpandingSubview:](v113, "_maps_addArrangedExpandingSubview:", v6->_endButton);
      -[AxisAdjustingStackView addTruncatableView:](v113, "addTruncatableView:", v110[19]);
      -[AxisAdjustingStackView addTruncatableView:](v113, "addTruncatableView:", v6->_nextButton);
      -[AxisAdjustingStackView addTruncatableView:](v113, "addTruncatableView:", v6->_findMyButton);
      -[AxisAdjustingStackView addTruncatableView:](v113, "addTruncatableView:", v6->_walkingButton);
      -[AxisAdjustingStackView addTruncatableView:](v113, "addTruncatableView:", v6->_pauseButton);
      -[AxisAdjustingStackView addTruncatableView:](v113, "addTruncatableView:", v6->_endButton);
      v114 = v110[13];
      v110[13] = v113;
      v115 = v113;

      objc_msgSend(v110[13], "setHidden:", 1);
      v84 = v110[13];

    }
    v116 = -[MapsBannerContent initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:]([MapsBannerContent alloc], "initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:", v6->_laneGuidanceView, v6->_maneuverImageView, v6->_distanceLabel, v6->_exitShield, v6->_descriptionLabel, v84);
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](v6, "contentView"));
    objc_msgSend(v117, "setContent:", v116);

    if (-[MapsBannerView aperturePresentation](v6, "aperturePresentation"))
    {
      v189 = v84;
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _tightBoundingBoxLayoutGuide](v6->_distanceLabel, "_tightBoundingBoxLayoutGuide"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "topAnchor"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](v6, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "bottomAnchor"));
      v122 = objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v121));
      distanceLabelTopConstraint = v6->_distanceLabelTopConstraint;
      v6->_distanceLabelTopConstraint = (NSLayoutConstraint *)v122;

      LODWORD(v124) = 1144750080;
      -[NSLayoutConstraint setPriority:](v6->_distanceLabelTopConstraint, "setPriority:", v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView topAnchor](v6->_laneGuidanceView, "topAnchor"));
      v126 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](v6, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "bottomAnchor"));
      v128 = objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToAnchor:", v127));
      laneGuidanceTopConstraint = v6->_laneGuidanceTopConstraint;
      v6->_laneGuidanceTopConstraint = (NSLayoutConstraint *)v128;

      LODWORD(v130) = 1144750080;
      -[NSLayoutConstraint setPriority:](v6->_laneGuidanceTopConstraint, "setPriority:", v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView leadingAnchor](v6->_leadingManeuverView, "leadingAnchor"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureLeadingConcentricContentLayoutGuide](v6, "SBUISA_systemApertureLeadingConcentricContentLayoutGuide"));
      v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "leadingAnchor"));
      -[MapsBannerView bannerAccessoryViewLeadingInset](v6, "bannerAccessoryViewLeadingInset");
      v134 = objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:constant:", v133));
      leadingViewLeadingConstraint = v6->_leadingViewLeadingConstraint;
      v6->_leadingViewLeadingConstraint = (NSLayoutConstraint *)v134;

      LODWORD(v136) = 1144750080;
      -[NSLayoutConstraint setPriority:](v6->_leadingViewLeadingConstraint, "setPriority:", v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureTrailingConcentricContentLayoutGuide](v6, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide"));
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "trailingAnchor"));
      v139 = (void *)objc_claimAutoreleasedReturnValue(-[DistanceAccessoryView trailingAnchor](v6->_apertureDistanceLabel, "trailingAnchor"));
      -[MapsBannerView bannerAccessoryViewTrailingInset](v6, "bannerAccessoryViewTrailingInset");
      v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:constant:", v139));

      LODWORD(v141) = 1144750080;
      objc_msgSend(v140, "setPriority:", v141);
      v194[0] = v6->_leadingViewLeadingConstraint;
      v194[1] = v140;
      v188 = v140;
      v142 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v194, 2));
      collapsedConstraints = v6->_collapsedConstraints;
      v6->_collapsedConstraints = (NSArray *)v142;

      if (GEOConfigGetBOOL(MapsConfig_DebugShowApertureLayoutGuideAreas, off_1014B4AA8))
      {
        v144 = v6->_leadingConcentricContent;
        v145 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureLeadingConcentricContentLayoutGuide](v6, "SBUISA_systemApertureLeadingConcentricContentLayoutGuide"));
        LODWORD(v146) = 1144750080;
        v147 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](v144, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v145, v146));

        v148 = v6->_obstructedArea;
        v149 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](v6, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
        LODWORD(v150) = 1144750080;
        v151 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](v148, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v149, v150));

        v152 = v6->_trailingConcentricContent;
        v153 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureTrailingConcentricContentLayoutGuide](v6, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide"));
        LODWORD(v154) = 1144750080;
        v155 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](v152, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v153, v154));

        v156 = objc_alloc_init((Class)NSMutableArray);
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "allConstraints"));
        objc_msgSend(v156, "addObjectsFromArray:", v157);

        v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "allConstraints"));
        objc_msgSend(v156, "addObjectsFromArray:", v158);

        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "allConstraints"));
        objc_msgSend(v156, "addObjectsFromArray:", v159);

        v160 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v6->_collapsedConstraints, "arrayByAddingObjectsFromArray:", v156));
        v161 = v6->_collapsedConstraints;
        v6->_collapsedConstraints = (NSArray *)v160;

      }
      v187 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView heightAnchor](v6->_activityView, "heightAnchor", v178));
      v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "constraintEqualToConstant:", 30.0));
      v193[0] = v186;
      v162 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView widthAnchor](v6->_activityView, "widthAnchor"));
      v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToConstant:", 30.0));
      v193[1] = v163;
      v164 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](v6->_activityView, "trailingAnchor"));
      v165 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](v6, "contentView"));
      v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "trailingAnchor"));
      v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "constraintEqualToAnchor:", v166));
      v193[2] = v167;
      v168 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v6->_activityView, "centerYAnchor"));
      v169 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v6->_distanceLabel, "centerYAnchor"));
      v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToAnchor:", v169));
      v193[3] = v170;
      v171 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v193, 4));
      expandedConstraints = v6->_expandedConstraints;
      v6->_expandedConstraints = (NSArray *)v171;

      v84 = v189;
    }
    v173 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v6->_exitShield, "widthAnchor", v178));
    v174 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](v6, "contentView"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "widthAnchor"));
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "constraintLessThanOrEqualToAnchor:multiplier:", v175, 0.349999994));
    objc_msgSend(v176, "setActive:", 1);

    -[ManeuverBannerView updateFromBannerItem](v6, "updateFromBannerItem");
    v6->_cachedHeight = -1.0;
    v6->_calculatedWidth = -1.0;

  }
  return v6;
}

- (id)_buttonWithAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration sbui_systemApertureTextButtonConfiguration](UIButtonConfiguration, "sbui_systemApertureTextButtonConfiguration"));
  if ((objc_msgSend(v3, "attributes") & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    objc_msgSend(v4, "setBaseBackgroundColor:", v7);

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    objc_msgSend(v4, "setBaseBackgroundColor:", v5);

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  }
  v8 = (void *)v6;
  objc_msgSend(v4, "setBaseForegroundColor:", v6);

  objc_msgSend(v4, "setTitleLineBreakMode:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SBUISystemApertureButton buttonWithConfiguration:primaryAction:](SBUISystemApertureButton, "buttonWithConfiguration:primaryAction:", v4, v3));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 42.0));
  objc_msgSend(v12, "setActive:", 1);

  return v9;
}

- (void)setShowsControls:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;

  v3 = a3;
  v5 = -[MapsBannerView aperturePresentation](self, "aperturePresentation");
  if (self->_showsControls != (v5 & v3))
  {
    self->_showsControls = v5 & v3;
    -[ManeuverBannerView updateLayout](self, "updateLayout");
  }
}

- (BOOL)_isEligibleToShowWalkingButton
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findMyHandleID"));

  if (v4)
    v5 = &MapsConfig_AllowWalkingRouteSuggestionForGTHandles;
  else
    v5 = &MapsConfig_AllowWalkingRouteSuggestionForPOIs;
  v6 = &off_1014B4E58;
  if (v4)
    v6 = &off_1014B4E48;
  return GEOConfigGetBOOL(*v5, *v6);
}

- (BOOL)_isEligibleToShowFindMyButton
{
  return GEOConfigGetBOOL(MapsConfig_AllowGTSuggestionForGTHandles, off_1014B4F98);
}

- (void)updateLayout
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10034EC0C;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (id)majorText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maneuverGuidanceInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "majorText"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maneuverGuidanceInfo"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "minorText"));

  }
  return v7;
}

- (id)minorText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maneuverGuidanceInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "majorText"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverGuidanceInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minorText"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_distanceFont
{
  return +[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", 26.0, UIFontWeightHeavy);
}

- (id)_descriptionFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 26.0, UIFontWeightMedium);
}

- (void)updateFromBannerItem
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  void *v83;
  __CFString *v84;
  __CFString *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  _QWORD *v94;
  _QWORD *v95;
  double v96;
  double v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  double v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  UIImageView *exitShield;
  __int128 v126;
  NavSignShieldInfo *cachedShieldInfo;
  void *v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  UIImageView *v133;
  CGAffineTransform *v134;
  __int128 v135;
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
  id v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  unsigned int v160;
  void *v161;
  void *v162;
  void *v163;
  double v164;
  double v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  unsigned int v181;
  UILabel *distanceLabel;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  unsigned int v187;
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
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  _OWORD v202[3];
  _OWORD v203[3];
  CGAffineTransform v204;
  CGAffineTransform v205;
  _QWORD v206[3];
  _QWORD v207[3];
  _QWORD v208[3];
  _QWORD v209[3];
  _QWORD v210[2];
  _QWORD v211[2];
  _QWORD v212[2];
  _QWORD v213[2];
  _QWORD v214[2];
  _QWORD v215[2];
  _QWORD v216[2];
  _QWORD v217[2];
  _QWORD v218[2];
  _QWORD v219[2];
  _QWORD v220[2];
  _QWORD v221[2];
  _QWORD v222[2];
  _QWORD v223[2];
  _QWORD v224[2];
  _QWORD v225[2];
  _QWORD v226[2];
  _QWORD v227[2];
  _QWORD v228[2];
  _QWORD v229[2];
  _QWORD v230[2];
  _QWORD v231[2];
  _QWORD v232[2];
  _QWORD v233[2];
  _QWORD v234[2];
  _QWORD v235[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guidanceState"));
  v5 = objc_msgSend(v4, "isInArrivalState");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guidanceState"));
  v8 = objc_msgSend(v7, "isInParkingState");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "guidanceState"));
  v11 = objc_msgSend(v10, "isRerouting");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "maneuverGuidanceInfo"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resolvedColorWithTraitCollection:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resolvedColorWithTraitCollection:", v17));

  v199 = v5;
  v200 = v8;
  v201 = v11;
  v196 = v18;
  v197 = v15;
  if (v11)
  {
    v19 = objc_alloc((Class)NSAttributedString);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Rerouting"), CFSTR("localized string not found"), 0));
    v235[0] = v15;
    v234[0] = NSForegroundColorAttributeName;
    v234[1] = NSFontAttributeName;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
    v235[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v235, v234, 2));
    v24 = objc_msgSend(v19, "initWithString:attributes:", v21, v23);
    -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v24);

    v25 = v200;
    -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", 0);
    -[GuidanceManeuverView setManeuverArtwork:](self->_maneuverImageView, "setManeuverArtwork:", 0);
    -[NavSignLaneGuidanceView setLanes:](self->_laneGuidanceView, "setLanes:", 0);
    v26 = v198;
  }
  else if ((v5 | v8) == 1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "guidanceState"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "arrivalInfo"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "route"));

    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "destination"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "arrivalChargingStationInfo"));

    -[GuidanceManeuverView setManeuverArtwork:](self->_maneuverImageView, "setManeuverArtwork:", 0);
    -[NavSignLaneGuidanceView setLanes:](self->_laneGuidanceView, "setLanes:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    LODWORD(v28) = objc_msgSend(v33, "isArrivedAtEVCharger");

    v26 = v198;
    v190 = v31;
    v191 = v29;
    if ((_DWORD)v28)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "activeNavTrayGuidanceEvent"));

      v189 = v35;
      if (v35)
      {
        v36 = objc_alloc((Class)NSAttributedString);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "title"));
        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringWithDefaultOptions"));
        v39 = (void *)v38;
        if (v38)
          v40 = (const __CFString *)v38;
        else
          v40 = &stru_1011EB268;
        v233[0] = v18;
        v232[0] = NSForegroundColorAttributeName;
        v232[1] = NSFontAttributeName;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _descriptionFont](self, "_descriptionFont"));
        v233[1] = v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v233, v232, 2));
        v43 = objc_msgSend(v36, "initWithString:attributes:", v40, v42);
        -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v43);

        v44 = objc_alloc((Class)NSAttributedString);
        v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "detail"));
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "stringWithDefaultOptions"));
        v46 = (void *)v45;
        v230[1] = NSFontAttributeName;
        v231[0] = v197;
        if (v45)
          v47 = (const __CFString *)v45;
        else
          v47 = &stru_1011EB268;
        v230[0] = NSForegroundColorAttributeName;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
        v231[1] = v48;
        v49 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v231, v230, 2));
        v50 = objc_msgSend(v44, "initWithString:attributes:", v47, v49);
        -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v50);
      }
      else
      {
        objc_msgSend(v193, "chargingTime");
        v97 = v96;
        v98 = objc_alloc((Class)NSAttributedString);
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v100 = v99;
        if (v97 <= 0.0)
        {
          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "localizedStringForKey:value:table:", CFSTR("Charged [Nav Banner Title]"), CFSTR("localized string not found"), 0));
          v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v112));
          v225[0] = v18;
          v224[0] = NSForegroundColorAttributeName;
          v224[1] = NSFontAttributeName;
          v114 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _descriptionFont](self, "_descriptionFont"));
          v225[1] = v114;
          v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v225, v224, 2));
          v116 = objc_msgSend(v98, "initWithString:attributes:", v113, v115);
          -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v116);

          v117 = objc_alloc((Class)NSAttributedString);
          v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "localizedStringForKey:value:table:", CFSTR("Charged [Nav Banner Subtitle]"), CFSTR("localized string not found"), 0));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
          v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stopAfterCharging"));
          v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "navDisplayName"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v50));
          v223[0] = v197;
          v222[0] = NSForegroundColorAttributeName;
          v222[1] = NSFontAttributeName;
          v195 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
          v223[1] = v195;
          v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v223, v222, 2));
          v120 = objc_msgSend(v117, "initWithString:attributes:", v118, v119);
          -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v120);

        }
        else
        {
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "localizedStringForKey:value:table:", CFSTR("Charging [Nav Banner Title]"), CFSTR("localized string not found"), 0));
          objc_msgSend(v193, "batteryPercentageAfterCharging");
          v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v101, (uint64_t)v102));
          v229[0] = v18;
          v228[0] = NSForegroundColorAttributeName;
          v228[1] = NSFontAttributeName;
          v104 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _descriptionFont](self, "_descriptionFont"));
          v229[1] = v104;
          v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v229, v228, 2));
          v106 = objc_msgSend(v98, "initWithString:attributes:", v103, v105);
          -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v106);

          v107 = objc_alloc((Class)NSAttributedString);
          v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "localizedStringForKey:value:table:", CFSTR("Charging [Nav Banner Subtitle]"), CFSTR("localized string not found"), 0));
          objc_msgSend(v193, "chargingTime");
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", v108, 1));
          v49 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v48));
          v227[0] = v197;
          v226[0] = NSForegroundColorAttributeName;
          v226[1] = NSFontAttributeName;
          v50 = (id)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
          v227[1] = v50;
          v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v227, v226, 2));
          v110 = objc_msgSend(v107, "initWithString:attributes:", v49, v109);
          -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v110);

        }
      }

      v5 = v199;
      v25 = v200;
      v111 = v193;
      v79 = v188;
    }
    else
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "guidanceState"));
      v69 = objc_msgSend(v68, "isInParkingState");

      if (v69)
      {
        v70 = objc_alloc((Class)NSAttributedString);
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "parkingDisplayName"));
        v221[0] = v196;
        v220[0] = NSForegroundColorAttributeName;
        v220[1] = NSFontAttributeName;
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _descriptionFont](self, "_descriptionFont"));
        v221[1] = v72;
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v221, v220, 2));
        v74 = objc_msgSend(v70, "initWithString:attributes:", v71, v73);
        -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v74);

        v75 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "guidanceState"));
        LODWORD(v72) = objc_msgSend(v76, "isParked");

        v77 = objc_alloc((Class)NSAttributedString);
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v189 = v78;
        if ((_DWORD)v72)
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("Parked"), CFSTR("localized string not found"), 0));
          v219[0] = v15;
          v218[0] = NSForegroundColorAttributeName;
          v218[1] = NSFontAttributeName;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
          v219[1] = v46;
          v80 = v219;
          v81 = v218;
        }
        else
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("Parking"), CFSTR("localized string not found"), 0));
          v217[0] = v15;
          v216[0] = NSForegroundColorAttributeName;
          v216[1] = NSFontAttributeName;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
          v217[1] = v46;
          v80 = v217;
          v81 = v216;
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v80, v81, 2));
        v49 = objc_msgSend(v77, "initWithString:attributes:", v79, v48);
        -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v49);
        v5 = v199;
        v25 = v200;
      }
      else
      {
        v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "arrivalInstructionStringForLegIndex:", objc_msgSend(v29, "legIndex")));
        v83 = (void *)v82;
        v84 = &stru_1011EB268;
        if (v82)
          v84 = (__CFString *)v82;
        v85 = v84;

        v86 = objc_alloc((Class)NSAttributedString);
        v215[0] = v196;
        v214[0] = NSForegroundColorAttributeName;
        v214[1] = NSFontAttributeName;
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _descriptionFont](self, "_descriptionFont"));
        v215[1] = v87;
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v215, v214, 2));
        v89 = objc_msgSend(v86, "initWithString:attributes:", v85, v88);

        -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "guidanceState"));
        LODWORD(v87) = objc_msgSend(v91, "isArrived");

        v92 = objc_alloc((Class)NSAttributedString);
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v189 = v93;
        if ((_DWORD)v87)
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("Arrived"), CFSTR("localized string not found"), 0));
          v212[1] = NSFontAttributeName;
          v213[0] = v15;
          v212[0] = NSForegroundColorAttributeName;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
          v213[1] = v46;
          v94 = v213;
          v95 = v212;
        }
        else
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("Arriving"), CFSTR("localized string not found"), 0));
          v210[1] = NSFontAttributeName;
          v211[0] = v15;
          v210[0] = NSForegroundColorAttributeName;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
          v211[1] = v46;
          v94 = v211;
          v95 = v210;
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v95, 2));
        v49 = objc_msgSend(v92, "initWithString:attributes:", v79, v48);
        v5 = v199;
        v25 = v200;
        -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v49);
      }
      v111 = v193;
    }

  }
  else
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView majorText](self, "majorText"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView minorText](self, "minorText"));
    v26 = v198;
    if (!v51)
    {

      goto LABEL_63;
    }
    v194 = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "maneuverArtwork"));
    -[GuidanceManeuverView setManeuverArtwork:](self->_maneuverImageView, "setManeuverArtwork:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
    v55 = v18;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "laneGuidanceInfo"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lanes"));
    -[NavSignLaneGuidanceView setLanes:](self->_laneGuidanceView, "setLanes:", v57);

    v209[0] = v15;
    v208[0] = NSForegroundColorAttributeName;
    v208[1] = NSFontAttributeName;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _distanceFont](self, "_distanceFont"));
    v59 = MKServerFormattedStringArtworkSizeAttributeKey;
    v208[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    v209[1] = v58;
    v209[2] = &off_10126CC58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v209, v208, 3));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "multiPartAttributedStringWithAttributes:", v60));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "attributedString"));
    -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v62);

    v207[0] = v55;
    v206[0] = NSForegroundColorAttributeName;
    v206[1] = NSFontAttributeName;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView _descriptionFont](self, "_descriptionFont"));
    v206[2] = v59;
    v207[1] = v63;
    v207[2] = &off_10126CC58;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v207, v206, 3));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "multiPartAttributedStringWithAttributes:", v64));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "attributedString"));
    -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v66);

    v25 = v200;
    v5 = v199;

    v26 = v198;
  }
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "maneuverGuidanceInfo"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "shieldInfo"));

  v124 = v201;
  if (!v123)
    v124 = 1;
  v15 = v197;
  if (((v124 | v25 | v5) & 1) != 0)
  {
    exitShield = self->_exitShield;
    v126 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v202[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v202[1] = v126;
    v202[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[UIImageView setTransform:](exitShield, "setTransform:", v202);
    -[UIImageView setImage:](self->_exitShield, "setImage:", 0);
    cachedShieldInfo = self->_cachedShieldInfo;
    self->_cachedShieldInfo = 0;
LABEL_42:

    goto LABEL_43;
  }
  if ((objc_msgSend(v123, "isEqual:", self->_cachedShieldInfo) & 1) == 0)
  {
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v128, "scale");
    v130 = v129;

    cachedShieldInfo = (NavSignShieldInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "shieldImageWithSize:scale:idiom:", 5, 0, v130));
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", -[NavSignShieldInfo image](cachedShieldInfo, "image"), 0, v130));
    objc_msgSend(v131, "size");
    if (v132 <= 27.0)
    {
      v133 = self->_exitShield;
      v135 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v203[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v203[1] = v135;
      v203[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v134 = (CGAffineTransform *)v203;
    }
    else
    {
      CGAffineTransformMakeScale(&v205, 27.0 / v132, 27.0 / v132);
      v133 = self->_exitShield;
      v204 = v205;
      v134 = &v204;
    }
    -[UIImageView setTransform:](v133, "setTransform:", v134);
    -[UIImageView setImage:](self->_exitShield, "setImage:", v131);
    objc_storeStrong((id *)&self->_cachedShieldInfo, v123);

    v25 = v200;
    goto LABEL_42;
  }
LABEL_43:
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "maneuverArtwork"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView leadingManeuverView](self, "leadingManeuverView"));
  objc_msgSend(v137, "setManeuverArtwork:", v136);

  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "maneuverArtwork"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView minimalManeuverView](self, "minimalManeuverView"));
  objc_msgSend(v139, "setManeuverArtwork:", v138);

  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "maneuverArtwork"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView detachedMinimalManeuverView](self, "detachedMinimalManeuverView"));
  objc_msgSend(v141, "setManeuverArtwork:", v140);

  v142 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView leadingManeuverView](self, "leadingManeuverView"));
  objc_msgSend(v142, "setIsRerouting:", v201);

  v143 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView minimalManeuverView](self, "minimalManeuverView"));
  objc_msgSend(v143, "setIsRerouting:", v201);

  v144 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView detachedMinimalManeuverView](self, "detachedMinimalManeuverView"));
  objc_msgSend(v144, "setIsRerouting:", v201);

  v145 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "guidanceState"));
  v147 = objc_msgSend(v146, "transportType");
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView minimalManeuverView](self, "minimalManeuverView"));
  objc_msgSend(v148, "setTransportType:", v147);

  v149 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "guidanceState"));
  v151 = objc_msgSend(v150, "transportType");
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView detachedMinimalManeuverView](self, "detachedMinimalManeuverView"));
  objc_msgSend(v152, "setTransportType:", v151);

  v153 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "guidanceState"));
  v155 = objc_msgSend(v154, "transportType");
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView leadingManeuverView](self, "leadingManeuverView"));
  objc_msgSend(v156, "setTransportType:", v155);

  if (v201)
  {
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView apertureDistanceLabel](self, "apertureDistanceLabel"));
    objc_msgSend(v157, "setDisplayState:", 3);

    v158 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView activityView](self, "activityView"));
    objc_msgSend(v158, "setHidden:", 0);

    v159 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView activityView](self, "activityView"));
    objc_msgSend(v159, "startAnimating");
    v160 = v199;
  }
  else
  {
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "guidanceState"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "distance"));
    objc_msgSend(v163, "doubleValue");
    v165 = v164;
    v166 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView apertureDistanceLabel](self, "apertureDistanceLabel"));
    objc_msgSend(v166, "setDistanceToNextManeuver:", v165);

    v167 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    LODWORD(v162) = objc_msgSend(v167, "navigationState");

    v168 = v26;
    if ((_DWORD)v162 == 2)
    {
      v169 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
      v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "guidanceState"));
      if ((objc_msgSend(v170, "isInArrivalState") & 1) != 0)
      {
        v171 = 1;
      }
      else
      {
        v172 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
        v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "guidanceState"));
        if (objc_msgSend(v173, "isInParkingState"))
          v171 = 1;
        else
          v171 = 2;

      }
      v160 = v199;

    }
    else
    {
      v171 = 1;
      v160 = v199;
    }
    v174 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView apertureDistanceLabel](self, "apertureDistanceLabel"));
    objc_msgSend(v174, "setDisplayState:", v171);

    v175 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView activityView](self, "activityView"));
    objc_msgSend(v175, "setHidden:", 1);

    v159 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView activityView](self, "activityView"));
    objc_msgSend(v159, "stopAnimating");
    v26 = v168;
    v25 = v200;
  }

  v176 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "alternateWalkingRouteDisplayETAInfo"));

  if (v177)
  {
    v178 = GEOStringForDuration(2, (double)(unint64_t)objc_msgSend(v177, "remainingMinutesToEndOfRoute") * 60.0);
    v179 = (void *)objc_claimAutoreleasedReturnValue(v178);
    -[UIButton setTitle:forState:](self->_walkingButton, "setTitle:forState:", v179, 0);

  }
  v180 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
  v181 = objc_msgSend(v180, "centerBodyContent");

  distanceLabel = self->_distanceLabel;
  if ((v160 | v25) == 1)
  {
    -[UILabel setTextAlignment:](distanceLabel, "setTextAlignment:", 1);
    -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
    -[GuidanceManeuverView setManeuverArtwork:](self->_maneuverImageView, "setManeuverArtwork:", 0);
    -[UIImageView setHidden:](self->_exitShield, "setHidden:", 1);
    v183 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
    v184 = v183;
    v185 = 1;
  }
  else
  {
    -[UILabel setTextAlignment:](distanceLabel, "setTextAlignment:", 4);
    -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 4);
    -[UIImageView setHidden:](self->_exitShield, "setHidden:", 0);
    v183 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
    v184 = v183;
    v185 = 0;
  }
  objc_msgSend(v183, "setCenterBodyContent:", v185);

  v186 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
  v187 = objc_msgSend(v186, "centerBodyContent");

  if (v181 != v187)
    self->_cachedHeight = -1.0;
  -[ManeuverBannerView updateLayout](self, "updateLayout");

  v18 = v196;
LABEL_63:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double cachedHeight;
  double v7;
  double v8;
  void *v9;
  double MaxY;
  void *v11;
  double v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  double v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  CGSize v25;
  CGSize result;
  CGRect v27;

  height = a3.height;
  width = a3.width;
  cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    -[ManeuverBannerView _maps_compressedSizeForWidth:withBlock:](self, "_maps_compressedSizeForWidth:withBlock:", 0, a3.width);
    v8 = v7;
    if (-[MapsBannerView aperturePresentation](self, "aperturePresentation"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      objc_msgSend(v9, "layoutFrame");
      MaxY = CGRectGetMaxY(v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
      objc_msgSend(v11, "_maps_compressedSizeForWidth:withBlock:", 0, width);
      v8 = MaxY + v12 + 17.0;

    }
    if (v8 <= height)
    {
      self->_cachedHeight = v8;
      self->_calculatedWidth = width;
      cachedHeight = self->_cachedHeight;
    }
    else
    {
      v13 = sub_100431C7C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
        v25.width = width;
        v25.height = height;
        v16 = NSStringFromCGSize(v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v19 = 138412802;
        v20 = v15;
        v21 = 2112;
        v22 = v17;
        v23 = 2048;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v19, 0x20u);

      }
      cachedHeight = height;
    }
  }
  v18 = width;
  result.height = cachedHeight;
  result.width = v18;
  return result;
}

- (unint64_t)bannerType
{
  return 0;
}

- (void)setExpanded:(BOOL)a3
{
  int v3;
  int expanded;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int *v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  expanded = self->_expanded;
  self->_expanded = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView leadingView](self, "leadingView"));
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView trailingView](self, "trailingView"));
    objc_msgSend(v8, "setAlpha:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView minimalView](self, "minimalView"));
    objc_msgSend(v9, "setAlpha:", 0.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView detachedMinimalView](self, "detachedMinimalView"));
    objc_msgSend(v10, "setAlpha:", 0.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
    objc_msgSend(v11, "setAlpha:", 1.0);
    v12 = &OBJC_IVAR___ManeuverBannerView__collapsedConstraints;
    v13 = &OBJC_IVAR___ManeuverBannerView__expandedConstraints;
  }
  else
  {
    objc_msgSend(v6, "setAlpha:", 1.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView trailingView](self, "trailingView"));
    objc_msgSend(v14, "setAlpha:", 1.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView minimalView](self, "minimalView"));
    objc_msgSend(v15, "setAlpha:", 1.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView detachedMinimalView](self, "detachedMinimalView"));
    objc_msgSend(v16, "setAlpha:", 1.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
    objc_msgSend(v11, "setAlpha:", 0.0);
    v13 = &OBJC_IVAR___ManeuverBannerView__collapsedConstraints;
    v12 = &OBJC_IVAR___ManeuverBannerView__expandedConstraints;
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v13));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v12));
  -[ManeuverBannerView _updateConstraints](self, "_updateConstraints");
  if (expanded != v3)
  {
    -[AxisAdjustingStackView invalidateStackViewAxis](self->_controlsView, "invalidateStackViewAxis");
    -[AxisAdjustingStackView updateStackViewAxisIfNeeded](self->_controlsView, "updateStackViewAxisIfNeeded");
  }
}

- (void)_updateConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  -[MapsBannerView bannerAccessoryViewLeadingInset](self, "bannerAccessoryViewLeadingInset");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView leadingManeuverView](self, "leadingManeuverView"));
  objc_msgSend(v5, "preferredLeadingPadding");
  -[NSLayoutConstraint setConstant:](self->_leadingViewLeadingConstraint, "setConstant:", v4 + v6);

  if (-[ManeuverBannerView expanded](self, "expanded"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laneGuidanceInfo"));
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }
  if (-[ManeuverBannerView expanded](self, "expanded"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverBannerView maneuverItem](self, "maneuverItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "laneGuidanceInfo"));
    v12 = v11 == 0;

  }
  else
  {
    v12 = 0;
  }
  -[NSLayoutConstraint setActive:](self->_laneGuidanceTopConstraint, "setActive:", v9);
  -[NSLayoutConstraint setActive:](self->_distanceLabelTopConstraint, "setActive:", v12);
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (ManeuverAccessoryView)leadingManeuverView
{
  return self->_leadingManeuverView;
}

- (void)setLeadingManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingManeuverView, a3);
}

- (ManeuverAccessoryView)minimalManeuverView
{
  return self->_minimalManeuverView;
}

- (void)setMinimalManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalManeuverView, a3);
}

- (ManeuverAccessoryView)detachedMinimalManeuverView
{
  return self->_detachedMinimalManeuverView;
}

- (void)setDetachedMinimalManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_detachedMinimalManeuverView, a3);
}

- (DistanceAccessoryView)apertureDistanceLabel
{
  return self->_apertureDistanceLabel;
}

- (void)setApertureDistanceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_apertureDistanceLabel, a3);
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (UIView)leadingConcentricContent
{
  return self->_leadingConcentricContent;
}

- (void)setLeadingConcentricContent:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConcentricContent, a3);
}

- (UIView)trailingConcentricContent
{
  return self->_trailingConcentricContent;
}

- (void)setTrailingConcentricContent:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConcentricContent, a3);
}

- (UIView)obstructedArea
{
  return self->_obstructedArea;
}

- (void)setObstructedArea:(id)a3
{
  objc_storeStrong((id *)&self->_obstructedArea, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obstructedArea, 0);
  objc_storeStrong((id *)&self->_trailingConcentricContent, 0);
  objc_storeStrong((id *)&self->_leadingConcentricContent, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_apertureDistanceLabel, 0);
  objc_storeStrong((id *)&self->_detachedMinimalManeuverView, 0);
  objc_storeStrong((id *)&self->_minimalManeuverView, 0);
  objc_storeStrong((id *)&self->_leadingManeuverView, 0);
  objc_storeStrong((id *)&self->_collapsedConstraints, 0);
  objc_storeStrong((id *)&self->_expandedConstraints, 0);
  objc_storeStrong((id *)&self->_laneGuidanceTopConstraint, 0);
  objc_storeStrong((id *)&self->_distanceLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_leadingViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_evStationsButton, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_walkingButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_cachedShieldInfo, 0);
  objc_storeStrong((id *)&self->_exitShield, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_laneGuidanceView, 0);
  objc_storeStrong((id *)&self->_maneuverImageView, 0);
}

@end
