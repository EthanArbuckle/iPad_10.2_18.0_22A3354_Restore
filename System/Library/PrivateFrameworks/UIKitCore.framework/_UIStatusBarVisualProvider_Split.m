@implementation _UIStatusBarVisualProvider_Split

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS____UIStatusBarVisualProvider_Split;
    objc_msgSendSuper2(&v5, sel_intrinsicContentSizeForOrientation_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 1;
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5;
  id v6;
  CGFloat Width;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  CGFloat v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[10];
  CGRect v28;

  v27[9] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_nativeDisplayBounds");
  Width = CGRectGetWidth(v28);
  objc_msgSend(v5, "_exclusionArea");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rect");
  v10 = v9;
  v12 = v11;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  v27[4] = objc_opt_class();
  v27[5] = objc_opt_class();
  v27[6] = objc_opt_class();
  v27[7] = objc_opt_class();
  v27[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87___UIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke;
  v17[3] = &unk_1E16E15E8;
  v20 = Width;
  v14 = v5;
  v21 = v10;
  v22 = v12;
  v18 = v14;
  v19 = &v23;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
  v15 = (id)v24[3];

  _Block_object_dispose(&v23, 8);
  return (Class)v15;
}

+ (double)height
{
  return 47.0;
}

- (double)itemSpacing
{
  return 4.33333333;
}

+ (double)baseFontSize
{
  return 15.0;
}

+ (double)expandedFontSize
{
  double v2;

  objc_msgSend(a1, "baseFontSize");
  return v2 + 2.0;
}

+ (double)LTEAPlusFontSize
{
  return 13.0;
}

+ (BOOL)shrinksSingleCharacterTypes
{
  return 0;
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

- (UIFont)normalFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)qword_1ECD77950;
  if (qword_1ECD77950)
    v4 = _MergedGlobals_20 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    _MergedGlobals_20 = v2;
    objc_msgSend((id)objc_opt_class(), "baseFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD77950;
    qword_1ECD77950 = v5;

    v3 = (void *)qword_1ECD77950;
  }
  return (UIFont *)v3;
}

- (UIFont)expandedFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD77958;
  if (unk_1ECD77958)
    v4 = byte_1ECD77941 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77941 = v2;
    objc_msgSend((id)objc_opt_class(), "expandedFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD77958;
    unk_1ECD77958 = v5;

    v3 = (void *)unk_1ECD77958;
  }
  return (UIFont *)v3;
}

- (UIFont)emphasizedFont
{
  int v2;
  void *v3;
  BOOL v4;
  double v5;
  uint64_t v6;
  void *v7;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD77960;
  if (unk_1ECD77960)
    v4 = byte_1ECD77942 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77942 = v2;
    objc_msgSend((id)objc_opt_class(), "baseFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", v5 + 2.0, *(double *)off_1E167DC78);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)unk_1ECD77960;
    unk_1ECD77960 = v6;

    v3 = (void *)unk_1ECD77960;
  }
  return (UIFont *)v3;
}

- (UIFont)smallFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD77968;
  if (unk_1ECD77968)
    v4 = byte_1ECD77943 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77943 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 11.0, *(double *)off_1E167DC68);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD77968;
    unk_1ECD77968 = v5;

    v3 = (void *)unk_1ECD77968;
  }
  return (UIFont *)v3;
}

- (UIFont)voiceControlFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD77970;
  if (unk_1ECD77970)
    v4 = byte_1ECD77944 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77944 = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 13.0, *(double *)off_1E167DC68);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD77970;
    unk_1ECD77970 = v5;

    v3 = (void *)unk_1ECD77970;
  }
  return (UIFont *)v3;
}

- (UIFont)systemUpdateFont
{
  int v2;
  void *v3;
  BOOL v4;
  double v5;
  uint64_t v6;
  void *v7;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD77978;
  if (unk_1ECD77978)
    v4 = byte_1ECD77945 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77945 = v2;
    objc_msgSend((id)objc_opt_class(), "baseFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", v5 + 2.0, *(double *)off_1E167DC68);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)unk_1ECD77978;
    unk_1ECD77978 = v6;

    v3 = (void *)unk_1ECD77978;
  }
  return (UIFont *)v3;
}

- (double)baselineBottomInset
{
  return 1.66666667;
}

- (double)lowerExpandedBaselineOffset
{
  return 25.0;
}

- (double)bottomLeadingSpace
{
  return 12.0;
}

- (double)bottomLeadingTopOffset
{
  return 7.33333333;
}

- (double)normalIconScale
{
  return 1.12;
}

- (double)expandedIconScale
{
  return 1.2992;
}

