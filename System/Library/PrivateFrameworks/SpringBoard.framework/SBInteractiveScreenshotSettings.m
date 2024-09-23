@implementation SBInteractiveScreenshotSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBInteractiveScreenshotSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBInteractiveScreenshotSettings setEnabled:](self, "setEnabled:", 1);
  -[SBInteractiveScreenshotSettings setShouldPreheat:](self, "setShouldPreheat:", 1);
  -[SBInteractiveScreenshotSettings setShouldAsynchronouslyRender:](self, "setShouldAsynchronouslyRender:", 1);
  -[SBInteractiveScreenshotSettings setCornerRadiusVisibleProgressThreshold:](self, "setCornerRadiusVisibleProgressThreshold:", 0.7);
  -[SBInteractiveScreenshotSettings setApplicationTouchDelayHysteresis:](self, "setApplicationTouchDelayHysteresis:", 0.25);
  -[SBInteractiveScreenshotSettings setRubberbandingRange:](self, "setRubberbandingRange:", 0.6);
  -[SBInteractiveScreenshotSettings setNormalizedDistanceForCommitThreshold:](self, "setNormalizedDistanceForCommitThreshold:", 0.1);
  -[SBInteractiveScreenshotSettings setProjectionDecelerationRate:](self, "setProjectionDecelerationRate:", 0.995);
  -[SBInteractiveScreenshotSettings setHorizontalTranslationFactor:](self, "setHorizontalTranslationFactor:", 0.0);
  -[SBInteractiveScreenshotSettings setVerticalTranslationFactor:](self, "setVerticalTranslationFactor:", 0.05);
  -[SBInteractiveScreenshotSettings setBaseCornerTranslationDegrees:](self, "setBaseCornerTranslationDegrees:", 20.0);
  -[SBInteractiveScreenshotSettings setCropCornersVisibleProgressThreshold:](self, "setCropCornersVisibleProgressThreshold:", 0.4);
  -[SBInteractiveScreenshotSettings setCropLinesVisibleProgressThreshold:](self, "setCropLinesVisibleProgressThreshold:", 0.9);
  -[SBInteractiveScreenshotSettings setDisabledGestureCancellationDistance:](self, "setDisabledGestureCancellationDistance:", 100.0);
  -[SBInteractiveScreenshotSettings setShouldInjectVelocity:](self, "setShouldInjectVelocity:", 1);
  -[SBInteractiveScreenshotSettings setMaximumInjectedVelocity:](self, "setMaximumInjectedVelocity:", 32.0);
  -[SBInteractiveScreenshotSettings setDisabledGestureVelocityScale:](self, "setDisabledGestureVelocityScale:", 0.25);
  -[SBCornerPencilPanGestureSettings setDefaultValues](self->_pencilGestureSettings, "setDefaultValues");
  -[SBCornerFingerPanGestureSettings setDefaultValues](self->_fingerGestureSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDefaultValues](self->_contentAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_contentAnimationSettings, "setDampingRatio:", 0.845);
  -[SBFFluidBehaviorSettings setResponse:](self->_contentAnimationSettings, "setResponse:", 0.48);
  -[SBFFluidBehaviorSettings setTrackingDampingRatio:](self->_contentAnimationSettings, "setTrackingDampingRatio:", 0.86);
  -[SBFFluidBehaviorSettings setTrackingResponse:](self->_contentAnimationSettings, "setTrackingResponse:", 0.1);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_disabledGestureContentAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_disabledGestureContentAnimationSettings, "setDampingRatio:", 0.475);
  -[SBFFluidBehaviorSettings setResponse:](self->_disabledGestureContentAnimationSettings, "setResponse:", 0.3);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_cropsAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_cropsAnimationSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_cropsAnimationSettings, "setResponse:", 0.55);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_cropLinesAlphaAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_cropLinesAlphaAnimationSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_cropLinesAlphaAnimationSettings, "setResponse:", 0.17);
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
  _QWORD v74[6];
  _QWORD v75[4];
  _QWORD v76[13];
  _QWORD v77[4];
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v78[0] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), CFSTR("enabled"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Preheat Screenshot Infrastructure"), CFSTR("shouldPreheat"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Asynchronously Render Apps"), CFSTR("shouldAsynchronouslyRender"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Application Touch Delay Hysteresis"), CFSTR("applicationTouchDelayHysteresis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83070];
  v77[0] = v64;
  v77[1] = v63;
  v77[2] = v62;
  v77[3] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v9, CFSTR("General"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83070];
  +[SBCornerPencilPanGestureSettings settingsControllerModule](SBCornerPencilPanGestureSettings, "settingsControllerModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submoduleWithModule:childSettingsKeyPath:", v11, CFSTR("pencilGestureSettings"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  +[SBCornerFingerPanGestureSettings settingsControllerModule](SBCornerFingerPanGestureSettings, "settingsControllerModule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submoduleWithModule:childSettingsKeyPath:", v13, CFSTR("fingerGestureSettings"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Inject Velocity"), CFSTR("shouldInjectVelocity"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Injected Velocity"), CFSTR("maximumInjectedVelocity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 75.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "precision:", 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Base Corner Translation Angle"), CFSTR("baseCornerTranslationDegrees"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 90.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Translation Factor"), CFSTR("horizontalTranslationFactor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 2.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Translation Factor"), CFSTR("verticalTranslationFactor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 2.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Rubberbanding Range"), CFSTR("rubberbandingRange"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "precision:", 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Normalized Distance for Commit Threshold"), CFSTR("normalizedDistanceForCommitThreshold"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Crop Corners Visible Progress Threshold"), CFSTR("cropCornersVisibleProgressThreshold"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Crop Lines Visible Progress Threshold"), CFSTR("cropLinesVisibleProgressThreshold"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "precision:", 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Corner Radius Visible Progress Threshold"), CFSTR("cornerRadiusVisibleProgressThreshold"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Projection Deceleration Rate"), CFSTR("projectionDecelerationRate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "precision:", 3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Disabled Gesture Cancellation Distance"), CFSTR("disabledGestureCancellationDistance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "between:and:", 0.0, 300.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "precision:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Disabled Gesture Velocity Scale"), CFSTR("disabledGestureVelocityScale"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "precision:", 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D83070];
  v76[0] = v71;
  v76[1] = v70;
  v76[2] = v69;
  v76[3] = v68;
  v76[4] = v67;
  v76[5] = v66;
  v76[6] = v58;
  v76[7] = v57;
  v76[8] = v56;
  v76[9] = v55;
  v76[10] = v54;
  v76[11] = v53;
  v76[12] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sectionWithRows:title:", v39, CFSTR("Gesture Tracking"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Content Animation Settings"), CFSTR("contentAnimationSettings"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Disabled Gesture Content Animation Settings"), CFSTR("disabledGestureContentAnimationSettings"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Crops Animation Settings"), CFSTR("cropsAnimationSettings"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Crop Lines Alpha Animation Settings"), CFSTR("cropLinesAlphaAnimationSettings"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0D83070];
  v75[0] = v40;
  v75[1] = v41;
  v75[2] = v42;
  v75[3] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionWithRows:title:", v45, CFSTR("Animations"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)MEMORY[0x1E0D83070];
  v74[0] = v73;
  v74[1] = v72;
  v74[2] = v60;
  v74[3] = v59;
  v74[4] = v51;
  v74[5] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "moduleWithTitle:contents:", CFSTR("Interactive Screenshot"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (SBCornerPencilPanGestureSettings)pencilGestureSettings
{
  return self->_pencilGestureSettings;
}

- (void)setPencilGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pencilGestureSettings, a3);
}

- (SBCornerFingerPanGestureSettings)fingerGestureSettings
{
  return self->_fingerGestureSettings;
}

- (void)setFingerGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fingerGestureSettings, a3);
}

- (BOOL)shouldAsynchronouslyRender
{
  return self->_shouldAsynchronouslyRender;
}

- (void)setShouldAsynchronouslyRender:(BOOL)a3
{
  self->_shouldAsynchronouslyRender = a3;
}

- (BOOL)shouldPreheat
{
  return self->_shouldPreheat;
}

- (void)setShouldPreheat:(BOOL)a3
{
  self->_shouldPreheat = a3;
}

- (double)applicationTouchDelayHysteresis
{
  return self->_applicationTouchDelayHysteresis;
}

- (void)setApplicationTouchDelayHysteresis:(double)a3
{
  self->_applicationTouchDelayHysteresis = a3;
}

- (double)cornerRadiusVisibleProgressThreshold
{
  return self->_cornerRadiusVisibleProgressThreshold;
}

- (void)setCornerRadiusVisibleProgressThreshold:(double)a3
{
  self->_cornerRadiusVisibleProgressThreshold = a3;
}

- (double)cropCornersVisibleProgressThreshold
{
  return self->_cropCornersVisibleProgressThreshold;
}

- (void)setCropCornersVisibleProgressThreshold:(double)a3
{
  self->_cropCornersVisibleProgressThreshold = a3;
}

- (double)cropLinesVisibleProgressThreshold
{
  return self->_cropLinesVisibleProgressThreshold;
}

- (void)setCropLinesVisibleProgressThreshold:(double)a3
{
  self->_cropLinesVisibleProgressThreshold = a3;
}

- (double)baseCornerTranslationDegrees
{
  return self->_baseCornerTranslationDegrees;
}

- (void)setBaseCornerTranslationDegrees:(double)a3
{
  self->_baseCornerTranslationDegrees = a3;
}

- (double)projectionDecelerationRate
{
  return self->_projectionDecelerationRate;
}

- (void)setProjectionDecelerationRate:(double)a3
{
  self->_projectionDecelerationRate = a3;
}

- (double)rubberbandingRange
{
  return self->_rubberbandingRange;
}

- (void)setRubberbandingRange:(double)a3
{
  self->_rubberbandingRange = a3;
}

- (double)normalizedDistanceForCommitThreshold
{
  return self->_normalizedDistanceForCommitThreshold;
}

- (void)setNormalizedDistanceForCommitThreshold:(double)a3
{
  self->_normalizedDistanceForCommitThreshold = a3;
}

- (double)horizontalTranslationFactor
{
  return self->_horizontalTranslationFactor;
}

- (void)setHorizontalTranslationFactor:(double)a3
{
  self->_horizontalTranslationFactor = a3;
}

- (double)verticalTranslationFactor
{
  return self->_verticalTranslationFactor;
}

- (void)setVerticalTranslationFactor:(double)a3
{
  self->_verticalTranslationFactor = a3;
}

- (BOOL)shouldInjectVelocity
{
  return self->_shouldInjectVelocity;
}

- (void)setShouldInjectVelocity:(BOOL)a3
{
  self->_shouldInjectVelocity = a3;
}

- (double)maximumInjectedVelocity
{
  return self->_maximumInjectedVelocity;
}

- (void)setMaximumInjectedVelocity:(double)a3
{
  self->_maximumInjectedVelocity = a3;
}

- (double)disabledGestureCancellationDistance
{
  return self->_disabledGestureCancellationDistance;
}

- (void)setDisabledGestureCancellationDistance:(double)a3
{
  self->_disabledGestureCancellationDistance = a3;
}

- (double)disabledGestureVelocityScale
{
  return self->_disabledGestureVelocityScale;
}

- (void)setDisabledGestureVelocityScale:(double)a3
{
  self->_disabledGestureVelocityScale = a3;
}

- (SBFFluidBehaviorSettings)contentAnimationSettings
{
  return self->_contentAnimationSettings;
}

- (void)setContentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_contentAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)disabledGestureContentAnimationSettings
{
  return self->_disabledGestureContentAnimationSettings;
}

- (void)setDisabledGestureContentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_disabledGestureContentAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)cropsAnimationSettings
{
  return self->_cropsAnimationSettings;
}

- (void)setCropsAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cropsAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)cropLinesAlphaAnimationSettings
{
  return self->_cropLinesAlphaAnimationSettings;
}

- (void)setCropLinesAlphaAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cropLinesAlphaAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropLinesAlphaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_cropsAnimationSettings, 0);
  objc_storeStrong((id *)&self->_disabledGestureContentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_contentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_fingerGestureSettings, 0);
  objc_storeStrong((id *)&self->_pencilGestureSettings, 0);
}

@end
