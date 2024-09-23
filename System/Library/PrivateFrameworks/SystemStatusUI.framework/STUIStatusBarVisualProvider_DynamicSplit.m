@implementation STUIStatusBarVisualProvider_DynamicSplit

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  int IsBoldTextEnabled;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      v15.receiver = self;
      v15.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
      -[STUIStatusBarVisualProvider_Split overriddenStyleAttributesForDisplayItemWithIdentifier:](&v15, sel_overriddenStyleAttributesForDisplayItemWithIdentifier_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
    v10 = (void *)qword_1EFC01C60;
    if (!qword_1EFC01C60 || _MergedGlobals_11 != IsBoldTextEnabled)
    {
      _MergedGlobals_11 = IsBoldTextEnabled;
      v11 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend((id)objc_opt_class(), "baseFontSize");
      objc_msgSend(v11, "systemFontOfSize:weight:design:", *MEMORY[0x1E0DC13A8]);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)qword_1EFC01C60;
      qword_1EFC01C60 = v12;

      v10 = (void *)qword_1EFC01C60;
    }
    self = v10;
  }
  objc_msgSend(v8, "setFont:", self);

LABEL_11:
  return v8;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "showRingerOnAODLockScreen"))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v4, "isEqual:", CFSTR("aodPartIdentifier"));

  if (!v7)
  {
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
    -[STUIStatusBarVisualProvider_Split displayItemIdentifiersForPartWithIdentifier:](&v12, sel_displayItemIdentifiersForPartWithIdentifier_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x1E0C99E60];
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorRingerSilenceItem, "defaultDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v10;
}

- (double)normalIconScale
{
  return 1.26;
}

- (void)itemCreated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  -[STUIStatusBarVisualProvider_Split itemCreated:](&v13, sel_itemCreated_, v4);
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "showRingerOffLockScreen") & 1) != 0)
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorRingerSilenceItem, "defaultDisplayIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayItemForIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarVisualProvider_DynamicSplit _updateRingerDisplayItem:enabled:]((uint64_t)self, v9, -[STUIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen"));
LABEL_10:

      goto LABEL_11;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STUIStatusBarCellularItem nameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "nameDisplayIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayItemForIdentifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = 2.0;
    else
      v11 = 0.0;
    objc_msgSend(v8, "setAdditionalDynamicPadding:", v11);
    +[STUIStatusBarCellularCondensedItem dualNameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualNameDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayItemForIdentifier:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAdditionalDynamicPadding:", v11);
    goto LABEL_10;
  }
LABEL_11:

}

