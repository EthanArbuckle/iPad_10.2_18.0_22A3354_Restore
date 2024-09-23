@implementation STUIStatusBarVisualProvider_Pad

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5;
  int v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (objc_msgSend(v5, "_isMainLikeScreen"))
    v6 = objc_msgSend(v5, "_isEmbeddedScreen") ^ 1;
  else
    v6 = 0;
  objc_msgSend(v5, "_displayCornerRadius");
  v8 = v7;
  objc_msgSend(v5, "_displayCornerRadiusIgnoringZoom");
  if (v6 || v8 > 0.0)
  {
    v10 = (void *)objc_opt_class();
    STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v10, v5, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = a1;
  }
  v11 = v9;

  return (Class)v11;
}

+ (double)height
{
  return 20.0;
}

- (double)regionSpacing
{
  return 8.0;
}

+ (NSDirectionalEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 6.0;
  v4 = 0.0;
  v5 = 5.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 6.0;
  v4 = 0.0;
  v5 = 5.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (double)baselineOffset
{
  return 14.0;
}

- (CGSize)pillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 16.0;
  v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)expandedPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)regionCursorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -1.0;
  v3 = -3.0;
  v4 = -1.0;
  v5 = -3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)regionCursorIsPill
{
  return 0;
}

+ (double)regionCursorCornerRadius
{
  return 4.0;
}

- (id)normalFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)qword_1EDBEE048;
  if (qword_1EDBEE048)
    v4 = _MergedGlobals_3 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    _MergedGlobals_3 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1438]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1EDBEE048;
    qword_1EDBEE048 = v5;

    v3 = (void *)qword_1EDBEE048;
  }
  return v3;
}

- (id)expandedFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE050;
  if (unk_1EDBEE050)
    v4 = byte_1EDBEE031 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE031 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1438]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE050;
    unk_1EDBEE050 = v5;

    v3 = (void *)unk_1EDBEE050;
  }
  return v3;
}

- (id)pillFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE058;
  if (unk_1EDBEE058)
    v4 = byte_1EDBEE032 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE032 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1448]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE058;
    unk_1EDBEE058 = v5;

    v3 = (void *)unk_1EDBEE058;
  }
  return v3;
}

- (id)pillSmallFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE060;
  if (unk_1EDBEE060)
    v4 = byte_1EDBEE033 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE033 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 10.0, *MEMORY[0x1E0DC1420]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE060;
    unk_1EDBEE060 = v5;

    v3 = (void *)unk_1EDBEE060;
  }
  return v3;
}

- (id)expandedPillFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE068;
  if (unk_1EDBEE068)
    v4 = byte_1EDBEE034 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE034 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1438]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE068;
    unk_1EDBEE068 = v5;

    v3 = (void *)unk_1EDBEE068;
  }
  return v3;
}

- (UIFont)clockFont
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualProviderSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasBoldTime");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC1350];
    -[STUIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    objc_msgSend(v6, "systemFontOfSize:weight:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[STUIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIFont *)v8;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return 1;
}

- (STUIStatusBarVisualProvider_Pad)init
{
  STUIStatusBarVisualProvider_Pad *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  v2 = -[STUIStatusBarVisualProvider_iOS init](&v5, sel_init);
  __UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("StatusBarHidesDate"), 0, 0);
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("StatusBarHidesAMPM"), 0, 0);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  __UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("StatusBarHidesDate"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("StatusBarHidesAMPM"));

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  -[STUIStatusBarVisualProvider_Pad dealloc](&v4, sel_dealloc);
}