- (int64_t)normalIconSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  int64_t v8;

  -[_UIStatusBarVisualProvider_Split normalIconScale](self, "normalIconScale");
  v4 = v3;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveTargetScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scale");
  if (v7 <= 2.5)
  {
    if (v4 == 1.07)
    {
      v8 = 5;
    }
    else if (v4 == 1.16)
    {
      v8 = 9;
    }
    else if (v4 == 1.2412)
    {
      v8 = 11;
    }
    else
    {
      v8 = 1;
    }
  }
  else if (v4 == 1.08)
  {
    v8 = 6;
  }
  else if (v4 == 1.06)
  {
    v8 = 4;
  }
  else if (v4 == 1.12)
  {
    v8 = 7;
  }
  else if (v4 == 1.26)
  {
    v8 = 8;
  }
  else if (v4 == 1.16)
  {
    v8 = 10;
  }
  else if (v4 == 1.2412)
  {
    v8 = 12;
  }
  else if (v4 == 1.2992)
  {
    v8 = 13;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (int64_t)expandedIconSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  int64_t v8;

  -[_UIStatusBarVisualProvider_Split expandedIconScale](self, "expandedIconScale");
  v4 = v3;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveTargetScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scale");
  if (v7 <= 2.5)
  {
    if (v4 == 1.07)
    {
      v8 = 5;
    }
    else if (v4 == 1.16)
    {
      v8 = 9;
    }
    else if (v4 == 1.2412)
    {
      v8 = 11;
    }
    else
    {
      v8 = 1;
    }
  }
  else if (v4 == 1.08)
  {
    v8 = 6;
  }
  else if (v4 == 1.06)
  {
    v8 = 4;
  }
  else if (v4 == 1.12)
  {
    v8 = 7;
  }
  else if (v4 == 1.26)
  {
    v8 = 8;
  }
  else if (v4 == 1.16)
  {
    v8 = 10;
  }
  else if (v4 == 1.2412)
  {
    v8 = 12;
  }
  else if (v4 == 1.2992)
  {
    v8 = 13;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (double)expandedEdgeInset
{
  return 7.0;
}

- (double)cornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveTargetScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_displayCornerRadius");
  v5 = v4;
  objc_msgSend(v3, "_nativeScale");
  v7 = v5 * v6;
  objc_msgSend(v3, "_scale");
  v9 = v7 / v8;

  return v9;
}

- (void)_setupExpandedRegionsInContainerView:(id)a3 sensorHeight:(double)a4 constraints:(id *)a5 regions:(id *)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  _UIStatusBarRegion *v22;
  _UIStatusBarRegionAxesLayout *v23;
  _UIStatusBarRegionAxisStackingLayout *v24;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  _UIStatusBarRegion *v39;
  _UIStatusBarRegionAxesLayout *v40;
  _UIStatusBarRegionAxisStackingLayout *v41;
  void *v42;
  UIView *v43;
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
  double v61;
  void *v62;
  double v63;
  double v64;
  _UIStatusBarRegion *v65;
  _UIStatusBarRegionAxesLayout *v66;
  _UIStatusBarRegionAxisStackingLayout *v67;
  void *v68;
  UIView *v69;
  void *v70;
  void *v71;
  void *v72;
  NSLayoutConstraint *v73;
  NSLayoutConstraint *expandedLeadingLowerTopConstraint;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _UIStatusBarRegion *v83;
  _UIStatusBarRegionAxesLayout *v84;
  _UIStatusBarRegionAxisStackingLayout *v85;
  void *v86;
  UIView *v87;
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
  NSLayoutConstraint *v102;
  NSLayoutConstraint *expandedTrailingBottomConstraint;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v117;
  id v118;
  id v119;

  v9 = *a5;
  v118 = *a6;
  v119 = v9;
  v10 = a3;
  -[_UIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  v12 = v11;
  -[_UIStatusBarVisualProvider_Split baselineBottomInset](self, "baselineBottomInset");
  v14 = v13;
  -[_UIStatusBarVisualProvider_Split expandedEdgeInsets](self, "expandedEdgeInsets");
  v16 = v15;
  v18 = v17;
  -[_UIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "capHeight");
  v21 = v20;

  v22 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLeading"));
  v23 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v24 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v24, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v24, "setInterspace:", v12);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v23, "setHorizontalLayout:", v24);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v23, "setVerticalLayout:", v25);

  -[_UIStatusBarRegion setLayout:](v22, "setLayout:", v23);
  v26 = objc_alloc_init(UIView);
  -[_UIStatusBarRegion setContentView:](v22, "setContentView:", v26);

  -[_UIStatusBarRegion setOffsetable:](v22, "setOffsetable:", 1);
  -[_UIStatusBarRegion disableWithToken:](v22, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v22, "layoutItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v30);

  objc_msgSend(v27, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = a4 - v14;
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 1147207680;
  objc_msgSend(v34, "_ui_constraintWithPriority:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v36);

  v117 = v27;
  objc_msgSend(v27, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", v21);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v38);

  objc_msgSend(v10, "_ui_addSubLayoutItem:", v27);
  objc_msgSend(v118, "addObject:", v22);

  v39 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedTrailing"));
  v40 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v41 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v41, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v41, "setInterspace:", v12);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v40, "setHorizontalLayout:", v41);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v40, "setVerticalLayout:", v42);

  -[_UIStatusBarRegion setLayout:](v39, "setLayout:", v40);
  v43 = objc_alloc_init(UIView);
  -[_UIStatusBarRegion setContentView:](v39, "setContentView:", v43);

  -[_UIStatusBarRegion setOffsetable:](v39, "setOffsetable:", 1);
  -[_UIStatusBarRegion disableWithToken:](v39, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v39, "layoutItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -v18);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v47);

  objc_msgSend(v44, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, v33);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = 1147207680;
  objc_msgSend(v50, "_ui_constraintWithPriority:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v52);

  objc_msgSend(v44, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", v21);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v54);

  objc_msgSend(v44, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, v12);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v57);

  objc_msgSend(v44, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = 1131741184;
  objc_msgSend(v60, "_ui_constraintWithPriority:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v62);

  objc_msgSend(v10, "_ui_addSubLayoutItem:", v44);
  objc_msgSend(v118, "addObject:", v39);

  -[_UIStatusBarVisualProvider_Split lowerExpandedBaselineOffset](self, "lowerExpandedBaselineOffset");
  v64 = v63;
  v65 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerLeading"));
  v66 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v67 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v67, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v67, "setInterspace:", v12);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v66, "setHorizontalLayout:", v67);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v66, "setVerticalLayout:", v68);

  -[_UIStatusBarRegion setLayout:](v65, "setLayout:", v66);
  v69 = objc_alloc_init(UIView);
  -[_UIStatusBarRegion setContentView:](v65, "setContentView:", v69);

  -[_UIStatusBarRegion setOffsetable:](v65, "setOffsetable:", 1);
  -[_UIStatusBarRegion disableWithToken:](v65, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v65, "layoutItem");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, v33);
  v73 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedLeadingLowerTopConstraint = self->_expandedLeadingLowerTopConstraint;
  self->_expandedLeadingLowerTopConstraint = v73;

  objc_msgSend(v70, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, v16);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v77);

  objc_msgSend(v70, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, v64);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v80);

  objc_msgSend(v70, "heightAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToConstant:", v21);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v82);

  objc_msgSend(v119, "addObject:", self->_expandedLeadingLowerTopConstraint);
  v115 = v10;
  objc_msgSend(v10, "_ui_addSubLayoutItem:", v70);

  objc_msgSend(v118, "addObject:", v65);
  v83 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerTrailing"));
  v84 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v85 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v85, "setAlignment:", 4);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v85, "setInterspace:", v12);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v84, "setHorizontalLayout:", v85);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v84, "setVerticalLayout:", v86);

  -[_UIStatusBarRegion setLayout:](v83, "setLayout:", v84);
  v87 = objc_alloc_init(UIView);
  -[_UIStatusBarRegion setContentView:](v83, "setContentView:", v87);

  -[_UIStatusBarRegion setOffsetable:](v83, "setOffsetable:", 1);
  -[_UIStatusBarRegion disableWithToken:](v83, "disableWithToken:", 10);
  -[_UIStatusBarRegion layoutItem](v83, "layoutItem");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "trailingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -v18);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v91);

  -[_UIStatusBarRegion layoutItem](v83, "layoutItem");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "heightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToConstant:", v21);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v94);

  -[_UIStatusBarRegion layoutItem](v83, "layoutItem");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v98);

  -[_UIStatusBarRegion layoutItem](v83, "layoutItem");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "bottomAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, v64);
  v102 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v102;

  objc_msgSend(v119, "addObject:", self->_expandedTrailingBottomConstraint);
  -[_UIStatusBarRegion layoutItem](v83, "layoutItem");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trailingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, v12);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v107);

  -[_UIStatusBarRegion layoutItem](v83, "layoutItem");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "widthAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "widthAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v112) = 1131741184;
  objc_msgSend(v111, "_ui_constraintWithPriority:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v113);

  -[_UIStatusBarRegion layoutItem](v83, "layoutItem");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "_ui_addSubLayoutItem:", v114);

  objc_msgSend(v118, "addObject:", v83);
}

