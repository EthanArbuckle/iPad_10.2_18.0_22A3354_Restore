@implementation _UIStatusBarVisualProvider_LegacyPhone

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
  CGSize result;

  objc_msgSend(a1, "_heightExpanded:", 1);
  v4 = v3;
  v5 = -1.0;
  result.height = v4;
  result.width = v5;
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
  v4 = -[_UIStatusBarVisualProvider_iOS expanded](self, "expanded")
    || -[_UIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen");
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
  double v5;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  UIRoundToScale(14.5, v3);
  v5 = v4;

  return v5;
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
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)qword_1ECD7B558;
  if (qword_1ECD7B558)
    v4 = _MergedGlobals_19_4 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    _MergedGlobals_19_4 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 12.0, *(double *)off_1E167DC70);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD7B558;
    qword_1ECD7B558 = v5;

    v3 = (void *)qword_1ECD7B558;
  }
  return v3;
}

- (id)timeFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD7B560;
  if (unk_1ECD7B560)
    v4 = byte_1ECD7B551 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD7B551 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 12.0, *(double *)off_1E167DC78);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD7B560;
    unk_1ECD7B560 = v5;

    v3 = (void *)unk_1ECD7B560;
  }
  return v3;
}

- (id)expandedFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD7B568;
  if (unk_1ECD7B568)
    v4 = byte_1ECD7B552 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD7B552 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 14.0, *(double *)off_1E167DC70);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD7B568;
    unk_1ECD7B568 = v5;

    v3 = (void *)unk_1ECD7B568;
  }
  return v3;
}

