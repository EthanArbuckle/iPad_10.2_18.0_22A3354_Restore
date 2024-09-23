@implementation _UIStatusBarVisualProvider_FixedSplit

+ (BOOL)showsLargeBatteryChargingAnimation
{
  return 1;
}

- (double)nativeDisplayWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveTargetScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nativeBounds");
  v5 = v4;

  return v5;
}

- (double)referenceWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveTargetScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "nativeBounds");
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "referenceScreenScale");
  else
    objc_msgSend(v3, "_scale");
  v7 = v5 / v6;

  return v7;
}

- (double)leadingItemSpacing
{
  return 3.33333333;
}

- (double)leadingPillSpacing
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[_UIStatusBarVisualProvider_FixedSplit leadingPillInset](self, "leadingPillInset");
  v4 = v3 / 3.0;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveTargetScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scale");
  UIRoundToScale(v4, v7);
  v9 = v8;

  return v9;
}

- (double)leadingPillInset
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[_UIStatusBarVisualProvider_FixedSplit pillSize](self, "pillSize");
  v4 = v3 * 0.25;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveTargetScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scale");
  UIRoundToScale(v4, v7);
  v9 = v8;

  return v9;
}

- (double)leadingSmallPillSpacing
{
  return 6.66666667;
}

- (double)leadingCenteringEdgeInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[_UIStatusBarVisualProvider_FixedSplit notchRect](self, "notchRect");
  v4 = v3 * 0.5;
  -[_UIStatusBarVisualProvider_Split cornerRadius](self, "cornerRadius");
  v6 = v5 * 0.15 + v4;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_effectiveTargetScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scale");
  UIRoundToScale(v6, v9);
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "leadingCenteringOffset");
  v13 = v11 + v12;

  return v13;
}

+ (double)leadingCenteringOffset
{
  return 0.0;
}

- (double)trailingCenteringEdgeInset
{
  double v2;
  double v3;
  double v4;

  -[_UIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "trailingCenteringOffset");
  return v3 + v4;
}

+ (double)trailingCenteringOffset
{
  return 1.0;
}

- (double)pillCenteringEdgeInset
{
  double v2;
  double v3;
  double v4;

  -[_UIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "pillCenteringOffset");
  return v3 + v4;
}

+ (double)pillCenteringOffset
{
  return 0.0;
}

- (CGSize)pillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 64.6666667;
  v3 = 23.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 19.6666667;
  v3 = 19.6666667;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)expandedPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 50.0;
  v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)pillFontSize
{
  return 15.0;
}

+ (double)expandedPillFontSize
{
  double v2;

  objc_msgSend(a1, "expandedFontSize");
  return v2 + -4.0;
}

- (UIFont)pillFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD77980;
  if (unk_1ECD77980)
    v4 = byte_1ECD77946 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77946 = v2;
    objc_msgSend((id)objc_opt_class(), "pillFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD77980;
    unk_1ECD77980 = v5;

    v3 = (void *)unk_1ECD77980;
  }
  return (UIFont *)v3;
}

- (UIFont)pillSmallFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD77988;
  if (unk_1ECD77988)
    v4 = byte_1ECD77947 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77947 = v2;
    objc_msgSend((id)objc_opt_class(), "pillFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD77988;
    unk_1ECD77988 = v5;

    v3 = (void *)unk_1ECD77988;
  }
  return (UIFont *)v3;
}

- (id)expandedPillFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)qword_1ECD77990;
  if (qword_1ECD77990)
    v4 = byte_1ECD77948 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD77948 = v2;
    objc_msgSend((id)objc_opt_class(), "expandedPillFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD77990;
    qword_1ECD77990 = v5;

    v3 = (void *)qword_1ECD77990;
  }
  return v3;
}

- (double)bottomLeadingWidth
{
  double v2;
  double v3;
  double v4;

  -[_UIStatusBarVisualProvider_FixedSplit notchRect](self, "notchRect");
  v3 = floor(v2);
  objc_msgSend((id)objc_opt_class(), "additionalBottomLeadingMargin");
  return v3 - v4;
}

+ (double)additionalBottomLeadingMargin
{
  return 1.0;
}

- (double)bottomLeadingBaseline
{
  double v2;

  objc_msgSend((id)objc_opt_class(), "height");
  return v2 + -6.0;
}