- (double)sensorAreaRect
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

  if (!a1)
    return 0.0;
  if ((*(_BYTE *)(a1 + 296) & 1) == 0)
  {
    *(_BYTE *)(a1 + 296) |= 1u;
    objc_msgSend((id)a1, "statusBar");
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
    *(double *)(a1 + 224) = v10;
    *(double *)(a1 + 232) = v16;
    *(double *)(a1 + 240) = v22;
    *(double *)(a1 + 248) = v26 / v27;

  }
  return *(double *)(a1 + 224);
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

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  BOOL v16;
  void *v17;
  unsigned int v18;
  int v19;
  id v20;
  BSAnimationSettings *currentAnimationSettings;
  int *v22;
  double v23;
  double v24;
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
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  NSLayoutConstraint *cutoutWidthConstraint;
  double v41;
  NSLayoutConstraint *v42;
  void *v43;
  void *v44;
  BSAnimationSettings *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  id v51;
  unsigned int v52;
  int v53;
  _QWORD block[5];
  _QWORD v55[5];
  _QWORD v56[5];
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62[2];

  v5 = a5;
  v7 = a4;
  v8 = _avoidanceFrameInLocalCoordinateSpace(self);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0.0;
  v62[0] = 0.0;
  v16 = -[STUIStatusBarVisualProvider_DynamicSplit _needsUpdateOfConstraintsForAvoidanceFrame:cutoutOffset:cutoutWidth:]((id *)&self->super.super.super.super.isa, v62, &v61, v8, v10, v12, v14);
  objc_msgSend(v15, "currentAggregatedData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemNavigationWithData:avoidanceFrame:]((id *)&self->super.super.super.super.isa, v17, v8, v10, v12, v14);

  if (v16)
  {
    if (!self)
    {
      v19 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    if (!self)
      goto LABEL_38;
    if (!self->_forceAvoidanceRectUpdate)
    {
      if (!v18)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  v19 = 0;
  self->_forceAvoidanceRectUpdate = 0;
LABEL_7:
  if (v7 || (v5 & 2) != 0)
    v20 = v7;
  currentAnimationSettings = self->_currentAnimationSettings;
  self->_currentAnimationSettings = (BSAnimationSettings *)v7;

  v22 = &OBJC_IVAR___STUIStatusBarVisualProvider_LegacyPhone__centerBackgroundLumaView;
  if ((v5 & 1) != 0)
  {
    if (v19)
    {
      v36 = 0;
      v35 = v62[0];
      goto LABEL_20;
    }
    self->_forceAvoidanceRectUpdate = 1;
    v35 = v62[0];
  }
  else
  {
    v49 = v5;
    v52 = v18;
    v59 = 0.0;
    v60 = 0.0;
    v58 = 0;
    v57 = 0;
    v24 = v61;
    v23 = v62[0];
    objc_msgSend(v15, "currentAggregatedData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sensorActivityEntry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "isEnabled");
    -[STUIStatusBarVisualProvider_DynamicSplit _calculateSquishyLayoutValuesForCutoutOffset:cutoutWidth:maxLeadingItems:maxTrailingItems:leadingScale:trailingScale:includingPrivacyIndicator:]((uint64_t)self, &v58, &v57, &v60, &v59, v23, v24);

    objc_msgSend(v15, "regionWithIdentifier:", CFSTR("leading"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "horizontalLayout");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (_updateSquishyRegionForDynamicValues(v46, v58, v60))
    {
      objc_msgSend(v27, "setNeedsReLayout:", 1, v46);
      objc_msgSend(v28, "invalidate");
    }
    v48 = v27;
    v51 = v7;
    v50 = v15;
    objc_msgSend(v15, "regionWithIdentifier:", CFSTR("trailing"), v46);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "horizontalLayout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (_updateSquishyRegionForDynamicValues(v31, v57, v59))
    {
      objc_msgSend(v29, "setNeedsReLayout:", 1);
      objc_msgSend(v30, "invalidate");
    }
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "regions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("systemUpdates"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemUpdateRegionEnablement:forTrailingNumberOfItems:]((uint64_t)self, v34, v57) | v52;
    v35 = v62[0];
    if ((v19 & 1) != 0)
    {
      v36 = 0;
      v15 = v50;
      v7 = v51;
      LOBYTE(v18) = v53;
      v5 = v49;
      v22 = &OBJC_IVAR___STUIStatusBarVisualProvider_LegacyPhone__centerBackgroundLumaView;
      goto LABEL_20;
    }
    v15 = v50;
    v7 = v51;
    LOBYTE(v18) = v53;
    v5 = v49;
    v22 = &OBJC_IVAR___STUIStatusBarVisualProvider_LegacyPhone__centerBackgroundLumaView;
  }
  v36 = *(Class *)((char *)&self->super.super.super.super.isa + v22[45]);
LABEL_20:
  objc_msgSend(v36, "constant");
  if (v35 != v37)
  {
    if ((v19 & 1) != 0)
      v38 = 0;
    else
      v38 = *(Class *)((char *)&self->super.super.super.super.isa + v22[45]);
    objc_msgSend(v38, "setConstant:", v62[0]);
  }
  v39 = v61;
  if ((v19 & 1) != 0)
    cutoutWidthConstraint = 0;
  else
    cutoutWidthConstraint = self->_cutoutWidthConstraint;
  -[NSLayoutConstraint constant](cutoutWidthConstraint, "constant");
  if (v39 != v41)
  {
    if ((v19 & 1) != 0)
      v42 = 0;
    else
      v42 = self->_cutoutWidthConstraint;
    -[NSLayoutConstraint setConstant:](v42, "setConstant:", v61);
  }
  if ((v5 & 2) != 0)
  {
    -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "owningView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutSubviews");

  }
  else if (v7)
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke;
    v56[3] = &unk_1E8D63300;
    v56[4] = self;
    objc_msgSend(MEMORY[0x1E0D016B0], "tryAnimatingWithSettings:fromCurrentState:actions:completion:", v7, 1, v56, 0);
  }
  else
  {
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_2;
    v55[3] = &unk_1E8D62A38;
    v55[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v55);
  }
  v45 = self->_currentAnimationSettings;
  self->_currentAnimationSettings = 0;

LABEL_38:
  if ((v18 & 1) != 0)
  {
LABEL_39:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_3;
    block[3] = &unk_1E8D62A38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
LABEL_40:

}

- (void)dataUpdated:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  unsigned __int8 v9;
  _BOOL4 v10;
  id v11;

  v4 = a3;
  v5 = _avoidanceFrameInLocalCoordinateSpace(self);
  v9 = -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemNavigationWithData:avoidanceFrame:]((id *)&self->super.super.super.super.isa, v4, v5, v6, v7, v8);
  v10 = -[STUIStatusBarVisualProvider_Split _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v4);

  if ((v9 & 1) != 0 || v10)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

+ (double)height
{
  return 53.6666667;
}

- (id)setupInContainerView:(id)a3
{
  id v4;
  void *v5;
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
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSLayoutConstraint *cutoutWidthConstraint;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
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
  STUIStatusBarRegion *v59;
  STUIStatusBarRegionAxesLayout *v60;
  STUIStatusBarRegionAxisSquishyLayout *v61;
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
  STUIStatusBarRegion *v81;
  STUIStatusBarRegionAxesLayout *v82;
  STUIStatusBarRegionAxisSquishyLayout *v83;
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
  STUIStatusBarRegion *v104;
  STUIStatusBarRegionAxesLayout *v105;
  STUIStatusBarRegionAxisCenteringLayout *v106;
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
  STUIStatusBarRegion *v128;
  STUIStatusBarRegionAxesLayout *v129;
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
  double v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  id v158;
  STUIStatusBarRegion *v159;
  STUIStatusBarRegionAxesLayout *v160;
  STUIStatusBarRegionAxisStackingLayout *v161;
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
  double v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  double v178;
  void *v179;
  void *v180;
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
  void *v192;
  double v193;
  double v194;
  double v195;
  void *v196;
  double v197;
  double v198;
  void *v199;
  double v200;
  void *v201;
  void *v202;
  id v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  double v207;
  double v208;
  double v209;
  double v210;
  _QWORD v211[4];

  v211[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "height");
  v198 = v6;
  -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)self);
  v8 = v7;
  v10 = v9;
  v197 = -[STUIStatusBarVisualProvider_DynamicSplit edgeInsets]((uint64_t)self);
  v12 = v11;
  v194 = v13;
  v195 = v14;
  -[STUIStatusBarVisualProvider_DynamicSplit leadingItemSpacing](self, "leadingItemSpacing");
  v193 = v15;
  -[STUIStatusBarVisualProvider_DynamicSplit itemSpacing](self, "itemSpacing");
  v200 = v16;
  -[STUIStatusBarVisualProvider_Split normalFont](self, "normalFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "capHeight");
  v19 = v18;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "avoidanceFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v209 = 0.0;
  v210 = 0.0;
  -[STUIStatusBarVisualProvider_DynamicSplit _needsUpdateOfConstraintsForAvoidanceFrame:cutoutOffset:cutoutWidth:]((id *)&self->super.super.super.super.isa, &v210, &v209, v22, v24, v26, v28);
  v207 = 0.0;
  v208 = 0.0;
  v205 = 0;
  v206 = 0;
  -[STUIStatusBarVisualProvider_DynamicSplit _calculateSquishyLayoutValuesForCutoutOffset:cutoutWidth:maxLeadingItems:maxTrailingItems:leadingScale:trailingScale:includingPrivacyIndicator:]((uint64_t)self, &v206, &v205, &v208, &v207, v210, v209);
  v29 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v29, "setIdentifier:", CFSTR("UIStatusBarCutout"));
  objc_msgSend(v29, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v32);

  objc_msgSend(v4, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, v210);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (self)
  {
    objc_storeStrong((id *)&self->_cutoutCenterConstraint, v35);

    objc_msgSend(v5, "addObject:", self->_cutoutCenterConstraint);
    objc_msgSend(v29, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", v209);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_cutoutWidthConstraint, v38);

    cutoutWidthConstraint = self->_cutoutWidthConstraint;
    v40 = 8.0;
    v41 = 0.94;
  }
  else
  {

    objc_msgSend(v5, "addObject:", 0);
    objc_msgSend(v29, "widthAnchor");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "constraintEqualToConstant:", v209);

    cutoutWidthConstraint = 0;
    v41 = 0.0;
    v40 = 0.0;
  }
  objc_msgSend(v5, "addObject:", cutoutWidthConstraint);
  objc_msgSend(v29, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", v10);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v43);

  objc_msgSend(v4, "addLayoutGuide:", v29);
  -[STUIStatusBarVisualProvider_Split setCutoutLayoutGuide:](self, "setCutoutLayoutGuide:", v29);

  v44 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v44, "setIdentifier:", CFSTR("UIStatusBarMainRegions"));
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v48) = 1144750080;
  objc_msgSend(v47, "setPriority:", v48);
  objc_msgSend(v5, "addObject:", v47);
  objc_msgSend(v44, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", -[STUIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth]((uint64_t)self));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v51) = 1144750080;
  objc_msgSend(v50, "setPriority:", v51);
  objc_msgSend(v5, "addObject:", v50);
  objc_msgSend(v44, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToConstant:", v10);
  v53 = v4;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v54);

  objc_msgSend(v44, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v58);

  v201 = v53;
  objc_msgSend(v53, "addLayoutGuide:", v44);

  -[STUIStatusBarVisualProvider_Split setMainRegionsLayoutGuide:](self, "setMainRegionsLayoutGuide:", v44);
  v59 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("leading"));
  v60 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v61 = objc_alloc_init(STUIStatusBarRegionAxisSquishyLayout);
  -[STUIStatusBarRegionAxisSquishyLayout setAlignment:](v61, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisSquishyLayout setInterspace:](v61, "setInterspace:", v193);
  -[STUIStatusBarRegionAxisSquishyLayout setCompressItems:](v61, "setCompressItems:", 1);
  -[STUIStatusBarRegionAxisSquishyLayout setMaxNumberOfItems:](v61, "setMaxNumberOfItems:", 3);
  _updateSquishyRegionForDynamicValues(v61, v206, v208);
  -[STUIStatusBarRegionAxisSquishyLayout setMinItemDynamicScale:](v61, "setMinItemDynamicScale:", v41);
  -[STUIStatusBarRegionAxisSquishyLayout setMinInterspaceDynamicScale:](v61, "setMinInterspaceDynamicScale:", 0.6);
  -[STUIStatusBarRegionAxisSquishyLayout setDynamicHidingDelegate:](v61, "setDynamicHidingDelegate:", self);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v60, "setHorizontalLayout:", v61);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v60, "setVerticalLayout:", v62);

  -[STUIStatusBarRegion setLayout:](v59, "setLayout:", v60);
  -[STUIStatusBarRegion setActionInsets:](v59, "setActionInsets:", -v197, -v12, -(v198 + v194 - v10), -v195);
  -[STUIStatusBarRegion setDisableItemFrameBasedOverflow:](v59, "setDisableItemFrameBasedOverflow:", 1);
  -[STUIStatusBarRegion layoutItem](v59, "layoutItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "centerYAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "centerYAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, v197);
  v67 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingCenterYConstraint = self->_leadingCenterYConstraint;
  self->_leadingCenterYConstraint = v67;

  objc_msgSend(v5, "addObject:", self->_leadingCenterYConstraint);
  v69 = v63;
  objc_msgSend(v63, "heightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToConstant:", v19 + 1.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v71);

  objc_msgSend(v63, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, v12);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v75);

  v199 = v69;
  objc_msgSend(v69, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v78, -v40);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v80) = 1144750080;
  objc_msgSend(v79, "setPriority:", v80);
  objc_msgSend(v5, "addObject:", v79);
  objc_msgSend(v53, "_ui_addSubLayoutItem:", v69);

  objc_msgSend(v202, "addObject:", v59);
  v81 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("trailing"));
  v82 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v83 = objc_alloc_init(STUIStatusBarRegionAxisSquishyLayout);
  -[STUIStatusBarRegionAxisSquishyLayout setAlignment:](v83, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisSquishyLayout setInterspace:](v83, "setInterspace:", v200);
  -[STUIStatusBarRegionAxisSquishyLayout setMaxNumberOfItems:](v83, "setMaxNumberOfItems:", 3);
  _updateSquishyRegionForDynamicValues(v83, v205, v207);
  -[STUIStatusBarRegionAxisSquishyLayout setMinItemDynamicScale:](v83, "setMinItemDynamicScale:", v41);
  -[STUIStatusBarRegionAxisSquishyLayout setMinInterspaceDynamicScale:](v83, "setMinInterspaceDynamicScale:", 0.6);
  -[STUIStatusBarRegionAxisSquishyLayout setDynamicHidingDelegate:](v83, "setDynamicHidingDelegate:", self);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v82, "setHorizontalLayout:", v83);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v82, "setVerticalLayout:", v84);

  -[STUIStatusBarRegion setLayout:](v81, "setLayout:", v82);
  -[STUIStatusBarRegion setActionInsets:](v81, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  -[STUIStatusBarRegion setDisableItemFrameBasedOverflow:](v81, "setDisableItemFrameBasedOverflow:", 1);
  -[STUIStatusBarRegion layoutItem](v81, "layoutItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setFont:", v87);

  -[STUIStatusBarVisualProvider_Split normalFont](self, "normalFont");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setSmallFont:", v88);

  objc_msgSend(v86, "setImageNamePrefixes:", &unk_1E8D80138);
  -[STUIStatusBarRegion setOverriddenStyleAttributes:](v81, "setOverriddenStyleAttributes:", v86);
  objc_msgSend(v85, "centerYAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "centerYAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v91, v197);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v92);

  objc_msgSend(v85, "heightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToConstant:", v19 + 1.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v94);

  objc_msgSend(v85, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v97, -v195);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v98);

  objc_msgSend(v85, "leadingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v101, v40);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v103) = 1144750080;
  objc_msgSend(v102, "setPriority:", v103);
  objc_msgSend(v5, "addObject:", v102);
  objc_msgSend(v201, "_ui_addSubLayoutItem:", v85);

  objc_msgSend(v202, "addObject:", v81);
  v104 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("systemUpdates"));
  v105 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v106 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setMaxNumberOfItems:](v106, "setMaxNumberOfItems:", 3);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v105, "setHorizontalLayout:", v106);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v105, "setVerticalLayout:", v107);

  -[STUIStatusBarRegion setLayout:](v104, "setLayout:", v105);
  +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setImageNamePrefixes:", &unk_1E8D80150);
  -[STUIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setFont:", v109);

  -[STUIStatusBarVisualProvider_Split systemUpdateFont](self, "systemUpdateFont");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setEmphasizedFont:", v110);

  objc_msgSend(v108, "setSymbolScale:", 2);
  -[STUIStatusBarRegion setOverriddenStyleAttributes:](v104, "setOverriddenStyleAttributes:", v108);
  -[STUIStatusBarRegion layoutItem](v104, "layoutItem");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v114);

  -[STUIStatusBarRegion layoutItem](v104, "layoutItem");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v118);

  -[STUIStatusBarRegion layoutItem](v104, "layoutItem");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "rightAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rightAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v122);

  -[STUIStatusBarRegion layoutItem](v104, "layoutItem");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "leftAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "leftAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v126);

  -[STUIStatusBarRegion layoutItem](v104, "layoutItem");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "_ui_addSubLayoutItem:", v127);

  -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemUpdateRegionEnablement:forTrailingNumberOfItems:]((uint64_t)self, v104, v205);
  objc_msgSend(v202, "addObject:", v104);

  v128 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("controlCenter"));
  v129 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v129, "setHorizontalLayout:", v130);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v129, "setVerticalLayout:", v131);

  -[STUIStatusBarRegion setLayout:](v128, "setLayout:", v129);
  -[STUIStatusBarRegion layoutItem](v128, "layoutItem");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "bottomAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "bottomAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToAnchor:constant:", v135, -2.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v136);

  -[STUIStatusBarRegion layoutItem](v128, "layoutItem");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "heightAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split grabberHeight](self, "grabberHeight");
  objc_msgSend(v138, "constraintEqualToConstant:");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v139);

  -[STUIStatusBarRegion layoutItem](v128, "layoutItem");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "leftAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "leftAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "constraintGreaterThanOrEqualToAnchor:constant:", v142, 10.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v143);

  -[STUIStatusBarRegion layoutItem](v128, "layoutItem");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "rightAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = v85;
  objc_msgSend(v85, "rightAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintLessThanOrEqualToAnchor:constant:", v146, -10.0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v147);

  -[STUIStatusBarRegion layoutItem](v128, "layoutItem");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "widthAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToConstant:", 41.0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v151) = 1144750080;
  objc_msgSend(v150, "setPriority:", v151);
  objc_msgSend(v5, "addObject:", v150);
  -[STUIStatusBarRegion layoutItem](v128, "layoutItem");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "centerXAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "centerXAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "constraintEqualToAnchor:", v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v155);

  -[STUIStatusBarRegion layoutItem](v128, "layoutItem");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "_ui_addSubLayoutItem:", v156);

  objc_msgSend(v202, "addObject:", v128);
  v203 = v202;
  v204 = v5;
  -[STUIStatusBarVisualProvider_Split _setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:](self, "_setupExpandedRegionsInContainerView:sensorHeight:constraints:regions:", v201, &v204, &v203, v10);
  v157 = v204;

  v158 = v203;
  v159 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottomLeading"));
  v160 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v161 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v161, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v161, "setInterspace:", v200);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v160, "setHorizontalLayout:", v161);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v160, "setVerticalLayout:", v162);

  -[STUIStatusBarRegion setLayout:](v159, "setLayout:", v160);
  -[STUIStatusBarRegion setActionInsets:](v159, "setActionInsets:", -100.0, -12.0, -10.0, -12.0);
  -[STUIStatusBarRegion layoutItem](v159, "layoutItem");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "leadingAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split mainRegionsLayoutGuide](self, "mainRegionsLayoutGuide");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "leadingAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  objc_msgSend(v164, "constraintEqualToAnchor:constant:", v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "addObject:", v167);

  -[STUIStatusBarRegion layoutItem](v159, "layoutItem");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "trailingAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "leadingAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split bottomLeadingSpace](self, "bottomLeadingSpace");
  objc_msgSend(v169, "constraintEqualToAnchor:constant:", v171, -v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "addObject:", v173);

  -[STUIStatusBarRegion layoutItem](v159, "layoutItem");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "bottomAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split cutoutLayoutGuide](self, "cutoutLayoutGuide");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "bottomAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_DynamicSplit bottomLeadingTopOffset](self, "bottomLeadingTopOffset");
  objc_msgSend(v175, "constraintEqualToAnchor:constant:", v177, -v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "addObject:", v179);

  -[STUIStatusBarRegion layoutItem](v159, "layoutItem");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "heightAnchor");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "constraintEqualToConstant:", 13.3333333);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "addObject:", v182);

  -[STUIStatusBarRegion layoutItem](v159, "layoutItem");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "_ui_insertSubLayoutItem:atIndex:", v183, 0);

  objc_msgSend(v158, "addObject:", v159);
  STUIStatusBarAddLumaView(v201, v157, v199, 0, v10);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setLeadingBackgroundLumaView:](self, "setLeadingBackgroundLumaView:", v184);

  STUIStatusBarAddLumaView(v201, v157, v196, 0, v10);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setTrailingBackgroundLumaView:](self, "setTrailingBackgroundLumaView:", v185);

  v186 = objc_alloc(MEMORY[0x1E0DC4288]);
  -[STUIStatusBarVisualProvider_Split leadingBackgroundLumaView](self, "leadingBackgroundLumaView");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = v187;
  -[STUIStatusBarVisualProvider_Split trailingBackgroundLumaView](self, "trailingBackgroundLumaView");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v211[1] = v188;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 2);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = (void *)objc_msgSend(v186, "initWithTransitionBoundaries:minimumDifference:delegate:views:", self, v189, 0.4, 0.7, 0.5);
  -[STUIStatusBarVisualProvider_iOS setLumaTrackingGroup:](self, "setLumaTrackingGroup:", v190);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v157);
  return v158;
}

