@implementation STUIStatusBarVisualProvider_LegacyPhone

- (BOOL)wantsExpandedLeadingPlacements
{
  return 1;
}

+ (double)_heightExpanded:(BOOL)a3
{
  double result;

  result = 20.0;
  if (a3)
    return 24.0;
  return result;
}

+ (CGSize)intrinsicLockScreenContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  objc_msgSend(a1, "_heightExpanded:", 1);
  v5 = v4;
  v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

+ (double)height
{
  double result;

  objc_msgSend(a1, "_heightExpanded:", 0);
  return result;
}

- (double)effectiveHeight
{
  void *v3;
  _BOOL8 v4;
  double result;

  v3 = (void *)objc_opt_class();
  v4 = -[STUIStatusBarVisualProvider_iOS expanded](self, "expanded")
    || -[STUIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen");
  objc_msgSend(v3, "_heightExpanded:", v4);
  return result;
}

- (double)regionSpacing
{
  return 8.0;
}

- (NSDirectionalEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 6.5;
  v4 = 0.0;
  v5 = 5.5;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)baselineOffset
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  UIRoundToScale();
  v4 = v3;

  return v4;
}

- (double)expandedBaselineOffset
{
  return 17.0;
}

- (double)dualLineExpandedBaselineOffset
{
  return -1.0;
}

- (double)lowerExpandedBaselineOffset
{
  return 18.0;
}

- (id)normalFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)qword_1EDBEE008;
  if (qword_1EDBEE008)
    v4 = _MergedGlobals_5 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    _MergedGlobals_5 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1440]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1EDBEE008;
    qword_1EDBEE008 = v5;

    v3 = (void *)qword_1EDBEE008;
  }
  return v3;
}

- (id)timeFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE010;
  if (unk_1EDBEE010)
    v4 = byte_1EDBEE001 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE001 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1448]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE010;
    unk_1EDBEE010 = v5;

    v3 = (void *)unk_1EDBEE010;
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
  v3 = (void *)unk_1EDBEE018;
  if (unk_1EDBEE018)
    v4 = byte_1EDBEE002 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE002 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1440]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE018;
    unk_1EDBEE018 = v5;

    v3 = (void *)unk_1EDBEE018;
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
  v3 = (void *)unk_1EDBEE020;
  if (unk_1EDBEE020)
    v4 = byte_1EDBEE003 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE003 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1448]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE020;
    unk_1EDBEE020 = v5;

    v3 = (void *)unk_1EDBEE020;
  }
  return v3;
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

