@implementation STUIStatusBarVisualProvider_FixedSplit

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

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[STUIStatusBarVisualProvider_FixedSplit leadingPillInset](self, "leadingPillInset");
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveTargetScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scale");
  UIRoundToScale();
  v6 = v5;

  return v6;
}

- (double)leadingPillInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[STUIStatusBarVisualProvider_FixedSplit pillSize](self, "pillSize");
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveTargetScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scale");
  UIRoundToScale();
  v6 = v5;

  return v6;
}

- (double)leadingSmallPillSpacing
{
  return 6.66666667;
}

- (double)leadingCenteringEdgeInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[STUIStatusBarVisualProvider_FixedSplit notchRect](self, "notchRect");
  -[STUIStatusBarVisualProvider_Split cornerRadius](self, "cornerRadius");
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveTargetScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scale");
  UIRoundToScale();
  v6 = v5;
  objc_msgSend((id)objc_opt_class(), "leadingCenteringOffset");
  v8 = v6 + v7;

  return v8;
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

  -[STUIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
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

  -[STUIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
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
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EFC01D08;
  if (unk_1EFC01D08)
    v4 = byte_1EFC01CCE == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CCE = IsBoldTextEnabled;
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "pillFontSize");
    objc_msgSend(v5, "systemFontOfSize:weight:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)unk_1EFC01D08;
    unk_1EFC01D08 = v6;

    v3 = (void *)unk_1EFC01D08;
  }
  return (UIFont *)v3;
}

- (UIFont)pillSmallFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EFC01D10;
  if (unk_1EFC01D10)
    v4 = byte_1EFC01CCF == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CCF = IsBoldTextEnabled;
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "pillFontSize");
    objc_msgSend(v5, "systemFontOfSize:weight:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)unk_1EFC01D10;
    unk_1EFC01D10 = v6;

    v3 = (void *)unk_1EFC01D10;
  }
  return (UIFont *)v3;
}

- (id)expandedPillFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)qword_1EFC01D18;
  if (qword_1EFC01D18)
    v4 = byte_1EFC01CD0 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CD0 = IsBoldTextEnabled;
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "expandedPillFontSize");
    objc_msgSend(v5, "systemFontOfSize:weight:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1EFC01D18;
    qword_1EFC01D18 = v6;

    v3 = (void *)qword_1EFC01D18;
  }
  return v3;
}

