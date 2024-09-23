@implementation SBFSiriSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFSiriSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[SBFSiriSettings systemAssistantExperienceSettings](self, "systemAssistantExperienceSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

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
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("System Assistant Experience"), CFSTR("systemAssistantExperienceSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v6 = (void *)MEMORY[0x1E0D83070];
  v7 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:action:", CFSTR("Restore Defaults"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SBFSiriSystemAssistantExperienceSettings)systemAssistantExperienceSettings
{
  return self->_systemAssistantExperienceSettings;
}

- (void)setSystemAssistantExperienceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_systemAssistantExperienceSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAssistantExperienceSettings, 0);
}

@end
