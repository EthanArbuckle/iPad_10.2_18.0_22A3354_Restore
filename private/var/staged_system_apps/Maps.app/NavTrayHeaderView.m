@implementation NavTrayHeaderView

- (NavTrayHeaderView)initWithDelegate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  NavTrayHeaderView *v11;
  NavTrayHeaderView *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  id minimizedValueFontProvider;
  id v18;
  void *v19;
  UIImageView *v20;
  UIImageView *chevronImageView;
  id *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  double v44;
  MapsFadingLabel *v45;
  id v46;
  void *v47;
  double v48;
  UIView *v49;
  id v50;
  UIView *v51;
  id v52;
  UILabel *v53;
  id v54;
  MapsFadingLabel *v55;
  id v56;
  void *v57;
  NavTrayFeedbackView *v58;
  id WeakRetained;
  NavTrayFeedbackView *v60;
  id v61;
  UIButton *v62;
  id v63;
  void *v64;
  double v65;
  UIButton *v66;
  id v67;
  void *v68;
  double v69;
  AxisAdjustingStackView *v70;
  void *v71;
  AxisAdjustingStackView *v72;
  id v73;
  HairlineView *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  double v88;
  void *v89;
  void *v90;
  double v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  double v96;
  uint64_t v97;
  id v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
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
  id v210;
  id v211;
  id *location;
  id v213;
  NavTrayHeaderView *v214;
  _QWORD v215[4];
  id *v216;
  objc_super v217;
  _QWORD v218[38];
  id v219;
  _QWORD v220[3];

  v6 = a3;
  v7 = a4;
  v217.receiver = self;
  v217.super_class = (Class)NavTrayHeaderView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[NavTrayHeaderView initWithFrame:](&v217, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v214 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[NavTrayHeaderView setAccessibilityIdentifier:](v214, "setAccessibilityIdentifier:", v15);

    objc_storeWeak((id *)&v214->_delegate, v6);
    objc_storeStrong((id *)&v214->_metrics, a4);
    v16 = objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontProviderWeight:minimumPointSize:minimumSizeCategory:maximumPointSize:maximumSizeCategory:](UIFont, "_maps_fontProviderWeight:minimumPointSize:minimumSizeCategory:maximumPointSize:maximumSizeCategory:", UIContentSizeCategoryLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIFontWeightBold, 25.0, 33.0));
    minimizedValueFontProvider = v214->_minimizedValueFontProvider;
    v214->_minimizedValueFontProvider = (id)v16;

    -[NavTrayHeaderView setUserInteractionEnabled:](v214, "setUserInteractionEnabled:", 1);
    v210 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v214, "_pressedHeaderView");
    -[NavTrayHeaderView addGestureRecognizer:](v214, "addGestureRecognizer:", v210);
    v18 = objc_alloc((Class)UIImageView);
    v211 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("NavTrayChevron")));
    v20 = (UIImageView *)objc_msgSend(v18, "initWithImage:", v19);
    chevronImageView = v214->_chevronImageView;
    v214->_chevronImageView = v20;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v214->_chevronImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v214->_chevronImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v214->_chevronImageView, "setAccessibilityIdentifier:", CFSTR("ChevronImageView"));
    -[NavTrayHeaderView addSubview:](v214, "addSubview:", v214->_chevronImageView);
    v215[0] = _NSConcreteStackBlock;
    v215[1] = 3221225472;
    v215[2] = sub_1004C04F8;
    v215[3] = &unk_1011B8D20;
    v22 = v214;
    v216 = v22;
    v23 = objc_retainBlock(v215);
    v24 = ((uint64_t (*)(float))v23[2])(750.0);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v213 = v7;
    v26 = v22[7];
    v22[7] = (id)v25;

    v27 = ((uint64_t (*)(_QWORD *, float))v23[2])(v23, 999.0);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = v22[8];
    v22[8] = (id)v28;

    v30 = ((uint64_t (*)(_QWORD *, float))v23[2])(v23, 999.0);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = v22[9];
    v22[9] = (id)v31;

    v209 = v23;
    v33 = ((uint64_t (*)(_QWORD *, float))v23[2])(v23, 999.0);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = v22[10];
    v22[10] = (id)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultArrivalString](GuidanceETA, "defaultArrivalString"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[7], "bottomLabel"));
    objc_msgSend(v37, "setText:", v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultBatteryOnArrivalString](GuidanceETA, "defaultBatteryOnArrivalString"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[10], "bottomLabel"));
    objc_msgSend(v39, "setText:", v38);

    objc_msgSend(v22[7], "setAccessibilityIdentifier:", CFSTR("ArrivalLabel"));
    objc_msgSend(v22[8], "setAccessibilityIdentifier:", CFSTR("TimeLabel"));
    objc_msgSend(v22[9], "setAccessibilityIdentifier:", CFSTR("DistanceLabel"));
    objc_msgSend(v22[10], "setAccessibilityIdentifier:", CFSTR("BatteryLabel"));
    objc_msgSend(v22, "_updateTextAlignment");
    v40 = objc_alloc((Class)UIStackView);
    v220[0] = v22[7];
    v220[1] = v22[8];
    v220[2] = v22[9];
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v220, 3));
    v42 = objc_msgSend(v40, "initWithArrangedSubviews:", v41);
    v43 = v22[4];
    v22[4] = v42;

    objc_msgSend(v22[4], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[4], "setAxis:", 0);
    objc_msgSend(v22[4], "setDistribution:", 2);
    objc_msgSend(v22[4], "setAlignment:", 1);
    objc_msgSend(v7, "minimizedValueInterLabelPadding");
    objc_msgSend(v22[4], "setSpacing:");
    LODWORD(v44) = 1148846080;
    objc_msgSend(v22[4], "setContentHuggingPriority:forAxis:", 0, v44);
    objc_msgSend(v22[4], "setAccessibilityIdentifier:", CFSTR("MinimizedStackView"));
    objc_msgSend(v22, "addSubview:", v22[4]);
    v45 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v46 = v22[11];
    v22[11] = v45;

    objc_msgSend(v22[11], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[11], "setNumberOfLines:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics expandedTextColor](v214->_metrics, "expandedTextColor"));
    objc_msgSend(v22[11], "setTextColor:", v47);

    LODWORD(v48) = 1148846080;
    objc_msgSend(v22[11], "setContentHuggingPriority:forAxis:", 1, v48);
    objc_msgSend(v22[11], "setAccessibilityIdentifier:", CFSTR("ExpandedTitleLabel"));
    objc_msgSend(v22, "addSubview:", v22[11]);
    v49 = objc_opt_new(UIView);
    v50 = v22[12];
    v22[12] = v49;

    objc_msgSend(v22[12], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[12], "setAlpha:", 0.0);
    objc_msgSend(v22[12], "setAccessibilityIdentifier:", CFSTR("ArrivedContainerView"));
    objc_msgSend(v22, "addSubview:", v22[12]);
    v51 = objc_opt_new(UIView);
    v52 = v22[13];
    v22[13] = v51;

    objc_msgSend(v22[13], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[13], "setUserInteractionEnabled:", 0);
    objc_msgSend(v22[13], "setAccessibilityIdentifier:", CFSTR("ArrivedHeaderView"));
    objc_msgSend(v22[12], "addSubview:", v22[13]);
    v53 = objc_opt_new(UILabel);
    v54 = v22[14];
    v22[14] = v53;

    objc_msgSend(v22[14], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[14], "setAccessibilityIdentifier:", CFSTR("ArrivedTitleLabel"));
    objc_msgSend(v22[14], "setTextAlignment:", 1);
    objc_msgSend(v22[13], "addSubview:", v22[14]);
    v55 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v56 = v22[15];
    v22[15] = v55;

    objc_msgSend(v22[15], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[15], "setAccessibilityIdentifier:", CFSTR("ArrivedSubtitleLabel"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v22[15], "setTextColor:", v57);

    objc_msgSend(v22[15], "setNumberOfLines:", 2);
    objc_msgSend(v22[15], "setTextAlignment:", 1);
    objc_msgSend(v22[13], "addSubview:", v22[15]);
    v58 = [NavTrayFeedbackView alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v214->_delegate);
    v60 = -[NavTrayFeedbackView initWithDelegate:](v58, "initWithDelegate:", WeakRetained);
    v61 = v22[16];
    v22[16] = v60;

    objc_msgSend(v22[16], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[12], "addSubview:", v22[16]);
    objc_msgSend(v22[16], "setAccessibilityIdentifier:", CFSTR("FeedbackView"));
    v62 = objc_opt_new(UIButton);
    v63 = v22[18];
    v22[18] = v62;

    objc_msgSend(v22[18], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "delegate"));
    objc_msgSend(v64, "styleButton:ofType:", v22[18], 4);

    LODWORD(v65) = 1148846080;
    objc_msgSend(v22[18], "setContentCompressionResistancePriority:forAxis:", 1, v65);
    objc_msgSend(v22[18], "setAccessibilityIdentifier:", CFSTR("AlternativeActionButton"));
    v66 = objc_opt_new(UIButton);
    v67 = v22[17];
    v22[17] = v66;

    objc_msgSend(v22[17], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "delegate"));
    objc_msgSend(v68, "styleButton:ofType:", v22[17], 1);

    LODWORD(v69) = 1148846080;
    objc_msgSend(v22[17], "setContentCompressionResistancePriority:forAxis:", 1, v69);
    objc_msgSend(v22[17], "setAccessibilityIdentifier:", CFSTR("EndButton"));
    v70 = [AxisAdjustingStackView alloc];
    v219 = v22[17];
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v219, 1));
    v72 = -[AxisAdjustingStackView initWithArrangedTruncatableSubviews:](v70, "initWithArrangedTruncatableSubviews:", v71);
    v73 = v22[5];
    v22[5] = v72;

    objc_msgSend(v22[5], "setDelegate:", v22);
    objc_msgSend(v22[5], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[5], "setDistribution:", 1);
    objc_msgSend(v22[5], "setAlignment:", 0);
    -[NavTrayMetrics actionButtonInterButtonPadding](v214->_metrics, "actionButtonInterButtonPadding");
    objc_msgSend(v22[5], "setSpacing:");
    objc_msgSend(v22[5], "setAccessibilityIdentifier:", CFSTR("EndRouteButtonStackView"));
    objc_msgSend(v22[12], "addSubview:", v22[5]);
    v74 = objc_opt_new(HairlineView);
    v75 = v22[26];
    v22[26] = v74;

    objc_msgSend(v22[26], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22[26], "setHidden:", 1);
    objc_msgSend(v22, "addSubview:", v22[26]);
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "topAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v214->_metrics, "defaultVerticalPadding");
    v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77));
    v79 = v22[19];
    v22[19] = (id)v78;

    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[5], "topAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[16], "bottomAnchor"));
    -[NavTrayMetrics actionButtonInterButtonPadding](v214->_metrics, "actionButtonInterButtonPadding");
    v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v81));
    v83 = v22[20];
    v22[20] = (id)v82;

    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[5], "topAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "bottomAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v214->_metrics, "defaultVerticalPadding");
    v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85));
    v87 = v22[21];
    v22[21] = (id)v86;

    LODWORD(v88) = 1144750080;
    objc_msgSend(v22[21], "setPriority:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[11], "bottomAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    -[NavTrayMetrics minimizedHeaderVerticalPadding](v214->_metrics, "minimizedHeaderVerticalPadding");
    v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -v91));
    v93 = v22[22];
    v22[22] = (id)v92;

    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[4], "bottomAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v214->_metrics, "defaultVerticalPadding");
    v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, -v96));
    v98 = v22[23];
    v22[23] = (id)v97;

    v208 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v214->_chevronImageView, "trailingAnchor"));
    v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    -[NavTrayMetrics minimizedHeaderHorizontalPadding](v214->_metrics, "minimizedHeaderHorizontalPadding");
    v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "constraintEqualToAnchor:constant:", v207, -v99));
    v218[0] = v206;
    v205 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v214->_chevronImageView, "centerYAnchor"));
    v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerYAnchor"));
    v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "constraintEqualToAnchor:", v204));
    v218[1] = v203;
    v202 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v214->_chevronImageView, "widthAnchor"));
    -[NavTrayMetrics expandCollapseImageSize](v214->_metrics, "expandCollapseImageSize");
    v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "constraintEqualToConstant:"));
    v218[2] = v201;
    v200 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v214->_chevronImageView, "heightAnchor"));
    -[NavTrayMetrics expandCollapseImageSize](v214->_metrics, "expandCollapseImageSize");
    v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "constraintEqualToConstant:", v100));
    v218[3] = v199;
    v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[11], "leadingAnchor"));
    v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    -[NavTrayMetrics minimizedHeaderHorizontalPadding](v214->_metrics, "minimizedHeaderHorizontalPadding");
    v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "constraintEqualToAnchor:constant:", v197));
    v218[4] = v196;
    v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[11], "trailingAnchor"));
    v194 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v214->_chevronImageView, "leadingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](v214->_metrics, "defaultHorizontalPadding");
    v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "constraintEqualToAnchor:constant:", v194, -v101));
    v218[5] = v193;
    v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[11], "topAnchor"));
    v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    -[NavTrayMetrics minimizedHeaderVerticalPadding](v214->_metrics, "minimizedHeaderVerticalPadding");
    v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "constraintEqualToAnchor:constant:", v190));
    v218[6] = v189;
    v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[4], "leadingAnchor"));
    v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    -[NavTrayMetrics minimizedHeaderHorizontalPadding](v214->_metrics, "minimizedHeaderHorizontalPadding");
    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "constraintEqualToAnchor:constant:", v187));
    v218[7] = v186;
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[4], "trailingAnchor"));
    v192 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v214->_chevronImageView, "leadingAnchor"));
    -[NavTrayMetrics minimizedHeaderHorizontalPadding](v214->_metrics, "minimizedHeaderHorizontalPadding");
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "constraintLessThanOrEqualToAnchor:constant:", v192, -v102));
    v218[8] = v182;
    v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[4], "topAnchor"));
    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v214->_metrics, "defaultVerticalPadding");
    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "constraintEqualToAnchor:constant:", v180));
    v218[9] = v179;
    v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "leadingAnchor"));
    v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](v214->_metrics, "defaultHorizontalPadding");
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "constraintEqualToAnchor:constant:", v177));
    v218[10] = v176;
    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "trailingAnchor"));
    v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    -[NavTrayMetrics defaultHorizontalPadding](v214->_metrics, "defaultHorizontalPadding");
    v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "constraintEqualToAnchor:constant:", v174, -v103));
    v218[11] = v173;
    v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "bottomAnchor"));
    v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "constraintLessThanOrEqualToAnchor:", v171));
    v218[12] = v169;
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "topAnchor"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "topAnchor"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToAnchor:", v167));
    v218[13] = v166;
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "leadingAnchor"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "leadingAnchor"));
    -[NavTrayMetrics arrivedTitleContainerHorizontalPadding](v214->_metrics, "arrivedTitleContainerHorizontalPadding");
    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "constraintEqualToAnchor:constant:", v163));
    v218[14] = v162;
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "trailingAnchor"));
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "trailingAnchor"));
    -[NavTrayMetrics arrivedTitleContainerHorizontalPadding](v214->_metrics, "arrivedTitleContainerHorizontalPadding");
    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "constraintEqualToAnchor:constant:", v160, -v104));
    v218[15] = v159;
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[14], "topAnchor"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "topAnchor"));
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "constraintEqualToAnchor:", v157));
    v218[16] = v156;
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[14], "leadingAnchor"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "leadingAnchor"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "constraintEqualToAnchor:", v154));
    v218[17] = v153;
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[14], "trailingAnchor"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "trailingAnchor"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToAnchor:", v151));
    v218[18] = v150;
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[15], "topAnchor"));
    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[14], "bottomAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "constraintEqualToAnchor:constant:", v185, 2.0));
    v218[19] = v148;
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[15], "leadingAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "leadingAnchor"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v146));
    v218[20] = v145;
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[15], "trailingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "trailingAnchor"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:", v143));
    v218[21] = v142;
    v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[15], "bottomAnchor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "bottomAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "constraintEqualToAnchor:", v141));
    v218[22] = v140;
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[16], "heightAnchor"));
    -[NavTrayMetrics feedbackButtonHeight](v214->_metrics, "feedbackButtonHeight");
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintGreaterThanOrEqualToConstant:"));
    v218[23] = v138;
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[16], "topAnchor"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[13], "bottomAnchor"));
    -[NavTrayMetrics defaultVerticalPadding](v214->_metrics, "defaultVerticalPadding");
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:constant:", v136));
    v218[24] = v135;
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[16], "leadingAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "leadingAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v133));
    v218[25] = v132;
    location = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[16], "trailingAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "trailingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(location, "constraintEqualToAnchor:", v131));
    v218[26] = v130;
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[5], "heightAnchor"));
    -[NavTrayMetrics endButtonHeight](v214->_metrics, "endButtonHeight");
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintGreaterThanOrEqualToConstant:"));
    v218[27] = v128;
    v218[28] = v22[20];
    v218[29] = v22[21];
    v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[5], "leadingAnchor"));
    v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "leadingAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "constraintEqualToAnchor:", v165));
    v218[30] = v127;
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[5], "trailingAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "trailingAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v125));
    v218[31] = v124;
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[5], "bottomAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[12], "bottomAnchor"));
    -[NavTrayMetrics actionButtonBottomPadding](v214->_metrics, "actionButtonBottomPadding");
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, -v105));
    v218[32] = v121;
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[26], "leadingAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v119));
    v218[33] = v118;
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[26], "trailingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:", v116));
    v218[34] = v106;
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[26], "bottomAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v108));
    v218[35] = v109;
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[17], "heightAnchor"));
    -[NavTrayMetrics endButtonHeight](v214->_metrics, "endButtonHeight");
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToConstant:"));
    v218[36] = v111;
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[18], "heightAnchor"));
    -[NavTrayMetrics endButtonHeight](v214->_metrics, "endButtonHeight");
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToConstant:"));
    v218[37] = v113;
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v218, 38));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v114);

    v6 = v211;
    v12 = v214;

    v7 = v213;
    objc_msgSend(v22, "_updateFonts");
    objc_msgSend(v22, "_updateLayout");
    objc_msgSend(v22, "_updateContentAndReloadStackView:", 0);

  }
  return v12;
}