+ (double)additionalBottomLeadingMargin
{
  return 1.0;
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
  v7 = -[STUIStatusBarVisualProvider_Split normalIconSize](self, "normalIconSize");
  +[STUIStatusBarBatteryView _statusBarIntrinsicContentSizeForIconSize:](STUIStatusBarBatteryView, "_statusBarIntrinsicContentSizeForIconSize:", v7);
  v9 = v8;
  +[STUIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:iconSize:](STUIStatusBarCellularSignalView, "_intrinsicContentSizeForNumberOfBars:iconSize:", 4, v7);
  v11 = v9 + v10;
  +[STUIStatusBarWifiSignalView _intrinsicContentSizeForNumberOfBars:iconSize:](STUIStatusBarWifiSignalView, "_intrinsicContentSizeForNumberOfBars:iconSize:", 3, v7);
  v13 = v11 + v12;
  -[STUIStatusBarVisualProvider_Split itemSpacing](self, "itemSpacing");
  v15 = v13 + v14 * 2.0;
  v16 = a3 - v15 * 0.5;
  -[STUIStatusBarVisualProvider_FixedSplit referenceWidth](self, "referenceWidth");
  v18 = v17;
  -[STUIStatusBarVisualProvider_FixedSplit notchSize](self, "notchSize");
  v20 = (v18 - v19) * 0.5 - (v15 + v16);
  -[STUIStatusBarVisualProvider_Split baselineBottomInset](self, "baselineBottomInset");
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

+ (double)trailingEdgeInsetLeadingAdjustment
{
  return 0.0;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
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

  if (self)
  {
    -[STUIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
    -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 0);
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
    v4 = 0.0;
  }
  objc_msgSend((id)objc_opt_class(), "expandedEdgeInset");
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "trailingCenteringOffset");
  v10 = v8 + v9;
  objc_msgSend((id)objc_opt_class(), "expandedEdgeInset");
  v12 = v11;
  v13 = v4;
  v14 = v10;
  v15 = v6;
  result.trailing = v12;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (CGRect)notchRect
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*(_BYTE *)&self->_fixedSplitVisualProviderFlags & 1) == 0)
  {
    *(_BYTE *)&self->_fixedSplitVisualProviderFlags |= 1u;
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_effectiveTargetScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_exclusionArea");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rect");
    v7 = v6;
    objc_msgSend(v4, "_nativeScale");
    v9 = v8 * v7;
    objc_msgSend(v4, "_scale");
    v11 = v9 / v10;
    objc_msgSend(v5, "rect");
    v13 = v12;
    objc_msgSend(v4, "_nativeScale");
    v15 = v14 * v13;
    objc_msgSend(v4, "_scale");
    v17 = v15 / v16;
    objc_msgSend(v5, "rect");
    v19 = v18;
    objc_msgSend(v4, "_nativeScale");
    v21 = v20 * v19;
    objc_msgSend(v4, "_scale");
    v23 = v21 / v22;
    objc_msgSend(v5, "rect");
    v25 = v24;
    objc_msgSend(v4, "_nativeScale");
    v27 = v26 * v25;
    objc_msgSend(v4, "_scale");
    self->_notchRect.origin.x = v11;
    self->_notchRect.origin.y = v17;
    self->_notchRect.size.width = v23;
    self->_notchRect.size.height = v27 / v28;

  }
  x = self->_notchRect.origin.x;
  y = self->_notchRect.origin.y;
  width = self->_notchRect.size.width;
  height = self->_notchRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)notchSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[STUIStatusBarVisualProvider_FixedSplit notchRect](self, "notchRect");
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
  double v34;
  id v35;
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
  id v46;
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
  STUIStatusBarRegion *v58;
  STUIStatusBarRegionAxesLayout *v59;
  STUIStatusBarRegionAxisCenteringLayout *v60;
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
  STUIStatusBarRegion *v78;
  STUIStatusBarRegionAxesLayout *v79;
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
  STUIStatusBarRegion *v100;
  void *v101;
  void *v102;
  STUIStatusBarRegionAxesLayout *v103;
  STUIStatusBarRegionAxisCenteringLayout *v104;
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
  STUIStatusBarRegion *v133;
  STUIStatusBarRegionAxesLayout *v134;
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
  STUIStatusBarRegion *v154;
  STUIStatusBarRegionAxesLayout *v155;
  STUIStatusBarRegionAxisCenteringLayout *v156;
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
  STUIStatusBarRegion *v178;
  STUIStatusBarRegionAxesLayout *v179;
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
  id v199;
  STUIStatusBarRegion *v200;
  STUIStatusBarRegionAxesLayout *v201;
  STUIStatusBarRegionAxisStackingLayout *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  double v211;
  void *v212;
  void *v213;
  void *v214;
  double v215;
  double v216;
  double v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  STUIStatusBarRegion *v223;
  STUIStatusBarRegionAxesLayout *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  double v253;
  double v254;
  void *v255;
  void *v256;
  void *v257;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  id v268;
  double v269;
  void *v270;
  double v271;
  double v272;
  double v273;
  void *v274;
  void *v275;
  id v276;
  id v277;
  _QWORD v278[4];

  v278[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "height");
  v269 = v7;
  -[STUIStatusBarVisualProvider_FixedSplit referenceWidth](self, "referenceWidth");
  v9 = v8;
  -[STUIStatusBarVisualProvider_FixedSplit notchSize](self, "notchSize");
  v11 = v10;
  v13 = v12;
  v14 = (v9 - v10) * 0.5;
  -[STUIStatusBarVisualProvider_Split itemSpacing](self, "itemSpacing");
  v271 = v15;
  -[STUIStatusBarVisualProvider_FixedSplit leadingItemSpacing](self, "leadingItemSpacing");
  v259 = v16;
  -[STUIStatusBarVisualProvider_FixedSplit leadingPillSpacing](self, "leadingPillSpacing");
  v262 = v17;
  -[STUIStatusBarVisualProvider_FixedSplit leadingPillInset](self, "leadingPillInset");
  v263 = v18;
  -[STUIStatusBarVisualProvider_FixedSplit pillCenteringEdgeInset](self, "pillCenteringEdgeInset");
  v260 = v19;
  -[STUIStatusBarVisualProvider_FixedSplit pillSize](self, "pillSize");
  v261 = v20;
  v272 = v21;
  if (self)
  {
    -[STUIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
    -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 0);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v273 = v28;
    -[STUIStatusBarVisualProvider_FixedSplit trailingCenteringEdgeInset](self, "trailingCenteringEdgeInset");
    -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 1);
    v264 = v29;
    v265 = v30;
    v32 = v31;
    v267 = v33;
    objc_msgSend((id)objc_opt_class(), "trailingEdgeInsetLeadingAdjustment");
    v266 = v32 - v34;
  }
  else
  {
    v23 = 0.0;
    v273 = 0.0;
    v27 = 0.0;
    v25 = 0.0;
    v265 = 0.0;
    v266 = 0.0;
    v267 = 0.0;
    v264 = 0.0;
  }
  v35 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v35, "setIdentifier:", CFSTR("cutout"));
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v38);

  objc_msgSend(v5, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  objc_msgSend(v35, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v43);

  objc_msgSend(v35, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", v13);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v45);

  objc_msgSend(v5, "addLayoutGuide:", v35);
  -[STUIStatusBarVisualProvider_Split setCutoutLayoutGuide:](self, "setCutoutLayoutGuide:", v35);

  v46 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v46, "setIdentifier:", CFSTR("UIStatusBarMainRegions"));
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v274 = v5;
  objc_msgSend(v5, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v49);

  objc_msgSend(v46, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToConstant:", v9);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v51);

  objc_msgSend(v46, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToConstant:", v13);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v53);

  objc_msgSend(v46, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v57);

  objc_msgSend(v5, "addLayoutGuide:", v46);
  -[STUIStatusBarVisualProvider_Split setMainRegionsLayoutGuide:](self, "setMainRegionsLayoutGuide:", v46);

  v58 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("leading"));
  v59 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v60 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setInterspace:](v60, "setInterspace:", v259);
  -[STUIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v60, "setMaxNumberOfItems:", 3);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v59, "setHorizontalLayout:", v60);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v59, "setVerticalLayout:", v61);

  -[STUIStatusBarRegion setLayout:](v58, "setLayout:", v59);
  -[STUIStatusBarRegion setActionInsets:](v58, "setActionInsets:", -v23, -v25, -(v269 + v27 - v13), -v273);
  -[STUIStatusBarRegion layoutItem](v58, "layoutItem");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, v23);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v66);

  objc_msgSend(v62, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
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
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, v25);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v75);

  v270 = v62;
  objc_msgSend(v62, "widthAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToConstant:", v14 - (v273 + v25));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v77);

  objc_msgSend(v274, "_ui_addSubLayoutItem:", v62);
  objc_msgSend(v275, "addObject:", v58);

  v78 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pill"));
  v79 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v79, "setHorizontalLayout:", v80);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v79, "setVerticalLayout:", v81);

  -[STUIStatusBarRegion setLayout:](v78, "setLayout:", v79);
  -[STUIStatusBarRegion setActionInsets:](v78, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  -[STUIStatusBarRegion layoutItem](v78, "layoutItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v86);

  -[STUIStatusBarRegion layoutItem](v78, "layoutItem");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "centerXAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89, v260);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v90);

  -[STUIStatusBarRegion layoutItem](v78, "layoutItem");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "widthAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToConstant:", v261);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v93);

  -[STUIStatusBarRegion layoutItem](v78, "layoutItem");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "heightAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToConstant:", v272);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v96);

  -[STUIStatusBarRegion layoutItem](v78, "layoutItem");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v97);

  objc_msgSend(v275, "addObject:", v78);
  objc_msgSend(v275, "lastObject");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setPillRegion:", v98);

  v100 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pillContent"));
  -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "pillRegion");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setEnabilityRegion:](v100, "setEnabilityRegion:", v102);

  v103 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v104 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setInterspace:](v104, "setInterspace:", v262);
  -[STUIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v104, "setMaxNumberOfItems:", 2);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v103, "setHorizontalLayout:", v104);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v103, "setVerticalLayout:", v105);

  -[STUIStatusBarRegion setLayout:](v100, "setLayout:", v103);
  +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setTextColor:", v107);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setImageTintColor:", v108);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setImageDimmedTintColor:", v109);

  -[STUIStatusBarVisualProvider_FixedSplit pillFont](self, "pillFont");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setFont:", v110);

  -[STUIStatusBarVisualProvider_FixedSplit pillSmallFont](self, "pillSmallFont");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setSmallFont:", v111);

  -[STUIStatusBarVisualProvider_FixedSplit pillFont](self, "pillFont");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setEmphasizedFont:", v112);

  objc_msgSend(v106, "setSymbolScale:", 2);
  -[STUIStatusBarRegion setOverriddenStyleAttributes:](v100, "setOverriddenStyleAttributes:", v106);
  -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "pillRegion");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "layoutItem");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarRegion layoutItem](v100, "layoutItem");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "topAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "topAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v119);

  -[STUIStatusBarRegion layoutItem](v100, "layoutItem");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v123);

  -[STUIStatusBarRegion layoutItem](v100, "layoutItem");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "leadingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:constant:", v126, v263);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v127);

  -[STUIStatusBarRegion layoutItem](v100, "layoutItem");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "trailingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:constant:", v130, -v263);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v131);

  -[STUIStatusBarRegion layoutItem](v100, "layoutItem");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v132);

  objc_msgSend(v275, "addObject:", v100);
  v133 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("trailing"));
  v134 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v134, "setVerticalLayout:", v135);

  -[STUIStatusBarRegion setLayout:](v133, "setLayout:", v134);
  -[STUIStatusBarRegion setActionInsets:](v133, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  -[STUIStatusBarRegion layoutItem](v133, "layoutItem");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setFont:", v138);

  -[STUIStatusBarVisualProvider_Split normalFont](self, "normalFont");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setSmallFont:", v139);

  objc_msgSend(v137, "setImageNamePrefixes:", &unk_1E8D80360);
  -[STUIStatusBarRegion setOverriddenStyleAttributes:](v133, "setOverriddenStyleAttributes:", v137);
  objc_msgSend(v136, "topAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "topAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintEqualToAnchor:constant:", v142, v264);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v143);

  objc_msgSend(v136, "bottomAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "bottomAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "constraintEqualToAnchor:constant:", v146, -v265);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v147);

  objc_msgSend(v136, "trailingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:constant:", v150, -v267);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v151);

  objc_msgSend(v136, "widthAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "constraintEqualToConstant:", v14 - (v266 + v267));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v153);

  objc_msgSend(v274, "_ui_addSubLayoutItem:", v136);
  objc_msgSend(v275, "addObject:", v133);

  v154 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("systemUpdates"));
  v155 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v156 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v156, "setMaxNumberOfItems:", 3);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v155, "setHorizontalLayout:", v156);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v155, "setVerticalLayout:", v157);

  -[STUIStatusBarRegion setLayout:](v154, "setLayout:", v155);
  +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setImageNamePrefixes:", &unk_1E8D80378);
  -[STUIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setFont:", v159);

  -[STUIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setEmphasizedFont:", v160);

  objc_msgSend(v158, "setSymbolScale:", 2);
  -[STUIStatusBarRegion setOverriddenStyleAttributes:](v154, "setOverriddenStyleAttributes:", v158);
  -[STUIStatusBarRegion layoutItem](v154, "layoutItem");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "topAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "topAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:", v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v164);

  -[STUIStatusBarRegion layoutItem](v154, "layoutItem");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "bottomAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "bottomAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToAnchor:", v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v168);

  -[STUIStatusBarRegion layoutItem](v154, "layoutItem");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "rightAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "rightAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "constraintEqualToAnchor:", v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v172);

  -[STUIStatusBarRegion layoutItem](v154, "layoutItem");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "leftAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "leftAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "constraintEqualToAnchor:", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v176);

  -[STUIStatusBarRegion layoutItem](v154, "layoutItem");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v177);

  objc_msgSend(v275, "addObject:", v154);
  v178 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("controlCenter"));
  v179 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v179, "setHorizontalLayout:", v180);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v179, "setVerticalLayout:", v181);

  -[STUIStatusBarRegion setLayout:](v178, "setLayout:", v179);
  -[STUIStatusBarRegion layoutItem](v178, "layoutItem");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "topAnchor");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "bottomAnchor");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "constraintEqualToAnchor:constant:", v185, 6.0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v186);

  -[STUIStatusBarRegion layoutItem](v178, "layoutItem");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "heightAnchor");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split grabberHeight](self, "grabberHeight");
  objc_msgSend(v188, "constraintEqualToConstant:");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v189);

  -[STUIStatusBarRegion layoutItem](v178, "layoutItem");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leftAnchor");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "leftAnchor");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "constraintEqualToAnchor:constant:", v192, 10.0);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v193);

  -[STUIStatusBarRegion layoutItem](v178, "layoutItem");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "rightAnchor");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "rightAnchor");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "constraintEqualToAnchor:constant:", v196, -10.0);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v197);

  -[STUIStatusBarRegion layoutItem](v178, "layoutItem");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v198);

  objc_msgSend(v275, "addObject:", v178);
  v276 = v275;
  v277 = v6;
  -[STUIStatusBarVisualProvider_Split _setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:](self, "_setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:", v274, &v277, &v276, v13);
  v199 = v277;

  v268 = v276;
  v200 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottomLeading"));
  v201 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v202 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v202, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v202, "setInterspace:", v271);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v201, "setHorizontalLayout:", v202);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v201, "setVerticalLayout:", v203);

  -[STUIStatusBarRegion setLayout:](v200, "setLayout:", v201);
  -[STUIStatusBarRegion setActionInsets:](v200, "setActionInsets:", -100.0, -12.0, -10.0, -12.0);
  -[STUIStatusBarRegion layoutItem](v200, "layoutItem");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "leadingAnchor");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "leadingAnchor");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  objc_msgSend(v205, "constraintEqualToAnchor:constant:", v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v207);

  -[STUIStatusBarRegion layoutItem](v200, "layoutItem");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "bottomAnchor");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "topAnchor");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "height");
  objc_msgSend(v209, "constraintEqualToAnchor:constant:", v210, v211 + -6.0);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v212);

  -[STUIStatusBarRegion layoutItem](v200, "layoutItem");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "widthAnchor");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_FixedSplit notchRect](self, "notchRect");
  v216 = floor(v215);
  objc_msgSend((id)objc_opt_class(), "additionalBottomLeadingMargin");
  objc_msgSend(v214, "constraintEqualToConstant:", v216 - v217);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v218);

  -[STUIStatusBarRegion layoutItem](v200, "layoutItem");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "heightAnchor");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "constraintEqualToConstant:", 13.3333333);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v221);

  -[STUIStatusBarRegion layoutItem](v200, "layoutItem");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "_ui_insertSubLayoutItem:atIndex:", v222, 0);

  objc_msgSend(v268, "addObject:", v200);
  v223 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("topTrailing"));
  v224 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v224, "setHorizontalLayout:", v225);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 3);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v224, "setVerticalLayout:", v226);

  -[STUIStatusBarRegion setLayout:](v223, "setLayout:", v224);
  -[STUIStatusBarRegion layoutItem](v223, "layoutItem");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "leadingAnchor");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "trailingAnchor");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "constraintEqualToAnchor:constant:", v230, 6.66666667);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v231);

  -[STUIStatusBarRegion layoutItem](v223, "layoutItem");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "topAnchor");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "topAnchor");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "constraintEqualToAnchor:constant:", v234, 6.33333333);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v235);

  -[STUIStatusBarRegion layoutItem](v223, "layoutItem");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "trailingAnchor");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "trailingAnchor");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "constraintEqualToAnchor:constant:", v238, -30.0);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v239);

  -[STUIStatusBarRegion layoutItem](v223, "layoutItem");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "heightAnchor");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "constraintEqualToConstant:", 4.0);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "addObject:", v242);

  -[STUIStatusBarRegion layoutItem](v223, "layoutItem");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v243);

  objc_msgSend(v268, "addObject:", v223);
  STUIStatusBarAddLumaView(v274, v199, v270, 0, v272);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setLeadingBackgroundLumaView:](self, "setLeadingBackgroundLumaView:", v244);

  STUIStatusBarAddLumaView(v274, v199, v136, 0, v272);
  v245 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_Split setTrailingBackgroundLumaView:](self, "setTrailingBackgroundLumaView:", v245);
  v246 = objc_alloc(MEMORY[0x1E0DC4288]);
  -[STUIStatusBarVisualProvider_Split leadingBackgroundLumaView](self, "leadingBackgroundLumaView");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v278[0] = v247;
  -[STUIStatusBarVisualProvider_Split trailingBackgroundLumaView](self, "trailingBackgroundLumaView");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v278[1] = v248;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v278, 2);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v250 = (void *)objc_msgSend(v246, "initWithTransitionBoundaries:minimumDifference:delegate:views:", self, v249, 0.4, 0.7, 0.5);
  -[STUIStatusBarVisualProvider_iOS setLumaTrackingGroup:](self, "setLumaTrackingGroup:", v250);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v199);
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "visualProviderSettings");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "backgroundActivityCoalescingDelay");
  v254 = v253;

  if (v254 > 0.0)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "dataAggregator");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0C98]);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "beginCoalescingUpdatesForEntryKeys:delay:", v257, v254);

  }
  return v268;
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
  void *v10;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
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
  int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  STUIStatusBarVisualProvider_FixedSplit *v77;
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
  _QWORD v102[5];
  objc_super v103;
  _QWORD v104[2];
  void *v105;
  _QWORD v106[4];
  _QWORD v107[2];
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[8];
  _QWORD v116[3];
  _QWORD v117[3];
  uint64_t v118;
  _QWORD v119[2];
  _QWORD v120[3];
  _QWORD v121[2];
  _QWORD v122[4];
  _QWORD v123[5];

  v123[3] = *MEMORY[0x1E0C80C00];
  v103.receiver = self;
  v103.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  -[STUIStatusBarVisualProvider_Split _orderedDisplayItemPlacements](&v103, sel__orderedDisplayItemPlacements);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarIndicatorQuietModeItem emphasizedQuietModeIdentifier](STUIStatusBarIndicatorQuietModeItem, "emphasizedQuietModeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v3, 997);
  v4 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarIndicatorLocationItem groupWithPriority:](STUIStatusBarIndicatorLocationItem, "groupWithPriority:", 1000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarCellularItem nameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "nameDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 1010);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prominentPlacement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v8;
  objc_msgSend(v5, "regularPlacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v9;
  v123[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excludingPlacements:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setServiceNamePlacement:](self, "setServiceNamePlacement:", v11);

  +[STUIStatusBarCellularCondensedItem dualNameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualNameDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v12, 1011);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prominentPlacement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v14;
  objc_msgSend(v5, "regularPlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v15;
  v122[2] = v4;
  v101 = (void *)v4;
  -[STUIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v122[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "excludingPlacements:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setDualServiceNamePlacement:](self, "setDualServiceNamePlacement:", v18);

  +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v19, 1012);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v21;
  -[STUIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "excludingPlacements:", v23);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v24, 1014);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prominentPlacement");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v26;
  objc_msgSend(v5, "regularPlacement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v27;
  v120[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "excludingPlacements:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_FixedSplit leadingSmallPillSpacing](self, "leadingSmallPillSpacing");
  v31 = v30;
  -[STUIStatusBarVisualProvider_FixedSplit leadingItemSpacing](self, "leadingItemSpacing");
  +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 1013, v31 + v32 * -2.0, 0.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v33, 1900);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v34, 1800);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v35, 1950);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v98;
  v119[1] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "excludingPlacements:", v37);
  v38 = objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)v38;
  objc_msgSend(v39, "setPillIconPlacement:", v38);

  +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v40, 1949);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "requiringAllPlacements:", v42);
  v43 = objc_claimAutoreleasedReturnValue();

  v116[0] = CFSTR("leading");
  v115[0] = v100;
  -[STUIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v92;
  v77 = self;
  -[STUIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v91;
  v114 = v100;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "requiringAllPlacements:", v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v89;
  objc_msgSend(v5, "regularPlacement");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "excludingPlacements:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v100;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "requiringAllPlacements:", v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v115[4] = v84;
  objc_msgSend(v5, "prominentPlacement");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "excludingPlacements:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v100;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "requiringAllPlacements:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v79;
  v109 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "requiringAllPlacements:", v78);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v44;
  v115[7] = v29;
  v95 = (void *)v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v45;
  v116[1] = CFSTR("pill");
  +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v46, 2000);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = CFSTR("leading");
  v107[1] = CFSTR("bottomLeading");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "excludingAllPlacementsInRegions:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v50;
  v116[2] = CFSTR("pillContent");
  v106[0] = v96;
  v106[1] = v43;
  v93 = (void *)v43;
  v106[2] = v98;
  v106[3] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "addEntriesFromDictionary:", v52);

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "visualProviderSettings");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v47) = objc_msgSend(v54, "enableActivity");

  if ((_DWORD)v47)
  {
    +[STUIStatusBarActivityItem_Split pillDisplayIdentifier](STUIStatusBarActivityItem_Split, "pillDisplayIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v55, 100);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v57, CFSTR("topTrailing"));

  }
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "visualProviderSettings");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "promoteThermalWarning");

  if (v60)
  {
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("trailing"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v61, "mutableCopy");

    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke;
    v102[3] = &unk_1E8D64338;
    v102[4] = v77;
    v63 = objc_msgSend(v62, "indexOfObjectPassingTest:", v102);
    v64 = objc_msgSend(v62, "indexOfObjectPassingTest:", &__block_literal_global_393);
    if (v64 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v65 = 0;
    }
    else
    {
      objc_msgSend(v62, "objectAtIndexedSubscript:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v66 = objc_msgSend(v62, "indexOfObjectPassingTest:", &__block_literal_global_394);
    if (v66 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v67 = 0;
    }
    else
    {
      objc_msgSend(v62, "objectAtIndexedSubscript:", v66);
      v68 = objc_claimAutoreleasedReturnValue();
      v67 = (void *)v68;
      if (v63 != 0x7FFFFFFFFFFFFFFFLL && v65 && v68)
      {
        +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarThermalItem, "defaultDisplayIdentifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v69, 1110);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v104[0] = v65;
        v104[1] = v67;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "excludingPlacements:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "insertObject:atIndex:", v72, v63);

      }
    }
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v62, CFSTR("trailing"));

    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("systemUpdates"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v73, "mutableCopy");

    v75 = objc_msgSend(v74, "indexOfObjectPassingTest:", &__block_literal_global_395);
    if (v75 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v74, "removeObjectAtIndex:", v75);
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v74, CFSTR("systemUpdates"));

  }
  return v94;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacements](self, "orderedDisplayItemPlacements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[STUIStatusBarVisualProvider_FixedSplit _orderedDisplayItemPlacements](self, "_orderedDisplayItemPlacements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split setOrderedDisplayItemPlacements:](self, "setOrderedDisplayItemPlacements:", v6);

  }
  -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacements](self, "orderedDisplayItemPlacements");
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
  v12.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  -[STUIStatusBarVisualProvider_Split styleAttributesForStyle:](&v12, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_FixedSplit referenceWidth](self, "referenceWidth");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_unjailedReferenceBounds");
  Width = CGRectGetWidth(v13);

  v9 = objc_msgSend(v4, "mode");
  if ((unint64_t)(v9 - 2) < 2)
    goto LABEL_4;
  if (v9 == 1)
  {
    v10 = 0;
    goto LABEL_6;
  }
  if (!v9)
  {
LABEL_4:
    v10 = v6 != Width;
LABEL_6:
    objc_msgSend(v4, "setScaledFixedWidthBar:", v10);
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
  +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarExpandedPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_FixedSplit expandedPillFont](self, "expandedPillFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[STUIStatusBarVisualProvider_FixedSplit expandedPillFont](self, "expandedPillFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSmallFont:", v8);

    -[STUIStatusBarVisualProvider_FixedSplit expandedPillSize](self, "expandedPillSize");
    objc_msgSend(v6, "setIconScale:", v9 / 21.3333333);
    objc_msgSend(v6, "setSymbolScale:", 2);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
    -[STUIStatusBarVisualProvider_Split overriddenStyleAttributesForDisplayItemWithIdentifier:](&v11, sel_overriddenStyleAttributesForDisplayItemWithIdentifier_, v4);
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
  v8.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  -[STUIStatusBarVisualProvider_Split itemCreated:](&v8, sel_itemCreated_, v4);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem identifier](STUIStatusBarExpandedPillBackgroundActivityItem, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v7 = v4;
    -[STUIStatusBarVisualProvider_FixedSplit expandedPillSize](self, "expandedPillSize");
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
  STUIStatusBarRegionAxisStackingLayout *v13;

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
      v13 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
      -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v13, "setAlignment:", 4);
      -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v13, "setInterspace:", 6.0);
    }
    else
    {
      v13 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
      -[STUIStatusBarRegionAxisStackingLayout setMargin:](v13, "setMargin:", 0.0);
      -[STUIStatusBarRegionAxisStackingLayout setMaxNumberOfItems:](v13, "setMaxNumberOfItems:", 3);
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

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAggregatedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_FixedSplit _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

}

