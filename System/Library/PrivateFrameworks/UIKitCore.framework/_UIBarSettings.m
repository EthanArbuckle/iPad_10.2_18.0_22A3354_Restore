@implementation _UIBarSettings

- (_UITabBarSettings)tabBarSettings
{
  return self->_tabBarSettings;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setTabBarSettings:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarSettings, a3);
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBarSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIBarSettings setBackgroundMode:](self, "setBackgroundMode:", 0);
  -[_UIBarSettings setRetainShadow:](self, "setRetainShadow:", 0);
  -[_UIBarSettings setColorByBarType:](self, "setColorByBarType:", 0);
}

- (void)setRetainShadow:(BOOL)a3
{
  self->_retainShadow = a3;
}

- (void)setColorByBarType:(BOOL)a3
{
  self->_colorByBarType = a3;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_backgroundMode = a3;
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
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Background Override"), CFSTR("backgroundMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleValues:titles:", &unk_1E1A950F0, &unk_1E1A95108);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.backgroundMode != %d"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Keep Shadow"), CFSTR("retainShadow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "condition:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Color bars by type"), CFSTR("colorByBarType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "condition:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:action:", CFSTR("Restore Defaults"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "condition:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  v24[0] = v22;
  v24[1] = v21;
  v24[2] = v6;
  v24[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v12, CFSTR("Bar Background Overrides"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v14 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Tab Bar Settings"), CFSTR("tabBarSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v16, CFSTR("Bar Specific Settings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moduleWithTitle:contents:", 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)retainShadow
{
  return self->_retainShadow;
}

- (BOOL)colorByBarType
{
  return self->_colorByBarType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarSettings, 0);
}

@end
