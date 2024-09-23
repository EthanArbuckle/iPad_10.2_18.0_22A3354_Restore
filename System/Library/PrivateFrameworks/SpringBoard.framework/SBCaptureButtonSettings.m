@implementation SBCaptureButtonSettings

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
  objc_super v53;
  CAFrameRateRange v54;
  CAFrameRateRange v55;
  CAFrameRateRange v56;
  CAFrameRateRange v57;
  CAFrameRateRange v58;
  CAFrameRateRange v59;
  CAFrameRateRange v60;
  CAFrameRateRange v61;
  CAFrameRateRange v62;

  v53.receiver = self;
  v53.super_class = (Class)SBCaptureButtonSettings;
  -[PTSettings setDefaultValues](&v53, sel_setDefaultValues);
  -[SBCaptureButtonSettings setLaunchAfterButtonUpGracePeriod:](self, "setLaunchAfterButtonUpGracePeriod:", 0.65);
  -[SBCaptureButtonSettings setIgnoreFaceDownAfterDuration:](self, "setIgnoreFaceDownAfterDuration:", 1.0);
  -[SBCaptureButtonSettings setDirectLaunchAfterUnsuppressGracePeriod:](self, "setDirectLaunchAfterUnsuppressGracePeriod:", 2.0);
  -[SBCaptureButtonSettings setPreludeDropletRadius:](self, "setPreludeDropletRadius:", 8.33333333);
  -[SBCaptureButtonSettings setPreludeCornerRadius:](self, "setPreludeCornerRadius:", 33.3333333);
  -[SBCaptureButtonSettings setPreludeScreenEdgeInset:](self, "setPreludeScreenEdgeInset:", 13.3333333);
  -[SBCaptureButtonSettings preludePresentationTranslationSettings](self, "preludePresentationTranslationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBCaptureButtonSettings preludePresentationTranslationSettings](self, "preludePresentationTranslationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings preludePresentationTranslationSettings](self, "preludePresentationTranslationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonSettings _configureSettings:withDamping:mass:stiffness:](self, "_configureSettings:withDamping:mass:stiffness:", v5, 50.0, 2.0, 300.0);

  -[SBCaptureButtonSettings preludePresentationTranslationSettings](self, "preludePresentationTranslationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", CFSTR("Launch Droplet Presentation"));

  -[SBCaptureButtonSettings preludePresentationTranslationSettings](self, "preludePresentationTranslationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v7, "setFrameRateRange:highFrameRateReason:", 1114147, *(double *)&v54.minimum, *(double *)&v54.maximum, *(double *)&v54.preferred);

  -[SBCaptureButtonSettings setEnableZoomUpBlur:](self, "setEnableZoomUpBlur:", 1);
  -[SBCaptureButtonSettings setZoomUpDropletRadius:](self, "setZoomUpDropletRadius:", 0.0);
  -[SBCaptureButtonSettings setDisableDropletEffectDelay:](self, "setDisableDropletEffectDelay:", 0.1);
  -[SBCaptureButtonSettings setZoomUpScaleDelay:](self, "setZoomUpScaleDelay:", 0.01);
  -[SBCaptureButtonSettings setZoomUpYDelay:](self, "setZoomUpYDelay:", 0.04);
  -[SBCaptureButtonSettings zoomUpPositionXSettings](self, "zoomUpPositionXSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultValues");

  -[SBCaptureButtonSettings zoomUpPositionXSettings](self, "zoomUpPositionXSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings zoomUpPositionXSettings](self, "zoomUpPositionXSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResponse:", 0.392);

  -[SBCaptureButtonSettings zoomUpPositionXSettings](self, "zoomUpPositionXSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDampingRatio:", 0.8);

  -[SBCaptureButtonSettings zoomUpPositionXSettings](self, "zoomUpPositionXSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRetargetImpulse:", 0.012);

  -[SBCaptureButtonSettings zoomUpPositionXSettings](self, "zoomUpPositionXSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", CFSTR("Droplet Zoom Up Position X"));

  -[SBCaptureButtonSettings zoomUpPositionXSettings](self, "zoomUpPositionXSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v55.minimum, *(double *)&v55.maximum, *(double *)&v55.preferred);

  -[SBCaptureButtonSettings zoomUpPositionYSettings](self, "zoomUpPositionYSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDefaultValues");

  -[SBCaptureButtonSettings zoomUpPositionYSettings](self, "zoomUpPositionYSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings zoomUpPositionYSettings](self, "zoomUpPositionYSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setResponse:", 0.424);

  -[SBCaptureButtonSettings zoomUpPositionYSettings](self, "zoomUpPositionYSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDampingRatio:", 1.1);

  -[SBCaptureButtonSettings zoomUpPositionYSettings](self, "zoomUpPositionYSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setName:", CFSTR("Droplet Zoom Up Position Y"));

  -[SBCaptureButtonSettings zoomUpPositionYSettings](self, "zoomUpPositionYSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v20, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v56.minimum, *(double *)&v56.maximum, *(double *)&v56.preferred);

  -[SBCaptureButtonSettings zoomUpScaleSettings](self, "zoomUpScaleSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDefaultValues");

  -[SBCaptureButtonSettings zoomUpScaleSettings](self, "zoomUpScaleSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings zoomUpScaleSettings](self, "zoomUpScaleSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setResponse:", 0.5);

  -[SBCaptureButtonSettings zoomUpScaleSettings](self, "zoomUpScaleSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDampingRatio:", 1.2);

  -[SBCaptureButtonSettings zoomUpScaleSettings](self, "zoomUpScaleSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setName:", CFSTR("Droplet Zoom Up Scale"));

  -[SBCaptureButtonSettings zoomUpScaleSettings](self, "zoomUpScaleSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v26, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v57.minimum, *(double *)&v57.maximum, *(double *)&v57.preferred);

  -[SBCaptureButtonSettings zoomUpCornerRadiusSettings](self, "zoomUpCornerRadiusSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDefaultValues");

  -[SBCaptureButtonSettings zoomUpCornerRadiusSettings](self, "zoomUpCornerRadiusSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings zoomUpCornerRadiusSettings](self, "zoomUpCornerRadiusSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonSettings _configureSettings:withDamping:mass:stiffness:](self, "_configureSettings:withDamping:mass:stiffness:", v29, 36.0328, 1.0, 324.591);

  -[SBCaptureButtonSettings zoomUpCornerRadiusSettings](self, "zoomUpCornerRadiusSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setName:", CFSTR("Droplet Zoom Up Corner Radius"));

  -[SBCaptureButtonSettings zoomUpCornerRadiusSettings](self, "zoomUpCornerRadiusSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v31, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v58.minimum, *(double *)&v58.maximum, *(double *)&v58.preferred);

  -[SBCaptureButtonSettings zoomUpDropletRadiusAnimationSettings](self, "zoomUpDropletRadiusAnimationSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDefaultValues");

  -[SBCaptureButtonSettings zoomUpDropletRadiusAnimationSettings](self, "zoomUpDropletRadiusAnimationSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings zoomUpDropletRadiusAnimationSettings](self, "zoomUpDropletRadiusAnimationSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonSettings _configureSettings:withDamping:mass:stiffness:](self, "_configureSettings:withDamping:mass:stiffness:", v34, 50.0, 2.0, 300.0);

  -[SBCaptureButtonSettings zoomUpDropletRadiusAnimationSettings](self, "zoomUpDropletRadiusAnimationSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setName:", CFSTR("Droplet Zoom Up Droplet Radius"));

  -[SBCaptureButtonSettings zoomUpDropletRadiusAnimationSettings](self, "zoomUpDropletRadiusAnimationSettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v36, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v59.minimum, *(double *)&v59.maximum, *(double *)&v59.preferred);

  -[SBCaptureButtonSettings zoomUpBackgroundDimAnimationSettings](self, "zoomUpBackgroundDimAnimationSettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDefaultValues");

  -[SBCaptureButtonSettings zoomUpBackgroundDimAnimationSettings](self, "zoomUpBackgroundDimAnimationSettings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings zoomUpBackgroundDimAnimationSettings](self, "zoomUpBackgroundDimAnimationSettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setResponse:", 0.28);

  -[SBCaptureButtonSettings zoomUpBackgroundDimAnimationSettings](self, "zoomUpBackgroundDimAnimationSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDampingRatio:", 1.0);

  -[SBCaptureButtonSettings zoomUpBackgroundDimAnimationSettings](self, "zoomUpBackgroundDimAnimationSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setName:", CFSTR("Droplet Zoom Up Background Dim"));

  -[SBCaptureButtonSettings zoomUpBackgroundDimAnimationSettings](self, "zoomUpBackgroundDimAnimationSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v42, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v60.minimum, *(double *)&v60.maximum, *(double *)&v60.preferred);

  -[SBCaptureButtonSettings setDosidoTargetScale:](self, "setDosidoTargetScale:", 0.5);
  -[SBCaptureButtonSettings dosidoLayoutAndPositionSettings](self, "dosidoLayoutAndPositionSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setDefaultValues");

  -[SBCaptureButtonSettings dosidoLayoutAndPositionSettings](self, "dosidoLayoutAndPositionSettings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings dosidoLayoutAndPositionSettings](self, "dosidoLayoutAndPositionSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonSettings _configureSettings:withDamping:mass:stiffness:](self, "_configureSettings:withDamping:mass:stiffness:", v45, 50.0, 2.0, 300.0);

  -[SBCaptureButtonSettings dosidoLayoutAndPositionSettings](self, "dosidoLayoutAndPositionSettings");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setName:", CFSTR("Droplet Do-si-do Layout and Position"));

  -[SBCaptureButtonSettings dosidoLayoutAndPositionSettings](self, "dosidoLayoutAndPositionSettings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v47, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v61.minimum, *(double *)&v61.maximum, *(double *)&v61.preferred);

  -[SBCaptureButtonSettings dosidoScaleSettings](self, "dosidoScaleSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDefaultValues");

  -[SBCaptureButtonSettings dosidoScaleSettings](self, "dosidoScaleSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setBehaviorType:", 1);

  -[SBCaptureButtonSettings dosidoScaleSettings](self, "dosidoScaleSettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonSettings _configureSettings:withDamping:mass:stiffness:](self, "_configureSettings:withDamping:mass:stiffness:", v50, 50.0, 2.0, 300.0);

  -[SBCaptureButtonSettings dosidoScaleSettings](self, "dosidoScaleSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setName:", CFSTR("Droplet Do-si-do Scale"));

  -[SBCaptureButtonSettings dosidoScaleSettings](self, "dosidoScaleSettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v52, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v62.minimum, *(double *)&v62.maximum, *(double *)&v62.preferred);

  -[SBCaptureButtonSettings setZoomUpBlurStartProgress:](self, "setZoomUpBlurStartProgress:", 0.3);
  -[SBCaptureButtonSettings setZoomUpBackgroundDimStartProgress:](self, "setZoomUpBackgroundDimStartProgress:", 0.89);
  -[SBCaptureButtonSettings setDosidoUsesHomeScreenBlur:](self, "setDosidoUsesHomeScreenBlur:", 1);
  -[SBCaptureButtonSettings setEnablesStationaryDetectionForUnlocked:](self, "setEnablesStationaryDetectionForUnlocked:", 1);
  -[SBCaptureButtonSettings setAccidentalPreventionStationaryThreshold:](self, "setAccidentalPreventionStationaryThreshold:", 0.1);
  -[SBCaptureButtonSettings setAccidentalPreventionPickUpBuffer:](self, "setAccidentalPreventionPickUpBuffer:", 0.2);
  -[SBCaptureButtonSettings setCoachingUIPresentationAllowedTimeframe:](self, "setCoachingUIPresentationAllowedTimeframe:", 5.0);
  -[SBCaptureButtonSettings setCoachingUIDismissalInterval:](self, "setCoachingUIDismissalInterval:", 3.0);
  -[SBCaptureButtonSettings setStationaryDetectionDebounceInterval:](self, "setStationaryDetectionDebounceInterval:", 4.0);
}

- (void)_configureSettings:(id)a3 withDamping:(double)a4 mass:(double)a5 stiffness:(double)a6
{
  id v6;

  v6 = a3;
  convertDampingMassAndStiffnessToDampingRatioAndResponse();
  objc_msgSend(v6, "setDampingRatio:", 0.0);
  objc_msgSend(v6, "setResponse:", 0.0);

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
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
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
  _QWORD v142[15];
  _QWORD v143[2];
  _QWORD v144[4];
  _QWORD v145[4];
  _QWORD v146[13];
  _QWORD v147[4];
  _QWORD v148[5];

  v148[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Grace period (sec) after release"), CFSTR("launchAfterButtonUpGracePeriod"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "between:and:", 0.0, 5.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "precision:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Time to honor face down (sec)"), CFSTR("ignoreFaceDownAfterDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = v5;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Directly Launch after Unsuppress (sec)"), CFSTR("directLaunchAfterUnsuppressGracePeriod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v148[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "sectionWithRows:title:", v9, CFSTR("Launch Behavior (VO leniency)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Prelude Droplet Radius"), CFSTR("preludeDropletRadius"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "between:and:", 0.0, 100.0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "precision:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v12;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Prelude Corner Radius"), CFSTR("preludeCornerRadius"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 200.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "precision:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v15;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Prelude Droplet Screen Edge Inset"), CFSTR("preludeScreenEdgeInset"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 200.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v147[2] = v18;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Prelude Presentation Animation"), CFSTR("preludePresentationTranslationSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v147[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v20, CFSTR("Launch Prelude (initial droplet)"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addObject:", v21);

  v114 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Up Scale Delay"), CFSTR("zoomUpScaleDelay"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "between:and:", 0.0, 1.0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "precision:", 3);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v129;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Up Y Delay"), CFSTR("zoomUpYDelay"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "between:and:", 0.0, 1.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "precision:", 3);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v122;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Up Droplet Radius"), CFSTR("zoomUpDropletRadius"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "between:and:", 0.0, 100.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "precision:", 2);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v116;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Disable Droplet Delay"), CFSTR("disableDropletEffectDelay"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "between:and:", 0.0, 1.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "precision:", 2);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v146[3] = v108;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Position X"), CFSTR("zoomUpPositionXSettings"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v146[4] = v106;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Position Y"), CFSTR("zoomUpPositionYSettings"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v146[5] = v104;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Scale"), CFSTR("zoomUpScaleSettings"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v146[6] = v102;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Corner Radius"), CFSTR("zoomUpCornerRadiusSettings"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v146[7] = v100;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Droplet Radius"), CFSTR("zoomUpDropletRadiusAnimationSettings"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v146[8] = v98;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Background Dim"), CFSTR("zoomUpBackgroundDimAnimationSettings"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v146[9] = v96;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Zoom Up Blur"), CFSTR("enableZoomUpBlur"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v146[10] = v22;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Start Blur Progress"), CFSTR("zoomUpBlurStartProgress"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "between:and:", 0.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "precision:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "conditionFormat:", CFSTR("enableZoomUpBlur != 0"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v146[11] = v26;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Start Background Dim Progress"), CFSTR("zoomUpBackgroundDimStartProgress"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "between:and:", 0.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "precision:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v146[12] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "sectionWithRows:title:", v30, CFSTR("Launch Zoom Up"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addObject:", v31);

  v32 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Do-si-do target scale"), CFSTR("dosidoTargetScale"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "precision:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v35;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Do-si-do Translation Animation"), CFSTR("dosidoLayoutAndPositionSettings"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v36;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Do-si-do Scale Animation"), CFSTR("dosidoScaleSettings"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v37;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Do-si-do Uses Home Screen Blur"), CFSTR("dosidoUsesHomeScreenBlur"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v145[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sectionWithRows:title:", v39, CFSTR("Launch Do-si-do"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addObject:", v40);

  v41 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable when UI Unlocked"), CFSTR("enablesStationaryDetectionForUnlocked"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v139;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Stationary threshold (seconds)"), CFSTR("accidentalPreventionStationaryThreshold"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "between:and:", 0.0, 60.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "precision:", 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v43;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Pick up buffer (seconds)"), CFSTR("accidentalPreventionPickUpBuffer"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "between:and:", 0.0, 4.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "precision:", 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v46;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Stationary detection debounce (sec)"), CFSTR("stationaryDetectionDebounceInterval"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "between:and:", 0.0, 60.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "precision:", 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v144[3] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sectionWithRows:title:", v50, CFSTR("Device Stationary Detection"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addObject:", v51);

  v52 = (void *)MEMORY[0x1E0D83070];
  v53 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_coachingUIPresentationAllowedTimeframe);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Coaching UI Allowed Timeframe"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "between:and:", 0.0, 10.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "precision:", 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v57;
  v58 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_coachingUIDismissalInterval);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rowWithTitle:valueKeyPath:", CFSTR("Coaching UI Dismissal Interval"), v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "between:and:", 0.0, 10.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "precision:", 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sectionWithRows:title:", v63, CFSTR("Coaching UI"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addObject:", v64);

  v65 = (void *)MEMORY[0x1E0D83070];
  v66 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:action:", CFSTR("Restore Defaults"), v140);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v135;
  v67 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:action:", CFSTR("Restore Defaults"), v130);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v127;
  v68 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rowWithTitle:action:", CFSTR("Restore Defaults"), v125);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v123;
  v69 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowWithTitle:action:", CFSTR("Restore Defaults"), v121);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v142[3] = v119;
  v70 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rowWithTitle:action:", CFSTR("Restore Defaults"), v117);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v142[4] = v115;
  v71 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "rowWithTitle:action:", CFSTR("Restore Defaults"), v113);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v142[5] = v111;
  v72 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:action:", CFSTR("Restore Defaults"), v109);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v142[6] = v107;
  v73 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:action:", CFSTR("Restore Defaults"), v105);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v142[7] = v103;
  v74 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rowWithTitle:action:", CFSTR("Restore Defaults"), v101);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v142[8] = v99;
  v75 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rowWithTitle:action:", CFSTR("Restore Defaults"), v97);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v142[9] = v95;
  v76 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "rowWithTitle:action:", CFSTR("Restore Defaults"), v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v142[10] = v93;
  v77 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "rowWithTitle:action:", CFSTR("Restore Defaults"), v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v142[11] = v79;
  v80 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "rowWithTitle:action:", CFSTR("Restore Defaults"), v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v142[12] = v82;
  v83 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "rowWithTitle:action:", CFSTR("Restore Defaults"), v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v142[13] = v85;
  v86 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:action:", CFSTR("Restore Defaults"), v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v142[14] = v88;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 15);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sectionWithRows:title:", v89, CFSTR("Reset"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addObject:", v90);

  objc_msgSend(MEMORY[0x1E0D83070], "moduleWithTitle:contents:", CFSTR("Camera Capture Button"), v141);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  return v91;
}

- (double)launchAfterButtonUpGracePeriod
{
  return self->_launchAfterButtonUpGracePeriod;
}

- (void)setLaunchAfterButtonUpGracePeriod:(double)a3
{
  self->_launchAfterButtonUpGracePeriod = a3;
}

- (double)ignoreFaceDownAfterDuration
{
  return self->_ignoreFaceDownAfterDuration;
}

- (void)setIgnoreFaceDownAfterDuration:(double)a3
{
  self->_ignoreFaceDownAfterDuration = a3;
}

- (double)directLaunchAfterUnsuppressGracePeriod
{
  return self->_directLaunchAfterUnsuppressGracePeriod;
}

- (void)setDirectLaunchAfterUnsuppressGracePeriod:(double)a3
{
  self->_directLaunchAfterUnsuppressGracePeriod = a3;
}

- (double)preludeDropletRadius
{
  return self->_preludeDropletRadius;
}

- (void)setPreludeDropletRadius:(double)a3
{
  self->_preludeDropletRadius = a3;
}

- (double)preludeCornerRadius
{
  return self->_preludeCornerRadius;
}

- (void)setPreludeCornerRadius:(double)a3
{
  self->_preludeCornerRadius = a3;
}

- (double)preludeScreenEdgeInset
{
  return self->_preludeScreenEdgeInset;
}

- (void)setPreludeScreenEdgeInset:(double)a3
{
  self->_preludeScreenEdgeInset = a3;
}

- (SBFFluidBehaviorSettings)preludePresentationTranslationSettings
{
  return self->_preludePresentationTranslationSettings;
}

- (void)setPreludePresentationTranslationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_preludePresentationTranslationSettings, a3);
}

- (double)zoomUpDropletRadius
{
  return self->_zoomUpDropletRadius;
}

- (void)setZoomUpDropletRadius:(double)a3
{
  self->_zoomUpDropletRadius = a3;
}

- (double)disableDropletEffectDelay
{
  return self->_disableDropletEffectDelay;
}

- (void)setDisableDropletEffectDelay:(double)a3
{
  self->_disableDropletEffectDelay = a3;
}

- (double)zoomUpScaleDelay
{
  return self->_zoomUpScaleDelay;
}

- (void)setZoomUpScaleDelay:(double)a3
{
  self->_zoomUpScaleDelay = a3;
}

- (double)zoomUpYDelay
{
  return self->_zoomUpYDelay;
}

- (void)setZoomUpYDelay:(double)a3
{
  self->_zoomUpYDelay = a3;
}

- (SBFFluidBehaviorSettings)zoomUpPositionXSettings
{
  return self->_zoomUpPositionXSettings;
}

- (void)setZoomUpPositionXSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomUpPositionXSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomUpPositionYSettings
{
  return self->_zoomUpPositionYSettings;
}

- (void)setZoomUpPositionYSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomUpPositionYSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomUpScaleSettings
{
  return self->_zoomUpScaleSettings;
}

- (void)setZoomUpScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomUpScaleSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomUpCornerRadiusSettings
{
  return self->_zoomUpCornerRadiusSettings;
}

- (void)setZoomUpCornerRadiusSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomUpCornerRadiusSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomUpDropletRadiusAnimationSettings
{
  return self->_zoomUpDropletRadiusAnimationSettings;
}

- (void)setZoomUpDropletRadiusAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomUpDropletRadiusAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomUpBackgroundDimAnimationSettings
{
  return self->_zoomUpBackgroundDimAnimationSettings;
}

- (void)setZoomUpBackgroundDimAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomUpBackgroundDimAnimationSettings, a3);
}

- (BOOL)enableZoomUpBlur
{
  return self->_enableZoomUpBlur;
}

- (void)setEnableZoomUpBlur:(BOOL)a3
{
  self->_enableZoomUpBlur = a3;
}

- (double)zoomUpBlurStartProgress
{
  return self->_zoomUpBlurStartProgress;
}

- (void)setZoomUpBlurStartProgress:(double)a3
{
  self->_zoomUpBlurStartProgress = a3;
}

- (double)zoomUpBackgroundDimStartProgress
{
  return self->_zoomUpBackgroundDimStartProgress;
}

- (void)setZoomUpBackgroundDimStartProgress:(double)a3
{
  self->_zoomUpBackgroundDimStartProgress = a3;
}

- (double)dosidoTargetScale
{
  return self->_dosidoTargetScale;
}

- (void)setDosidoTargetScale:(double)a3
{
  self->_dosidoTargetScale = a3;
}

- (SBFFluidBehaviorSettings)dosidoLayoutAndPositionSettings
{
  return self->_dosidoLayoutAndPositionSettings;
}

- (void)setDosidoLayoutAndPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoLayoutAndPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)dosidoScaleSettings
{
  return self->_dosidoScaleSettings;
}

- (void)setDosidoScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoScaleSettings, a3);
}

- (BOOL)dosidoUsesHomeScreenBlur
{
  return self->_dosidoUsesHomeScreenBlur;
}

- (void)setDosidoUsesHomeScreenBlur:(BOOL)a3
{
  self->_dosidoUsesHomeScreenBlur = a3;
}

- (BOOL)enablesStationaryDetectionForUnlocked
{
  return self->_enablesStationaryDetectionForUnlocked;
}

- (void)setEnablesStationaryDetectionForUnlocked:(BOOL)a3
{
  self->_enablesStationaryDetectionForUnlocked = a3;
}

- (double)accidentalPreventionStationaryThreshold
{
  return self->_accidentalPreventionStationaryThreshold;
}

- (void)setAccidentalPreventionStationaryThreshold:(double)a3
{
  self->_accidentalPreventionStationaryThreshold = a3;
}

- (double)accidentalPreventionPickUpBuffer
{
  return self->_accidentalPreventionPickUpBuffer;
}

- (void)setAccidentalPreventionPickUpBuffer:(double)a3
{
  self->_accidentalPreventionPickUpBuffer = a3;
}

- (double)coachingUIPresentationAllowedTimeframe
{
  return self->_coachingUIPresentationAllowedTimeframe;
}

- (void)setCoachingUIPresentationAllowedTimeframe:(double)a3
{
  self->_coachingUIPresentationAllowedTimeframe = a3;
}

- (double)coachingUIDismissalInterval
{
  return self->_coachingUIDismissalInterval;
}

- (void)setCoachingUIDismissalInterval:(double)a3
{
  self->_coachingUIDismissalInterval = a3;
}

- (double)stationaryDetectionDebounceInterval
{
  return self->_stationaryDetectionDebounceInterval;
}

- (void)setStationaryDetectionDebounceInterval:(double)a3
{
  self->_stationaryDetectionDebounceInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dosidoScaleSettings, 0);
  objc_storeStrong((id *)&self->_dosidoLayoutAndPositionSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpBackgroundDimAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpDropletRadiusAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpScaleSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpPositionYSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpPositionXSettings, 0);
  objc_storeStrong((id *)&self->_preludePresentationTranslationSettings, 0);
}

@end