- (id)_updateSystemNavigationWithData:(CGFloat)a3 avoidanceFrame:(CGFloat)a4
{
  id v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double MaxX;
  double MinX;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  uint64_t v39;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v11 = a2;
  if (a1)
  {
    objc_msgSend(a1, "statusBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_shouldReverseLayoutDirection");

    v14 = -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v41.origin.x = a3;
    v41.origin.y = a4;
    v41.size.width = a5;
    v41.size.height = a6;
    v45.origin.x = v14;
    v45.origin.y = v16;
    v45.size.width = v18;
    v45.size.height = v20;
    if (!CGRectIntersectsRect(v41, v45))
    {
      a6 = v20;
      a5 = v18;
      a4 = v16;
      a3 = v14;
    }
    if ((v13 & 1) != 0)
    {
      objc_msgSend(a1, "mainRegionsLayoutGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layoutFrame");
      MaxX = CGRectGetMaxX(v42);
      v43.origin.x = a3;
      v43.origin.y = a4;
      v43.size.width = a5;
      v43.size.height = a6;
      MinX = MaxX - CGRectGetMaxX(v43);

    }
    else
    {
      v44.origin.x = a3;
      v44.origin.y = a4;
      v44.size.width = a5;
      v44.size.height = a6;
      MinX = CGRectGetMinX(v44);
    }
    objc_msgSend(a1, "bottomLeadingSpace");
    v25 = MinX + v24 * -2.0;
    v26 = -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
    objc_msgSend(a1, "bottomLeadingSpace");
    v28 = floor((v26 + v27 * -2.0) * 0.75);
    objc_msgSend(v11, "backNavigationEntry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 || v28 > v25)
    {
      objc_msgSend(a1, "statusBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "regions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bottomLeading"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "statusBar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "regions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("leading"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "action");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = -[STUIStatusBarVisualProvider_DynamicSplit edgeInsets]((uint64_t)a1);
      objc_msgSend(v11, "backNavigationEntry");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v34) = objc_msgSend(v38, "isEnabled");

      if ((_DWORD)v34 && v28 <= v25)
      {
        objc_msgSend(a1[40], "setConstant:", v37 + -7.66666667);
        objc_msgSend(v36, "setEnabled:", 0);
        v39 = objc_msgSend(v32, "enableWithToken:", 13);
      }
      else
      {
        objc_msgSend(a1[40], "setConstant:", v37);
        objc_msgSend(v36, "setEnabled:", 1);
        v39 = objc_msgSend(v32, "disableWithToken:", 13);
      }
      a1 = (id *)v39;

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (double)edgeInsets
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!a1)
    return 0.0;
  if ((*(_BYTE *)(a1 + 296) & 4) == 0)
  {
    *(_BYTE *)(a1 + 296) |= 4u;
    objc_msgSend((id)a1, "statusBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_effectiveTargetScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_displayCornerRadiusIgnoringZoom");
    v5 = v4 + -55.0;
    objc_msgSend(v3, "_nativeScale");
    v7 = floor(v6 * v5 / 10.0);
    objc_msgSend(v3, "_nativeScale");
    v9 = v7 / v8;
    *(_QWORD *)(a1 + 264) = 0;
    *(double *)(a1 + 272) = v9 + 17.0;
    *(_QWORD *)(a1 + 280) = 0;
    *(double *)(a1 + 288) = v9 + 18.0;

  }
  return *(double *)(a1 + 264);
}

- (BOOL)_needsUpdateOfConstraintsForAvoidanceFrame:(double *)a3 cutoutOffset:(CGFloat)a4 cutoutWidth:(CGFloat)a5
{
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double MidX;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL8 v27;
  id v28;
  double v29;
  double v30;
  CGRect v32;
  CGRect v33;

  if (!a1)
    return 0;
  -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
  v15 = v14;
  v16 = v14 + 20.0;
  v17 = -[STUIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth]((uint64_t)a1);
  if (a6 <= v16)
  {
    v33.origin.x = -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
    MidX = CGRectGetMidX(v33);
    objc_msgSend(a1, "statusBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "styleAttributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "effectiveLayoutDirection");

    if (v26 == 1)
      v22 = MidX;
    else
      v22 = v17 - MidX;
    a6 = v15;
  }
  else
  {
    v32.origin.x = a4;
    v32.origin.y = a5;
    v32.size.width = a6;
    v32.size.height = a7;
    v18 = CGRectGetMidX(v32);
    objc_msgSend(a1, "statusBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "styleAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "effectiveLayoutDirection");

    if (v21 == 1)
      v22 = v18;
    else
      v22 = v17 - v18;
  }
  v27 = 0;
  if (fabs(v22) != INFINITY && fabs(a6) != INFINITY)
  {
    if (a2)
      *a2 = v22;
    if (a3)
      *a3 = a6;
    v28 = a1[39];
    objc_msgSend(v28, "constant");
    if (v22 == v29)
    {
      objc_msgSend(a1[38], "constant");
      v27 = a6 != v30;
    }
    else
    {
      v27 = 1;
    }

  }
  return v27;
}

- (double)effectiveTargetDisplayWidth
{
  void *v2;
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  if (!a1)
    return 0.0;
  if ((*(_BYTE *)(a1 + 296) & 2) == 0)
  {
    *(_BYTE *)(a1 + 296) |= 2u;
    objc_msgSend((id)a1, "statusBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_effectiveTargetScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_unjailedReferenceBounds");
    Width = CGRectGetWidth(v9);
    objc_msgSend(v3, "_nativeScale");
    v6 = Width * v5;
    objc_msgSend(v3, "_scale");
    *(double *)(a1 + 256) = v6 / v7;

  }
  return *(double *)(a1 + 256);
}

- (uint64_t)_updateSystemUpdateRegionEnablement:(uint64_t)a3 forTrailingNumberOfItems:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (a3 < 2)
      v7 = objc_msgSend(v5, "disableWithToken:", 13);
    else
      v7 = objc_msgSend(v5, "enableWithToken:", 13);
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_calculateSquishyLayoutValuesForCutoutOffset:(uint64_t)a1 cutoutWidth:(uint64_t *)a2 maxLeadingItems:(uint64_t *)a3 maxTrailingItems:(_QWORD *)a4 leadingScale:(_QWORD *)a5 trailingScale:(double)a6 includingPrivacyIndicator:(double)a7
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;

  if (a1)
  {
    -[STUIStatusBarVisualProvider_DynamicSplit edgeInsets](a1);
    v15 = v14;
    v17 = v16;
    v18 = -[STUIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth](a1);
    v19 = a7 * 0.5;
    v20 = fmax(v18 - a6 - a7 * 0.5 - v15 + -8.0, 0.0);
    v21 = a6 - v19 - v17 + -8.0;
    if (a2)
    {
      -[STUIStatusBarVisualProvider_DynamicSplit leadingItemCutoffWidths]();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = numberOfItemsForWidth(v22, v20);

      *a2 = v23;
    }
    v24 = fmax(v21, 0.0);
    if (a3)
    {
      -[STUIStatusBarVisualProvider_DynamicSplit trailingItemCutoffWidths]();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = numberOfItemsForWidth(v25, v24);

      *a3 = v26;
    }
    if (a4)
    {
      -[STUIStatusBarVisualProvider_DynamicSplit leadingItemCutoffWidths]();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      scaleForWidth(v27);
      v29 = v28;

      *a4 = v29;
    }
    if (a5)
    {
      -[STUIStatusBarVisualProvider_DynamicSplit trailingItemCutoffWidths]();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      scaleForWidth(v30);
      v32 = v31;

      *a5 = v32;
    }
  }
}

- (id)trailingItemCutoffWidths
{
  if (qword_1EFC01C78 != -1)
    dispatch_once(&qword_1EFC01C78, &__block_literal_global_69);
  return (id)qword_1EFC01C80;
}

- (id)leadingItemCutoffWidths
{
  if (qword_1EFC01C68 != -1)
    dispatch_once(&qword_1EFC01C68, &__block_literal_global_3);
  return (id)qword_1EFC01C70;
}

- (double)leadingItemSpacing
{
  return 2.66666667;
}

- (double)itemSpacing
{
  return 7.33333333;
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

- (double)bottomLeadingTopOffset
{
  return 3.0;
}

- (id)_orderedDisplayItemPlacements
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
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
  objc_super v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  void *v70;
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[4];
  _QWORD v75[5];

  v75[3] = *MEMORY[0x1E0C80C00];
  v65.receiver = self;
  v65.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  -[STUIStatusBarVisualProvider_Split _orderedDisplayItemPlacements](&v65, sel__orderedDisplayItemPlacements);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorRingerSilenceItem, "defaultDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v3, 996);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarIndicatorQuietModeItem emphasizedQuietModeIdentifier](STUIStatusBarIndicatorQuietModeItem, "emphasizedQuietModeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v4, 997);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarIndicatorLocationItem groupWithPriority:](STUIStatusBarIndicatorLocationItem, "groupWithPriority:", 1000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarCellularItem nameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "nameDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, 1010);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prominentPlacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v9;
  objc_msgSend(v6, "regularPlacement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v10;
  v75[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "excludingPlacements:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setServiceNamePlacement:](self, "setServiceNamePlacement:", v12);

  +[STUIStatusBarCellularCondensedItem dualNameDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualNameDisplayIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v13, 1011);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prominentPlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v15;
  objc_msgSend(v6, "regularPlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v16;
  v74[2] = v5;
  -[STUIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "excludingPlacements:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setDualServiceNamePlacement:](self, "setDualServiceNamePlacement:", v19);

  +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 1012);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v22;
  -[STUIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "excludingPlacements:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v26, 1014);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prominentPlacement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v28;
  v63 = v6;
  objc_msgSend(v6, "regularPlacement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v29;
  v72[2] = v5;
  v62 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "excludingPlacements:", v30);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v71[0] = v25;
  -[STUIStatusBarVisualProvider_Split serviceNamePlacement](self, "serviceNamePlacement");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v31;
  -[STUIStatusBarVisualProvider_Split dualServiceNamePlacement](self, "dualServiceNamePlacement");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "supportsDisplayingRingerStatus"))
  {
    objc_msgSend(v33, "arrayByAddingObject:", v61);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrayByAddingObjectsFromArray:", MEMORY[0x1E0C9AA60]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = (void *)MEMORY[0x1E0C9AA60];
    v34 = v33;
  }
  v58 = v36;
  objc_msgSend(v36, "arrayByAddingObject:", v5);
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludingPlacements:", v36);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "requiringAllPlacements:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v54;
  objc_msgSend(v6, "regularPlacement");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v37;
  objc_msgSend(v53, "excludingPlacements:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "requiringAllPlacements:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v40;
  objc_msgSend(v6, "prominentPlacement");
  v41 = v25;
  v59 = (void *)v25;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "excludingPlacements:", v37);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "requiringAllPlacements:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v45;
  v69[3] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKeyedSubscript:", v47, CFSTR("leading"));

  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("trailing"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v49, 1310);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "arrayByAddingObject:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKeyedSubscript:", v51, CFSTR("trailing"));

  return v60;
}

+ (BOOL)supportsDisplayingRingerStatus
{
  return MGGetBoolAnswer() ^ 1;
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
  void *v19;
  _QWORD v20[4];
  BSAnimationSettings *v21;
  double v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  _QWORD v25[4];
  id v26;
  double v27;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled")
    && self->_currentAnimationSettings
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = self->_currentAnimationSettings;
    -[BSAnimationSettings damping](v7, "damping");
    if (v8 >= 0.7)
    {
      CGAffineTransformMakeScale(&v24, a4, a4);
      v23 = v24;
      objc_msgSend(v6, "setDynamicScaleTransform:", &v23);
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
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke;
      v25[3] = &unk_1E8D632D8;
      v26 = v6;
      v27 = a4;
      objc_msgSend(v18, "tryAnimatingWithSettings:fromCurrentState:actions:completion:", v17, 1, v25, 0);

      v7 = (BSAnimationSettings *)v17;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke_2;
    v20[3] = &unk_1E8D63248;
    v21 = (BSAnimationSettings *)v6;
    v22 = a4;
    objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 4, v20, 0, 0.25, 0.0);
    v7 = v21;
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
  if (objc_msgSend(v7, "isEqual:", CFSTR("trailing")))
  {

  }
  else
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("leading"));

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
          objc_msgSend(v21, "setValue:forKey:", &unk_1E8D80520, CFSTR("inputRadius"));
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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CGAffineTransform *v25;
  double v26;
  void *v27;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  _OWORD v31[3];
  CGAffineTransform v32;
  CGAffineTransform v33;
  _QWORD v34[4];
  id v35;
  double v36;
  _QWORD aBlock[4];
  id v38;
  uint64_t v39;
  double v40;
  BOOL v41;

  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "visible"))
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled")
      && self->_currentAnimationSettings
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
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
      -[BSAnimationSettings stiffness](v9, "stiffness");
      -[BSAnimationSettings damping](v9, "damping");
      -[BSAnimationSettings initialVelocity](v9, "initialVelocity");
      _StatusBar_UIGetDurationOfSpringAnimation();
      v22 = v21;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke;
      aBlock[3] = &unk_1E8D632B0;
      v41 = v6;
      v38 = v8;
      v39 = v22;
      v40 = a5;
      v23 = _Block_copy(aBlock);
      v24 = v23;
      if (v11 >= 0.7)
        (*((void (**)(void *, uint64_t))v23 + 2))(v23, 1);
      else
        objc_msgSend(MEMORY[0x1E0D016B0], "tryAnimatingWithSettings:fromCurrentState:actions:completion:", v9, 1, v23, 0);

    }
    else
    {
      v26 = 0.25;
      if (!v6)
        v26 = 0.5;
      STUIStatusBarDynamicSplitPerformBaseAnimation(v8, v6, 1, 1, 0, 0.5, v26, 0.0);
      if (!v6)
      {
        v27 = (void *)MEMORY[0x1E0DC3F10];
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke_86;
        v34[3] = &unk_1E8D63248;
        v35 = v8;
        v36 = a5;
        objc_msgSend(v27, "animateWithDuration:delay:options:animations:completion:", 4, v34, 0, 0.25, 0.0);

      }
    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v8, "setDynamicHidingAlpha:", 0.0);
      CGAffineTransformMakeScale(&v33, 0.5, 0.5);
      v32 = v33;
      v25 = &v32;
    }
    else
    {
      objc_msgSend(v8, "setDynamicHidingAlpha:", 1.0);
      v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v31[0] = *MEMORY[0x1E0C9BAA8];
      v31[1] = v28;
      v31[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v25 = (CGAffineTransform *)v31;
    }
    objc_msgSend(v8, "setDynamicHidingTransform:", v25);
    CGAffineTransformMakeScale(&v30, a5, a5);
    v29 = v30;
    objc_msgSend(v8, "setDynamicScaleTransform:", &v29);
  }

}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  objc_super v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  v8 = -[STUIStatusBarVisualProvider_Split hasCustomAnimationForDisplayItemWithIdentifier:removal:](&v21, sel_hasCustomAnimationForDisplayItemWithIdentifier_removal_, v6, 0);
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayItemWithIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "dynamicallyHidden");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    if ((v8 & 1) != 0)
      goto LABEL_6;
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", CFSTR("normalPartIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayItemIdentifiersInRegionsWithIdentifiers:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v6);

    if (!v17)
    {
LABEL_6:
      v20.receiver = self;
      v20.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
      -[STUIStatusBarVisualProvider_Split additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v20, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      STUIStatusBarDynamicSplitDefaultAnimation(self, v6);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v18;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_leadingCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_cutoutCenterConstraint, 0);
  objc_storeStrong((id *)&self->_cutoutWidthConstraint, 0);
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

  if (v8 / v10 <= 402.0)
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

- (double)expandedIconScale
{
  return 1.2992;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  objc_super v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  v8 = -[STUIStatusBarVisualProvider_Split hasCustomAnimationForDisplayItemWithIdentifier:removal:](&v21, sel_hasCustomAnimationForDisplayItemWithIdentifier_removal_, v6, 1);
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayItemWithIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "dynamicallyHidden");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    if ((v8 & 1) != 0)
      goto LABEL_6;
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", CFSTR("normalPartIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayItemIdentifiersInRegionsWithIdentifiers:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v6);

    if (!v17)
    {
LABEL_6:
      v20.receiver = self;
      v20.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
      -[STUIStatusBarVisualProvider_Split removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v20, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      STUIStatusBarDynamicSplitDefaultAnimation(self, v6);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v18;
  }

  return v12;
}

