@implementation PSGSoftwareVersionController

- (PSGSoftwareVersionController)init
{
  PSGSoftwareVersionController *v2;
  PSGSoftwareVersionController *v3;
  _QWORD block[4];
  PSGSoftwareVersionController *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSGSoftwareVersionController;
  v2 = -[PSGSoftwareVersionController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__PSGSoftwareVersionController_init__block_invoke;
    block[3] = &unk_24F9C7C88;
    v6 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v3;
}

void __36__PSGSoftwareVersionController_init__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "table");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)viewDidLoad
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSGSoftwareVersionController;
  -[PSGSoftwareVersionController viewDidLoad](&v4, sel_viewDidLoad);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PSGSoftwareVersionController_viewDidLoad__block_invoke;
  block[3] = &unk_24F9C7C88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __43__PSGSoftwareVersionController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "table");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)PSGSoftwareVersionController;
  -[PSGSoftwareVersionController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/About/SOFTWARE_UPDATE_LINK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("SOFTWARE_UPDATE"), CFSTR("General"), v6, v8);

  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDD19B8], "general_aboutPaneComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGSoftwareVersionController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.about-current-device"), v9, v12, v4);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  SUManagerClient *v6;
  SUManagerClient *suClient;
  SUDocumentationData *v8;
  SUDocumentationData *osDocumentationData;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SUDocumentationData *v14;
  SUDocumentationData *splatDocumentationData;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t v22[16];

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PSGSoftwareVersionController specifier](self, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyForKey:", CFSTR("SUManagerClient"));
    v6 = (SUManagerClient *)objc_claimAutoreleasedReturnValue();
    suClient = self->_suClient;
    self->_suClient = v6;

    -[SUManagerClient setDelegate:](self->_suClient, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BEAEC88], "documentationDataForInstalledUpdateType:error:", 0, 0);
    v8 = (SUDocumentationData *)objc_claimAutoreleasedReturnValue();
    osDocumentationData = self->_osDocumentationData;
    self->_osDocumentationData = v8;

    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PSGSoftwareVersionController osUpdateDetailGroup](self, "osUpdateDetailGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    -[PSGSoftwareVersionController osUpdateDetailCellSpecifier](self, "osUpdateDetailCellSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    -[PSGSoftwareVersionController osUpdateLearnMoreButton](self, "osUpdateLearnMoreButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v10, "addObject:", v13);
    if (-[SUManagerClient isSplatOnlyUpdateInstalled](self->_suClient, "isSplatOnlyUpdateInstalled"))
    {
      objc_msgSend(MEMORY[0x24BEAEC88], "documentationDataForInstalledUpdateType:error:", 1, 0);
      v14 = (SUDocumentationData *)objc_claimAutoreleasedReturnValue();
      splatDocumentationData = self->_splatDocumentationData;
      self->_splatDocumentationData = v14;

      -[PSGSoftwareVersionController splatUpdateDetailGroup](self, "splatUpdateDetailGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v16);

      -[PSGSoftwareVersionController splatUpdateDetailCellSpecifier](self, "splatUpdateDetailCellSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);

      -[PSGSoftwareVersionController splatUpdateLearnMoreButton](self, "splatUpdateLearnMoreButton");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v10, "addObject:", v18);
      if (-[SUManagerClient isSplatOnlyUpdateRollbackAllowed:](self->_suClient, "isSplatOnlyUpdateRollbackAllowed:", 0))
      {
        -[PSGSoftwareVersionController splatRollbackButton](self, "splatRollbackButton");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v10, "addObject:", v19);

      }
    }
    else
    {
      _PSGLoggingFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_22E024000, v18, OS_LOG_TYPE_DEFAULT, "Cryptex-only content not installed", v22, 2u);
      }
    }

    v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v10;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)osUpdateDetailGroup
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE75590];
  PSG_LocalizedString(CFSTR("OS Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSpecifierWithID:name:", CFSTR("OS_VERSION_GROUP"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)osUpdateDetailCellSpecifier
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", CFSTR("OS_VERSION_CELL"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v3, "setProperty:forKey:", &unk_24F9D4380, CFSTR("OSUpdateType"));
  objc_msgSend(v3, "setProperty:forKey:", self->_suClient, CFSTR("SUManagerClient"));
  objc_msgSend(v3, "setProperty:forKey:", self->_osDocumentationData, CFSTR("SUDocumentationData"));
  objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v3;
}

- (id)osUpdateLearnMoreButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUDocumentationData readme](self->_osDocumentationData, "readme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForGeneral(CFSTR("LEARN_MORE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setButtonAction:", sel_osLearnMoreTapped);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)splatUpdateDetailGroup
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE75590];
  PSG_LocalizedStringForGeneral(CFSTR("SECURITY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSpecifierWithID:name:", CFSTR("SPLAT_VERSION_GROUP"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)splatUpdateDetailCellSpecifier
{
  void *v3;
  id WeakRetained;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, WeakRetained, 0, 0, 0, -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SPLAT_VERSION_CELL"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "setProperty:forKey:", &unk_24F9D4398, CFSTR("OSUpdateType"));
  objc_msgSend(v5, "setProperty:forKey:", self->_suClient, CFSTR("SUManagerClient"));
  objc_msgSend(v5, "setProperty:forKey:", self->_splatDocumentationData, CFSTR("SUDocumentationData"));
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v5;
}

- (id)splatUpdateLearnMoreButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUDocumentationData readme](self->_splatDocumentationData, "readme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForGeneral(CFSTR("LEARN_MORE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setButtonAction:", sel_splatLearnMoreTapped);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)splatRollbackButton
{
  SUManagerClient *suClient;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SUManagerClient *v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  suClient = self->_suClient;
  v13 = 0;
  v4 = -[SUManagerClient isSplatOnlyUpdateRollbackAllowed:](suClient, "isSplatOnlyUpdateRollbackAllowed:", &v13);
  v5 = v13;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForGeneral(CFSTR("REMOVE_SECURITY_RESPONSE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteButtonSpecifierWithName:target:action:", v7, self, sel_removeSecurityResponse);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setProperty:forKey:", &unk_24F9D4398, *MEMORY[0x24BE75860]);
    objc_msgSend(v8, "setProperty:forKey:", CFSTR("ROLLBACK_BUTTON"), *MEMORY[0x24BE75AC0]);
    v9 = self->_suClient;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke;
    v12[3] = &unk_24F9C8860;
    v12[4] = self;
    -[SUManagerClient isRollingBack:](v9, "isRollingBack:", v12);
  }
  else
  {
    _PSGLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_22E024000, v10, OS_LOG_TYPE_DEFAULT, "Rollback not allowed: %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

void __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke_2;
    block[3] = &unk_24F9C7C88;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreparingRollback:", 1);
}

- (void)setPreparingRollback:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a3;
  -[PSGSoftwareVersionController specifierForID:](self, "specifierForID:", CFSTR("ROLLBACK_BUTTON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _PSGLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "No rollback button found", v10, 2u);
    }

  }
  if (v3)
    v7 = CFSTR("PREPARING_REMOVAL");
  else
    v7 = CFSTR("REMOVE_SECURITY_RESPONSE");
  PSG_LocalizedStringForGeneral(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

  -[PSGSoftwareVersionController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v5, 1);
}

- (void)osLearnMoreTapped
{
  NSObject *v3;
  uint8_t v4[16];

  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "OS Learn More Tapped", v4, 2u);
  }

  -[PSGSoftwareVersionController presentLearnMoreSheetForDocumentationData:](self, "presentLearnMoreSheetForDocumentationData:", self->_osDocumentationData);
}

- (void)splatLearnMoreTapped
{
  NSObject *v3;
  uint8_t v4[16];

  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "Splat Learn More Tapped", v4, 2u);
  }

  -[PSGSoftwareVersionController presentLearnMoreSheetForDocumentationData:](self, "presentLearnMoreSheetForDocumentationData:", self->_splatDocumentationData);
}

