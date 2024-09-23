@implementation STPasscodeGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 listController:(id)a4
{
  id v5;
  id *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___STPasscodeGroupSpecifierProvider;
  v5 = a4;
  objc_msgSendSuper2(&v8, sel_providerWithCoordinator_, a3);
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v6 + 7, v5);

  return v6;
}

- (STPasscodeGroupSpecifierProvider)init
{
  STPasscodeGroupSpecifierProvider *v2;
  STPasscodeGroupSpecifierProvider *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STPasscodeGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl())
      v5 = CFSTR("LockScreenTimeSettingsButtonName");
    else
      v5 = CFSTR("EnableScreenTimePasscodeButtonName");
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, v3, 0, 0, 0, 13, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75C60]);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24DBBE9D0, *MEMORY[0x24BE75E18]);
    -[STPasscodeGroupSpecifierProvider setTogglePasscodeSpecifier:](v3, "setTogglePasscodeSpecifier:", v7);
    -[STGroupSpecifierProvider mutableSpecifiers](v3, "mutableSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STPasscodeGroupSpecifierProvider togglePasscodeSpecifier](v3, "togglePasscodeSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerObserver:", v3);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STPasscodeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v5, sel_invalidate);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STPasscodeGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v8;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("passcodeEnabled"), "STPasscodeGroupSpecifierProviderObservationContext");
  if (_os_feature_enabled_impl())
    v6 = CFSTR("viewModel.canEditScreenTimePasscode");
  else
    v6 = CFSTR("viewModel.canStopScreenTime");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v6, "STPasscodeGroupSpecifierProviderObservationContext");
  v8.receiver = self;
  v8.super_class = (Class)STPasscodeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v8, sel_setCoordinator_, v4);
  if (_os_feature_enabled_impl())
    v7 = CFSTR("viewModel.canEditScreenTimePasscode");
  else
    v7 = CFSTR("viewModel.canStopScreenTime");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v7, 4, "STPasscodeGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("passcodeEnabled"), 4, "STPasscodeGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  if (a6 != "STPasscodeGroupSpecifierProviderObservationContext")
  {
    v18.receiver = self;
    v18.super_class = (Class)STPasscodeGroupSpecifierProvider;
    -[STPasscodeGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.canEditScreenTimePasscode")))
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "canEditScreenTimePasscode") ^ 1;
      if (v12 == 2)
        v16 = 1;
      else
        v16 = v15;
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v16);

      goto LABEL_12;
    }
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.canStopScreenTime")))
    {
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v17, "canStopScreenTime") ^ 1);

LABEL_12:
      goto LABEL_15;
    }
  }
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("passcodeEnabled")))
    -[STPasscodeGroupSpecifierProvider reloadTogglePasscodeSpecifier](self, "reloadTogglePasscodeSpecifier");
LABEL_15:

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canEditScreenTimePasscode") ^ 1;
    if (v6 == 2)
      v9 = 1;
    else
      v9 = v8;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v9);

  }
}

- (void)reloadTogglePasscodeSpecifier
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[5];

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasscodeEnabled");
  -[STPasscodeGroupSpecifierProvider togglePasscodeSpecifier](self, "togglePasscodeSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ChangeScreenTimePasscodeButtonName"), &stru_24DB8A1D0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v8);

    objc_msgSend(v5, "removePropertyForKey:", *MEMORY[0x24BE75C60]);
    objc_msgSend(v5, "removePropertyForKey:", *MEMORY[0x24BE75E18]);
    objc_msgSend(v5, "setEditPaneClass:", 0);
    objc_msgSend(v5, "setTarget:", self);
    objc_msgSend(v5, "setButtonAction:", sel_changeOrRemovePasscode_);
  }
  else
  {
    if (_os_feature_enabled_impl())
      v9 = CFSTR("LockScreenTimeSettingsButtonName");
    else
      v9 = CFSTR("EnableScreenTimePasscodeButtonName");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v10);

    objc_msgSend(v5, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75C60]);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24DBBE9D0, *MEMORY[0x24BE75E18]);
  }
  objc_msgSend(v3, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "me");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "needsRecoveryAppleID");

  if (!v15)
  {
    objc_msgSend(v5, "removePropertyForKey:", 0x24DB91050);
    objc_msgSend(v5, "removePropertyForKey:", 0x24DB90BB0);
    if (!v4)
      goto LABEL_9;
LABEL_11:
    -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
    goto LABEL_12;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91050);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__STPasscodeGroupSpecifierProvider_reloadTogglePasscodeSpecifier__block_invoke;
  aBlock[3] = &unk_24DB87580;
  aBlock[4] = self;
  v16 = _Block_copy(aBlock);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, 0x24DB90BB0);

  if (v4)
    goto LABEL_11;