- (id)setupInContainerView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  STUIStatusBarRegion *v28;
  STUIStatusBarRegionAxesLayout *v29;
  STUIStatusBarRegionAxisStackingLayout *v30;
  void *v31;
  void *v32;
  double v33;
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
  STUIStatusBarRegion *v44;
  STUIStatusBarRegionAxesLayout *v45;
  STUIStatusBarRegionAxisStackingLayout *v46;
  void *v47;
  void *v48;
  double v49;
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
  STUIStatusBarRegion *v60;
  STUIStatusBarRegionAxisCenteringLayout *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
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
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  NSLayoutConstraint *leadingRegionTrailingAnchorConstraint;
  void *v98;
  void *v99;
  uint64_t v100;
  NSLayoutConstraint *trailingRegionLeadingAnchorConstraint;
  STUIStatusBarRegion *v102;
  STUIStatusBarRegionAxesLayout *v103;
  STUIStatusBarRegionAxisStackingLayout *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  STUIStatusBarRegion *v116;
  STUIStatusBarRegionAxesLayout *v117;
  STUIStatusBarRegionAxisStackingLayout *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
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
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  STUIStatusBarRegionAxesLayout *v148;
  void *v149;
  void *v150;
  void *v151;
  double v152;
  double v153;
  double v154;
  double v155;
  STUIStatusBarVisualProvider_Pad *v156;
  id v157;
  void *v158;
  _QWORD v159[5];

  v159[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "baselineOffset");
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "edgeInsets");
  v11 = v10;
  v13 = v12;
  -[STUIStatusBarVisualProvider_Pad expandedEdgeInsets](self, "expandedEdgeInsets");
  v153 = v14;
  v155 = v15;
  -[STUIStatusBarVisualProvider_iOS itemSpacing](self, "itemSpacing");
  v17 = v16;
  -[STUIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  v152 = v18;
  -[STUIStatusBarVisualProvider_Pad regionSpacing](self, "regionSpacing");
  v20 = v19;
  v156 = self;
  -[STUIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "capHeight");
  v23 = v22;

  -[STUIStatusBarVisualProvider_Pad expandedFont](self, "expandedFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "capHeight");
  v154 = v25;

  -[STUIStatusBarVisualProvider_Pad pillSize](self, "pillSize");
  v27 = v26;
  v28 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("leading"));
  v29 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v30 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v30, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v30, "setInterspace:", 10.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v29, "setHorizontalLayout:", v30);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v29, "setVerticalLayout:", v31);

  -[STUIStatusBarRegion setLayout:](v28, "setLayout:", v29);
  -[STUIStatusBarRegion setOffsetable:](v28, "setOffsetable:", 1);
  -[STUIStatusBarRegion setActionInsets:](v28, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  +[STUIStatusBarHoverRegionAction leadingHoverAction](STUIStatusBarHoverRegionAction, "leadingHoverAction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setHoverAction:](v28, "setHoverAction:", v32);

  UIRoundToViewScale();
  -[STUIStatusBarRegion setExtendedHoverInsets:](v28, "setExtendedHoverInsets:", -v33, -v11, 0.0, 0.0);
  -[STUIStatusBarRegion layoutItem](v28, "layoutItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v37);

  objc_msgSend(v34, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v40);

  v158 = v34;
  objc_msgSend(v34, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", v23);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v42);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v34);
  v43 = v7;
  v157 = v7;
  objc_msgSend(v7, "addObject:", v28);

  v44 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("trailing"));
  v45 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v46 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v46, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v46, "setInterspace:", v17);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v45, "setHorizontalLayout:", v46);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v45, "setVerticalLayout:", v47);

  -[STUIStatusBarRegion setLayout:](v44, "setLayout:", v45);
  -[STUIStatusBarRegion setOffsetable:](v44, "setOffsetable:", 1);
  -[STUIStatusBarRegion setActionInsets:](v44, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  +[STUIStatusBarHoverRegionAction trailingHoverAction](STUIStatusBarHoverRegionAction, "trailingHoverAction");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setHoverAction:](v44, "setHoverAction:", v48);

  UIRoundToViewScale();
  -[STUIStatusBarRegion setExtendedHoverInsets:](v44, "setExtendedHoverInsets:", -v49, 0.0, 0.0, -v13);
  -[STUIStatusBarRegion layoutItem](v44, "layoutItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, v9);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v53);

  objc_msgSend(v50, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, -v13);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v56);

  objc_msgSend(v50, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToConstant:", v23);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v58);

  v59 = v50;
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v50);

  objc_msgSend(v43, "addObject:", v44);
  v60 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("center"));
  v148 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v61 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setInterspace:](v61, "setInterspace:", v17);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v148, "setHorizontalLayout:", v61);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v148, "setVerticalLayout:", v62);

  -[STUIStatusBarRegion setLayout:](v60, "setLayout:", v148);
  -[STUIStatusBarRegion setOffsetable:](v60, "setOffsetable:", 1);
  -[STUIStatusBarRegion layoutItem](v60, "layoutItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "centerXAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v67) = 1132068864;
  objc_msgSend(v66, "_ui_constraintWithPriority:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v68);

  objc_msgSend(v63, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToConstant:", 0.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = 1132003328;
  objc_msgSend(v70, "_ui_constraintWithPriority:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v72);

  objc_msgSend(v63, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, v9);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v75);

  objc_msgSend(v63, "heightAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToConstant:", v23);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v77);

  objc_msgSend(v63, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintGreaterThanOrEqualToAnchor:constant:", v79, v20);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v80);

  objc_msgSend(v59, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintGreaterThanOrEqualToAnchor:constant:", v82, v20);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v83);

  objc_msgSend(v63, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, v20);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v87) = 1132003328;
  objc_msgSend(v86, "_ui_constraintWithPriority:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v88);

  v151 = v59;
  objc_msgSend(v59, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v63;
  objc_msgSend(v63, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, v20);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v92) = 1132003328;
  objc_msgSend(v91, "_ui_constraintWithPriority:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v93);

  objc_msgSend(v5, "centerXAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintGreaterThanOrEqualToAnchor:constant:", v95, 0.0);
  v96 = objc_claimAutoreleasedReturnValue();
  leadingRegionTrailingAnchorConstraint = v156->_leadingRegionTrailingAnchorConstraint;
  v156->_leadingRegionTrailingAnchorConstraint = (NSLayoutConstraint *)v96;

  objc_msgSend(v6, "addObject:", v156->_leadingRegionTrailingAnchorConstraint);
  objc_msgSend(v59, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintGreaterThanOrEqualToAnchor:constant:", v99, 0.0);
  v100 = objc_claimAutoreleasedReturnValue();
  trailingRegionLeadingAnchorConstraint = v156->_trailingRegionLeadingAnchorConstraint;
  v156->_trailingRegionLeadingAnchorConstraint = (NSLayoutConstraint *)v100;

  objc_msgSend(v6, "addObject:", v156->_trailingRegionLeadingAnchorConstraint);
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v63);

  objc_msgSend(v157, "addObject:", v60);
  v102 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLeading"));
  v103 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v104 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v104, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v104, "setInterspace:", v152);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v103, "setHorizontalLayout:", v104);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v103, "setVerticalLayout:", v105);

  -[STUIStatusBarRegion setLayout:](v102, "setLayout:", v103);
  v106 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[STUIStatusBarRegion setContentView:](v102, "setContentView:", v106);

  -[STUIStatusBarRegion setOffsetable:](v102, "setOffsetable:", 1);
  -[STUIStatusBarRegion disableWithToken:](v102, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v102, "layoutItem");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "leadingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, v153);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v110);

  objc_msgSend(v107, "bottomAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v112, v9);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v113);

  objc_msgSend(v107, "heightAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToConstant:", v154);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v115);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v107);
  objc_msgSend(v157, "addObject:", v102);

  v116 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedTrailing"));
  v117 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v118 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v118, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v118, "setInterspace:", v152);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v117, "setHorizontalLayout:", v118);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v117, "setVerticalLayout:", v119);

  -[STUIStatusBarRegion setLayout:](v116, "setLayout:", v117);
  v120 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[STUIStatusBarRegion setContentView:](v116, "setContentView:", v120);

  -[STUIStatusBarRegion setOffsetable:](v116, "setOffsetable:", 1);
  -[STUIStatusBarRegion disableWithToken:](v116, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v116, "layoutItem");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "leadingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v107;
  objc_msgSend(v107, "trailingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "constraintEqualToAnchor:constant:", v123, v20);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v124);

  objc_msgSend(v121, "widthAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "widthAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v128) = 1131741184;
  objc_msgSend(v127, "_ui_constraintWithPriority:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v129);

  objc_msgSend(v121, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToAnchor:constant:", v131, -v155);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v132);

  objc_msgSend(v121, "bottomAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToAnchor:constant:", v134, v9);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v135);

  objc_msgSend(v121, "heightAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToConstant:", v154);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v137);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v121);
  objc_msgSend(v157, "addObject:", v116);

  STUIStatusBarAddLumaView(v5, v6, v158, 1, v27);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Pad setLeadingBackgroundLumaView:](v156, "setLeadingBackgroundLumaView:", v138);

  STUIStatusBarAddLumaView(v5, v6, v150, 0, v27);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Pad setCenterBackgroundLumaView:](v156, "setCenterBackgroundLumaView:", v139);

  STUIStatusBarAddLumaView(v5, v6, v151, 2, v27);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_Pad setTrailingBackgroundLumaView:](v156, "setTrailingBackgroundLumaView:", v140);
  v141 = objc_alloc(MEMORY[0x1E0DC4288]);
  -[STUIStatusBarVisualProvider_Pad leadingBackgroundLumaView](v156, "leadingBackgroundLumaView");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v142;
  -[STUIStatusBarVisualProvider_Pad centerBackgroundLumaView](v156, "centerBackgroundLumaView");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v159[1] = v143;
  -[STUIStatusBarVisualProvider_Pad trailingBackgroundLumaView](v156, "trailingBackgroundLumaView");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v159[2] = v144;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 3);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = (void *)objc_msgSend(v141, "initWithTransitionBoundaries:minimumDifference:delegate:views:", v156, v145, 0.4, 0.7, 0.5);
  -[STUIStatusBarVisualProvider_iOS setLumaTrackingGroup:](v156, "setLumaTrackingGroup:", v146);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
  return v157;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  NSDictionary *orderedDisplayItemPlacements;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  STUIStatusBarDisplayItemPlacement *v15;
  STUIStatusBarDisplayItemPlacement *timePlacement;
  void *v17;
  void *v18;
  void *v19;
  STUIStatusBarDisplayItemPlacement *v20;
  STUIStatusBarDisplayItemPlacement *datePlacement;
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
  STUIStatusBarVisualProvider_Pad *v32;
  STUIStatusBarDisplayItemPlacement *v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
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
  void *v73;
  void *v74;
  uint64_t v75;
  NSDictionary *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  STUIStatusBarVisualProvider_Pad *v89;
  void *v90;
  void *v91;
  _QWORD v92[2];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[2];
  void *v96;
  void *v97;
  _QWORD v98[4];
  _QWORD v99[3];
  _QWORD v100[3];
  uint64_t v101;
  _QWORD v102[3];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[3];

  v105[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    v82 = v4;
    +[STUIStatusBarCellularItem nameDisplayIdentifier](STUIStatusBarCellularExpandedItem, "nameDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 1003);
    v7 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v8, 1200);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "excludingPlacements:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v12, 1201);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = v7;
    v104[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "excludingPlacements:", v14);
    v15 = (STUIStatusBarDisplayItemPlacement *)objc_claimAutoreleasedReturnValue();
    timePlacement = self->_timePlacement;
    self->_timePlacement = v15;

    +[STUIStatusBarTimeItem dateDisplayIdentifier](STUIStatusBarTimeItem, "dateDisplayIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v17, 700);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = self->_timePlacement;
    v103[1] = v11;
    v90 = (void *)v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requiringAnyPlacements:", v19);
    v20 = (STUIStatusBarDisplayItemPlacement *)objc_claimAutoreleasedReturnValue();
    datePlacement = self->_datePlacement;
    self->_datePlacement = v20;

    v89 = self;
    -[STUIStatusBarVisualProvider_Pad _updateDateAndTimePlacements](self, "_updateDateAndTimePlacements");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarNavigationItem, "defaultDisplayIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v23, 1103);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v24;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarPersonNameItem, "defaultDisplayIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v25, 1102);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "excludingPlacements:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v28;
    v102[2] = v7;
    v81 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v22;
    objc_msgSend(v22, "addObjectsFromArray:", v29);

    +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "visualProviderSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v31, "showsDateBeforeTime");

    if ((_DWORD)v25)
    {
      v32 = v89;
      v33 = v89->_timePlacement;
      v100[0] = v89->_datePlacement;
      v100[1] = v33;
      v100[2] = v90;
      v34 = v100;
    }
    else
    {
      v99[0] = v89->_timePlacement;
      v99[1] = v90;
      v32 = v89;
      v99[2] = v89->_datePlacement;
      v34 = v99;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObjectsFromArray:", v35);

    v36 = objc_opt_class();
    +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:](STUIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:", 3500, 3200, v36, objc_opt_class(), 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_iOS bluetoothPaddingInset](v32, "bluetoothPaddingInset");
    +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 3400, 3100);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](STUIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", objc_msgSend(v83, "maximumPriority") + 1, objc_msgSend(v37, "minimumPriority") - 5);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v38, 3720);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarIndicatorLocationItem groupWithPriority:](STUIStatusBarIndicatorLocationItem, "groupWithPriority:", 3710);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v39, 3700);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v41, 3680);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "unstablePlacements");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v42);

    -[STUIStatusBarVisualProvider_iOS itemSpacing](v32, "itemSpacing");
    v44 = v37;
    v84 = v37;
    +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", objc_msgSend(v37, "minimumPriority") - 2, v43 * -2.0 + 8.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v40;
    v80 = v40;
    v97 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "requiringAllPlacements:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "unstablePlacements");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "requiringAnyPlacements:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v50;
    v98[1] = v40;
    -[STUIStatusBarVisualProvider_iOS itemSpacing](v32, "itemSpacing");
    +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", objc_msgSend(v40, "priority") - 1, v51 * -2.0 + 8.0, 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "requiringAllPlacements:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v54;
    v98[3] = v87;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v55);

    objc_msgSend(v86, "placements");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v56);

    v95[0] = v85;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v57, 3600);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "cellularGroup");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "placementsAffectedByAirplaneMode");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "excludingPlacements:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v62);

    objc_msgSend(v83, "placements");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v63);

    objc_msgSend(v84, "stablePlacements");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v64);

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorDisplayWarningItem, "defaultDisplayIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v65, 3730);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v66);

    objc_msgSend(v88, "placements");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v67);

    v93[0] = CFSTR("leading");
    v93[1] = CFSTR("trailing");
    v94[0] = v91;
    v94[1] = v79;
    v93[2] = CFSTR("center");
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarLockItem, "defaultDisplayIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v68, 2000);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v69;
    +[STUIStatusBarLockItem textDisplayIdentifier](STUIStatusBarLockItem, "textDisplayIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v70, 1999);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v72;
    v93[3] = CFSTR("expandedLeading");
    -[STUIStatusBarVisualProvider_iOS expandedLeadingPlacements](v89, "expandedLeadingPlacements");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v94[3] = v73;
    v93[4] = CFSTR("expandedTrailing");
    -[STUIStatusBarVisualProvider_iOS expandedTrailingPlacements](v89, "expandedTrailingPlacements");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v94[4] = v74;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 5);
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v89->_orderedDisplayItemPlacements;
    v89->_orderedDisplayItemPlacements = (NSDictionary *)v75;

    orderedDisplayItemPlacements = v89->_orderedDisplayItemPlacements;
    v4 = v82;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  return v77;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  if (objc_msgSend(v3, "isEqual:", CFSTR("leadingPartIdentifier")))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v9 = CFSTR("expandedLeading");
    v10 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "isEqual:", CFSTR("trailingPartIdentifier")))
    {
      v4 = (void *)MEMORY[0x1E0C99E60];
      v9 = CFSTR("expandedTrailing");
      v10 = 0;
      v5 = CFSTR("trailing");
      goto LABEL_6;
    }
    if (objc_msgSend(v3, "isEqual:", CFSTR("centerPartIdentifier")))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("center"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (!objc_msgSend(v3, "isEqual:", CFSTR("normalPartIdentifier")))
    {
      if ((objc_msgSend(v3, "isEqual:", CFSTR("expandedPartIdentifier")) & 1) == 0
        && !objc_msgSend(v3, "isEqual:", CFSTR("visibleExpandedPartIdentifier")))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("expandedLeading"), CFSTR("expandedTrailing"), 0, v11);
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x1E0C99E60];
    v10 = CFSTR("center");
    v11 = 0;
    v9 = CFSTR("trailing");
  }
  v5 = CFSTR("leading");
