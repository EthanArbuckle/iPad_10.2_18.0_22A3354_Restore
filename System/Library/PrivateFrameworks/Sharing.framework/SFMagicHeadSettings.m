@implementation SFMagicHeadSettings

- (void)setDefaultValues
{
  -[SFMagicHeadSettings setShowRangingValues:](self, "setShowRangingValues:", 0);
  -[SFMagicHeadSettings setShowSelectionGateLock:](self, "setShowSelectionGateLock:", 0);
  -[SFMagicHeadSettings setShowSelectionMarkers:](self, "setShowSelectionMarkers:", 0);
  -[SFMagicHeadSettings setSelectionDisabled:](self, "setSelectionDisabled:", 0);
  -[SFMagicHeadSettings setTapDarkeningAlpha:](self, "setTapDarkeningAlpha:", 0.2);
  -[SFMagicHeadSettings setCirclesFadeInDurationS:](self, "setCirclesFadeInDurationS:", 0.3);
  -[SFMagicHeadSettings setCirclesFadeOutDurationS:](self, "setCirclesFadeOutDurationS:", 0.7);
  -[SFMagicHeadSettings setRollEnabled:](self, "setRollEnabled:", 1);
  -[SFMagicHeadSettings setRollMaxDegrees:](self, "setRollMaxDegrees:", 1.0);
  -[SFMagicHeadSettings setRollRubberbandingStretchiness:](self, "setRollRubberbandingStretchiness:", 5.0);
  -[SFMagicHeadSettings setGuidanceEnabled:](self, "setGuidanceEnabled:", 1);
  -[SFMagicHeadSettings setGuidanceGoodAngleThreshold:](self, "setGuidanceGoodAngleThreshold:", 15.0);
  -[SFMagicHeadSettings setGuidanceWorstAngleDegreesDelta:](self, "setGuidanceWorstAngleDegreesDelta:", 15.0);
  -[SFMagicHeadSettings setGuidanceDipSpeed:](self, "setGuidanceDipSpeed:", 10.0);
  -[SFMagicHeadSettings setGuidanceRubberbandingStretchiness:](self, "setGuidanceRubberbandingStretchiness:", 90.0);
  -[SFMagicHeadSettings setGuidanceFadeHeadDegrees:](self, "setGuidanceFadeHeadDegrees:", 15.0);
  -[SFMagicHeadSettings setGuidanceRestoreHeadDegreesDelta:](self, "setGuidanceRestoreHeadDegreesDelta:", 10.0);
  -[SFMagicHeadSettings setGuidanceTooFarDegrees:](self, "setGuidanceTooFarDegrees:", 4.0);
  -[SFMagicHeadSettings setGuidanceRecoveredDegreesDelta:](self, "setGuidanceRecoveredDegreesDelta:", 5.0);
  -[SFMagicHeadSettings setGuidanceTiltedTooFarAlpha:](self, "setGuidanceTiltedTooFarAlpha:", 0.42);
  -[SFMagicHeadSettings setGuidanceSuppressHapticsEnabled:](self, "setGuidanceSuppressHapticsEnabled:", 0.0);
  -[SFMagicHeadSettings setGuidanceSuppressHapticsDurationS:](self, "setGuidanceSuppressHapticsDurationS:", 5.0);
  -[SFMagicHeadSettings setGuidanceContractDotsHapticEnabled:](self, "setGuidanceContractDotsHapticEnabled:", 1.0);
  -[SFMagicHeadSettings setGuidanceExpandDotsHapticEnabled:](self, "setGuidanceExpandDotsHapticEnabled:", 1.0);
  -[SFMagicHeadSettings setRotationGatedSelectionEnabled:](self, "setRotationGatedSelectionEnabled:", 0);
  -[SFMagicHeadSettings setRotationGateThresholdDegrees:](self, "setRotationGateThresholdDegrees:", 0.1);
  -[SFMagicHeadSettings setRotationStartGatingResponsiveness:](self, "setRotationStartGatingResponsiveness:", 5);
  -[SFMagicHeadSettings setRotationStopGatingResponsiveness:](self, "setRotationStopGatingResponsiveness:", 20);
  -[SFMagicHeadSettings setRotationStartBigHeadGatingResponsiveness:](self, "setRotationStartBigHeadGatingResponsiveness:", 60);
  -[SFMagicHeadSettings setRotationStopBigHeadGatingResponsiveness:](self, "setRotationStopBigHeadGatingResponsiveness:", 200);
  -[SFMagicHeadSettings setSelectionScaleFriction:](self, "setSelectionScaleFriction:", 40.0);
  -[SFMagicHeadSettings setSelectionAlphaFriction:](self, "setSelectionAlphaFriction:", 70.17);
  -[SFMagicHeadSettings setSelectionPositionFriction:](self, "setSelectionPositionFriction:", 30.17);
  -[SFMagicHeadSettings setDismissScaleFriction:](self, "setDismissScaleFriction:", 40.0);
  -[SFMagicHeadSettings setDismissAlphaFriction:](self, "setDismissAlphaFriction:", 60.17);
  -[SFMagicHeadSettings setDismissPositionFriction:](self, "setDismissPositionFriction:", 40.0);
  -[SFMagicHeadSettings setHapticForCozyUpSelectionEnabled:](self, "setHapticForCozyUpSelectionEnabled:", 0);
  -[SFMagicHeadSettings setCozyUpAnimationEnabled:](self, "setCozyUpAnimationEnabled:", 1);
  -[SFMagicHeadSettings setCozyUpSelectDurationS:](self, "setCozyUpSelectDurationS:", 0.65);
  -[SFMagicHeadSettings setSelectedPulseEnabled:](self, "setSelectedPulseEnabled:", 1);
  -[SFMagicHeadSettings setSelectedPulseDurationS:](self, "setSelectedPulseDurationS:", 0.4);
  -[SFMagicHeadSettings setSelectedPulseScaleAmount:](self, "setSelectedPulseScaleAmount:", 1.04);
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
  _QWORD v134[11];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[3];
  _QWORD v138[3];
  _QWORD v139[6];
  _QWORD v140[4];
  _QWORD v141[10];
  _QWORD v142[3];
  _QWORD v143[2];
  _QWORD v144[5];
  _QWORD v145[3];

  v145[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  v145[0] = v124;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Ranging Values"), CFSTR("showRangingValues"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Selection Lock"), CFSTR("showSelectionGateLock"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Selection Markers"), CFSTR("showSelectionMarkers"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Selection Disabled"), CFSTR("selectionDisabled"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tap Darkening Alpha"), CFSTR("tapDarkeningAlpha"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83078];
  v144[0] = v123;
  v144[1] = v122;
  v144[2] = v121;
  v144[3] = v120;
  v144[4] = v119;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("UI Settings"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Circles Fade In S"), CFSTR("circlesFadeInDurationS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.1, 1.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Circles Fade Out S"), CFSTR("circlesFadeOutDurationS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.1, 1.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  v143[0] = v118;
  v143[1] = v117;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Little Head Settings"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Roll Enabled"), CFSTR("rollEnabled"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max °"), CFSTR("rollMaxDegrees"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 15.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueValidator:", &__block_literal_global_1);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Rubber stretch"), CFSTR("rollRubberbandingStretchiness"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueValidator:", &__block_literal_global_1);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v142[0] = v116;
  v142[1] = v115;
  v142[2] = v114;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:", v17, CFSTR("Roll Settings"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Guidance Enabled"), CFSTR("guidanceEnabled"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Good ° Threshold"), CFSTR("guidanceGoodAngleThreshold"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 10.0, 50.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueValidator:", &__block_literal_global_1);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Worst ° Delta"), CFSTR("guidanceWorstAngleDegreesDelta"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minValue:maxValue:", 10.0, 50.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueValidator:", &__block_literal_global_1);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Dip Speed"), CFSTR("guidanceDipSpeed"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minValue:maxValue:", 0.0, 5.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueValidator:", &__block_literal_global_1);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Rubber Stretch"), CFSTR("guidanceRubberbandingStretchiness"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "minValue:maxValue:", 10.0, 150.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueValidator:", &__block_literal_global_4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Head °"), CFSTR("guidanceFadeHeadDegrees"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 10.0, 50.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueValidator:", &__block_literal_global_1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("RestoreHead ° Delta"), CFSTR("guidanceRestoreHeadDegreesDelta"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minValue:maxValue:", 0.0, 40.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "valueValidator:", &__block_literal_global_1);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Too Far °"), CFSTR("guidanceTooFarDegrees"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minValue:maxValue:", -10.0, 30.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "valueValidator:", &__block_literal_global_1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Recovered °"), CFSTR("guidanceRecoveredDegreesDelta"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "minValue:maxValue:", 0.0, 30.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "valueValidator:", &__block_literal_global_1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Too Far Alpha"), CFSTR("guidanceTiltedTooFarAlpha"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 0.1, 1.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83078];
  v141[0] = v129;
  v141[1] = v128;
  v141[2] = v127;
  v141[3] = v113;
  v141[4] = v112;
  v141[5] = v111;
  v141[6] = v110;
  v141[7] = v109;
  v141[8] = v108;
  v141[9] = v107;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v36, CFSTR("Guidance Settings"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Timed Suppression"), CFSTR("guidanceSuppressHapticsEnabled"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Suppress Dur Sec"), CFSTR("guidanceSuppressHapticsDurationS"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.5, 20.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "valueValidator:", &__block_literal_global_2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Dots Contract Haptic"), CFSTR("guidanceContractDotsHapticEnabled"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Dots Expand Haptic"), CFSTR("guidanceExpandDotsHapticEnabled"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0D83078];
  v140[0] = v106;
  v140[1] = v105;
  v140[2] = v104;
  v140[3] = v103;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sectionWithRows:title:", v40, CFSTR("Guidance Haptic Settings"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), CFSTR("rotationGatedSelectionEnabled"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Threshold °"), CFSTR("rotationGateThresholdDegrees"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "minValue:maxValue:", 0.01, 1.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("MH Start"), CFSTR("rotationStartGatingResponsiveness"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "minValue:maxValue:", 1.0, 40.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "valueValidator:", &__block_literal_global_4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("MH Stop"), CFSTR("rotationStopGatingResponsiveness"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "minValue:maxValue:", 1.0, 100.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "valueValidator:", &__block_literal_global_4);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("BigHead Start"), CFSTR("rotationStartBigHeadGatingResponsiveness"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "minValue:maxValue:", 1.0, 100.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "valueValidator:", &__block_literal_global_4);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("BigHead Stop"), CFSTR("rotationStopBigHeadGatingResponsiveness"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", 1.0, 400.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "valueValidator:", &__block_literal_global_4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (void *)MEMORY[0x1E0D83078];
  v139[0] = v102;
  v139[1] = v101;
  v139[2] = v100;
  v139[3] = v99;
  v139[4] = v98;
  v139[5] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sectionWithRows:title:", v51, CFSTR("Selection Gating Settings"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Scale"), CFSTR("selectionScaleFriction"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "minValue:maxValue:", 20.0, 100.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "valueValidator:", &__block_literal_global_4);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Alpha"), CFSTR("selectionAlphaFriction"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "minValue:maxValue:", 20.0, 100.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "valueValidator:", &__block_literal_global_4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Position"), CFSTR("selectionPositionFriction"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "minValue:maxValue:", 20.0, 100.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "valueValidator:", &__block_literal_global_4);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0D83078];
  v138[0] = v95;
  v138[1] = v94;
  v138[2] = v93;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sectionWithRows:title:", v59, CFSTR("Selection Animation Friction"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Scale"), CFSTR("dismissScaleFriction"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 20.0, 100.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "valueValidator:", &__block_literal_global_4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Alpha"), CFSTR("dismissAlphaFriction"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "minValue:maxValue:", 20.0, 100.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "valueValidator:", &__block_literal_global_4);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Position"), CFSTR("dismissPositionFriction"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "minValue:maxValue:", 20.0, 100.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "valueValidator:", &__block_literal_global_4);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = (void *)MEMORY[0x1E0D83078];
  v137[0] = v91;
  v137[1] = v90;
  v137[2] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "sectionWithRows:title:", v67, CFSTR("Dismiss Animation Friction"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Haptic for CozyUp"), CFSTR("hapticForCozyUpSelectionEnabled"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), CFSTR("cozyUpAnimationEnabled"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Select Dur Sec"), CFSTR("cozyUpSelectDurationS"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "minValue:maxValue:", 0.1, 1.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = (void *)MEMORY[0x1E0D83078];
  v136[0] = v88;
  v136[1] = v87;
  v136[2] = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 3);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "sectionWithRows:title:", v70, CFSTR("Cozy Up Animation Settings"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), CFSTR("selectedPulseEnabled"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Duration Sec"), CFSTR("selectedPulseDurationS"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "minValue:maxValue:", 0.1, 1.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "valueValidator:", &__block_literal_global_2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Scale Amount"), CFSTR("selectedPulseScaleAmount"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "minValue:maxValue:", 1.01, 1.5);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = (void *)MEMORY[0x1E0D83078];
  v135[0] = v71;
  v135[1] = v74;
  v135[2] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "sectionWithRows:title:", v78, CFSTR("Re-select Pulse Settings"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = (void *)MEMORY[0x1E0D83078];
  v134[0] = v133;
  v134[1] = v132;
  v134[2] = v131;
  v134[3] = v130;
  v134[4] = v126;
  v134[5] = v125;
  v134[6] = v96;
  v134[7] = v92;
  v134[8] = v85;
  v134[9] = v84;
  v134[10] = v79;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 11);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "moduleWithTitle:contents:", CFSTR("Settings"), v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  return v82;
}

