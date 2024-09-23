@implementation SBHCrossfadeAppTransitionSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHCrossfadeAppTransitionSettings;
  -[SBHCrossfadeZoomSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHScaleZoomSettings setCrossfadeWithZoom:](self, "setCrossfadeWithZoom:", 0);
  -[SBHIconZoomSettings setLabelAlphaWithZoom:](self, "setLabelAlphaWithZoom:", 0);
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
  objc_super v18;
  _QWORD v19[3];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___SBHCrossfadeAppTransitionSettings;
  objc_msgSendSuper2(&v18, sel_settingsControllerModule);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Snapshot Corner Radius"), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submoduleWithModule:childSettingsKeyPath:", v6, CFSTR("appSnapshotCornerRadiusSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83078];
  v9 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Restore Defaults"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  v19[0] = v4;
  v19[1] = v7;
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (SBFAnimationSettings)appSnapshotCornerRadiusSettings
{
  return self->super._morphSettings;
}

- (void)setAppSnapshotCornerRadiusSettings:(id)a3
{
  objc_storeStrong((id *)&self->super._morphSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._morphSettings, 0);
}

@end