LABEL_6:
  objc_msgSend(v4, "setWithObjects:", v5, v9, v10, v11);
LABEL_7:
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = (void *)v6;

  return v7;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  const __CFString **v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("fittingLeadingPartIdentifier")))
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      v16[0] = CFSTR("expandedLeading");
      v6 = (const __CFString **)v16;
    }
    else
    {
      v15 = CFSTR("leading");
      v6 = &v15;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayItemIdentifiersInRegionsWithIdentifiers:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("fittingTrailingPartIdentifier")))
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      v14 = CFSTR("expandedTrailing");
      v6 = &v14;
    }
    else
    {
      v13 = CFSTR("trailing");
      v6 = &v13;
    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "isEqual:", CFSTR("clockPartIdentifier")))
  {
    v12.receiver = self;
    v12.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    -[STUIStatusBarVisualProvider_iOS displayItemIdentifiersForPartWithIdentifier:](&v12, sel_displayItemIdentifiersForPartWithIdentifier_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObjects:", v5, v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v10 = (void *)v9;

LABEL_13:
  return v10;
}

- (CGRect)clockBoundsForLayoutItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentAggregatedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortTimeEntry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    _StatusBar_UITimeSizeForLabel();
    v13 = v20;
    v15 = v21;
    v9 = 0.0;

    v11 = 0.0;
  }
  else
  {
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }

  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  -[STUIStatusBarVisualProvider_iOS styleAttributesForStyle:](&v17, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "setIconScale:", 1.16);
      objc_msgSend(v4, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayScale");
      objc_msgSend(v4, "setIconSize:", 15);

      -[STUIStatusBarVisualProvider_Pad expandedFont](self, "expandedFont");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (v5)
      goto LABEL_7;
  }
  objc_msgSend(v4, "setIconScale:", 1.0);
  objc_msgSend(v4, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  objc_msgSend(v4, "setIconSize:", 14);

  -[STUIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v7;
  objc_msgSend(v4, "setFont:", v7);

LABEL_7:
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visualProviderSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasBoldTime");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0DC1350];
    -[STUIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pointSize");
    objc_msgSend(v13, "systemFontOfSize:weight:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmphasizedFont:", v15);

  }
  else
  {
    objc_msgSend(v4, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmphasizedFont:", v14);
  }

  objc_msgSend(v4, "setImageNamePrefixes:", &unk_1E8D80108);
  return v4;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Pad pillFont](self, "pillFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    -[STUIStatusBarVisualProvider_Pad pillSmallFont](self, "pillSmallFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSmallFont:", v9);

    -[STUIStatusBarVisualProvider_Pad pillSize](self, "pillSize");
LABEL_6:
    objc_msgSend(v7, "setIconScale:", v10 / 21.3333333);
    objc_msgSend(v7, "setSymbolScale:", 2);
    goto LABEL_7;
  }
  +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarExpandedPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Pad expandedPillFont](self, "expandedPillFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v11);

    -[STUIStatusBarVisualProvider_Pad expandedPillFont](self, "expandedPillFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSmallFont:", v12);

    -[STUIStatusBarVisualProvider_Pad expandedPillSize](self, "expandedPillSize");
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  STUIStatusBarRoundedCornerView *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[4];
  BOOL v18;
  _QWORD v19[2];

  v5 = a5;
  v6 = a4;
  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
LABEL_8:
    v16.receiver = self;
    v16.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    -[STUIStatusBarVisualProvider_iOS actionable:highlighted:initialPress:](&v16, sel_actionable_highlighted_initialPress_, v8, v6, v5);
    goto LABEL_9;
  }
  v9 = v8;
  v10 = v9;
  if (!v9)
    goto LABEL_8;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v12)
    goto LABEL_8;
  objc_msgSend(v10, "highlightView");
  v13 = (STUIStatusBarRoundedCornerView *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(STUIStatusBarRoundedCornerView);
    objc_msgSend(v10, "setHighlightView:", v13);
  }
  v14 = (void *)MEMORY[0x1E0DC3518];
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__STUIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke;
  v17[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v18 = v6;
  objc_msgSend(v14, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v6, v15, v5, v17);

LABEL_9:
}