- (id)setupInContainerView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
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
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  STUIStatusBarRegion *v27;
  STUIStatusBarRegionAxesLayout *v28;
  STUIStatusBarRegionAxisStackingLayout *v29;
  STUIStatusBarRegionAxisStackingLayout *leadingHorizontalLayout;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *leadingTopConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *leadingHeightConstraint;
  void *v43;
  STUIStatusBarRegion *v44;
  STUIStatusBarRegionAxesLayout *v45;
  STUIStatusBarRegionAxisStackingLayout *v46;
  STUIStatusBarRegionAxisStackingLayout *trailingHorizontalLayout;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *trailingTopConstraint;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  NSLayoutConstraint *v61;
  NSLayoutConstraint *trailingHeightConstraint;
  STUIStatusBarRegion *v63;
  STUIStatusBarRegionAxesLayout *v64;
  STUIStatusBarRegionAxisCenteringLayout *v65;
  STUIStatusBarRegionAxisCenteringLayout *centerHorizontalLayout;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  NSLayoutConstraint *v78;
  NSLayoutConstraint *centerTopConstraint;
  void *v80;
  NSLayoutConstraint *v81;
  NSLayoutConstraint *centerHeightConstraint;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  STUIStatusBarRegion *v89;
  STUIStatusBarRegionAxesLayout *v90;
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
  NSLayoutConstraint *v104;
  NSLayoutConstraint *backgroundHeightConstraint;
  double v106;
  double v107;
  STUIStatusBarRegion *v108;
  STUIStatusBarRegionAxesLayout *v109;
  STUIStatusBarRegionAxisStackingLayout *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  NSLayoutConstraint *v115;
  NSLayoutConstraint *expandedLeadingBottomConstraint;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  STUIStatusBarRegion *v122;
  STUIStatusBarRegionAxesLayout *v123;
  STUIStatusBarRegionAxisStackingLayout *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  NSLayoutConstraint *v129;
  NSLayoutConstraint *expandedTrailingBottomConstraint;
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
  double v142;
  void *v143;
  STUIStatusBarRegion *v144;
  STUIStatusBarRegionAxesLayout *v145;
  STUIStatusBarRegionAxisStackingLayout *v146;
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
  STUIStatusBarRegion *v157;
  STUIStatusBarRegionAxesLayout *v158;
  STUIStatusBarRegionAxisStackingLayout *v159;
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
  double v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v193;
  double v194;
  void *v195;
  void *v196;
  double v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  _QWORD v203[5];

  v203[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v202 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_LegacyPhone baselineOffset](self, "baselineOffset");
  v8 = v7;
  -[STUIStatusBarVisualProvider_LegacyPhone expandedBaselineOffset](self, "expandedBaselineOffset");
  v194 = v9;
  -[STUIStatusBarVisualProvider_LegacyPhone edgeInsets](self, "edgeInsets");
  v11 = v10;
  v13 = v12;
  -[STUIStatusBarVisualProvider_iOS itemSpacing](self, "itemSpacing");
  v15 = v14;
  -[STUIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  v17 = v16;
  -[STUIStatusBarVisualProvider_LegacyPhone regionSpacing](self, "regionSpacing");
  v19 = v18;
  -[STUIStatusBarVisualProvider_LegacyPhone normalFont](self, "normalFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "capHeight");
  v22 = v21 + 1.0;

  -[STUIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "capHeight");
  v25 = v24 + 1.0;

  -[STUIStatusBarVisualProvider_LegacyPhone pillSize](self, "pillSize");
  v197 = v26;
  v27 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("leading"));
  v28 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v29 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v29, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v29, "setInterspace:", v15);
  leadingHorizontalLayout = self->_leadingHorizontalLayout;
  self->_leadingHorizontalLayout = v29;

  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v28, "setHorizontalLayout:", self->_leadingHorizontalLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v28, "setVerticalLayout:", v31);

  -[STUIStatusBarRegion setLayout:](v27, "setLayout:", v28);
  -[STUIStatusBarRegion setActionInsets:](v27, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[STUIStatusBarRegion layoutItem](v27, "layoutItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, v8);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingTopConstraint = self->_leadingTopConstraint;
  self->_leadingTopConstraint = v35;

  objc_msgSend(v6, "addObject:", self->_leadingTopConstraint);
  objc_msgSend(v32, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v39);

  v201 = v32;
  objc_msgSend(v32, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToConstant:", v22);
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingHeightConstraint = self->_leadingHeightConstraint;
  self->_leadingHeightConstraint = v41;

  objc_msgSend(v6, "addObject:", self->_leadingHeightConstraint);
  v43 = v5;
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v32);

  objc_msgSend(v202, "addObject:", v27);
  v44 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("trailing"));
  v45 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v46 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v46, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v46, "setInterspace:", v15);
  trailingHorizontalLayout = self->_trailingHorizontalLayout;
  self->_trailingHorizontalLayout = v46;

  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v45, "setHorizontalLayout:", self->_trailingHorizontalLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v45, "setVerticalLayout:", v48);

  -[STUIStatusBarRegion setLayout:](v44, "setLayout:", v45);
  -[STUIStatusBarRegion setActionInsets:](v44, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[STUIStatusBarRegion layoutItem](v44, "layoutItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, v8);
  v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingTopConstraint = self->_trailingTopConstraint;
  self->_trailingTopConstraint = v52;

  v54 = v6;
  objc_msgSend(v6, "addObject:", self->_trailingTopConstraint);
  objc_msgSend(v49, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v43;
  objc_msgSend(v43, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -v13;
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v54;
  objc_msgSend(v54, "addObject:", v59);

  v200 = v49;
  objc_msgSend(v49, "heightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToConstant:", v22);
  v61 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingHeightConstraint = self->_trailingHeightConstraint;
  self->_trailingHeightConstraint = v61;

  objc_msgSend(v54, "addObject:", self->_trailingHeightConstraint);
  objc_msgSend(v56, "_ui_addSubLayoutItem:", v49);

  objc_msgSend(v202, "addObject:", v44);
  v63 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("center"));
  v64 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v65 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setInterspace:](v65, "setInterspace:", v15);
  centerHorizontalLayout = self->_centerHorizontalLayout;
  self->_centerHorizontalLayout = v65;

  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v64, "setHorizontalLayout:", self->_centerHorizontalLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v64, "setVerticalLayout:", v67);

  -[STUIStatusBarRegion setLayout:](v63, "setLayout:", v64);
  -[STUIStatusBarRegion layoutItem](v63, "layoutItem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "centerXAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v71);

  objc_msgSend(v68, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToConstant:", 0.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v74) = 1132068864;
  objc_msgSend(v73, "_ui_constraintWithPriority:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v75);

  objc_msgSend(v68, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, v8);
  v78 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  centerTopConstraint = self->_centerTopConstraint;
  self->_centerTopConstraint = v78;

  objc_msgSend(v54, "addObject:", self->_centerTopConstraint);
  objc_msgSend(v68, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToConstant:", v22);
  v81 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  centerHeightConstraint = self->_centerHeightConstraint;
  self->_centerHeightConstraint = v81;

  objc_msgSend(v54, "addObject:", self->_centerHeightConstraint);
  objc_msgSend(v68, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, v19);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v85);

  objc_msgSend(v200, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = v68;
  objc_msgSend(v68, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v87, v19);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v88);

  objc_msgSend(v56, "_ui_addSubLayoutItem:", v68);
  objc_msgSend(v202, "addObject:", v63);

  v89 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("background"));
  v90 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v90, "setHorizontalLayout:", v91);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v90, "setVerticalLayout:", v92);

  -[STUIStatusBarRegion setLayout:](v89, "setLayout:", v90);
  -[STUIStatusBarRegion layoutItem](v89, "layoutItem");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v96);

  objc_msgSend(v93, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v99);

  objc_msgSend(v93, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v102);

  objc_msgSend(v93, "heightAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "height");
  objc_msgSend(v103, "constraintEqualToConstant:");
  v104 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  backgroundHeightConstraint = self->_backgroundHeightConstraint;
  self->_backgroundHeightConstraint = v104;

  objc_msgSend(v54, "addObject:", self->_backgroundHeightConstraint);
  objc_msgSend(v56, "_ui_addSubLayoutItem:", v93);

  objc_msgSend(v202, "addObject:", v89);
  -[STUIStatusBarVisualProvider_LegacyPhone lowerExpandedBaselineOffset](self, "lowerExpandedBaselineOffset");
  v107 = v106;
  v108 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLeading"));
  v109 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v110 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v110, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v110, "setInterspace:", v17);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v109, "setHorizontalLayout:", v110);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v109, "setVerticalLayout:", v111);

  -[STUIStatusBarRegion setLayout:](v108, "setLayout:", v109);
  -[STUIStatusBarRegion setActionInsets:](v108, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[STUIStatusBarRegion disableWithToken:](v108, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v108, "layoutItem");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "bottomAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:constant:", v114, v194);
  v115 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedLeadingBottomConstraint = self->_expandedLeadingBottomConstraint;
  self->_expandedLeadingBottomConstraint = v115;

  -[NSLayoutConstraint setIdentifier:](self->_expandedLeadingBottomConstraint, "setIdentifier:", CFSTR("UISB-expanded-leading-bottom"));
  objc_msgSend(v54, "addObject:", self->_expandedLeadingBottomConstraint);
  objc_msgSend(v112, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:constant:", v118, v11);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v119);

  objc_msgSend(v112, "heightAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToConstant:", v25);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v121);

  objc_msgSend(v56, "_ui_addSubLayoutItem:", v112);
  objc_msgSend(v202, "addObject:", v108);

  v122 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedTrailing"));
  v123 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v124 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v124, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v124, "setInterspace:", v17);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v123, "setHorizontalLayout:", v124);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v123, "setVerticalLayout:", v125);

  -[STUIStatusBarRegion setLayout:](v122, "setLayout:", v123);
  -[STUIStatusBarRegion setActionInsets:](v122, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[STUIStatusBarRegion disableWithToken:](v122, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v122, "layoutItem");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "bottomAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:constant:", v128, v194);
  v129 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v129;

  -[NSLayoutConstraint setIdentifier:](self->_expandedTrailingBottomConstraint, "setIdentifier:", CFSTR("UISB-expanded-trailing-bottom"));
  objc_msgSend(v54, "addObject:", self->_expandedTrailingBottomConstraint);
  objc_msgSend(v126, "trailingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:constant:", v132, v58);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v133);

  objc_msgSend(v126, "heightAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToConstant:", v25);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v135);

  objc_msgSend(v126, "leadingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = v112;
  objc_msgSend(v112, "trailingAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v137, v17);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v138);

  v198 = v126;
  objc_msgSend(v126, "widthAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "widthAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "constraintEqualToAnchor:", v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v142) = 1131741184;
  objc_msgSend(v141, "_ui_constraintWithPriority:", v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v143);

  objc_msgSend(v56, "_ui_addSubLayoutItem:", v126);
  objc_msgSend(v202, "addObject:", v122);

  v144 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerLeading"));
  v145 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v146 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v146, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v146, "setInterspace:", v17);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v145, "setHorizontalLayout:", v146);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v145, "setVerticalLayout:", v147);

  -[STUIStatusBarRegion setLayout:](v144, "setLayout:", v145);
  -[STUIStatusBarRegion disableWithToken:](v144, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v144, "layoutItem");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "bottomAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "bottomAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:constant:", v150, v107);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v151);

  objc_msgSend(v148, "leadingAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "constraintEqualToAnchor:constant:", v153, v11);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v154);

  objc_msgSend(v148, "heightAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToConstant:", v25);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v156);

  objc_msgSend(v56, "_ui_addSubLayoutItem:", v148);
  objc_msgSend(v202, "addObject:", v144);

  v157 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerTrailing"));
  v158 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v159 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v159, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v159, "setInterspace:", v17);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v158, "setHorizontalLayout:", v159);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v158, "setVerticalLayout:", v160);

  -[STUIStatusBarRegion setLayout:](v157, "setLayout:", v158);
  -[STUIStatusBarRegion disableWithToken:](v157, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v157, "layoutItem");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "bottomAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "bottomAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:constant:", v163, v107);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v164);

  -[STUIStatusBarRegion layoutItem](v157, "layoutItem");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "trailingAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToAnchor:constant:", v167, v58);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v168);

  -[STUIStatusBarRegion layoutItem](v157, "layoutItem");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "heightAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "constraintEqualToConstant:", v25);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v171);

  -[STUIStatusBarRegion layoutItem](v157, "layoutItem");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "leadingAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = v148;
  objc_msgSend(v148, "trailingAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "constraintEqualToAnchor:constant:", v174, v17);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v175);

  -[STUIStatusBarRegion layoutItem](v157, "layoutItem");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "widthAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "widthAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "constraintEqualToAnchor:", v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v180) = 1131741184;
  objc_msgSend(v179, "_ui_constraintWithPriority:", v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v181);

  -[STUIStatusBarRegion layoutItem](v157, "layoutItem");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "_ui_addSubLayoutItem:", v182);

  objc_msgSend(v202, "addObject:", v157);
  STUIStatusBarAddLumaView(v56, v54, v201, 1, v197);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_LegacyPhone setLeadingBackgroundLumaView:](self, "setLeadingBackgroundLumaView:", v183);

  STUIStatusBarAddLumaView(v56, v54, v196, 0, v197);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_LegacyPhone setCenterBackgroundLumaView:](self, "setCenterBackgroundLumaView:", v184);

  STUIStatusBarAddLumaView(v56, v54, v200, 2, v197);
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_LegacyPhone setTrailingBackgroundLumaView:](self, "setTrailingBackgroundLumaView:", v185);
  v186 = objc_alloc(MEMORY[0x1E0DC4288]);
  -[STUIStatusBarVisualProvider_LegacyPhone leadingBackgroundLumaView](self, "leadingBackgroundLumaView");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v203[0] = v187;
  -[STUIStatusBarVisualProvider_LegacyPhone centerBackgroundLumaView](self, "centerBackgroundLumaView");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v203[1] = v188;
  -[STUIStatusBarVisualProvider_LegacyPhone trailingBackgroundLumaView](self, "trailingBackgroundLumaView");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v203[2] = v189;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 3);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = (void *)objc_msgSend(v186, "initWithTransitionBoundaries:minimumDifference:delegate:views:", self, v190, 0.4, 0.7, 0.5);
  -[STUIStatusBarVisualProvider_iOS setLumaTrackingGroup:](self, "setLumaTrackingGroup:", v191);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v193);
  return v202;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  NSDictionary *orderedDisplayItemPlacements;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
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
  char v88;
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
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  STUIStatusBarDisplayItemPlacementGroup *lowerWifiGroup;
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
  uint64_t v138;
  NSDictionary *v139;
  void *v140;
  uint64_t v142;
  uint64_t v143;
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
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  STUIStatusBarVisualProvider_LegacyPhone *v175;
  void *v176;
  void *v177;
  void *v178;
  _QWORD v179[8];
  _QWORD v180[8];
  void *v181;
  _QWORD v182[3];
  _QWORD v183[12];
  _QWORD v184[2];
  _QWORD v185[5];
  void *v186;
  _QWORD v187[3];
  _QWORD v188[2];
  _QWORD v189[14];
  _QWORD v190[2];
  uint64_t v191;
  _QWORD v192[5];

  v192[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    v167 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    LOBYTE(v142) = 1;
    +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:](STUIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:", 1300, 1000, v7, v8, objc_opt_class(), 1, v142);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellularGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "namePlacement");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "cellularGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dualNamePlacement");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "cellularGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dualNameAndTypePlacement");
    v15 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarNavigationItem, "defaultDisplayIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v16, objc_msgSend(v9, "maximumPriority") + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = (void *)v13;
    v166 = (void *)v11;
    v192[0] = v11;
    v192[1] = v13;
    v164 = (void *)v15;
    v192[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "excludingPlacements:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[STUIStatusBarVisualProvider_iOS hasCellularCapability](self, "hasCellularCapability"))
    {
      objc_msgSend(v6, "addObject:", v19);
      v20 = 0;
      v21 = 1;
    }
    else
    {
      +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarDeviceNameItem, "defaultDisplayIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v22, 30);
      v20 = objc_claimAutoreleasedReturnValue();

      v191 = v20;
      v21 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "excludingPlacements:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "addObject:", v24);
      if (v20)
      {
        objc_msgSend(v6, "addObject:", v20);
        v21 = 0;
      }
      v19 = (void *)v24;
    }
    v163 = v19;
    v175 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellularGroup");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "placementsAffectedByAirplaneMode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v27);

    if ((v21 & 1) == 0)
      objc_msgSend(v25, "addObject:", v20);
    v162 = (void *)v20;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v28, 1400);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v25;
    objc_msgSend(v29, "excludingPlacements:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v6;
    objc_msgSend(v6, "addObject:", v30);

    v31 = objc_msgSend(v9, "minimumPriority");
    +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", v31 - 5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellularGroup");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "typePlacement");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = v34;
    objc_msgSend(v9, "cellularGroup");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "namePlacement");
    v36 = v9;
    v174 = v9;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v190[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "requiringAllPlacements:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "placements");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "arrayByAddingObject:", v39);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v189[0] = v172;
    +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v189[1] = v170;
    +[STUIStatusBarCellularItem warningDisplayIdentifier](STUIStatusBarCellularCondensedItem, "warningDisplayIdentifier");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v189[2] = v168;
    +[STUIStatusBarCellularItem rawDisplayIdentifier](STUIStatusBarCellularCondensedItem, "rawDisplayIdentifier");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v189[3] = v158;
    +[STUIStatusBarCellularItem nameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "nameDisplayIdentifier");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v189[4] = v156;
    +[STUIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSingleLineNameDisplayIdentifier");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v189[5] = v153;
    +[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSingleLineNameAndTypeDisplayIdentifier");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v189[6] = v151;
    v160 = v39;
    objc_msgSend(v39, "identifier");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v189[7] = v149;
    +[STUIStatusBarCellularItem typeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "typeDisplayIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v189[8] = v40;
    +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier](STUIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v189[9] = v41;
    +[STUIStatusBarWifiItem iconDisplayIdentifier](STUIStatusBarWifiItem, "iconDisplayIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v189[10] = v42;
    +[STUIStatusBarWifiItem rawDisplayIdentifier](STUIStatusBarWifiItem, "rawDisplayIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v189[11] = v43;
    +[STUIStatusBarCellularItem callForwardingDisplayIdentifier](STUIStatusBarCellularCondensedItem, "callForwardingDisplayIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v189[12] = v44;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVPNItem, "defaultDisplayIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v189[13] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 14);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    _reorderedPlacementsFromGroupForLegacyLayout(v147, 0, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "addObjectsFromArray:", v47);

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarActivityItem_SyncOnly, "defaultDisplayIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v48, objc_msgSend(v174, "minimumPriority") - 10);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "addObject:", v49);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarLockItem, "defaultDisplayIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v50, 3000);
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarLockItem textDisplayIdentifier](STUIStatusBarLockItem, "textDisplayIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v51, 2999);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "cellularGroup");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "dualNamePlacement");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v188[0] = v54;
    objc_msgSend(v174, "cellularGroup");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dualNameAndTypePlacement");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v188[1] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "excludingPlacements:", v57);
    v58 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v59, 3002);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v187[0] = v58;
    objc_msgSend(v174, "cellularGroup");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dualNamePlacement");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v187[1] = v62;
    objc_msgSend(v174, "cellularGroup");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "dualNameAndTypePlacement");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v187[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 3);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "excludingPlacements:", v65);
    v171 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = v177;
    objc_msgSend(v177, "addObject:", v173);
    v159 = (void *)v58;
    objc_msgSend(v177, "addObject:", v58);
    +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "visualProviderSettings");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v61) = objc_msgSend(v68, "fullWidthBackgroundActivity");

    if ((_DWORD)v61)
    {
      +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v69, 1950);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v71, 1949);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = v70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v186, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "requiringAllPlacements:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      +[STUIStatusBarFullBackgroundActivityItem detailDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "detailDisplayIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v75, 5000);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v185[0] = CFSTR("leading");
      v185[1] = CFSTR("center");
      v185[2] = CFSTR("trailing");
      v185[3] = CFSTR("expandedLeading");
      v185[4] = CFSTR("expandedTrailing");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v185, 5);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v184[0] = v70;
      v184[1] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "excludingAllPlacementsInRegions:exceptPlacements:", v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = v177;
      -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](v175, "pillRegionCoordinator");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setBackgroundActivityDetailPlacement:", v79);

      objc_msgSend(v177, "addObject:", v70);
      objc_msgSend(v177, "addObject:", v74);
      objc_msgSend(v177, "addObject:", v79);

    }
    objc_msgSend(v66, "addObject:", v171);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v82, 1960);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObject:", v83);

    +[STUIStatusBarIndicatorLocationItem groupWithPriority:](STUIStatusBarIndicatorLocationItem, "groupWithPriority:", 1955);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "placements");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObjectsFromArray:", v85);

    +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "visualProviderSettings");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "fullWidthBackgroundActivity");

    if ((v88 & 1) == 0)
    {
      +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v89, 1950);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "addObject:", v90);
    }
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v91, 1940);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObject:", v92);

    -[STUIStatusBarVisualProvider_iOS bluetoothPaddingInset](v175, "bluetoothPaddingInset");
    +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 800, 500);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](STUIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", objc_msgSend(v93, "maximumPriority") + 1, objc_msgSend(v93, "minimumPriority") - 5);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "placements");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarBluetoothItem batteryDisplayIdentifier](STUIStatusBarBluetoothItem, "batteryDisplayIdentifier");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = v93;
    v183[0] = v154;
    objc_msgSend(v93, "bluetoothInsetPaddingItem");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "identifier");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v183[1] = v150;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarBluetoothItem, "defaultDisplayIdentifier");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v183[2] = v148;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirPlayItem, "defaultDisplayIdentifier");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v183[3] = v146;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorTTYItem, "defaultDisplayIdentifier");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v183[4] = v145;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAlarmItem, "defaultDisplayIdentifier");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v183[5] = v94;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorStudentItem, "defaultDisplayIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v183[6] = v95;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorRotationLockItem, "defaultDisplayIdentifier");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v183[7] = v96;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAssistantItem, "defaultDisplayIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v183[8] = v97;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeItem, "defaultDisplayIdentifier");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v183[9] = v98;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorCarPlayItem, "defaultDisplayIdentifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v183[10] = v99;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorSatelliteItem, "defaultDisplayIdentifier");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v183[11] = v100;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 12);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    _reorderedPlacementsFromGroupForLegacyLayout(v144, 1, v101);
    v102 = v81;
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObjectsFromArray:", v103);

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarBuildVersionItem, "defaultDisplayIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v104, 2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v105);

    objc_msgSend(v169, "placements");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLiquidDetectionItem, "defaultDisplayIdentifier");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v182[0] = v107;
    +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v182[1] = v108;
    +[STUIStatusBarBatteryItem percentDisplayIdentifier](STUIStatusBarBatteryItem, "percentDisplayIdentifier");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v182[2] = v109;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v182, 3);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    _reorderedPlacementsFromGroupForLegacyLayout(v106, 1, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v102;
    objc_msgSend(v102, "addObjectsFromArray:", v111);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_opt_class();
    v114 = objc_opt_class();
    LOBYTE(v143) = 0;
    +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:](STUIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:", 2500, 2200, v113, v114, objc_opt_class(), 1, v143);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "wifiGroup");
    v116 = objc_claimAutoreleasedReturnValue();
    lowerWifiGroup = v175->_lowerWifiGroup;
    v175->_lowerWifiGroup = (STUIStatusBarDisplayItemPlacementGroup *)v116;

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v118, 5000);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_iOS expandedCellularPlacementsAffectedByAirplaneMode](v175, "expandedCellularPlacementsAffectedByAirplaneMode");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "cellularGroup");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "placementsAffectedByAirplaneMode");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "arrayByAddingObjectsFromArray:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "excludingPlacements:", v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "addObject:", v124);

    objc_msgSend(v115, "placements");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "addObjectsFromArray:", v125);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v127, 1450);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "addObject:", v128);

    -[STUIStatusBarVisualProvider_iOS bluetoothPaddingInset](v175, "bluetoothPaddingInset");
    +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 1400, 1000);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "placements");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "addObjectsFromArray:", v130);

    +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "visualProviderSettings");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v121) = objc_msgSend(v132, "fullWidthBackgroundActivity");

    if ((_DWORD)v121)
    {
      +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "backgroundDisplayIdentifier");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v133, 2000);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = v134;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v181, 1);
      v135 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v135 = (void *)MEMORY[0x1E0C9AA60];
    }
    v179[0] = CFSTR("leading");
    v179[1] = CFSTR("trailing");
    v180[0] = v178;
    v180[1] = v155;
    v179[2] = CFSTR("center");
    v179[3] = CFSTR("background");
    v180[2] = v177;
    v180[3] = v135;
    v179[4] = CFSTR("expandedLeading");
    -[STUIStatusBarVisualProvider_iOS expandedLeadingPlacements](v175, "expandedLeadingPlacements");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v180[4] = v136;
    v180[5] = v112;
    v179[5] = CFSTR("expandedLowerLeading");
    v179[6] = CFSTR("expandedTrailing");
    -[STUIStatusBarVisualProvider_iOS expandedTrailingPlacements](v175, "expandedTrailingPlacements");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v179[7] = CFSTR("expandedLowerTrailing");
    v180[6] = v137;
    v180[7] = v126;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, v179, 8);
    v138 = objc_claimAutoreleasedReturnValue();
    v139 = v175->_orderedDisplayItemPlacements;
    v175->_orderedDisplayItemPlacements = (NSDictionary *)v138;

    orderedDisplayItemPlacements = v175->_orderedDisplayItemPlacements;
    v4 = v167;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  return v140;
}

