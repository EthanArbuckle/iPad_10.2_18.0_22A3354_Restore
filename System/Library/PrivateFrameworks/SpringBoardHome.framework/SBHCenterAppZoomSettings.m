@implementation SBHCenterAppZoomSettings

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
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v25.receiver = a1;
  v25.super_class = (Class)&OBJC_METACLASS___SBHCenterAppZoomSettings;
  objc_msgSendSuper2(&v25, sel_settingsControllerModule);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("App head-start (seconds)"), CFSTR("appHeadStart"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", -1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v23, CFSTR("App Zoom Animation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", 0, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submoduleWithModule:childSettingsKeyPath:", v8, CFSTR("appZoomSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("App Fade"), 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submoduleWithModule:childSettingsKeyPath:", v11, CFSTR("appFadeSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v14 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:action:", CFSTR("Restore Defaults"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83078];
  v26[0] = v24;
  v26[1] = v6;
  v26[2] = v9;
  v26[3] = v12;
  v26[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moduleWithTitle:contents:", CFSTR("Center Zoom"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHCenterAppZoomSettings;
  -[SBHCenterZoomSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHCenterZoomSettings setZoomViewBelowIcons:](self, "setZoomViewBelowIcons:", 0);
}

- (double)appHeadStart
{
  return self->super._dockMass;
}

- (void)setAppHeadStart:(double)a3
{
  self->super._dockMass = a3;
}

- (SBFAnimationSettings)appZoomSettings
{
  return *(SBFAnimationSettings **)&self->_appHeadStart;
}

- (void)setAppZoomSettings:(id)a3
{
  objc_storeStrong((id *)&self->_appHeadStart, a3);
}

- (SBFAnimationSettings)appFadeSettings
{
  return self->_appZoomSettings;
}

- (void)setAppFadeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_appZoomSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appZoomSettings, 0);
  objc_storeStrong((id *)&self->_appHeadStart, 0);
}

@end