- (void)statusBarEnabledPartsUpdated
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
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *leadingRegionTrailingAnchorConstraint;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *trailingRegionLeadingAnchorConstraint;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _QWORD v46[2];
  CGRect v47;

  v46[1] = *MEMORY[0x1E0C80C00];
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regionWithIdentifier:", CFSTR("leading"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionWithIdentifier:", CFSTR("trailing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "regionWithIdentifier:", CFSTR("center"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEnabled");

  if ((v15 & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
    {
      if ((objc_msgSend(v6, "isEnabled") & 1) != 0)
        goto LABEL_7;
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "containerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "trailingAnchor");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v9;
      v9 = (void *)v18;
    }
    else
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "containerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leadingAnchor");
      v20 = objc_claimAutoreleasedReturnValue();
      v19 = v12;
      v12 = (void *)v20;
    }

  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLayoutConstraint firstAnchor](self->_leadingRegionTrailingAnchorConstraint, "firstAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v23)
  {
    objc_msgSend(v21, "addObject:", self->_leadingRegionTrailingAnchorConstraint);
    v24 = (void *)MEMORY[0x1E0CB3718];
    v46[0] = self->_leadingRegionTrailingAnchorConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v25 = v6;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deactivateConstraints:", v26);

    objc_msgSend(v4, "layoutItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLayoutConstraint constant](self->_leadingRegionTrailingAnchorConstraint, "constant");
    objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:constant:", v28);
    v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leadingRegionTrailingAnchorConstraint = self->_leadingRegionTrailingAnchorConstraint;
    self->_leadingRegionTrailingAnchorConstraint = v29;

    v6 = v25;
    objc_msgSend(v22, "addObject:", self->_leadingRegionTrailingAnchorConstraint);
  }
  -[NSLayoutConstraint secondAnchor](self->_trailingRegionLeadingAnchorConstraint, "secondAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v31)
  {
    objc_msgSend(v21, "addObject:", self->_trailingRegionLeadingAnchorConstraint);
    objc_msgSend(v6, "layoutItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = v6;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLayoutConstraint constant](self->_trailingRegionLeadingAnchorConstraint, "constant");
    objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:", v12);
    v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    trailingRegionLeadingAnchorConstraint = self->_trailingRegionLeadingAnchorConstraint;
    self->_trailingRegionLeadingAnchorConstraint = v35;

    v6 = v33;
    objc_msgSend(v22, "addObject:", self->_trailingRegionLeadingAnchorConstraint);
  }
  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v21);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "avoidanceFrame");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;

    v47.origin.x = v39;
    v47.origin.y = v41;
    v47.size.width = v43;
    v47.size.height = v45;
    if (!CGRectIsEmpty(v47))
      -[STUIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v39, v41, v43, v45);
  }

}

- (void)_updateConstraintsForAvoidanceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  BOOL IsEmpty;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MidX;
  double MaxX;
  CGFloat v28;
  double v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  char v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  int v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGRect r1;
  void *v50;
  STUIStatusBarVisualProvider_Pad *v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  r1.origin.x = v9;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v16 = 0.0;
  if (CGRectIsEmpty(v52))
  {
    v17 = 0.0;
    goto LABEL_16;
  }
  v53.origin.x = r1.origin.x;
  v53.origin.y = v11;
  v53.size.width = v13;
  v53.size.height = v15;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v54 = CGRectIntersection(v53, v62);
  IsEmpty = CGRectIsEmpty(v54);
  v19 = v11;
  v17 = 0.0;
  if (!IsEmpty)
  {
    v20 = v15;
    v21 = r1.origin.x;
    v22 = v19;
    v23 = v13;
    v24 = v13;
    v25 = v20;
    MidX = CGRectGetMidX(*(CGRect *)(&v19 - 1));
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    v48 = fmax(MidX - CGRectGetMinX(v55), 0.0);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    MaxX = CGRectGetMaxX(v56);
    v57.origin.x = r1.origin.x;
    v47 = v22;
    v57.origin.y = v22;
    v57.size.width = v23;
    v28 = v25;
    v57.size.height = v25;
    v29 = fmax(MaxX - CGRectGetMidX(v57), 0.0);
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "regionWithIdentifier:", CFSTR("center"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEnabled");

    if ((v32 & 1) == 0)
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "regionWithIdentifier:", CFSTR("leading"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEnabled");

      if ((v35 & 1) != 0)
      {
        -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "regionWithIdentifier:", CFSTR("trailing"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEnabled");

        if ((v38 & 1) == 0)
        {
          v58.origin.x = r1.origin.x;
          v58.origin.y = v47;
          v58.size.width = v23;
          v58.size.height = v28;
          v39 = CGRectGetMaxX(v58);
          v59.origin.x = x;
          v59.origin.y = y;
          v59.size.width = width;
          v59.size.height = height;
          v40 = fmax(v39 - CGRectGetMinX(v59), 0.0);
LABEL_10:
          -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "_shouldReverseLayoutDirection");

          if (v43)
            v16 = v40;
          else
            v16 = v29;
          if (v43)
            v17 = v29;
          else
            v17 = v40;
          goto LABEL_16;
        }
      }
      else
      {
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        v41 = CGRectGetMaxX(v60);
        v61.origin.x = r1.origin.x;
        v61.origin.y = v47;
        v61.size.width = v23;
        v61.size.height = v28;
        v29 = fmax(v41 - CGRectGetMinX(v61), 0.0);
      }
    }
    v40 = v48;
    goto LABEL_10;
  }
LABEL_16:
  -[NSLayoutConstraint constant](self->_leadingRegionTrailingAnchorConstraint, "constant");
  v45 = v44;
  if (v17 != v44)
    -[NSLayoutConstraint setConstant:](self->_leadingRegionTrailingAnchorConstraint, "setConstant:", v17);
  -[NSLayoutConstraint constant](self->_trailingRegionLeadingAnchorConstraint, "constant");
  if (v16 == v46)
  {
    if (v17 == v45)
      return;
  }
  else
  {
    -[NSLayoutConstraint setConstant:](self->_trailingRegionLeadingAnchorConstraint, "setConstant:", v16);
  }
  *(_QWORD *)&r1.origin.y = MEMORY[0x1E0C809B0];
  *(_QWORD *)&r1.size.width = 3221225472;
  *(_QWORD *)&r1.size.height = __71__STUIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke;
  v50 = &unk_1E8D62A38;
  v51 = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", &r1.origin.y);
}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  id v6;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avoidanceFrame");
  -[STUIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:");

}