- (void)setETA:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = self->_ETA;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v15 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v15;
    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel superview](self->_batteryLabel, "superview"));
      v10 = v9 != 0;

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrivalBatteryCharge"));
      v12 = v11 != 0;

      v13 = v10 ^ v12;
      objc_storeStrong((id *)&self->_ETA, a3);
      if (v15)
      {
        self->_isRerouting = 0;
        self->_hasReceivedGuidance = 1;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrivalBatteryCharge"));
        self->_isInEVMode = v14 != 0;

      }
      -[NavTrayHeaderView applyArrivalStateAndReloadStackView:](self, "applyArrivalStateAndReloadStackView:", v13);
      v7 = (unint64_t)v15;
    }
  }

}

- (void)setExpanded:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    v3[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1004C07D8;
    v4[3] = &unk_1011AC860;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1004C080C;
    v3[3] = &unk_1011AE8F8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 0.25);
  }
}

- (unint64_t)state
{
  if (-[NavTrayHeaderView _isArrivalState](self, "_isArrivalState")
    || -[NavTrayHeaderView _isResumeRouteState](self, "_isResumeRouteState"))
  {
    return 3;
  }
  if (self->_isRerouting)
    return 2;
  return self->_hasReceivedGuidance;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavTrayHeaderView;
  -[NavTrayHeaderView traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v8 = sub_1002A8950(v6, v7);

  if (v8)
  {
    -[NavTrayHeaderView applyArrivalState](self, "applyArrivalState");
    -[NavTrayHeaderView _updateFonts](self, "_updateFonts");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v10 = sub_1002A8A0C(v4, v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
    v12 = objc_msgSend(v11, "isLuminanceReduced");

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1004C09DC;
    v13[3] = &unk_1011AC860;
    v13[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v12, v13);
  }

}

- (void)_updateFonts
{
  uint64_t (**minimizedValueFontProvider)(id, void *);
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
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
  id v32;

  minimizedValueFontProvider = (uint64_t (**)(id, void *))self->_minimizedValueFontProvider;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v5 = minimizedValueFontProvider[2](minimizedValueFontProvider, v4);
  v32 = (id)objc_claimAutoreleasedReturnValue(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics minimizedTitleTextStyle](self->_metrics, "minimizedTitleTextStyle"));
  -[NavTrayMetrics minimizedTitleFontWeight](self->_metrics, "minimizedTitleFontWeight");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v6, v10, v8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayMetrics expandedTitleTextStyle](self->_metrics, "expandedTitleTextStyle"));
  -[NavTrayMetrics expandedTitleFontWeight](self->_metrics, "expandedTitleFontWeight");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v12, v16, v14));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle1, v19, UIFontWeightBold));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle3, v22, UIFontWeightRegular));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_minimizedArrivalLabel, "topLabel"));
  objc_msgSend(v24, "setFont:", v32);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_minimizedArrivalLabel, "bottomLabel"));
  objc_msgSend(v25, "setFont:", v11);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_timeLabel, "topLabel"));
  objc_msgSend(v26, "setFont:", v32);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_timeLabel, "bottomLabel"));
  objc_msgSend(v27, "setFont:", v11);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_distanceLabel, "topLabel"));
  objc_msgSend(v28, "setFont:", v32);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_distanceLabel, "bottomLabel"));
  objc_msgSend(v29, "setFont:", v11);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_batteryLabel, "topLabel"));
  objc_msgSend(v30, "setFont:", v32);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_batteryLabel, "bottomLabel"));
  objc_msgSend(v31, "setFont:", v11);

  -[MapsFadingLabel setFont:](self->_expandedTitleLabel, "setFont:", v17);
  -[UILabel setFont:](self->_arrivedTitleLabel, "setFont:", v20);
  -[MapsFadingLabel setFont:](self->_arrivedSubtitleLabel, "setFont:", v23);

}