LABEL_9:
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EnableScreenTimePasscodeFooterText"), &stru_24DB8A1D0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75A68]);

LABEL_12:
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v19, 1);

}

uint64_t __65__STPasscodeGroupSpecifierProvider_reloadTogglePasscodeSpecifier__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptForRecoveryAppleIDWithPINController:passcode:", a2, a3);
}

- (void)changeOrRemovePasscode:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  _QWORD v65[2];
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  STPasscodeGroupSpecifierProvider *v70;
  uint64_t v71;
  char v72;
  _QWORD v73[4];
  id v74;
  id v75;
  STPasscodeGroupSpecifierProvider *v76;
  _QWORD v77[5];
  _QWORD v78[4];
  id v79;
  STPasscodeGroupSpecifierProvider *v80;
  char v81;
  _QWORD aBlock[6];

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isRemotelyManagedUserWithPasscode");
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sf_isiPad");

  v57 = v9;
  if (v6)
  {
    if (v9)
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ChangePasscodeAlertTitle"), &stru_24DB8A1D0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ChangeScreenTimePasscodeConfirmPrompt"), &stru_24DB8A1D0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v12, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)MEMORY[0x24BE75590];
  if (_os_feature_enabled_impl())
    v14 = CFSTR("LockScreenTimeSettingsButtonName");
  else
    v14 = CFSTR("EnableScreenTimePasscodeButtonName");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v14, &stru_24DB8A1D0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "me");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "needsRecoveryAppleID"))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75C60]);

    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91050);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke;
    aBlock[3] = &unk_24DB87580;
    aBlock[4] = self;
    v20 = _Block_copy(aBlock);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, 0x24DB90BD0);

  }
  v58 = v9;
  if (!objc_msgSend(v17, "canRecoveryAuthenticate"))
    goto LABEL_15;
  v21 = MEMORY[0x24BDAC760];
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2;
  v78[3] = &unk_24DB875F8;
  v81 = v9;
  v79 = v17;
  v80 = self;
  v22 = _Block_copy(v78);

  if (v22)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ForgotPasscodeButtonTitle"), &stru_24DB8A1D0, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v77[0] = v21;
    v77[1] = 3221225472;
    v77[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_71;
    v77[3] = &unk_24DB87620;
    v77[4] = self;
    v62 = v11;
    v24 = v7;
    v25 = v6;
    v26 = _Block_copy(v77);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, 0x24DB91070);
    v27 = _Block_copy(v22);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, 0x24DB91090);

    v28 = _Block_copy(v26);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, 0x24DB90BF0);

    v29 = v26;
    v6 = v25;
    v7 = v24;
    v11 = v62;
    v30 = v22;
  }
  else
  {
LABEL_15:
    v30 = 0;
    v23 = 0;
    v29 = 0;
  }
  v61 = (void *)v23;
  v63 = v17;
  v59 = v30;
  v60 = v29;
  -[STPasscodeGroupSpecifierProvider _removePasscodeActionWithPINOptionsTitle:pinOptionsHandler:pinValidationHandler:](self, "_removePasscodeActionWithPINOptionsTitle:pinOptionsHandler:pinValidationHandler:", v23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ChangeScreenTimePasscodeButtonName"), &stru_24DB8A1D0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v56 = v5;
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_74;
    v73[3] = &unk_24DB86840;
    v34 = v7;
    v74 = v34;
    v75 = v16;
    v76 = self;
    objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 0, v73);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v35);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "viewModel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "me");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = v16;
    if (v39)
    {
      v40 = (void *)objc_opt_new();
      objc_msgSend(v38, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "personNameComponentsFromString:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "givenName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v43 = 0;
    }
    v47 = 0x24BEBD000uLL;
    v48 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("TurnOffScreenTimePasscodeButtonName"), &stru_24DB8A1D0, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_91;
    v66[3] = &unk_24DB87698;
    v67 = v43;
    v72 = v58;
    v68 = v34;
    v71 = v57;
    v69 = v31;
    v70 = self;
    v50 = v43;
    objc_msgSend(v48, "actionWithTitle:style:handler:", v49, 2, v66);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v51);

    v46 = v55;
    v5 = v56;
    v44 = &v74;
  }
  else
  {
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_101;
    v64[3] = &unk_24DB868F8;
    v44 = (id *)v65;
    v65[0] = v16;
    v65[1] = self;
    objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 0, v64);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v45);

    objc_msgSend(v11, "addAction:", v31);
    v46 = v16;
    v47 = 9863680000;
  }

  v52 = *(void **)(v47 + 936);
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "actionWithTitle:style:handler:", v53, 1, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v54);

  -[STGroupSpecifierProvider presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptForRecoveryAppleIDWithPINController:passcode:", a2, a3);
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isBlocked") && !*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "recoveryAltDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("EnterRecoveryAppleIDAlertReason");
  if (!v8)
    v9 = CFSTR("EnterAppleIDAlertReason");
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 40), "_authenticationContextWithReasonKey:presentingViewController:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAppProvidedContext:", CFSTR("recovery"));
  v12 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3;
  v15[3] = &unk_24DB875D0;
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v18 = v6;
  v19 = *(_BYTE *)(a1 + 48);
  v13 = v6;
  v14 = v5;
  objc_msgSend(v12, "authenticateWithContext:completion:", v11, v15);

}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4;
  v10[3] = &unk_24DB875A8;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(_BYTE *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v10);

}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 8), "recoveryAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "altDSID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = (id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 48), "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE0AB28]))
    v10 = objc_msgSend(*v8, "code") == -7003;
  else
    v10 = 0;

  if (*v8 || !objc_msgSend(v3, "isEqual:", v7))
  {
    if (!v10)
    {
      if (*v8)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_3();
      }
      else if (v3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_2((uint64_t)v3, (uint64_t)v7);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_1();
      }
      objc_msgSend(*(id *)(a1 + 56), "recoveryAuthenticationFailed:", *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "setPasscodeOptionsTitle:", 0);
    objc_msgSend(*(id *)(a1 + 56), "setPasscodeOptionsHandler:", 0);
    v11 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "passcode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recoveryAuthenticationSucceededForPasscode:", v12);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "isBlocked") && !*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInteractionEnabled:", 0);

  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "sf_isiPad");

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 56), "pane");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deactivateKeypadView");
    objc_msgSend(v16, "activateKeypadView");

  }
}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "validatePIN:", v7);

  if ((_DWORD)v9)
  {
    objc_msgSend(v5, "setPasscodeOptionsTitle:", 0);
    objc_msgSend(v5, "setPasscodeOptionsHandler:", 0);
  }

  return v9;
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_74(id *a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v2 = (void *)objc_opt_new();
  v14 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, &v14);
  v4 = v14;
  if (v3)
  {
    objc_msgSend(a1[4], "localizedStringForKey:value:table:", CFSTR("BiometricAuthenticationTitle"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOptionAuthenticationTitle:", v5);

    objc_msgSend(a1[4], "localizedStringForKey:value:table:", CFSTR("BiometricAuthenticationDetailText"), &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3_80;
    v11[3] = &unk_24DB87670;
    v7 = a1[5];
    v8 = a1[6];
    v12 = v7;
    v13 = v8;
    objc_msgSend(v2, "evaluatePolicy:localizedReason:reply:", 1, v6, v11);

  }
  else
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75C60]);

    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", &unk_24DBBE9E8, *MEMORY[0x24BE75E18]);
    objc_msgSend(a1[6], "showPINSheet:completion:", a1[5], 0);
  }

}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_3_80(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_81;
  v10[3] = &unk_24DB87648;
  v14 = a2;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v13 = v5;
  v9 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v10);

}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_81(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  id *v8;
  void *v9;
  int v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE75C60]);

    v4 = *(void **)(a1 + 32);
    v5 = *MEMORY[0x24BE75E18];
    v6 = &unk_24DBBE9D0;