- (void)sizeUpdatedFromSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;

  height = a3.height;
  width = a3.width;
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avoidanceFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  if (!CGRectIsEmpty(v20))
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;

    if (width != v17 || height != v19)
      -[STUIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v8, v10, v12, v14);
  }
}

- (void)itemCreated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v11, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem identifier](STUIStatusBarPillBackgroundActivityItem, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
    {
      v10 = v11;
      -[STUIStatusBarVisualProvider_Pad pillSize](self, "pillSize");
    }
    else
    {
      objc_msgSend(v11, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUIStatusBarItem identifier](STUIStatusBarVoiceControlPillItem, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
      {
        v10 = v11;
        -[STUIStatusBarVisualProvider_Pad smallPillSize](self, "smallPillSize");
      }
      else
      {
        objc_msgSend(v11, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUIStatusBarItem identifier](STUIStatusBarExpandedPillBackgroundActivityItem, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
          goto LABEL_10;
        v10 = v11;
        -[STUIStatusBarVisualProvider_Pad expandedPillSize](self, "expandedPillSize");
      }
    }
    objc_msgSend(v10, "setPillSize:");

    goto LABEL_10;
  }
  objc_msgSend(v11, "setShowsDisabledSignalBars:", 0);
LABEL_10:

}

- (BOOL)_updateDateAndTimePlacements
{
  void *v3;
  int v4;
  int v5;
  int v6;
  char v7;

  __UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("StatusBarHidesDate"));
  v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("StatusBarHidesAMPM"));
  v6 = v4 ^ -[STUIStatusBarDisplayItemPlacement isEnabled](self->_datePlacement, "isEnabled");
  if ((v6 & 1) == 0)
    -[STUIStatusBarDisplayItemPlacement setEnabled:](self->_datePlacement, "setEnabled:", v4 ^ 1u);
  if (v5 == -[STUIStatusBarDisplayItemPlacement isEnabled](self->_timePlacement, "isEnabled"))
  {
    -[STUIStatusBarDisplayItemPlacement setEnabled:](self->_timePlacement, "setEnabled:", v5 ^ 1u);
    v7 = 1;
  }
  else
  {
    v7 = v6 ^ 1;
  }

  return v7;
}

