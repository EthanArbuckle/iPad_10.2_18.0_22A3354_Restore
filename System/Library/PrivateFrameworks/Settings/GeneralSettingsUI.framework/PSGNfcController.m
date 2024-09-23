@implementation PSGNfcController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterEventListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSGNfcController;
  -[PSGNfcController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerEventListener:", self);
  -[PSGNfcController setHwState:](self, "setHwState:", objc_msgSend(v3, "getHwSupport"));
  v4.receiver = self;
  v4.super_class = (Class)PSGNfcController;
  -[PSGNfcController viewDidLoad](&v4, sel_viewDidLoad);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/NFC_LINK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithKey:table:locale:bundleURL:", CFSTR("NFC"), CFSTR("General"), v7, v9);

  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGNfcController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.contactless-and-nfc"), v10, v12, v5);

  v13.receiver = self;
  v13.super_class = (Class)PSGNfcController;
  -[PSGNfcController viewDidAppear:](&v13, sel_viewDidAppear_, v3);

}

- (id)specifiers
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  PSSpecifier *v13;
  PSSpecifier *groupSpecifier;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  uint8_t buf[2];

  -[PSGNfcController _updateHwStateChange](self, "_updateHwStateChange");
  v3 = -[PSGNfcController hwState](self, "hwState");
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  if (v5)
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("NFC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == 2)
    {
      if (!-[PSGNfcController restrictedFeature](self, "restrictedFeature"))
      {
        v17 = *MEMORY[0x24BE75A18];
        v18 = MEMORY[0x24BDBD1C8];
        goto LABEL_12;
      }
      _PSGLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        v8 = "NFC feature not allowed";
        v9 = (uint8_t *)&v21;
LABEL_9:
        _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else
    {
      _PSGLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "NFC hardware not ready";
        v9 = buf;
        goto LABEL_9;
      }
    }

    v17 = *MEMORY[0x24BE75A18];
    v18 = MEMORY[0x24BDBD1C0];
LABEL_12:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v17, v21);
    goto LABEL_13;
  }
  v10 = v3 == 2;
  -[PSGNfcController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Nfc"), self);
  v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v11;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "specifierForID:", CFSTR("NFC_GROUP_ID"));
  v13 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  groupSpecifier = self->_groupSpecifier;
  self->_groupSpecifier = v13;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "specifierForID:", CFSTR("NFC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGNfcController setRestrictedFeature:](self, "setRestrictedFeature:", objc_msgSend(v15, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE63A18]));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10 & ~-[PSGNfcController restrictedFeature](self, "restrictedFeature"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75A18]);

  -[PSGNfcController _refreshFooterForSpecifier:](self, "_refreshFooterForSpecifier:", self->_groupSpecifier);
LABEL_13:
  v19 = *(id *)((char *)&self->super.super.super.super.super.isa + v4);

  return v19;
}

