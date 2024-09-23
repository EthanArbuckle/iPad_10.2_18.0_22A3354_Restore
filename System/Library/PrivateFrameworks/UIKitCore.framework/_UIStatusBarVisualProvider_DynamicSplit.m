@implementation _UIStatusBarVisualProvider_DynamicSplit

+ (double)height
{
  return 53.6666667;
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5;
  double Width;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGRect v13;

  v5 = a3;
  objc_msgSend(v5, "_unjailedReferenceBounds");
  Width = CGRectGetWidth(v13);
  objc_msgSend(v5, "_nativeScale");
  v8 = Width * v7;
  objc_msgSend(v5, "_scale");
  v10 = v9;

  if (v8 / v10 <= 393.0)
  {
    objc_opt_class();
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = a1;
  }
  return (Class)v11;
}

- (double)leadingItemSpacing
{
  return 2.66666667;
}

- (double)itemSpacing
{
  return 7.33333333;
}

+ (double)baseFontSize
{
  return 16.0;
}

+ (double)expandedFontSize
{
  double v2;

  objc_msgSend(a1, "baseFontSize");
  return v2 + 1.0;
}

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 20.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)normalRoundFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)qword_1ECD7AF08;
  if (qword_1ECD7AF08)
    v4 = _MergedGlobals_11_9 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    _MergedGlobals_11_9 = v2;
    objc_msgSend((id)objc_opt_class(), "baseFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:design:", *(_QWORD *)off_1E167DC00);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD7AF08;
    qword_1ECD7AF08 = v5;

    v3 = (void *)qword_1ECD7AF08;
  }
  return v3;
}

- (double)minimumBottomLeadingWidth
{
  double v3;
  double v4;
  double v5;

  -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaRect](self, "sensorAreaRect");
  v4 = v3;
  -[_UIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  return floor((v4 - (v5 + v5)) * 0.75);
}

- (double)bottomLeadingTopOffset
{
  return 3.0;
}

- (double)topLeadingCenterOffset
{
  return 7.66666667;
}

- (double)normalIconScale
{
  return 1.26;
}

- (double)expandedIconScale
{
  return 1.2992;
}

- (NSDirectionalEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 17.0;
  v4 = 0.0;
  v5 = 18.0;
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

- (double)cutoutEdgeInset
{
  return 8.0;
}

- (double)minimumItemScaleFactor
{
  return 0.94;
}

- (CGRect)sensorAreaRect
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveTargetScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_exclusionArea");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rect");
  v6 = v5;
  objc_msgSend(v3, "_nativeScale");
  v8 = v7 * v6;
  objc_msgSend(v3, "_scale");
  v10 = v8 / v9;
  objc_msgSend(v4, "rect");
  v12 = v11;
  objc_msgSend(v3, "_nativeScale");
  v14 = v13 * v12;
  objc_msgSend(v3, "_scale");
  v16 = v14 / v15;
  objc_msgSend(v4, "rect");
  v18 = v17;
  objc_msgSend(v3, "_nativeScale");
  v20 = v19 * v18;
  objc_msgSend(v3, "_scale");
  v22 = v20 / v21;
  objc_msgSend(v4, "rect");
  v24 = v23;
  objc_msgSend(v3, "_nativeScale");
  v26 = v25 * v24;
  objc_msgSend(v3, "_scale");
  v28 = v26 / v27;

  v29 = v10;
  v30 = v16;
  v31 = v22;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGSize)sensorAreaSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaRect](self, "sensorAreaRect");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)effectiveTargetDisplayWidth
{
  void *v2;
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveTargetScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_unjailedReferenceBounds");
  Width = CGRectGetWidth(v10);
  objc_msgSend(v3, "_nativeScale");
  v6 = Width * v5;
  objc_msgSend(v3, "_scale");
  v8 = v6 / v7;

  return v8;
}