- (void)dataUpdated:(id)a3
{
  id v4;

  v4 = a3;
  -[STUIStatusBarVisualProvider_FixedSplit _updateSystemNavigationWithData:](self, "_updateSystemNavigationWithData:", v4);
  -[STUIStatusBarVisualProvider_FixedSplit _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

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
  v13.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  -[STUIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](&v13, sel_regionIdentifiersForPartWithIdentifier_, v4);
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
      if (objc_msgSend(v4, "isEqual:", CFSTR("normalPartIdentifier")))
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
      goto LABEL_19;
    v10 = (void *)v9;
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentAggregatedData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backNavigationEntry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEnabled");

    if (!v14)
      goto LABEL_19;
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
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
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
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentAggregatedData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "backgroundActivityEntry");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "regions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leading"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    -[STUIStatusBarVisualProvider_FixedSplit leadingCenteringEdgeInset](self, "leadingCenteringEdgeInset");
    -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 0);
    v27 = v26;
  }
  else
  {
    v27 = 0.0;
  }
  if (objc_msgSend(v8, "isEnabled") && (objc_msgSend(v19, "isEnabled") & 1) == 0)
  {
    -[STUIStatusBarVisualProvider_Split bottomLeadingTopOffset](self, "bottomLeadingTopOffset");
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
  v31[2] = __74__STUIStatusBarVisualProvider_FixedSplit__updateSystemNavigationWithData___block_invoke;
  v31[3] = &unk_1E8D62A38;
  v31[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v31, 0, 200.0, 20.0);

LABEL_19:
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
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAggregatedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "voiceControlEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEnabled");

  if (v12)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_shouldReverseLayoutDirection");

    if (v14)
      v15 = -1.0;
    else
      v15 = 1.0;
    +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a4, a5, v15 * 5.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPriority:", 30);
    +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubAnimation:forDisplayItemWithIdentifier:", v16, v17);

    +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a4, a5, v15 * -5.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPriority:", 30);
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
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
  v7.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  v4 = -[STUIStatusBarVisualProvider_Split _updateLowerRegionsWithData:](&v7, sel__updateLowerRegionsWithData_, a3);
  if (v4)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingBottomConstraint, 0);
}

@end
