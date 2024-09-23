@implementation SBHomeGestureSettings

- (SBHomeGestureExclusionTrapezoidSettings)exclusionTrapezoidSettings
{
  return self->_exclusionTrapezoidSettings;
}

- (double)secondsToResetSwitcherListAfterTransition
{
  return self->_secondsToResetSwitcherListAfterTransition;
}

- (BOOL)isHomeGestureEnabled
{
  return self->_homeGestureEnabled;
}

- (double)secondsToAllowMultipleEdges
{
  return self->_secondsToAllowMultipleEdges;
}

- (void)setDefaultValues
{
  uint64_t v3;
  BOOL v4;
  _BOOL8 v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHomeGestureSettings;
  -[PTSettings setDefaultValues](&v10, sel_setDefaultValues);
  v3 = SBFEffectiveHomeButtonType();
  -[SBHomeGestureSettings setHomeGestureEnabled:](self, "setHomeGestureEnabled:", SBIsHomeGestureEnabledByDefault());
  v4 = v3 == 2;
  v5 = v3 == 2;
  v6 = 10.0;
  if (v4)
    v6 = 5.0;
  -[SBHomeGestureSettings setHysteresis:](self, "setHysteresis:", v6);
  -[SBHomeGestureSettings setRecognizeAlongEdge:](self, "setRecognizeAlongEdge:", v5);
  -[SBHomeGestureSettings setUseZStackResolverResults:](self, "setUseZStackResolverResults:", 1);
  -[SBHomeGestureSettings setHomeGestureTuningDefaults](self, "setHomeGestureTuningDefaults");
  -[SBHomeGestureSettings setLatchDefaults](self, "setLatchDefaults");
  -[SBHomeGestureSettings setSecondsToAllowMultipleEdges:](self, "setSecondsToAllowMultipleEdges:", 1.5);
  -[SBHomeGestureSettings setPreventMultipleEdgesAfterAppInteraction:](self, "setPreventMultipleEdgesAfterAppInteraction:", 1);
  -[SBHomeGestureSettings setSecondsToResetSwitcherListAfterTransition:](self, "setSecondsToResetSwitcherListAfterTransition:", 5.0);
  -[SBHomeGestureSettings setResetSwitcherListAfterAppInteraction:](self, "setResetSwitcherListAfterAppInteraction:", 1);
  -[SBHomeGestureSettings setTravelDistanceForTranslatingScreenHeight:](self, "setTravelDistanceForTranslatingScreenHeight:", 180.0);
  -[SBHomeGestureSettings setMinimumDistanceThresholdToScaleMultiplier:](self, "setMinimumDistanceThresholdToScaleMultiplier:", 32.0);
  -[SBHomeGestureSettings exclusionTrapezoidSettings](self, "exclusionTrapezoidSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValues");

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  -[SBHomeGestureSettings setHomeGestureCenterZoomDownCenterYOffsetFactor:](self, "setHomeGestureCenterZoomDownCenterYOffsetFactor:", dbl_1D0E8B760[(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  -[SBHomeGestureSettings setEdgeAngleWindow:](self, "setEdgeAngleWindow:", 2.70526034);
}

- (void)setHomeGestureTuningDefaults
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 10.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 12.0;
  -[SBHomeGestureSettings setMinimumYDistanceForHomeOrAppSwitcher:](self, "setMinimumYDistanceForHomeOrAppSwitcher:", v5);
  -[SBHomeGestureSettings minimumYDistanceForHomeOrAppSwitcher](self, "minimumYDistanceForHomeOrAppSwitcher");
  -[SBHomeGestureSettings setMinimumYDistanceToConsiderAccelerationDip:](self, "setMinimumYDistanceToConsiderAccelerationDip:");
  -[SBHomeGestureSettings minimumYDistanceForHomeOrAppSwitcher](self, "minimumYDistanceForHomeOrAppSwitcher");
  -[SBHomeGestureSettings setMinimumXDistanceForFirstArcSwipe:](self, "setMinimumXDistanceForFirstArcSwipe:");
  -[SBHomeGestureSettings setMinimumXDistanceToTriggerArcByDistancePortrait:](self, "setMinimumXDistanceToTriggerArcByDistancePortrait:", 17.0);
  -[SBHomeGestureSettings setMinimumXDistanceToTriggerArcByDistanceLandscape:](self, "setMinimumXDistanceToTriggerArcByDistanceLandscape:", 37.0);
  -[SBHomeGestureSettings setMaximumYDistanceToTriggerArcByDistance:](self, "setMaximumYDistanceToTriggerArcByDistance:", 9.0);
  -[SBHomeGestureSettings setMaximumYDistanceToTriggerArcByFlick:](self, "setMaximumYDistanceToTriggerArcByFlick:", 21.0);
  -[SBHomeGestureSettings setVelocityYThresholdForUnconditionalHome:](self, "setVelocityYThresholdForUnconditionalHome:", -204.0);
  -[SBHomeGestureSettings setMinimumYVelocityForHome:](self, "setMinimumYVelocityForHome:", -51.0);
  -[SBHomeGestureSettings setVelocityXThresholdForUnconditionalArcSwipe:](self, "setVelocityXThresholdForUnconditionalArcSwipe:", 208.0);
  -[SBHomeGestureSettings setMinimumYVelocityForArcSwipe:](self, "setMinimumYVelocityForArcSwipe:", 51.0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  -[SBHomeGestureSettings setNormalizedDistanceYThresholdForUnconditionalHome:](self, "setNormalizedDistanceYThresholdForUnconditionalHome:", dbl_1D0E8B770[(v7 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = 0.1;
  else
    v10 = 0.2;
  -[SBHomeGestureSettings setNormalizedDistanceYThresholdRangeForUnconditionalHome:](self, "setNormalizedDistanceYThresholdRangeForUnconditionalHome:", v10);
  -[SBHomeGestureSettings setNormalizedDistanceYThresholdForUnconditionalHomeInSlideOver:](self, "setNormalizedDistanceYThresholdForUnconditionalHomeInSlideOver:", 0.6);
  -[SBHomeGestureSettings setNormalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver:](self, "setNormalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver:", 0.2);
  -[SBHomeGestureSettings setPauseVelocityThresholdForAppSwitcher:](self, "setPauseVelocityThresholdForAppSwitcher:", 51.0);
  -[SBHomeGestureSettings setPauseVelocityThresholdForDefiniteAppSwitcher:](self, "setPauseVelocityThresholdForDefiniteAppSwitcher:", 27.0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  -[SBHomeGestureSettings setMaximumAdaptivePauseVelocityThresholdForAppSwitcher:](self, "setMaximumAdaptivePauseVelocityThresholdForAppSwitcher:", dbl_1D0E8B780[(v12 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  -[SBHomeGestureSettings setSnapToMaxVelocityThresholdAfterAccelerationDip:](self, "setSnapToMaxVelocityThresholdAfterAccelerationDip:", 1);
  -[SBHomeGestureSettings setMaximumAdaptiveVelocityThresholdForDock:](self, "setMaximumAdaptiveVelocityThresholdForDock:", 308.0);
  -[SBHomeGestureSettings setAppSwitcherVelocityThresholdIncreasingRateFraction:](self, "setAppSwitcherVelocityThresholdIncreasingRateFraction:", 0.2);
  -[SBHomeGestureSettings setDockVelocityThresholdIncreasingRateFraction:](self, "setDockVelocityThresholdIncreasingRateFraction:", 0.2);
  -[SBHomeGestureSettings setAdaptiveThresholdsDecreasingRateFraction:](self, "setAdaptiveThresholdsDecreasingRateFraction:", 0.142857143);
  -[SBHomeGestureSettings setVelocitySlopeThresholdForBottomSwipeUpArc:](self, "setVelocitySlopeThresholdForBottomSwipeUpArc:", 0.5);
  -[SBHomeGestureSettings setVelocitySlopeThresholdForScrunchArc:](self, "setVelocitySlopeThresholdForScrunchArc:", 1.0);
  -[SBHomeGestureSettings setVelocitySlopeThresholdForCurrentLayout:](self, "setVelocitySlopeThresholdForCurrentLayout:", 1.0);
  -[SBHomeGestureSettings setEdgeDistanceToCorrectGestureFinalDestination:](self, "setEdgeDistanceToCorrectGestureFinalDestination:", 3.0);
  -[SBHomeGestureSettings setCardFlyInMaximumVelocityThreshold:](self, "setCardFlyInMaximumVelocityThreshold:", 3.33);
  -[SBHomeGestureSettings setCardFlyInDelayAfterEnteringAppSwitcher:](self, "setCardFlyInDelayAfterEnteringAppSwitcher:", 0.1);
}

- (void)setLatchDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;

  -[SBHomeGestureSettings setMaximumDistanceYThresholdToPresentDock:](self, "setMaximumDistanceYThresholdToPresentDock:", 260.0);
  -[SBHomeGestureSettings setVerticalRubberbandStart:](self, "setVerticalRubberbandStart:", 98.0);
  -[SBHomeGestureSettings setVerticalRubberbandEnd:](self, "setVerticalRubberbandEnd:", 200.0);
  -[SBHomeGestureSettings setVerticalRubberbandDistance:](self, "setVerticalRubberbandDistance:", 24.0);
  -[SBHomeGestureSettings setVerticalRubberbandExponent:](self, "setVerticalRubberbandExponent:", 4.0);
  -[SBHomeGestureSettings setHorizontalRubberbandStart:](self, "setHorizontalRubberbandStart:", 24.0);
  -[SBHomeGestureSettings setHorizontalRubberbandEnd:](self, "setHorizontalRubberbandEnd:", 92.0);
  -[SBHomeGestureSettings setHorizontalRubberbandDistance:](self, "setHorizontalRubberbandDistance:", 16.0);
  -[SBHomeGestureSettings setHorizontalRubberbandExponent:](self, "setHorizontalRubberbandExponent:", 4.0);
  -[SBHomeGestureSettings setInjectGestureVelocityForZoomDown:](self, "setInjectGestureVelocityForZoomDown:", 1);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[SBHomeGestureSettings setOnlyInjectVelocityForShortFlicks:](self, "setOnlyInjectVelocityForShortFlicks:", (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  -[SBHomeGestureSettings setPositionVelocityXPercentOfGestureVelocityX:](self, "setPositionVelocityXPercentOfGestureVelocityX:", 1.0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 0.3;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 0.5;
  -[SBHomeGestureSettings setPositionVelocityYPercentOfGestureVelocityY:](self, "setPositionVelocityYPercentOfGestureVelocityY:", v7);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = 1.4;
  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = 1.5;
  -[SBHomeGestureSettings setScaleVelocityPercentOfGestureVelocityYDividedByViewHeight:](self, "setScaleVelocityPercentOfGestureVelocityYDividedByViewHeight:", v10);
  -[SBHomeGestureSettings setMaximumScaleVelocity:](self, "setMaximumScaleVelocity:", 10.0);
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v63;
  void *v64;
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
  _QWORD v143[9];
  void *v144;
  void *v145;
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[6];
  _QWORD v150[8];
  _QWORD v151[30];
  _QWORD v152[6];

  v152[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Home Gesture"), CFSTR("homeGestureEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Hysteresis"), CFSTR("hysteresis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 25.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueFormatter:", &__block_literal_global_334);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v152[1] = v5;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Recognize Along Edge"), CFSTR("recognizeAlongEdge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v152[2] = v6;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Use ZStackResolver Results"), CFSTR("useZStackResolverResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v152[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 4);
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:", v137);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  objc_msgSend(v8, "predicateWithValue:", (v10 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Y Distance For Home Or Switcher"), CFSTR("minimumYDistanceForHomeOrAppSwitcher"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "between:and:", 0.0, 500.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v135;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Y Distance To Consider Acceleration Dip"), CFSTR("minimumYDistanceToConsiderAccelerationDip"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "between:and:", 0.0, 500.0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v129;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min X Distance For First Arc"), CFSTR("minimumXDistanceForFirstArcSwipe"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "between:and:", 0.0, 500.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v151[2] = v122;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min X Distance For Arc By Distance (Portrait)"), CFSTR("minimumXDistanceToTriggerArcByDistancePortrait"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "between:and:", 0.0, 500.0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v151[3] = v116;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min X Distance For Arc By Distance (Landscape)"), CFSTR("minimumXDistanceToTriggerArcByDistanceLandscape"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "between:and:", 0.0, 500.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v151[4] = v111;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Y Distance For Arc By Distance"), CFSTR("maximumYDistanceToTriggerArcByDistance"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "between:and:", 0.0, 500.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v151[5] = v107;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Y Distance For Arc By Flick"), CFSTR("maximumYDistanceToTriggerArcByFlick"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "between:and:", 0.0, 500.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v151[6] = v105;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Velocity Y For Unconditional Home"), CFSTR("velocityYThresholdForUnconditionalHome"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "between:and:", -500.0, 0.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v151[7] = v103;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Y Velocity For Home"), CFSTR("minimumYVelocityForHome"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "between:and:", -500.0, 0.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v151[8] = v101;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Velocity X For Unconditional Arc"), CFSTR("velocityXThresholdForUnconditionalArcSwipe"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "between:and:", 0.0, 500.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v151[9] = v99;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Y Velocity For Arc"), CFSTR("minimumYVelocityForArcSwipe"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "between:and:", 0.0, 500.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v151[10] = v97;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Normalized Distance Y For Unconditional Home"), CFSTR("normalizedDistanceYThresholdForUnconditionalHome"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "between:and:", 0.0, 500.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v151[11] = v95;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Normalized Distance Y Range For Unconditional Home"), CFSTR("normalizedDistanceYThresholdRangeForUnconditionalHome"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "between:and:", 0.0, 500.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v151[12] = v93;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Normalized Distance Y For Unconditional Home In SlideOver"), CFSTR("normalizedDistanceYThresholdForUnconditionalHomeInSlideOver"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "between:and:", 0.0, 500.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v151[13] = v91;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Normalized Distance Y Range For Unconditional Home In SlideOver"), CFSTR("normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "between:and:", 0.0, 500.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v151[14] = v89;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Pause Velocity For Switcher"), CFSTR("pauseVelocityThresholdForAppSwitcher"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "between:and:", 0.0, 500.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v151[15] = v87;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Pause Velocity For Definite Switcher"), CFSTR("pauseVelocityThresholdForDefiniteAppSwitcher"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "between:and:", 0.0, 500.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v151[16] = v85;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Adaptive Pause Velocity For Switcher"), CFSTR("maximumAdaptivePauseVelocityThresholdForAppSwitcher"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "between:and:", 0.0, 500.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v151[17] = v83;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Snap To Max Velocity After Acceleration Dip"), CFSTR("snapToMaxVelocityThresholdAfterAccelerationDip"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "between:and:", 0.0, 500.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v151[18] = v81;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Adaptive Velocity For Dock"), CFSTR("maximumAdaptiveVelocityThresholdForDock"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "between:and:", 0.0, 500.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "condition:", v11);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v151[19] = v78;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Switcher Velocity Increasing Rate Fraction"), CFSTR("appSwitcherVelocityThresholdIncreasingRateFraction"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "between:and:", 0.0, 500.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v151[20] = v76;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dock Velocity Increasing Rate Fraction"), CFSTR("dockVelocityThresholdIncreasingRateFraction"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "between:and:", 0.0, 500.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v141 = (void *)v11;
  objc_msgSend(v74, "condition:", v11);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v151[21] = v73;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Adaptive Thresholds Decreasing Rate Fraction"), CFSTR("adaptiveThresholdsDecreasingRateFraction"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "between:and:", 0.0, 500.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v151[22] = v71;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Velocity Slope For Bottom Swipe Up Arc"), CFSTR("velocitySlopeThresholdForBottomSwipeUpArc"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "between:and:", 0.0, 500.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v151[23] = v69;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Velocity Slope For Scrunch Arc"), CFSTR("velocitySlopeThresholdForScrunchArc"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "between:and:", 0.0, 500.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v151[24] = v67;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Velocity Slope For Current Layout"), CFSTR("velocitySlopeThresholdForCurrentLayout"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "between:and:", 0.0, 500.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v151[25] = v13;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Edge Distance To Correct Gesture Final Action"), CFSTR("edgeDistanceToCorrectGestureFinalDestination"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 500.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v151[26] = v15;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Card Fly In Max Velocity Threshold"), CFSTR("cardFlyInMaximumVelocityThreshold"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 500.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v151[27] = v17;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Card Fly In Delay After Entering Switcher"), CFSTR("cardFlyInDelayAfterEnteringAppSwitcher"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 500.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v151[28] = v19;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Distance Y To Present Dock"), CFSTR("maximumDistanceYThresholdToPresentDock"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 500.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "condition:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v151[29] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 30);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:", v140);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Rubberband Start"), CFSTR("verticalRubberbandStart"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "between:and:", 0.0, 500.0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v130;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Rubberband End"), CFSTR("verticalRubberbandEnd"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "between:and:", 0.0, 500.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v150[1] = v123;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Rubberband Distance"), CFSTR("verticalRubberbandDistance"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "between:and:", 0.0, 500.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v150[2] = v117;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Rubberband Exponent"), CFSTR("verticalRubberbandExponent"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "between:and:", 0.0, 10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v150[3] = v23;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Rubberband Start"), CFSTR("horizontalRubberbandStart"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 500.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v150[4] = v25;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Rubberband End"), CFSTR("horizontalRubberbandEnd"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 500.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v150[5] = v27;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Rubberband Distance"), CFSTR("horizontalRubberbandDistance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 500.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v150[6] = v29;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Rubberband Exponent"), CFSTR("horizontalRubberbandExponent"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 10.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v150[7] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 8);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:condition:", v136, CFSTR("Latch"), v141);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Inject Velocity For Zoom Down"), CFSTR("injectGestureVelocityForZoomDown"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v127;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Only for Short Flicks"), CFSTR("onlyInjectVelocityForShortFlicks"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v149[1] = v32;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Position Velocity X Percent of Gesture Velocity X"), CFSTR("positionVelocityXPercentOfGestureVelocityX"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 500.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v149[2] = v34;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Position Velocity Y Percent Of Gesture Velocity Y"), CFSTR("positionVelocityYPercentOfGestureVelocityY"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "between:and:", 0.0, 500.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v149[3] = v36;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Scale Velocity Percent Of Gesture Velocity Y Divided By View Height"), CFSTR("scaleVelocityPercentOfGestureVelocityYDividedByViewHeight"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "between:and:", 0.0, 10.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v149[4] = v38;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Scale Velocity"), CFSTR("maximumScaleVelocity"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 20.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v149[5] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 6);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v131, CFSTR("Velocity Injection"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Seconds to Allow Multiple Edges"), CFSTR("secondsToAllowMultipleEdges"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", 0.0, 10.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "valueFormatter:", &__block_literal_global_334);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v43;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Reset After App Interaction"), CFSTR("preventMultipleEdgesAfterAppInteraction"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v124, CFSTR("Orientation"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Seconds to Reset Switcher List After Transition"), CFSTR("secondsToResetSwitcherListAfterTransition"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "between:and:", 0.0, 10.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "valueFormatter:", &__block_literal_global_334);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v47;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Reset After App Interaction"), CFSTR("resetSwitcherListAfterAppInteraction"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 2);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v118, CFSTR("Switcher Model Changes"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Travel Distance For Translating Screen Height"), CFSTR("travelDistanceForTranslatingScreenHeight"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "precision:", 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v50;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Distance Threshold To Scale Multiplier"), CFSTR("minimumDistanceThresholdToScaleMultiplier"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "precision:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 2);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v112, CFSTR("Trackpad"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Exclusion Trapezoids"), CFSTR("exclusionTrapezoidSettings"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)MEMORY[0x1E0D83070];
  v145 = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sectionWithRows:", v55);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:action:", CFSTR("Restore Defaults"), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)MEMORY[0x1E0D83070];
  v144 = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sectionWithRows:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)MEMORY[0x1E0D83070];
  v143[0] = v142;
  v143[1] = v139;
  v143[2] = v134;
  v143[3] = v128;
  v143[4] = v121;
  v143[5] = v115;
  v143[6] = v53;
  v143[7] = v108;
  v143[8] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "moduleWithTitle:contents:", 0, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

uint64_t __49__SBHomeGestureSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "numberWithDouble:", roundf(v3 + v3) * 0.5);
}

- (void)setHomeGestureEnabled:(BOOL)a3
{
  self->_homeGestureEnabled = a3;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (BOOL)recognizeAlongEdge
{
  return self->_recognizeAlongEdge;
}

- (void)setRecognizeAlongEdge:(BOOL)a3
{
  self->_recognizeAlongEdge = a3;
}

- (BOOL)useZStackResolverResults
{
  return self->_useZStackResolverResults;
}

- (void)setUseZStackResolverResults:(BOOL)a3
{
  self->_useZStackResolverResults = a3;
}

- (double)minimumYDistanceForHomeOrAppSwitcher
{
  return self->_minimumYDistanceForHomeOrAppSwitcher;
}

- (void)setMinimumYDistanceForHomeOrAppSwitcher:(double)a3
{
  self->_minimumYDistanceForHomeOrAppSwitcher = a3;
}

- (double)minimumYDistanceToConsiderAccelerationDip
{
  return self->_minimumYDistanceToConsiderAccelerationDip;
}

- (void)setMinimumYDistanceToConsiderAccelerationDip:(double)a3
{
  self->_minimumYDistanceToConsiderAccelerationDip = a3;
}

- (double)minimumXDistanceForFirstArcSwipe
{
  return self->_minimumXDistanceForFirstArcSwipe;
}

- (void)setMinimumXDistanceForFirstArcSwipe:(double)a3
{
  self->_minimumXDistanceForFirstArcSwipe = a3;
}

- (double)minimumXDistanceToTriggerArcByDistancePortrait
{
  return self->_minimumXDistanceToTriggerArcByDistancePortrait;
}

- (void)setMinimumXDistanceToTriggerArcByDistancePortrait:(double)a3
{
  self->_minimumXDistanceToTriggerArcByDistancePortrait = a3;
}

- (double)minimumXDistanceToTriggerArcByDistanceLandscape
{
  return self->_minimumXDistanceToTriggerArcByDistanceLandscape;
}

- (void)setMinimumXDistanceToTriggerArcByDistanceLandscape:(double)a3
{
  self->_minimumXDistanceToTriggerArcByDistanceLandscape = a3;
}

- (double)maximumYDistanceToTriggerArcByDistance
{
  return self->_maximumYDistanceToTriggerArcByDistance;
}

- (void)setMaximumYDistanceToTriggerArcByDistance:(double)a3
{
  self->_maximumYDistanceToTriggerArcByDistance = a3;
}

- (double)maximumYDistanceToTriggerArcByFlick
{
  return self->_maximumYDistanceToTriggerArcByFlick;
}

- (void)setMaximumYDistanceToTriggerArcByFlick:(double)a3
{
  self->_maximumYDistanceToTriggerArcByFlick = a3;
}

- (double)velocityYThresholdForUnconditionalHome
{
  return self->_velocityYThresholdForUnconditionalHome;
}

- (void)setVelocityYThresholdForUnconditionalHome:(double)a3
{
  self->_velocityYThresholdForUnconditionalHome = a3;
}

- (double)minimumYVelocityForHome
{
  return self->_minimumYVelocityForHome;
}

- (void)setMinimumYVelocityForHome:(double)a3
{
  self->_minimumYVelocityForHome = a3;
}

- (double)velocityXThresholdForUnconditionalArcSwipe
{
  return self->_velocityXThresholdForUnconditionalArcSwipe;
}

- (void)setVelocityXThresholdForUnconditionalArcSwipe:(double)a3
{
  self->_velocityXThresholdForUnconditionalArcSwipe = a3;
}

- (double)minimumYVelocityForArcSwipe
{
  return self->_minimumYVelocityForArcSwipe;
}

- (void)setMinimumYVelocityForArcSwipe:(double)a3
{
  self->_minimumYVelocityForArcSwipe = a3;
}

- (double)normalizedDistanceYThresholdForUnconditionalHome
{
  return self->_normalizedDistanceYThresholdForUnconditionalHome;
}

- (void)setNormalizedDistanceYThresholdForUnconditionalHome:(double)a3
{
  self->_normalizedDistanceYThresholdForUnconditionalHome = a3;
}

- (double)normalizedDistanceYThresholdRangeForUnconditionalHome
{
  return self->_normalizedDistanceYThresholdRangeForUnconditionalHome;
}

- (void)setNormalizedDistanceYThresholdRangeForUnconditionalHome:(double)a3
{
  self->_normalizedDistanceYThresholdRangeForUnconditionalHome = a3;
}

- (double)normalizedDistanceYThresholdForUnconditionalHomeInSlideOver
{
  return self->_normalizedDistanceYThresholdForUnconditionalHomeInSlideOver;
}

- (void)setNormalizedDistanceYThresholdForUnconditionalHomeInSlideOver:(double)a3
{
  self->_normalizedDistanceYThresholdForUnconditionalHomeInSlideOver = a3;
}

- (double)normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver
{
  return self->_normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver;
}

- (void)setNormalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver:(double)a3
{
  self->_normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver = a3;
}

- (double)pauseVelocityThresholdForAppSwitcher
{
  return self->_pauseVelocityThresholdForAppSwitcher;
}

- (void)setPauseVelocityThresholdForAppSwitcher:(double)a3
{
  self->_pauseVelocityThresholdForAppSwitcher = a3;
}

- (double)pauseVelocityThresholdForDefiniteAppSwitcher
{
  return self->_pauseVelocityThresholdForDefiniteAppSwitcher;
}

- (void)setPauseVelocityThresholdForDefiniteAppSwitcher:(double)a3
{
  self->_pauseVelocityThresholdForDefiniteAppSwitcher = a3;
}

- (double)maximumAdaptivePauseVelocityThresholdForAppSwitcher
{
  return self->_maximumAdaptivePauseVelocityThresholdForAppSwitcher;
}

- (void)setMaximumAdaptivePauseVelocityThresholdForAppSwitcher:(double)a3
{
  self->_maximumAdaptivePauseVelocityThresholdForAppSwitcher = a3;
}

- (BOOL)snapToMaxVelocityThresholdAfterAccelerationDip
{
  return self->_snapToMaxVelocityThresholdAfterAccelerationDip;
}

- (void)setSnapToMaxVelocityThresholdAfterAccelerationDip:(BOOL)a3
{
  self->_snapToMaxVelocityThresholdAfterAccelerationDip = a3;
}

- (double)maximumAdaptiveVelocityThresholdForDock
{
  return self->_maximumAdaptiveVelocityThresholdForDock;
}

- (void)setMaximumAdaptiveVelocityThresholdForDock:(double)a3
{
  self->_maximumAdaptiveVelocityThresholdForDock = a3;
}

- (double)appSwitcherVelocityThresholdIncreasingRateFraction
{
  return self->_appSwitcherVelocityThresholdIncreasingRateFraction;
}

- (void)setAppSwitcherVelocityThresholdIncreasingRateFraction:(double)a3
{
  self->_appSwitcherVelocityThresholdIncreasingRateFraction = a3;
}

- (double)dockVelocityThresholdIncreasingRateFraction
{
  return self->_dockVelocityThresholdIncreasingRateFraction;
}

- (void)setDockVelocityThresholdIncreasingRateFraction:(double)a3
{
  self->_dockVelocityThresholdIncreasingRateFraction = a3;
}

- (double)adaptiveThresholdsDecreasingRateFraction
{
  return self->_adaptiveThresholdsDecreasingRateFraction;
}

- (void)setAdaptiveThresholdsDecreasingRateFraction:(double)a3
{
  self->_adaptiveThresholdsDecreasingRateFraction = a3;
}

- (double)velocitySlopeThresholdForBottomSwipeUpArc
{
  return self->_velocitySlopeThresholdForBottomSwipeUpArc;
}

- (void)setVelocitySlopeThresholdForBottomSwipeUpArc:(double)a3
{
  self->_velocitySlopeThresholdForBottomSwipeUpArc = a3;
}

- (double)velocitySlopeThresholdForScrunchArc
{
  return self->_velocitySlopeThresholdForScrunchArc;
}

- (void)setVelocitySlopeThresholdForScrunchArc:(double)a3
{
  self->_velocitySlopeThresholdForScrunchArc = a3;
}

- (double)velocitySlopeThresholdForCurrentLayout
{
  return self->_velocitySlopeThresholdForCurrentLayout;
}

- (void)setVelocitySlopeThresholdForCurrentLayout:(double)a3
{
  self->_velocitySlopeThresholdForCurrentLayout = a3;
}

- (double)edgeDistanceToCorrectGestureFinalDestination
{
  return self->_edgeDistanceToCorrectGestureFinalDestination;
}

- (void)setEdgeDistanceToCorrectGestureFinalDestination:(double)a3
{
  self->_edgeDistanceToCorrectGestureFinalDestination = a3;
}

- (double)edgeAngleWindow
{
  return self->_edgeAngleWindow;
}

- (void)setEdgeAngleWindow:(double)a3
{
  self->_edgeAngleWindow = a3;
}

- (double)cardFlyInMaximumVelocityThreshold
{
  return self->_cardFlyInMaximumVelocityThreshold;
}

- (void)setCardFlyInMaximumVelocityThreshold:(double)a3
{
  self->_cardFlyInMaximumVelocityThreshold = a3;
}

- (double)cardFlyInDelayAfterEnteringAppSwitcher
{
  return self->_cardFlyInDelayAfterEnteringAppSwitcher;
}

- (void)setCardFlyInDelayAfterEnteringAppSwitcher:(double)a3
{
  self->_cardFlyInDelayAfterEnteringAppSwitcher = a3;
}

- (double)maximumDistanceYThresholdToPresentDock
{
  return self->_maximumDistanceYThresholdToPresentDock;
}

- (void)setMaximumDistanceYThresholdToPresentDock:(double)a3
{
  self->_maximumDistanceYThresholdToPresentDock = a3;
}

- (double)homeGestureCenterZoomDownCenterYOffsetFactor
{
  return self->_homeGestureCenterZoomDownCenterYOffsetFactor;
}

- (void)setHomeGestureCenterZoomDownCenterYOffsetFactor:(double)a3
{
  self->_homeGestureCenterZoomDownCenterYOffsetFactor = a3;
}

- (double)verticalRubberbandStart
{
  return self->_verticalRubberbandStart;
}

- (void)setVerticalRubberbandStart:(double)a3
{
  self->_verticalRubberbandStart = a3;
}

- (double)verticalRubberbandEnd
{
  return self->_verticalRubberbandEnd;
}

- (void)setVerticalRubberbandEnd:(double)a3
{
  self->_verticalRubberbandEnd = a3;
}

- (double)verticalRubberbandDistance
{
  return self->_verticalRubberbandDistance;
}

- (void)setVerticalRubberbandDistance:(double)a3
{
  self->_verticalRubberbandDistance = a3;
}

- (double)verticalRubberbandExponent
{
  return self->_verticalRubberbandExponent;
}

- (void)setVerticalRubberbandExponent:(double)a3
{
  self->_verticalRubberbandExponent = a3;
}

- (double)horizontalRubberbandStart
{
  return self->_horizontalRubberbandStart;
}

- (void)setHorizontalRubberbandStart:(double)a3
{
  self->_horizontalRubberbandStart = a3;
}

- (double)horizontalRubberbandEnd
{
  return self->_horizontalRubberbandEnd;
}

- (void)setHorizontalRubberbandEnd:(double)a3
{
  self->_horizontalRubberbandEnd = a3;
}

- (double)horizontalRubberbandDistance
{
  return self->_horizontalRubberbandDistance;
}

- (void)setHorizontalRubberbandDistance:(double)a3
{
  self->_horizontalRubberbandDistance = a3;
}

- (double)horizontalRubberbandExponent
{
  return self->_horizontalRubberbandExponent;
}

- (void)setHorizontalRubberbandExponent:(double)a3
{
  self->_horizontalRubberbandExponent = a3;
}

- (BOOL)injectGestureVelocityForZoomDown
{
  return self->_injectGestureVelocityForZoomDown;
}

- (void)setInjectGestureVelocityForZoomDown:(BOOL)a3
{
  self->_injectGestureVelocityForZoomDown = a3;
}

- (BOOL)onlyInjectVelocityForShortFlicks
{
  return self->_onlyInjectVelocityForShortFlicks;
}

- (void)setOnlyInjectVelocityForShortFlicks:(BOOL)a3
{
  self->_onlyInjectVelocityForShortFlicks = a3;
}

- (double)positionVelocityXPercentOfGestureVelocityX
{
  return self->_positionVelocityXPercentOfGestureVelocityX;
}

- (void)setPositionVelocityXPercentOfGestureVelocityX:(double)a3
{
  self->_positionVelocityXPercentOfGestureVelocityX = a3;
}

- (double)positionVelocityYPercentOfGestureVelocityY
{
  return self->_positionVelocityYPercentOfGestureVelocityY;
}

- (void)setPositionVelocityYPercentOfGestureVelocityY:(double)a3
{
  self->_positionVelocityYPercentOfGestureVelocityY = a3;
}

- (double)scaleVelocityPercentOfGestureVelocityYDividedByViewHeight
{
  return self->_scaleVelocityPercentOfGestureVelocityYDividedByViewHeight;
}

- (void)setScaleVelocityPercentOfGestureVelocityYDividedByViewHeight:(double)a3
{
  self->_scaleVelocityPercentOfGestureVelocityYDividedByViewHeight = a3;
}

- (double)maximumScaleVelocity
{
  return self->_maximumScaleVelocity;
}

- (void)setMaximumScaleVelocity:(double)a3
{
  self->_maximumScaleVelocity = a3;
}

- (void)setSecondsToAllowMultipleEdges:(double)a3
{
  self->_secondsToAllowMultipleEdges = a3;
}

- (BOOL)preventMultipleEdgesAfterAppInteraction
{
  return self->_preventMultipleEdgesAfterAppInteraction;
}

- (void)setPreventMultipleEdgesAfterAppInteraction:(BOOL)a3
{
  self->_preventMultipleEdgesAfterAppInteraction = a3;
}

- (void)setSecondsToResetSwitcherListAfterTransition:(double)a3
{
  self->_secondsToResetSwitcherListAfterTransition = a3;
}

- (BOOL)resetSwitcherListAfterAppInteraction
{
  return self->_resetSwitcherListAfterAppInteraction;
}

- (void)setResetSwitcherListAfterAppInteraction:(BOOL)a3
{
  self->_resetSwitcherListAfterAppInteraction = a3;
}

- (double)travelDistanceForTranslatingScreenHeight
{
  return self->_travelDistanceForTranslatingScreenHeight;
}

- (void)setTravelDistanceForTranslatingScreenHeight:(double)a3
{
  self->_travelDistanceForTranslatingScreenHeight = a3;
}

- (double)minimumDistanceThresholdToScaleMultiplier
{
  return self->_minimumDistanceThresholdToScaleMultiplier;
}

- (void)setMinimumDistanceThresholdToScaleMultiplier:(double)a3
{
  self->_minimumDistanceThresholdToScaleMultiplier = a3;
}

- (void)setExclusionTrapezoidSettings:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionTrapezoidSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionTrapezoidSettings, 0);
}

@end