- (double)sensorAreaCenterOffsetFromTrailing
{
  double v3;
  double v4;
  double MidX;
  void *v6;
  void *v7;
  uint64_t v8;
  double result;
  CGRect v10;

  -[_UIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth](self, "effectiveTargetDisplayWidth");
  v4 = v3;
  -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaRect](self, "sensorAreaRect");
  MidX = CGRectGetMidX(v10);
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "effectiveLayoutDirection");

  result = v4 - MidX;
  if (v8 == 1)
    return MidX;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  UILayoutGuide *v30;
  void *v31;
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
  UILayoutGuide *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _UIStatusBarRegion *v59;
  _UIStatusBarRegionAxesLayout *v60;
  _UIStatusBarRegionAxisSquishyLayout *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSLayoutConstraint *v67;
  NSLayoutConstraint *leadingCenterYConstraint;
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
  double v80;
  _UIStatusBarRegion *v81;
  _UIStatusBarRegionAxesLayout *v82;
  _UIStatusBarRegionAxisSquishyLayout *v83;
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
  double v103;
  _UIStatusBarRegion *v104;
  _UIStatusBarRegionAxesLayout *v105;
  _UIStatusBarRegionAxisCenteringLayout *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
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
  id v128;
  _UIStatusBarRegion *v129;
  _UIStatusBarRegionAxesLayout *v130;
  _UIStatusBarRegionAxisStackingLayout *v131;
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
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  double v155;
  double v156;
  double v157;
  double v158;
  id v159;
  double v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  id v165;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "height");
  v160 = v7;
  -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaRect](self, "sensorAreaRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaCenterOffsetFromTrailing](self, "sensorAreaCenterOffsetFromTrailing");
  v15 = v14;
  -[_UIStatusBarVisualProvider_DynamicSplit edgeInsets](self, "edgeInsets");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v155 = v22;
  -[_UIStatusBarVisualProvider_DynamicSplit expandedEdgeInsets](self, "expandedEdgeInsets");
  -[_UIStatusBarVisualProvider_DynamicSplit cutoutEdgeInset](self, "cutoutEdgeInset");
  v157 = v23;
  -[_UIStatusBarVisualProvider_DynamicSplit leadingItemSpacing](self, "leadingItemSpacing");
  v25 = v24;
  -[_UIStatusBarVisualProvider_DynamicSplit itemSpacing](self, "itemSpacing");
  v158 = v26;
  -[_UIStatusBarVisualProvider_Split normalFont](self, "normalFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "capHeight");
  v156 = v28 + 1.0;

  -[_UIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  -[_UIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "capHeight");

  v30 = objc_alloc_init(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v30, "setIdentifier:", CFSTR("UIStatusBarCutout"));
  -[UILayoutGuide topAnchor](v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v5;
  objc_msgSend(v5, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v34);

  objc_msgSend(v32, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerXAnchor](v30, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit setCutoutCenterConstraint:](self, "setCutoutCenterConstraint:", v37);

  -[_UIStatusBarVisualProvider_DynamicSplit cutoutCenterConstraint](self, "cutoutCenterConstraint");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v38);

  -[UILayoutGuide widthAnchor](v30, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", v11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit setCutoutWidthConstraint:](self, "setCutoutWidthConstraint:", v40);

  -[_UIStatusBarVisualProvider_DynamicSplit cutoutWidthConstraint](self, "cutoutWidthConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  -[UILayoutGuide heightAnchor](v30, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v43);

  objc_msgSend(v32, "addLayoutGuide:", v30);
  -[_UIStatusBarVisualProvider_Split setCutoutLayoutGuide:](self, "setCutoutLayoutGuide:", v30);

  v44 = objc_alloc_init(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v44, "setIdentifier:", CFSTR("UIStatusBarMainRegions"));
  -[UILayoutGuide trailingAnchor](v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v32;
  objc_msgSend(v32, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v49) = 1144750080;
  objc_msgSend(v48, "setPriority:", v49);
  objc_msgSend(v6, "addObject:", v48);
  -[UILayoutGuide widthAnchor](v44, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth](self, "effectiveTargetDisplayWidth");
  objc_msgSend(v50, "constraintEqualToConstant:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v52) = 1144750080;
  objc_msgSend(v51, "setPriority:", v52);
  objc_msgSend(v6, "addObject:", v51);
  -[UILayoutGuide heightAnchor](v44, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", v13);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v54);

  -[UILayoutGuide bottomAnchor](v44, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v58);

  v162 = v46;
  objc_msgSend(v46, "addLayoutGuide:", v44);

  -[_UIStatusBarVisualProvider_Split setMainRegionsLayoutGuide:](self, "setMainRegionsLayoutGuide:", v44);
  v59 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", 0x1E17152E0);
  v60 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v61 = objc_alloc_init(_UIStatusBarRegionAxisSquishyLayout);
  -[_UIStatusBarRegionAxisSquishyLayout setAlignment:](v61, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisSquishyLayout setInterspace:](v61, "setInterspace:", v25);
  -[_UIStatusBarRegionAxisSquishyLayout setCompressItems:](v61, "setCompressItems:", 1);
  -[_UIStatusBarRegionAxisSquishyLayout setMaxNumberOfItems:](v61, "setMaxNumberOfItems:", 3);
  -[_UIStatusBarRegionAxisSquishyLayout setMaxNumberOfVisibleItems:](v61, "setMaxNumberOfVisibleItems:", 3);
  -[_UIStatusBarVisualProvider_DynamicSplit minimumItemScaleFactor](self, "minimumItemScaleFactor");
  -[_UIStatusBarRegionAxisSquishyLayout setMinItemDynamicScale:](v61, "setMinItemDynamicScale:");
  -[_UIStatusBarRegionAxisSquishyLayout setMinInterspaceDynamicScale:](v61, "setMinInterspaceDynamicScale:", 0.6);
  -[_UIStatusBarRegionAxisSquishyLayout setDynamicHidingDelegate:](v61, "setDynamicHidingDelegate:", self);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v60, "setHorizontalLayout:", v61);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v60, "setVerticalLayout:", v62);

  -[_UIStatusBarRegion setLayout:](v59, "setLayout:", v60);
  -[_UIStatusBarRegion setActionInsets:](v59, "setActionInsets:", -v17, -v19, -(v160 + v21 - v13), -v155);
  -[_UIStatusBarRegion setDisableItemFrameBasedOverflow:](v59, "setDisableItemFrameBasedOverflow:", 1);
  -[_UIStatusBarRegion layoutItem](v59, "layoutItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "centerYAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "centerYAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, v17);
  v67 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingCenterYConstraint = self->_leadingCenterYConstraint;
  self->_leadingCenterYConstraint = v67;

  objc_msgSend(v6, "addObject:", self->_leadingCenterYConstraint);
  v69 = v63;
  objc_msgSend(v63, "heightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToConstant:", v156);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v71);

  objc_msgSend(v63, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, v19);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v75);

  v161 = v69;
  objc_msgSend(v69, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v78, -v157);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v80) = 1144750080;
  objc_msgSend(v79, "setPriority:", v80);
  objc_msgSend(v6, "addObject:", v79);
  objc_msgSend(v46, "_ui_addSubLayoutItem:", v69);

  objc_msgSend(v163, "addObject:", v59);
  v81 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", 0x1E1715300);
  v82 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v83 = objc_alloc_init(_UIStatusBarRegionAxisSquishyLayout);
  -[_UIStatusBarRegionAxisSquishyLayout setAlignment:](v83, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisSquishyLayout setInterspace:](v83, "setInterspace:", v158);
  -[_UIStatusBarRegionAxisSquishyLayout setMaxNumberOfItems:](v83, "setMaxNumberOfItems:", 3);
  -[_UIStatusBarRegionAxisSquishyLayout setMaxNumberOfVisibleItems:](v83, "setMaxNumberOfVisibleItems:", 3);
  -[_UIStatusBarVisualProvider_DynamicSplit minimumItemScaleFactor](self, "minimumItemScaleFactor");
  -[_UIStatusBarRegionAxisSquishyLayout setMinItemDynamicScale:](v83, "setMinItemDynamicScale:");
  -[_UIStatusBarRegionAxisSquishyLayout setMinInterspaceDynamicScale:](v83, "setMinInterspaceDynamicScale:", 0.6);
  -[_UIStatusBarRegionAxisSquishyLayout setDynamicHidingDelegate:](v83, "setDynamicHidingDelegate:", self);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v82, "setHorizontalLayout:", v83);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v82, "setVerticalLayout:", v84);

  -[_UIStatusBarRegion setLayout:](v81, "setLayout:", v82);
  -[_UIStatusBarRegion setActionInsets:](v81, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  -[_UIStatusBarRegion setDisableItemFrameBasedOverflow:](v81, "setDisableItemFrameBasedOverflow:", 1);
  -[_UIStatusBarRegion layoutItem](v81, "layoutItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setFont:", v87);

  -[_UIStatusBarVisualProvider_Split normalFont](self, "normalFont");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setSmallFont:", v88);

  objc_msgSend(v86, "setImageNamePrefixes:", &unk_1E1A94670);
  -[_UIStatusBarRegion setOverriddenStyleAttributes:](v81, "setOverriddenStyleAttributes:", v86);
  objc_msgSend(v85, "centerYAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "centerYAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v91, v17);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v92);

  objc_msgSend(v85, "heightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToConstant:", v156);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v94);

  objc_msgSend(v85, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v97, -v155);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v98);

  objc_msgSend(v85, "leadingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v101, v157);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v103) = 1144750080;
  objc_msgSend(v102, "setPriority:", v103);
  objc_msgSend(v6, "addObject:", v102);
  objc_msgSend(v162, "_ui_addSubLayoutItem:", v85);

  objc_msgSend(v163, "addObject:", v81);
  v104 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", 0x1E176D500);
  v105 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v106 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  -[_UIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v106, "setMaxNumberOfItems:", 3);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v105, "setHorizontalLayout:", v106);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v105, "setVerticalLayout:", v107);

  -[_UIStatusBarRegion setLayout:](v104, "setLayout:", v105);
  +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setImageNamePrefixes:", &unk_1E1A94688);
  -[_UIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setFont:", v109);

  -[_UIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setEmphasizedFont:", v110);

  objc_msgSend(v108, "setSymbolScale:", 2);
  -[_UIStatusBarRegion setOverriddenStyleAttributes:](v104, "setOverriddenStyleAttributes:", v108);
  -[_UIStatusBarRegion layoutItem](v104, "layoutItem");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v114);

  -[_UIStatusBarRegion layoutItem](v104, "layoutItem");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v118);

  -[_UIStatusBarRegion layoutItem](v104, "layoutItem");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "rightAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rightAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v122);

  -[_UIStatusBarRegion layoutItem](v104, "layoutItem");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "leftAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "leftAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v126);

  -[_UIStatusBarRegion layoutItem](v104, "layoutItem");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "_ui_addSubLayoutItem:", v127);

  objc_msgSend(v163, "addObject:", v104);
  v164 = v163;
  v165 = v6;
  -[_UIStatusBarVisualProvider_Split _setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:](self, "_setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:", v162, &v165, &v164, v13);
  v128 = v165;

  v159 = v164;
  v129 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", 0x1E176D4E0);
  v130 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v131 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v131, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v131, "setInterspace:", v158);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v130, "setHorizontalLayout:", v131);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v130, "setVerticalLayout:", v132);

  -[_UIStatusBarRegion setLayout:](v129, "setLayout:", v130);
  -[_UIStatusBarRegion setActionInsets:](v129, "setActionInsets:", -100.0, -12.0, -10.0, -12.0);
  -[_UIStatusBarRegion layoutItem](v129, "layoutItem");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "leadingAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "leadingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  objc_msgSend(v134, "constraintEqualToAnchor:constant:", v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "addObject:", v137);

  -[_UIStatusBarRegion layoutItem](v129, "layoutItem");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "trailingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "leadingAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  objc_msgSend(v139, "constraintEqualToAnchor:constant:", v141, -v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "addObject:", v143);

  -[_UIStatusBarRegion layoutItem](v129, "layoutItem");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "bottomAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "bottomAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit bottomLeadingTopOffset](self, "bottomLeadingTopOffset");
  objc_msgSend(v145, "constraintEqualToAnchor:constant:", v147, -v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "addObject:", v149);

  -[_UIStatusBarRegion layoutItem](v129, "layoutItem");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "heightAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "constraintEqualToConstant:", 13.3333333);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "addObject:", v152);

  -[_UIStatusBarRegion layoutItem](v129, "layoutItem");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "_ui_insertSubLayoutItem:atIndex:", v153, 0);

  objc_msgSend(v159, "addObject:", v129);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v128);

  return v159;
}