- (void)_dateTimePreferencesUpdated
{
  id v3;

  if (-[STUIStatusBarVisualProvider_Pad _updateDateAndTimePlacements](self, "_updateDateAndTimePlacements"))
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  __UIKitUserDefaults();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    -[STUIStatusBarVisualProvider_Pad _dateTimePreferencesUpdated](self, "_dateTimePreferencesUpdated");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    -[STUIStatusBarVisualProvider_Pad observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double MinX;
  double v29;
  double MaxX;
  double v31;
  void *v32;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded")
    && -[STUIStatusBarVisualProvider_iOS wantsExpandedLeadingPlacements](self, "wantsExpandedLeadingPlacements"))
  {
    v37.receiver = self;
    v37.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    -[STUIStatusBarVisualProvider_iOS airplaneTravelOffsetInProposedPartWithIdentifier:animationType:](&v37, sel_airplaneTravelOffsetInProposedPartWithIdentifier_animationType_, a3, a4);
    return v7;
  }
  else
  {
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frameForDisplayItemWithIdentifier:", v9);
    v12 = v11;
    v35 = v13;
    v36 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v34 = v17;

    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frameForPartWithIdentifier:includeInternalItems:", *a3, 1);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v38.origin.x = v12;
    v38.origin.y = v14;
    v38.size.width = v16;
    v38.size.height = v18;
    MinX = CGRectGetMinX(v38);
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.width = v25;
    v39.size.height = v27;
    v29 = MinX - CGRectGetMinX(v39);
    v40.origin.x = v21;
    v40.origin.y = v23;
    v40.size.width = v25;
    v40.size.height = v27;
    MaxX = CGRectGetMaxX(v40);
    v41.origin.x = v36;
    v41.origin.y = v35;
    v41.size.width = v16;
    v41.size.height = v34;
    v31 = MaxX - CGRectGetMaxX(v41);
    if (v29 <= v31)
      v8 = v29;
    else
      v8 = v31;
    if (a4 == 1)
    {
      v42.origin.x = v36;
      v42.origin.y = v35;
      v42.size.width = v16;
      v42.size.height = v34;
      v8 = v8 - CGRectGetWidth(v42);
    }
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringRepresentation");
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  double result;
  objc_super v6;

  if (!-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded")
    || !-[STUIStatusBarVisualProvider_iOS wantsExpandedLeadingPlacements](self, "wantsExpandedLeadingPlacements"))
  {
    return 160.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  -[STUIStatusBarVisualProvider_iOS airplaneSpeedForAnimationType:](&v6, sel_airplaneSpeedForAnimationType_, a3);
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  _BOOL4 v5;
  double result;
  objc_super v7;

  v5 = -[STUIStatusBarVisualProvider_iOS expanded](self, "expanded");
  result = 1.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    -[STUIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 1.0);
  }
  return result;
}

- (id)regionIdentifiersForBackgroundLumaView:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[STUIStatusBarVisualProvider_Pad leadingBackgroundLumaView](self, "leadingBackgroundLumaView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("leading"), 0);
LABEL_8:
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[STUIStatusBarVisualProvider_Pad trailingBackgroundLumaView](self, "trailingBackgroundLumaView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("trailing"), 0);
    goto LABEL_8;
  }
  -[STUIStatusBarVisualProvider_Pad centerBackgroundLumaView](self, "centerBackgroundLumaView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("center"), 0);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v9 = (void *)v8;

  return v9;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, a3);
}

- (NSLayoutConstraint)trailingRegionLeadingAnchorConstraint
{
  return self->_trailingRegionLeadingAnchorConstraint;
}

- (void)setTrailingRegionLeadingAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingRegionLeadingAnchorConstraint, a3);
}

