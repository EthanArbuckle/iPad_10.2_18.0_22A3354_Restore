@implementation SBSystemActionSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBSystemActionPreviewSettings setDefaultValues](self->_previewSettings, "setDefaultValues");
  -[SBSystemActionCoachingSettings setDefaultValues](self->_coachingSettings, "setDefaultValues");
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
  _QWORD v20[3];
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83070];
  v23[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Previews"), CFSTR("previewSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D83070];
  v22 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Coaching"), CFSTR("coachingSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83070];
  v21 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83070];
  v20[0] = v7;
  v20[1] = v11;
  v20[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("System Action"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (SBSystemActionPreviewSettings)previewSettings
{
  return self->_previewSettings;
}

- (SBSystemActionCoachingSettings)coachingSettings
{
  return self->_coachingSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingSettings, 0);
  objc_storeStrong((id *)&self->_previewSettings, 0);
}

@end
