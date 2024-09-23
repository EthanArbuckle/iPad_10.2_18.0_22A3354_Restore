@implementation SBSystemNotesSettings

- (void)setDefaultValues
{
  SBPIPStashVisualSettings *v3;
  SBPIPStashMaterialSettings *v4;
  SBDropShadowSettings *v5;
  void *v6;
  SBDropShadowSettings *v7;
  SBPIPShadowSettings *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSystemNotesSettings;
  -[PTSettings setDefaultValues](&v9, sel_setDefaultValues);
  v3 = -[PTSettings initWithDefaultValues]([SBPIPStashVisualSettings alloc], "initWithDefaultValues");
  -[SBPIPStashVisualSettings setUserInterfaceStyle:](v3, "setUserInterfaceStyle:", 0);
  v4 = -[PTSettings initWithDefaultValues]([SBPIPStashMaterialSettings alloc], "initWithDefaultValues");
  -[SBPIPStashMaterialSettings setDarkTintAlpha:](v4, "setDarkTintAlpha:", 0.35);
  -[SBPIPStashMaterialSettings setLightTintAlpha:](v4, "setLightTintAlpha:", 0.14);
  -[SBPIPStashVisualSettings setLightModeMaterialSettings:](v3, "setLightModeMaterialSettings:", v4);
  -[SBSystemNotesSettings setStashVisualSettings:](self, "setStashVisualSettings:", v3);
  v5 = -[PTSettings initWithDefaultValues]([SBDropShadowSettings alloc], "initWithDefaultValues");
  -[SBDropShadowSettings setOpacity:](v5, "setOpacity:", 0.25);
  -[SBDropShadowSettings setRadius:](v5, "setRadius:", 20.0);
  -[SBDropShadowSettings setOffsetX:](v5, "setOffsetX:", 0.0);
  -[SBDropShadowSettings setOffsetY:](v5, "setOffsetY:", 0.0);
  -[SBDropShadowSettings setContinuousCornerRadius:](v5, "setContinuousCornerRadius:", 20.0);
  -[SBSystemNotesSettings shadowSettings](self, "shadowSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBodyShadowSettings:", v5);

  v7 = -[PTSettings initWithDefaultValues]([SBDropShadowSettings alloc], "initWithDefaultValues");
  -[SBDropShadowSettings setOpacity:](v7, "setOpacity:", 0.5);
  -[SBDropShadowSettings setRadius:](v7, "setRadius:", 75.0);
  -[SBDropShadowSettings setOffsetX:](v7, "setOffsetX:", 0.0);
  -[SBDropShadowSettings setOffsetY:](v7, "setOffsetY:", 15.0);
  -[SBDropShadowSettings setContinuousCornerRadius:](v7, "setContinuousCornerRadius:", 20.0);
  v8 = -[PTSettings initWithDefaultValues]([SBPIPShadowSettings alloc], "initWithDefaultValues");
  -[SBPIPShadowSettings setBodyShadowSettings:](v8, "setBodyShadowSettings:", v5);
  -[SBPIPShadowSettings setTabShadowSettings:](v8, "setTabShadowSettings:", v7);
  -[SBSystemNotesSettings setShadowSettings:](self, "setShadowSettings:", v8);

}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[8];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  v3 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:action:", CFSTR("Restore Defaults"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v6, CFSTR("Restore Default Values"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Swipe-In Metrics"), CFSTR("cornerSwipeMetricSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pencil Swipe-In Tunings"), CFSTR("pencilSwipeGestureTuningSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Finger Swipe-In Tunings"), CFSTR("fingerSwipeGestureTuningSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Stash Visual Settings"), CFSTR("stashVisualSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Drop Shadow Settings"), CFSTR("shadowSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Interaction Settings"), CFSTR("interactionSettings"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Platter Appearance"), CFSTR("appearanceSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Application Launch"), CFSTR("launchSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D83070];
  v25[0] = v22;
  v25[1] = v21;
  v25[2] = v20;
  v25[3] = v19;
  v25[4] = v7;
  v25[5] = v8;
  v12 = (void *)v8;
  v25[6] = v9;
  v25[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v13, CFSTR("All Settings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83070];
  v24[0] = v23;
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("System Notes Settings"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pencilSettings")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("fingerSettings"));

  return v4;
}

- (SBSystemNotesAppearanceSettings)appearanceSettings
{
  return self->_appearanceSettings;
}

- (void)setAppearanceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceSettings, a3);
}

- (SBSystemNotesLaunchSettings)launchSettings
{
  return self->_launchSettings;
}

- (void)setLaunchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_launchSettings, a3);
}

- (SBPIPStashVisualSettings)stashVisualSettings
{
  return self->_stashVisualSettings;
}

- (void)setStashVisualSettings:(id)a3
{
  objc_storeStrong((id *)&self->_stashVisualSettings, a3);
}

- (SBPIPShadowSettings)shadowSettings
{
  return self->_shadowSettings;
}

- (void)setShadowSettings:(id)a3
{
  objc_storeStrong((id *)&self->_shadowSettings, a3);
}

- (SBSystemNotesInteractionSettings)interactionSettings
{
  return self->_interactionSettings;
}

- (void)setInteractionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_interactionSettings, a3);
}

- (SBSystemNotesSwipeMetricSettings)cornerSwipeMetricSettings
{
  return self->_cornerSwipeMetricSettings;
}

- (void)setCornerSwipeMetricSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cornerSwipeMetricSettings, a3);
}

- (SBCornerPencilPanGestureSettings)pencilSwipeGestureTuningSettings
{
  return self->_pencilSwipeGestureTuningSettings;
}

- (void)setPencilSwipeGestureTuningSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pencilSwipeGestureTuningSettings, a3);
}

- (SBCornerFingerPanGestureSettings)fingerSwipeGestureTuningSettings
{
  return self->_fingerSwipeGestureTuningSettings;
}

- (void)setFingerSwipeGestureTuningSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fingerSwipeGestureTuningSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerSwipeGestureTuningSettings, 0);
  objc_storeStrong((id *)&self->_pencilSwipeGestureTuningSettings, 0);
  objc_storeStrong((id *)&self->_cornerSwipeMetricSettings, 0);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_stashVisualSettings, 0);
  objc_storeStrong((id *)&self->_launchSettings, 0);
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
}

@end
