@implementation PXContentPrivacySettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXContentPrivacySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXContentPrivacySettings setSimulationMode:](self, "setSimulationMode:", 0);
  -[PXContentPrivacySettings setSimulatedAuthenticationType:](self, "setSimulatedAuthenticationType:", 0);
  -[PXContentPrivacySettings setShouldAlwaysShowUnlockButtonInContentUnavailableViews:](self, "setShouldAlwaysShowUnlockButtonInContentUnavailableViews:", 0);
  -[PXContentPrivacySettings setAuthenticationBehaviorUponAppearing:](self, "setAuthenticationBehaviorUponAppearing:", 0);
}

- (void)setSimulationMode:(int64_t)a3
{
  self->_simulationMode = a3;
}

- (void)setSimulatedAuthenticationType:(int64_t)a3
{
  self->_simulatedAuthenticationType = a3;
}

- (void)setShouldAlwaysShowUnlockButtonInContentUnavailableViews:(BOOL)a3
{
  self->_shouldAlwaysShowUnlockButtonInContentUnavailableViews = a3;
}

- (void)setAuthenticationBehaviorUponAppearing:(int64_t)a3
{
  self->_authenticationBehaviorUponAppearing = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)contentPrivacyEnabled
{
  if (-[PXContentPrivacySettings simulationMode](self, "simulationMode"))
    return -[PXContentPrivacySettings simulationMode](self, "simulationMode") == 1;
  else
    return PLIsContentPrivacyEnabled();
}

- (int64_t)simulationMode
{
  return self->_simulationMode;
}

- (int64_t)simulatedAuthenticationType
{
  return self->_simulatedAuthenticationType;
}

- (BOOL)shouldAlwaysShowUnlockButtonInContentUnavailableViews
{
  return self->_shouldAlwaysShowUnlockButtonInContentUnavailableViews;
}

- (int64_t)authenticationBehaviorUponAppearing
{
  return self->_authenticationBehaviorUponAppearing;
}

+ (PXContentPrivacySettings)sharedInstance
{
  if (sharedInstance_onceToken_190990 != -1)
    dispatch_once(&sharedInstance_onceToken_190990, &__block_literal_global_190991);
  return (PXContentPrivacySettings *)(id)sharedInstance_sharedInstance_190992;
}

void __42__PXContentPrivacySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentPrivacySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_190992;
  sharedInstance_sharedInstance_190992 = v0;

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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v26 = (void *)MEMORY[0x1E0D830B8];
  v2 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_simulationMode);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:valueKeyPath:", CFSTR("Enablement Simulation"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "possibleValues:titles:", &unk_1E53EABF0, &unk_1E53EAC08);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v3;
  v4 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_simulatedAuthenticationType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Auth Type Simulation"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possibleValues:titles:", &unk_1E53EAC20, &unk_1E53EAC38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v7;
  v8 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_authenticationBehaviorUponAppearing);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Authentication on Appearance"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "possibleValues:titles:", &unk_1E53EAC50, &unk_1E53EAC68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v11;
  v12 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_shouldAlwaysShowUnlockButtonInContentUnavailableViews);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Always show Unlock Button"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:title:", v15, CFSTR("General"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v17 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:action:", CFSTR("Restore Defaults"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  v30[0] = v27;
  v30[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Content Privacy"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end