LABEL_3:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
    return objc_msgSend(*(id *)(a1 + 40), "showPINSheet:completion:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    v8 = (id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 48), "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDDA908]);

    if (v10)
    {
      result = objc_msgSend(*v8, "code");
      switch(result)
      {
        case -9:
        case -4:
        case -2:
          return result;
        case -5:
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75C60]);

          v4 = *(void **)(a1 + 32);
          v5 = *MEMORY[0x24BE75E18];
          v6 = &unk_24DBBE9E8;
          goto LABEL_3;
        default:
          objc_msgSend(*(id *)(a1 + 32), "setButtonAction:", sel__setManagedPasscode);
          NSStringFromClass(+[STDevicePINFactory devicePINControllerForPlatform](STDevicePINFactory, "devicePINControllerForPlatform"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75C60]);

          v4 = *(void **)(a1 + 32);
          v5 = *MEMORY[0x24BE75E18];
          v6 = &unk_24DBBEA00;
          goto LABEL_3;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_81_cold_1();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75C60]);

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_24DBBE9E8, *MEMORY[0x24BE75E18]);
      return objc_msgSend(*(id *)(a1 + 40), "showPINSheet:completion:", *(_QWORD *)(a1 + 32), 0);
    }
  }
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_91(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", CFSTR("TurnOffScreenTimePasscodeSecondConfirmPrompt"), &stru_24DB8A1D0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringWithFormat:", v3, *(_QWORD *)(a1 + 32));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", CFSTR("TurnOffScreenTimePasscodeGenericSecondConfirmPrompt"), &stru_24DB8A1D0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", CFSTR("TurnOffPasscodeAlertTitle"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v4, v9, *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", *(_QWORD *)(a1 + 48));
  v6 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  objc_msgSend(*(id *)(a1 + 56), "presentViewController:animated:completion:", v5, 1, 0);
}

