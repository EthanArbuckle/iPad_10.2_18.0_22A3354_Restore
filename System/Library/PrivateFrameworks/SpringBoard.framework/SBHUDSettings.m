@implementation SBHUDSettings

- (void)setDefaultValues
{
  double v2;

  LODWORD(v2) = 1045220557;
  -[SBHUDSettings setDefaultHUDPresentationAnimationDuration:](self, "setDefaultHUDPresentationAnimationDuration:", v2);
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

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D83070];
  __41__SBHUDSettings_settingsControllerModule__block_invoke();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v4, CFSTR("HUD"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v5);
  v6 = (void *)MEMORY[0x1E0D83070];
  __41__SBHUDSettings_settingsControllerModule__block_invoke_2();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0D83070], "moduleWithTitle:contents:", CFSTR("HUD Settings"), v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __41__SBHUDSettings_settingsControllerModule__block_invoke()
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("HUD Present Duration"), CFSTR("defaultHUDPresentationAnimationDuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setMaxValue:", 5.0);
  objc_msgSend(v0, "setMinValue:", 0.1);
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __41__SBHUDSettings_settingsControllerModule__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rowWithTitle:action:", CFSTR("Restore Defaults"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (float)defaultHUDPresentationAnimationDuration
{
  return *(float *)(&self->super.__isObservingChildren + 2);
}

- (void)setDefaultHUDPresentationAnimationDuration:(float)a3
{
  *(float *)(&self->super.__isObservingChildren + 2) = a3;
}

@end