- (void)presentLearnMoreSheetForDocumentationData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v4, "readme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithData:encoding:", v6, 4);

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BEAEF18]);
      objc_msgSend(v8, "setReleaseNotes:", v7);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
      objc_msgSend(v9, "setModalPresentationStyle:", 2);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_releaseNotesDonePressed_);
      objc_msgSend(v8, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRightBarButtonItem:", v10);

      -[PSGSoftwareVersionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    }
    else
    {
      _PSGLoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_22E024000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create release notes string", v13, 2u);
      }

    }
  }
  else
  {
    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "Unable to present learn more sheet with nil SUDocumentationData", buf, 2u);
    }
  }

}

- (void)releaseNotesDonePressed:(id)a3
{
  -[PSGSoftwareVersionController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)removeSecurityResponse
{
  NSObject *v3;
  id v4;
  SUManagerClient *suClient;
  _QWORD v6[5];
  uint8_t buf[16];

  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "Remove Security Reponse Tapped", buf, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x24BEAEC68]);
  objc_msgSend(v4, "setCancelActiveUpdate:", 1);
  objc_msgSend(v4, "setPromptForConsent:", 1);
  objc_msgSend(v4, "setPromptForPasscode:", 1);
  suClient = self->_suClient;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__PSGSoftwareVersionController_removeSecurityResponse__block_invoke;
  v6[3] = &unk_24F9C8860;
  v6[4] = self;
  -[SUManagerClient rollbackUpdateWithOptions:withResult:](suClient, "rollbackUpdateWithOptions:withResult:", v4, v6);

}