- (int64_t)_textAlignmentForCurrentLanguage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredLocalizations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(&off_101273758, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = 2;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(&off_101273758);
      if ((objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)) & 1) != 0)
        break;
      if (v6 == (id)++v9)
      {
        v6 = objc_msgSend(&off_101273758, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 4;
  }

  return v8;
}

- (void)_updateContentAndReloadStackView:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  NavTrayStackedLabel *batteryLabel;
  _QWORD *v8;
  uint64_t v9;
  NavTrayStackedLabel *timeLabel;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
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
  id v29;
  NSObject *v30;
  unsigned int v31;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  int64_t arrivalState;
  void *v62;
  id v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  int64_t v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  double v97;
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
  uint8_t buf[4];
  NavTrayHeaderView *v109;
  __int16 v110;
  int64_t v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  void *v115;
  _QWORD v116[3];
  _QWORD v117[2];

  v3 = a3;
  v5 = sub_1004C1BD4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v109 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating content", buf, 0xCu);
  }

  if (v3)
  {
    if (self->_isInEVMode)
    {
      batteryLabel = self->_batteryLabel;
      v117[0] = self->_minimizedArrivalLabel;
      v117[1] = batteryLabel;
      v8 = v117;
      v9 = 2;
    }
    else
    {
      timeLabel = self->_timeLabel;
      v116[0] = self->_minimizedArrivalLabel;
      v116[1] = timeLabel;
      v116[2] = self->_distanceLabel;
      v8 = v116;
      v9 = 3;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, v9));
    -[UIStackView _maps_setArrangedSubviews:](self->_minimizedStackView, "_maps_setArrangedSubviews:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Route Options [Nav Tray Header]"), CFSTR("localized string not found"), 0));
  -[MapsFadingLabel setText:](self->_expandedTitleLabel, "setText:", v13);

  switch(-[NavTrayHeaderView state](self, "state"))
  {
    case 0uLL:
      v14 = sub_1004C1BD4();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v109 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Configuring loading state", buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA invalidValueString](GuidanceETA, "invalidValueString"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_minimizedArrivalLabel, "topLabel"));
      objc_msgSend(v17, "setText:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_timeLabel, "topLabel"));
      objc_msgSend(v18, "setText:", v16);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultTimeUnit](GuidanceETA, "defaultTimeUnit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_timeLabel, "bottomLabel"));
      objc_msgSend(v20, "setText:", v19);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultTimeUnitAccessibility](GuidanceETA, "defaultTimeUnitAccessibility"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_timeLabel, "bottomLabel"));
      objc_msgSend(v22, "setAccessibilityLabel:", v21);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_distanceLabel, "topLabel"));
      objc_msgSend(v23, "setText:", v16);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultDistanceUnit](GuidanceETA, "defaultDistanceUnit"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_distanceLabel, "bottomLabel"));
      objc_msgSend(v25, "setText:", v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultDistanceUnitAccessibility](GuidanceETA, "defaultDistanceUnitAccessibility"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_distanceLabel, "bottomLabel"));
      objc_msgSend(v27, "setAccessibilityLabel:", v26);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_batteryLabel, "topLabel"));
      objc_msgSend(v28, "setText:", v16);
      goto LABEL_50;
    case 1uLL:
      v29 = sub_1004C1BD4();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v109 = self;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Configuring guidance state", buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView ETA](self, "ETA"));
      v31 = -[NavTrayHeaderView _shouldPostBacklightSceneRequiresUpdateNotification:](self, "_shouldPostBacklightSceneRequiresUpdateNotification:", v16);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrivalTimeStringIncludingAMPMSymbols:", 0));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_minimizedArrivalLabel, "topLabel"));
      objc_msgSend(v33, "setText:", v32);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrivalTimeBottomString"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_minimizedArrivalLabel, "bottomLabel"));
      objc_msgSend(v35, "setText:", v34);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timeValue"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_timeLabel, "topLabel"));
      objc_msgSend(v37, "setText:", v36);

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timeUnit"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_timeLabel, "bottomLabel"));
      objc_msgSend(v39, "setText:", v38);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timeUnitAccessibility"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_timeLabel, "bottomLabel"));
      objc_msgSend(v41, "setAccessibilityLabel:", v40);

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "distanceValue"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_distanceLabel, "topLabel"));
      objc_msgSend(v43, "setText:", v42);

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "distanceUnit"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_distanceLabel, "bottomLabel"));
      objc_msgSend(v45, "setText:", v44);

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "distanceUnitAccessibility"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_distanceLabel, "bottomLabel"));
      objc_msgSend(v47, "setAccessibilityLabel:", v46);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_batteryLabel, "topLabel"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "font"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "batteryChargeStringWithFont:", v49));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_batteryLabel, "topLabel"));
      objc_msgSend(v51, "setAttributedText:", v50);

      if (!v31)
        goto LABEL_51;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v28, "postNotificationName:object:", CFSTR("NavContainerShouldUpdateBacklightSceneEnvironmentNotification"), self);
      goto LABEL_50;
    case 2uLL:
      v52 = sub_1004C1BD4();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v109 = self;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "[%{public}p] Configuring rerouting state", buf, 0xCu);
      }

      if (-[NavTrayHeaderView isExpanded](self, "isExpanded"))
        goto LABEL_52;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView destinationName](self, "destinationName"));
      -[MapsFadingLabel setText:](self->_expandedTitleLabel, "setText:", v16);
      goto LABEL_51;
    case 3uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "route"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrivalInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "destination"));
      v56 = objc_msgSend(v16, "isArrivedAtEVCharger");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrivalChargingStationInfo"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "activeNavTrayGuidanceEvent"));

      v59 = sub_1004C1BD4();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        arrivalState = self->_arrivalState;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "uniqueID"));
        *(_DWORD *)buf = 134349826;
        v109 = self;
        v110 = 2048;
        v111 = arrivalState;
        v112 = 2112;
        v113 = v62;
        v114 = 2112;
        v115 = v57;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[%{public}p] Configuring arrived state: %ld with destination: %@, charging info: %@", buf, 0x2Au);

      }
      if (v56)
      {
        v63 = sub_1004C1BD4();
        v64 = objc_claimAutoreleasedReturnValue(v63);
        v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);

        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "route"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "legs"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndex:", objc_msgSend(v54, "legIndex")));

          v69 = sub_1004C1BD4();
          v70 = objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "chargingInfo"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "chargingStationInfo"));
            v103 = v57;
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "waypointDisplayInfoForWaypoint:", v55));
            v104 = v55;
            v74 = v54;
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "evChargingInfo"));
            *(_DWORD *)buf = 134349826;
            v109 = self;
            v110 = 2112;
            v111 = (int64_t)v71;
            v112 = 2112;
            v113 = v72;
            v114 = 2112;
            v115 = v75;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "[%{public}p] EV Charging info from waypoint: %@, leg: %@, displayInfo: %@", buf, 0x2Au);

            v54 = v74;
            v55 = v104;

            v57 = v103;
          }

        }
        objc_msgSend(v57, "chargingTime");
        v105 = v54;
        if (v76 <= 0.0)
        {
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("Charged [Nav Tray Header Title]"), CFSTR("localized string not found"), 0));
          v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v78));
          -[UILabel setText:](self->_arrivedTitleLabel, "setText:", v83);

        }
        else
        {
          if (!v107)
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v90 = v57;
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Charging [Nav Tray Header Title]"), CFSTR("localized string not found"), 0));
            objc_msgSend(v90, "batteryPercentageAfterCharging");
            v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v91, (uint64_t)v92));
            -[UILabel setText:](self->_arrivedTitleLabel, "setText:", v93);

            v57 = v90;
            objc_msgSend(v90, "chargingTime");
            if (v94 > 0.0)
            {
LABEL_45:
              v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("Charging [Nav Tray Header Subtitle]"), CFSTR("localized string not found"), 0));
              v96 = v57;
              objc_msgSend(v57, "chargingTime");
              v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", v97, 1));
              v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v95, v98));
              -[MapsFadingLabel setText:](self->_arrivedSubtitleLabel, "setText:", v99);