- (void)_updateRingerDisplayItem:(int)a3 enabled:
{
  id v5;
  id v6;

  v5 = a2;
  if (a1)
  {
    v6 = v5;
    if (a3)
      objc_msgSend(v5, "enableWithToken:", 15);
    else
      objc_msgSend(v5, "disableWithToken:", 15);
    v5 = v6;
  }

}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAggregatedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STUIStatusBarVisualProvider_Split _updateLowerRegionsWithData:](self, "_updateLowerRegionsWithData:", v5);

  if (v6)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

- (void)setOnLockScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "showRingerOffLockScreen") & 1) != 0)
    goto LABEL_4;
  v7 = -[STUIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen");

  if (v7 != v3)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorRingerSilenceItem, "defaultDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayItemWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_DynamicSplit _updateRingerDisplayItem:enabled:]((uint64_t)self, v8, v3);

LABEL_4:
  }
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  -[STUIStatusBarVisualProvider_iOS setOnLockScreen:](&v9, sel_setOnLockScreen_, v3);
}

- (void)setOnAODLockScreen:(BOOL)a3
{
  _BOOL4 v3;
  STUIStatusBarVisualProvider_DynamicSplit *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  STUIStatusBarVisualProvider_DynamicSplit *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id obj;
  uint64_t v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v3 = a3;
  v4 = self;
  v46 = *MEMORY[0x1E0C80C00];
  if (-[STUIStatusBarVisualProvider_iOS onAODLockScreen](self, "onAODLockScreen") != a3)
  {
    v27 = v3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](v4, "regionIdentifiersForPartWithIdentifier:", CFSTR("normalPartIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_DynamicSplit displayItemIdentifiersForPartWithIdentifier:](v4, "displayItemIdentifiersForPartWithIdentifier:", CFSTR("aodPartIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v8)
    {
      v9 = v8;
      v29 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(obj);
          v11 = v4;
          -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](v4, "orderedDisplayItemPlacementsInRegionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v36 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v7, "containsObject:", v17) & 1) == 0)
                  objc_msgSend(v5, "addObject:", v17);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            }
            while (v14);
          }

          v4 = v11;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v9);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    v20 = v18;
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k);
          -[STUIStatusBarVisualProvider_iOS statusBar](v4, "statusBar");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "displayItemWithIdentifier:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            objc_msgSend(v26, "disableWithToken:", 14);
          else
            objc_msgSend(v26, "enableWithToken:", 14);

        }
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v21);

      -[STUIStatusBarVisualProvider_iOS statusBar](v4, "statusBar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
    }

    v30.receiver = v4;
    v30.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
    -[STUIStatusBarVisualProvider_iOS setOnAODLockScreen:](&v30, sel_setOnAODLockScreen_, v27);

  }
}

@end