- (id)_orderedDisplayItemPlacements
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
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
  char v59;
  char v60;
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
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
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
  void *v114;
  void *v115;
  const __CFString *v116;
  const __CFString *v117;
  const __CFString *v118;
  _QWORD v119[3];
  const __CFString *v120;
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  _QWORD v124[4];
  _QWORD v125[7];
  _QWORD v126[7];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[5];
  _QWORD v130[10];
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD v134[2];
  _QWORD v135[3];

  v135[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorSatelliteItem, "defaultDisplayIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v2, 1101);
  v3 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarCellularItem signalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v4, 1104);
  v5 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 1105);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excludingPlacements:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarCellularCondensedItem sosSignalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "sosSignalStrengthDisplayIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v10, 1109);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v5;
  v134[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "excludingPlacements:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarCellularItem warningDisplayIdentifier](_UIStatusBarCellularCondensedItem, "warningDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v14, 1106);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "excludingPlacements:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (-[_UIStatusBarVisualProvider_Split supportsAnimatedCellularNetworkType](self, "supportsAnimatedCellularNetworkType"))
  {
    +[_UIStatusBarCellularCondensedItem animatedTypeDisplayIdentifier](_UIStatusBarCellularCondensedItem, "animatedTypeDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v18, 1102);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v3;
    v20 = (void *)MEMORY[0x1E0C99D20];
    v21 = &v132;
  }
  else
  {
    +[_UIStatusBarCellularItem typeDisplayIdentifier](_UIStatusBarCellularCondensedItem, "typeDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v18, 1102);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v3;
    v20 = (void *)MEMORY[0x1E0C99D20];
    v21 = &v131;
  }
  objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "excludingPlacements:", v22);
  v23 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v111, 1200);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v5;
  v129[1] = v9;
  v129[2] = v13;
  v129[3] = v17;
  v129[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 5);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "excludingPlacements:", v101);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v99;
  v130[1] = v5;
  v108 = (void *)v9;
  v109 = (void *)v5;
  v130[2] = v9;
  v130[3] = v13;
  v106 = (void *)v17;
  v107 = (void *)v13;
  v130[4] = v17;
  +[_UIStatusBarWifiItem signalStrengthDisplayIdentifier](_UIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v97, 1107);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v23;
  v128[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "excludingPlacements:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v130[5] = v25;
  v130[6] = v23;
  +[_UIStatusBarWifiItem iconDisplayIdentifier](_UIStatusBarWifiItem, "iconDisplayIdentifier");
  v26 = (void *)v23;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v27, 1103);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v26;
  v127[0] = v26;
  v127[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "excludingPlacements:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v130[7] = v30;
  v130[8] = v3;
  v110 = (void *)v3;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorLiquidDetectionItem, "defaultDisplayIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v31, 1108);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v130[9] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "addObjectsFromArray:", v33);

  +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v34, 1111);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "addObject:", v35);

  if (objc_msgSend((id)objc_opt_class(), "showsLargeBatteryChargingAnimation"))
  {
    +[_UIStatusBarBatteryItem chargingDisplayIdentifier](_UIStatusBarBatteryItem, "chargingDisplayIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v36, 1300);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "subarrayWithRange:", 0, objc_msgSend(v114, "count") - 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "excludingPlacements:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "disabledPlacement");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_Split setBatteryChargingPlacement:](self, "setBatteryChargingPlacement:", v40);

    -[_UIStatusBarVisualProvider_Split batteryChargingPlacement](self, "batteryChargingPlacement");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addObject:", v41);

  }
  v42 = objc_opt_class();
  +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:](_UIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:", 2500, 2200, v42, objc_opt_class(), 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "wifiGroup");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split setLowerWifiGroup:](self, "setLowerWifiGroup:", v44);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v46, 5000);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_iOS expandedCellularPlacementsAffectedByAirplaneMode](self, "expandedCellularPlacementsAffectedByAirplaneMode");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "cellularGroup");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "placementsAffectedByAirplaneMode");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "arrayByAddingObjectsFromArray:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "excludingPlacements:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObject:", v52);

  v104 = v43;
  objc_msgSend(v43, "placements");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v45;
  objc_msgSend(v45, "addObjectsFromArray:", v53);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v55, 2450);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v56);

  -[_UIStatusBarVisualProvider_iOS bluetoothPaddingInset](self, "bluetoothPaddingInset");
  +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 2400, 200);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "placements");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObjectsFromArray:", v58);

  v90 = (void *)MEMORY[0x1E0C99E08];
  v126[0] = v114;
  v125[0] = CFSTR("trailing");
  v125[1] = CFSTR("systemUpdates");
  v59 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_SplitStatusBarShowVPNDisconnect, (uint64_t)CFSTR("SplitStatusBarShowVPNDisconnect"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1EDDA82FC)
    v60 = v59;
  else
    v60 = 1;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorVPNItem, "defaultDisplayIdentifier");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v60;
  v100 = v61;
  if ((v60 & 1) != 0)
  {
    v118 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "excludingAllPlacementsInRegions:");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "disabledPlacement");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v94;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarThermalItem, "defaultDisplayIdentifier");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
    v91 = v62;
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "excludingAllPlacementsInRegions:");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "disabledPlacement");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v87;
    +[_UIStatusBarActivityItem_Split syncStartDisplayIdentifier](_UIStatusBarActivityItem_Split, "syncStartDisplayIdentifier");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v63;
    objc_msgSend(v63, "excludingAllPlacementsInRegions:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "disabledPlacement");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v119[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 3);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v123 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "excludingAllPlacementsInRegions:");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "disabledPlacement");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v124[0] = v94;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVPNDisconnectItem, "defaultDisplayIdentifier");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
    v91 = v66;
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "excludingAllPlacementsInRegions:");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "disabledPlacement");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v124[1] = v87;
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarThermalItem, "defaultDisplayIdentifier");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v67;
    objc_msgSend(v67, "excludingAllPlacementsInRegions:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "disabledPlacement");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v124[2] = v64;
    +[_UIStatusBarActivityItem_Split syncStartDisplayIdentifier](_UIStatusBarActivityItem_Split, "syncStartDisplayIdentifier");
    v82 = objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v68;
    objc_msgSend(v68, "excludingAllPlacementsInRegions:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "disabledPlacement");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v124[3] = v78;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v126[1] = v65;
  v125[2] = CFSTR("expandedLeading");
  -[_UIStatusBarVisualProvider_iOS expandedLeadingPlacements](self, "expandedLeadingPlacements");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v69;
  v126[3] = v112;
  v125[3] = CFSTR("expandedLowerLeading");
  v125[4] = CFSTR("expandedLowerTrailing");
  v70 = v54;
  v126[4] = v54;
  v125[5] = CFSTR("expandedTrailing");
  -[_UIStatusBarVisualProvider_iOS expandedTrailingPlacements](self, "expandedTrailingPlacements");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v126[5] = v71;
  v125[6] = CFSTR("bottomLeading");
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarNavigationItem, "defaultDisplayIdentifier");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v72, 40);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v73;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v126[6] = v74;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 7);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "dictionaryWithDictionary:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v92 & 1) == 0)
  {

    v65 = (void *)v82;
  }

  return v76;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacements](self, "orderedDisplayItemPlacements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[_UIStatusBarVisualProvider_Split _orderedDisplayItemPlacements](self, "_orderedDisplayItemPlacements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_Split setOrderedDisplayItemPlacements:](self, "setOrderedDisplayItemPlacements:", v6);

  }
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacements](self, "orderedDisplayItemPlacements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVisualProvider_Split;
  -[_UIStatusBarVisualProvider_iOS styleAttributesForStyle:](&v13, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  switch(v5)
  {
    case 2:
      goto LABEL_4;
    case 1:
      -[_UIStatusBarVisualProvider_Split expandedIconScale](self, "expandedIconScale");
      objc_msgSend(v4, "setIconScale:");
      objc_msgSend(v4, "setIconSize:", -[_UIStatusBarVisualProvider_Split expandedIconSize](self, "expandedIconSize"));
      -[_UIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFont:", v9);

      -[_UIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEmphasizedFont:", v10);

      -[_UIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 0:
LABEL_4:
      -[_UIStatusBarVisualProvider_Split normalIconScale](self, "normalIconScale");
      objc_msgSend(v4, "setIconScale:");
      objc_msgSend(v4, "setIconSize:", -[_UIStatusBarVisualProvider_Split normalIconSize](self, "normalIconSize"));
      -[_UIStatusBarVisualProvider_Split normalFont](self, "normalFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFont:", v6);

      -[_UIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEmphasizedFont:", v7);

      -[_UIStatusBarVisualProvider_Split smallFont](self, "smallFont");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = (void *)v8;
      objc_msgSend(v4, "setSmallFont:", v8);

      break;
  }
  objc_msgSend(v4, "setImageNamePrefixes:", &unk_1E1A94AA8);
  return v4;
}

- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5
{
  int v6;
  double v7;
  double result;

  if ((unint64_t)(a3 - 8) < 2)
  {
    *a5 = 1.0;
    objc_msgSend((id)objc_opt_class(), "LTEAPlusFontSize");
  }
  else if ((unint64_t)(a3 - 2) > 1)
  {
    *a5 = 0.666666667;
    return a4 + -1.0;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(), "shrinksSingleCharacterTypes");
    v7 = 0.0;
    if (v6)
      v7 = 1.0;
    return a4 - v7;
  }
  return result;
}

- (BOOL)supportsAnimatedCellularNetworkType
{
  return 1;
}

- (BOOL)supportsCondensedBatteryPercentage
{
  return 1;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("􀛳");
  if (a3 != 9)
    v4 = 0;
  if (a3 == 8)
    v4 = CFSTR("􀛲");
  if (a4)
    return (id)v4;
  else
    return 0;
}

- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;

  v8 = a4;
  objc_msgSend(v8, "pointSize");
  v10 = v9;
  -[_UIStatusBarVisualProvider_Split condensedPointSizeForCellularType:defaultPointSize:baselineOffset:](self, "condensedPointSizeForCellularType:defaultPointSize:baselineOffset:", a3, a5);
  v12 = v11;
  if ((unint64_t)a3 <= 0xD && ((1 << a3) & 0x38C0) != 0)
  {
    objc_msgSend(v8, "fontDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", 64);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v10)
    {
      v15 = off_1E167A828;
      v17 = 0.0;
      v16 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    v18 = v8;
    if (v11 == v10)
      goto LABEL_7;
    objc_msgSend(v8, "fontDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = off_1E167A828;
  v16 = v14;
  v17 = v12;
LABEL_6:
  objc_msgSend(v15, "fontWithDescriptor:size:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v18;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  double result;

  result = 1.0;
  if ((unint64_t)(a3 - 6) <= 7)
    return dbl_186683DD8[a3 - 6];
  return result;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarNavigationItem, "defaultDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_Split smallFont](self, "smallFont");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = (void *)v11;
    objc_msgSend(v10, "setFont:", v11);

    goto LABEL_11;
  }
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v4)
  {

    goto LABEL_8;
  }
  v7 = (void *)v6;
  +[_UIStatusBarIndicatorLocationItem prominentDisplayIdentifier](_UIStatusBarIndicatorLocationItem, "prominentDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
LABEL_8:
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSymbolScale:", 1);
    -[_UIStatusBarVisualProvider_Split voiceControlFont](self, "voiceControlFont");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)itemCreated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "setTypeStringProvider:", self);
LABEL_15:
    v8 = v11;
    goto LABEL_16;
  }
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem identifier](_UIStatusBarVoiceControlPillItem, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v9 = v11;
    -[_UIStatusBarVisualProvider_Split smallPillSize](self, "smallPillSize");
    objc_msgSend(v9, "setPillSize:");
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem identifier](_UIStatusBarBatteryItem, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v6 == v7)
  {
    v9 = v11;
    if ((_UIInternalPreferenceUsesDefault(&dword_1ECD76898, (uint64_t)CFSTR("SplitStatusBarBatteryPercentageEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD7689C)
    {
      v10 = (_UIInternalPreferenceUsesDefault(&dword_1ECD768A0, (uint64_t)CFSTR("SplitStatusBarBatteryPercentageAlwaysEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD768A4|| -[_UIStatusBarVisualProvider_Split supportsCondensedBatteryPercentage](self, "supportsCondensedBatteryPercentage");
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v9, "setUsesCondensedPercentageDisplay:", v10);
    goto LABEL_14;
  }
LABEL_16:

}

- (id)willUpdateWithData:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarVisualProvider_Split;
  v4 = a3;
  -[_UIStatusBarVisualProvider_Phone willUpdateWithData:](&v7, sel_willUpdateWithData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split _updateDataForBatteryCharging:](self, "_updateDataForBatteryCharging:", v4, v7.receiver, v7.super_class);
  -[_UIStatusBarVisualProvider_Split _updateDataForSystemUpdates:](self, "_updateDataForSystemUpdates:", v4);

  return v5;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString **v8;
  void *v9;
  void *v10;
  objc_super v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("batteryPartIdentifier")))
  {
    v5 = -[_UIStatusBarVisualProvider_iOS expanded](self, "expanded");
    v6 = (void *)MEMORY[0x1E0C99E60];
    if (v5)
      +[_UIStatusBarBatteryItem staticIconDisplayIdentifier](_UIStatusBarBatteryItem, "staticIconDisplayIdentifier");
    else
      +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("fittingLeadingPartIdentifier")))
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      v16[0] = CFSTR("expandedLeading");
      v8 = (const __CFString **)v16;
    }
    else
    {
      v15 = CFSTR("leading");
      v8 = &v15;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayItemIdentifiersInRegionsWithIdentifiers:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("fittingTrailingPartIdentifier")))
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      v14 = CFSTR("expandedTrailing");
      v8 = &v14;
    }
    else
    {
      v13 = CFSTR("trailing");
      v8 = &v13;
    }
    goto LABEL_15;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBarVisualProvider_Split;
  -[_UIStatusBarVisualProvider_iOS displayItemIdentifiersForPartWithIdentifier:](&v12, sel_displayItemIdentifiersForPartWithIdentifier_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v9;
}

- (id)_systemUpdateDelayedDataIdentifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "itemWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "dependentEntryKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)_delaySystemUpdateData
{
  void *v3;
  void *v4;
  id v5;

  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_SplitStatusBarShowVPNDisconnect, (uint64_t)CFSTR("SplitStatusBarShowVPNDisconnect"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EDDA82FC&& !-[_UIStatusBarVisualProvider_Split delayedSystemUpdateData](self, "delayedSystemUpdateData"))
  {
    -[_UIStatusBarVisualProvider_Split setDelayedSystemUpdateData:](self, "setDelayedSystemUpdateData:", 1);
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataAggregator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_Split _systemUpdateDelayedDataIdentifiers](self, "_systemUpdateDelayedDataIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginDelayingUpdatesForEntryKeys:", v4);

  }
}