LABEL_47:
              v57 = v96;

              goto LABEL_48;
            }
LABEL_46:
            v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("Charged [Nav Tray Header Subtitle]"), CFSTR("localized string not found"), 0));
            v96 = v57;
            v98 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
            v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "stopAfterCharging"));
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "navDisplayName"));
            v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v95, v101));
            -[MapsFadingLabel setText:](self->_arrivedSubtitleLabel, "setText:", v102);

            goto LABEL_47;
          }
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "title"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "stringWithDefaultOptions"));
          -[UILabel setText:](self->_arrivedTitleLabel, "setText:", v78);
        }

        objc_msgSend(v57, "chargingTime");
        if (v84 > 0.0)
        {
          if (v107)
          {
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "detail"));
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "stringWithDefaultOptions"));
            -[MapsFadingLabel setText:](self->_arrivedSubtitleLabel, "setText:", v86);

LABEL_48:
            v28 = v106;
            v54 = v105;
            goto LABEL_49;
          }
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      v79 = self->_arrivalState;
      switch(v79)
      {
        case 1:
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v81 = v80;
          v82 = CFSTR("Arriving [Nav Tray Header]");
          goto LABEL_39;
        case 2:
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v81 = v80;
          v82 = CFSTR("Arrived [Nav Tray Header]");
          goto LABEL_39;
        case 3:
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v81 = v80;
          v82 = CFSTR("Parking [Nav Tray Header]");
          goto LABEL_39;
        case 4:
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v81 = v80;
          v82 = CFSTR("Parked [Nav Tray Header]");
LABEL_39:
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", v82, CFSTR("localized string not found"), 0));
          -[UILabel setText:](self->_arrivedTitleLabel, "setText:", v87);

          v79 = self->_arrivalState;
          break;
        default:
          break;
      }
      v28 = v106;
      if ((unint64_t)(v79 - 1) > 1)
        v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "parkingDisplayName"));
      else
        v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "arrivalInstructionStringForLegIndex:", objc_msgSend(v54, "legIndex")));
      v85 = (void *)v88;
      -[MapsFadingLabel setText:](self->_arrivedSubtitleLabel, "setText:", v88);