- (void)itemCreated:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v12;
    objc_opt_class();
    objc_msgSend(v5, "setMarqueeServiceName:", objc_opt_isKindOfClass() & 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "setMarqueeServiceName:", 1);
    }
    else if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v5, "setShowsDisabledSignalBars:", 0);
      objc_msgSend(v5, "setMarqueeServiceName:", -[STUIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen"));
      objc_storeStrong((id *)&self->_condensedCellularItem, a3);
    }
    objc_msgSend(v5, "setTypeStringProvider:", self);

    goto LABEL_11;
  }
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem identifier](STUIStatusBarVoiceControlPillItem, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v11 = v12;
    -[STUIStatusBarVisualProvider_LegacyPhone smallPillSize](self, "smallPillSize");
    objc_msgSend(v11, "setPillSize:");

    goto LABEL_11;
  }
  objc_msgSend(v12, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem identifier](STUIStatusBarIndicatorLiquidDetectionItem, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v8 == v9)
  {
    objc_msgSend(v12, "setUseFullColorIndicator:", 1);
LABEL_11:
    v10 = v12;
  }

}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  void *v4;
  void *v5;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GPRS"), &stru_1E8D64C18, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v15;
  double v16;
  void *v17;

  v6 = a4;
  v7 = v6;
  v8 = v6;
  if ((unint64_t)a3 <= 0xD)
  {
    if (((1 << a3) & 0x38C0) != 0)
    {
      objc_msgSend(v6, "fontDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 64);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0DC1350];
      v12 = 0.0;
      v13 = v10;
    }
    else
    {
      v8 = v6;
      if (a3 != 2)
        goto LABEL_5;
      objc_msgSend(v6, "pointSize");
      v16 = v15 * 0.7;
      v17 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(v7, "fontDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      v13 = v10;
      v12 = v16;
    }
    objc_msgSend(v11, "fontWithDescriptor:size:", v13, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_5:

  return v8;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  return 1.0;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  STUIStatusBarRoundedCornerView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[4];
  BOOL v23;
  _QWORD v24[2];

  v5 = a5;
  v6 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v9 = v8;
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v21.receiver = self;
    v21.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    -[STUIStatusBarVisualProvider_Phone actionable:highlighted:initialPress:](&v21, sel_actionable_highlighted_initialPress_, v8, v6, v5);
    goto LABEL_8;
  }
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 != (void *)v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v10, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "backgroundDisplayIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
      goto LABEL_10;
    goto LABEL_7;
  }

LABEL_10:
  objc_msgSend(v10, "highlightView");
  v16 = (STUIStatusBarRoundedCornerView *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = objc_alloc_init(STUIStatusBarRoundedCornerView);
    -[STUIStatusBarRoundedCornerView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "backgroundDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v18)
      -[STUIStatusBarRoundedCornerView setCornerRadius:](v16, "setCornerRadius:", 0.0);
    objc_msgSend(v10, "setHighlightView:", v16);
  }
  v19 = (void *)MEMORY[0x1E0DC3518];
  v24[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__STUIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke;
  v22[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v23 = v6;
  objc_msgSend(v19, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v6, v20, v5, v22);

LABEL_8:
}

- (id)willUpdateWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  v4 = a3;
  -[STUIStatusBarVisualProvider_Phone willUpdateWithData:](&v15, sel_willUpdateWithData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundActivityEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v7) = objc_msgSend(v6, "isEnabled");
    if ((_DWORD)v7 != objc_msgSend(v9, "isEnabled"))
    {
      if (objc_msgSend(v6, "isEnabled"))
      {
        if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
          v10 = 4;
        else
          v10 = 1;
      }
      else
      {
        v10 = 4;
      }
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "regions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __62__STUIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke;
      v14[3] = &__block_descriptor_40_e46_v32__0__NSString_8__STUIStatusBarRegion_16_B24l;
      v14[4] = v10;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);

    }
  }

  return v5;
}

- (id)_animationForSingleLineDualCarrier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPriority:", 10);
  +[STUIStatusBarWifiItem iconDisplayIdentifier](STUIStatusBarWifiItem, "iconDisplayIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v4);

  +[STUIStatusBarWifiItem rawDisplayIdentifier](STUIStatusBarWifiItem, "rawDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v5);

  +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier](STUIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v6);

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVPNItem, "defaultDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v7);

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarActivityItem_SyncOnly, "defaultDisplayIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v8);

  return v2;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarFullBackgroundActivityItem detailDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "detailDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    +[STUIStatusBarAnimationFactory noAnimation](STUIStatusBarAnimationFactory, "noAnimation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v13, v14);

    +[STUIStatusBarAnimationFactory noAnimation](STUIStatusBarAnimationFactory, "noAnimation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v15, v16);

    +[STUIStatusBarAnimationFactory noAnimation](STUIStatusBarAnimationFactory, "noAnimation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v17, v18);

    v12 = v7;
    goto LABEL_8;
  }
  +[STUIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSingleLineNameDisplayIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v6)
  {

    goto LABEL_7;
  }
  v10 = (void *)v9;
  +[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSingleLineNameAndTypeDisplayIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v6)
  {
LABEL_7:
    -[STUIStatusBarVisualProvider_LegacyPhone _animationForSingleLineDualCarrier](self, "_animationForSingleLineDualCarrier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v21.receiver = self;
  v21.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  -[STUIStatusBarVisualProvider_Phone additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v21, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v19 = v12;

  return v19;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarFullBackgroundActivityItem detailDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "detailDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[STUIStatusBarVisualProvider_LegacyPhone _backgroundActivityDetailRemovalAnimation](self, "_backgroundActivityDetailRemovalAnimation");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  +[STUIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSingleLineNameDisplayIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v6)
  {

    goto LABEL_7;
  }
  v10 = (void *)v9;
  +[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSingleLineNameAndTypeDisplayIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v6)
  {
LABEL_7:
    -[STUIStatusBarVisualProvider_LegacyPhone _animationForSingleLineDualCarrier](self, "_animationForSingleLineDualCarrier");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  -[STUIStatusBarVisualProvider_Phone removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v15, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = (void *)v12;

  return v13;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((id)v4 == v3)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v3)
  {
LABEL_5:
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIconScale:", 0.75);
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", CFSTR("leadingPartIdentifier")))
  {
    if (objc_msgSend(v4, "isEqual:", CFSTR("trailingPartIdentifier")))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("trailing"), CFSTR("expandedTrailing"), CFSTR("expandedLowerTrailing"), 0, v21);
      goto LABEL_15;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("centerPartIdentifier")))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("center"), CFSTR("background"), 0, v19, v21);
      goto LABEL_15;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("normalPartIdentifier")))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v20 = CFSTR("trailing");
      v21 = 0;
      v6 = CFSTR("background");
      v7 = CFSTR("center");
      goto LABEL_3;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("expandedPartIdentifier")))
      goto LABEL_11;
    if (!objc_msgSend(v4, "isEqual:", CFSTR("expandedPartTopIdentifier")))
    {
      if (objc_msgSend(v4, "isEqual:", CFSTR("expandedBottomPartIdentifier")))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("expandedLowerLeading"), CFSTR("expandedLowerTrailing"), 0, v19, v21);
        goto LABEL_15;
      }
      if (!objc_msgSend(v4, "isEqual:", CFSTR("visibleExpandedPartIdentifier")))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "secondaryCellularEntry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEnabled") & 1) != 0)
      {
        -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "orientation") - 1;

        if (v16 <= 1)
        {
LABEL_11:
          v8 = (void *)MEMORY[0x1E0C99E60];
          v19 = CFSTR("expandedLowerTrailing");
          v21 = 0;
          v17 = CFSTR("expandedLowerLeading");
          v18 = CFSTR("expandedTrailing");
LABEL_14:
          objc_msgSend(v8, "setWithObjects:", CFSTR("expandedLeading"), v17, v18, v19, v21);
          goto LABEL_15;
        }
      }
      else
      {

      }
    }
    v8 = (void *)MEMORY[0x1E0C99E60];
    v17 = CFSTR("expandedTrailing");
    v18 = 0;
    goto LABEL_14;
  }
  v5 = (void *)MEMORY[0x1E0C99E60];
  v20 = 0;
  v6 = CFSTR("expandedLowerLeading");
  v7 = CFSTR("expandedLeading");
