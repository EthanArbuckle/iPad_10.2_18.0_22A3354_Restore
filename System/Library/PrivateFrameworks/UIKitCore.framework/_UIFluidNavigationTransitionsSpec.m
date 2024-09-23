@implementation _UIFluidNavigationTransitionsSpec

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Parallax"), CFSTR("parallaxSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Fluid Navigation Transitionins"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_UIFluidParallaxTransitionSettings)parallaxSettings
{
  return self->_parallaxSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
}

@end