- (void)_resumeSystemUpdateData
{
  void *v3;
  void *v4;
  void *v5;

  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_SplitStatusBarShowVPNDisconnect, (uint64_t)CFSTR("SplitStatusBarShowVPNDisconnect"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EDDA82FC)
  {
    if (-[_UIStatusBarVisualProvider_Split delayedSystemUpdateData](self, "delayedSystemUpdateData"))
    {
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dataAggregator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarVisualProvider_Split _systemUpdateDelayedDataIdentifiers](self, "_systemUpdateDelayedDataIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDelayingUpdatesForEntryKeys:", v5);

      -[_UIStatusBarVisualProvider_Split setDelayedSystemUpdateData:](self, "setDelayedSystemUpdateData:", 0);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_UIStatusBarVisualProvider_Split _resumeSystemUpdateData](self, "_resumeSystemUpdateData");
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarVisualProvider_Split;
  -[_UIStatusBarVisualProvider_Split dealloc](&v3, sel_dealloc);
}

- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  id v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarVisualProvider_Split;
  if (-[_UIStatusBarVisualProvider_iOS hasCustomAnimationForDisplayItemWithIdentifier:removal:](&v10, sel_hasCustomAnimationForDisplayItemWithIdentifier_removal_, v6, v4))
  {
    v7 = 1;
  }
  else
  {
    +[_UIStatusBarBatteryItem chargingDisplayIdentifier](_UIStatusBarBatteryItem, "chargingDisplayIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v8 == v6
      || -[_UIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, "_shouldShowSystemUpdateForDisplayItemWithIdentifier:", v6);

  }
  return v7;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  +[_UIStatusBarBatteryItem chargingDisplayIdentifier](_UIStatusBarBatteryItem, "chargingDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[_UIStatusBarVisualProvider_Split _additionAnimationForBatteryCharging](self, "_additionAnimationForBatteryCharging");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, "_shouldShowSystemUpdateForDisplayItemWithIdentifier:", v6))
  {
    -[_UIStatusBarVisualProvider_Split _systemUpdateAnimationForDisplayItemWithIdentifier:](self, "_systemUpdateAnimationForDisplayItemWithIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_Phone additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v12, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  +[_UIStatusBarBatteryItem chargingDisplayIdentifier](_UIStatusBarBatteryItem, "chargingDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[_UIStatusBarVisualProvider_Split _removalAnimationForBatteryCharging](self, "_removalAnimationForBatteryCharging");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, "_shouldShowSystemUpdateForDisplayItemWithIdentifier:", v6))
  {
    -[_UIStatusBarVisualProvider_Split _systemUpdateAnimationForDisplayItemWithIdentifier:](self, "_systemUpdateAnimationForDisplayItemWithIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_Phone removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v12, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (BOOL)canFixupDisplayItemAttributes
{
  _UIStatusBarDisplayItemPlacement *batteryChargingPlacement;

  batteryChargingPlacement = self->_batteryChargingPlacement;
  if (batteryChargingPlacement)
    LOBYTE(batteryChargingPlacement) = !-[_UIStatusBarDisplayItemPlacement isEnabled](batteryChargingPlacement, "isEnabled");
  return (char)batteryChargingPlacement;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", CFSTR("batteryPartIdentifier")))
  {
    if (objc_msgSend(v4, "isEqual:", CFSTR("clockPartIdentifier")))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = CFSTR("leading");
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("leadingPartIdentifier")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v21 = CFSTR("expandedLowerLeading");
      v9 = CFSTR("expandedLeading");
      v10 = CFSTR("bottomLeading");
LABEL_8:
      objc_msgSend(v8, "setWithObjects:", CFSTR("leading"), v10, v9, v21, 0);
LABEL_18:
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("trailingPartIdentifier")))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("trailing"), CFSTR("systemUpdates"), CFSTR("expandedTrailing"), CFSTR("expandedLowerTrailing"), 0);
      goto LABEL_18;
    }
    if (objc_msgSend(v4, "isEqual:", 0x1E176E800))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v21 = CFSTR("bottomLeading");
      v9 = CFSTR("systemUpdates");
      v10 = CFSTR("trailing");
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "isEqual:", 0x1E176E820))
      goto LABEL_14;
    if (!objc_msgSend(v4, "isEqual:", 0x1E176E840))
    {
      if (objc_msgSend(v4, "isEqual:", 0x1E176E860))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("expandedLowerLeading"), CFSTR("expandedLowerTrailing"), 0, v20, v22);
        goto LABEL_18;
      }
      if (!objc_msgSend(v4, "isEqual:", CFSTR("visibleExpandedPartIdentifier")))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "secondaryCellularEntry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEnabled") & 1) != 0)
      {
        -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "orientation") - 1;

        if (v18 <= 1)
        {
LABEL_14:
          v11 = (void *)MEMORY[0x1E0C99E60];
          v20 = CFSTR("expandedLowerTrailing");
          v22 = 0;
          v19 = CFSTR("expandedLowerLeading");
LABEL_17:
          objc_msgSend(v11, "setWithObjects:", CFSTR("expandedLeading"), CFSTR("expandedTrailing"), v19, v20, v22);
          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    v11 = (void *)MEMORY[0x1E0C99E60];
    v19 = 0;
    goto LABEL_17;
  }
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = CFSTR("trailing");
LABEL_5:
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v12 = (void *)v7;

  return v12;
}

