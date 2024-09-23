@implementation SBEntityRemovalDosidoSlideOutAnimationSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBEntityRemovalDosidoSlideOutAnimationSettings;
  -[PTSettings setDefaultValues](&v10, sel_setDefaultValues);
  -[SBEntityRemovalDosidoSlideOutAnimationSettings setFromViewSlideOutHeightOffsetMultiplier:](self, "setFromViewSlideOutHeightOffsetMultiplier:", 1.20000005);
  -[SBEntityRemovalDosidoSlideOutAnimationSettings setFromViewSlideOutAnimationDelay:](self, "setFromViewSlideOutAnimationDelay:", 0.275000006);
  -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromViewFinalScale:", 0.930000007);

  -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromViewFinalAlpha:", 1.0);

  -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromViewFinalBlurRadius:", 0.0);

  -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToViewScaleAndAlphaResetAnimationDelay:", 0.400000006);

  -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToViewDimmingViewFadeOutDelay:", 0.419999987);

  SBEntityRemovalDefaultFluidAnimationSettings();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalDosidoSlideOutAnimationSettings setFromViewSlideOutAnimationSettings:](self, "setFromViewSlideOutAnimationSettings:", v8);

  -[SBEntityRemovalDosidoSlideOutAnimationSettings fromViewSlideOutAnimationSettings](self, "fromViewSlideOutAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResponse:", 0.699999988);

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
  _QWORD v25[4];
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App(s) Slideout Height Offset Multiplier"), CFSTR("fromViewSlideOutHeightOffsetMultiplier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 1.0, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App(s) Slideout Animation Delay"), CFSTR("fromViewSlideOutAnimationDelay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 2.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v7, CFSTR("Delay Settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("App(s) Slide-Out Animation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submoduleWithModule:childSettingsKeyPath:", v10, CFSTR("fromViewSlideOutAnimationSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  +[SBEntityRemovalDosidoDefaultAnimationSettings _settingsModule](SBEntityRemovalDosidoDefaultAnimationSettings, "_settingsModule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submoduleWithModule:childSettingsKeyPath:", v13, CFSTR("defaultAnimationSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83070];
  v16 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "action");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:action:", CFSTR("Restore Dosido SlideOut Animation Settings"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83070];
  v25[0] = v8;
  v25[1] = v11;
  v25[2] = v14;
  v25[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moduleWithTitle:contents:", CFSTR("Dosido to HomeScreen SlideOut Animation Settings"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (double)fromViewSlideOutAnimationDelay
{
  return self->_fromViewSlideOutAnimationDelay;
}

- (void)setFromViewSlideOutAnimationDelay:(double)a3
{
  self->_fromViewSlideOutAnimationDelay = a3;
}

- (double)fromViewSlideOutHeightOffsetMultiplier
{
  return self->_fromViewSlideOutHeightOffsetMultiplier;
}

- (void)setFromViewSlideOutHeightOffsetMultiplier:(double)a3
{
  self->_fromViewSlideOutHeightOffsetMultiplier = a3;
}

- (SBFFluidBehaviorSettings)fromViewSlideOutAnimationSettings
{
  return self->_fromViewSlideOutAnimationSettings;
}

- (void)setFromViewSlideOutAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewSlideOutAnimationSettings, a3);
}

- (SBEntityRemovalDosidoDefaultAnimationSettings)defaultAnimationSettings
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
  objc_storeStrong((id *)&self->_fromViewSlideOutAnimationSettings, 0);
}

@end