- (id)_orderedDisplayItemPlacements
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  objc_super v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[7];
  _QWORD v64[3];
  _QWORD v65[2];
  _QWORD v66[4];
  _QWORD v67[5];

  v67[3] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)_UIStatusBarVisualProvider_DynamicSplit;
  -[_UIStatusBarVisualProvider_Split _orderedDisplayItemPlacements](&v57, sel__orderedDisplayItemPlacements);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarIndicatorQuietModeItem emphasizedQuietModeIdentifier](_UIStatusBarIndicatorQuietModeItem, "emphasizedQuietModeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v3, 997);
  v4 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarIndicatorLocationItem groupWithPriority:](_UIStatusBarIndicatorLocationItem, "groupWithPriority:", 1000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarCellularItem nameDisplayIdentifier](_UIStatusBarCellularCondensedItem, "nameDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 1010);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prominentPlacement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v8;
  objc_msgSend(v5, "regularPlacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v9;
  v67[2] = v4;
  v10 = v4;
  v55 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excludingPlacements:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split setServiceNamePlacement:](self, "setServiceNamePlacement:", v12);

  +[_UIStatusBarCellularCondensedItem dualNameDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualNameDisplayIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v13, 1011);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prominentPlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v15;
  objc_msgSend(v5, "regularPlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v16;
  v66[2] = v10;
  -[_UIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "excludingPlacements:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split setDualServiceNamePlacement:](self, "setDualServiceNamePlacement:", v19);

  +[_UIStatusBarTimeItem shortTimeDisplayIdentifier](_UIStatusBarTimeItem, "shortTimeDisplayIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 1012);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v22;
  -[_UIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "excludingPlacements:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v26, 1014);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prominentPlacement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v28;
  objc_msgSend(v5, "regularPlacement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v29;
  v64[2] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "excludingPlacements:", v30);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v63[0] = v25;
  -[_UIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v52;
  -[_UIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v51;
  v62 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "requiringAllPlacements:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v48;
  v53 = v5;
  objc_msgSend(v5, "regularPlacement");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "excludingPlacements:", v46);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v25;
  v50 = (void *)v25;
  v60 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "requiringAllPlacements:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v34;
  objc_msgSend(v5, "prominentPlacement");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "excludingPlacements:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "requiringAllPlacements:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v39;
  v63[6] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v40, 0x1E17152E0);

  objc_msgSend(v54, "objectForKeyedSubscript:", 0x1E1715300);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v42, 1310);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "arrayByAddingObject:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v44, 0x1E1715300);

  return v54;
}

- (BOOL)_needsUpdateOfConstraintsForAvoidanceFrame:(CGRect)a3 cutoutOffset:(double *)a4 cutoutWidth:(double *)a5
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  double v14;
  CGFloat MidX;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  BOOL result;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaRect](self, "sensorAreaRect");
  if (width <= v12 + 20.0)
  {
    v19 = v12;
    -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaCenterOffsetFromTrailing](self, "sensorAreaCenterOffsetFromTrailing");
    MidX = v20;
    width = v19;
  }
  else
  {
    -[_UIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth](self, "effectiveTargetDisplayWidth");
    v14 = v13;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MidX = CGRectGetMidX(v27);
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "styleAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "effectiveLayoutDirection");

    if (v18 != 1)
      MidX = v14 - MidX;
  }
  result = 0;
  if (fabs(MidX) != INFINITY && fabs(width) != INFINITY)
  {
    -[_UIStatusBarVisualProvider_DynamicSplit cutoutCenterConstraint](self, "cutoutCenterConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constant");
    if (MidX == v23)
    {
      -[_UIStatusBarVisualProvider_DynamicSplit cutoutWidthConstraint](self, "cutoutWidthConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constant");
      v26 = v25;

      if (width == v26)
        return 0;
    }
    else
    {

    }
    if (a4)
      *a4 = MidX;
    if (a5)
      *a5 = width;
    return 1;
  }
  return result;
}