- (void)updateDataForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarVisualProvider_Split;
  v4 = a3;
  -[_UIStatusBarVisualProvider_iOS updateDataForService:](&v10, sel_updateDataForService_, v4);
  objc_msgSend(v4, "cellularEntry", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryCellularEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", objc_msgSend(v6, "type") != 0);
    if (v5)
      goto LABEL_7;
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellularEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
      return;
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secondaryCellularEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  if (objc_msgSend(v5, "status") == 5
    || (objc_msgSend(v5, "wifiCallingEnabled") & 1) != 0
    || objc_msgSend(v6, "status") == 5)
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v6, "wifiCallingEnabled");
  }
  -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_serviceNamePlacement, "setEnabled:", v9);

}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  _BOOL4 v7;
  double result;
  objc_super v9;

  v7 = -[_UIStatusBarVisualProvider_iOS expanded](self, "expanded");
  result = 20.0;
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_iOS airplaneTravelOffsetInProposedPartWithIdentifier:animationType:](&v9, sel_airplaneTravelOffsetInProposedPartWithIdentifier_animationType_, a3, a4, 20.0);
  }
  return result;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  double result;
  objc_super v6;

  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_iOS airplaneSpeedForAnimationType:](&v6, sel_airplaneSpeedForAnimationType_, a3);
  }
  else
  {
    result = 60.0;
    if (a3 == 2)
      return 100.0;
  }
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  _BOOL4 v5;
  double result;
  objc_super v7;

  v5 = -[_UIStatusBarVisualProvider_iOS expanded](self, "expanded");
  result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 0.0);
  }
  return result;
}

