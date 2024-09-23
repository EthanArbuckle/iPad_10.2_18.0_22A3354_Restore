@implementation _UIStatusBarVisualProvider_Pad

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5;
  char v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(v5, "_isMainLikeScreen") & 1) != 0)
  {
    v6 = objc_msgSend(v5, "_isEmbeddedScreen");
    objc_msgSend(v5, "_displayCornerRadius");
    if ((v6 & 1) == 0)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v5, "_displayCornerRadius");
  }
  if (v7 <= 0.0)
  {
    v9 = a1;
    goto LABEL_8;
  }
LABEL_6:
  v8 = (void *)objc_opt_class();
  _UIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v8, v5, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = v9;

  return (Class)v10;
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
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)qword_1ECD79B70;
  if (qword_1ECD79B70)
    v4 = _MergedGlobals_13_6 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    _MergedGlobals_13_6 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 12.0, *(double *)off_1E167DC68);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD79B70;
    qword_1ECD79B70 = v5;

    v3 = (void *)qword_1ECD79B70;
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
  v3 = (void *)unk_1ECD79B78;
  if (unk_1ECD79B78)
    v4 = byte_1ECD79B69 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD79B69 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 15.0, *(double *)off_1E167DC68);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD79B78;
    unk_1ECD79B78 = v5;

    v3 = (void *)unk_1ECD79B78;
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
  v3 = (void *)unk_1ECD79B80;
  if (unk_1ECD79B80)
    v4 = byte_1ECD79B6A == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD79B6A = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 11.0, *(double *)off_1E167DC78);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD79B80;
    unk_1ECD79B80 = v5;

    v3 = (void *)unk_1ECD79B80;
  }
  return v3;
}

- (id)pillSmallFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD79B88;
  if (unk_1ECD79B88)
    v4 = byte_1ECD79B6B == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD79B6B = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 10.0, *(double *)off_1E167DC50);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD79B88;
    unk_1ECD79B88 = v5;

    v3 = (void *)unk_1ECD79B88;
  }
  return v3;
}

- (id)expandedPillFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD79B90;
  if (unk_1ECD79B90)
    v4 = byte_1ECD79B6C == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD79B6C = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 11.0, *(double *)off_1E167DC68);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD79B90;
    unk_1ECD79B90 = v5;

    v3 = (void *)unk_1ECD79B90;
  }
  return v3;
}

- (UIFont)clockFont
{
  void *v3;
  void *v4;

  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_StatusBarHasBoldTime, (uint64_t)CFSTR("StatusBarHasBoldTime")) & 1) != 0|| !byte_1EDDA82DC)
  {
    -[_UIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pointSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIFont *)v4;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return 1;
}

