@implementation PSWalletPolicyController

- (PSWalletPolicyController)initWithBundleIdentifier:(id)a3
{
  id v5;
  PSWalletPolicyController *v6;
  PSWalletPolicyController *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  NSObject *privacyController;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSWalletPolicyController;
  v6 = -[PSWalletPolicyController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v8 = (void *)getFKPrivacySettingsControllerClass_softClass;
    v18 = getFKPrivacySettingsControllerClass_softClass;
    if (!getFKPrivacySettingsControllerClass_softClass)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __getFKPrivacySettingsControllerClass_block_invoke;
      v14[3] = &unk_1E4A65650;
      v14[4] = &v15;
      __getFKPrivacySettingsControllerClass_block_invoke((uint64_t)v14);
      v8 = (void *)v16[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v15, 8);
    v10 = objc_msgSend([v9 alloc], "initWithBundleIdentifier:", v7->_bundleIdentifier);
    privacyController = v7->_privacyController;
    v7->_privacyController = v10;

  }
  return v7;
}

- (id)walletAuthorizationType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject authorizationType](self->_privacyController, "authorizationType"));
}

- (id)specifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v4 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
  if ((objc_msgSend(v3, "containsObject:", self->_bundleIdentifier) & 1) != 0
    || objc_msgSend(v4, "containsObject:", self->_bundleIdentifier))
  {
    PSBundlePathForPreferenceBundle((uint64_t)CFSTR("Privacy/WalletPrivacySettings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SFRuntimeAbsoluteFilePathForPath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      PS_LocalizedStringForSystemPolicy(CFSTR("WALLET"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_walletAuthorizationType, objc_msgSend(v7, "classNamed:", CFSTR("WalletPrivacySettings.FinanceDataAuthorizationLevelController")), 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setProperty:forKey:", self->_bundleIdentifier, CFSTR("bundleID"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "userInterfaceIdiom"))
        v11 = CFSTR("com.apple.PassbookStub");
      else
        v11 = CFSTR("com.apple.Passbook");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("appIDForLazyIcon"));

      PS_LocalizedStringForSystemPolicy(CFSTR("WALLET_SELECTED_ACCOUNTS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      PS_LocalizedStringForSystemPolicy(CFSTR("WALLET_NO_ACCOUNTS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValues:titles:", &unk_1E4A92DC0, v14);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
}

@end