uint64_t __47__SFMagicHeadSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

uint64_t __47__SFMagicHeadSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "numberWithDouble:", round(v3 + v3) * 0.5);
}

uint64_t __47__SFMagicHeadSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "numberWithDouble:", round(v3 / 0.1) * 0.1);
}

- (BOOL)showRangingValues
{
  return self->_showRangingValues;
}

- (void)setShowRangingValues:(BOOL)a3
{
  self->_showRangingValues = a3;
}

- (BOOL)showSelectionGateLock
{
  return self->_showSelectionGateLock;
}

- (void)setShowSelectionGateLock:(BOOL)a3
{
  self->_showSelectionGateLock = a3;
}

- (BOOL)showSelectionMarkers
{
  return self->_showSelectionMarkers;
}

- (void)setShowSelectionMarkers:(BOOL)a3
{
  self->_showSelectionMarkers = a3;
}

- (BOOL)selectionDisabled
{
  return self->_selectionDisabled;
}

- (void)setSelectionDisabled:(BOOL)a3
{
  self->_selectionDisabled = a3;
}

- (double)tapDarkeningAlpha
{
  return self->_tapDarkeningAlpha;
}

- (void)setTapDarkeningAlpha:(double)a3
{
  self->_tapDarkeningAlpha = a3;
}