LABEL_3:
  objc_msgSend(v5, "setWithObjects:", CFSTR("leading"), v7, v6, v20, v21);
LABEL_15:
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v10 = (void *)v9;

  return v10;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  -[STUIStatusBarVisualProvider_iOS styleAttributesForStyle:](&v19, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  if ((unint64_t)(v5 - 1) < 3)
  {
    objc_msgSend(v4, "setIconScale:", 1.07);
    objc_msgSend(v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    if (v7 <= 2.5)
      v8 = 5;
    else
      v8 = 2;
    objc_msgSend(v4, "setIconSize:", v8);

    -[STUIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v9);

    objc_msgSend(v4, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSmallFont:", v10);

    -[STUIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = (void *)v11;
    objc_msgSend(v4, "setEmphasizedFont:", v11);

    goto LABEL_12;
  }
  if (!v5)
  {
    objc_msgSend(v4, "setIconScale:", 1.0);
    objc_msgSend(v4, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    if (v13 <= 2.5)
      v14 = 1;
    else
      v14 = 2;
    objc_msgSend(v4, "setIconSize:", v14);

    -[STUIStatusBarVisualProvider_LegacyPhone normalFont](self, "normalFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v15);

    objc_msgSend(v4, "font");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSmallFont:", v16);

    -[STUIStatusBarVisualProvider_LegacyPhone timeFont](self, "timeFont");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v4, "setImageNamePrefixes:", &unk_1E8D80120);
  return v4;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("clockPartIdentifier")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    -[STUIStatusBarVisualProvider_iOS displayItemIdentifiersForPartWithIdentifier:](&v9, sel_displayItemIdentifiersForPartWithIdentifier_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
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

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAggregatedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_LegacyPhone _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

}

- (void)_updateLowerRegionsWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  objc_msgSend(v4, "secondaryCellularEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isEnabled"))
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (unint64_t)(objc_msgSend(v7, "orientation") - 1) < 2;

    }
    else
    {
      v8 = 0;
    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[STUIStatusBarVisualProvider_LegacyPhone regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", CFSTR("expandedBottomPartIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__STUIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke;
    v11[3] = &unk_1E8D62A80;
    v12 = v8;
    v11[4] = self;
    v11[5] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

    -[STUIStatusBarVisualProvider_LegacyPhone _updateBackgroundHeight](self, "_updateBackgroundHeight");
    if (v8)
      -[STUIStatusBarVisualProvider_LegacyPhone dualLineExpandedBaselineOffset](self, "dualLineExpandedBaselineOffset");
    else
      -[STUIStatusBarVisualProvider_LegacyPhone expandedBaselineOffset](self, "expandedBaselineOffset");
    -[NSLayoutConstraint setConstant:](self->_expandedLeadingBottomConstraint, "setConstant:");
    if (*((_BYTE *)v14 + 24))
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

    }
    _Block_object_dispose(&v13, 8);
  }

}

- (void)_updateExpandedTrailingRegion
{
  void *v3;
  _QWORD v4[5];

  if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    v3 = (void *)*MEMORY[0x1E0DC4730];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke;
    v4[3] = &unk_1E8D62A38;
    v4[4] = self;
    objc_msgSend(v3, "_performBlockAfterCATransactionCommits:", v4);
  }
}

- (void)updateDataForService:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  v4 = a3;
  -[STUIStatusBarVisualProvider_iOS updateDataForService:](&v6, sel_updateDataForService_, v4);
  objc_msgSend(v4, "secondaryCellularEntry", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[STUIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", objc_msgSend(v5, "type") != 0);

}

- (void)_updateBackgroundHeight
{
  -[STUIStatusBarVisualProvider_LegacyPhone effectiveHeight](self, "effectiveHeight");
  -[NSLayoutConstraint setConstant:](self->_backgroundHeightConstraint, "setConstant:");
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];

  v3 = a3;
  if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded") != a3)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentAggregatedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundActivityEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEnabled");

    if (v8)
    {
      if (v3)
        v9 = 4;
      else
        v9 = 1;
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "regions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55__STUIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke;
      v13[3] = &__block_descriptor_40_e46_v32__0__NSString_8__STUIStatusBarRegion_16_B24l;
      v13[4] = v9;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

    }
    v12.receiver = self;
    v12.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    -[STUIStatusBarVisualProvider_iOS setExpanded:](&v12, sel_setExpanded_, v3);
    -[STUIStatusBarVisualProvider_LegacyPhone _updateBackgroundHeight](self, "_updateBackgroundHeight");
  }
}