- (id)leadingItemCutoffWidths
{
  if (qword_1ECD7AF10 != -1)
    dispatch_once(&qword_1ECD7AF10, &__block_literal_global_442);
  return (id)qword_1ECD7AF18;
}

- (id)trailingItemCutoffWidths
{
  if (qword_1ECD7AF20 != -1)
    dispatch_once(&qword_1ECD7AF20, &__block_literal_global_64_0);
  return (id)qword_1ECD7AF28;
}

- (unint64_t)leadingNumberOfItemsForWidth:(double)a3
{
  void *v5;
  double v6;
  unint64_t v7;

  -[_UIStatusBarVisualProvider_DynamicSplit leadingItemCutoffWidths](self, "leadingItemCutoffWidths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit minimumItemScaleFactor](self, "minimumItemScaleFactor");
  v7 = numberOfItemsForWidth(v5, a3, v6);

  return v7;
}

- (unint64_t)trailingNumberOfItemsForWidth:(double)a3 includingPrivacyIndicator:(BOOL)a4
{
  void *v6;
  double v7;
  unint64_t v8;

  -[_UIStatusBarVisualProvider_DynamicSplit trailingItemCutoffWidths](self, "trailingItemCutoffWidths", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit minimumItemScaleFactor](self, "minimumItemScaleFactor");
  v8 = numberOfItemsForWidth(v6, a3, v7);

  return v8;
}

- (double)leadingScaleForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[_UIStatusBarVisualProvider_DynamicSplit leadingItemCutoffWidths](self, "leadingItemCutoffWidths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit minimumItemScaleFactor](self, "minimumItemScaleFactor");
  scaleForWidth(v4);
  v6 = v5;

  return v6;
}

- (double)trailingScaleForWidth:(double)a3 includingPrivacyIndicator:(BOOL)a4
{
  void *v5;
  double v6;
  double v7;

  -[_UIStatusBarVisualProvider_DynamicSplit trailingItemCutoffWidths](self, "trailingItemCutoffWidths", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_DynamicSplit minimumItemScaleFactor](self, "minimumItemScaleFactor");
  scaleForWidth(v5);
  v7 = v6;

  return v7;
}

- (void)updateDisplayItem:(id)a3 toDynamicallyHidden:(BOOL)a4 scale:(double)a5
{
  _BOOL4 v6;
  id v8;
  BSAnimationSettings *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  CGAffineTransform *v33;
  double v34;
  __int128 v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  _OWORD v38[3];
  CGAffineTransform v39;
  CGAffineTransform v40;
  _QWORD v41[4];
  id v42;
  double v43;
  _QWORD aBlock[4];
  id v45;
  uint64_t v46;
  double v47;
  BOOL v48;

  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "visible"))
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")&& self->_currentAnimationSettings&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = self->_currentAnimationSettings;
      -[BSAnimationSettings damping](v9, "damping");
      v11 = v10;
      if (v10 < 0.7)
      {
        v12 = (void *)MEMORY[0x1E0D01870];
        -[BSAnimationSettings mass](v9, "mass");
        v14 = v13;
        -[BSAnimationSettings stiffness](v9, "stiffness");
        v16 = v15;
        -[BSAnimationSettings epsilon](v9, "epsilon");
        v18 = v17;
        -[BSAnimationSettings initialVelocity](v9, "initialVelocity");
        objc_msgSend(v12, "settingsWithMass:stiffness:damping:epsilon:initialVelocity:", v14, v16, 0.7, v18, v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v9 = (BSAnimationSettings *)v20;
      }
      -[BSAnimationSettings mass](v9, "mass");
      v22 = v21;
      -[BSAnimationSettings stiffness](v9, "stiffness");
      v24 = v23;
      -[BSAnimationSettings damping](v9, "damping");
      v26 = v25;
      -[BSAnimationSettings initialVelocity](v9, "initialVelocity");
      v28 = v27;
      objc_opt_self();
      _durationOfSpringAnimation(v22, v24, v26, v28);
      v30 = v29;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __87___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke;
      aBlock[3] = &unk_1E16DC4C0;
      v48 = v6;
      v45 = v8;
      v46 = v30;
      v47 = a5;
      v31 = _Block_copy(aBlock);
      v32 = v31;
      if (v11 >= 0.7)
        (*((void (**)(void *, uint64_t))v31 + 2))(v31, 1);
      else
        objc_msgSend(MEMORY[0x1E0D016B0], "tryAnimatingWithSettings:fromCurrentState:actions:completion:", v9, 1, v31, 0);

    }
    else
    {
      v34 = 0.25;
      if (!v6)
        v34 = 0.5;
      _UIStatusBarDynamicSplitPerformBaseAnimation(v8, v6, 1, 1, 0, 0.5, v34, 0.0);
      if (!v6)
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __87___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke_81;
        v41[3] = &unk_1E16B1888;
        v42 = v8;
        v43 = a5;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v41, 0, 0.25, 0.0);

      }
    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v8, "setDynamicHidingAlpha:", 0.0);
      CGAffineTransformMakeScale(&v40, 0.5, 0.5);
      v39 = v40;
      v33 = &v39;
    }
    else
    {
      objc_msgSend(v8, "setDynamicHidingAlpha:", 1.0);
      v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v38[0] = *MEMORY[0x1E0C9BAA8];
      v38[1] = v35;
      v38[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v33 = (CGAffineTransform *)v38;
    }
    objc_msgSend(v8, "setDynamicHidingTransform:", v33);
    CGAffineTransformMakeScale(&v37, a5, a5);
    v36 = v37;
    objc_msgSend(v8, "setDynamicScaleTransform:", &v36);
  }

}