- (_UIStatusBarVisualProvider_Pad)init
{
  _UIStatusBarVisualProvider_Pad *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  v2 = -[_UIStatusBarVisualProvider_iOS init](&v5, sel_init);
  _UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("StatusBarHidesDate"), 0, 0);
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("StatusBarHidesAMPM"), 0, 0);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  _UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("StatusBarHidesDate"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("StatusBarHidesAMPM"));

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  -[_UIStatusBarVisualProvider_Pad dealloc](&v4, sel_dealloc);
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
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  _UIStatusBarRegion *v27;
  _UIStatusBarRegionAxesLayout *v28;
  _UIStatusBarRegionAxisStackingLayout *v29;
  void *v30;
  void *v31;
  double v32;
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
  _UIStatusBarRegion *v43;
  _UIStatusBarRegionAxesLayout *v44;
  _UIStatusBarRegionAxisStackingLayout *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _UIStatusBarRegion *v58;
  _UIStatusBarRegionAxisCenteringLayout *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
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
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  NSLayoutConstraint *v94;
  NSLayoutConstraint *leadingRegionTrailingAnchorConstraint;
  void *v96;
  void *v97;
  NSLayoutConstraint *v98;
  NSLayoutConstraint *trailingRegionLeadingAnchorConstraint;
  _UIStatusBarRegion *v100;
  _UIStatusBarRegionAxesLayout *v101;
  _UIStatusBarRegionAxisStackingLayout *v102;
  void *v103;
  UIView *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  _UIStatusBarRegion *v114;
  _UIStatusBarRegionAxesLayout *v115;
  _UIStatusBarRegionAxisStackingLayout *v116;
  void *v117;
  UIView *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  _UIStatusBarRegion *v137;
  _UIStatusBarRegionAxesLayout *v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;

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
  -[_UIStatusBarVisualProvider_Pad expandedEdgeInsets](self, "expandedEdgeInsets");
  v139 = v14;
  v141 = v15;
  -[_UIStatusBarVisualProvider_iOS itemSpacing](self, "itemSpacing");
  v17 = v16;
  -[_UIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  v19 = v18;
  -[_UIStatusBarVisualProvider_Pad regionSpacing](self, "regionSpacing");
  v21 = v20;
  -[_UIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "capHeight");
  v24 = v23;

  -[_UIStatusBarVisualProvider_Pad expandedFont](self, "expandedFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "capHeight");
  v140 = v26;

  v27 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("leading"));
  v28 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v29 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v29, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v29, "setInterspace:", 10.0);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v28, "setHorizontalLayout:", v29);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v28, "setVerticalLayout:", v30);

  -[_UIStatusBarRegion setLayout:](v27, "setLayout:", v28);
  -[_UIStatusBarRegion setOffsetable:](v27, "setOffsetable:", 1);
  -[_UIStatusBarRegion setActionInsets:](v27, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  +[_UIStatusBarHoverRegionAction leadingHoverAction](_UIStatusBarHoverRegionAction, "leadingHoverAction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion setHoverAction:](v27, "setHoverAction:", v31);

  UIRoundToViewScale(v5);
  -[_UIStatusBarRegion setExtendedHoverInsets:](v27, "setExtendedHoverInsets:", -v32, -v11, 0.0, 0.0);
  -[_UIStatusBarRegion layoutItem](v27, "layoutItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v36);

  objc_msgSend(v33, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v39);

  v144 = v33;
  objc_msgSend(v33, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToConstant:", v24);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v33);
  v42 = v7;
  v142 = v7;
  objc_msgSend(v7, "addObject:", v27);

  v43 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("trailing"));
  v44 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v45 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v45, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v45, "setInterspace:", v17);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v44, "setHorizontalLayout:", v45);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v44, "setVerticalLayout:", v46);

  -[_UIStatusBarRegion setLayout:](v43, "setLayout:", v44);
  -[_UIStatusBarRegion setOffsetable:](v43, "setOffsetable:", 1);
  -[_UIStatusBarRegion setActionInsets:](v43, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  +[_UIStatusBarHoverRegionAction trailingHoverAction](_UIStatusBarHoverRegionAction, "trailingHoverAction");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion setHoverAction:](v43, "setHoverAction:", v47);

  UIRoundToViewScale(v5);
  -[_UIStatusBarRegion setExtendedHoverInsets:](v43, "setExtendedHoverInsets:", -v48, 0.0, 0.0, -v13);
  -[_UIStatusBarRegion layoutItem](v43, "layoutItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, v9);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v52);

  objc_msgSend(v49, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -v13);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v55);

  v143 = v49;
  objc_msgSend(v49, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToConstant:", v24);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v57);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v49);
  objc_msgSend(v42, "addObject:", v43);

  v58 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("center"));
  v138 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v59 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  -[_UIStatusBarRegionAxisCenteringLayout setInterspace:](v59, "setInterspace:", v17);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v138, "setHorizontalLayout:", v59);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v138, "setVerticalLayout:", v60);

  v137 = v58;
  -[_UIStatusBarRegion setLayout:](v58, "setLayout:", v138);
  -[_UIStatusBarRegion setOffsetable:](v58, "setOffsetable:", 1);
  -[_UIStatusBarRegion layoutItem](v58, "layoutItem");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v65) = 1132068864;
  objc_msgSend(v64, "_ui_constraintWithPriority:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v66);

  objc_msgSend(v61, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToConstant:", 0.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v69) = 1132003328;
  objc_msgSend(v68, "_ui_constraintWithPriority:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v70);

  objc_msgSend(v61, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, v9);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v73);

  objc_msgSend(v61, "heightAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToConstant:", v24);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v75);

  objc_msgSend(v61, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:constant:", v77, v21);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v78);

  objc_msgSend(v143, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintGreaterThanOrEqualToAnchor:constant:", v80, v21);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v81);

  objc_msgSend(v61, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, v21);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v85) = 1132003328;
  objc_msgSend(v84, "_ui_constraintWithPriority:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v86);

  objc_msgSend(v143, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, v21);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v90) = 1132003328;
  objc_msgSend(v89, "_ui_constraintWithPriority:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v91);

  objc_msgSend(v5, "centerXAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintGreaterThanOrEqualToAnchor:constant:", v93, 0.0);
  v94 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingRegionTrailingAnchorConstraint = self->_leadingRegionTrailingAnchorConstraint;
  self->_leadingRegionTrailingAnchorConstraint = v94;

  objc_msgSend(v6, "addObject:", self->_leadingRegionTrailingAnchorConstraint);
  objc_msgSend(v143, "leadingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:constant:", v97, 0.0);
  v98 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingRegionLeadingAnchorConstraint = self->_trailingRegionLeadingAnchorConstraint;
  self->_trailingRegionLeadingAnchorConstraint = v98;

  objc_msgSend(v6, "addObject:", self->_trailingRegionLeadingAnchorConstraint);
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v61);

  objc_msgSend(v142, "addObject:", v137);
  v100 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLeading"));
  v101 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v102 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v102, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v102, "setInterspace:", v19);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v101, "setHorizontalLayout:", v102);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v101, "setVerticalLayout:", v103);

  -[_UIStatusBarRegion setLayout:](v100, "setLayout:", v101);
  v104 = objc_alloc_init(UIView);
  -[_UIStatusBarRegion setContentView:](v100, "setContentView:", v104);

  -[_UIStatusBarRegion setOffsetable:](v100, "setOffsetable:", 1);
  -[_UIStatusBarRegion disableWithToken:](v100, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v100, "layoutItem");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "leadingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, v139);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v108);

  objc_msgSend(v105, "bottomAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:constant:", v110, v9);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v111);

  objc_msgSend(v105, "heightAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToConstant:", v140);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v113);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v105);
  objc_msgSend(v142, "addObject:", v100);

  v114 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedTrailing"));
  v115 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v116 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v116, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v116, "setInterspace:", v19);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v115, "setHorizontalLayout:", v116);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v115, "setVerticalLayout:", v117);

  -[_UIStatusBarRegion setLayout:](v114, "setLayout:", v115);
  v118 = objc_alloc_init(UIView);
  -[_UIStatusBarRegion setContentView:](v114, "setContentView:", v118);

  -[_UIStatusBarRegion setOffsetable:](v114, "setOffsetable:", 1);
  -[_UIStatusBarRegion disableWithToken:](v114, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v114, "layoutItem");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "leadingAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "trailingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:constant:", v121, v21);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v122);

  objc_msgSend(v119, "widthAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "widthAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v126) = 1131741184;
  objc_msgSend(v125, "_ui_constraintWithPriority:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v127);

  objc_msgSend(v119, "trailingAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:constant:", v129, -v141);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v130);

  objc_msgSend(v119, "bottomAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:constant:", v132, v9);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v133);

  objc_msgSend(v119, "heightAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToConstant:", v140);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v135);

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v119);
  objc_msgSend(v142, "addObject:", v114);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v6);
  return v142;
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
  _UIStatusBarDisplayItemPlacement *v15;
  _UIStatusBarDisplayItemPlacement *timePlacement;
  void *v17;
  void *v18;
  void *v19;
  _UIStatusBarDisplayItemPlacement *v20;
  _UIStatusBarDisplayItemPlacement *datePlacement;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _UIStatusBarVisualProvider_Pad *v30;
  _UIStatusBarDisplayItemPlacement *v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
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
  uint64_t v72;
  NSDictionary *v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  _UIStatusBarVisualProvider_Pad *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[2];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[2];
  void *v92;
  void *v93;
  _QWORD v94[4];
  _QWORD v95[3];
  _QWORD v96[3];
  uint64_t v97;
  _QWORD v98[3];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[3];

  v101[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    v79 = v4;
    +[_UIStatusBarCellularItem nameDisplayIdentifier](_UIStatusBarCellularExpandedItem, "nameDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 1003);
    v7 = objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarTimeItem shortTimeDisplayIdentifier](_UIStatusBarTimeItem, "shortTimeDisplayIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v8, 1200);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "excludingPlacements:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarTimeItem timeDisplayIdentifier](_UIStatusBarTimeItem, "timeDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v12, 1201);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v7;
    v100[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "excludingPlacements:", v14);
    v15 = (_UIStatusBarDisplayItemPlacement *)objc_claimAutoreleasedReturnValue();
    timePlacement = self->_timePlacement;
    self->_timePlacement = v15;

    +[_UIStatusBarTimeItem dateDisplayIdentifier](_UIStatusBarTimeItem, "dateDisplayIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v17, 700);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = self->_timePlacement;
    v99[1] = v11;
    v81 = (void *)v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requiringAnyPlacements:", v19);
    v20 = (_UIStatusBarDisplayItemPlacement *)objc_claimAutoreleasedReturnValue();
    datePlacement = self->_datePlacement;
    self->_datePlacement = v20;

    v80 = self;
    -[_UIStatusBarVisualProvider_Pad _updateDateAndTimePlacements](self, "_updateDateAndTimePlacements");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarNavigationItem, "defaultDisplayIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v23, 1103);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v24;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarPersonNameItem, "defaultDisplayIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v25, 1102);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "excludingPlacements:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v28;
    v98[2] = v7;
    v78 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v29);

    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_StatusBarShowsDateBeforeTime, (uint64_t)CFSTR("StatusBarShowsDateBeforeTime")) & 1) != 0|| !byte_1EDDA82D4)
    {
      v95[0] = v80->_timePlacement;
      v95[1] = v81;
      v30 = v80;
      v95[2] = v80->_datePlacement;
      v32 = v95;
    }
    else
    {
      v30 = v80;
      v31 = v80->_timePlacement;
      v96[0] = v80->_datePlacement;
      v96[1] = v31;
      v96[2] = v81;
      v32 = v96;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v33);

    v34 = objc_opt_class();
    +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:](_UIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:", 3500, 3200, v34, objc_opt_class(), 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_iOS bluetoothPaddingInset](v30, "bluetoothPaddingInset");
    +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 3400, 3100);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](_UIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", objc_msgSend(v82, "maximumPriority") + 1, objc_msgSend(v35, "minimumPriority") - 5);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v36, 3720);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarIndicatorLocationItem groupWithPriority:](_UIStatusBarIndicatorLocationItem, "groupWithPriority:", 3710);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v37, 3700);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v39, 3680);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "unstablePlacements");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObjectsFromArray:", v40);

    -[_UIStatusBarVisualProvider_iOS itemSpacing](v30, "itemSpacing");
    v83 = v35;
    +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", objc_msgSend(v35, "minimumPriority") - 2, 8.0 - (v41 + v41), 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v38;
    v77 = v38;
    v93 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "requiringAllPlacements:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "unstablePlacements");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "requiringAnyPlacements:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v47;
    v94[1] = v38;
    -[_UIStatusBarVisualProvider_iOS itemSpacing](v30, "itemSpacing");
    +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", objc_msgSend(v38, "priority") - 1, 8.0 - (v48 + v48), 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "requiringAllPlacements:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v51;
    v94[3] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObjectsFromArray:", v52);

    objc_msgSend(v86, "placements");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObjectsFromArray:", v53);

    v91[0] = v85;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v54, 3600);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "cellularGroup");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "placementsAffectedByAirplaneMode");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "excludingPlacements:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObjectsFromArray:", v59);

    objc_msgSend(v82, "placements");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObjectsFromArray:", v60);

    objc_msgSend(v83, "stablePlacements");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObjectsFromArray:", v61);

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorDisplayWarningItem, "defaultDisplayIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v62, 3730);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObject:", v63);

    objc_msgSend(v87, "placements");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObjectsFromArray:", v64);

    v89[0] = CFSTR("leading");
    v89[1] = CFSTR("trailing");
    v90[0] = v22;
    v90[1] = v76;
    v89[2] = CFSTR("center");
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarLockItem, "defaultDisplayIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v65, 2000);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v66;
    +[_UIStatusBarLockItem textDisplayIdentifier](_UIStatusBarLockItem, "textDisplayIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v67, 1999);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v90[2] = v69;
    v89[3] = CFSTR("expandedLeading");
    -[_UIStatusBarVisualProvider_iOS expandedLeadingPlacements](v80, "expandedLeadingPlacements");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v90[3] = v70;
    v89[4] = CFSTR("expandedTrailing");
    -[_UIStatusBarVisualProvider_iOS expandedTrailingPlacements](v80, "expandedTrailingPlacements");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v90[4] = v71;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 5);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = v80->_orderedDisplayItemPlacements;
    v80->_orderedDisplayItemPlacements = (NSDictionary *)v72;

    orderedDisplayItemPlacements = v80->_orderedDisplayItemPlacements;
    v4 = v79;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  return v74;
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
    if (!objc_msgSend(v3, "isEqual:", 0x1E176E800))
    {
      if ((objc_msgSend(v3, "isEqual:", 0x1E176E820) & 1) == 0
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
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
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
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
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
    v12.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    -[_UIStatusBarVisualProvider_iOS displayItemIdentifiersForPartWithIdentifier:](&v12, sel_displayItemIdentifiersForPartWithIdentifier_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  +[_UIStatusBarTimeItem shortTimeDisplayIdentifier](_UIStatusBarTimeItem, "shortTimeDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarTimeItem timeDisplayIdentifier](_UIStatusBarTimeItem, "timeDisplayIdentifier");
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  -[_UIStatusBarVisualProvider_iOS styleAttributesForStyle:](&v13, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  switch(v5)
  {
    case 2:
      goto LABEL_4;
    case 1:
      objc_msgSend(v4, "setIconScale:", 1.16);
      objc_msgSend(v4, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayScale");
      objc_msgSend(v4, "setIconSize:", 15);

      -[_UIStatusBarVisualProvider_Pad expandedFont](self, "expandedFont");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 0:
LABEL_4:
      objc_msgSend(v4, "setIconScale:", 1.0);
      objc_msgSend(v4, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayScale");
      objc_msgSend(v4, "setIconSize:", 14);

      -[_UIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = (void *)v7;
      objc_msgSend(v4, "setFont:", v7);

      break;
  }
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_StatusBarHasBoldTime, (uint64_t)CFSTR("StatusBarHasBoldTime")) & 1) != 0|| !byte_1EDDA82DC)
  {
    objc_msgSend(v4, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmphasizedFont:", v10);
  }
  else
  {
    -[_UIStatusBarVisualProvider_Pad normalFont](self, "normalFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmphasizedFont:", v11);

  }
  objc_msgSend(v4, "setImageNamePrefixes:", &unk_1E1A94A78);
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
  +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_Pad pillFont](self, "pillFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    -[_UIStatusBarVisualProvider_Pad pillSmallFont](self, "pillSmallFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSmallFont:", v9);

    -[_UIStatusBarVisualProvider_Pad pillSize](self, "pillSize");
LABEL_6:
    objc_msgSend(v7, "setIconScale:", v10 / 21.3333333);
    objc_msgSend(v7, "setSymbolScale:", 2);
    goto LABEL_7;
  }
  +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](_UIStatusBarExpandedPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_Pad expandedPillFont](self, "expandedPillFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v11);

    -[_UIStatusBarVisualProvider_Pad expandedPillFont](self, "expandedPillFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSmallFont:", v12);

    -[_UIStatusBarVisualProvider_Pad expandedPillSize](self, "expandedPillSize");
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
  _UIStatusBarRoundedCornerView *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  BOOL v17;
  _QWORD v18[2];

  v5 = a5;
  v6 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
LABEL_8:
    v15.receiver = self;
    v15.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    -[_UIStatusBarVisualProvider_iOS actionable:highlighted:initialPress:](&v15, sel_actionable_highlighted_initialPress_, v8, v6, v5);
    goto LABEL_9;
  }
  v9 = v8;
  v10 = v9;
  if (!v9)
    goto LABEL_8;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v12)
    goto LABEL_8;
  objc_msgSend(v10, "highlightView");
  v13 = (_UIStatusBarRoundedCornerView *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(_UIStatusBarRoundedCornerView);
    objc_msgSend(v10, "setHighlightView:", v13);
  }
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70___UIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke;
  v16[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v17 = v6;
  +[UIButton _setVisuallyHighlighted:forViews:initialPress:highlightBlock:](UIButton, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v6, v14, v5, v16);

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
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regionWithIdentifier:", CFSTR("leading"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionWithIdentifier:", CFSTR("trailing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
    v24 = (void *)MEMORY[0x1E0D156E0];
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
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v21);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v22);
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
      -[_UIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v39, v41, v43, v45);
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
  _UIStatusBarVisualProvider_Pad *v51;
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
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "regionWithIdentifier:", CFSTR("center"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEnabled");

    if ((v32 & 1) == 0)
    {
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "regionWithIdentifier:", CFSTR("leading"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEnabled");

      if ((v35 & 1) != 0)
      {
        -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
          -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
  *(_QWORD *)&r1.size.height = __70___UIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke;
  v50 = &unk_1E16B1B28;
  v51 = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &r1.origin.y);
}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  id v6;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avoidanceFrame");
  -[_UIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:");

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
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;

    if (width != v17 || height != v19)
      -[_UIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v8, v10, v12, v14);
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
    +[_UIStatusBarItem identifier](_UIStatusBarPillBackgroundActivityItem, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
    {
      v10 = v11;
      -[_UIStatusBarVisualProvider_Pad pillSize](self, "pillSize");
    }
    else
    {
      objc_msgSend(v11, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarItem identifier](_UIStatusBarVoiceControlPillItem, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
      {
        v10 = v11;
        -[_UIStatusBarVisualProvider_Pad smallPillSize](self, "smallPillSize");
      }
      else
      {
        objc_msgSend(v11, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarItem identifier](_UIStatusBarExpandedPillBackgroundActivityItem, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
          goto LABEL_10;
        v10 = v11;
        -[_UIStatusBarVisualProvider_Pad expandedPillSize](self, "expandedPillSize");
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

  _UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("StatusBarHidesDate"));
  v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("StatusBarHidesAMPM"));
  v6 = v4 ^ -[_UIStatusBarDisplayItemPlacement isEnabled](self->_datePlacement, "isEnabled");
  if ((v6 & 1) == 0)
    -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_datePlacement, "setEnabled:", v4 ^ 1u);
  if (v5 == -[_UIStatusBarDisplayItemPlacement isEnabled](self->_timePlacement, "isEnabled"))
  {
    -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_timePlacement, "setEnabled:", v5 ^ 1u);
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

  if (-[_UIStatusBarVisualProvider_Pad _updateDateAndTimePlacements](self, "_updateDateAndTimePlacements"))
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
  _UIKitUserDefaults();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    -[_UIStatusBarVisualProvider_Pad _dateTimePreferencesUpdated](self, "_dateTimePreferencesUpdated");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    -[_UIStatusBarVisualProvider_Pad observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
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

  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded")
    && -[_UIStatusBarVisualProvider_iOS wantsExpandedLeadingPlacements](self, "wantsExpandedLeadingPlacements"))
  {
    v37.receiver = self;
    v37.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    -[_UIStatusBarVisualProvider_iOS airplaneTravelOffsetInProposedPartWithIdentifier:animationType:](&v37, sel_airplaneTravelOffsetInProposedPartWithIdentifier_animationType_, a3, a4);
    return v7;
  }
  else
  {
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frameForDisplayItemWithIdentifier:", v9);
    v12 = v11;
    v35 = v13;
    v36 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v34 = v17;

    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
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

  if (!-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded")
    || !-[_UIStatusBarVisualProvider_iOS wantsExpandedLeadingPlacements](self, "wantsExpandedLeadingPlacements"))
  {
    return 160.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  -[_UIStatusBarVisualProvider_iOS airplaneSpeedForAnimationType:](&v6, sel_airplaneSpeedForAnimationType_, a3);
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  _BOOL4 v5;
  double result;
  objc_super v7;

  v5 = -[_UIStatusBarVisualProvider_iOS expanded](self, "expanded");
  result = 1.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    -[_UIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 1.0);
  }
  return result;
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

- (_UIStatusBarDisplayItemPlacement)datePlacement
{
  return self->_datePlacement;
}

- (void)setDatePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_datePlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)timePlacement
{
  return self->_timePlacement;
}

- (void)setTimePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_timePlacement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePlacement, 0);
  objc_storeStrong((id *)&self->_datePlacement, 0);
  objc_storeStrong((id *)&self->_leadingRegionTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_trailingRegionLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end
