@implementation SBEntityRemovalMedusaSlideOutAnimationSettings

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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBEntityRemovalMedusaSlideOutAnimationSettings;
  -[PTSettings setDefaultValues](&v19, sel_setDefaultValues);
  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toBeRemovedScaleAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDampingRatio:", 0.879999995);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toBeRemovedScaleAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.699999988);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toBeRemovedAlphaAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDampingRatio:", 0.879999995);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toBeRemovedAlphaAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResponse:", 0.699999988);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToBeRemovedFinalScale:", 0.910000026);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToBeRemovedFinalAlpha:", 1.0);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToBeRemovedFinalBlurRadius:", 0.0);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setToBeMadeFullscreenFrameAnimationDelay:", 0.400000006);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeMadeFullScreenPushInScale:](self, "setToBeMadeFullScreenPushInScale:", 0.980000019);
  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeMadeFullScreenScaleResetAnimationDelay:](self, "setToBeMadeFullScreenScaleResetAnimationDelay:", 0.0);
  SBEntityRemovalDefaultFluidAnimationSettings();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeMadeFullscreenPushInScaleAnimationSettings:](self, "setToBeMadeFullscreenPushInScaleAnimationSettings:", v15);

  SBEntityRemovalDefaultFluidAnimationSettings();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeMadeFullscreenScaleResetAnimationSettings:](self, "setToBeMadeFullscreenScaleResetAnimationSettings:", v16);

  SBEntityRemovalDefaultFluidAnimationSettings();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeRemovedSlideOutAnimationSettings:](self, "setToBeRemovedSlideOutAnimationSettings:", v17);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings toBeRemovedSlideOutAnimationSettings](self, "toBeRemovedSlideOutAnimationSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setResponse:", 0.600000024);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeRemovedSlideOutAnimationDelay:](self, "setToBeRemovedSlideOutAnimationDelay:", 0.275000006);
  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeRemovedSlideOutHeightOffsetMultiplier:](self, "setToBeRemovedSlideOutHeightOffsetMultiplier:", 1.20000005);
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
  void *v33;
  void *v34;
  _QWORD v35[6];
  void *v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be made Fullscreen Push-In Scale"), CFSTR("toBeMadeFullScreenPushInScale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be made Fullscreen Scale Reset Animation Dealy"), CFSTR("toBeMadeFullScreenScaleResetAnimationDelay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be Removed Slide Out Animation Dealy"), CFSTR("toBeRemovedSlideOutAnimationDelay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v8;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("To be Removed Slide Out Height Offset Multiplier"), CFSTR("toBeRemovedSlideOutHeightOffsetMultiplier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 1.0, 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Push-In Scale Settings"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("To be made Fullscreen Scale-Reset Animation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submoduleWithModule:childSettingsKeyPath:", v13, CFSTR("toBeMadeFullscreenPushInScaleAnimationSettings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("To be made Fullscreen Push-In Scale Animation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submoduleWithModule:childSettingsKeyPath:", v15, CFSTR("toBeMadeFullscreenScaleResetAnimationSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("To be Removed Slide-Out Animation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "submoduleWithModule:childSettingsKeyPath:", v18, CFSTR("toBeRemovedSlideOutAnimationSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83070];
  +[SBEntityRemovalMedusaDefaultAnimationSettings _settingsModule](SBEntityRemovalMedusaDefaultAnimationSettings, "_settingsModule");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "submoduleWithModule:childSettingsKeyPath:", v21, CFSTR("defaultAnimationSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83070];
  v24 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:action:", CFSTR("Restore Medusa SlideOut Animation Settings"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionWithRows:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D83070];
  v35[0] = v34;
  v35[1] = v16;
  v35[2] = v33;
  v35[3] = v19;
  v35[4] = v22;
  v35[5] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "moduleWithTitle:contents:", CFSTR("Medusa Entity Removal SlideOut Animation Settings"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (double)toBeMadeFullScreenPushInScale
{
  return self->_toBeMadeFullScreenPushInScale;
}

- (void)setToBeMadeFullScreenPushInScale:(double)a3
{
  self->_toBeMadeFullScreenPushInScale = a3;
}

- (double)toBeMadeFullScreenScaleResetAnimationDelay
{
  return self->_toBeMadeFullScreenScaleResetAnimationDelay;
}

- (void)setToBeMadeFullScreenScaleResetAnimationDelay:(double)a3
{
  self->_toBeMadeFullScreenScaleResetAnimationDelay = a3;
}

- (double)toBeRemovedSlideOutAnimationDelay
{
  return self->_toBeRemovedSlideOutAnimationDelay;
}

- (void)setToBeRemovedSlideOutAnimationDelay:(double)a3
{
  self->_toBeRemovedSlideOutAnimationDelay = a3;
}

- (double)toBeRemovedSlideOutHeightOffsetMultiplier
{
  return self->_toBeRemovedSlideOutHeightOffsetMultiplier;
}

- (void)setToBeRemovedSlideOutHeightOffsetMultiplier:(double)a3
{
  self->_toBeRemovedSlideOutHeightOffsetMultiplier = a3;
}

- (SBFFluidBehaviorSettings)toBeMadeFullscreenPushInScaleAnimationSettings
{
  return self->_toBeMadeFullscreenPushInScaleAnimationSettings;
}

- (void)setToBeMadeFullscreenPushInScaleAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toBeMadeFullscreenPushInScaleAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)toBeMadeFullscreenScaleResetAnimationSettings
{
  return self->_toBeMadeFullscreenScaleResetAnimationSettings;
}

- (void)setToBeMadeFullscreenScaleResetAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toBeMadeFullscreenScaleResetAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)toBeRemovedSlideOutAnimationSettings
{
  return self->_toBeRemovedSlideOutAnimationSettings;
}

- (void)setToBeRemovedSlideOutAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toBeRemovedSlideOutAnimationSettings, a3);
}

- (SBEntityRemovalMedusaDefaultAnimationSettings)defaultAnimationSettings
{
  return self->_defaultAnimationSettings;
}

- (void)setDefaultAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeRemovedSlideOutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeMadeFullscreenScaleResetAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeMadeFullscreenPushInScaleAnimationSettings, 0);
}

@end