LABEL_49:

LABEL_50:
LABEL_51:

LABEL_52:
      -[NavTrayStackedLabel invalidateIntrinsicContentSize](self->_minimizedArrivalLabel, "invalidateIntrinsicContentSize");
      -[MapsFadingLabel invalidateIntrinsicContentSize](self->_expandedTitleLabel, "invalidateIntrinsicContentSize");
      -[UILabel invalidateIntrinsicContentSize](self->_arrivedTitleLabel, "invalidateIntrinsicContentSize");
      -[MapsFadingLabel invalidateIntrinsicContentSize](self->_arrivedSubtitleLabel, "invalidateIntrinsicContentSize");
      -[NavTrayStackedLabel invalidateIntrinsicContentSize](self->_timeLabel, "invalidateIntrinsicContentSize");
      -[NavTrayStackedLabel invalidateIntrinsicContentSize](self->_distanceLabel, "invalidateIntrinsicContentSize");
      -[NavTrayStackedLabel invalidateIntrinsicContentSize](self->_batteryLabel, "invalidateIntrinsicContentSize");
      -[NavTrayHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      return;
    default:
      goto LABEL_52;
  }
}

- (void)_updateLayout
{
  _BOOL8 v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL8 v8;
  int v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  int *v15;
  int *v16;
  double v17;
  AxisAdjustingStackView *endRouteButtonStackView;
  UIButton *alternativeActionButton;
  unint64_t v20;
  _BOOL8 v21;
  double v22;
  float v23;
  UIImageView *chevronImageView;
  CGAffineTransform v25;
  CGAffineTransform v26;

  v3 = -[NavTrayHeaderView isExpanded](self, "isExpanded");
  v4 = -[NavTrayHeaderView _isResumeRouteState](self, "_isResumeRouteState");
  v5 = -[NavTrayHeaderView _alternateButtonTypeContains:](self, "_alternateButtonTypeContains:", 1);
  v6 = -[NavTrayHeaderView _alternateButtonTypeContains:](self, "_alternateButtonTypeContains:", 2);
  v7 = -[NavTrayHeaderView _alternateButtonTypeContains:](self, "_alternateButtonTypeContains:", 16);
  v8 = 0;
  v9 = v4 | v5 | v6 | v7;
  if ((v4 & 1) == 0 && (v7 & 1) == 0)
    v8 = !-[NavTrayHeaderView _isParkingRouteState](self, "_isParkingRouteState")
      && -[NavTrayHeaderView showFeedbackView](self, "showFeedbackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection"));
  v11 = objc_msgSend(v10, "isLuminanceReduced");

  if (v11)
    v12 = 0.300000012;
  else
    v12 = 1.0;
  switch(-[NavTrayHeaderView state](self, "state"))
  {
    case 0uLL:
    case 1uLL:
      if (v3)
        v13 = 1.0;
      else
        v13 = 0.0;
      if (v3)
        v14 = 0.0;
      else
        v14 = 1.0;
      -[MapsFadingLabel setAlpha:](self->_expandedTitleLabel, "setAlpha:", v13);
      v15 = &OBJC_IVAR___NavTrayHeaderView__minimizedStackView;
      goto LABEL_18;
    case 2uLL:
      -[MapsFadingLabel setAlpha:](self->_expandedTitleLabel, "setAlpha:", 1.0);
      v15 = &OBJC_IVAR___NavTrayHeaderView__minimizedStackView;
      v14 = 0.0;
LABEL_18:
      v16 = &OBJC_IVAR___NavTrayHeaderView__chevronImageView;
      goto LABEL_25;
    case 3uLL:
      v14 = 0.0;
      -[MapsFadingLabel setAlpha:](self->_expandedTitleLabel, "setAlpha:", 0.0);
      -[UIStackView setAlpha:](self->_minimizedStackView, "setAlpha:", 0.0);
      -[UIImageView setAlpha:](self->_chevronImageView, "setAlpha:", 0.0);
      if (v9)
        v17 = v12;
      else
        v17 = 0.0;
      -[UIButton setAlpha:](self->_alternativeActionButton, "setAlpha:", v17);
      if (v8)
        v14 = v12;
      v16 = &OBJC_IVAR___NavTrayHeaderView__endButton;
      v15 = &OBJC_IVAR___NavTrayHeaderView__feedbackView;
LABEL_25:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v15), "setAlpha:", v14);
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v16), "setAlpha:", v12);
      break;
    default:
      break;
  }
  endRouteButtonStackView = self->_endRouteButtonStackView;
  alternativeActionButton = self->_alternativeActionButton;
  if (v9)
  {
    -[AxisAdjustingStackView insertArrangedTruncatableSubview:atIndex:](endRouteButtonStackView, "insertArrangedTruncatableSubview:atIndex:", alternativeActionButton, 0);
  }
  else
  {
    -[AxisAdjustingStackView removeArrangedTruncatableSubview:](endRouteButtonStackView, "removeArrangedTruncatableSubview:", alternativeActionButton);
    -[UIButton removeFromSuperview](self->_alternativeActionButton, "removeFromSuperview");
  }
  v20 = -[NavTrayHeaderView state](self, "state");
  v21 = v20 == 3;
  v22 = 0.0;
  if (v20 == 3)
    v22 = 1.0;
  -[UIView setAlpha:](self->_arrivedContainerView, "setAlpha:", v22);
  -[NSLayoutConstraint setActive:](self->_arrivedContainerTopConstraint, "setActive:", v21);
  -[NSLayoutConstraint setActive:](self->_feedbackViewBottomConstraint, "setActive:", v8);
  -[NSLayoutConstraint setActive:](self->_minimizedStackViewBottomConstraint, "setActive:", v3 ^ 1);
  -[NSLayoutConstraint setActive:](self->_expandedTitleLabelBottomConstraint, "setActive:", v3);
  v23 = 0.0;
  if (v3)
    v23 = 1.0;
  CGAffineTransformMakeRotation(&v26, (float)((float)(v23 * 2.0) + -1.0) * 1.57079633);
  chevronImageView = self->_chevronImageView;
  v25 = v26;
  -[UIImageView setTransform:](chevronImageView, "setTransform:", &v25);
}

