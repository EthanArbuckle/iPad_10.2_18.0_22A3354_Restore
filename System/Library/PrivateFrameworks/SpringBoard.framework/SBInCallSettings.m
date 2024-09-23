@implementation SBInCallSettings

- (void)setDefaultValues
{
  -[SBFFluidBehaviorSettings setDefaultValues](self->_transientOverlayFadeInSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_transientOverlayFadeInSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_transientOverlayFadeInSettings, "setResponse:", 0.24);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_transientOverlayFadeOutSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_transientOverlayFadeOutSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_transientOverlayFadeOutSettings, "setResponse:", 0.24);
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
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83070];
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Transient Overlay Fade In Settings"), CFSTR("transientOverlayFadeInSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Transient Overlay Fade Out Settings"), CFSTR("transientOverlayFadeOutSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83070];
  v18[0] = v8;
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Animations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  v17[0] = v7;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("InCall"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (SBFFluidBehaviorSettings)transientOverlayFadeInSettings
{
  return self->_transientOverlayFadeInSettings;
}

- (void)setTransientOverlayFadeInSettings:(id)a3
{
  objc_storeStrong((id *)&self->_transientOverlayFadeInSettings, a3);
}

- (SBFFluidBehaviorSettings)transientOverlayFadeOutSettings
{
  return self->_transientOverlayFadeOutSettings;
}

- (void)setTransientOverlayFadeOutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_transientOverlayFadeOutSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientOverlayFadeOutSettings, 0);
  objc_storeStrong((id *)&self->_transientOverlayFadeInSettings, 0);
}

@end
