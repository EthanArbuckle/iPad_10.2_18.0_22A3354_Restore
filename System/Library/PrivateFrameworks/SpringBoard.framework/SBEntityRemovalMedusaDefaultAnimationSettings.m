@implementation SBEntityRemovalMedusaDefaultAnimationSettings

- (void)setDefaultValues
{
  _BOOL4 v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  CAFrameRateRange v10;

  v9.receiver = self;
  v9.super_class = (Class)SBEntityRemovalMedusaDefaultAnimationSettings;
  -[PTSettings setDefaultValues](&v9, sel_setDefaultValues);
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedFinalScale:](self, "setToBeRemovedFinalScale:", 0.899999976);
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedFinalAlpha:](self, "setToBeRemovedFinalAlpha:", 0.0);
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedFinalBlurRadius:](self, "setToBeRemovedFinalBlurRadius:", 6.0);
  v3 = SBReduceMotion();
  v4 = 0.129999995;
  if (v3)
    v4 = 0.25;
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeMadeFullscreenFrameAnimationDelay:](self, "setToBeMadeFullscreenFrameAnimationDelay:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v5, "setBehaviorType:", 2);
  objc_msgSend(v5, "setDampingRatio:", 1.0);
  objc_msgSend(v5, "setResponse:", 0.550000012);
  v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v10.minimum, *(double *)&v10.maximum, *(double *)&v10.preferred);
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedScaleAnimationSettings:](self, "setToBeRemovedScaleAnimationSettings:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v6, "setBehaviorType:", 2);
  objc_msgSend(v6, "setDampingRatio:", 1.0);
  objc_msgSend(v6, "setResponse:", 0.300000012);
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedAlphaAnimationSettings:](self, "setToBeRemovedAlphaAnimationSettings:", v6);
  SBEntityRemovalDefaultFluidAnimationSettings();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeMadeFullscreenFrameAnimationSettings:](self, "setToBeMadeFullscreenFrameAnimationSettings:", v7);

  -[SBEntityRemovalMedusaDefaultAnimationSettings toBeMadeFullscreenFrameAnimationSettings](self, "toBeMadeFullscreenFrameAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponse:", 0.430000007);

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
  void *v31;
  _QWORD v32[5];
  void *v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be Removed Final Scale"), CFSTR("toBeRemovedFinalScale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be Removed Final Alpha"), CFSTR("toBeRemovedFinalAlpha"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be Removed Final Blur Radius"), CFSTR("toBeRemovedFinalBlurRadius"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v8;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be Made Fullscreen Animations Delay"), CFSTR("toBeMadeFullscreenFrameAnimationDelay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Scale, Alpha, and Delay Settings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("To be Removed Scale Animation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submoduleWithModule:childSettingsKeyPath:", v13, CFSTR("toBeRemovedScaleAnimationSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("To be Removed Alpha Animation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submoduleWithModule:childSettingsKeyPath:", v16, CFSTR("toBeRemovedAlphaAnimationSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("To be Made Fullscreen Frame Animation"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submoduleWithModule:childSettingsKeyPath:", v19, CFSTR("toBeMadeFullscreenFrameAnimationSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83070];
  v22 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "action");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:action:", CFSTR("Restore Medusa Default Animation Settings"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionWithRows:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D83070];
  v32[0] = v31;
  v32[1] = v20;
  v32[2] = v14;
  v32[3] = v17;
  v32[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "moduleWithTitle:contents:", CFSTR("Medusa Entity Removal Default Animation Settings"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend((id)objc_opt_class(), "_settingsModule");
}

- (double)toBeRemovedFinalScale
{
  return self->_toBeRemovedFinalScale;
}

- (void)setToBeRemovedFinalScale:(double)a3
{
  self->_toBeRemovedFinalScale = a3;
}

- (double)toBeRemovedFinalAlpha
{
  return self->_toBeRemovedFinalAlpha;
}

- (void)setToBeRemovedFinalAlpha:(double)a3
{
  self->_toBeRemovedFinalAlpha = a3;
}

- (double)toBeRemovedFinalBlurRadius
{
  return self->_toBeRemovedFinalBlurRadius;
}

- (void)setToBeRemovedFinalBlurRadius:(double)a3
{
  self->_toBeRemovedFinalBlurRadius = a3;
}

- (double)toBeMadeFullscreenFrameAnimationDelay
{
  return self->_toBeMadeFullscreenFrameAnimationDelay;
}

- (void)setToBeMadeFullscreenFrameAnimationDelay:(double)a3
{
  self->_toBeMadeFullscreenFrameAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)toBeMadeFullscreenFrameAnimationSettings
{
  return self->_toBeMadeFullscreenFrameAnimationSettings;
}

- (void)setToBeMadeFullscreenFrameAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toBeMadeFullscreenFrameAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)toBeRemovedScaleAnimationSettings
{
  return self->_toBeRemovedScaleAnimationSettings;
}

- (void)setToBeRemovedScaleAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toBeRemovedScaleAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)toBeRemovedAlphaAnimationSettings
{
  return self->_toBeRemovedAlphaAnimationSettings;
}

- (void)setToBeRemovedAlphaAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toBeRemovedAlphaAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBeRemovedAlphaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeRemovedScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeMadeFullscreenFrameAnimationSettings, 0);
}

@end