- (double)circlesFadeInDurationS
{
  return self->_circlesFadeInDurationS;
}

- (void)setCirclesFadeInDurationS:(double)a3
{
  self->_circlesFadeInDurationS = a3;
}

- (double)circlesFadeOutDurationS
{
  return self->_circlesFadeOutDurationS;
}

- (void)setCirclesFadeOutDurationS:(double)a3
{
  self->_circlesFadeOutDurationS = a3;
}

- (BOOL)rollEnabled
{
  return self->_rollEnabled;
}

- (void)setRollEnabled:(BOOL)a3
{
  self->_rollEnabled = a3;
}

- (double)rollMaxDegrees
{
  return self->_rollMaxDegrees;
}

- (void)setRollMaxDegrees:(double)a3
{
  self->_rollMaxDegrees = a3;
}

- (double)rollRubberbandingStretchiness
{
  return self->_rollRubberbandingStretchiness;
}

- (void)setRollRubberbandingStretchiness:(double)a3
{
  self->_rollRubberbandingStretchiness = a3;
}

- (BOOL)guidanceEnabled
{
  return self->_guidanceEnabled;
}

- (void)setGuidanceEnabled:(BOOL)a3
{
  self->_guidanceEnabled = a3;
}

- (double)guidanceGoodAngleThreshold
{
  return self->_guidanceGoodAngleThreshold;
}

