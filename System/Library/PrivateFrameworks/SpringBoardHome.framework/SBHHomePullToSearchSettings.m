@implementation SBHHomePullToSearchSettings

- (void)setDefaultValues
{
  id v3;
  CAFrameRateRange v4;

  -[SBHHomePullToSearchSettings setPullTransitionDistance:](self, "setPullTransitionDistance:", 24.0);
  -[SBHHomePullToSearchSettings setPullTransitionActivationThreshold:](self, "setPullTransitionActivationThreshold:", 75.0);
  -[SBHHomePullToSearchSettings setPullTransitionRubberbandThreshold:](self, "setPullTransitionRubberbandThreshold:", 24.0);
  -[SBHHomePullToSearchSettings setPullGestureBeganFromTopLeeway:](self, "setPullGestureBeganFromTopLeeway:", 24.0);
  -[SBHHomePullToSearchSettings setBackgroundBlurInteractiveTransitionDistance:](self, "setBackgroundBlurInteractiveTransitionDistance:", 150.0);
  -[SBHHomePullToSearchSettings setBackgroundBlurStartThreshold:](self, "setBackgroundBlurStartThreshold:", 0.0);
  -[SBHHomePullToSearchSettings setBackgroundBlurEndThreshold:](self, "setBackgroundBlurEndThreshold:", 0.75);
  -[SBHHomePullToSearchSettings setBackgroundUnblurStartThreshold:](self, "setBackgroundUnblurStartThreshold:", 1.0);
  -[SBHHomePullToSearchSettings setBackgroundUnblurEndThreshold:](self, "setBackgroundUnblurEndThreshold:", 0.0);
  -[SBHHomePullToSearchSettings setSearchContentFadeInteractiveTransitionDistance:](self, "setSearchContentFadeInteractiveTransitionDistance:", 150.0);
  -[SBHHomePullToSearchSettings setSearchContentFadeInStartThreshold:](self, "setSearchContentFadeInStartThreshold:", 0.1);
  -[SBHHomePullToSearchSettings setSearchContentFadeInEndThreshold:](self, "setSearchContentFadeInEndThreshold:", 1.0);
  -[SBHHomePullToSearchSettings setSearchContentFadeOutStartThreshold:](self, "setSearchContentFadeOutStartThreshold:", 1.0);
  -[SBHHomePullToSearchSettings setSearchContentFadeOutEndThreshold:](self, "setSearchContentFadeOutEndThreshold:", 0.5);
  -[SBHHomePullToSearchSettings setSearchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance:](self, "setSearchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance:", 150.0);
  -[SBHHomePullToSearchSettings setSearchAffordanceBackgroundMaterialFadeStartThreshold:](self, "setSearchAffordanceBackgroundMaterialFadeStartThreshold:", 0.0);
  -[SBHHomePullToSearchSettings setSearchAffordanceBackgroundMaterialFadeEndThreshold:](self, "setSearchAffordanceBackgroundMaterialFadeEndThreshold:", 0.1);
  -[SBHHomePullToSearchSettings setSearchAffordanceContentFadeStartThreshold:](self, "setSearchAffordanceContentFadeStartThreshold:", 0.0);
  -[SBHHomePullToSearchSettings setSearchAffordanceContentFadeEndThreshold:](self, "setSearchAffordanceContentFadeEndThreshold:", 0.6);
  -[SBHHomePullToSearchSettings setSearchBarContentFadeStartThreshold:](self, "setSearchBarContentFadeStartThreshold:", 0.4);
  -[SBHHomePullToSearchSettings setSearchBarContentFadeEndThreshold:](self, "setSearchBarContentFadeEndThreshold:", 1.0);
  -[SBHHomePullToSearchSettings setScalesSearchAffordanceContentWhileFading:](self, "setScalesSearchAffordanceContentWhileFading:", 1);
  -[SBHHomePullToSearchSettings setSearchAffordanceTransformStartThreshold:](self, "setSearchAffordanceTransformStartThreshold:", 0.0);
  -[SBHHomePullToSearchSettings setSearchAffordanceTransformEndThreshold:](self, "setSearchAffordanceTransformEndThreshold:", 150.0);
  -[SBHHomePullToSearchSettings setSearchAffordanceMaxScaleX:](self, "setSearchAffordanceMaxScaleX:", 1.2);
  -[SBHHomePullToSearchSettings setSearchAffordanceMaxScaleY:](self, "setSearchAffordanceMaxScaleY:", 1.23);
  -[SBHHomePullToSearchSettings setSearchAffordanceScaleRubberbandingRange:](self, "setSearchAffordanceScaleRubberbandingRange:", 0.15);
  -[SBHHomePullToSearchSettings setSearchAffordanceMaxOffset:](self, "setSearchAffordanceMaxOffset:", 75.0);
  -[SBHHomePullToSearchSettings setSearchAffordanceOffsetRubberbandingRange:](self, "setSearchAffordanceOffsetRubberbandingRange:", 0.0);
  -[SBHHomePullToSearchSettings setSearchAffordanceTransientFadeInThreshold:](self, "setSearchAffordanceTransientFadeInThreshold:", 0.5);
  -[SBHHomePullToSearchSettings setAllowsKeyboardWhileInteractive:](self, "setAllowsKeyboardWhileInteractive:", 1);
  -[SBHHomePullToSearchSettings setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:](self, "setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:", 0);
  -[SBHHomePullToSearchSettings setInteractiveKeyboardPresentationThreshold:](self, "setInteractiveKeyboardPresentationThreshold:", 75.0);
  -[SBHHomePullToSearchSettings setInteractiveKeyboardPresentationOffset:](self, "setInteractiveKeyboardPresentationOffset:", 0.0);
  -[SBHHomePullToSearchSettings setKeyboardFollowsSpotlightContent:](self, "setKeyboardFollowsSpotlightContent:", 1);
  -[SBHHomePullToSearchSettings setAppIconsFollowTranslation:](self, "setAppIconsFollowTranslation:", 1);
  -[SBHHomePullToSearchSettings setAllowsVelocityInjection:](self, "setAllowsVelocityInjection:", 1);
  -[SBHHomePullToSearchSettings setInjectsVelocityOnlyForShortSwipes:](self, "setInjectsVelocityOnlyForShortSwipes:", 1);
  -[SBHHomePullToSearchSettings setShortSwipeMaximumPercentageOfExpectedVelocity:](self, "setShortSwipeMaximumPercentageOfExpectedVelocity:", 0.15);
  -[SBHHomePullToSearchSettings setInjectedPercentageOfGestureVelocity:](self, "setInjectedPercentageOfGestureVelocity:", 1.0);
  -[SBHHomePullToSearchSettings setKeyboardInjectedVelocityPercentage:](self, "setKeyboardInjectedVelocityPercentage:", 0.0);
  -[SBHHomePullToSearchSettings setInjectsVelocityForNonInteractiveTransitions:](self, "setInjectsVelocityForNonInteractiveTransitions:", 0);
  -[SBHHomePullToSearchSettings setInjectedVelocityForNonInteractiveTransitions:](self, "setInjectedVelocityForNonInteractiveTransitions:", 3000.0);
  -[SBHHomePullToSearchSettings setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:](self, "setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:", 0.0);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v3, "setDampingRatio:", 0.8);
  objc_msgSend(v3, "setResponse:", 0.47);
  objc_msgSend(v3, "setTrackingDampingRatio:", 0.92);
  objc_msgSend(v3, "setTrackingResponse:", 0.08);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114138, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  -[SBHHomePullToSearchSettings setPullTransitionAnimationSettings:](self, "setPullTransitionAnimationSettings:", v3);

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
  _QWORD v86[10];
  _QWORD v87[8];
  void *v88;
  _QWORD v89[5];
  _QWORD v90[13];
  _QWORD v91[3];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[4];
  void *v95;
  _QWORD v96[3];

  v96[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  v96[0] = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pull Transition"), CFSTR("pullTransitionAnimationSettings"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83078];
  v95 = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Animation Settings"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pull Distance"), CFSTR("pullTransitionDistance"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Activation Threshold"), CFSTR("pullTransitionActivationThreshold"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Rubber-Band Threshold"), CFSTR("pullTransitionRubberbandThreshold"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Began From Top Leeway"), CFSTR("pullGestureBeganFromTopLeeway"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83078];
  v94[0] = v73;
  v94[1] = v72;
  v94[2] = v71;
  v94[3] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v9, CFSTR("Pull Transition"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Blur Distance"), CFSTR("backgroundBlurInteractiveTransitionDistance"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Blur Start"), CFSTR("backgroundBlurStartThreshold"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Blur End"), CFSTR("backgroundBlurEndThreshold"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Unblur Start"), CFSTR("backgroundUnblurStartThreshold"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Unblur End"), CFSTR("backgroundUnblurEndThreshold"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83078];
  v93[0] = v69;
  v93[1] = v68;
  v93[2] = v67;
  v93[3] = v66;
  v93[4] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Background Blur"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Fade-In Distance"), CFSTR("searchContentFadeInteractiveTransitionDistance"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Fade-In Start"), CFSTR("searchContentFadeInStartThreshold"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Fade-In End"), CFSTR("searchContentFadeInEndThreshold"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Fade-Out Start"), CFSTR("searchContentFadeOutStartThreshold"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Fade-Out End"), CFSTR("searchContentFadeOutEndThreshold"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D83078];
  v92[0] = v64;
  v92[1] = v63;
  v92[2] = v62;
  v92[3] = v61;
  v92[4] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v13, CFSTR("Search Content"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Fade Distance"), CFSTR("searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Fade Start"), CFSTR("searchAffordanceBackgroundMaterialFadeStartThreshold"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Fade End"), CFSTR("searchAffordanceBackgroundMaterialFadeEndThreshold"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  v91[0] = v59;
  v91[1] = v58;
  v91[2] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v15, CFSTR("Search Pill Background Material Fade"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Text Fade Start"), CFSTR("searchAffordanceContentFadeStartThreshold"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Text Fade End"), CFSTR("searchAffordanceContentFadeEndThreshold"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Bar Text Fade Start"), CFSTR("searchBarContentFadeStartThreshold"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Bar Text Fade End"), CFSTR("searchBarContentFadeEndThreshold"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Text Scales While Fading"), CFSTR("scalesSearchAffordanceContentWhileFading"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Scale/Translate Start"), CFSTR("searchAffordanceTransformStartThreshold"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Scale/Translate End"), CFSTR("searchAffordanceTransformEndThreshold"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Max Scale X"), CFSTR("searchAffordanceMaxScaleX"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Max Scale Y"), CFSTR("searchAffordanceMaxScaleY"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Rubberbanding Range"), CFSTR("searchAffordanceScaleRubberbandingRange"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Pill Max Offset"), CFSTR("searchAffordanceMaxOffset"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Offset Rubberbanding Range"), CFSTR("searchAffordanceOffsetRubberbandingRange"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Transient Search Pill Fade Threshold"), CFSTR("searchAffordanceTransientFadeInThreshold"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D83078];
  v90[0] = v80;
  v90[1] = v79;
  v90[2] = v78;
  v90[3] = v76;
  v90[4] = v56;
  v90[5] = v55;
  v90[6] = v54;
  v90[7] = v53;
  v90[8] = v52;
  v90[9] = v51;
  v90[10] = v50;
  v90[11] = v49;
  v90[12] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:", v17, CFSTR("Search Pill / Bar"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Bring In While Interactive"), CFSTR("allowsKeyboardWhileInteractive"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Keyboard Without Pill"), CFSTR("allowsKeyboardWhileInteractiveWithoutSearchAffordance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Keyboard Threshold"), CFSTR("interactiveKeyboardPresentationThreshold"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Presentation Offset"), CFSTR("interactiveKeyboardPresentationOffset"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMinValue:", -1000.0);
  v19 = v18;
  v44 = v18;
  objc_msgSend(v18, "setMaxValue:", 1000.0);
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Keyboard Follows Spotlight"), CFSTR("keyboardFollowsSpotlightContent"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D83078];
  v89[0] = v47;
  v89[1] = v46;
  v89[2] = v45;
  v89[3] = v19;
  v89[4] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:title:", v21, CFSTR("Keyboard"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Icons Follow Translation"), CFSTR("appIconsFollowTranslation"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D83078];
  v88 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v23, CFSTR("App Icons"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Inject Velocity"), CFSTR("allowsVelocityInjection"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Short Swipes Only"), CFSTR("injectsVelocityOnlyForShortSwipes"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Short Swipe Max % Expected Velocity"), CFSTR("shortSwipeMaximumPercentageOfExpectedVelocity"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Injected % Gesture Velocity"), CFSTR("injectedPercentageOfGestureVelocity"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Keyboard % Velocity"), CFSTR("keyboardInjectedVelocityPercentage"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMinValue:", -2.0);
  objc_msgSend(v24, "setMaxValue:", 2.0);
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Inject For Button Taps"), CFSTR("injectsVelocityForNonInteractiveTransitions"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Button Tap Velocity"), CFSTR("injectedVelocityForNonInteractiveTransitions"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Button Tap Keyboard % Velocity"), CFSTR("keyboardInjectedVelocityPercentageForNonInteractiveTransitions"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMinValue:", -2.0);
  objc_msgSend(v27, "setMaxValue:", 2.0);
  v28 = (void *)MEMORY[0x1E0D83078];
  v87[0] = v38;
  v87[1] = v37;
  v87[2] = v36;
  v87[3] = v35;
  v87[4] = v24;
  v87[5] = v25;
  v87[6] = v26;
  v87[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:title:", v29, CFSTR("Velocity Injection"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83078];
  v86[0] = v84;
  v86[1] = v83;
  v86[2] = v82;
  v86[3] = v81;
  v86[4] = v77;
  v86[5] = v40;
  v86[6] = v41;
  v86[7] = v39;
  v86[8] = v30;
  v86[9] = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "moduleWithTitle:contents:", CFSTR("Pull To Search"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (SBFFluidBehaviorSettings)pullTransitionAnimationSettings
{
  return self->_pullTransitionAnimationSettings;
}

- (void)setPullTransitionAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pullTransitionAnimationSettings, a3);
}

- (double)pullTransitionDistance
{
  return self->_pullTransitionDistance;
}

- (void)setPullTransitionDistance:(double)a3
{
  self->_pullTransitionDistance = a3;
}

- (double)pullTransitionActivationThreshold
{
  return self->_pullTransitionActivationThreshold;
}

- (void)setPullTransitionActivationThreshold:(double)a3
{
  self->_pullTransitionActivationThreshold = a3;
}

- (double)pullTransitionRubberbandThreshold
{
  return self->_pullTransitionRubberbandThreshold;
}

- (void)setPullTransitionRubberbandThreshold:(double)a3
{
  self->_pullTransitionRubberbandThreshold = a3;
}

- (double)pullGestureBeganFromTopLeeway
{
  return self->_pullGestureBeganFromTopLeeway;
}

- (void)setPullGestureBeganFromTopLeeway:(double)a3
{
  self->_pullGestureBeganFromTopLeeway = a3;
}

- (double)backgroundBlurInteractiveTransitionDistance
{
  return self->_backgroundBlurInteractiveTransitionDistance;
}

- (void)setBackgroundBlurInteractiveTransitionDistance:(double)a3
{
  self->_backgroundBlurInteractiveTransitionDistance = a3;
}

- (double)backgroundBlurStartThreshold
{
  return self->_backgroundBlurStartThreshold;
}

- (void)setBackgroundBlurStartThreshold:(double)a3
{
  self->_backgroundBlurStartThreshold = a3;
}

- (double)backgroundBlurEndThreshold
{
  return self->_backgroundBlurEndThreshold;
}

- (void)setBackgroundBlurEndThreshold:(double)a3
{
  self->_backgroundBlurEndThreshold = a3;
}

- (double)backgroundUnblurStartThreshold
{
  return self->_backgroundUnblurStartThreshold;
}

- (void)setBackgroundUnblurStartThreshold:(double)a3
{
  self->_backgroundUnblurStartThreshold = a3;
}

- (double)backgroundUnblurEndThreshold
{
  return self->_backgroundUnblurEndThreshold;
}

- (void)setBackgroundUnblurEndThreshold:(double)a3
{
  self->_backgroundUnblurEndThreshold = a3;
}

- (double)searchContentFadeInteractiveTransitionDistance
{
  return self->_searchContentFadeInteractiveTransitionDistance;
}

- (void)setSearchContentFadeInteractiveTransitionDistance:(double)a3
{
  self->_searchContentFadeInteractiveTransitionDistance = a3;
}

- (double)searchContentFadeInStartThreshold
{
  return self->_searchContentFadeInStartThreshold;
}

- (void)setSearchContentFadeInStartThreshold:(double)a3
{
  self->_searchContentFadeInStartThreshold = a3;
}

- (double)searchContentFadeInEndThreshold
{
  return self->_searchContentFadeInEndThreshold;
}

- (void)setSearchContentFadeInEndThreshold:(double)a3
{
  self->_searchContentFadeInEndThreshold = a3;
}

- (double)searchContentFadeOutStartThreshold
{
  return self->_searchContentFadeOutStartThreshold;
}

- (void)setSearchContentFadeOutStartThreshold:(double)a3
{
  self->_searchContentFadeOutStartThreshold = a3;
}

- (double)searchContentFadeOutEndThreshold
{
  return self->_searchContentFadeOutEndThreshold;
}

- (void)setSearchContentFadeOutEndThreshold:(double)a3
{
  self->_searchContentFadeOutEndThreshold = a3;
}

- (double)searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance
{
  return self->_searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance;
}

- (void)setSearchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance:(double)a3
{
  self->_searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance = a3;
}

- (double)searchAffordanceBackgroundMaterialFadeStartThreshold
{
  return self->_searchAffordanceBackgroundMaterialFadeStartThreshold;
}

- (void)setSearchAffordanceBackgroundMaterialFadeStartThreshold:(double)a3
{
  self->_searchAffordanceBackgroundMaterialFadeStartThreshold = a3;
}

- (double)searchAffordanceBackgroundMaterialFadeEndThreshold
{
  return self->_searchAffordanceBackgroundMaterialFadeEndThreshold;
}

- (void)setSearchAffordanceBackgroundMaterialFadeEndThreshold:(double)a3
{
  self->_searchAffordanceBackgroundMaterialFadeEndThreshold = a3;
}

- (double)searchAffordanceContentFadeStartThreshold
{
  return self->_searchAffordanceContentFadeStartThreshold;
}

- (void)setSearchAffordanceContentFadeStartThreshold:(double)a3
{
  self->_searchAffordanceContentFadeStartThreshold = a3;
}

- (double)searchAffordanceContentFadeEndThreshold
{
  return self->_searchAffordanceContentFadeEndThreshold;
}

- (void)setSearchAffordanceContentFadeEndThreshold:(double)a3
{
  self->_searchAffordanceContentFadeEndThreshold = a3;
}

- (double)searchBarContentFadeStartThreshold
{
  return self->_searchBarContentFadeStartThreshold;
}

- (void)setSearchBarContentFadeStartThreshold:(double)a3
{
  self->_searchBarContentFadeStartThreshold = a3;
}

- (double)searchBarContentFadeEndThreshold
{
  return self->_searchBarContentFadeEndThreshold;
}

- (void)setSearchBarContentFadeEndThreshold:(double)a3
{
  self->_searchBarContentFadeEndThreshold = a3;
}

- (BOOL)scalesSearchAffordanceContentWhileFading
{
  return self->_scalesSearchAffordanceContentWhileFading;
}

- (void)setScalesSearchAffordanceContentWhileFading:(BOOL)a3
{
  self->_scalesSearchAffordanceContentWhileFading = a3;
}

- (double)searchAffordanceTransformStartThreshold
{
  return self->_searchAffordanceTransformStartThreshold;
}

- (void)setSearchAffordanceTransformStartThreshold:(double)a3
{
  self->_searchAffordanceTransformStartThreshold = a3;
}

- (double)searchAffordanceTransformEndThreshold
{
  return self->_searchAffordanceTransformEndThreshold;
}

- (void)setSearchAffordanceTransformEndThreshold:(double)a3
{
  self->_searchAffordanceTransformEndThreshold = a3;
}

- (double)searchAffordanceMaxScaleX
{
  return self->_searchAffordanceMaxScaleX;
}

- (void)setSearchAffordanceMaxScaleX:(double)a3
{
  self->_searchAffordanceMaxScaleX = a3;
}

- (double)searchAffordanceMaxScaleY
{
  return self->_searchAffordanceMaxScaleY;
}

- (void)setSearchAffordanceMaxScaleY:(double)a3
{
  self->_searchAffordanceMaxScaleY = a3;
}

- (double)searchAffordanceScaleRubberbandingRange
{
  return self->_searchAffordanceScaleRubberbandingRange;
}

- (void)setSearchAffordanceScaleRubberbandingRange:(double)a3
{
  self->_searchAffordanceScaleRubberbandingRange = a3;
}

- (double)searchAffordanceMaxOffset
{
  return self->_searchAffordanceMaxOffset;
}

- (void)setSearchAffordanceMaxOffset:(double)a3
{
  self->_searchAffordanceMaxOffset = a3;
}

- (double)searchAffordanceOffsetRubberbandingRange
{
  return self->_searchAffordanceOffsetRubberbandingRange;
}

- (void)setSearchAffordanceOffsetRubberbandingRange:(double)a3
{
  self->_searchAffordanceOffsetRubberbandingRange = a3;
}

- (double)searchAffordanceTransientFadeInThreshold
{
  return self->_searchAffordanceTransientFadeInThreshold;
}

- (void)setSearchAffordanceTransientFadeInThreshold:(double)a3
{
  self->_searchAffordanceTransientFadeInThreshold = a3;
}

- (BOOL)allowsKeyboardWhileInteractive
{
  return self->_allowsKeyboardWhileInteractive;
}

- (void)setAllowsKeyboardWhileInteractive:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractive = a3;
}