- (void)updateDisplayItem:(id)a3 toScale:(double)a4
{
  id v6;
  BSAnimationSettings *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  BSAnimationSettings *v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  _QWORD v24[4];
  id v25;
  double v26;

  v6 = a3;
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")&& self->_currentAnimationSettings&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = self->_currentAnimationSettings;
    -[BSAnimationSettings damping](v7, "damping");
    if (v8 >= 0.7)
    {
      CGAffineTransformMakeScale(&v23, a4, a4);
      v22 = v23;
      objc_msgSend(v6, "setDynamicScaleTransform:", &v22);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0D01870];
      -[BSAnimationSettings mass](v7, "mass");
      v11 = v10;
      -[BSAnimationSettings stiffness](v7, "stiffness");
      v13 = v12;
      -[BSAnimationSettings epsilon](v7, "epsilon");
      v15 = v14;
      -[BSAnimationSettings initialVelocity](v7, "initialVelocity");
      objc_msgSend(v9, "settingsWithMass:stiffness:damping:epsilon:initialVelocity:", v11, v13, 0.7, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0D016B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __69___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke;
      v24[3] = &unk_1E16B7A60;
      v25 = v6;
      v26 = a4;
      objc_msgSend(v18, "tryAnimatingWithSettings:fromCurrentState:actions:completion:", v17, 1, v24, 0);

      v7 = (BSAnimationSettings *)v17;
    }
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke_2;
    v19[3] = &unk_1E16B1888;
    v20 = (BSAnimationSettings *)v6;
    v21 = a4;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v19, 0, 0.25, 0.0);
    v7 = v20;
  }

}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  BSAnimationSettings *currentAnimationSettings;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  _BOOL4 v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  _BOOL4 v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  id v87;
  void *v88;
  _UIStatusBarVisualProvider_DynamicSplit *val;
  id obj;
  _QWORD v91[5];
  _QWORD v92[5];
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  id v97[6];
  id location;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  double v103;
  double v104;
  _BYTE v105[128];
  uint64_t v106;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v106 = *MEMORY[0x1E0C80C00];
  v87 = a4;
  -[_UIStatusBarVisualProvider_DynamicSplit setDeferredAvoidanceFrameUpdateBlock:](self, "setDeferredAvoidanceFrameUpdateBlock:", 0);
  v10 = _avoidanceFrameInLocalCoordinateSpace(self);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  val = self;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0.0;
  v104 = 0.0;
  v83 = -[_UIStatusBarVisualProvider_DynamicSplit _needsUpdateOfConstraintsForAvoidanceFrame:cutoutOffset:cutoutWidth:](self, "_needsUpdateOfConstraintsForAvoidanceFrame:cutoutOffset:cutoutWidth:", &v104, &v103, v10, v12, v14, v16);
  objc_msgSend(v88, "currentAggregatedData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[_UIStatusBarVisualProvider_DynamicSplit _updateSystemNavigationWithData:avoidanceFrame:](val, "_updateSystemNavigationWithData:avoidanceFrame:", v17, v10, v12, v14, v16);

  v18 = (id)_statusBarRunningAnimations;
  -[_UIStatusBarVisualProvider_iOS statusBar](val, "statusBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](val, "regionIdentifiersForPartWithIdentifier:", 0x1E176E800);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayItemIdentifiersInRegionsWithIdentifiers:", v21);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v18;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v100 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v25, "displayItemIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarIndicatorQuietModeItem emphasizedQuietModeIdentifier](_UIStatusBarIndicatorQuietModeItem, "emphasizedQuietModeIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v26, "isEqual:", v27) & 1) != 0)
        {
          objc_msgSend(v25, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", 0x1E176CBA0);

          if ((v29 & 1) == 0)
          {
            objc_initWeak(&location, val);
            v64 = MEMORY[0x1E0C809B0];
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke;
            v95[3] = &unk_1E16DC4E8;
            objc_copyWeak(v97, &location);
            v97[1] = *(id *)&x;
            v97[2] = *(id *)&y;
            v97[3] = *(id *)&width;
            v97[4] = *(id *)&height;
            v96 = v87;
            v97[5] = (id)a5;
            -[_UIStatusBarVisualProvider_DynamicSplit setDeferredAvoidanceFrameUpdateBlock:](val, "setDeferredAvoidanceFrameUpdateBlock:", v95);
            v93[0] = v64;
            v93[1] = 3221225472;
            v93[2] = __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_2;
            v93[3] = &unk_1E16B3F40;
            objc_copyWeak(&v94, &location);
            objc_msgSend(v25, "addTotalCompletionHandler:", v93);
            objc_destroyWeak(&v94);

            objc_destroyWeak(v97);
            objc_destroyWeak(&location);
            v65 = obj;
            goto LABEL_39;
          }
        }
        else
        {

        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
    }
    while (v22);
  }

  if (v83)
  {
    if (v87 || (a5 & 2) != 0)
      v30 = v87;
    currentAnimationSettings = val->_currentAnimationSettings;
    val->_currentAnimationSettings = (BSAnimationSettings *)v87;

    if ((a5 & 1) == 0)
    {
      -[_UIStatusBarVisualProvider_DynamicSplit edgeInsets](val, "edgeInsets");
      v33 = v32;
      v35 = v34;
      -[_UIStatusBarVisualProvider_DynamicSplit cutoutEdgeInset](val, "cutoutEdgeInset");
      v37 = v36;
      -[_UIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth](val, "effectiveTargetDisplayWidth");
      v39 = v38;
      objc_msgSend(v88, "regionWithIdentifier:", 0x1E17152E0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "displayItems");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = fmax(v39 - v104 + v103 * -0.5 - v33 - v37, 0.0);
      -[_UIStatusBarVisualProvider_DynamicSplit leadingScaleForWidth:](val, "leadingScaleForWidth:", v42);
      v44 = v43;
      v45 = -[_UIStatusBarVisualProvider_DynamicSplit leadingNumberOfItemsForWidth:](val, "leadingNumberOfItemsForWidth:", v42);
      objc_msgSend(v40, "layout");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "horizontalLayout");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45 != objc_msgSend(v84, "maxNumberOfVisibleItems")
        || (objc_msgSend(v84, "itemDynamicScale"), vabdd_f64(v44, v46) > 0.0001))
      {
        objc_msgSend(v84, "setMaxNumberOfVisibleItems:", v45);
        objc_msgSend(v84, "setItemDynamicScale:", v44);
        objc_msgSend(v40, "setNeedsReLayout:", 1);
        objc_msgSend(v82, "invalidate");
      }
      objc_msgSend(v88, "regionWithIdentifier:", 0x1E1715300);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "displayItems");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v103;
      v48 = v104;
      objc_msgSend(v88, "currentAggregatedData");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "sensorActivityEntry");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = fmax(v48 + v49 * -0.5 - v35 - v37, 0.0);
      -[_UIStatusBarVisualProvider_DynamicSplit trailingScaleForWidth:includingPrivacyIndicator:](val, "trailingScaleForWidth:includingPrivacyIndicator:", objc_msgSend(v51, "isEnabled"), v52);
      v54 = v53;

      objc_msgSend(v88, "currentAggregatedData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "sensorActivityEntry");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[_UIStatusBarVisualProvider_DynamicSplit trailingNumberOfItemsForWidth:includingPrivacyIndicator:](val, "trailingNumberOfItemsForWidth:includingPrivacyIndicator:", objc_msgSend(v56, "isEnabled"), v52);

      objc_msgSend(v47, "layout");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "horizontalLayout");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57 != objc_msgSend(v59, "maxNumberOfVisibleItems")
        || (objc_msgSend(v59, "itemDynamicScale"), vabdd_f64(v54, v60) > 0.0001))
      {
        objc_msgSend(v59, "setMaxNumberOfVisibleItems:", v57);
        objc_msgSend(v59, "setItemDynamicScale:", v54);
        objc_msgSend(v47, "setNeedsReLayout:", 1);
        objc_msgSend(v58, "invalidate");
      }
      -[_UIStatusBarVisualProvider_iOS statusBar](val, "statusBar");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "regions");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectForKeyedSubscript:", 0x1E176D500);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57 < 2)
        objc_msgSend(v63, "disableWithToken:", 13);
      else
        objc_msgSend(v63, "enableWithToken:", 13);

    }
    v66 = v104;
    -[_UIStatusBarVisualProvider_DynamicSplit cutoutCenterConstraint](val, "cutoutCenterConstraint");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constant");
    v69 = v66 != v68;

    if (v69)
    {
      v70 = v104;
      -[_UIStatusBarVisualProvider_DynamicSplit cutoutCenterConstraint](val, "cutoutCenterConstraint");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setConstant:", v70);

    }
    v72 = v103;
    -[_UIStatusBarVisualProvider_DynamicSplit cutoutWidthConstraint](val, "cutoutWidthConstraint");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constant");
    v75 = v72 != v74;

    if (v75)
    {
      v76 = v103;
      -[_UIStatusBarVisualProvider_DynamicSplit cutoutWidthConstraint](val, "cutoutWidthConstraint");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setConstant:", v76);

    }
    if ((a5 & 2) != 0)
    {
      -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](val, "cutoutLayoutGuide");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "owningView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "layoutSubviews");

    }
    else if (v87)
    {
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_3;
      v92[3] = &unk_1E16B3FD8;
      v92[4] = val;
      objc_msgSend(MEMORY[0x1E0D016B0], "tryAnimatingWithSettings:fromCurrentState:actions:completion:", v87, 1, v92, 0);
    }
    else
    {
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_4;
      v91[3] = &unk_1E16B1B28;
      v91[4] = val;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v91);
    }
    v65 = val->_currentAnimationSettings;
    val->_currentAnimationSettings = 0;
    goto LABEL_39;
  }
  if (v81)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](val, "statusBar");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