- (void)setGuidanceGoodAngleThreshold:(double)a3
{
  self->_guidanceGoodAngleThreshold = a3;
}

- (double)guidanceWorstAngleDegreesDelta
{
  return self->_guidanceWorstAngleDegreesDelta;
}

- (void)setGuidanceWorstAngleDegreesDelta:(double)a3
{
  self->_guidanceWorstAngleDegreesDelta = a3;
}

- (double)guidanceDipSpeed
{
  return self->_guidanceDipSpeed;
}

- (void)setGuidanceDipSpeed:(double)a3
{
  self->_guidanceDipSpeed = a3;
}

- (double)guidanceRubberbandingStretchiness
{
  return self->_guidanceRubberbandingStretchiness;
}

- (void)setGuidanceRubberbandingStretchiness:(double)a3
{
  self->_guidanceRubberbandingStretchiness = a3;
}

- (double)guidanceFadeHeadDegrees
{
  return self->_guidanceFadeHeadDegrees;
}

- (void)setGuidanceFadeHeadDegrees:(double)a3
{
  self->_guidanceFadeHeadDegrees = a3;
}

- (double)guidanceRestoreHeadDegreesDelta
{
  return self->_guidanceRestoreHeadDegreesDelta;
}

- (void)setGuidanceRestoreHeadDegreesDelta:(double)a3
{
  self->_guidanceRestoreHeadDegreesDelta = a3;
}