- (double)airplaneObstacleFadeOutDuration
{
  double result;
  objc_super v4;

  if (!-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    return 0.15;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarVisualProvider_Split;
  -[_UIStatusBarVisualProvider_iOS airplaneObstacleFadeOutDuration](&v4, sel_airplaneObstacleFadeOutDuration);
  return result;
}

- (id)animationForAirplaneMode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarVisualProvider_Split;
  -[_UIStatusBarVisualProvider_iOS animationForAirplaneMode](&v17, sel_animationForAirplaneMode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setDelayedItemIdentifiers:", v4);
  return v3;
}

- (id)animationForProminentLocation
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVisualProvider_Split;
  -[_UIStatusBarVisualProvider_iOS animationForProminentLocation](&v13, sel_animationForProminentLocation);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x4010000000;
  v10[3] = &unk_18685B0AF;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = v3;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke;
  v9[3] = &unk_1E16E1730;
  v9[4] = v10;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4;
  v8[3] = &unk_1E16DC538;
  v8[4] = v10;
  objc_msgSend(v5, "setPrepareBlock:", v8);
  objc_msgSend(v5, "setPriority:", -300);
  +[_UIStatusBarTimeItem shortTimeDisplayIdentifier](_UIStatusBarTimeItem, "shortTimeDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v5, v6);

  _Block_object_dispose(v10, 8);
  return v2;
}

+ (BOOL)showsLargeBatteryChargingAnimation
{
  return 0;
}

- (void)_updateDataForBatteryCharging:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "showsLargeBatteryChargingAnimation");
  v5 = v17;
  if (v4)
  {
    objc_msgSend(v17, "mainBatteryEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainBatteryEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || !v9 || -[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
      goto LABEL_14;
    if (!objc_msgSend(v9, "state")
      && objc_msgSend(v6, "state") == 1
      && !-[_UIStatusBarDisplayItemPlacement isEnabled](self->_batteryChargingPlacement, "isEnabled"))
    {
      -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "areAnimationsEnabled") & 1) != 0)
      {
        -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayItemWithIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEnabled");

        if (v14)
        {
          -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_batteryChargingPlacement, "setEnabled:", 1);
LABEL_14:

          v5 = v17;
          goto LABEL_15;
        }
      }
      else
      {

      }
    }
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "areAnimationsEnabled");

    if ((v16 & 1) == 0)
      -[_UIStatusBarVisualProvider_Split _collapseBattery](self, "_collapseBattery");
    goto LABEL_14;
  }
LABEL_15:

}

- (CGAffineTransform)_collapseChargingBoltTransformForDisplayItem:(SEL)a3
{
  void *v5;
  double v6;
  __int128 v7;
  CGAffineTransform *result;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  objc_msgSend(a4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_shouldReverseLayoutDirection"))
    v6 = -12.0;
  else
    v6 = 12.0;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, v6, 0.666666667);
  v7 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v11, &v10, 0.1, 0.1);
  v9 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  return result;
}