uint64_t __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_2_101(uint64_t a1)
{
  objc_class *v2;
  void *v3;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE75C60]);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_24DBBE9E8, *MEMORY[0x24BE75E18]);
  return objc_msgSend(*(id *)(a1 + 40), "showPINSheet:completion:", *(_QWORD *)(a1 + 32), 0);
}

- (void)_promptForRecoveryAppleIDWithPINController:(id)a3 passcode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[STPasscodeGroupSpecifierProvider _authenticationContextWithReasonKey:presentingViewController:](self, "_authenticationContextWithReasonKey:presentingViewController:", CFSTR("RecoveryAppleIDAlertReason"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppProvidedContext:", CFSTR("setup"));
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertSkipButton"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCancelButtonString:", v10);

  v11 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke;
  v15[3] = &unk_24DB876E8;
  v15[4] = self;
  v16 = v7;
  v17 = v9;
  v18 = v6;
  v12 = v6;
  v13 = v9;
  v14 = v7;
  objc_msgSend(v11, "authenticateWithContext:completion:", v8, v15);

}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2;
  v11[3] = &unk_24DB876C0;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v11);

}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v2 = a1[4];
  objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1 + 6;
  v5 = a1[6];
  if (v5)
    v7 = 1;
  else
    v7 = v3 == 0;
  if (!v7)
  {
    v11 = a1[7];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3;
    v34[3] = &unk_24DB866E0;
    v35 = v2;
    v12 = v2;
    objc_msgSend(v4, "setPIN:recoveryAltDSID:completionHandler:", v11, v3, v34);
    v13 = v35;
    goto LABEL_22;
  }
  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE0AB28]))
  {

    goto LABEL_10;
  }
  v9 = objc_msgSend(*v6, "code");

  if (v9 != -7003)
  {
LABEL_10:
    if (*v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_3();
    }
    else if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_cold_1();
    }
    v10 = CFSTR("RecoveryAppleIDUnknownError");
    goto LABEL_17;
  }
  v10 = CFSTR("RecoveryAppleIDAlertConfirmSkipTitle");
LABEL_17:
  objc_msgSend(a1[8], "localizedStringForKey:value:table:", v10, &stru_24DB8A1D0, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "me");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v4;
  v27 = v3;
  if ((objc_msgSend(v13, "isChild") & 1) != 0 || !objc_msgSend(v13, "type"))
    v15 = CFSTR("RecoveryAppleIDAlertConfirmSkipMessageChild");
  else
    v15 = CFSTR("RecoveryAppleIDAlertConfirmSkipMessage");
  objc_msgSend(a1[8], "localizedStringForKey:value:table:", v15, &stru_24DB8A1D0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v12, v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[8], "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertSkipButton"), &stru_24DB8A1D0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BEBD3A8];
  v19 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_115;
  v31[3] = &unk_24DB86840;
  v31[4] = a1[4];
  v32 = a1[7];
  v33 = v2;
  v20 = v2;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v17, 0, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v21);

  objc_msgSend(a1[8], "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertSetButton"), &stru_24DB8A1D0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BEBD3A8];
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3_119;
  v28[3] = &unk_24DB86840;
  v28[4] = a1[4];
  v29 = a1[9];
  v30 = a1[7];
  objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 1, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v24);

  objc_msgSend(a1[9], "presentViewController:animated:completion:", v16, 1, 0);
  v4 = v26;
  v3 = v27;
