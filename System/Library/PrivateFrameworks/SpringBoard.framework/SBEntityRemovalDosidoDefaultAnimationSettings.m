@implementation SBEntityRemovalDosidoDefaultAnimationSettings

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
  objc_super v11;
  CAFrameRateRange v12;
  CAFrameRateRange v13;

  v11.receiver = self;
  v11.super_class = (Class)SBEntityRemovalDosidoDefaultAnimationSettings;
  -[PTSettings setDefaultValues](&v11, sel_setDefaultValues);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v3, "setBehaviorType:", 1);
  objc_msgSend(v3, "setDampingRatio:", 1.0);
  objc_msgSend(v3, "setResponse:", 0.550000012);
  objc_msgSend(v3, "setRetargetImpulse:", 0.0280000009);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setFromViewAlphaAnimationSettings:](self, "setFromViewAlphaAnimationSettings:", v3);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setFromViewAlphaAnimationDelay:](self, "setFromViewAlphaAnimationDelay:", 0.140000001);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setFromViewFinalScale:](self, "setFromViewFinalScale:", 1.10000002);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setFromViewFinalAlpha:](self, "setFromViewFinalAlpha:", 0.0);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setFromViewFinalBlurRadius:](self, "setFromViewFinalBlurRadius:", 6.0);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewInitialPushInScale:](self, "setToViewInitialPushInScale:", 0.899999976);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewScreenInitialAlpha:](self, "setToViewScreenInitialAlpha:", 0.5);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewInitialDimmingAlpha:](self, "setToViewInitialDimmingAlpha:", 0.569999993);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewInitialBlurProgress:](self, "setToViewInitialBlurProgress:", 1.0);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewScaleAndAlphaResetAnimationDelay:](self, "setToViewScaleAndAlphaResetAnimationDelay:", 0.119999997);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewDimmingViewFadeOutDelay:](self, "setToViewDimmingViewFadeOutDelay:", 0.0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v4, "setBehaviorType:", 2);
  objc_msgSend(v4, "setDampingRatio:", 0.879999995);
  objc_msgSend(v4, "setResponse:", 0.699999988);
  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setFromViewScaleAnimationSettings:](self, "setFromViewScaleAnimationSettings:", v4);
  SBEntityRemovalDefaultFluidAnimationSettings();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewScaleAndAlphaResetAnimationSettings:](self, "setToViewScaleAndAlphaResetAnimationSettings:", v5);

  -[SBEntityRemovalDosidoDefaultAnimationSettings toViewScaleAndAlphaResetAnimationSettings](self, "toViewScaleAndAlphaResetAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDampingRatio:", 1.29999995);

  -[SBEntityRemovalDosidoDefaultAnimationSettings toViewScaleAndAlphaResetAnimationSettings](self, "toViewScaleAndAlphaResetAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResponse:", 0.75);

  -[SBEntityRemovalDosidoDefaultAnimationSettings toViewScaleAndAlphaResetAnimationSettings](self, "toViewScaleAndAlphaResetAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRetargetImpulse:", 0.0280000009);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v9, "setBehaviorType:", 1);
  objc_msgSend(v9, "setDampingRatio:", 1.29999995);
  objc_msgSend(v9, "setResponse:", 0.75);
  objc_msgSend(v9, "setRetargetImpulse:", 0.028);
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewWallpaperScaleAnimationSettings:](self, "setToViewWallpaperScaleAnimationSettings:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v10, "setBehaviorType:", 1);
  objc_msgSend(v10, "setDampingRatio:", 1.0);
  objc_msgSend(v10, "setResponse:", 0.31400001);
  -[SBEntityRemovalDosidoDefaultAnimationSettings setToViewDimmingViewAlphaAnimationSettings:](self, "setToViewDimmingViewAlphaAnimationSettings:", v10);

}

