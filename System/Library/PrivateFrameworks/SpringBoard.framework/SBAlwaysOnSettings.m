@implementation SBAlwaysOnSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAlwaysOnSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBAlwaysOnPolicySettings setDefaultValues](self->_policySettings, "setDefaultValues");
  -[SBAlwaysOnAPLSettings setDefaultValues](self->_aplSettings, "setDefaultValues");
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
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[3];
  void *v25;
  _QWORD v26[2];
  void *v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Sleep Behavior"), CFSTR("sideButtonBehavior"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = &unk_1E91D1688;
  v28[1] = &unk_1E91D16A0;
  v29[0] = CFSTR("To Always On");
  v29[1] = CFSTR("To Off");
  v28[2] = &unk_1E91D16B8;
  v29[2] = CFSTR("To Off from Always On");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPossibleValues:", v2);

  objc_msgSend(v23, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPossibleTitles:", v3);

  v4 = (void *)MEMORY[0x1E0D83070];
  v27 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Side Button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Policy Settings"), CFSTR("policySettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("APL Settings"), CFSTR("aplSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D83070];
  v26[0] = v7;
  v26[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:action:", CFSTR("Restore Defaults"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83070];
  v25 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v24[0] = v6;
  v24[1] = v11;
  v24[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Andromeda"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (int64_t)sideButtonBehavior
{
  return self->_sideButtonBehavior;
}

- (void)setSideButtonBehavior:(int64_t)a3
{
  self->_sideButtonBehavior = a3;
}

- (SBAlwaysOnPolicySettings)policySettings
{
  return self->_policySettings;
}

- (void)setPolicySettings:(id)a3
{
  objc_storeStrong((id *)&self->_policySettings, a3);
}

- (SBAlwaysOnAPLSettings)aplSettings
{
  return self->_aplSettings;
}

- (void)setAplSettings:(id)a3
{
  objc_storeStrong((id *)&self->_aplSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aplSettings, 0);
  objc_storeStrong((id *)&self->_policySettings, 0);
}

@end