- (NSDirectionalEdgeInsets)_edgeInsetsFromCenteringEdgeInset:(double)a3 trailing:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
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
  NSDirectionalEdgeInsets result;

  v4 = a4;
  v7 = -[_UIStatusBarVisualProvider_Split normalIconSize](self, "normalIconSize");
  +[_UIStatusBarBatteryView _statusBarIntrinsicContentSizeForIconSize:](_UIStatusBarBatteryView, "_statusBarIntrinsicContentSizeForIconSize:", v7);
  v9 = v8;
  +[_UIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:iconSize:](_UIStatusBarCellularSignalView, "_intrinsicContentSizeForNumberOfBars:iconSize:", 4, v7);
  v11 = v9 + v10;
  +[_UIStatusBarWifiSignalView _intrinsicContentSizeForNumberOfBars:iconSize:](_UIStatusBarWifiSignalView, "_intrinsicContentSizeForNumberOfBars:iconSize:", 3, v7);
  v13 = v11 + v12;
  -[_UIStatusBarVisualProvider_Split itemSpacing](self, "itemSpacing");
  v15 = v13 + v14 + v14;
  v16 = a3 - v15 * 0.5;
  -[_UIStatusBarVisualProvider_FixedSplit referenceWidth](self, "referenceWidth");
  v18 = v17;
  -[_UIStatusBarVisualProvider_FixedSplit notchSize](self, "notchSize");
  v20 = (v18 - v19) * 0.5 - (v15 + v16);
  -[_UIStatusBarVisualProvider_Split baselineBottomInset](self, "baselineBottomInset");
  v22 = v21;
  if (v4)
    v23 = v20;
  else
    v23 = v16;
  if (v4)
    v24 = v16;
  else
    v24 = v20;
  v25 = 14.6666667;
  result.trailing = v24;
  result.bottom = v22;
  result.leading = v23;
  result.top = v25;
  return result;
}

