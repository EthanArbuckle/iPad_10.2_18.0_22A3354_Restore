@implementation STUIStatusBarSettings

- (STUIItemSettings)itemSettings
{
  return self->_itemSettings;
}

- (STUIVisualProviderSettings)visualProviderSettings
{
  return self->_visualProviderSettings;
}

- (int64_t)forcedMode
{
  return self->_forcedMode;
}

- (BOOL)alwaysAutomaticStyle
{
  return self->_alwaysAutomaticStyle;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[STUIStatusBarSettings setAlwaysAutomaticStyle:](self, "setAlwaysAutomaticStyle:", 0);
  -[STUIStatusBarSettings setForcedMode:](self, "setForcedMode:", -1);
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
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Automatic Style"), CFSTR("alwaysAutomaticStyle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Forced Mode"), CFSTR("forcedMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E8D80228, &unk_1E8D80240);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v5, CFSTR("General"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v7 = (void *)MEMORY[0x1E0D83078];
  v8 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setAlwaysAutomaticStyle:(BOOL)a3
{
  self->_alwaysAutomaticStyle = a3;
}

- (void)setForcedMode:(int64_t)a3
{
  self->_forcedMode = a3;
}

- (void)setVisualProviderSettings:(id)a3
{
  objc_storeStrong((id *)&self->_visualProviderSettings, a3);
}

- (void)setItemSettings:(id)a3
{
  objc_storeStrong((id *)&self->_itemSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSettings, 0);
  objc_storeStrong((id *)&self->_visualProviderSettings, 0);
}

@end
