@implementation SBPIPShadowSettings

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
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  +[SBDropShadowSettings moduleWithSectionTitle:](SBDropShadowSettings, "moduleWithSectionTitle:", CFSTR("Body Shadow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, CFSTR("bodyShadowSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83070];
  +[SBDropShadowSettings moduleWithSectionTitle:](SBDropShadowSettings, "moduleWithSectionTitle:", CFSTR("Tab Shadow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submoduleWithModule:childSettingsKeyPath:", v6, CFSTR("tabShadowSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83070];
  v12[0] = v4;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moduleWithTitle:contents:", CFSTR("Drop Shadow"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SBDropShadowSettings)bodyShadowSettings
{
  return self->_bodyShadowSettings;
}

- (void)setBodyShadowSettings:(id)a3
{
  objc_storeStrong((id *)&self->_bodyShadowSettings, a3);
}

- (SBDropShadowSettings)tabShadowSettings
{
  return self->_tabShadowSettings;
}

- (void)setTabShadowSettings:(id)a3
{
  objc_storeStrong((id *)&self->_tabShadowSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabShadowSettings, 0);
  objc_storeStrong((id *)&self->_bodyShadowSettings, 0);
}

@end