- (BOOL)allowsKeyboardWhileInteractiveWithoutSearchAffordance
{
  return self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance;
}

- (void)setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance = a3;
}

- (double)interactiveKeyboardPresentationThreshold
{
  return self->_interactiveKeyboardPresentationThreshold;
}

- (void)setInteractiveKeyboardPresentationThreshold:(double)a3
{
  self->_interactiveKeyboardPresentationThreshold = a3;
}

- (double)interactiveKeyboardPresentationOffset
{
  return self->_interactiveKeyboardPresentationOffset;
}

- (void)setInteractiveKeyboardPresentationOffset:(double)a3
{
  self->_interactiveKeyboardPresentationOffset = a3;
}

- (BOOL)keyboardFollowsSpotlightContent
{
  return self->_keyboardFollowsSpotlightContent;
}

- (void)setKeyboardFollowsSpotlightContent:(BOOL)a3
{
  self->_keyboardFollowsSpotlightContent = a3;
}

- (BOOL)appIconsFollowTranslation
{
  return self->_appIconsFollowTranslation;
}

- (void)setAppIconsFollowTranslation:(BOOL)a3
{
  self->_appIconsFollowTranslation = a3;
}

- (BOOL)allowsVelocityInjection
{
  return self->_allowsVelocityInjection;
}

