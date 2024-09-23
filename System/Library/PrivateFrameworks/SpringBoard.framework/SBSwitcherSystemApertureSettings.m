@implementation SBSwitcherSystemApertureSettings

- (void)setDefaultValues
{
  SBFFluidBehaviorSettings *zoomToJindoLayoutSettings;
  SBFFluidBehaviorSettings *zoomToJindoLayoutAlternateSettings;
  SBFFluidBehaviorSettings *zoomToJindoPositionSettings;
  SBFFluidBehaviorSettings *zoomToJindoPositionAlternateSettings;
  SBFFluidBehaviorSettings *zoomToJindoCornerRadiusSettings;
  SBFFluidBehaviorSettings *zoomToJindoScaleAndRotateSettings;
  SBFFluidBehaviorSettings *zoomToJindoScaleAndRotateAlternateSettings;
  SBFFluidBehaviorSettings *zoomToJindoBlurAnimationSettings;
  SBFFluidBehaviorSettings *zoomToJindoTopClippingSettings;
  SBFFluidBehaviorSettings *zoomToAndFromJindoMeshSettings;
  SBFFluidBehaviorSettings *zoomFromJindoLayoutSettings;
  SBFFluidBehaviorSettings *zoomFromJindoPositionSettings;
  SBFFluidBehaviorSettings *zoomFromJindoCornerRadiusSettings;
  SBFFluidBehaviorSettings *zoomFromJindoScaleAndRotateSettings;
  SBFFluidBehaviorSettings *zoomFromJindoBlurAnimationSettings;
  objc_super v18;
  CAFrameRateRange v19;
  CAFrameRateRange v20;
  CAFrameRateRange v21;
  CAFrameRateRange v22;
  CAFrameRateRange v23;
  CAFrameRateRange v24;
  CAFrameRateRange v25;
  CAFrameRateRange v26;
  CAFrameRateRange v27;
  CAFrameRateRange v28;
  CAFrameRateRange v29;
  CAFrameRateRange v30;
  CAFrameRateRange v31;
  CAFrameRateRange v32;
  CAFrameRateRange v33;

  v18.receiver = self;
  v18.super_class = (Class)SBSwitcherSystemApertureSettings;
  -[PTSettings setDefaultValues](&v18, sel_setDefaultValues);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoLayoutSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoLayoutSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoLayoutSettings, "setDampingRatio:", 0.912);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoLayoutSettings, "setResponse:", 0.574);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToJindoLayoutSettings, "setRetargetImpulse:", 0.02);
  zoomToJindoLayoutSettings = self->_zoomToJindoLayoutSettings;
  v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoLayoutAlternateSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoLayoutAlternateSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoLayoutAlternateSettings, "setDampingRatio:", 0.912);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoLayoutAlternateSettings, "setResponse:", 0.574);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToJindoLayoutAlternateSettings, "setRetargetImpulse:", 0.02);
  zoomToJindoLayoutAlternateSettings = self->_zoomToJindoLayoutAlternateSettings;
  v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoLayoutAlternateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoPositionSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoPositionSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoPositionSettings, "setDampingRatio:", 0.912);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoPositionSettings, "setResponse:", 0.574);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToJindoPositionSettings, "setRetargetImpulse:", 0.02);
  zoomToJindoPositionSettings = self->_zoomToJindoPositionSettings;
  v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoPositionAlternateSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoPositionAlternateSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoPositionAlternateSettings, "setDampingRatio:", 0.912);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoPositionAlternateSettings, "setResponse:", 0.62);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToJindoPositionAlternateSettings, "setRetargetImpulse:", 0.02);
  zoomToJindoPositionAlternateSettings = self->_zoomToJindoPositionAlternateSettings;
  v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoPositionAlternateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoCornerRadiusSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoCornerRadiusSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoCornerRadiusSettings, "setDampingRatio:", 0.745);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoCornerRadiusSettings, "setResponse:", 0.468);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToJindoCornerRadiusSettings, "setRetargetImpulse:", 0.018);
  zoomToJindoCornerRadiusSettings = self->_zoomToJindoCornerRadiusSettings;
  v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoCornerRadiusSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoScaleAndRotateSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoScaleAndRotateSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoScaleAndRotateSettings, "setDampingRatio:", 0.745);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoScaleAndRotateSettings, "setResponse:", 0.468);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToJindoScaleAndRotateSettings, "setRetargetImpulse:", 0.018);
  zoomToJindoScaleAndRotateSettings = self->_zoomToJindoScaleAndRotateSettings;
  v24 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoScaleAndRotateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v24.minimum, *(double *)&v24.maximum, *(double *)&v24.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoScaleAndRotateAlternateSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoScaleAndRotateAlternateSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoScaleAndRotateAlternateSettings, "setDampingRatio:", 0.745);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoScaleAndRotateAlternateSettings, "setResponse:", 0.3);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToJindoScaleAndRotateAlternateSettings, "setRetargetImpulse:", 0.018);
  zoomToJindoScaleAndRotateAlternateSettings = self->_zoomToJindoScaleAndRotateAlternateSettings;
  v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoScaleAndRotateAlternateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToJindoBlurAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoBlurAnimationSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoBlurAnimationSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoBlurAnimationSettings, "setResponse:", 0.25);
  zoomToJindoBlurAnimationSettings = self->_zoomToJindoBlurAnimationSettings;
  v26 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoBlurAnimationSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v26.minimum, *(double *)&v26.maximum, *(double *)&v26.preferred);
  -[SBFFluidBehaviorSettings setDefaultCriticallyDampedValues](self->_zoomToJindoTopClippingSettings, "setDefaultCriticallyDampedValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToJindoTopClippingSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToJindoTopClippingSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToJindoTopClippingSettings, "setResponse:", 0.2);
  zoomToJindoTopClippingSettings = self->_zoomToJindoTopClippingSettings;
  v27 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoTopClippingSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v27.minimum, *(double *)&v27.maximum, *(double *)&v27.preferred);
  self->_zoomToJindoTargetYDisplacement = 0.68;
  self->_zoomToJindoTargetXDisplacement = 0.5;
  self->_zoomToJindoStraightSwipeScale = 0.27;
  self->_zoomToJindoStraightSwipeAlternateScale = 0.27;
  self->_zoomToJindoArcSwipeScale = 0.24;
  self->_zoomToJindoTuckInThreshold = 0.4;
  self->_zoomToJindoBounceThreshold = 0.4;
  self->_xDeltaToRotationMappingFactor = 0.7;
  self->_zoomToJindoYFromScreenTopToUseAlternateSettings = 48.0;
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomToAndFromJindoMeshSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomToAndFromJindoMeshSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomToAndFromJindoMeshSettings, "setDampingRatio:", 0.912);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomToAndFromJindoMeshSettings, "setResponse:", 0.574);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_zoomToAndFromJindoMeshSettings, "setRetargetImpulse:", 0.02);
  zoomToAndFromJindoMeshSettings = self->_zoomToAndFromJindoMeshSettings;
  v28 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToAndFromJindoMeshSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v28.minimum, *(double *)&v28.maximum, *(double *)&v28.preferred);
  self->_zoomToJindoBeginShowingShadowThreshold = 0.0;
  self->_zoomToJindoEndShowingShadowThreshold = 0.85;
  self->_zoomToFromJindoMaxBlurRadius = 6.0;
  self->_zoomToFromJindoMaxCornerRadius = 160.0;
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomFromJindoLayoutSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomFromJindoLayoutSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomFromJindoLayoutSettings, "setDampingRatio:", 0.919);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomFromJindoLayoutSettings, "setResponse:", 0.444);
  zoomFromJindoLayoutSettings = self->_zoomFromJindoLayoutSettings;
  v29 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v29.minimum, *(double *)&v29.maximum, *(double *)&v29.preferred);
  -[SBFFluidBehaviorSettings setDefaultCriticallyDampedValues](self->_zoomFromJindoPositionSettings, "setDefaultCriticallyDampedValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomFromJindoPositionSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomFromJindoPositionSettings, "setResponse:", 0.3);
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomFromJindoPositionSettings, "setBehaviorType:", 1);
  zoomFromJindoPositionSettings = self->_zoomFromJindoPositionSettings;
  v30 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v30.minimum, *(double *)&v30.maximum, *(double *)&v30.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomFromJindoCornerRadiusSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomFromJindoCornerRadiusSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomFromJindoCornerRadiusSettings, "setDampingRatio:", 0.9);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomFromJindoCornerRadiusSettings, "setResponse:", 0.55);
  zoomFromJindoCornerRadiusSettings = self->_zoomFromJindoCornerRadiusSettings;
  v31 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoCornerRadiusSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v31.minimum, *(double *)&v31.maximum, *(double *)&v31.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomFromJindoScaleAndRotateSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomFromJindoScaleAndRotateSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomFromJindoScaleAndRotateSettings, "setDampingRatio:", 0.82);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomFromJindoScaleAndRotateSettings, "setResponse:", 0.65);
  zoomFromJindoScaleAndRotateSettings = self->_zoomFromJindoScaleAndRotateSettings;
  v32 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoScaleAndRotateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v32.minimum, *(double *)&v32.maximum, *(double *)&v32.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_zoomFromJindoBlurAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_zoomFromJindoBlurAnimationSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_zoomFromJindoBlurAnimationSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_zoomFromJindoBlurAnimationSettings, "setResponse:", 0.45);
  zoomFromJindoBlurAnimationSettings = self->_zoomFromJindoBlurAnimationSettings;
  v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoBlurAnimationSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);
  self->_zoomFromJindoBeginUnblurringProgressThreshold = 0.2;
  self->_zoomFromJindoUnmaskThreshold = 0.3;
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
  _QWORD v66[4];
  _QWORD v67[7];
  _QWORD v68[5];
  _QWORD v69[18];
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v70[0] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Layout Settings"), CFSTR("zoomToJindoLayoutSettings"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v59;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Layout (Alt.) Settings"), CFSTR("zoomToJindoLayoutAlternateSettings"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v57;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Position Settings"), CFSTR("zoomToJindoPositionSettings"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v56;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Position (Alt.) Settings"), CFSTR("zoomToJindoPositionAlternateSettings"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v55;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Corner Radius Settings"), CFSTR("zoomToJindoCornerRadiusSettings"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v54;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Scale Settings"), CFSTR("zoomToJindoScaleAndRotateSettings"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69[5] = v53;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Scale (Alt.) Settings"), CFSTR("zoomToJindoScaleAndRotateAlternateSettings"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v69[6] = v52;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Blur Settings"), CFSTR("zoomToJindoBlurAnimationSettings"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v69[7] = v51;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Top Clipping Settings"), CFSTR("zoomToJindoTopClippingSettings"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v69[8] = v50;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Target Y Displacement"), CFSTR("zoomToJindoTargetYDisplacement"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "between:and:", 0.0, 10.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v69[9] = v48;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Target X Displacement"), CFSTR("zoomToJindoTargetXDisplacement"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "between:and:", 0.0, 10.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v69[10] = v46;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Straight Swipe Scale"), CFSTR("zoomToJindoStraightSwipeScale"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "between:and:", 0.0, 10000.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v69[11] = v44;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Straight Swipe (Alt.) Scale"), CFSTR("zoomToJindoStraightSwipeAlternateScale"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "between:and:", 0.0, 10000.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v69[12] = v42;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Arc Swipe Scale"), CFSTR("zoomToJindoArcSwipeScale"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", 0.0, 10000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v69[13] = v6;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Tuck In Threshold"), CFSTR("zoomToJindoTuckInThreshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[14] = v8;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Bounce Threshold"), CFSTR("zoomToJindoBounceThreshold"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v69[15] = v10;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("xDel to Rotation Map Factor"), CFSTR("xDeltaToRotationMappingFactor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", -3.14159265, 3.14159265);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v69[16] = v12;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Screen Top Padding -> Alt Set."), CFSTR("zoomToJindoYFromScreenTopToUseAlternateSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", -100.0, 500.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v69[17] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "sectionWithRows:title:", v15, CFSTR("Zoom To Jindo"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Mesh Settings"), CFSTR("zoomToAndFromJindoMeshSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v16;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Show Shadow Threshold"), CFSTR("zoomToJindoBeginShowingShadowThreshold"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Hide Shadow Threshold"), CFSTR("zoomToJindoEndShowingShadowThreshold"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v20;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Blur Radius"), CFSTR("zoomToFromJindoMaxBlurRadius"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 300.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v22;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Corner Radius"), CFSTR("zoomToFromJindoMaxCornerRadius"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "between:and:", 0.0, 1000.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68[4] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sectionWithRows:title:", v25, CFSTR("Zoom To/From Jindo"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Layout Settings"), CFSTR("zoomFromJindoLayoutSettings"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v58;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Position Settings"), CFSTR("zoomFromJindoPositionSettings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v27;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Corner Radius Settings"), CFSTR("zoomFromJindoCornerRadiusSettings"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v28;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Scale Settings"), CFSTR("zoomFromJindoScaleAndRotateSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v29;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Blur Settings"), CFSTR("zoomFromJindoBlurAnimationSettings"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v30;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Begin Unblurring Threshold"), CFSTR("_zoomFromJindoBeginUnblurringProgressThreshold"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "between:and:", 0.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v67[5] = v32;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Unmask Card Threshold"), CFSTR("zoomFromJindoUnmaskThreshold"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v67[6] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:title:", v35, CFSTR("Zoom From Jindo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D83070];
  v66[0] = v64;
  v66[1] = v63;
  v66[2] = v61;
  v66[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "moduleWithTitle:contents:", CFSTR("System Aperture Switcher Behaviors"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (SBFFluidBehaviorSettings)zoomToJindoLayoutSettings
{
  return self->_zoomToJindoLayoutSettings;
}

- (void)setZoomToJindoLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoLayoutSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoLayoutAlternateSettings
{
  return self->_zoomToJindoLayoutAlternateSettings;
}

- (void)setZoomToJindoLayoutAlternateSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoLayoutAlternateSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoPositionSettings
{
  return self->_zoomToJindoPositionSettings;
}

- (void)setZoomToJindoPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoPositionAlternateSettings
{
  return self->_zoomToJindoPositionAlternateSettings;
}

- (void)setZoomToJindoPositionAlternateSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoPositionAlternateSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoCornerRadiusSettings
{
  return self->_zoomToJindoCornerRadiusSettings;
}

- (void)setZoomToJindoCornerRadiusSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoCornerRadiusSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoScaleAndRotateSettings
{
  return self->_zoomToJindoScaleAndRotateSettings;
}

- (void)setZoomToJindoScaleAndRotateSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoScaleAndRotateSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoScaleAndRotateAlternateSettings
{
  return self->_zoomToJindoScaleAndRotateAlternateSettings;
}

- (void)setZoomToJindoScaleAndRotateAlternateSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoScaleAndRotateAlternateSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoBlurAnimationSettings
{
  return self->_zoomToJindoBlurAnimationSettings;
}

- (void)setZoomToJindoBlurAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoBlurAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomToJindoTopClippingSettings
{
  return self->_zoomToJindoTopClippingSettings;
}

- (void)setZoomToJindoTopClippingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToJindoTopClippingSettings, a3);
}

- (double)zoomToJindoTargetYDisplacement
{
  return self->_zoomToJindoTargetYDisplacement;
}

- (void)setZoomToJindoTargetYDisplacement:(double)a3
{
  self->_zoomToJindoTargetYDisplacement = a3;
}

- (double)zoomToJindoTargetXDisplacement
{
  return self->_zoomToJindoTargetXDisplacement;
}

- (void)setZoomToJindoTargetXDisplacement:(double)a3
{
  self->_zoomToJindoTargetXDisplacement = a3;
}

- (double)zoomToJindoStraightSwipeScale
{
  return self->_zoomToJindoStraightSwipeScale;
}

- (void)setZoomToJindoStraightSwipeScale:(double)a3
{
  self->_zoomToJindoStraightSwipeScale = a3;
}

- (double)zoomToJindoStraightSwipeAlternateScale
{
  return self->_zoomToJindoStraightSwipeAlternateScale;
}

- (void)setZoomToJindoStraightSwipeAlternateScale:(double)a3
{
  self->_zoomToJindoStraightSwipeAlternateScale = a3;
}

- (double)zoomToJindoArcSwipeScale
{
  return self->_zoomToJindoArcSwipeScale;
}

- (void)setZoomToJindoArcSwipeScale:(double)a3
{
  self->_zoomToJindoArcSwipeScale = a3;
}

- (double)zoomToJindoTuckInThreshold
{
  return self->_zoomToJindoTuckInThreshold;
}

- (void)setZoomToJindoTuckInThreshold:(double)a3
{
  self->_zoomToJindoTuckInThreshold = a3;
}

- (double)zoomToJindoBounceThreshold
{
  return self->_zoomToJindoBounceThreshold;
}

- (void)setZoomToJindoBounceThreshold:(double)a3
{
  self->_zoomToJindoBounceThreshold = a3;
}

- (double)xDeltaToRotationMappingFactor
{
  return self->_xDeltaToRotationMappingFactor;
}

- (void)setXDeltaToRotationMappingFactor:(double)a3
{
  self->_xDeltaToRotationMappingFactor = a3;
}

- (double)zoomToJindoYFromScreenTopToUseAlternateSettings
{
  return self->_zoomToJindoYFromScreenTopToUseAlternateSettings;
}

- (void)setZoomToJindoYFromScreenTopToUseAlternateSettings:(double)a3
{
  self->_zoomToJindoYFromScreenTopToUseAlternateSettings = a3;
}

- (SBFFluidBehaviorSettings)zoomToAndFromJindoMeshSettings
{
  return self->_zoomToAndFromJindoMeshSettings;
}

- (void)setZoomToAndFromJindoMeshSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToAndFromJindoMeshSettings, a3);
}

- (double)zoomToJindoBeginShowingShadowThreshold
{
  return self->_zoomToJindoBeginShowingShadowThreshold;
}

- (void)setZoomToJindoBeginShowingShadowThreshold:(double)a3
{
  self->_zoomToJindoBeginShowingShadowThreshold = a3;
}

- (double)zoomToJindoEndShowingShadowThreshold
{
  return self->_zoomToJindoEndShowingShadowThreshold;
}

- (void)setZoomToJindoEndShowingShadowThreshold:(double)a3
{
  self->_zoomToJindoEndShowingShadowThreshold = a3;
}

- (double)zoomToFromJindoMaxBlurRadius
{
  return self->_zoomToFromJindoMaxBlurRadius;
}

- (void)setZoomToFromJindoMaxBlurRadius:(double)a3
{
  self->_zoomToFromJindoMaxBlurRadius = a3;
}

- (double)zoomToFromJindoMaxCornerRadius
{
  return self->_zoomToFromJindoMaxCornerRadius;
}

- (void)setZoomToFromJindoMaxCornerRadius:(double)a3
{
  self->_zoomToFromJindoMaxCornerRadius = a3;
}

- (SBFFluidBehaviorSettings)zoomFromJindoLayoutSettings
{
  return self->_zoomFromJindoLayoutSettings;
}

- (void)setZoomFromJindoLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomFromJindoLayoutSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomFromJindoPositionSettings
{
  return self->_zoomFromJindoPositionSettings;
}

- (void)setZoomFromJindoPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomFromJindoPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomFromJindoCornerRadiusSettings
{
  return self->_zoomFromJindoCornerRadiusSettings;
}

- (void)setZoomFromJindoCornerRadiusSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomFromJindoCornerRadiusSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomFromJindoScaleAndRotateSettings
{
  return self->_zoomFromJindoScaleAndRotateSettings;
}

- (void)setZoomFromJindoScaleAndRotateSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomFromJindoScaleAndRotateSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomFromJindoBlurAnimationSettings
{
  return self->_zoomFromJindoBlurAnimationSettings;
}

- (void)setZoomFromJindoBlurAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomFromJindoBlurAnimationSettings, a3);
}

- (double)zoomFromJindoBeginUnblurringProgressThreshold
{
  return self->_zoomFromJindoBeginUnblurringProgressThreshold;
}

- (void)setZoomFromJindoBeginUnblurringProgressThreshold:(double)a3
{
  self->_zoomFromJindoBeginUnblurringProgressThreshold = a3;
}

- (double)zoomFromJindoUnmaskThreshold
{
  return self->_zoomFromJindoUnmaskThreshold;
}

- (void)setZoomFromJindoUnmaskThreshold:(double)a3
{
  self->_zoomFromJindoUnmaskThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomFromJindoBlurAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoScaleAndRotateSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoPositionSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoLayoutSettings, 0);
  objc_storeStrong((id *)&self->_zoomToAndFromJindoMeshSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoTopClippingSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoBlurAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoScaleAndRotateAlternateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoScaleAndRotateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoPositionAlternateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoPositionSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoLayoutAlternateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoLayoutSettings, 0);
}

@end