void __54__PSGSoftwareVersionController_removeSecurityResponse__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = objc_alloc(MEMORY[0x24BEAEC00]);
    v10 = (void *)objc_msgSend(v9, "initWithEventName:", *MEMORY[0x24BEAEE08]);
    objc_msgSend(v10, "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], CFSTR("PreferencesiOSVersionRemoveSecurityResponseTapped"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "submitSUAnalyticsEvent:", v10);

  }
  _PSGLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((a2 & 1) != 0)
    {
      v12 = CFSTR("completed successfully");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed. Error: %@"), v8);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138412290;
    v14 = v12;
    _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_DEFAULT, "rollback update %@", buf, 0xCu);
    if ((a2 & 1) == 0)

  }
}

- (void)client:(id)a3 rollbackDidStart:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PSGSoftwareVersionController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__PSGSoftwareVersionController_client_rollbackDidStart___block_invoke;
  v7[3] = &unk_24F9C7E70;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __56__PSGSoftwareVersionController_client_rollbackDidStart___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "Prefereces: rollback started: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setPreparingRollback:", 1);
}

- (void)client:(id)a3 rollbackDidFinish:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PSGSoftwareVersionController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__PSGSoftwareVersionController_client_rollbackDidFinish___block_invoke;
  v7[3] = &unk_24F9C7E70;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __57__PSGSoftwareVersionController_client_rollbackDidFinish___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "Prefereces: rollback finished: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setPreparingRollback:", 0);
}

- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PSGSoftwareVersionController *v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__PSGSoftwareVersionController_client_rollbackDidFail_withError___block_invoke;
  v8[3] = &unk_24F9C7E70;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __65__PSGSoftwareVersionController_client_rollbackDidFail_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "Prefereces: rollback failed: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setPreparingRollback:", 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  -[PSGSoftwareVersionController specifierAtIndex:](self, "specifierAtIndex:", -[PSGSoftwareVersionController indexForIndexPath:](self, "indexForIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");
  -[PSGSoftwareVersionController specifierForID:](self, "specifierForID:", CFSTR("OS_VERSION_CELL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v10)
  {
    objc_msgSend(v9, "preferredHeightWithTable:", v7);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PSGSoftwareVersionController;
    -[PSGSoftwareVersionController tableView:heightForRowAtIndexPath:](&v14, sel_tableView_heightForRowAtIndexPath_, v7, v6);
  }
  v12 = v11;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splatDocumentationData, 0);
  objc_storeStrong((id *)&self->_osDocumentationData, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
}

@end