- (NSLayoutConstraint)leadingRegionTrailingAnchorConstraint
{
  return self->_leadingRegionTrailingAnchorConstraint;
}

- (void)setLeadingRegionTrailingAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingRegionTrailingAnchorConstraint, a3);
}

- (STUIStatusBarDisplayItemPlacement)datePlacement
{
  return self->_datePlacement;
}

- (void)setDatePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_datePlacement, a3);
}

- (STUIStatusBarDisplayItemPlacement)timePlacement
{
  return self->_timePlacement;
}

- (void)setTimePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_timePlacement, a3);
}

- (_UILumaTrackingBackdropView)leadingBackgroundLumaView
{
  return self->_leadingBackgroundLumaView;
}

- (void)setLeadingBackgroundLumaView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBackgroundLumaView, a3);
}

- (_UILumaTrackingBackdropView)centerBackgroundLumaView
{
  return self->_centerBackgroundLumaView;
}

- (void)setCenterBackgroundLumaView:(id)a3
{
  objc_storeStrong((id *)&self->_centerBackgroundLumaView, a3);
}

- (_UILumaTrackingBackdropView)trailingBackgroundLumaView
{
  return self->_trailingBackgroundLumaView;
}

- (void)setTrailingBackgroundLumaView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBackgroundLumaView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_centerBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_leadingBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_timePlacement, 0);
  objc_storeStrong((id *)&self->_datePlacement, 0);
  objc_storeStrong((id *)&self->_leadingRegionTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_trailingRegionLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end