- (void)_updateTextAlignment
{
  int64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  id v10;

  v3 = -[NavTrayHeaderView _textAlignmentForCurrentLanguage](self, "_textAlignmentForCurrentLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_minimizedArrivalLabel, "bottomLabel"));
  objc_msgSend(v4, "setTextAlignment:", v3);

  v5 = -[NavTrayHeaderView _textAlignmentForCurrentLanguage](self, "_textAlignmentForCurrentLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_timeLabel, "bottomLabel"));
  objc_msgSend(v6, "setTextAlignment:", v5);

  v7 = -[NavTrayHeaderView _textAlignmentForCurrentLanguage](self, "_textAlignmentForCurrentLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_distanceLabel, "bottomLabel"));
  objc_msgSend(v8, "setTextAlignment:", v7);

  v9 = -[NavTrayHeaderView _textAlignmentForCurrentLanguage](self, "_textAlignmentForCurrentLanguage");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomLabel](self->_batteryLabel, "bottomLabel"));
  objc_msgSend(v10, "setTextAlignment:", v9);

}

- (BOOL)_alternateButtonTypeContains:(unint64_t)a3
{
  return (-[NavTrayHeaderView alternateButtonTypes](self, "alternateButtonTypes") & a3) != 0;
}

- (BOOL)_isResumeRouteState
{
  if (-[NavTrayHeaderView _alternateButtonTypeContains:](self, "_alternateButtonTypeContains:", 4))
    return 1;
  else
    return -[NavTrayHeaderView _alternateButtonTypeContains:](self, "_alternateButtonTypeContains:", 8);
}

- (BOOL)_isArrivalState
{
  return self->_arrivalState != 0;
}

- (BOOL)_isParkingRouteState
{
  return (unint64_t)(self->_arrivalState - 3) < 2;
}

- (void)showRecalculating
{
  if (!-[NavTrayHeaderView _isArrivalState](self, "_isArrivalState"))
  {
    self->_isRerouting = 1;
    -[NavTrayHeaderView setETA:](self, "setETA:", 0);
  }
}

- (void)applyArrivalState
{
  -[NavTrayHeaderView applyArrivalStateAndReloadStackView:](self, "applyArrivalStateAndReloadStackView:", 0);
}

- (void)applyArrivalStateAndReloadStackView:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  UIButton *endButton;
  uint64_t v14;
  unint64_t currentAlternateButtonType;
  id v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  UIButton *alternativeActionButton;
  unint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint8_t v43[24];

  v3 = a3;
  v5 = sub_1004C1BD4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v43 = 134349056;
    *(_QWORD *)&v43[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Applying arrival state", v43, 0xCu);
  }

  v7 = -[NavTrayHeaderView _isResumeRouteState](self, "_isResumeRouteState");
  v8 = sub_1004C1BD4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v10)
    {
      *(_DWORD *)v43 = 134349056;
      *(_QWORD *)&v43[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Configuring pause button", v43, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
    v12 = v11;
    endButton = self->_endButton;
    v14 = 2;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)v43 = 134349056;
      *(_QWORD *)&v43[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Configuring end route button", v43, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
    v12 = v11;
    endButton = self->_endButton;
    v14 = 1;
  }
  objc_msgSend(v11, "styleButton:ofType:", endButton, v14);

  currentAlternateButtonType = self->_currentAlternateButtonType;
  if ((-[NavTrayHeaderView alternateButtonTypes](self, "alternateButtonTypes") & 4) != 0)
  {
    v16 = sub_1004C1BD4();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
LABEL_28:

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
      v26 = v25;
      alternativeActionButton = self->_alternativeActionButton;
      v28 = 4;
      v29 = 4;
LABEL_29:
      objc_msgSend(v25, "styleButton:ofType:", alternativeActionButton, v29, *(_OWORD *)v43);

      self->_currentAlternateButtonType = v28;
      goto LABEL_30;
    }
    *(_DWORD *)v43 = 134349056;
    *(_QWORD *)&v43[4] = self;
    v18 = "[%{public}p] Configuring resume button";
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, v43, 0xCu);
    goto LABEL_28;
  }
  if ((-[NavTrayHeaderView alternateButtonTypes](self, "alternateButtonTypes") & 8) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "arrivalChargingStationInfo"));
    objc_msgSend(v20, "chargingTime");
    v22 = v21;

    v23 = sub_1004C1BD4();
    v17 = objc_claimAutoreleasedReturnValue(v23);
    v24 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v22 > 0.0)
    {
      if (v24)
      {
        *(_DWORD *)v43 = 134349056;
        *(_QWORD *)&v43[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Configuring other stations button", v43, 0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
      v26 = v25;
      alternativeActionButton = self->_alternativeActionButton;
      v28 = 3;
      v29 = 3;
      goto LABEL_29;
    }
    if (!v24)
      goto LABEL_28;
    *(_DWORD *)v43 = 134349056;
    *(_QWORD *)&v43[4] = self;
    v18 = "[%{public}p] Configuring resume from charging button";
    goto LABEL_27;
  }
  if ((-[NavTrayHeaderView alternateButtonTypes](self, "alternateButtonTypes") & 2) != 0)
  {
    v30 = sub_1004C1BD4();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v43 = 134349056;
      *(_QWORD *)&v43[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] Configuring walking button", v43, 0xCu);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
    objc_msgSend(v32, "styleButton:ofType:", self->_alternativeActionButton, 6);

    self->_currentAlternateButtonType = 6;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
    objc_msgSend(v33, "didSuggestWalkingRoute");
    goto LABEL_43;
  }
  if ((-[NavTrayHeaderView alternateButtonTypes](self, "alternateButtonTypes") & 1) != 0)
  {
    v38 = sub_1004C1BD4();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v43 = 134349056;
      *(_QWORD *)&v43[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}p] Configuring find my button", v43, 0xCu);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
    objc_msgSend(v40, "styleButton:ofType:", self->_alternativeActionButton, 5);

    self->_currentAlternateButtonType = 5;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
    objc_msgSend(v33, "didSuggestFindMy");
LABEL_43:

    goto LABEL_30;
  }
  if ((-[NavTrayHeaderView alternateButtonTypes](self, "alternateButtonTypes") & 0x10) != 0)
  {
    v41 = sub_1004C1BD4();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v43 = 134349056;
      *(_QWORD *)&v43[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}p] Configuring custom route button", v43, 0xCu);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
    v26 = v25;
    alternativeActionButton = self->_alternativeActionButton;
    v28 = 7;
    v29 = 7;
    goto LABEL_29;
  }
  self->_currentAlternateButtonType = 0;
