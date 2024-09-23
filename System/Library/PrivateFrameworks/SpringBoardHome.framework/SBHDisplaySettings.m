@implementation SBHDisplaySettings

- (double)additionalTopSafeAreaInset
{
  return self->_additionalTopSafeAreaInset;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHDisplaySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHDisplaySettings setAdditionalTopSafeAreaInset:](self, "setAdditionalTopSafeAreaInset:", 0.0);
}

- (void)setAdditionalTopSafeAreaInset:(double)a3
{
  self->_additionalTopSafeAreaInset = a3;
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Additional Top Inset"), CFSTR("additionalTopSafeAreaInset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Safe Areas"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v8);
  v9 = (void *)MEMORY[0x1E0D83078];
  __46__SBHDisplaySettings_settingsControllerModule__block_invoke();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Display Settings"), v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __46__SBHDisplaySettings_settingsControllerModule__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rowWithTitle:action:", CFSTR("Restore Defaults"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