LABEL_39:

  }
}

- (id)region:(id)a3 willSetDisplayItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", 0x1E1715300))
  {

  }
  else
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", 0x1E17152E0);

    if (!v9)
      goto LABEL_14;
  }
  v26 = v5;
  v27 = v6;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    v14 = *MEMORY[0x1E0CD2C88];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "view", v26, v27, (_QWORD)v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "filters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setValue:forKey:", &unk_1E1A95D30, CFSTR("inputRadius"));
          objc_msgSend(v21, "setName:", CFSTR("gaussianBlur"));
          v32 = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "layer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setFilters:", v22);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v12);
  }

  v5 = v26;
  v6 = v27;
LABEL_14:

  return v6;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarVisualProvider_DynamicSplit;
  if (-[_UIStatusBarVisualProvider_Split hasCustomAnimationForDisplayItemWithIdentifier:removal:](&v17, sel_hasCustomAnimationForDisplayItemWithIdentifier_removal_, v6, 0))
  {
    goto LABEL_4;
  }
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", 0x1E176E800);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayItemIdentifiersInRegionsWithIdentifiers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v6);

  if (!v12)
  {
LABEL_4:
    v16.receiver = self;
    v16.super_class = (Class)_UIStatusBarVisualProvider_DynamicSplit;
    -[_UIStatusBarVisualProvider_Split additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v16, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _UIStatusBarDynamicSplitDefaultAnimation(self, v6);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarVisualProvider_DynamicSplit;
  if (-[_UIStatusBarVisualProvider_Split hasCustomAnimationForDisplayItemWithIdentifier:removal:](&v17, sel_hasCustomAnimationForDisplayItemWithIdentifier_removal_, v6, 1))
  {
    goto LABEL_4;
  }
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", 0x1E176E800);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayItemIdentifiersInRegionsWithIdentifiers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v6);

  if (!v12)
  {
LABEL_4:
    v16.receiver = self;
    v16.super_class = (Class)_UIStatusBarVisualProvider_DynamicSplit;
    -[_UIStatusBarVisualProvider_Split removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v16, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _UIStatusBarDynamicSplitDefaultAnimation(self, v6);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = (void *)v5;
  +[_UIStatusBarBatteryItem staticIconDisplayIdentifier](_UIStatusBarBatteryItem, "staticIconDisplayIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
LABEL_5:
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_DynamicSplit normalRoundFont](self, "normalRoundFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarVisualProvider_DynamicSplit;
  -[_UIStatusBarVisualProvider_Split overriddenStyleAttributesForDisplayItemWithIdentifier:](&v11, sel_overriddenStyleAttributesForDisplayItemWithIdentifier_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAggregatedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIStatusBarVisualProvider_Split _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v5);

  if (v6)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

- (void)dataUpdated:(id)a3
{
  id v4;
  BOOL v5;
  _BOOL4 v6;
  id v7;

  v4 = a3;
  v5 = -[_UIStatusBarVisualProvider_DynamicSplit _updateSystemNavigationWithData:avoidanceFrame:](self, "_updateSystemNavigationWithData:avoidanceFrame:", v4, _avoidanceFrameInLocalCoordinateSpace(self));
  v6 = -[_UIStatusBarVisualProvider_Split _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

  if (v5 || v6)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

- (BOOL)_updateSystemNavigationWithData:(id)a3 avoidanceFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  char v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double MaxX;
  double MinX;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_shouldReverseLayoutDirection");

  -[_UIStatusBarVisualProvider_DynamicSplit sensorAreaRect](self, "sensorAreaRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v46.origin.x = v13;
  v46.origin.y = v15;
  v46.size.width = v17;
  v46.size.height = v19;
  if (!CGRectIntersectsRect(v42, v46))
  {
    height = v19;
    width = v17;
    y = v15;
    x = v13;
  }
  if ((v11 & 1) != 0)
  {
    -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutFrame");
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    MinX = MaxX - CGRectGetMaxX(v44);

  }
  else
  {
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MinX = CGRectGetMinX(v45);
  }
  -[_UIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  v24 = MinX - (v23 + v23);
  -[_UIStatusBarVisualProvider_DynamicSplit minimumBottomLeadingWidth](self, "minimumBottomLeadingWidth");
  v26 = v25;
  objc_msgSend(v9, "backNavigationEntry");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v26 > v24 || v27 != 0;

  if (v29)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "regions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", 0x1E176D4E0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "regions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", 0x1E17152E0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "action");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIStatusBarVisualProvider_DynamicSplit edgeInsets](self, "edgeInsets");
    v38 = v37;
    objc_msgSend(v9, "backNavigationEntry");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = objc_msgSend(v39, "isEnabled");

    if ((_DWORD)v34 && v26 <= v24)
    {
      -[_UIStatusBarVisualProvider_DynamicSplit topLeadingCenterOffset](self, "topLeadingCenterOffset");
      -[NSLayoutConstraint setConstant:](self->_leadingCenterYConstraint, "setConstant:", v38 - v40);
      objc_msgSend(v36, "setEnabled:", 0);
      objc_msgSend(v32, "enableWithToken:", 13);
    }
    else
    {
      -[NSLayoutConstraint setConstant:](self->_leadingCenterYConstraint, "setConstant:", v38);
      objc_msgSend(v36, "setEnabled:", 1);
      objc_msgSend(v32, "disableWithToken:", 13);
    }

  }
  return v29;
}

- (NSLayoutConstraint)cutoutWidthConstraint
{
  return self->_cutoutWidthConstraint;
}

- (void)setCutoutWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cutoutWidthConstraint, a3);
}

- (NSLayoutConstraint)cutoutCenterConstraint
{
  return self->_cutoutCenterConstraint;
}

- (void)setCutoutCenterConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cutoutCenterConstraint, a3);
}

- (NSLayoutConstraint)leadingCenterYConstraint
{
  return self->_leadingCenterYConstraint;
}

- (void)setLeadingCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingCenterYConstraint, a3);
}

- (id)deferredAvoidanceFrameUpdateBlock
{
  return self->_deferredAvoidanceFrameUpdateBlock;
}

- (void)setDeferredAvoidanceFrameUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BSAnimationSettings)currentAnimationSettings
{
  return self->_currentAnimationSettings;
}

- (void)setCurrentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnimationSettings, 0);
  objc_storeStrong(&self->_deferredAvoidanceFrameUpdateBlock, 0);
  objc_storeStrong((id *)&self->_leadingCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_cutoutCenterConstraint, 0);
  objc_storeStrong((id *)&self->_cutoutWidthConstraint, 0);
}

@end