- (NSDirectionalEdgeInsets)leadingEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  -[_UIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
  -[_UIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 0);
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (NSDirectionalEdgeInsets)trailingEdgeInsets
{
  double v3;
  double v4;
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
  NSDirectionalEdgeInsets result;

  -[_UIStatusBarVisualProvider_FixedSplit trailingCenteringEdgeInset](self, "trailingCenteringEdgeInset");
  -[_UIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend((id)objc_opt_class(), "trailingEdgeInsetLeadingAdjustment");
  v12 = v6 - v11;
  v13 = v4;
  v14 = v8;
  v15 = v10;
  result.trailing = v15;
  result.bottom = v14;
  result.leading = v12;
  result.top = v13;
  return result;
}

+ (double)trailingEdgeInsetLeadingAdjustment
{
  return 0.0;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
{
  double v2;
  double v3;
  double v4;
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
  NSDirectionalEdgeInsets result;

  -[_UIStatusBarVisualProvider_FixedSplit leadingEdgeInsets](self, "leadingEdgeInsets");
  v3 = v2;
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "expandedEdgeInset");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "trailingCenteringOffset");
  v9 = v7 + v8;
  objc_msgSend((id)objc_opt_class(), "expandedEdgeInset");
  v11 = v10;
  v12 = v3;
  v13 = v9;
  v14 = v5;
  result.trailing = v11;
  result.bottom = v14;
  result.leading = v13;
  result.top = v12;
  return result;
}

- (CGRect)notchRect
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

- (CGSize)notchSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_UIStatusBarVisualProvider_FixedSplit notchRect](self, "notchRect");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  UILayoutGuide *v35;
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
  UILayoutGuide *v46;
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
  _UIStatusBarRegion *v58;
  _UIStatusBarRegionAxesLayout *v59;
  _UIStatusBarRegionAxisCenteringLayout *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSLayoutConstraint *v70;
  NSLayoutConstraint *leadingBottomConstraint;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _UIStatusBarRegion *v78;
  _UIStatusBarRegionAxesLayout *v79;
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
  _UIStatusBarRegion *v100;
  void *v101;
  void *v102;
  _UIStatusBarRegionAxesLayout *v103;
  _UIStatusBarRegionAxisCenteringLayout *v104;
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
  _UIStatusBarRegion *v133;
  _UIStatusBarRegionAxesLayout *v134;
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
  _UIStatusBarRegion *v154;
  _UIStatusBarRegionAxesLayout *v155;
  _UIStatusBarRegionAxisCenteringLayout *v156;
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
  id v178;
  _UIStatusBarRegion *v179;
  _UIStatusBarRegionAxesLayout *v180;
  _UIStatusBarRegionAxisStackingLayout *v181;
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
  _UIStatusBarRegion *v198;
  _UIStatusBarRegionAxesLayout *v199;
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
  double v219;
  void *v220;
  void *v221;
  void *v222;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  id v233;
  double v234;
  double v235;
  double v236;
  void *v237;
  void *v238;
  void *v239;
  id v240;
  id v241[2];

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "height");
  v236 = v7;
  -[_UIStatusBarVisualProvider_FixedSplit referenceWidth](self, "referenceWidth");
  v9 = v8;
  -[_UIStatusBarVisualProvider_FixedSplit notchSize](self, "notchSize");
  v11 = v10;
  v13 = v12;
  v14 = (v9 - v10) * 0.5;
  -[_UIStatusBarVisualProvider_Split itemSpacing](self, "itemSpacing");
  v235 = v15;
  -[_UIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  -[_UIStatusBarVisualProvider_FixedSplit leadingItemSpacing](self, "leadingItemSpacing");
  v224 = v16;
  -[_UIStatusBarVisualProvider_FixedSplit leadingPillSpacing](self, "leadingPillSpacing");
  v228 = v17;
  -[_UIStatusBarVisualProvider_FixedSplit leadingPillInset](self, "leadingPillInset");
  v229 = v18;
  -[_UIStatusBarVisualProvider_FixedSplit pillCenteringEdgeInset](self, "pillCenteringEdgeInset");
  v225 = v19;
  -[_UIStatusBarVisualProvider_FixedSplit pillSize](self, "pillSize");
  v226 = v20;
  v227 = v21;
  -[_UIStatusBarVisualProvider_FixedSplit leadingEdgeInsets](self, "leadingEdgeInsets");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[_UIStatusBarVisualProvider_FixedSplit trailingEdgeInsets](self, "trailingEdgeInsets");
  v230 = v30;
  v231 = v31;
  v232 = v33;
  v234 = v32;
  -[_UIStatusBarVisualProvider_FixedSplit expandedEdgeInsets](self, "expandedEdgeInsets");
  -[_UIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "capHeight");

  v35 = objc_alloc_init(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v35, "setIdentifier:", CFSTR("cutout"));
  -[UILayoutGuide topAnchor](v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v38);

  objc_msgSend(v5, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v35, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  -[UILayoutGuide widthAnchor](v35, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v43);

  -[UILayoutGuide heightAnchor](v35, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", v13);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v45);

  objc_msgSend(v5, "addLayoutGuide:", v35);
  -[_UIStatusBarVisualProvider_Split setCutoutLayoutGuide:](self, "setCutoutLayoutGuide:", v35);

  v46 = objc_alloc_init(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v46, "setIdentifier:", CFSTR("UIStatusBarMainRegions"));
  -[UILayoutGuide trailingAnchor](v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = v5;
  objc_msgSend(v5, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v49);

  -[UILayoutGuide widthAnchor](v46, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToConstant:", v9);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v51);

  -[UILayoutGuide heightAnchor](v46, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToConstant:", v13);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v53);

  -[UILayoutGuide bottomAnchor](v46, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v57);

  objc_msgSend(v5, "addLayoutGuide:", v46);
  -[_UIStatusBarVisualProvider_Split setMainRegionsLayoutGuide:](self, "setMainRegionsLayoutGuide:", v46);

  v58 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("leading"));
  v59 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v60 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  -[_UIStatusBarRegionAxisCenteringLayout setInterspace:](v60, "setInterspace:", v224);
  -[_UIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v60, "setMaxNumberOfItems:", 3);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v59, "setHorizontalLayout:", v60);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v59, "setVerticalLayout:", v61);

  -[_UIStatusBarRegion setLayout:](v58, "setLayout:", v59);
  -[_UIStatusBarRegion setActionInsets:](v58, "setActionInsets:", -v23, -v25, -(v236 + v27 - v13), -v29);
  -[_UIStatusBarRegion layoutItem](v58, "layoutItem");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, v23);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v66);

  objc_msgSend(v62, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, -v27);
  v70 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingBottomConstraint = self->_leadingBottomConstraint;
  self->_leadingBottomConstraint = v70;

  objc_msgSend(v6, "addObject:", self->_leadingBottomConstraint);
  objc_msgSend(v62, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, v25);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v75);

  objc_msgSend(v62, "widthAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToConstant:", v14 - (v25 + v29));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v77);

  v237 = v62;
  objc_msgSend(v239, "_ui_addSubLayoutItem:", v62);

  objc_msgSend(v238, "addObject:", v58);
  v78 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pill"));
  v79 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v79, "setHorizontalLayout:", v80);

  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v79, "setVerticalLayout:", v81);

  -[_UIStatusBarRegion setLayout:](v78, "setLayout:", v79);
  -[_UIStatusBarRegion setActionInsets:](v78, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  -[_UIStatusBarRegion layoutItem](v78, "layoutItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v86);

  -[_UIStatusBarRegion layoutItem](v78, "layoutItem");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "centerXAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89, v225);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v90);

  -[_UIStatusBarRegion layoutItem](v78, "layoutItem");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "widthAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToConstant:", v226);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v93);

  -[_UIStatusBarRegion layoutItem](v78, "layoutItem");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "heightAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToConstant:", v227);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v96);

  -[_UIStatusBarRegion layoutItem](v78, "layoutItem");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "_ui_addSubLayoutItem:", v97);

  objc_msgSend(v238, "addObject:", v78);
  objc_msgSend(v238, "lastObject");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setPillRegion:", v98);

  v100 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pillContent"));
  -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "pillRegion");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion setEnabilityRegion:](v100, "setEnabilityRegion:", v102);

  v103 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v104 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  -[_UIStatusBarRegionAxisCenteringLayout setInterspace:](v104, "setInterspace:", v228);
  -[_UIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v104, "setMaxNumberOfItems:", 2);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v103, "setHorizontalLayout:", v104);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v103, "setVerticalLayout:", v105);

  -[_UIStatusBarRegion setLayout:](v100, "setLayout:", v103);
  +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor whiteColor](UIColor, "whiteColor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setTextColor:", v107);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setImageTintColor:", v108);

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setImageDimmedTintColor:", v109);

  -[_UIStatusBarVisualProvider_FixedSplit pillFont](self, "pillFont");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setFont:", v110);

  -[_UIStatusBarVisualProvider_FixedSplit pillSmallFont](self, "pillSmallFont");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setSmallFont:", v111);

  -[_UIStatusBarVisualProvider_FixedSplit pillFont](self, "pillFont");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setEmphasizedFont:", v112);

  objc_msgSend(v106, "setSymbolScale:", 2);
  -[_UIStatusBarRegion setOverriddenStyleAttributes:](v100, "setOverriddenStyleAttributes:", v106);
  -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "pillRegion");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "layoutItem");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarRegion layoutItem](v100, "layoutItem");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "topAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "topAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v119);

  -[_UIStatusBarRegion layoutItem](v100, "layoutItem");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v123);

  -[_UIStatusBarRegion layoutItem](v100, "layoutItem");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "leadingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:constant:", v126, v229);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v127);

  -[_UIStatusBarRegion layoutItem](v100, "layoutItem");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "trailingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:constant:", v130, -v229);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v131);

  -[_UIStatusBarRegion layoutItem](v100, "layoutItem");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "_ui_addSubLayoutItem:", v132);

  objc_msgSend(v238, "addObject:", v100);
  v133 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("trailing"));
  v134 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v134, "setVerticalLayout:", v135);

  -[_UIStatusBarRegion setLayout:](v133, "setLayout:", v134);
  -[_UIStatusBarRegion setActionInsets:](v133, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  -[_UIStatusBarRegion layoutItem](v133, "layoutItem");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setFont:", v138);

  -[_UIStatusBarVisualProvider_Split normalFont](self, "normalFont");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setSmallFont:", v139);

  objc_msgSend(v137, "setImageNamePrefixes:", &unk_1E1A94AC0);
  -[_UIStatusBarRegion setOverriddenStyleAttributes:](v133, "setOverriddenStyleAttributes:", v137);
  objc_msgSend(v136, "topAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "topAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintEqualToAnchor:constant:", v142, v230);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v143);

  objc_msgSend(v136, "bottomAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "bottomAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "constraintEqualToAnchor:constant:", v146, -v231);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v147);

  objc_msgSend(v136, "trailingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:constant:", v150, -v232);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v151);

  objc_msgSend(v136, "widthAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "constraintEqualToConstant:", v14 - (v234 + v232));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v153);

  objc_msgSend(v239, "_ui_addSubLayoutItem:", v136);
  objc_msgSend(v238, "addObject:", v133);

  v154 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("systemUpdates"));
  v155 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v156 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  -[_UIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v156, "setMaxNumberOfItems:", 3);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v155, "setHorizontalLayout:", v156);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v155, "setVerticalLayout:", v157);

  -[_UIStatusBarRegion setLayout:](v154, "setLayout:", v155);
  +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setImageNamePrefixes:", &unk_1E1A94AD8);
  -[_UIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setFont:", v159);

  -[_UIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setEmphasizedFont:", v160);

  objc_msgSend(v158, "setSymbolScale:", 2);
  -[_UIStatusBarRegion setOverriddenStyleAttributes:](v154, "setOverriddenStyleAttributes:", v158);
  -[_UIStatusBarRegion layoutItem](v154, "layoutItem");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "topAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "topAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:", v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v164);

  -[_UIStatusBarRegion layoutItem](v154, "layoutItem");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "bottomAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "bottomAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToAnchor:", v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v168);

  -[_UIStatusBarRegion layoutItem](v154, "layoutItem");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "rightAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "rightAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "constraintEqualToAnchor:", v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v172);

  -[_UIStatusBarRegion layoutItem](v154, "layoutItem");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "leftAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "leftAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "constraintEqualToAnchor:", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v176);

  -[_UIStatusBarRegion layoutItem](v154, "layoutItem");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "_ui_addSubLayoutItem:", v177);

  objc_msgSend(v238, "addObject:", v154);
  v240 = v238;
  v241[0] = v6;
  -[_UIStatusBarVisualProvider_Split _setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:](self, "_setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:", v239, v241, &v240, v13);
  v178 = v241[0];

  v233 = v240;
  v179 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottomLeading"));
  v180 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v181 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v181, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v181, "setInterspace:", v235);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v180, "setHorizontalLayout:", v181);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v180, "setVerticalLayout:", v182);

  -[_UIStatusBarRegion setLayout:](v179, "setLayout:", v180);
  -[_UIStatusBarRegion setActionInsets:](v179, "setActionInsets:", -100.0, -12.0, -10.0, -12.0);
  -[_UIStatusBarRegion layoutItem](v179, "layoutItem");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "leadingAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "leadingAnchor");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  objc_msgSend(v184, "constraintEqualToAnchor:constant:", v185);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v186);

  -[_UIStatusBarRegion layoutItem](v179, "layoutItem");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "bottomAnchor");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "topAnchor");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_FixedSplit bottomLeadingBaseline](self, "bottomLeadingBaseline");
  objc_msgSend(v188, "constraintEqualToAnchor:constant:", v189);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v190);

  -[_UIStatusBarRegion layoutItem](v179, "layoutItem");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "widthAnchor");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_FixedSplit bottomLeadingWidth](self, "bottomLeadingWidth");
  objc_msgSend(v192, "constraintEqualToConstant:");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v193);

  -[_UIStatusBarRegion layoutItem](v179, "layoutItem");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "heightAnchor");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "constraintEqualToConstant:", 13.3333333);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v196);

  -[_UIStatusBarRegion layoutItem](v179, "layoutItem");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "_ui_insertSubLayoutItem:atIndex:", v197, 0);

  objc_msgSend(v233, "addObject:", v179);
  v198 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("topTrailing"));
  v199 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v199, "setHorizontalLayout:", v200);

  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 3);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v199, "setVerticalLayout:", v201);

  -[_UIStatusBarRegion setLayout:](v198, "setLayout:", v199);
  -[_UIStatusBarRegion layoutItem](v198, "layoutItem");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "leadingAnchor");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "trailingAnchor");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "constraintEqualToAnchor:constant:", v205, 6.66666667);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v206);

  -[_UIStatusBarRegion layoutItem](v198, "layoutItem");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "topAnchor");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "topAnchor");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "constraintEqualToAnchor:constant:", v209, 6.33333333);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v210);

  -[_UIStatusBarRegion layoutItem](v198, "layoutItem");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "trailingAnchor");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "trailingAnchor");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "constraintEqualToAnchor:constant:", v213, -30.0);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v214);

  -[_UIStatusBarRegion layoutItem](v198, "layoutItem");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "heightAnchor");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "constraintEqualToConstant:", 4.0);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "addObject:", v217);

  -[_UIStatusBarRegion layoutItem](v198, "layoutItem");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "_ui_addSubLayoutItem:", v218);

  objc_msgSend(v233, "addObject:", v198);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v178);
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_StatusBarBackgroundActivityCoalescingDelay, (uint64_t)CFSTR("StatusBarBackgroundActivityCoalescingDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v219 = 0.0;
  else
    v219 = *(double *)&qword_1EDDA82F0;
  if (v219 > 0.0)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "dataAggregator");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("backgroundActivityEntry"));
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v221, "beginCoalescingUpdatesForEntryKeys:delay:", v222, v219);

  }
  return v233;
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
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
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
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
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
  objc_super v97;
  _QWORD v98[2];
  void *v99;
  _QWORD v100[4];
  _QWORD v101[2];
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  _QWORD v109[8];
  _QWORD v110[3];
  _QWORD v111[3];
  uint64_t v112;
  _QWORD v113[2];
  _QWORD v114[3];
  _QWORD v115[2];
  _QWORD v116[4];
  _QWORD v117[5];

  v117[3] = *MEMORY[0x1E0C80C00];
  v97.receiver = self;
  v97.super_class = (Class)_UIStatusBarVisualProvider_FixedSplit;
  -[_UIStatusBarVisualProvider_Split _orderedDisplayItemPlacements](&v97, sel__orderedDisplayItemPlacements);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
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
  v117[0] = v8;
  objc_msgSend(v5, "regularPlacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v9;
  v117[2] = v4;
  v10 = v4;
  v96 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3);
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
  v116[0] = v15;
  objc_msgSend(v5, "regularPlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v16;
  v116[2] = v10;
  -[_UIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 4);
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
  v115[0] = v22;
  -[_UIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "excludingPlacements:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v26, 1014);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prominentPlacement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v28;
  objc_msgSend(v5, "regularPlacement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v29;
  v114[2] = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "excludingPlacements:", v30);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_FixedSplit leadingSmallPillSpacing](self, "leadingSmallPillSpacing");
  v32 = v31;
  -[_UIStatusBarVisualProvider_FixedSplit leadingItemSpacing](self, "leadingItemSpacing");
  +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 1013, v32 - (v33 + v33), 0.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarTimeItem pillTimeDisplayIdentifier](_UIStatusBarTimeItem, "pillTimeDisplayIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v34, 1900);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v35, 1800);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v36, 1950);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v93;
  v113[1] = v92;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "excludingPlacements:", v38);
  v39 = objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPillIconPlacement:", v39);

  +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v41, 1949);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "requiringAllPlacements:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v110[0] = CFSTR("leading");
  v109[0] = v25;
  -[_UIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v87;
  -[_UIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v86;
  v108 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "requiringAllPlacements:", v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v109[3] = v84;
  objc_msgSend(v5, "regularPlacement");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "excludingPlacements:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "requiringAllPlacements:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v79;
  v91 = v5;
  objc_msgSend(v5, "prominentPlacement");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "excludingPlacements:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)v25;
  v104 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "requiringAllPlacements:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v109[5] = v74;
  v103 = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "requiringAllPlacements:", v73);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v109[6] = v45;
  v109[7] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v46;
  v110[1] = CFSTR("pill");
  +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v47, 2000);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = CFSTR("leading");
  v101[1] = CFSTR("bottomLeading");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "excludingAllPlacementsInRegions:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v51;
  v110[2] = CFSTR("pillContent");
  v88 = (void *)v39;
  v100[0] = v39;
  v100[1] = v44;
  v100[2] = v93;
  v100[3] = v92;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v111[2] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addEntriesFromDictionary:", v53);

  if ((_UIInternalPreferenceUsesDefault(&dword_1ECD76890, (uint64_t)CFSTR("StatusBarEnableActivity"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD76894)
  {
    +[_UIStatusBarActivityItem_Split pillDisplayIdentifier](_UIStatusBarActivityItem_Split, "pillDisplayIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v54, 100);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setObject:forKeyedSubscript:", v56, CFSTR("topTrailing"));

  }
  if ((_UIInternalPreferenceUsesDefault(&_MergedGlobals_19, (uint64_t)CFSTR("StatusBarPromoteThermalWarning"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD7688C)
  {
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("trailing"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v57, "mutableCopy");

    v59 = objc_msgSend(v58, "indexOfObjectPassingTest:", &__block_literal_global_385);
    v60 = objc_msgSend(v58, "indexOfObjectPassingTest:", &__block_literal_global_386_0);
    if (v60 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v61 = 0;
    }
    else
    {
      objc_msgSend(v58, "objectAtIndexedSubscript:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v62 = objc_msgSend(v58, "indexOfObjectPassingTest:", &__block_literal_global_387_0);
    if (v62 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v63 = 0;
    }
    else
    {
      objc_msgSend(v58, "objectAtIndexedSubscript:", v62);
      v64 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)v64;
      if (v59 != 0x7FFFFFFFFFFFFFFFLL && v61 && v64)
      {
        +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarThermalItem, "defaultDisplayIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v65, 1110);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v61;
        v98[1] = v63;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "excludingPlacements:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "insertObject:atIndex:", v68, v59);

      }
    }
    objc_msgSend(v89, "setObject:forKeyedSubscript:", v58, CFSTR("trailing"));

    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("systemUpdates"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend(v69, "mutableCopy");

    v71 = objc_msgSend(v70, "indexOfObjectPassingTest:", &__block_literal_global_388);
    if (v71 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v70, "removeObjectAtIndex:", v71);
    objc_msgSend(v89, "setObject:forKeyedSubscript:", v70, CFSTR("systemUpdates"));

  }
  return v89;
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
    -[_UIStatusBarVisualProvider_FixedSplit _orderedDisplayItemPlacements](self, "_orderedDisplayItemPlacements");
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
  double v5;
  double v6;
  void *v7;
  double Width;
  uint64_t v9;
  _BOOL8 v10;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBarVisualProvider_FixedSplit;
  -[_UIStatusBarVisualProvider_Split styleAttributesForStyle:](&v12, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_FixedSplit referenceWidth](self, "referenceWidth");
  v6 = v5;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_unjailedReferenceBounds");
  Width = CGRectGetWidth(v13);

  v9 = objc_msgSend(v4, "mode");
  switch(v9)
  {
    case 2:
      goto LABEL_4;
    case 1:
      v10 = 0;
      goto LABEL_6;
    case 0:
LABEL_4:
      v10 = v6 != Width;
LABEL_6:
      objc_msgSend(v4, "setScaledFixedWidthBar:", v10);
      break;
  }
  return v4;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return 1;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](_UIStatusBarExpandedPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_FixedSplit expandedPillFont](self, "expandedPillFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[_UIStatusBarVisualProvider_FixedSplit expandedPillFont](self, "expandedPillFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSmallFont:", v8);

    -[_UIStatusBarVisualProvider_FixedSplit expandedPillSize](self, "expandedPillSize");
    objc_msgSend(v6, "setIconScale:", v9 / 21.3333333);
    objc_msgSend(v6, "setSymbolScale:", 2);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIStatusBarVisualProvider_FixedSplit;
    -[_UIStatusBarVisualProvider_Split overriddenStyleAttributesForDisplayItemWithIdentifier:](&v11, sel_overriddenStyleAttributesForDisplayItemWithIdentifier_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)itemCreated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarVisualProvider_FixedSplit;
  -[_UIStatusBarVisualProvider_Split itemCreated:](&v8, sel_itemCreated_, v4);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem identifier](_UIStatusBarExpandedPillBackgroundActivityItem, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v7 = v4;
    -[_UIStatusBarVisualProvider_FixedSplit expandedPillSize](self, "expandedPillSize");
    objc_msgSend(v7, "setPillSize:");

  }
}

- (id)region:(id)a3 willSetDisplayItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 isKindOfClass;
  void *v11;
  void *v12;
  _UIStatusBarRegionAxisStackingLayout *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqual:", CFSTR("trailing")))
    goto LABEL_11;
  v8 = objc_msgSend(v6, "count");

  if (v8)
  {
    v9 = objc_msgSend(v6, "count");
    isKindOfClass = v9 < 3;
    objc_msgSend(v5, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "horizontalLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "horizontalLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    if (v9 < 3 || (isKindOfClass & 1) != 0)
    {
      if (((v9 < 3) & isKindOfClass) != 1)
      {
LABEL_11:

        goto LABEL_12;
      }
      v13 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
      -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v13, "setAlignment:", 4);
      -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v13, "setInterspace:", 6.0);
    }
    else
    {
      v13 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
      -[_UIStatusBarRegionAxisStackingLayout setMargin:](v13, "setMargin:", 0.0);
      -[_UIStatusBarRegionAxisStackingLayout setMaxNumberOfItems:](v13, "setMaxNumberOfItems:", 3);
    }
    objc_msgSend(v7, "setHorizontalLayout:", v13);

    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAggregatedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_FixedSplit _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

}

- (void)dataUpdated:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIStatusBarVisualProvider_FixedSplit _updateSystemNavigationWithData:](self, "_updateSystemNavigationWithData:", v4);
  -[_UIStatusBarVisualProvider_FixedSplit _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVisualProvider_FixedSplit;
  -[_UIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](&v13, sel_regionIdentifiersForPartWithIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqual:", CFSTR("leadingPartIdentifier")))
  {
    if (objc_msgSend(v4, "isEqual:", CFSTR("trailingPartIdentifier")))
    {
      objc_msgSend(v5, "setByAddingObject:", CFSTR("topTrailing"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "isEqual:", 0x1E176E800))
      {
        v14[0] = CFSTR("pill");
        v14[1] = CFSTR("pillContent");
        v14[2] = CFSTR("topTrailing");
        v6 = (void *)MEMORY[0x1E0C99D20];
        v7 = v14;
        v8 = 3;
        goto LABEL_7;
      }
      v9 = v5;
    }
    v11 = v9;
    goto LABEL_10;
  }
  v15[0] = CFSTR("pill");
  v15[1] = CFSTR("pillContent");
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = v15;
  v8 = 2;
LABEL_7:
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v11;
}

- (void)_updateSystemNavigationWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  _QWORD v31[5];

  v4 = a3;
  objc_msgSend(v4, "backNavigationEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "backgroundActivityEntry");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_17;
    v10 = (void *)v9;
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentAggregatedData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backNavigationEntry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEnabled");

    if (!v14)
      goto LABEL_17;
  }
  objc_msgSend(v4, "backNavigationEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentAggregatedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "backNavigationEntry");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "backgroundActivityEntry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentAggregatedData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "backgroundActivityEntry");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "regions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leading"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarVisualProvider_FixedSplit leadingEdgeInsets](self, "leadingEdgeInsets");
  v27 = v26;
  if (objc_msgSend(v8, "isEnabled") && (objc_msgSend(v19, "isEnabled") & 1) == 0)
  {
    -[_UIStatusBarVisualProvider_Split bottomLeadingTopOffset](self, "bottomLeadingTopOffset");
    v29 = 0;
    v28 = -v27 - v30;
  }
  else
  {
    v28 = -v27;
    v29 = 1;
  }
  -[NSLayoutConstraint setConstant:](self->_leadingBottomConstraint, "setConstant:", v28);
  objc_msgSend(v25, "setEnabled:", v29);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73___UIStatusBarVisualProvider_FixedSplit__updateSystemNavigationWithData___block_invoke;
  v31[3] = &unk_1E16B1B28;
  v31[4] = self;
  +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v31, 0, 200.0, 20.0);

LABEL_17:
}

- (id)animationForBackgroundActivityPillAnimation:(id)a3 duration:(double)a4 scale:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAggregatedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "voiceControlEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEnabled");

  if (v12)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_shouldReverseLayoutDirection");

    if (v14)
      v15 = -1.0;
    else
      v15 = 1.0;
    +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a4, a5, v15 * 5.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPriority:", 30);
    +[_UIStatusBarTimeItem pillTimeDisplayIdentifier](_UIStatusBarTimeItem, "pillTimeDisplayIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubAnimation:forDisplayItemWithIdentifier:", v16, v17);

    +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a4, a5, v15 * -5.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPriority:", 30);
    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubAnimation:forDisplayItemWithIdentifier:", v18, v19);

  }
  objc_msgSend(v8, "setDelaysDependentItems:", 1);
  return v8;
}

- (BOOL)_updateLowerRegionsWithData:(id)a3
{
  _BOOL4 v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarVisualProvider_FixedSplit;
  v4 = -[_UIStatusBarVisualProvider_Split _updateLowerRegionsWithData:](&v7, sel__updateLowerRegionsWithData_, a3);
  if (v4)
  {
    -[_UIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
  return v4;
}

- (NSLayoutConstraint)leadingBottomConstraint
{
  return self->_leadingBottomConstraint;
}

- (void)setLeadingBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingBottomConstraint, 0);
}

@end