- (void)_updateLockScreenSizing
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v3 = -[STUIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen");
  if (v3)
  {
    -[STUIStatusBarVisualProvider_LegacyPhone expandedBaselineOffset](self, "expandedBaselineOffset");
    v5 = v4;
    -[STUIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
    v7 = v6;
    -[STUIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
  }
  else
  {
    -[STUIStatusBarVisualProvider_LegacyPhone baselineOffset](self, "baselineOffset");
    v5 = v8;
    -[STUIStatusBarVisualProvider_iOS itemSpacing](self, "itemSpacing");
    v7 = v9;
    -[STUIStatusBarVisualProvider_LegacyPhone normalFont](self, "normalFont");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "capHeight");
  v12 = v11;

  v13 = v12 + 1.0;
  -[STUIStatusBarCellularItem setMarqueeServiceName:](self->_condensedCellularItem, "setMarqueeServiceName:", v3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](self->_leadingHorizontalLayout, "setInterspace:", v7);
  -[STUIStatusBarRegionAxisCenteringLayout setInterspace:](self->_centerHorizontalLayout, "setInterspace:", v7);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](self->_trailingHorizontalLayout, "setInterspace:", v7);
  -[NSLayoutConstraint setConstant:](self->_leadingTopConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_centerTopConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_trailingTopConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_leadingHeightConstraint, "setConstant:", v13);
  -[NSLayoutConstraint setConstant:](self->_centerHeightConstraint, "setConstant:", v13);
  -[NSLayoutConstraint setConstant:](self->_trailingHeightConstraint, "setConstant:", v13);
}

- (void)setOnLockScreen:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[STUIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    -[STUIStatusBarVisualProvider_iOS setOnLockScreen:](&v5, sel_setOnLockScreen_, v3);
    -[STUIStatusBarVisualProvider_LegacyPhone _updateLockScreenSizing](self, "_updateLockScreenSizing");
    -[STUIStatusBarVisualProvider_LegacyPhone _updateBackgroundHeight](self, "_updateBackgroundHeight");
  }
}