+ (id)_settingsModule
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
  _QWORD v50[7];
  void *v51;
  _QWORD v52[12];

  v52[10] = *MEMORY[0x1E0C80C00];
  v43 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App(s) Final Scale"), CFSTR("fromViewFinalScale"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", 0.0, 2.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v46;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App(s) Final Alpha"), CFSTR("fromViewFinalAlpha"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "minValue:maxValue:", 0.0, 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v42;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App(s) Final Blur Radius"), CFSTR("fromViewFinalBlurRadius"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "minValue:maxValue:", 0.0, 10.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v40;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App(s) Alpha Animation Delay"), CFSTR("fromViewAlphaAnimationDelay"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", 0.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v38;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Initial Push-In Scale"), CFSTR("toViewInitialPushInScale"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v36;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Initial Alpha"), CFSTR("toViewScreenInitialAlpha"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "minValue:maxValue:", 0.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v2;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Initial Dimming Alpha"), CFSTR("toViewInitialDimmingAlpha"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v4;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Initial Blur Progress"), CFSTR("toViewInitialBlurProgress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v6;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale and Alpha Reset Animation Delay"), CFSTR("toViewScaleAndAlphaResetAnimationDelay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v8;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Dimming View Fade-Out Animation Delay"), CFSTR("toViewDimmingViewFadeOutDelay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sectionWithRows:title:", v11, CFSTR("Scale and Alpha Settings"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("App(s) Scale Animation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submoduleWithModule:childSettingsKeyPath:", v13, CFSTR("fromViewScaleAnimationSettings"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("App(s) Alpha Animation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submoduleWithModule:childSettingsKeyPath:", v15, CFSTR("fromViewAlphaAnimationSettings"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Home Screen Scale and Alpha Reset Animation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submoduleWithModule:childSettingsKeyPath:", v17, CFSTR("toViewScaleAndAlphaResetAnimationSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Home Screen Wallpaper Scale Reset Animation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submoduleWithModule:childSettingsKeyPath:", v20, CFSTR("toViewWallpaperScaleAnimationSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Home Screen Dimming View Fade-Out Animation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "submoduleWithModule:childSettingsKeyPath:", v23, CFSTR("toViewDimmingViewAlphaAnimationSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D83070];
  v26 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "action");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:action:", CFSTR("Restore Dosido Default Animation Settings"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sectionWithRows:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83070];
  v50[0] = v44;
  v50[1] = v49;
  v50[2] = v47;
  v50[3] = v18;
  v50[4] = v21;
  v50[5] = v24;
  v50[6] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "moduleWithTitle:contents:", CFSTR("Dosido to HomeScreen Default Animation Settings"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend((id)objc_opt_class(), "_settingsModule");
}

- (double)fromViewFinalScale
{
  return self->_fromViewFinalScale;
}

- (void)setFromViewFinalScale:(double)a3
{
  self->_fromViewFinalScale = a3;
}

- (double)fromViewFinalAlpha
{
  return self->_fromViewFinalAlpha;
}

- (void)setFromViewFinalAlpha:(double)a3
{
  self->_fromViewFinalAlpha = a3;
}

- (double)fromViewFinalBlurRadius
{
  return self->_fromViewFinalBlurRadius;
}

- (void)setFromViewFinalBlurRadius:(double)a3
{
  self->_fromViewFinalBlurRadius = a3;
}

- (double)fromViewAlphaAnimationDelay
{
  return self->_fromViewAlphaAnimationDelay;
}

- (void)setFromViewAlphaAnimationDelay:(double)a3
{
  self->_fromViewAlphaAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)fromViewScaleAnimationSettings
{
  return self->_fromViewScaleAnimationSettings;
}

- (void)setFromViewScaleAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewScaleAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)fromViewAlphaAnimationSettings
{
  return self->_fromViewAlphaAnimationSettings;
}

- (void)setFromViewAlphaAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewAlphaAnimationSettings, a3);
}

- (double)toViewInitialPushInScale
{
  return self->_toViewInitialPushInScale;
}

- (void)setToViewInitialPushInScale:(double)a3
{
  self->_toViewInitialPushInScale = a3;
}

- (double)toViewScreenInitialAlpha
{
  return self->_toViewScreenInitialAlpha;
}

- (void)setToViewScreenInitialAlpha:(double)a3
{
  self->_toViewScreenInitialAlpha = a3;
}

- (double)toViewInitialDimmingAlpha
{
  return self->_toViewInitialDimmingAlpha;
}

- (void)setToViewInitialDimmingAlpha:(double)a3
{
  self->_toViewInitialDimmingAlpha = a3;
}

- (double)toViewInitialBlurProgress
{
  return self->_toViewInitialBlurProgress;
}

- (void)setToViewInitialBlurProgress:(double)a3
{
  self->_toViewInitialBlurProgress = a3;
}

- (double)toViewScaleAndAlphaResetAnimationDelay
{
  return self->_toViewScaleAndAlphaResetAnimationDelay;
}

- (void)setToViewScaleAndAlphaResetAnimationDelay:(double)a3
{
  self->_toViewScaleAndAlphaResetAnimationDelay = a3;
}

- (double)toViewDimmingViewFadeOutDelay
{
  return self->_toViewDimmingViewFadeOutDelay;
}

- (void)setToViewDimmingViewFadeOutDelay:(double)a3
{
  self->_toViewDimmingViewFadeOutDelay = a3;
}

- (SBFFluidBehaviorSettings)toViewScaleAndAlphaResetAnimationSettings
{
  return self->_toViewScaleAndAlphaResetAnimationSettings;
}

- (void)setToViewScaleAndAlphaResetAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toViewScaleAndAlphaResetAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)toViewWallpaperScaleAnimationSettings
{
  return self->_toViewWallpaperScaleAnimationSettings;
}

- (void)setToViewWallpaperScaleAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toViewWallpaperScaleAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)toViewDimmingViewAlphaAnimationSettings
{
  return self->_toViewDimmingViewAlphaAnimationSettings;
}

- (void)setToViewDimmingViewAlphaAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toViewDimmingViewAlphaAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewDimmingViewAlphaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toViewWallpaperScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toViewScaleAndAlphaResetAnimationSettings, 0);
  objc_storeStrong((id *)&self->_fromViewAlphaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_fromViewScaleAnimationSettings, 0);
}

@end