- (double)guidanceTooFarDegrees
{
  return self->_guidanceTooFarDegrees;
}

- (void)setGuidanceTooFarDegrees:(double)a3
{
  self->_guidanceTooFarDegrees = a3;
}

- (double)guidanceRecoveredDegreesDelta
{
  return self->_guidanceRecoveredDegreesDelta;
}

- (void)setGuidanceRecoveredDegreesDelta:(double)a3
{
  self->_guidanceRecoveredDegreesDelta = a3;
}

- (double)guidanceTiltedTooFarAlpha
{
  return self->_guidanceTiltedTooFarAlpha;
}

- (void)setGuidanceTiltedTooFarAlpha:(double)a3
{
  self->_guidanceTiltedTooFarAlpha = a3;
}

- (double)guidanceSuppressHapticsEnabled
{
  return self->_guidanceSuppressHapticsEnabled;
}

- (void)setGuidanceSuppressHapticsEnabled:(double)a3
{
  self->_guidanceSuppressHapticsEnabled = a3;
}

- (double)guidanceSuppressHapticsDurationS
{
  return self->_guidanceSuppressHapticsDurationS;
}

- (void)setGuidanceSuppressHapticsDurationS:(double)a3
{
  self->_guidanceSuppressHapticsDurationS = a3;
}

- (double)guidanceContractDotsHapticEnabled
{
  return self->_guidanceContractDotsHapticEnabled;
}

- (void)setGuidanceContractDotsHapticEnabled:(double)a3
{
  self->_guidanceContractDotsHapticEnabled = a3;
}

- (double)guidanceExpandDotsHapticEnabled
{
  return self->_guidanceExpandDotsHapticEnabled;
}

- (void)setGuidanceExpandDotsHapticEnabled:(double)a3
{
  self->_guidanceExpandDotsHapticEnabled = a3;
}

- (BOOL)rotationGatedSelectionEnabled
{
  return self->_rotationGatedSelectionEnabled;
}

- (void)setRotationGatedSelectionEnabled:(BOOL)a3
{
  self->_rotationGatedSelectionEnabled = a3;
}