- (id)_backgroundActivityDetailRemovalAnimation
{
  __int128 v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[10];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[9];
  _QWORD v24[6];
  _QWORD v25[4];
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  __int128 v35;
  __int128 v36;

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x4010000000;
  v34[3] = "";
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v35 = *MEMORY[0x1E0C9D628];
  v36 = v2;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x4010000000;
  v31[3] = "";
  v32 = v35;
  v33 = v2;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x4010000000;
  v28[3] = "";
  v29 = v35;
  v30 = v2;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x4010000000;
  v25[3] = "";
  v26 = v35;
  v27 = v2;
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke;
  v24[3] = &unk_1E8D62AA8;
  v24[4] = v34;
  v24[5] = v25;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4;
  v23[3] = &unk_1E8D62AD0;
  v23[5] = v5;
  v23[6] = v7;
  v23[7] = v9;
  v23[8] = v11;
  v23[4] = v34;
  objc_msgSend(v13, "setPrepareBlock:", v23);
  objc_msgSend(v13, "setPriority:", 100);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5;
  v22[3] = &unk_1E8D62AA8;
  v22[4] = v25;
  v22[5] = v34;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPriority:", 200);
  +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubAnimation:forDisplayItemWithIdentifier:", v14, v15);

  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9;
  v21[3] = &unk_1E8D62AA8;
  v21[4] = v28;
  v21[5] = v31;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12;
  v20[3] = &unk_1E8D62B20;
  v20[6] = v5;
  v20[7] = v7;
  v20[8] = v9;
  v20[9] = v11;
  v20[4] = v28;
  v20[5] = v31;
  objc_msgSend(v16, "setPrepareBlock:", v20);
  objc_msgSend(v16, "setPriority:", 50);
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubAnimation:forDisplayItemWithIdentifier:", v16, v17);

  +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubAnimation:forDisplayItemWithIdentifier:", v16, v18);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v34, 8);
  return v13;
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
  -[STUIStatusBarVisualProvider_LegacyPhone leadingBackgroundLumaView](self, "leadingBackgroundLumaView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("leading"), 0);
LABEL_8:
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[STUIStatusBarVisualProvider_LegacyPhone trailingBackgroundLumaView](self, "trailingBackgroundLumaView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("trailing"), 0);
    goto LABEL_8;
  }
  -[STUIStatusBarVisualProvider_LegacyPhone centerBackgroundLumaView](self, "centerBackgroundLumaView");
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

- (STUIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
{
  return self->_lowerWifiGroup;
}

- (void)setLowerWifiGroup:(id)a3
{
  objc_storeStrong((id *)&self->_lowerWifiGroup, a3);
}

- (NSLayoutConstraint)backgroundHeightConstraint
{
  return self->_backgroundHeightConstraint;
}

- (void)setBackgroundHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, a3);
}

- (STUIStatusBarCellularItem)condensedCellularItem
{
  return self->_condensedCellularItem;
}

- (void)setCondensedCellularItem:(id)a3
{
  objc_storeStrong((id *)&self->_condensedCellularItem, a3);
}

- (NSLayoutConstraint)leadingTopConstraint
{
  return self->_leadingTopConstraint;
}

- (void)setLeadingTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTopConstraint, a3);
}