LABEL_30:
  if (self->_arrivalState)
  {
    v34 = self->_currentAlternateButtonType;
    if (currentAlternateButtonType != v34)
    {
      switch(v34)
      {
        case 5uLL:
          v35 = 125;
          goto LABEL_37;
        case 7uLL:
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "tourMuid"));
          +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 45, 136, v37);

          break;
        case 6uLL:
          v35 = 124;
LABEL_37:
          +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 45, v35, 0);
          break;
      }
    }
  }
  -[NavTrayHeaderView _updateContentAndReloadStackView:](self, "_updateContentAndReloadStackView:", v3);
  -[NavTrayHeaderView _updateLayout](self, "_updateLayout");
}

- (void)resetContent
{
  id v3;
  NSObject *v4;
  int v5;
  NavTrayHeaderView *v6;

  v3 = sub_1004C1BD4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Resetting content", (uint8_t *)&v5, 0xCu);
  }

  self->_arrivalState = 0;
  self->_alternateButtonTypes = 0;
  self->_showFeedbackView = 0;
  -[AxisAdjustingStackView invalidateStackViewAxis](self->_endRouteButtonStackView, "invalidateStackViewAxis");
}

- (void)clearAnimations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView layer](self, "layer"));
  objc_msgSend(v3, "removeAllAnimations");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel layer](self->_expandedTitleLabel, "layer"));
  objc_msgSend(v4, "removeAllAnimations");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView layer](self->_minimizedStackView, "layer"));
  objc_msgSend(v5, "removeAllAnimations");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_chevronImageView, "layer"));
  objc_msgSend(v6, "removeAllAnimations");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_arrivedContainerView, "layer"));
  objc_msgSend(v7, "removeAllAnimations");

}

