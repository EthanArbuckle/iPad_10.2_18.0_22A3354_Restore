@implementation SBHWidgetSettings

- (void)setDefaultValues
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  -[SBHWidgetSettings setHitTestingDisabled:](self, "setHitTestingDisabled:", 0);
  -[SBHWidgetSettings setMaximumWidgetsInAStack:](self, "setMaximumWidgetsInAStack:", 10);
  -[SBHWidgetSettings setStackAlwaysShowsBorder:](self, "setStackAlwaysShowsBorder:", 0);
  -[SBHWidgetSettings setStackAlwaysShowsPageControl:](self, "setStackAlwaysShowsPageControl:", 0);
  -[SBHWidgetSettings setStackFlashesPageControlOnAppearance:](self, "setStackFlashesPageControlOnAppearance:", 1);
  -[SBHWidgetSettings toggleEditingOrPinnedAnimationSettings](self, "toggleEditingOrPinnedAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBHWidgetSettings toggleEditingOrPinnedAnimationSettings](self, "toggleEditingOrPinnedAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDampingRatio:", 0.845);

  -[SBHWidgetSettings toggleEditingOrPinnedAnimationSettings](self, "toggleEditingOrPinnedAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponse:", 0.45);

  -[SBHWidgetSettings setAnimatedInsertionJumpScale:](self, "setAnimatedInsertionJumpScale:", 1.4);
  -[SBHWidgetSettings setAnimatedInsertionImpactScale:](self, "setAnimatedInsertionImpactScale:", 0.8);
  -[SBHWidgetSettings setAnimatedInsertionImpactDelay:](self, "setAnimatedInsertionImpactDelay:", 0.5);
  -[SBHWidgetSettings setAnimatedInsertionJumpDuration:](self, "setAnimatedInsertionJumpDuration:", 0.7);
  -[SBHWidgetSettings setAnimatedInsertionJumpDampingRatio:](self, "setAnimatedInsertionJumpDampingRatio:", 1.0);
  -[SBHWidgetSettings setAnimatedInsertionSlamDuration:](self, "setAnimatedInsertionSlamDuration:", 0.8);
  -[SBHWidgetSettings setAnimatedInsertionSlamDelay:](self, "setAnimatedInsertionSlamDelay:", 0.3);
  -[SBHWidgetSettings setAnimatedInsertionSlamDampingRatio:](self, "setAnimatedInsertionSlamDampingRatio:", 1.0);
  -[SBHWidgetSettings setAnimatedInsertionScaleResetDuration:](self, "setAnimatedInsertionScaleResetDuration:", 0.8);
  -[SBHWidgetSettings setAnimatedInsertionScaleResetDelay:](self, "setAnimatedInsertionScaleResetDelay:", 0.6);
  -[SBHWidgetSettings setAnimatedInsertionScaleResetDampingRatio:](self, "setAnimatedInsertionScaleResetDampingRatio:", 0.8);
  -[SBHWidgetSettings setAnimatedInsertionPositionDuration:](self, "setAnimatedInsertionPositionDuration:", 1.0);
  -[SBHWidgetSettings setAnimatedInsertionPositionDampingRatio:](self, "setAnimatedInsertionPositionDampingRatio:", 1.0);
  -[SBHWidgetSettings dropInsertionAnimationSettings](self, "dropInsertionAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[SBHWidgetSettings dropInsertionAnimationSettings](self, "dropInsertionAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDampingRatio:", 0.7);

  -[SBHWidgetSettings dropInsertionAnimationSettings](self, "dropInsertionAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponse:", 0.36);

  -[SBHWidgetSettings dropInsertionAnimationSettings](self, "dropInsertionAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrackingDampingRatio:", 0.7);

  -[SBHWidgetSettings dropInsertionAnimationSettings](self, "dropInsertionAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTrackingResponse:", 0.36);

  -[SBHWidgetSettings setDropInsertionImpactScale:](self, "setDropInsertionImpactScale:", 0.8);
  -[SBHWidgetSettings setDropInsertionImpactDelay:](self, "setDropInsertionImpactDelay:", 0.0333333333);
  -[SBHWidgetSettings setDropInsertionSlamDuration:](self, "setDropInsertionSlamDuration:", 0.3);
  -[SBHWidgetSettings setDropInsertionSlamDelay:](self, "setDropInsertionSlamDelay:", 0.0);
  -[SBHWidgetSettings setDropInsertionSlamDampingRatio:](self, "setDropInsertionSlamDampingRatio:", 1.0);
  -[SBHWidgetSettings setDropInsertionScaleResetDuration:](self, "setDropInsertionScaleResetDuration:", 0.6);
  -[SBHWidgetSettings setDropInsertionScaleResetDelay:](self, "setDropInsertionScaleResetDelay:", 0.1);
  -[SBHWidgetSettings setDropInsertionScaleResetDampingRatio:](self, "setDropInsertionScaleResetDampingRatio:", 0.8);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  -[SBHWidgetSettings setConfigurationBlursBackground:](self, "setConfigurationBlursBackground:", (v12 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  -[SBHWidgetSettings setConfigurationUsesPercentVerticalMargin:](self, "setConfigurationUsesPercentVerticalMargin:", 1);
  -[SBHWidgetSettings setConfigurationPercentVerticalMargin:](self, "setConfigurationPercentVerticalMargin:", 0.2);
  -[SBHWidgetSettings setConfigurationAbsoluteVerticalMargin:](self, "setConfigurationAbsoluteVerticalMargin:", 24.0);
  -[SBHWidgetSettings setConfigurationHomeScreenScale:](self, "setConfigurationHomeScreenScale:", 0.9);
  -[SBHWidgetSettings setConfigurationHomeScreenAlpha:](self, "setConfigurationHomeScreenAlpha:", 0.9);
  -[SBHWidgetSettings setConfigurationEqualizesMinCardToCameraDistance:](self, "setConfigurationEqualizesMinCardToCameraDistance:", 1);
  -[SBHWidgetSettings setConfigurationPerspectiveCameraDistance:](self, "setConfigurationPerspectiveCameraDistance:", -1000.0);
  -[SBHWidgetSettings setConfigurationMinCardToCameraDistance:](self, "setConfigurationMinCardToCameraDistance:", 800.0);
  -[SBHWidgetSettings setConfigurationDarkeningTintAlpha:](self, "setConfigurationDarkeningTintAlpha:", 0.6);
  -[SBHWidgetSettings setConfigurationWidgetTintColorAlpha:](self, "setConfigurationWidgetTintColorAlpha:", 0.0);
  -[SBHWidgetSettings setConfigurationMaximizesCardHeight:](self, "setConfigurationMaximizesCardHeight:", 0);
  -[SBHWidgetSettings setConfigurationEnforcesMaxCardHeight:](self, "setConfigurationEnforcesMaxCardHeight:", 0);
  -[SBHWidgetSettings setConfigurationMaxCardHeight:](self, "setConfigurationMaxCardHeight:", 600.0);
  -[SBHWidgetSettings setConfigurationUsesSidebarAsContainer:](self, "setConfigurationUsesSidebarAsContainer:", 1);
  -[SBHWidgetSettings setConfigurationFractionBetweenSourceAndContainerX:](self, "setConfigurationFractionBetweenSourceAndContainerX:", 0.0);
  -[SBHWidgetSettings setConfigurationFractionBetweenSourceAndContainerY:](self, "setConfigurationFractionBetweenSourceAndContainerY:", 0.0);
  -[SBHWidgetSettings setStackConfigurationContentHeightRatio:](self, "setStackConfigurationContentHeightRatio:", 1.7);
  -[SBHWidgetSettings setStackConfigurationZoomTransitionDuration:](self, "setStackConfigurationZoomTransitionDuration:", 0.475);
  -[SBHWidgetSettings setStackConfigurationBlursBackground:](self, "setStackConfigurationBlursBackground:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  -[SBHWidgetSettings setStackConfigurationUsesFolderBlur:](self, "setStackConfigurationUsesFolderBlur:", (v14 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  -[SBHWidgetSettings setStackConfigurationDimmingAlpha:](self, "setStackConfigurationDimmingAlpha:", 0.1728);
  -[SBHWidgetSettings setStackConfigurationNoBlurDimmingAlpha:](self, "setStackConfigurationNoBlurDimmingAlpha:", 0.6);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  -[SBHWidgetSettings setStackConfigurationShouldScaleWidgets:](self, "setStackConfigurationShouldScaleWidgets:", (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  -[SBHWidgetSettings setStackConfigurationMediumIconScale:](self, "setStackConfigurationMediumIconScale:", 0.86);
  -[SBHWidgetSettings setStackConfigurationLargeIconScale:](self, "setStackConfigurationLargeIconScale:", 0.82);
  -[SBHWidgetSettings setStackConfigurationExtraLargeIconScale:](self, "setStackConfigurationExtraLargeIconScale:", 0.88);
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v60;
  void *v61;
  void *v62;
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
  _QWORD v165[7];
  void *v166;
  _QWORD v167[10];
  _QWORD v168[17];
  _QWORD v169[9];
  _QWORD v170[13];
  _QWORD v171[6];
  _QWORD v172[3];

  v172[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  v172[0] = v164;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Widgets in a Stack"), CFSTR("maximumWidgetsInAStack"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 1.0, 100.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "precision:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v171[0] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Stack Always Shows Border"), CFSTR("stackAlwaysShowsBorder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v171[1] = v10;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Stack Always Shows Page Control"), CFSTR("stackAlwaysShowsPageControl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v171[2] = v11;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Stack Flashes Page Control On Appearance"), CFSTR("stackFlashesPageControlOnAppearance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v171[3] = v12;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Toggle Editing / Pinned Animation Settings"), CFSTR("toggleEditingOrPinnedAnimationSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v171[4] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hit Testing Disabled"), CFSTR("hitTestingDisabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v171[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v15);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  v160 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Jump Scale"), CFSTR("animatedInsertionJumpScale"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "between:and:", 0.0, 5.0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "precision:", 2);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v170[0] = v149;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Impact Scale"), CFSTR("animatedInsertionImpactScale"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "between:and:", 0.0, 5.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "precision:", 2);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v170[1] = v137;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Impact Delay"), CFSTR("animatedInsertionImpactDelay"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "between:and:", 0.0, 10.0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "precision:", 3);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v170[2] = v125;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Jump Duration"), CFSTR("animatedInsertionJumpDuration"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "between:and:", 0.0, 10.0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "precision:", 2);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v170[3] = v112;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Jump Damping Ratio"), CFSTR("animatedInsertionJumpDampingRatio"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "between:and:", 0.0, 1.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "precision:", 2);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v170[4] = v100;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slam Duration"), CFSTR("animatedInsertionSlamDuration"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "between:and:", 0.0, 10.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "precision:", 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v170[5] = v90;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slam Delay"), CFSTR("animatedInsertionSlamDelay"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "between:and:", 0.0, 10.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "precision:", 3);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v170[6] = v84;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slam Damping Ratio"), CFSTR("animatedInsertionSlamDampingRatio"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "between:and:", 0.0, 1.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "precision:", 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v170[7] = v78;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Reset Duration"), CFSTR("animatedInsertionScaleResetDuration"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "between:and:", 0.0, 10.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "precision:", 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v170[8] = v72;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Reset Delay"), CFSTR("animatedInsertionScaleResetDelay"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "between:and:", 0.0, 10.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "precision:", 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v170[9] = v66;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Reset Damping Ratio"), CFSTR("animatedInsertionScaleResetDampingRatio"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v170[10] = v18;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Position Duration"), CFSTR("animatedInsertionPositionDuration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "precision:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v170[11] = v21;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Position Damping Ratio"), CFSTR("animatedInsertionPositionDampingRatio"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "precision:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v170[12] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "sectionWithRows:title:", v25, CFSTR("Animated Insertion"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  v158 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("dropInsertionAnimationSettings"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v154;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Impact Scale"), CFSTR("dropInsertionImpactScale"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "between:and:", 0.0, 10.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "precision:", 2);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v169[1] = v142;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Impact Delay"), CFSTR("dropInsertionImpactDelay"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "between:and:", 0.0, 10.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "precision:", 3);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v169[2] = v130;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slam Duration"), CFSTR("dropInsertionSlamDuration"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "between:and:", 0.0, 10.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "precision:", 2);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v169[3] = v117;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slam Delay"), CFSTR("dropInsertionSlamDelay"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "between:and:", 0.0, 10.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "precision:", 3);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v169[4] = v105;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slam Damping Ratio"), CFSTR("dropInsertionSlamDampingRatio"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "between:and:", 0.0, 1.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "precision:", 2);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v169[5] = v93;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Reset Duration"), CFSTR("dropInsertionScaleResetDuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 10.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v169[6] = v28;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Reset Delay"), CFSTR("dropInsertionScaleResetDelay"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 10.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "precision:", 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v169[7] = v31;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Reset Damping Ratio"), CFSTR("dropInsertionScaleResetDampingRatio"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "precision:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v169[8] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "sectionWithRows:title:", v35, CFSTR("Drop Insertion"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  v155 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Blurs Background"), CFSTR("configurationBlursBackground"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v168[0] = v151;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Margin as Percent of Screen Height"), CFSTR("configurationUsesPercentVerticalMargin"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v168[1] = v147;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Margin Percentage"), CFSTR("configurationPercentVerticalMargin"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "between:and:", 0.0, 1.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "precision:", 2);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v168[2] = v135;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Absolute Vertical Margin"), CFSTR("configurationAbsoluteVerticalMargin"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "between:and:", 0.0, 100.0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "precision:", 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v168[3] = v123;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale"), CFSTR("configurationHomeScreenScale"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "between:and:", 0.0, 1.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "precision:", 2);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v168[4] = v110;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Alpha"), CFSTR("configurationHomeScreenAlpha"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "between:and:", 0.0, 1.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "precision:", 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v168[5] = v98;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Darkening Tint Alpha"), CFSTR("configurationDarkeningTintAlpha"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "between:and:", 0.0, 1.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "precision:", 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v168[6] = v89;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Widget Tint Color Alpha"), CFSTR("configurationWidgetTintColorAlpha"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "between:and:", 0.0, 1.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "precision:", 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v168[7] = v83;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Equalize Min Card to Camera Distance"), CFSTR("configurationEqualizesMinCardToCameraDistance"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v168[8] = v81;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Perspective Camera Distance"), CFSTR("configurationPerspectiveCameraDistance"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "between:and:", -2000.0, -500.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "precision:", 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v168[9] = v75;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Card to Camera Distance"), CFSTR("configurationMinCardToCameraDistance"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "between:and:", 0.0, 2000.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "precision:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v168[10] = v69;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Maximize Card Height"), CFSTR("configurationMaximizesCardHeight"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v168[11] = v67;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enforce Max Card Height"), CFSTR("configurationEnforcesMaxCardHeight"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v168[12] = v65;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Max Card Height"), CFSTR("configurationMaxCardHeight"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "between:and:", 1.0, 3000.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "precision:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v168[13] = v37;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Sidebar as Container"), CFSTR("configurationUsesSidebarAsContainer"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v168[14] = v38;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Center Fraction X"), CFSTR("configurationFractionBetweenSourceAndContainerX"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "precision:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v168[15] = v41;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Center Fraction Y"), CFSTR("configurationFractionBetweenSourceAndContainerY"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "between:and:", 0.0, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "precision:", 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v168[16] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 17);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "sectionWithRows:title:", v45, CFSTR("Configuration"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Blurs Background"), CFSTR("stackConfigurationBlursBackground"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = v152;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Folder Background"), CFSTR("stackConfigurationUsesFolderBlur"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v167[1] = v148;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dimming Tint Alpha"), CFSTR("stackConfigurationDimmingAlpha"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "between:and:", 0.0, 1.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "precision:", 2);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v167[2] = v136;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("No-Blur Dimming Alpha"), CFSTR("stackConfigurationNoBlurDimmingAlpha"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "between:and:", 0.0, 1.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "precision:", 2);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v167[3] = v124;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("iPad Content Height Ratio"), CFSTR("stackConfigurationContentHeightRatio"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "between:and:", 1.0, 2.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "precision:", 2);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v167[4] = v107;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Duration"), CFSTR("stackConfigurationZoomTransitionDuration"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "minValue:maxValue:", 0.0, 2.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v167[5] = v99;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Should Scale Widgets"), CFSTR("stackConfigurationShouldScaleWidgets"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v167[6] = v95;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Medium Widget Scale"), CFSTR("stackConfigurationMediumIconScale"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "between:and:", 0.1, 1.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "precision:", 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v167[7] = v48;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Large Widget Scale"), CFSTR("stackConfigurationLargeIconScale"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "between:and:", 0.1, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "precision:", 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v167[8] = v51;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Extra Large Widget Scale"), CFSTR("stackConfigurationExtraLargeIconScale"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "between:and:", 0.1, 1.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "precision:", 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v167[9] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 10);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "sectionWithRows:title:", v55, CFSTR("Stack Configuration"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Person Detail Interaction"), CFSTR("personDetailInteractionSettings"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sectionWithRows:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x1E0D83078];
  v165[0] = v163;
  v165[1] = v162;
  v165[2] = v120;
  v165[3] = v161;
  v165[4] = v159;
  v165[5] = v156;
  v165[6] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 7);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "moduleWithTitle:contents:", CFSTR("Icon Editing"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (BOOL)isHitTestingDisabled
{
  return self->_hitTestingDisabled;
}

- (void)setHitTestingDisabled:(BOOL)a3
{
  self->_hitTestingDisabled = a3;
}

- (unint64_t)maximumWidgetsInAStack
{
  return self->_maximumWidgetsInAStack;
}

- (void)setMaximumWidgetsInAStack:(unint64_t)a3
{
  self->_maximumWidgetsInAStack = a3;
}

- (BOOL)stackAlwaysShowsBorder
{
  return self->_stackAlwaysShowsBorder;
}

- (void)setStackAlwaysShowsBorder:(BOOL)a3
{
  self->_stackAlwaysShowsBorder = a3;
}

- (BOOL)stackAlwaysShowsPageControl
{
  return self->_stackAlwaysShowsPageControl;
}

- (void)setStackAlwaysShowsPageControl:(BOOL)a3
{
  self->_stackAlwaysShowsPageControl = a3;
}

- (BOOL)stackFlashesPageControlOnAppearance
{
  return self->_stackFlashesPageControlOnAppearance;
}

- (void)setStackFlashesPageControlOnAppearance:(BOOL)a3
{
  self->_stackFlashesPageControlOnAppearance = a3;
}

- (SBFFluidBehaviorSettings)toggleEditingOrPinnedAnimationSettings
{
  return self->_toggleEditingOrPinnedAnimationSettings;
}

- (void)setToggleEditingOrPinnedAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toggleEditingOrPinnedAnimationSettings, a3);
}

- (double)animatedInsertionJumpScale
{
  return self->_animatedInsertionJumpScale;
}

- (void)setAnimatedInsertionJumpScale:(double)a3
{
  self->_animatedInsertionJumpScale = a3;
}

- (double)animatedInsertionImpactScale
{
  return self->_animatedInsertionImpactScale;
}

- (void)setAnimatedInsertionImpactScale:(double)a3
{
  self->_animatedInsertionImpactScale = a3;
}

- (double)animatedInsertionImpactDelay
{
  return self->_animatedInsertionImpactDelay;
}

- (void)setAnimatedInsertionImpactDelay:(double)a3
{
  self->_animatedInsertionImpactDelay = a3;
}

- (double)animatedInsertionJumpDuration
{
  return self->_animatedInsertionJumpDuration;
}

- (void)setAnimatedInsertionJumpDuration:(double)a3
{
  self->_animatedInsertionJumpDuration = a3;
}

- (double)animatedInsertionJumpDampingRatio
{
  return self->_animatedInsertionJumpDampingRatio;
}

- (void)setAnimatedInsertionJumpDampingRatio:(double)a3
{
  self->_animatedInsertionJumpDampingRatio = a3;
}

- (double)animatedInsertionSlamDuration
{
  return self->_animatedInsertionSlamDuration;
}

- (void)setAnimatedInsertionSlamDuration:(double)a3
{
  self->_animatedInsertionSlamDuration = a3;
}

- (double)animatedInsertionSlamDelay
{
  return self->_animatedInsertionSlamDelay;
}

- (void)setAnimatedInsertionSlamDelay:(double)a3
{
  self->_animatedInsertionSlamDelay = a3;
}

- (double)animatedInsertionSlamDampingRatio
{
  return self->_animatedInsertionSlamDampingRatio;
}

- (void)setAnimatedInsertionSlamDampingRatio:(double)a3
{
  self->_animatedInsertionSlamDampingRatio = a3;
}

- (double)animatedInsertionScaleResetDuration
{
  return self->_animatedInsertionScaleResetDuration;
}

- (void)setAnimatedInsertionScaleResetDuration:(double)a3
{
  self->_animatedInsertionScaleResetDuration = a3;
}

- (double)animatedInsertionScaleResetDelay
{
  return self->_animatedInsertionScaleResetDelay;
}

- (void)setAnimatedInsertionScaleResetDelay:(double)a3
{
  self->_animatedInsertionScaleResetDelay = a3;
}

- (double)animatedInsertionScaleResetDampingRatio
{
  return self->_animatedInsertionScaleResetDampingRatio;
}

- (void)setAnimatedInsertionScaleResetDampingRatio:(double)a3
{
  self->_animatedInsertionScaleResetDampingRatio = a3;
}

- (double)animatedInsertionPositionDuration
{
  return self->_animatedInsertionPositionDuration;
}

- (void)setAnimatedInsertionPositionDuration:(double)a3
{
  self->_animatedInsertionPositionDuration = a3;
}

- (double)animatedInsertionPositionDampingRatio
{
  return self->_animatedInsertionPositionDampingRatio;
}

- (void)setAnimatedInsertionPositionDampingRatio:(double)a3
{
  self->_animatedInsertionPositionDampingRatio = a3;
}

- (SBFFluidBehaviorSettings)dropInsertionAnimationSettings
{
  return self->_dropInsertionAnimationSettings;
}

- (void)setDropInsertionAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dropInsertionAnimationSettings, a3);
}

- (double)dropInsertionImpactScale
{
  return self->_dropInsertionImpactScale;
}

- (void)setDropInsertionImpactScale:(double)a3
{
  self->_dropInsertionImpactScale = a3;
}

- (double)dropInsertionImpactDelay
{
  return self->_dropInsertionImpactDelay;
}

- (void)setDropInsertionImpactDelay:(double)a3
{
  self->_dropInsertionImpactDelay = a3;
}

- (double)dropInsertionSlamDuration
{
  return self->_dropInsertionSlamDuration;
}

- (void)setDropInsertionSlamDuration:(double)a3
{
  self->_dropInsertionSlamDuration = a3;
}

- (double)dropInsertionSlamDelay
{
  return self->_dropInsertionSlamDelay;
}

- (void)setDropInsertionSlamDelay:(double)a3
{
  self->_dropInsertionSlamDelay = a3;
}

- (double)dropInsertionSlamDampingRatio
{
  return self->_dropInsertionSlamDampingRatio;
}

- (void)setDropInsertionSlamDampingRatio:(double)a3
{
  self->_dropInsertionSlamDampingRatio = a3;
}

- (double)dropInsertionScaleResetDuration
{
  return self->_dropInsertionScaleResetDuration;
}

- (void)setDropInsertionScaleResetDuration:(double)a3
{
  self->_dropInsertionScaleResetDuration = a3;
}

- (double)dropInsertionScaleResetDelay
{
  return self->_dropInsertionScaleResetDelay;
}

- (void)setDropInsertionScaleResetDelay:(double)a3
{
  self->_dropInsertionScaleResetDelay = a3;
}

- (double)dropInsertionScaleResetDampingRatio
{
  return self->_dropInsertionScaleResetDampingRatio;
}

- (void)setDropInsertionScaleResetDampingRatio:(double)a3
{
  self->_dropInsertionScaleResetDampingRatio = a3;
}

- (BOOL)configurationBlursBackground
{
  return self->_configurationBlursBackground;
}

- (void)setConfigurationBlursBackground:(BOOL)a3
{
  self->_configurationBlursBackground = a3;
}

- (BOOL)configurationUsesPercentVerticalMargin
{
  return self->_configurationUsesPercentVerticalMargin;
}

- (void)setConfigurationUsesPercentVerticalMargin:(BOOL)a3
{
  self->_configurationUsesPercentVerticalMargin = a3;
}

- (double)configurationPercentVerticalMargin
{
  return self->_configurationPercentVerticalMargin;
}

- (void)setConfigurationPercentVerticalMargin:(double)a3
{
  self->_configurationPercentVerticalMargin = a3;
}

- (double)configurationAbsoluteVerticalMargin
{
  return self->_configurationAbsoluteVerticalMargin;
}

- (void)setConfigurationAbsoluteVerticalMargin:(double)a3
{
  self->_configurationAbsoluteVerticalMargin = a3;
}

- (BOOL)configurationScalesHomeScreenRelativeToCardPosition
{
  return self->_configurationScalesHomeScreenRelativeToCardPosition;
}

- (void)setConfigurationScalesHomeScreenRelativeToCardPosition:(BOOL)a3
{
  self->_configurationScalesHomeScreenRelativeToCardPosition = a3;
}

- (double)configurationHomeScreenScale
{
  return self->_configurationHomeScreenScale;
}

- (void)setConfigurationHomeScreenScale:(double)a3
{
  self->_configurationHomeScreenScale = a3;
}

- (double)configurationHomeScreenAlpha
{
  return self->_configurationHomeScreenAlpha;
}

- (void)setConfigurationHomeScreenAlpha:(double)a3
{
  self->_configurationHomeScreenAlpha = a3;
}

- (BOOL)configurationEqualizesMinCardToCameraDistance
{
  return self->_configurationEqualizesMinCardToCameraDistance;
}

- (void)setConfigurationEqualizesMinCardToCameraDistance:(BOOL)a3
{
  self->_configurationEqualizesMinCardToCameraDistance = a3;
}

- (double)configurationPerspectiveCameraDistance
{
  return self->_configurationPerspectiveCameraDistance;
}

- (void)setConfigurationPerspectiveCameraDistance:(double)a3
{
  self->_configurationPerspectiveCameraDistance = a3;
}

- (double)configurationMinCardToCameraDistance
{
  return self->_configurationMinCardToCameraDistance;
}

- (void)setConfigurationMinCardToCameraDistance:(double)a3
{
  self->_configurationMinCardToCameraDistance = a3;
}

- (double)configurationDarkeningTintAlpha
{
  return self->_configurationDarkeningTintAlpha;
}

- (void)setConfigurationDarkeningTintAlpha:(double)a3
{
  self->_configurationDarkeningTintAlpha = a3;
}

- (double)configurationWidgetTintColorAlpha
{
  return self->_configurationWidgetTintColorAlpha;
}

- (void)setConfigurationWidgetTintColorAlpha:(double)a3
{
  self->_configurationWidgetTintColorAlpha = a3;
}

- (BOOL)configurationMaximizesCardHeight
{
  return self->_configurationMaximizesCardHeight;
}

- (void)setConfigurationMaximizesCardHeight:(BOOL)a3
{
  self->_configurationMaximizesCardHeight = a3;
}

- (BOOL)configurationEnforcesMaxCardHeight
{
  return self->_configurationEnforcesMaxCardHeight;
}

- (void)setConfigurationEnforcesMaxCardHeight:(BOOL)a3
{
  self->_configurationEnforcesMaxCardHeight = a3;
}

- (double)configurationMaxCardHeight
{
  return self->_configurationMaxCardHeight;
}

- (void)setConfigurationMaxCardHeight:(double)a3
{
  self->_configurationMaxCardHeight = a3;
}

- (BOOL)configurationUsesSidebarAsContainer
{
  return self->_configurationUsesSidebarAsContainer;
}

- (void)setConfigurationUsesSidebarAsContainer:(BOOL)a3
{
  self->_configurationUsesSidebarAsContainer = a3;
}

- (double)configurationFractionBetweenSourceAndContainerX
{
  return self->_configurationFractionBetweenSourceAndContainerX;
}

- (void)setConfigurationFractionBetweenSourceAndContainerX:(double)a3
{
  self->_configurationFractionBetweenSourceAndContainerX = a3;
}

- (double)configurationFractionBetweenSourceAndContainerY
{
  return self->_configurationFractionBetweenSourceAndContainerY;
}

- (void)setConfigurationFractionBetweenSourceAndContainerY:(double)a3
{
  self->_configurationFractionBetweenSourceAndContainerY = a3;
}

- (double)stackConfigurationZoomTransitionDuration
{
  return self->_stackConfigurationZoomTransitionDuration;
}

- (void)setStackConfigurationZoomTransitionDuration:(double)a3
{
  self->_stackConfigurationZoomTransitionDuration = a3;
}

- (double)stackConfigurationContentHeightRatio
{
  return self->_stackConfigurationContentHeightRatio;
}

- (void)setStackConfigurationContentHeightRatio:(double)a3
{
  self->_stackConfigurationContentHeightRatio = a3;
}

- (double)stackConfigurationNoBlurDimmingAlpha
{
  return self->_stackConfigurationNoBlurDimmingAlpha;
}

- (void)setStackConfigurationNoBlurDimmingAlpha:(double)a3
{
  self->_stackConfigurationNoBlurDimmingAlpha = a3;
}

- (BOOL)stackConfigurationBlursBackground
{
  return self->_stackConfigurationBlursBackground;
}

- (void)setStackConfigurationBlursBackground:(BOOL)a3
{
  self->_stackConfigurationBlursBackground = a3;
}

- (BOOL)stackConfigurationUsesFolderBlur
{
  return self->_stackConfigurationUsesFolderBlur;
}

- (void)setStackConfigurationUsesFolderBlur:(BOOL)a3
{
  self->_stackConfigurationUsesFolderBlur = a3;
}

- (double)stackConfigurationDimmingAlpha
{
  return self->_stackConfigurationDimmingAlpha;
}

- (void)setStackConfigurationDimmingAlpha:(double)a3
{
  self->_stackConfigurationDimmingAlpha = a3;
}

- (BOOL)stackConfigurationShouldScaleWidgets
{
  return self->_stackConfigurationShouldScaleWidgets;
}

- (void)setStackConfigurationShouldScaleWidgets:(BOOL)a3
{
  self->_stackConfigurationShouldScaleWidgets = a3;
}

- (double)stackConfigurationMediumIconScale
{
  return self->_stackConfigurationMediumIconScale;
}

- (void)setStackConfigurationMediumIconScale:(double)a3
{
  self->_stackConfigurationMediumIconScale = a3;
}

- (double)stackConfigurationLargeIconScale
{
  return self->_stackConfigurationLargeIconScale;
}

- (void)setStackConfigurationLargeIconScale:(double)a3
{
  self->_stackConfigurationLargeIconScale = a3;
}

- (double)stackConfigurationExtraLargeIconScale
{
  return self->_stackConfigurationExtraLargeIconScale;
}

- (void)setStackConfigurationExtraLargeIconScale:(double)a3
{
  self->_stackConfigurationExtraLargeIconScale = a3;
}

- (SBHPeopleWidgetPersonDetailInteractionSettings)personDetailInteractionSettings
{
  return self->_personDetailInteractionSettings;
}

- (void)setPersonDetailInteractionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_personDetailInteractionSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personDetailInteractionSettings, 0);
  objc_storeStrong((id *)&self->_dropInsertionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toggleEditingOrPinnedAnimationSettings, 0);
}

@end