- (double)rotationGateThresholdDegrees
{
  return self->_rotationGateThresholdDegrees;
}

- (void)setRotationGateThresholdDegrees:(double)a3
{
  self->_rotationGateThresholdDegrees = a3;
}

- (int64_t)rotationStartGatingResponsiveness
{
  return self->_rotationStartGatingResponsiveness;
}

- (void)setRotationStartGatingResponsiveness:(int64_t)a3
{
  self->_rotationStartGatingResponsiveness = a3;
}

- (int64_t)rotationStopGatingResponsiveness
{
  return self->_rotationStopGatingResponsiveness;
}

- (void)setRotationStopGatingResponsiveness:(int64_t)a3
{
  self->_rotationStopGatingResponsiveness = a3;
}

- (int64_t)rotationStartBigHeadGatingResponsiveness
{
  return self->_rotationStartBigHeadGatingResponsiveness;
}

- (void)setRotationStartBigHeadGatingResponsiveness:(int64_t)a3
{
  self->_rotationStartBigHeadGatingResponsiveness = a3;
}

- (int64_t)rotationStopBigHeadGatingResponsiveness
{
  return self->_rotationStopBigHeadGatingResponsiveness;
}

- (void)setRotationStopBigHeadGatingResponsiveness:(int64_t)a3
{
  self->_rotationStopBigHeadGatingResponsiveness = a3;
}

- (double)selectionScaleFriction
{
  return self->_selectionScaleFriction;
}

- (void)setSelectionScaleFriction:(double)a3
{
  self->_selectionScaleFriction = a3;
}

- (double)selectionAlphaFriction
{
  return self->_selectionAlphaFriction;
}

- (void)setSelectionAlphaFriction:(double)a3
{
  self->_selectionAlphaFriction = a3;
}

- (double)selectionPositionFriction
{
  return self->_selectionPositionFriction;
}

- (void)setSelectionPositionFriction:(double)a3
{
  self->_selectionPositionFriction = a3;
}

- (double)dismissScaleFriction
{
  return self->_dismissScaleFriction;
}

- (void)setDismissScaleFriction:(double)a3
{
  self->_dismissScaleFriction = a3;
}

- (double)dismissAlphaFriction
{
  return self->_dismissAlphaFriction;
}

- (void)setDismissAlphaFriction:(double)a3
{
  self->_dismissAlphaFriction = a3;
}

- (double)dismissPositionFriction
{
  return self->_dismissPositionFriction;
}

- (void)setDismissPositionFriction:(double)a3
{
  self->_dismissPositionFriction = a3;
}

- (BOOL)hapticForCozyUpSelectionEnabled
{
  return self->_hapticForCozyUpSelectionEnabled;
}

- (void)setHapticForCozyUpSelectionEnabled:(BOOL)a3
{
  self->_hapticForCozyUpSelectionEnabled = a3;
}

- (BOOL)cozyUpAnimationEnabled
{
  return self->_cozyUpAnimationEnabled;
}

- (void)setCozyUpAnimationEnabled:(BOOL)a3
{
  self->_cozyUpAnimationEnabled = a3;
}

- (double)cozyUpSelectDurationS
{
  return self->_cozyUpSelectDurationS;
}

- (void)setCozyUpSelectDurationS:(double)a3
{
  self->_cozyUpSelectDurationS = a3;
}

- (BOOL)selectedPulseEnabled
{
  return self->_selectedPulseEnabled;
}

- (void)setSelectedPulseEnabled:(BOOL)a3
{
  self->_selectedPulseEnabled = a3;
}

- (double)selectedPulseScaleAmount
{
  return self->_selectedPulseScaleAmount;
}

- (void)setSelectedPulseScaleAmount:(double)a3
{
  self->_selectedPulseScaleAmount = a3;
}

- (double)selectedPulseDurationS
{
  return self->_selectedPulseDurationS;
}

- (void)setSelectedPulseDurationS:(double)a3
{
  self->_selectedPulseDurationS = a3;
}

@end