- (CGAffineTransform)_expandedChargingBoltTransformForDisplayItem:(SEL)a3
{
  void *v5;
  double v6;

  objc_msgSend(a4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_shouldReverseLayoutDirection"))
    v6 = 7.0;
  else
    v6 = -7.0;

  return CGAffineTransformMakeTranslation(retstr, v6, -1.66666667);
}

- (id)_additionAnimationForBatteryCharging
{
  _UIStatusBarVisualProvider_Split *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _UIStatusBarVisualProvider_Split *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[5];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    v22 = 0;
  }
  else
  {
    -[_UIStatusBarVisualProvider_Split _stopBatteryCollapseTimer](self, "_stopBatteryCollapseTimer");
    v3 = self;
    v4 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke;
    v30[3] = &unk_1E16E0078;
    v20 = v3;
    v30[4] = v3;
    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v30);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPriority:", 200);
    objc_msgSend(v22, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3010000000;
    v29[4] = 0;
    v29[5] = 0;
    v29[3] = &unk_18685B0AF;
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6;
    v28[3] = &unk_1E16E1730;
    v28[4] = v29;
    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v28);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPriority:", 200);
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8;
    v27[3] = &unk_1E16DC538;
    v27[4] = v29;
    objc_msgSend(v5, "setPrepareBlock:", v27);
    +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubAnimation:forDisplayItemWithIdentifier:", v5, v6);
    v19 = v5;

    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", &__block_literal_global_488);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPriority:", 150);
    objc_msgSend(v21, "setPrepareBlock:", &__block_literal_global_114_2);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](v20, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "identifier", v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIStatusBarItem identifier](_UIStatusBarBatteryItem, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) == 0)
            objc_msgSend(v22, "addSubAnimation:forDisplayItemWithIdentifier:", v21, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v8);
    }

    objc_msgSend(v22, "setDelaysDependentItems:", 1);
    v15 = (void *)MEMORY[0x1E0C99E60];
    -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](v20, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelayedDisplayItemPlacements:", v17);

    _Block_object_dispose(v29, 8);
  }
  return v22;
}

- (id)_removalAnimationForBatteryCharging
{
  __int128 v3;
  _UIStatusBarVisualProvider_Split *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _UIStatusBarVisualProvider_Split *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[5];
  _QWORD v33[6];
  _QWORD v34[4];
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    v24 = 0;
  }
  else
  {
    -[_UIStatusBarVisualProvider_Split _stopBatteryCollapseTimer](self, "_stopBatteryCollapseTimer");
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x4010000000;
    v34[3] = &unk_18685B0AF;
    v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *MEMORY[0x1E0C9D648];
    v36 = v3;
    v4 = self;
    v5 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke;
    v33[3] = &unk_1E16E1658;
    v33[4] = v4;
    v33[5] = v34;
    v22 = v4;
    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v33);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPriority:", 200);
    objc_msgSend(v6, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
    v32[0] = v5;
    v32[1] = 3221225472;
    v32[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5;
    v32[3] = &unk_1E16DC538;
    v32[4] = v34;
    objc_msgSend(v6, "setPrepareBlock:", v32);
    v24 = v6;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3010000000;
    v31[4] = 0;
    v31[5] = 0;
    v31[3] = &unk_18685B0AF;
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6;
    v30[3] = &unk_1E16E1658;
    v30[5] = v31;
    v30[4] = v22;
    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPriority:", 200);
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9;
    v29[3] = &unk_1E16DC538;
    v29[4] = v31;
    objc_msgSend(v7, "setPrepareBlock:", v29);
    +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubAnimation:forDisplayItemWithIdentifier:", v7, v8);
    v21 = v7;

    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", &__block_literal_global_117_0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPriority:", 150);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](v22, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "identifier", v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIStatusBarItem identifier](_UIStatusBarBatteryItem, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if ((v16 & 1) == 0)
            objc_msgSend(v24, "addSubAnimation:forDisplayItemWithIdentifier:", v23, v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v10);
    }

    objc_msgSend(v24, "setDelaysDependentItems:", 1);
    v17 = (void *)MEMORY[0x1E0C99E60];
    -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](v22, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelayedDisplayItemPlacements:", v19);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v34, 8);
  }
  return v24;
}

- (void)_stopBatteryCollapseTimer
{
  NSTimer *batteryExpansionTimer;

  batteryExpansionTimer = self->_batteryExpansionTimer;
  if (batteryExpansionTimer)
  {
    -[NSTimer invalidate](batteryExpansionTimer, "invalidate");
    -[_UIStatusBarVisualProvider_Split setBatteryExpansionTimer:](self, "setBatteryExpansionTimer:", 0);
  }
}

- (void)_collapseBattery
{
  void *v3;
  void *v4;
  char v5;

  if (-[_UIStatusBarDisplayItemPlacement isEnabled](self->_batteryChargingPlacement, "isEnabled"))
  {
    -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_batteryChargingPlacement, "setEnabled:", 0);
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "areAnimationsEnabled");

    if ((v5 & 1) == 0)
      -[_UIStatusBarVisualProvider_Split _resetBattery](self, "_resetBattery");
  }
}

- (void)_resetBattery
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];
  _OWORD v30[2];
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarBatteryItem chargingDisplayIdentifier](_UIStatusBarBatteryItem, "chargingDisplayIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayItemWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayItemWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v30[0] = *MEMORY[0x1E0C9BAA8];
  v22 = v30[0];
  v30[1] = v23;
  v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v21 = v31;
  v24 = v5;
  objc_msgSend(v5, "setTransform:", v30);
  v29[0] = v22;
  v29[1] = v23;
  v29[2] = v21;
  objc_msgSend(v8, "setTransform:", v29);
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem identifier](_UIStatusBarBatteryItem, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHighlighted:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
        -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "displayItemWithIdentifier:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setAlpha:", 1.0);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v14);
  }

}

- (void)_updateDataForSystemUpdates:(id)a3
{
  void *v4;
  BOOL v5;
  _UIStatusBarVisualProvider_Split *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _UIStatusBarVisualProvider_Split *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "areAnimationsEnabled"))
  {

    goto LABEL_29;
  }
  v5 = -[_UIStatusBarVisualProvider_iOS expanded](self, "expanded");

  if (v5)
  {
LABEL_29:
    -[_UIStatusBarVisualProvider_Split _disableSystemUpdates](self, "_disableSystemUpdates");
    goto LABEL_30;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v30)
  {
    v6 = self;
    v29 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[_UIStatusBarVisualProvider_iOS statusBar](v6, "statusBar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "itemWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v12, "dependentEntryKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v35;
          v31 = v12;
          v32 = i;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v33, "valueForKey:", v18);
              v19 = objc_claimAutoreleasedReturnValue();
              if (!v19)
                goto LABEL_24;
              v20 = (void *)v19;
              v21 = v6;
              -[_UIStatusBarVisualProvider_iOS statusBar](v6, "statusBar");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "currentAggregatedData");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "valueForKey:", v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v8, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVPNDisconnectItem, "defaultDisplayIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = objc_msgSend(v20, "isEnabled");
              if (v25 == v26)
              {
                if ((v27 & 1) != 0 || (objc_msgSend(v24, "isEnabled") & 1) == 0)
                {
LABEL_23:

                  v6 = v21;
LABEL_24:

                  v12 = v31;
                  i = v32;
                  goto LABEL_25;
                }
              }
              else if (!v27 || objc_msgSend(v24, "isEnabled"))
              {
                goto LABEL_23;
              }

              v6 = v21;
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            v12 = v31;
            i = v32;
            if (v15)
              continue;
            break;
          }
        }

        objc_msgSend(v8, "setEnabled:", 1);