- (id)pillFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD7B570;
  if (unk_1ECD7B570)
    v4 = byte_1ECD7B553 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD7B553 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 12.0, *(double *)off_1E167DC78);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD7B570;
    unk_1ECD7B570 = v5;

    v3 = (void *)unk_1ECD7B570;
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
  _UIStatusBarRegion *v26;
  _UIStatusBarRegionAxesLayout *v27;
  _UIStatusBarRegionAxisStackingLayout *v28;
  _UIStatusBarRegionAxisStackingLayout *leadingHorizontalLayout;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *leadingTopConstraint;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *leadingHeightConstraint;
  _UIStatusBarRegion *v42;
  _UIStatusBarRegionAxesLayout *v43;
  _UIStatusBarRegionAxisStackingLayout *v44;
  _UIStatusBarRegionAxisStackingLayout *trailingHorizontalLayout;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *trailingTopConstraint;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  NSLayoutConstraint *v57;
  NSLayoutConstraint *trailingHeightConstraint;
  _UIStatusBarRegion *v59;
  _UIStatusBarRegionAxesLayout *v60;
  _UIStatusBarRegionAxisCenteringLayout *v61;
  _UIStatusBarRegionAxisCenteringLayout *centerHorizontalLayout;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  NSLayoutConstraint *v74;
  NSLayoutConstraint *centerTopConstraint;
  void *v76;
  NSLayoutConstraint *v77;
  NSLayoutConstraint *centerHeightConstraint;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _UIStatusBarRegion *v85;
  _UIStatusBarRegionAxesLayout *v86;
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
  NSLayoutConstraint *v100;
  NSLayoutConstraint *backgroundHeightConstraint;
  double v102;
  double v103;
  _UIStatusBarRegion *v104;
  _UIStatusBarRegionAxesLayout *v105;
  _UIStatusBarRegionAxisStackingLayout *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSLayoutConstraint *v111;
  NSLayoutConstraint *expandedLeadingBottomConstraint;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _UIStatusBarRegion *v118;
  _UIStatusBarRegionAxesLayout *v119;
  _UIStatusBarRegionAxisStackingLayout *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  NSLayoutConstraint *v125;
  NSLayoutConstraint *expandedTrailingBottomConstraint;
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
  double v138;
  void *v139;
  _UIStatusBarRegion *v140;
  _UIStatusBarRegionAxesLayout *v141;
  _UIStatusBarRegionAxisStackingLayout *v142;
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
  _UIStatusBarRegion *v153;
  _UIStatusBarRegionAxesLayout *v154;
  _UIStatusBarRegionAxisStackingLayout *v155;
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
  double v176;
  void *v177;
  void *v178;
  void *v180;
  double v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_LegacyPhone baselineOffset](self, "baselineOffset");
  v8 = v7;
  -[_UIStatusBarVisualProvider_LegacyPhone expandedBaselineOffset](self, "expandedBaselineOffset");
  v181 = v9;
  -[_UIStatusBarVisualProvider_LegacyPhone edgeInsets](self, "edgeInsets");
  v11 = v10;
  v13 = v12;
  -[_UIStatusBarVisualProvider_iOS itemSpacing](self, "itemSpacing");
  v15 = v14;
  -[_UIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  v17 = v16;
  -[_UIStatusBarVisualProvider_LegacyPhone regionSpacing](self, "regionSpacing");
  v19 = v18;
  -[_UIStatusBarVisualProvider_LegacyPhone normalFont](self, "normalFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "capHeight");
  v22 = v21 + 1.0;

  -[_UIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "capHeight");
  v25 = v24 + 1.0;

  v26 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("leading"));
  v27 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v28 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v28, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v28, "setInterspace:", v15);
  leadingHorizontalLayout = self->_leadingHorizontalLayout;
  self->_leadingHorizontalLayout = v28;

  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v27, "setHorizontalLayout:", self->_leadingHorizontalLayout);
  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v27, "setVerticalLayout:", v30);

  -[_UIStatusBarRegion setLayout:](v26, "setLayout:", v27);
  -[_UIStatusBarRegion setActionInsets:](v26, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[_UIStatusBarRegion layoutItem](v26, "layoutItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, v8);
  v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingTopConstraint = self->_leadingTopConstraint;
  self->_leadingTopConstraint = v34;

  objc_msgSend(v6, "addObject:", self->_leadingTopConstraint);
  objc_msgSend(v31, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v38);

  v184 = v31;
  objc_msgSend(v31, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", v22);
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingHeightConstraint = self->_leadingHeightConstraint;
  self->_leadingHeightConstraint = v40;

  objc_msgSend(v6, "addObject:", self->_leadingHeightConstraint);
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v31);

  objc_msgSend(v185, "addObject:", v26);
  v42 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("trailing"));
  v43 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v44 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v44, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v44, "setInterspace:", v15);
  trailingHorizontalLayout = self->_trailingHorizontalLayout;
  self->_trailingHorizontalLayout = v44;

  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v43, "setHorizontalLayout:", self->_trailingHorizontalLayout);
  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v43, "setVerticalLayout:", v46);

  -[_UIStatusBarRegion setLayout:](v42, "setLayout:", v43);
  -[_UIStatusBarRegion setActionInsets:](v42, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[_UIStatusBarRegion layoutItem](v42, "layoutItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, v8);
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingTopConstraint = self->_trailingTopConstraint;
  self->_trailingTopConstraint = v50;

  objc_msgSend(v6, "addObject:", self->_trailingTopConstraint);
  objc_msgSend(v47, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -v13;
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v55);

  v183 = v47;
  objc_msgSend(v47, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToConstant:", v22);
  v57 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingHeightConstraint = self->_trailingHeightConstraint;
  self->_trailingHeightConstraint = v57;

  objc_msgSend(v6, "addObject:", self->_trailingHeightConstraint);
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v47);

  objc_msgSend(v185, "addObject:", v42);
  v59 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("center"));
  v60 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v61 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  -[_UIStatusBarRegionAxisCenteringLayout setInterspace:](v61, "setInterspace:", v15);
  centerHorizontalLayout = self->_centerHorizontalLayout;
  self->_centerHorizontalLayout = v61;

  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v60, "setHorizontalLayout:", self->_centerHorizontalLayout);
  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v60, "setVerticalLayout:", v63);

  -[_UIStatusBarRegion setLayout:](v59, "setLayout:", v60);
  -[_UIStatusBarRegion layoutItem](v59, "layoutItem");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerXAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v67);

  objc_msgSend(v64, "widthAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToConstant:", 0.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = 1132068864;
  objc_msgSend(v69, "_ui_constraintWithPriority:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v71);

  objc_msgSend(v64, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, v8);
  v74 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  centerTopConstraint = self->_centerTopConstraint;
  self->_centerTopConstraint = v74;

  objc_msgSend(v6, "addObject:", self->_centerTopConstraint);
  objc_msgSend(v64, "heightAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToConstant:", v22);
  v77 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  centerHeightConstraint = self->_centerHeightConstraint;
  self->_centerHeightConstraint = v77;

  objc_msgSend(v6, "addObject:", self->_centerHeightConstraint);
  objc_msgSend(v64, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, v19);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v81);

  objc_msgSend(v183, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, v19);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v84);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v64);
  objc_msgSend(v185, "addObject:", v59);

  v85 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("background"));
  v86 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v86, "setHorizontalLayout:", v87);

  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v86, "setVerticalLayout:", v88);

  -[_UIStatusBarRegion setLayout:](v85, "setLayout:", v86);
  -[_UIStatusBarRegion layoutItem](v85, "layoutItem");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v92);

  objc_msgSend(v89, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v95);

  objc_msgSend(v89, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v98);

  objc_msgSend(v89, "heightAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "height");
  objc_msgSend(v99, "constraintEqualToConstant:");
  v100 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  backgroundHeightConstraint = self->_backgroundHeightConstraint;
  self->_backgroundHeightConstraint = v100;

  objc_msgSend(v6, "addObject:", self->_backgroundHeightConstraint);
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v89);

  objc_msgSend(v185, "addObject:", v85);
  -[_UIStatusBarVisualProvider_LegacyPhone lowerExpandedBaselineOffset](self, "lowerExpandedBaselineOffset");
  v103 = v102;
  v104 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLeading"));
  v105 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v106 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v106, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v106, "setInterspace:", v17);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v105, "setHorizontalLayout:", v106);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v105, "setVerticalLayout:", v107);

  -[_UIStatusBarRegion setLayout:](v104, "setLayout:", v105);
  -[_UIStatusBarRegion setActionInsets:](v104, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[_UIStatusBarRegion disableWithToken:](v104, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v104, "layoutItem");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "bottomAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:constant:", v110, v181);
  v111 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedLeadingBottomConstraint = self->_expandedLeadingBottomConstraint;
  self->_expandedLeadingBottomConstraint = v111;

  -[NSLayoutConstraint setIdentifier:](self->_expandedLeadingBottomConstraint, "setIdentifier:", CFSTR("UISB-expanded-leading-bottom"));
  objc_msgSend(v6, "addObject:", self->_expandedLeadingBottomConstraint);
  objc_msgSend(v108, "leadingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:constant:", v114, v11);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v115);

  objc_msgSend(v108, "heightAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToConstant:", v25);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v117);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v108);
  objc_msgSend(v185, "addObject:", v104);

  v118 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedTrailing"));
  v119 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v120 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v120, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v120, "setInterspace:", v17);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v119, "setHorizontalLayout:", v120);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v119, "setVerticalLayout:", v121);

  -[_UIStatusBarRegion setLayout:](v118, "setLayout:", v119);
  -[_UIStatusBarRegion setActionInsets:](v118, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  -[_UIStatusBarRegion disableWithToken:](v118, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v118, "layoutItem");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v124, v181);
  v125 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v125;

  -[NSLayoutConstraint setIdentifier:](self->_expandedTrailingBottomConstraint, "setIdentifier:", CFSTR("UISB-expanded-trailing-bottom"));
  objc_msgSend(v6, "addObject:", self->_expandedTrailingBottomConstraint);
  objc_msgSend(v122, "trailingAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:constant:", v128, v54);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v129);

  objc_msgSend(v122, "heightAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToConstant:", v25);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v131);

  objc_msgSend(v122, "leadingAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v108;
  objc_msgSend(v108, "trailingAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintEqualToAnchor:constant:", v133, v17);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v134);

  objc_msgSend(v122, "widthAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "widthAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "constraintEqualToAnchor:", v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v138) = 1131741184;
  objc_msgSend(v137, "_ui_constraintWithPriority:", v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v139);

  v180 = v122;
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v122);

  objc_msgSend(v185, "addObject:", v118);
  v140 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerLeading"));
  v141 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v142 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v142, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v142, "setInterspace:", v17);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v141, "setHorizontalLayout:", v142);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v141, "setVerticalLayout:", v143);

  -[_UIStatusBarRegion setLayout:](v140, "setLayout:", v141);
  -[_UIStatusBarRegion disableWithToken:](v140, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v140, "layoutItem");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "bottomAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "bottomAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToAnchor:constant:", v146, v103);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v147);

  objc_msgSend(v144, "leadingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:constant:", v149, v11);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v150);

  objc_msgSend(v144, "heightAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "constraintEqualToConstant:", v25);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v152);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v144);
  objc_msgSend(v185, "addObject:", v140);

  v153 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerTrailing"));
  v154 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v155 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v155, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v155, "setInterspace:", v17);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v154, "setHorizontalLayout:", v155);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v154, "setVerticalLayout:", v156);

  -[_UIStatusBarRegion setLayout:](v153, "setLayout:", v154);
  -[_UIStatusBarRegion disableWithToken:](v153, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v153, "layoutItem");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "bottomAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "constraintEqualToAnchor:constant:", v159, v103);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v160);

  -[_UIStatusBarRegion layoutItem](v153, "layoutItem");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "trailingAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:constant:", v163, v54);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v164);

  -[_UIStatusBarRegion layoutItem](v153, "layoutItem");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "heightAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToConstant:", v25);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v167);

  -[_UIStatusBarRegion layoutItem](v153, "layoutItem");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "leadingAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "trailingAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "constraintEqualToAnchor:constant:", v170, v17);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v171);

  -[_UIStatusBarRegion layoutItem](v153, "layoutItem");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "widthAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "widthAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "constraintEqualToAnchor:", v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v176) = 1131741184;
  objc_msgSend(v175, "_ui_constraintWithPriority:", v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v177);

  -[_UIStatusBarRegion layoutItem](v153, "layoutItem");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v178);

  objc_msgSend(v185, "addObject:", v153);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v6);

  return v185;
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
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
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
  void *v58;
  void *v59;
  uint64_t v60;
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
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  _UIStatusBarDisplayItemPlacementGroup *lowerWifiGroup;
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
  uint64_t v133;
  NSDictionary *v134;
  void *v135;
  uint64_t v137;
  uint64_t v138;
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
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  _UIStatusBarVisualProvider_LegacyPhone *v170;
  void *v171;
  void *v172;
  _QWORD v173[8];
  _QWORD v174[8];
  void *v175;
  _QWORD v176[3];
  _QWORD v177[12];
  _QWORD v178[2];
  _QWORD v179[5];
  void *v180;
  _QWORD v181[3];
  _QWORD v182[2];
  _QWORD v183[14];
  _QWORD v184[2];
  uint64_t v185;
  _QWORD v186[5];

  v186[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    v161 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    LOBYTE(v137) = 1;
    +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:](_UIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:", 1300, 1000, v7, v8, objc_opt_class(), 1, v137);
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

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarNavigationItem, "defaultDisplayIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v16, objc_msgSend(v9, "maximumPriority") + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = (void *)v13;
    v160 = (void *)v11;
    v186[0] = v11;
    v186[1] = v13;
    v158 = (void *)v15;
    v186[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "excludingPlacements:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_UIStatusBarVisualProvider_iOS hasCellularCapability](self, "hasCellularCapability"))
    {
      v20 = v6;
      objc_msgSend(v6, "addObject:", v19);
      v21 = 0;
      v22 = 1;
    }
    else
    {
      +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarDeviceNameItem, "defaultDisplayIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v23, 30);
      v21 = objc_claimAutoreleasedReturnValue();

      v185 = v21;
      v22 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v185, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "excludingPlacements:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "addObject:", v25);
      v20 = v6;
      if (v21)
      {
        objc_msgSend(v6, "addObject:", v21);
        v22 = 0;
      }
      v19 = (void *)v25;
    }
    v157 = v19;
    v170 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellularGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "placementsAffectedByAirplaneMode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObjectsFromArray:", v28);

    if ((v22 & 1) == 0)
      objc_msgSend(v26, "addObject:", v21);
    v156 = (void *)v21;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v29, 1400);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v26;
    objc_msgSend(v30, "excludingPlacements:", v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v20;
    objc_msgSend(v20, "addObject:", v31);

    v32 = objc_msgSend(v9, "minimumPriority");
    +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", v32 - 5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellularGroup");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "typePlacement");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v184[0] = v35;
    objc_msgSend(v9, "cellularGroup");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "namePlacement");
    v37 = v9;
    v168 = v9;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v184[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "requiringAllPlacements:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "placements");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "arrayByAddingObject:", v40);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarCellularItem signalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v183[0] = v166;
    +[_UIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v183[1] = v164;
    +[_UIStatusBarCellularItem warningDisplayIdentifier](_UIStatusBarCellularCondensedItem, "warningDisplayIdentifier");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v183[2] = v162;
    +[_UIStatusBarCellularItem rawDisplayIdentifier](_UIStatusBarCellularCondensedItem, "rawDisplayIdentifier");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v183[3] = v152;
    +[_UIStatusBarCellularItem nameDisplayIdentifier](_UIStatusBarCellularCondensedItem, "nameDisplayIdentifier");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v183[4] = v150;
    +[_UIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSingleLineNameDisplayIdentifier");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v183[5] = v147;
    +[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSingleLineNameAndTypeDisplayIdentifier");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v183[6] = v145;
    v154 = v40;
    objc_msgSend(v40, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v183[7] = v41;
    +[_UIStatusBarCellularItem typeDisplayIdentifier](_UIStatusBarCellularCondensedItem, "typeDisplayIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v183[8] = v42;
    +[_UIStatusBarWifiItem signalStrengthDisplayIdentifier](_UIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v183[9] = v43;
    +[_UIStatusBarWifiItem iconDisplayIdentifier](_UIStatusBarWifiItem, "iconDisplayIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v183[10] = v44;
    +[_UIStatusBarWifiItem rawDisplayIdentifier](_UIStatusBarWifiItem, "rawDisplayIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v183[11] = v45;
    +[_UIStatusBarCellularItem callForwardingDisplayIdentifier](_UIStatusBarCellularCondensedItem, "callForwardingDisplayIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v183[12] = v46;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorVPNItem, "defaultDisplayIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v183[13] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 14);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    _reorderedPlacementsFromGroupForLegacyLayout(v143, 0, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "addObjectsFromArray:", v49);

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarActivityItem, "defaultDisplayIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v50, objc_msgSend(v168, "minimumPriority") - 10);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "addObject:", v51);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarLockItem, "defaultDisplayIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v52, 3000);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarLockItem textDisplayIdentifier](_UIStatusBarLockItem, "textDisplayIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v53, 2999);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "cellularGroup");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dualNamePlacement");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v182[0] = v56;
    objc_msgSend(v168, "cellularGroup");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dualNameAndTypePlacement");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v182[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v182, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "excludingPlacements:", v59);
    v60 = objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarTimeItem timeDisplayIdentifier](_UIStatusBarTimeItem, "timeDisplayIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v61, 3002);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v181[0] = v60;
    objc_msgSend(v168, "cellularGroup");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "dualNamePlacement");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v181[1] = v64;
    objc_msgSend(v168, "cellularGroup");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "dualNameAndTypePlacement");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v181[2] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 3);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "excludingPlacements:", v67);
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = v172;
    objc_msgSend(v172, "addObject:", v167);
    v153 = (void *)v60;
    objc_msgSend(v172, "addObject:", v60);
    if (_UIGetFullWidthBackgroundActivity())
    {
      +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v69, 1950);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v71, 1949);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "requiringAllPlacements:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      +[_UIStatusBarFullBackgroundActivityItem detailDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "detailDisplayIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v75, 5000);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v179[0] = CFSTR("leading");
      v179[1] = CFSTR("center");
      v179[2] = CFSTR("trailing");
      v179[3] = CFSTR("expandedLeading");
      v179[4] = CFSTR("expandedTrailing");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 5);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v178[0] = v70;
      v178[1] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "excludingAllPlacementsInRegions:exceptPlacements:", v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = v172;
      -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](v170, "pillRegionCoordinator");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setBackgroundActivityDetailPlacement:", v79);

      objc_msgSend(v172, "addObject:", v70);
      objc_msgSend(v172, "addObject:", v74);
      objc_msgSend(v172, "addObject:", v79);

    }
    objc_msgSend(v68, "addObject:", v165);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v82, 1960);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObject:", v83);

    +[_UIStatusBarIndicatorLocationItem groupWithPriority:](_UIStatusBarIndicatorLocationItem, "groupWithPriority:", 1955);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "placements");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObjectsFromArray:", v85);

    if ((_UIGetFullWidthBackgroundActivity() & 1) == 0)
    {
      +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v86, 1950);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "addObject:", v87);
    }
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v88, 1940);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObject:", v89);

    -[_UIStatusBarVisualProvider_iOS bluetoothPaddingInset](v170, "bluetoothPaddingInset");
    +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 800, 500);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](_UIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", objc_msgSend(v90, "maximumPriority") + 1, objc_msgSend(v90, "minimumPriority") - 5);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "placements");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarBluetoothItem batteryDisplayIdentifier](_UIStatusBarBluetoothItem, "batteryDisplayIdentifier");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v90;
    v177[0] = v148;
    objc_msgSend(v90, "bluetoothInsetPaddingItem");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "identifier");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v177[1] = v144;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarBluetoothItem, "defaultDisplayIdentifier");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v177[2] = v142;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirPlayItem, "defaultDisplayIdentifier");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v177[3] = v141;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorTTYItem, "defaultDisplayIdentifier");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v177[4] = v140;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAlarmItem, "defaultDisplayIdentifier");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v177[5] = v91;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorStudentItem, "defaultDisplayIdentifier");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v177[6] = v92;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorRotationLockItem, "defaultDisplayIdentifier");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v177[7] = v93;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAssistantItem, "defaultDisplayIdentifier");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v177[8] = v94;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorQuietModeItem, "defaultDisplayIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v177[9] = v95;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorCarPlayItem, "defaultDisplayIdentifier");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v177[10] = v96;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorSatelliteItem, "defaultDisplayIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v177[11] = v97;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 12);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    _reorderedPlacementsFromGroupForLegacyLayout(v139, 1, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObjectsFromArray:", v99);

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarBuildVersionItem, "defaultDisplayIdentifier");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v100, 2);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v81;
    objc_msgSend(v81, "addObject:", v101);

    objc_msgSend(v163, "placements");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorLiquidDetectionItem, "defaultDisplayIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v176[0] = v104;
    +[_UIStatusBarBatteryItem staticIconDisplayIdentifier](_UIStatusBarBatteryItem, "staticIconDisplayIdentifier");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v176[1] = v105;
    +[_UIStatusBarBatteryItem percentDisplayIdentifier](_UIStatusBarBatteryItem, "percentDisplayIdentifier");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v176[2] = v106;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 3);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    _reorderedPlacementsFromGroupForLegacyLayout(v103, 1, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = v102;
    objc_msgSend(v102, "addObjectsFromArray:", v108);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_opt_class();
    v111 = objc_opt_class();
    LOBYTE(v138) = 0;
    +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:](_UIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:", 2500, 2200, v110, v111, objc_opt_class(), 1, v138);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "wifiGroup");
    v113 = objc_claimAutoreleasedReturnValue();
    lowerWifiGroup = v170->_lowerWifiGroup;
    v170->_lowerWifiGroup = (_UIStatusBarDisplayItemPlacementGroup *)v113;

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v115, 5000);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_iOS expandedCellularPlacementsAffectedByAirplaneMode](v170, "expandedCellularPlacementsAffectedByAirplaneMode");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "cellularGroup");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "placementsAffectedByAirplaneMode");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "arrayByAddingObjectsFromArray:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "excludingPlacements:", v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addObject:", v121);

    objc_msgSend(v112, "placements");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addObjectsFromArray:", v122);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v124, 1450);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "addObject:", v125);

    -[_UIStatusBarVisualProvider_iOS bluetoothPaddingInset](v170, "bluetoothPaddingInset");
    +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 1400, 1000);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "placements");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "addObjectsFromArray:", v127);

    if (_UIGetFullWidthBackgroundActivity())
    {
      +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "backgroundDisplayIdentifier");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v128, 2000);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = v129;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v130 = (void *)MEMORY[0x1E0C9AA60];
    }
    v173[0] = CFSTR("leading");
    v173[1] = CFSTR("trailing");
    v174[0] = v169;
    v174[1] = v149;
    v173[2] = CFSTR("center");
    v173[3] = CFSTR("background");
    v174[2] = v172;
    v174[3] = v130;
    v173[4] = CFSTR("expandedLeading");
    -[_UIStatusBarVisualProvider_iOS expandedLeadingPlacements](v170, "expandedLeadingPlacements");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v174[4] = v131;
    v174[5] = v109;
    v173[5] = CFSTR("expandedLowerLeading");
    v173[6] = CFSTR("expandedTrailing");
    -[_UIStatusBarVisualProvider_iOS expandedTrailingPlacements](v170, "expandedTrailingPlacements");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v173[7] = CFSTR("expandedLowerTrailing");
    v174[6] = v132;
    v174[7] = v123;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 8);
    v133 = objc_claimAutoreleasedReturnValue();
    v134 = v170->_orderedDisplayItemPlacements;
    v170->_orderedDisplayItemPlacements = (NSDictionary *)v133;

    orderedDisplayItemPlacements = v170->_orderedDisplayItemPlacements;
    v4 = v161;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  return v135;
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
      objc_msgSend(v5, "setMarqueeServiceName:", -[_UIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen"));
      objc_storeStrong((id *)&self->_condensedCellularItem, a3);
    }
    objc_msgSend(v5, "setTypeStringProvider:", self);

    goto LABEL_11;
  }
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem identifier](_UIStatusBarVoiceControlPillItem, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v11 = v12;
    -[_UIStatusBarVisualProvider_LegacyPhone smallPillSize](self, "smallPillSize");
    objc_msgSend(v11, "setPillSize:");

    goto LABEL_11;
  }
  objc_msgSend(v12, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem identifier](_UIStatusBarIndicatorLiquidDetectionItem, "identifier");
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
  if (a3 != 2)
    return 0;
  _UINSLocalizedStringWithDefaultValue(CFSTR("GPRS"), CFSTR("GPRS"));
  return (id)objc_claimAutoreleasedReturnValue();
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

      v11 = off_1E167A828;
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
      objc_msgSend(v7, "fontDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = off_1E167A828;
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
  _UIStatusBarRoundedCornerView *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];
  BOOL v22;
  _QWORD v23[2];

  v5 = a5;
  v6 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
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
    v20.receiver = self;
    v20.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    -[_UIStatusBarVisualProvider_Phone actionable:highlighted:initialPress:](&v20, sel_actionable_highlighted_initialPress_, v8, v6, v5);
    goto LABEL_8;
  }
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 != (void *)v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v10, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "backgroundDisplayIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
      goto LABEL_10;
    goto LABEL_7;
  }