- (NSLayoutConstraint)leadingHeightConstraint
{
  return self->_leadingHeightConstraint;
}

- (void)setLeadingHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingHeightConstraint, a3);
}

- (STUIStatusBarRegionAxisStackingLayout)leadingHorizontalLayout
{
  return self->_leadingHorizontalLayout;
}

- (void)setLeadingHorizontalLayout:(id)a3
{
  objc_storeStrong((id *)&self->_leadingHorizontalLayout, a3);
}

- (NSLayoutConstraint)centerTopConstraint
{
  return self->_centerTopConstraint;
}

- (void)setCenterTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerTopConstraint, a3);
}

- (NSLayoutConstraint)centerHeightConstraint
{
  return self->_centerHeightConstraint;
}

- (void)setCenterHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerHeightConstraint, a3);
}

- (STUIStatusBarRegionAxisCenteringLayout)centerHorizontalLayout
{
  return self->_centerHorizontalLayout;
}

- (void)setCenterHorizontalLayout:(id)a3
{
  objc_storeStrong((id *)&self->_centerHorizontalLayout, a3);
}

- (NSLayoutConstraint)trailingTopConstraint
{
  return self->_trailingTopConstraint;
}

- (void)setTrailingTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTopConstraint, a3);
}

- (NSLayoutConstraint)trailingHeightConstraint
{
  return self->_trailingHeightConstraint;
}