LABEL_22:

}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "listController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_115(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_116;
  v4[3] = &unk_24DB866E0;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "setPIN:completionHandler:", v3, v4);

}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_116(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "listController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_3_119(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptForRecoveryAppleIDWithPINController:passcode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_authenticationContextWithReasonKey:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setIsEphemeral:", 1);
  objc_msgSend(v7, "setAuthenticationType:", 2);
  objc_msgSend(v7, "setShouldPromptForPasswordOnly:", 1);
  objc_msgSend(v7, "_setProxiedAppName:", CFSTR("ScreenTime"));
  objc_msgSend(v7, "setPresentingViewController:", v5);

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertTitle"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setReason:", v10);
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultButtonString:", v11);

  return v7;
}

- (id)_removePasscodeActionWithPINOptionsTitle:(id)a3 pinOptionsHandler:(id)a4 pinValidationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  STPasscodeGroupSpecifierProvider *v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isRemotelyManagedUserWithPasscode"))
  {

    v16 = 0;
    goto LABEL_5;
  }
  v33 = 0;
  v15 = objc_msgSend(v12, "canEvaluatePolicy:error:", 2, &v33);
  v16 = v33;

  if (!v15)
  {
LABEL_5:
    v21 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TurnOffScreenTimePasscodeButtonName"), &stru_24DB8A1D0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_128;
    v24[3] = &unk_24DB87710;
    v24[4] = self;
    v25 = v11;
    v26 = v8;
    v27 = v9;
    v28 = v10;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 2, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v25;
    goto LABEL_6;
  }
  v17 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TurnOffScreenTimePasscodeButtonName"), &stru_24DB8A1D0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke;
  v29[3] = &unk_24DB86840;
  v30 = v12;
  v31 = v11;
  v32 = self;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 2, v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v30;
LABEL_6:

  return v19;
}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;

  objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", CFSTR("BiometricAuthenticationTitle"), &stru_24DB8A1D0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOptionAuthenticationTitle:", v2);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", CFSTR("BiometricAuthenticationDetailText"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_2;
  v7[3] = &unk_24DB87670;
  v6 = *(int8x16_t *)(a1 + 40);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  objc_msgSend(v3, "evaluatePolicy:localizedReason:reply:", 1, v4, v7);

}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_3;
  v9[3] = &unk_24DB87648;
  v12 = a2;
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v9);

}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeManagedPasscode");
  }
  else
  {
    v2 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDDA908]);

    if (v4)
    {
      switch(objc_msgSend(*v2, "code"))
      {
        case -9:
        case -4:
        case -2:
          return;
        case -5:
          v5 = (void *)MEMORY[0x24BE75590];
          v6 = *(void **)(a1 + 48);
          if (_os_feature_enabled_impl())
            v7 = CFSTR("LockScreenTimeSettingsButtonName");
          else
            v7 = CFSTR("EnableScreenTimePasscodeButtonName");
          objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24DB8A1D0, 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, *(_QWORD *)(a1 + 32), 0, 0, 0, 13, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
          v25 = (id)objc_claimAutoreleasedReturnValue();

          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75C60]);

          v11 = *MEMORY[0x24BE75E18];
          v12 = &unk_24DBBEA18;
          goto LABEL_19;
        default:
          v20 = (void *)MEMORY[0x24BE75590];
          v21 = *(void **)(a1 + 48);
          if (_os_feature_enabled_impl())
            v22 = CFSTR("LockScreenTimeSettingsButtonName");
          else
            v22 = CFSTR("EnableScreenTimePasscodeButtonName");
          objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_24DB8A1D0, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, *(_QWORD *)(a1 + 32), 0, 0, 0, 13, objc_opt_class());
          v25 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "setButtonAction:", sel__removeManagedPasscode);
          NSStringFromClass(+[STDevicePINFactory devicePINControllerForPlatform](STDevicePINFactory, "devicePINControllerForPlatform"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE75C60]);

          v11 = *MEMORY[0x24BE75E18];
          v12 = &unk_24DBBEA00;