LABEL_25:

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v30);
  }

LABEL_30:
}

- (BOOL)_shouldShowSystemUpdateForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "identifier");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (id)_systemUpdateAnimationForDisplayItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  id v41;
  char v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_shouldReverseLayoutDirection");

  v7 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke;
  v40[3] = &unk_1E16E1680;
  v40[4] = self;
  v42 = v6;
  v8 = v4;
  v41 = v8;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPriority:", 300);
  objc_msgSend(v9, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
  objc_msgSend(v9, "setPrepareBlock:", &__block_literal_global_118_0);
  v38[0] = v7;
  v38[1] = 3221225472;
  v38[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9;
  v38[3] = &unk_1E16E0078;
  v10 = v8;
  v39 = v10;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPriority:", 300);
  objc_msgSend(v11, "setIdentifier:", CFSTR("systemUpdateItem"));
  v36[0] = v7;
  v36[1] = 3221225472;
  v36[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_11;
  v36[3] = &unk_1E16E16A8;
  v27 = v10;
  v37 = v27;
  objc_msgSend(v11, "setPrepareBlock:", v36);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v16), "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubAnimation:forDisplayItemWithIdentifier:", v11, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v23), "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v25);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
    }
    while (v21);
  }

  objc_msgSend(v9, "setDelayedItemIdentifiers:", v18);
  objc_msgSend(v9, "setDelaysDependentItems:", 1);

  return v9;
}

- (void)_disableSystemUpdates
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setEnabled:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_updateLowerRegionsWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v4, "secondaryCellularEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEnabled"))
      v7 = (unint64_t)(objc_msgSend(v6, "orientation") - 1) < 2;
    else
      v7 = 0;
    -[_UIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", 0x1E176E860);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64___UIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke;
    v12[3] = &unk_1E16E1200;
    v9 = v6;
    v15 = v7;
    v13 = v9;
    v14 = &v16;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

    -[NSLayoutConstraint setActive:](self->_expandedLeadingLowerTopConstraint, "setActive:", v7);
  }
  v10 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)_updateExpandedTrailingRegion
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _UIStatusBarVisualProvider_Split *v8;

  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)UIApp;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke;
    v6[3] = &unk_1E16B1B50;
    v7 = v3;
    v8 = self;
    v5 = v3;
    objc_msgSend(v4, "_performBlockAfterCATransactionCommits:", v6);

  }
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];

  v3 = a3;
  if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded") != a3)
  {
    -[_UIStatusBarVisualProvider_Split _stopBatteryCollapseTimer](self, "_stopBatteryCollapseTimer");
    if (-[_UIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pillIconPlacement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", 1);

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __48___UIStatusBarVisualProvider_Split_setExpanded___block_invoke;
      v9[3] = &unk_1E16B1B28;
      v9[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
    }
    -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updatePill");

    v8.receiver = self;
    v8.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_iOS setExpanded:](&v8, sel_setExpanded_, v3);
  }
}

- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarVisualProvider_Split;
  -[_UIStatusBarVisualProvider_iOS defaultAnimationForDisplayItemWithIdentifier:](&v9, sel_defaultAnimationForDisplayItemWithIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[_UIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelayedDisplayItemPlacements:", v7);

  return v4;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, a3);
}

- (double)animatedTypeDisplayItemSpacingFactor
{
  return self->_animatedTypeDisplayItemSpacingFactor;
}

- (_UIStatusBarDisplayItemPlacement)serviceNamePlacement
{
  return self->_serviceNamePlacement;
}

- (void)setServiceNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNamePlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)dualServiceNamePlacement
{
  return self->_dualServiceNamePlacement;
}

- (void)setDualServiceNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualServiceNamePlacement, a3);
}

- (_UIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
{
  return self->_lowerWifiGroup;
}

- (void)setLowerWifiGroup:(id)a3
{
  objc_storeStrong((id *)&self->_lowerWifiGroup, a3);
}

- (_UIStatusBarDisplayItemPlacement)batteryChargingPlacement
{
  return self->_batteryChargingPlacement;
}

- (void)setBatteryChargingPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_batteryChargingPlacement, a3);
}

- (UILayoutGuide)cutoutLayoutGuide
{
  return self->_cutoutLayoutGuide;
}

- (void)setCutoutLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_cutoutLayoutGuide, a3);
}

- (UILayoutGuide)mainRegionsLayoutGuide
{
  return self->_mainRegionsLayoutGuide;
}

- (void)setMainRegionsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_mainRegionsLayoutGuide, a3);
}

- (NSLayoutConstraint)expandedLeadingLowerTopConstraint
{
  return self->_expandedLeadingLowerTopConstraint;
}

- (void)setExpandedLeadingLowerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_expandedLeadingLowerTopConstraint, a3);
}

- (NSLayoutConstraint)expandedTrailingBottomConstraint
{
  return self->_expandedTrailingBottomConstraint;
}

- (void)setExpandedTrailingBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, a3);
}

- (NSTimer)systemUpdatesTimer
{
  return self->_systemUpdatesTimer;
}

- (void)setSystemUpdatesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_systemUpdatesTimer, a3);
}

- (NSTimer)batteryExpansionTimer
{
  return self->_batteryExpansionTimer;
}

- (void)setBatteryExpansionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_batteryExpansionTimer, a3);
}

- (NSTimer)airplaneModeIgnoreChangesTimer
{
  return self->_airplaneModeIgnoreChangesTimer;
}

- (void)setAirplaneModeIgnoreChangesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_airplaneModeIgnoreChangesTimer, a3);
}

- (BOOL)delayedSystemUpdateData
{
  return self->_delayedSystemUpdateData;
}

- (void)setDelayedSystemUpdateData:(BOOL)a3
{
  self->_delayedSystemUpdateData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplaneModeIgnoreChangesTimer, 0);
  objc_storeStrong((id *)&self->_batteryExpansionTimer, 0);
  objc_storeStrong((id *)&self->_systemUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingLowerTopConstraint, 0);
  objc_storeStrong((id *)&self->_mainRegionsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_cutoutLayoutGuide, 0);
  objc_storeStrong((id *)&self->_batteryChargingPlacement, 0);
  objc_storeStrong((id *)&self->_lowerWifiGroup, 0);
  objc_storeStrong((id *)&self->_dualServiceNamePlacement, 0);
  objc_storeStrong((id *)&self->_serviceNamePlacement, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end