- (void)setAllowsVelocityInjection:(BOOL)a3
{
  self->_allowsVelocityInjection = a3;
}

- (BOOL)injectsVelocityOnlyForShortSwipes
{
  return self->_injectsVelocityOnlyForShortSwipes;
}

- (void)setInjectsVelocityOnlyForShortSwipes:(BOOL)a3
{
  self->_injectsVelocityOnlyForShortSwipes = a3;
}

- (double)shortSwipeMaximumPercentageOfExpectedVelocity
{
  return self->_shortSwipeMaximumPercentageOfExpectedVelocity;
}

- (void)setShortSwipeMaximumPercentageOfExpectedVelocity:(double)a3
{
  self->_shortSwipeMaximumPercentageOfExpectedVelocity = a3;
}

- (double)injectedPercentageOfGestureVelocity
{
  return self->_injectedPercentageOfGestureVelocity;
}

- (void)setInjectedPercentageOfGestureVelocity:(double)a3
{
  self->_injectedPercentageOfGestureVelocity = a3;
}

- (double)keyboardInjectedVelocityPercentage
{
  return self->_keyboardInjectedVelocityPercentage;
}

- (void)setKeyboardInjectedVelocityPercentage:(double)a3
{
  self->_keyboardInjectedVelocityPercentage = a3;
}

- (BOOL)injectsVelocityForNonInteractiveTransitions
{
  return self->_injectsVelocityForNonInteractiveTransitions;
}

- (void)setInjectsVelocityForNonInteractiveTransitions:(BOOL)a3
{
  self->_injectsVelocityForNonInteractiveTransitions = a3;
}

- (double)injectedVelocityForNonInteractiveTransitions
{
  return self->_injectedVelocityForNonInteractiveTransitions;
}

- (void)setInjectedVelocityForNonInteractiveTransitions:(double)a3
{
  self->_injectedVelocityForNonInteractiveTransitions = a3;
}

- (double)keyboardInjectedVelocityPercentageForNonInteractiveTransitions
{
  return self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
}

- (void)setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:(double)a3
{
  self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pullTransitionAnimationSettings, 0);
}

@end