LABEL_19:
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v12, v11);
          objc_msgSend(*(id *)(a1 + 32), "showPINSheet:completion:", v25, 0);

          break;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_81_cold_1();
      v13 = (void *)MEMORY[0x24BE75590];
      v14 = *(void **)(a1 + 48);
      if (_os_feature_enabled_impl())
        v15 = CFSTR("LockScreenTimeSettingsButtonName");
      else
        v15 = CFSTR("EnableScreenTimePasscodeButtonName");
      objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24DB8A1D0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, *(_QWORD *)(a1 + 32), 0, 0, 0, 13, objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75C60]);

      objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_24DBBEA18, *MEMORY[0x24BE75E18]);
      objc_msgSend(*(id *)(a1 + 32), "showPINSheet:completion:", v17, 0);

    }
  }
}

void __116__STPasscodeGroupSpecifierProvider__removePasscodeActionWithPINOptionsTitle_pinOptionsHandler_pinValidationHandler___block_invoke_128(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (_os_feature_enabled_impl()
    && (objc_msgSend(*(id *)(a1 + 32), "coordinator"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "viewModel"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "canStopScreenTimeWithoutPasscode"),
        v3,
        v2,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeManagedPasscode");
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    if (_os_feature_enabled_impl())
      v6 = CFSTR("LockScreenTimeSettingsButtonName");
    else
      v6 = CFSTR("EnableScreenTimePasscodeButtonName");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_24DB8A1D0, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, *(_QWORD *)(a1 + 32), 0, 0, 0, 13, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75C60]);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24DBBEA18, *MEMORY[0x24BE75E18]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), 0x24DB91070);
    v10 = _Block_copy(*(const void **)(a1 + 56));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, 0x24DB91090);

    v11 = _Block_copy(*(const void **)(a1 + 64));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, 0x24DB90BF0);

    objc_msgSend(*(id *)(a1 + 32), "showPINSheet:completion:", v7, 0);
  }
}

- (void)_setManagedPasscode
{
  void *v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    v4 = CFSTR("LockScreenTimeSettingsButtonName");
  else
    v4 = CFSTR("EnableScreenTimePasscodeButtonName");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24DB8A1D0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 13, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75C60]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24DBBE9D0, *MEMORY[0x24BE75E18]);
  -[STGroupSpecifierProvider showPINSheet:completion:](self, "showPINSheet:completion:", v5, 0);

}

- (void)_removeManagedPasscode
{
  STPasscodeGroupSpecifierProvider *v2;
  void *v3;
  STPasscodeGroupSpecifierProvider *v4;
  _QWORD v5[4];
  STPasscodeGroupSpecifierProvider *v6;

  v2 = self;
  -[STRootGroupSpecifierProvider coordinator](v2, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke;
  v5[3] = &unk_24DB866E0;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "setPIN:recoveryAltDSID:completionHandler:", 0, 0, v5);

}

void __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHasAlreadyEnteredPINForSession:", 0);

  }
}

- (BOOL)isHidden
{
  objc_super v4;

  if ((objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)STPasscodeGroupSpecifierProvider;
  return -[STGroupSpecifierProvider isHidden](&v4, sel_isHidden);
}

- (PSSpecifier)togglePasscodeSpecifier
{
  return self->_togglePasscodeSpecifier;
}

- (void)setTogglePasscodeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_togglePasscodeSpecifier, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_togglePasscodeSpecifier, 0);
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, MEMORY[0x24BDACB70], v0, "Authenticated user without altDSID: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138478083;
  v3 = a1;
  v4 = 2113;
  v5 = a2;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "The authenticated altDSID %{private}@ does not match the recovery altDSID %{private}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], v0, "Failed to authenticate recovery Apple ID: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __59__STPasscodeGroupSpecifierProvider_changeOrRemovePasscode___block_invoke_4_81_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], v0, "LAContext failed to evaluate policy with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __88__STPasscodeGroupSpecifierProvider__promptForRecoveryAppleIDWithPINController_passcode___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, MEMORY[0x24BDACB70], v0, "Authenticated user without an altDSID: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "failed to remove pin: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
