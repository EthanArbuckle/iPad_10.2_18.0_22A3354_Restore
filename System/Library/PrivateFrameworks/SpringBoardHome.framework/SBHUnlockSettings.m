@implementation SBHUnlockSettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SBHUnlockSettings;
  objc_msgSendSuper2(&v9, sel_settingsControllerModule);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moduleWithTitle:contents:", CFSTR("Unlock"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHUnlockSettings;
  -[SBHCenterAppSuspendSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHCenterZoomSettings setZoomViewBelowIcons:](self, "setZoomViewBelowIcons:", 1);
}

@end