LABEL_10:
  objc_msgSend(v10, "highlightView");
  v16 = (_UIStatusBarRoundedCornerView *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = objc_alloc_init(_UIStatusBarRoundedCornerView);
    -[UIView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "backgroundDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v18)
      -[_UIStatusBarRoundedCornerView setCornerRadius:](v16, "setCornerRadius:", 0.0);
    objc_msgSend(v10, "setHighlightView:", v16);
  }
  v23[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __78___UIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke;
  v21[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v22 = v6;
  +[UIButton _setVisuallyHighlighted:forViews:initialPress:highlightBlock:](UIButton, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v6, v19, v5, v21);

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
  v15.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  v4 = a3;
  -[_UIStatusBarVisualProvider_Phone willUpdateWithData:](&v15, sel_willUpdateWithData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
        if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
          v10 = 4;
        else
          v10 = 1;
      }
      else
      {
        v10 = 4;
      }
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "regions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __61___UIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke;
      v14[3] = &__block_descriptor_40_e45_v32__0__NSString_8___UIStatusBarRegion_16_B24l;
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

  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPriority:", 10);
  +[_UIStatusBarWifiItem iconDisplayIdentifier](_UIStatusBarWifiItem, "iconDisplayIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v4);

  +[_UIStatusBarWifiItem rawDisplayIdentifier](_UIStatusBarWifiItem, "rawDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v5);

  +[_UIStatusBarWifiItem signalStrengthDisplayIdentifier](_UIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v6);

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorVPNItem, "defaultDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v7);

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarActivityItem, "defaultDisplayIdentifier");
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
  +[_UIStatusBarFullBackgroundActivityItem detailDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "detailDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    +[_UIStatusBarAnimationFactory noAnimation](_UIStatusBarAnimationFactory, "noAnimation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarTimeItem timeDisplayIdentifier](_UIStatusBarTimeItem, "timeDisplayIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v13, v14);

    +[_UIStatusBarAnimationFactory noAnimation](_UIStatusBarAnimationFactory, "noAnimation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v15, v16);

    +[_UIStatusBarAnimationFactory noAnimation](_UIStatusBarAnimationFactory, "noAnimation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v17, v18);

    v12 = v7;
    goto LABEL_8;
  }
  +[_UIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSingleLineNameDisplayIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v6)
  {

    goto LABEL_7;
  }
  v10 = (void *)v9;
  +[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSingleLineNameAndTypeDisplayIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v6)
  {
LABEL_7:
    -[_UIStatusBarVisualProvider_LegacyPhone _animationForSingleLineDualCarrier](self, "_animationForSingleLineDualCarrier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v21.receiver = self;
  v21.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  -[_UIStatusBarVisualProvider_Phone additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v21, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
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
  +[_UIStatusBarFullBackgroundActivityItem detailDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "detailDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[_UIStatusBarVisualProvider_LegacyPhone _backgroundActivityDetailRemovalAnimation](self, "_backgroundActivityDetailRemovalAnimation");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  +[_UIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSingleLineNameDisplayIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v6)
  {

    goto LABEL_7;
  }
  v10 = (void *)v9;
  +[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSingleLineNameAndTypeDisplayIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v6)
  {
LABEL_7:
    -[_UIStatusBarVisualProvider_LegacyPhone _animationForSingleLineDualCarrier](self, "_animationForSingleLineDualCarrier");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  -[_UIStatusBarVisualProvider_Phone removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v15, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
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
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((id)v4 == v3)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v3)
  {
LABEL_5:
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
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
    if (objc_msgSend(v4, "isEqual:", 0x1E176E800))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v20 = CFSTR("trailing");
      v21 = 0;
      v6 = CFSTR("background");
      v7 = CFSTR("center");
      goto LABEL_3;
    }
    if (objc_msgSend(v4, "isEqual:", 0x1E176E820))
      goto LABEL_11;
    if (!objc_msgSend(v4, "isEqual:", 0x1E176E840))
    {
      if (objc_msgSend(v4, "isEqual:", 0x1E176E860))
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
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "secondaryCellularEntry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEnabled") & 1) != 0)
      {
        -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
  v19.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  -[_UIStatusBarVisualProvider_iOS styleAttributesForStyle:](&v19, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  if ((unint64_t)(v5 - 1) < 2)
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

    -[_UIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v9);

    objc_msgSend(v4, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSmallFont:", v10);

    -[_UIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
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

    -[_UIStatusBarVisualProvider_LegacyPhone normalFont](self, "normalFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v15);

    objc_msgSend(v4, "font");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSmallFont:", v16);

    -[_UIStatusBarVisualProvider_LegacyPhone timeFont](self, "timeFont");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v4, "setImageNamePrefixes:", &unk_1E1A94A60);
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
    +[_UIStatusBarTimeItem timeDisplayIdentifier](_UIStatusBarTimeItem, "timeDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    -[_UIStatusBarVisualProvider_iOS displayItemIdentifiersForPartWithIdentifier:](&v9, sel_displayItemIdentifiersForPartWithIdentifier_, v4);
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
  double v26;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarTimeItem timeDisplayIdentifier](_UIStatusBarTimeItem, "timeDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentAggregatedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortTimeEntry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bounds");
    v13 = _UIComputedSizeForLabel(v7, v19, 0, 1uLL, 0, 0, 0, v20, v21);
    v15 = v22;
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

  v23 = v9;
  v24 = v11;
  v25 = v13;
  v26 = v15;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAggregatedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_LegacyPhone _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

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
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
    -[_UIStatusBarVisualProvider_LegacyPhone regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", 0x1E176E860);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70___UIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke;
    v11[3] = &unk_1E16E1200;
    v12 = v8;
    v11[4] = self;
    v11[5] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

    -[_UIStatusBarVisualProvider_LegacyPhone _updateBackgroundHeight](self, "_updateBackgroundHeight");
    if (v8)
      -[_UIStatusBarVisualProvider_LegacyPhone dualLineExpandedBaselineOffset](self, "dualLineExpandedBaselineOffset");
    else
      -[_UIStatusBarVisualProvider_LegacyPhone expandedBaselineOffset](self, "expandedBaselineOffset");
    -[NSLayoutConstraint setConstant:](self->_expandedLeadingBottomConstraint, "setConstant:");
    if (*((_BYTE *)v14 + 24))
    {
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

    }
    _Block_object_dispose(&v13, 8);
  }

}

- (void)_updateExpandedTrailingRegion
{
  _QWORD v3[5];

  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v3);
  }
}

- (void)updateDataForService:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  v4 = a3;
  -[_UIStatusBarVisualProvider_iOS updateDataForService:](&v6, sel_updateDataForService_, v4);
  objc_msgSend(v4, "secondaryCellularEntry", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[_UIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", objc_msgSend(v5, "type") != 0);

}

- (void)_updateBackgroundHeight
{
  -[_UIStatusBarVisualProvider_LegacyPhone effectiveHeight](self, "effectiveHeight");
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
  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded") != a3)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "regions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54___UIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke;
      v13[3] = &__block_descriptor_40_e45_v32__0__NSString_8___UIStatusBarRegion_16_B24l;
      v13[4] = v9;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

    }
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    -[_UIStatusBarVisualProvider_iOS setExpanded:](&v12, sel_setExpanded_, v3);
    -[_UIStatusBarVisualProvider_LegacyPhone _updateBackgroundHeight](self, "_updateBackgroundHeight");
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

  v3 = -[_UIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen");
  if (v3)
  {
    -[_UIStatusBarVisualProvider_LegacyPhone expandedBaselineOffset](self, "expandedBaselineOffset");
    v5 = v4;
    -[_UIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
    v7 = v6;
    -[_UIStatusBarVisualProvider_LegacyPhone expandedFont](self, "expandedFont");
  }
  else
  {
    -[_UIStatusBarVisualProvider_LegacyPhone baselineOffset](self, "baselineOffset");
    v5 = v8;
    -[_UIStatusBarVisualProvider_iOS itemSpacing](self, "itemSpacing");
    v7 = v9;
    -[_UIStatusBarVisualProvider_LegacyPhone normalFont](self, "normalFont");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "capHeight");
  v12 = v11;

  v13 = v12 + 1.0;
  -[_UIStatusBarCellularItem setMarqueeServiceName:](self->_condensedCellularItem, "setMarqueeServiceName:", v3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](self->_leadingHorizontalLayout, "setInterspace:", v7);
  -[_UIStatusBarRegionAxisCenteringLayout setInterspace:](self->_centerHorizontalLayout, "setInterspace:", v7);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](self->_trailingHorizontalLayout, "setInterspace:", v7);
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
  if (-[_UIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    -[_UIStatusBarVisualProvider_iOS setOnLockScreen:](&v5, sel_setOnLockScreen_, v3);
    -[_UIStatusBarVisualProvider_LegacyPhone _updateLockScreenSizing](self, "_updateLockScreenSizing");
    -[_UIStatusBarVisualProvider_LegacyPhone _updateBackgroundHeight](self, "_updateBackgroundHeight");
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
  v34[3] = &unk_18685B0AF;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v35 = *MEMORY[0x1E0C9D628];
  v36 = v2;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x4010000000;
  v31[3] = &unk_18685B0AF;
  v32 = v35;
  v33 = v2;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x4010000000;
  v28[3] = &unk_18685B0AF;
  v29 = v35;
  v30 = v2;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x4010000000;
  v25[3] = &unk_18685B0AF;
  v26 = v35;
  v27 = v2;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke;
  v24[3] = &unk_1E16DC510;
  v24[4] = v34;
  v24[5] = v25;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4;
  v23[3] = &unk_1E16E1228;
  v23[5] = v5;
  v23[6] = v7;
  v23[7] = v9;
  v23[8] = v11;
  v23[4] = v34;
  objc_msgSend(v13, "setPrepareBlock:", v23);
  objc_msgSend(v13, "setPriority:", 100);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5;
  v22[3] = &unk_1E16DC510;
  v22[4] = v25;
  v22[5] = v34;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPriority:", 200);
  +[_UIStatusBarTimeItem timeDisplayIdentifier](_UIStatusBarTimeItem, "timeDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubAnimation:forDisplayItemWithIdentifier:", v14, v15);

  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9;
  v21[3] = &unk_1E16DC510;
  v21[4] = v28;
  v21[5] = v31;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12;
  v20[3] = &unk_1E16E1250;
  v20[6] = v5;
  v20[7] = v7;
  v20[8] = v9;
  v20[9] = v11;
  v20[4] = v28;
  v20[5] = v31;
  objc_msgSend(v16, "setPrepareBlock:", v20);
  objc_msgSend(v16, "setPriority:", 50);
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "defaultDisplayIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubAnimation:forDisplayItemWithIdentifier:", v16, v17);

  +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubAnimation:forDisplayItemWithIdentifier:", v16, v18);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v34, 8);
  return v13;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, a3);
}

- (_UIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
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

- (_UIStatusBarCellularItem)condensedCellularItem
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

- (_UIStatusBarRegionAxisStackingLayout)leadingHorizontalLayout
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

- (_UIStatusBarRegionAxisCenteringLayout)centerHorizontalLayout
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

- (_UIStatusBarRegionAxisStackingLayout)trailingHorizontalLayout
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

- (void).cxx_destruct
{
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
