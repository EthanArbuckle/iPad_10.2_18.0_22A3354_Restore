@implementation SBEntityRemovalAnimationSettings

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
  void *v17;
  void *v18;
  _QWORD v19[10];

  v19[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Medusa — Delete"), CFSTR("medusaDeleteIntentAnimationSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Medusa — Commit"), CFSTR("medusaCommitIntentAnimationSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Medusa — Decline"), CFSTR("medusaDeclineIntentAnimationSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Floating — Delete"), CFSTR("floatingDeleteIntentAnimationSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Floating — Commit"), CFSTR("floatingCommitIntentAnimationSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Floating — Decline"), CFSTR("floatingDeclineIntentAnimationSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("To Home Screen — Delete"), CFSTR("dosidoDeleteIntentAnimationSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("To Home Screen — Commit"), CFSTR("dosidoCommitIntentAnimationSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v9;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("To Home Screen — Decline"), CFSTR("dosidoDeclineIntentAnimationSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("App Scene Entity Removal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  v18 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("App Scene Entity Removal Animations"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (SBEntityRemovalMedusaDefaultAnimationSettings)medusaDeleteIntentAnimationSettings
{
  return self->_medusaDeleteIntentAnimationSettings;
}

- (void)setMedusaDeleteIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_medusaDeleteIntentAnimationSettings, a3);
}

- (SBEntityRemovalMedusaSlideOutUpwardAnimationSettings)medusaCommitIntentAnimationSettings
{
  return self->_medusaCommitIntentAnimationSettings;
}

- (void)setMedusaCommitIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_medusaCommitIntentAnimationSettings, a3);
}

- (SBEntityRemovalMedusaSlideOutDownwardAnimationSettings)medusaDeclineIntentAnimationSettings
{
  return self->_medusaDeclineIntentAnimationSettings;
}

- (void)setMedusaDeclineIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_medusaDeclineIntentAnimationSettings, a3);
}

- (SBEntityRemovalFloatingDefaultAnimationSettings)floatingDeleteIntentAnimationSettings
{
  return self->_floatingDeleteIntentAnimationSettings;
}

- (void)setFloatingDeleteIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDeleteIntentAnimationSettings, a3);
}

- (SBEntityRemovalFloatingSlideOutUpwardAnimationSettings)floatingCommitIntentAnimationSettings
{
  return self->_floatingCommitIntentAnimationSettings;
}

- (void)setFloatingCommitIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_floatingCommitIntentAnimationSettings, a3);
}

- (SBEntityRemovalFloatingSlideOutDownwardAnimationSettings)floatingDeclineIntentAnimationSettings
{
  return self->_floatingDeclineIntentAnimationSettings;
}

- (void)setFloatingDeclineIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDeclineIntentAnimationSettings, a3);
}

- (SBEntityRemovalDosidoDefaultAnimationSettings)dosidoDeleteIntentAnimationSettings
{
  return self->_dosidoDeleteIntentAnimationSettings;
}

- (void)setDosidoDeleteIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoDeleteIntentAnimationSettings, a3);
}

- (SBEntityRemovalDosidoSlideOutUpwardAnimationSettings)dosidoCommitIntentAnimationSettings
{
  return self->_dosidoCommitIntentAnimationSettings;
}

- (void)setDosidoCommitIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoCommitIntentAnimationSettings, a3);
}

- (SBEntityRemovalDosidoSlideOutDownwardAnimationSettings)dosidoDeclineIntentAnimationSettings
{
  return self->_dosidoDeclineIntentAnimationSettings;
}

- (void)setDosidoDeclineIntentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoDeclineIntentAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dosidoDeclineIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dosidoCommitIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dosidoDeleteIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_floatingDeclineIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_floatingCommitIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_floatingDeleteIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaDeclineIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaCommitIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaDeleteIntentAnimationSettings, 0);
}

@end