- (void)setTrailingHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingHeightConstraint, a3);
}

- (STUIStatusBarRegionAxisStackingLayout)trailingHorizontalLayout
{
  return self->_trailingHorizontalLayout;
}

- (void)setTrailingHorizontalLayout:(id)a3
{
  objc_storeStrong((id *)&self->_trailingHorizontalLayout, a3);
}

- (NSLayoutConstraint)expandedLeadingBottomConstraint
{
  return self->_expandedLeadingBottomConstraint;
}

- (void)setExpandedLeadingBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_expandedLeadingBottomConstraint, a3);
}

- (NSLayoutConstraint)expandedTrailingBottomConstraint
{
  return self->_expandedTrailingBottomConstraint;
}

- (void)setExpandedTrailingBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, a3);
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
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_trailingHorizontalLayout, 0);
  objc_storeStrong((id *)&self->_trailingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTopConstraint, 0);
  objc_storeStrong((id *)&self->_centerHorizontalLayout, 0);
  objc_storeStrong((id *)&self->_centerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_centerTopConstraint, 0);
  objc_storeStrong((id *)&self->_leadingHorizontalLayout, 0);
  objc_storeStrong((id *)&self->_leadingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTopConstraint, 0);
  objc_storeStrong((id *)&self->_condensedCellularItem, 0);
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lowerWifiGroup, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end
