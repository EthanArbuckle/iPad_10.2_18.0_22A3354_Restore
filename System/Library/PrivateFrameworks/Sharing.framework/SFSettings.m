@implementation SFSettings

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
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Magic Head"), CFSTR("magicHeadSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moduleWithTitle:contents:", CFSTR("Settings for Features"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SFMagicHeadSettings)magicHeadSettings
{
  return self->_magicHeadSettings;
}

- (void)setMagicHeadSettings:(id)a3
{
  objc_storeStrong((id *)&self->_magicHeadSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magicHeadSettings, 0);
}

@end