- (id)nfcEnable
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v14;
  uint64_t v15;

  if (-[PSGNfcController hwState](self, "hwState") == 2)
  {
    objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v2, "getRadioEnabledState:", &v15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      _PSGLoggingFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[PSGNfcController nfcEnable].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = 0;
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = v15 == 1;
    }
    objc_msgSend(v11, "numberWithBool:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_refreshNfcRadioStateSetting
{
  id v3;

  -[PSGNfcController specifierForID:](self, "specifierForID:", CFSTR("NFC"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGNfcController reloadSpecifier:](self, "reloadSpecifier:", v3);

}

- (BOOL)_setNfcEnable:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRadioEnabledSetting:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _PSGLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PSGNfcController _setNfcEnable:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v5 == 0;
}

- (void)_enableNfcRadio
{
  -[PSGNfcController _setNfcEnable:](self, "_setNfcEnable:", 1);
  -[PSGNfcController _refreshNfcRadioStateSetting](self, "_refreshNfcRadioStateSetting");
}

- (void)_disableNfcRadio
{
  -[PSGNfcController _setNfcEnable:](self, "_setNfcEnable:", 0);
  -[PSGNfcController _refreshNfcRadioStateSetting](self, "_refreshNfcRadioStateSetting");
}

- (void)setNfcEnable:(id)a3 specifier:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  _PSGLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 1024;
    v26 = v7;
    _os_log_impl(&dword_22E024000, v8, OS_LOG_TYPE_DEFAULT, "Specifier=%{public}@, Enable=%d", buf, 0x12u);
  }

  if ((v7 & 1) != 0)
  {
    -[PSGNfcController _enableNfcRadio](self, "_enableNfcRadio");
  }
  else
  {
    v9 = (void *)MEMORY[0x24BEBD3B0];
    PSG_LocalizedStringForNFC(CFSTR("NFC_RADIO_DISABLE_CONFIRMATION_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PSG_LocalizedStringForNFC(CFSTR("NFC_RADIO_DISABLE_CONFIRMATION_DESCRIPTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BEBD3A8];
    PSG_LocalizedStringForNFC(CFSTR("NFC_RADIO_DISABLE_CONFIRMATION_OK"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __43__PSGNfcController_setNfcEnable_specifier___block_invoke;
    v22[3] = &unk_24F9C7E48;
    v22[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v16);

    v17 = (void *)MEMORY[0x24BEBD3A8];
    PSG_LocalizedStringForNFC(CFSTR("NFC_RADIO_DISABLE_CONFIRMATION_CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __43__PSGNfcController_setNfcEnable_specifier___block_invoke_2;
    v21[3] = &unk_24F9C7E48;
    v21[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v19);

    _PSGLoggingFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v20, OS_LOG_TYPE_DEFAULT, "Showing confirmation for NFC radio disable.", buf, 2u);
    }

    -[PSGNfcController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

uint64_t __43__PSGNfcController_setNfcEnable_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableNfcRadio");
}

uint64_t __43__PSGNfcController_setNfcEnable_specifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshNfcRadioStateSetting");
}

- (void)_refreshFooterForSpecifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = a3;
  objc_msgSend(v4, "stringWithString:", CFSTR("NFC_FOOTER_BASE"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForNFC(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);

  -[PSGNfcController reloadSpecifier:](self, "reloadSpecifier:", v5);
}

- (void)_updateHwStateChange
{
  id v3;

  if (-[PSGNfcController hwState](self, "hwState") != 4 && -[PSGNfcController hwState](self, "hwState") != 2)
  {
    objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PSGNfcController setHwState:](self, "setHwState:", objc_msgSend(v3, "getHwSupport"));

  }
}

- (void)didChangeRadioState:(BOOL)a3
{
  _QWORD block[4];
  id v5;
  BOOL v6;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__PSGNfcController_didChangeRadioState___block_invoke;
  block[3] = &unk_24F9C8888;
  objc_copyWeak(&v5, &location);
  v6 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__PSGNfcController_didChangeRadioState___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "specifierForID:", CFSTR("NFC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSpecifier:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  objc_msgSend(v9, "control");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setOn:", *(unsigned __int8 *)(a1 + 40));
}

- (void)hardwareStateDidChange
{
  unsigned int v3;
  _QWORD block[5];

  v3 = -[PSGNfcController hwState](self, "hwState");
  -[PSGNfcController _updateHwStateChange](self, "_updateHwStateChange");
  if (v3 != 4 && v3 != -[PSGNfcController hwState](self, "hwState"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__PSGNfcController_hardwareStateDidChange__block_invoke;
    block[3] = &unk_24F9C7C88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __42__PSGNfcController_hardwareStateDidChange__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "specifierForID:", CFSTR("NFC"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "hwState") == 2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2 & ~objc_msgSend(*(id *)(a1 + 32), "restrictedFeature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE75A18]);

  objc_msgSend(*(id *)(a1 + 32), "_refreshNfcRadioStateSetting");
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (unsigned)hwState
{
  return self->_hwState;
}

- (void)setHwState:(unsigned int)a3
{
  self->_hwState = a3;
}

- (BOOL)restrictedFeature
{
  return self->_restrictedFeature;
}

- (void)setRestrictedFeature:(BOOL)a3
{
  self->_restrictedFeature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

- (void)nfcEnable
{
  OUTLINED_FUNCTION_0_2(&dword_22E024000, a2, a3, "Fetch NFC status error: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_setNfcEnable:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_22E024000, a2, a3, "Setting NFC status error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