- (BOOL)_shouldPostBacklightSceneRequiresUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  if (GEOConfigGetBOOL(MapsConfig_BacklightSceneUpdaterOptimizationEnabled, off_1014B49F8)
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView traitCollection](self, "traitCollection")),
        v6 = objc_msgSend(v5, "isLuminanceReduced"),
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_minimizedArrivalLabel, "topLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrivalTimeStringIncludingAMPMSymbols:", 0));
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_timeLabel, "topLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeValue"));
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topLabel](self->_distanceLabel, "topLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "text"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "distanceValue"));
    LOBYTE(v13) = objc_msgSend(v16, "isEqualToString:", v17);

    v18 = v10 & v14 & v13 ^ 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_pressedHeaderView
{
  id v3;

  if (!-[NavTrayHeaderView _isArrivalState](self, "_isArrivalState"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
    objc_msgSend(v3, "pressedHeaderView");

  }
}

- (void)stackViewDidChangeLayout:(id)a3
{
  id v4;

  -[NavTrayHeaderView setNeedsLayout](self, "setNeedsLayout", a3);
  -[NavTrayHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayHeaderView delegate](self, "delegate"));
  objc_msgSend(v4, "updatedHeight");

}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (UIView)hairlineView
{
  return self->_hairlineView;
}

- (int64_t)arrivalState
{
  return self->_arrivalState;
}

- (void)setArrivalState:(int64_t)a3
{
  self->_arrivalState = a3;
}

- (unint64_t)alternateButtonTypes
{
  return self->_alternateButtonTypes;
}

- (void)setAlternateButtonTypes:(unint64_t)a3
{
  self->_alternateButtonTypes = a3;
}

- (unint64_t)currentAlternateButtonType
{
  return self->_currentAlternateButtonType;
}

- (BOOL)showFeedbackView
{
  return self->_showFeedbackView;
}

- (void)setShowFeedbackView:(BOOL)a3
{
  self->_showFeedbackView = a3;
}

- (NavTrayHeaderViewDelegate)delegate
{
  return (NavTrayHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (GuidanceETA)ETA
{
  return self->_ETA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ETA, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_minimizedStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_endRouteButtonStackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_arrivedContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_alternativeActionButton, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_feedbackView, 0);
  objc_storeStrong((id *)&self->_arrivedSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_arrivedTitleLabel, 0);
  objc_storeStrong((id *)&self->_arrivedHeaderView, 0);
  objc_storeStrong((id *)&self->_arrivedContainerView, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabel, 0);
  objc_storeStrong((id *)&self->_batteryLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_minimizedArrivalLabel, 0);
  objc_storeStrong(&self->_minimizedValueFontProvider, 0);
  objc_storeStrong((id *)&self->_endRouteButtonStackView, 0);
  objc_storeStrong((id *)&self->_minimizedStackView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
