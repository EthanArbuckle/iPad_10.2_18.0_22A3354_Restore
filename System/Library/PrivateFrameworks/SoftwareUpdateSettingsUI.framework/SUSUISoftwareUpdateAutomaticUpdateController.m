@implementation SUSUISoftwareUpdateAutomaticUpdateController

- (void)cmdZPressed:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[SUSUISoftwareUpdateAutomaticUpdateController isAllowedToGetNeRDInfo](v4, "isAllowedToGetNeRDInfo"))
    -[SUSUISoftwareUpdateAutomaticUpdateController displayNeRDAlertToUser](v4, "displayNeRDAlertToUser");
  objc_storeStrong(location, 0);
}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  os_log_t oslog;
  id location[3];
  SUSUISoftwareUpdateAutomaticUpdateController *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (-[SUSUISoftwareUpdateAutomaticUpdateController isAllowedToGetNeRDInfo](v6, "isAllowedToGetNeRDInfo")
    && objc_msgSend(location[0], "type") == 1)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v7, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) motionBegan:withEvent:]");
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: RecoveryOS info is about to be displayed.", v7, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[SUSUISoftwareUpdateAutomaticUpdateController displayNeRDAlertToUser](v6, "displayNeRDAlertToUser");
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isAllowedToGetNeRDInfo
{
  id v3;
  char v4;
  os_log_t oslog;
  char v6;
  SEL v7;
  SUSUISoftwareUpdateAutomaticUpdateController *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  v7 = a2;
  v3 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
  v4 = objc_msgSend(v3, "isNeRDProfileStatusInstalled");

  v6 = v4 & 1;
  if ((v4 & 1) != 0)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) isAllowedToGetNeRDInfo]");
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: RecoveryOS info profile is Enabled", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  return v6 & 1;
}

- (id)getNeRDDisplayInfo
{
  id v3;
  id v4;
  os_log_t oslog;
  os_log_type_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v12;
  uint8_t v13[16];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[1] = (id)a2;
  location[0] = CFSTR("No info provided");
  v10 = (id)-[SUSUISoftwareUpdateAutomaticUpdateController parentController](v12, "parentController");
  if (v10)
  {
    v4 = (id)objc_msgSend(v10, "manager");
    v9 = (id)objc_msgSend(v4, "rvGetCurrentNeRDInfo");

    if (v9 && objc_msgSend(v9, "count"))
    {
      v8 = (id)objc_msgSend(v9, "description");
      if (v8 && (objc_msgSend(v8, "isEqual:", &stru_24E0011F0) & 1) == 0)
        objc_storeStrong(location, v8);
      objc_storeStrong(&v8, 0);
    }
    else
    {
      v7 = _SUSUILoggingFacility();
      v6 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) getNeRDDisplayInfo]");
        _os_log_error_impl(&dword_21BF33000, (os_log_t)v7, v6, "%s: Dictionary from RecoveryOS info is nil", v14, 0xCu);
      }
      objc_storeStrong(&v7, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v13, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) getNeRDDisplayInfo]");
      _os_log_error_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_ERROR, "%s: parentController is not 'SUSUISoftwareUpdateController'", v13, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v3 = location[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)displayNeRDAlertToUser
{
  void *v2;
  id v3;
  void *v4;
  id v5[2];
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  SUSUISoftwareUpdateAutomaticUpdateController *v10;
  id v11;
  id v12[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v13;

  v13 = self;
  v12[1] = (id)a2;
  v2 = (void *)MEMORY[0x24BEBD3B0];
  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController getNeRDDisplayInfo](self, "getNeRDDisplayInfo");
  v12[0] = (id)objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", CFSTR("RecoveryOS profile detected\n Current info:"));

  v4 = (void *)MEMORY[0x24BEBD3A8];
  v5[1] = (id)MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __76__SUSUISoftwareUpdateAutomaticUpdateController_NeRD__displayNeRDAlertToUser__block_invoke;
  v9 = &unk_24DFF77E8;
  v10 = v13;
  v11 = (id)objc_msgSend(v4, "actionWithTitle:style:handler:", CFSTR("Update Now"), 0);
  v5[0] = (id)objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", CFSTR("Close"), 1, &__block_literal_global_1);
  objc_msgSend(v12[0], "addAction:", v5[0]);
  objc_msgSend(v12[0], "addAction:", v11);
  -[SUSUISoftwareUpdateAutomaticUpdateController presentViewController:animated:completion:](v13, "presentViewController:animated:completion:", v12[0], 1);
  objc_storeStrong(v5, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v12, 0);
}

void __76__SUSUISoftwareUpdateAutomaticUpdateController_NeRD__displayNeRDAlertToUser__block_invoke(id *a1, void *a2)
{
  id v2;
  os_log_t oslog;
  id v5;
  os_log_type_t v6;
  id v7[2];
  id location[2];
  uint8_t v9[16];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v7[0] = _SUSUILoggingFacility();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) displayNeRDAlertToUser]_block_invoke");
    _os_log_impl(&dword_21BF33000, (os_log_t)v7[0], v6, "%s: RecoveryOS updated triggered by user.", v10, 0xCu);
  }
  objc_storeStrong(v7, 0);
  v5 = (id)objc_msgSend(a1[4], "parentController");
  if (v5)
  {
    v2 = (id)objc_msgSend(v5, "manager");
    objc_msgSend(v2, "rvTriggerNeRDUpdate");

  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) displayNeRDAlertToUser]_block_invoke");
      _os_log_error_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_ERROR, "%s: parentController is not 'SUSUISoftwareUpdateController'", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateAutomaticUpdateController_NeRD__displayNeRDAlertToUser__block_invoke_192(NSObject *a1, void *a2)
{
  os_log_t oslog[2];
  id location[2];
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v5, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) displayNeRDAlertToUser]_block_invoke");
    _os_log_error_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_ERROR, "%s: RecoveryOS alert dismissed without action", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

- (SUSUISoftwareUpdateAutomaticUpdateController)init
{
  SUManagerClient *v2;
  SUManagerClient *manager;
  SUSUISoftwareUpdateAutomaticUpdateController *v5;
  SUSUISoftwareUpdateAutomaticUpdateController *v6;
  objc_super v7;
  SEL v8;
  SUSUISoftwareUpdateAutomaticUpdateController *v9;

  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  v6 = -[SUSUISoftwareUpdateAutomaticUpdateController init](&v7, sel_init);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = (SUManagerClient *)objc_alloc_init(MEMORY[0x24BEAEC38]);
    manager = v9->_manager;
    v9->_manager = v2;

  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)dealloc
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  SUSUISoftwareUpdateAutomaticUpdateController *v7;

  v7 = self;
  v6 = a2;
  v4 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](self, "updateController");
  v3 = (id)objc_msgSend(v4, "manager");
  v2 = (id)objc_msgSend(v3, "preferences");
  objc_msgSend(v2, "removeObserver:", v7);

  v5.receiver = v7;
  v5.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  -[SUSUISoftwareUpdateAutomaticUpdateController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  SEL v9;
  SUSUISoftwareUpdateAutomaticUpdateController *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  -[SUSUISoftwareUpdateAutomaticUpdateController viewDidLoad](&v8, sel_viewDidLoad);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
  v2 = (id)-[SUSUISoftwareUpdateAutomaticUpdateController navigationItem](v10, "navigationItem");
  objc_msgSend(v2, "setTitle:", v3);

  v7 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v10, "updateController");
  v6 = (id)objc_msgSend(v7, "manager");
  v5 = (id)objc_msgSend(v6, "preferences");
  objc_msgSend(v5, "addObserver:", v10);

}

- (void)viewDidAppear:(BOOL)a3
{
  SUSUISoftwareUpdateAutomaticUpdateController *v3;
  id v4;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUISoftwareUpdateAutomaticUpdateController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  -[SUSUISoftwareUpdateAutomaticUpdateController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v3 = v9;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
  -[PSListController addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:](v3, "addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:");

}

- (id)specifiers
{
  id v2;
  void **v3;
  void *v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int *v11;
  id v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
  {
    v13 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  }
  else
  {
    v10 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyInstallGroup](self, "automaticallyInstallGroup");
    v14[0] = v10;
    v9 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyInstallSwitch](self, "automaticallyInstallSwitch");
    v14[1] = v9;
    v8 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadSecurityResponseAndSystemFilesSwitch](self, "automaticallyDownloadSecurityResponseAndSystemFilesSwitch");
    v14[2] = v8;
    v7 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadGroup](self, "automaticallyDownloadGroup");
    v14[3] = v7;
    v6 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadUpdatesSwitch](self, "automaticallyDownloadUpdatesSwitch");
    v14[4] = v6;
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
    v11 = (int *)MEMORY[0x24BE756E0];
    v3 = (void **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    v4 = *v3;
    *v3 = v2;

    v13 = *(id *)((char *)&self->super.super.super.super.super.isa + *v11);
  }
  return v13;
}

- (id)automaticallyInstallGroup
{
  __CFString *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  __CFString *v14;
  id v15[3];

  v15[2] = self;
  v15[1] = (id)a2;
  v4 = (void *)MEMORY[0x24BE75590];
  v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_AUTO_INSTALL_HEADER"));
  v15[0] = (id)objc_msgSend(v4, "groupSpecifierWithName:");

  if (MGGetBoolAnswer() & 1)
    v2 = CFSTR("WLAN");
  else
    v2 = CFSTR("WIFI");
  v14 = v2;
  v12 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AUTOMATIC_UPDATES_AUTO_INSTALL_EXPLANATION_%@"), v14);
  v7 = v15[0];
  v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", v12);
  v8 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:");
  objc_msgSend(v7, "setProperty:forKey:");

  objc_msgSend(v15[0], "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v11 = v15[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(v15, 0);
  return v11;
}

- (id)automaticallyInstallSwitch
{
  id v3;
  id v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  PSSpecifier *v13;
  SUManagerClient *v14;
  _BOOL4 v15;
  char *v16;
  id v17;
  char *v18;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = (id)-[SUSUISoftwareUpdateAutomaticUpdateController parentController](self, "parentController");
  v18 = 0;
  v17 = (id)objc_msgSend(location[0], "manager");
  if ((objc_msgSend(v17, "isTargetedUpdateScheduledForAutoInstall") & 1) != 0)
    v16 = sel_setArmedAutomaticallyInstallToggledWithValue_forSpecifier_;
  else
    v16 = sel_setNonArmedAutomaticallyInstallToggledWithValue_forSpecifier_;
  v5 = v16;

  v18 = v16;
  v7 = (id)MEMORY[0x24BE75590];
  v6 = MEMORY[0x24BDD1488];
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTOMATIC_INSTALL_TOGGLE_TEXT"));
  v9 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:");
  v8 = (id)objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  -[SUSUISoftwareUpdateAutomaticUpdateController setAutomaticallyInstallSwitchSpecifier:](v20, "setAutomaticallyInstallSwitchSpecifier:");

  v12 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyInstallSwitchSpecifier](v20, "automaticallyInstallSwitchSpecifier");
  objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);

  v13 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyInstallSwitchSpecifier](v20, "automaticallyInstallSwitchSpecifier");
  -[PSSpecifier setIdentifier:](v13, "setIdentifier:", CFSTR("AUTOMATIC_INSTALL_SWITCH_SPECIFIER"));

  v14 = -[SUSUISoftwareUpdateAutomaticUpdateController manager](v20, "manager");
  v15 = -[SUManagerClient shouldDisableAutoInstallIOSUpdatesToggle](v14, "shouldDisableAutoInstallIOSUpdatesToggle");

  if (v15)
  {
    v4 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyInstallSwitchSpecifier](v20, "automaticallyInstallSwitchSpecifier");
    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);

  }
  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyInstallSwitchSpecifier](v20, "automaticallyInstallSwitchSpecifier");
  objc_storeStrong(location, 0);
  return v3;
}

- (id)automaticallyDownloadGroup
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11[3];

  v11[2] = self;
  v11[1] = (id)a2;
  v3 = (void *)MEMORY[0x24BE75590];
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_AUTO_DOWNLOAD_HEADER"));
  v11[0] = (id)objc_msgSend(v3, "groupSpecifierWithName:");

  v6 = v11[0];
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTOMATIC_UPDATES_AUTO_DOWNLOAD_EXPLANATION"));
  v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
  objc_msgSend(v6, "setProperty:forKey:");

  objc_msgSend(v11[0], "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v10 = v11[0];
  objc_storeStrong(v11, 0);
  return v10;
}

- (id)automaticallyDownloadUpdatesSwitch
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  PSSpecifier *v9;
  PSSpecifier *v10;
  SEL v11;
  SUSUISoftwareUpdateAutomaticUpdateController *v12;

  v12 = self;
  v11 = a2;
  v4 = (id)MEMORY[0x24BE75590];
  v3 = MEMORY[0x24BDD1488];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTOMATIC_INSTALL_TOGGLE_TEXT"));
  v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:");
  v5 = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  -[SUSUISoftwareUpdateAutomaticUpdateController setAutomaticallyDownloadUpdatesSwitchSpecifier:](v12, "setAutomaticallyDownloadUpdatesSwitchSpecifier:");

  v9 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadUpdatesSwitchSpecifier](v12, "automaticallyDownloadUpdatesSwitchSpecifier");
  -[PSSpecifier setProperty:forKey:](v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);

  v10 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadUpdatesSwitchSpecifier](v12, "automaticallyDownloadUpdatesSwitchSpecifier");
  -[PSSpecifier setIdentifier:](v10, "setIdentifier:", CFSTR("AUTOMATIC_DOWNLOAD_SWITCH_SPECIFIER"));

  return -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadUpdatesSwitchSpecifier](v12, "automaticallyDownloadUpdatesSwitchSpecifier");
}

- (id)automaticallyDownloadSecurityResponseAndSystemFilesSwitch
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  PSSpecifier *v10;
  SUManagerClient *v11;
  _BOOL4 v12;
  SEL v13;
  SUSUISoftwareUpdateAutomaticUpdateController *v14;

  v14 = self;
  v13 = a2;
  v5 = (id)MEMORY[0x24BE75590];
  v4 = MEMORY[0x24BDD1488];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_DOWNLOAD_TOGGLE_SECURITY_RESPONSE_AND_SYSTEM_FILES"), &stru_24E0011F0, CFSTR("Software Update"));
  v6 = (id)objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  -[SUSUISoftwareUpdateAutomaticUpdateController setSecurityResponseSwitchSpecifier:](v14, "setSecurityResponseSwitchSpecifier:");

  v9 = -[SUSUISoftwareUpdateAutomaticUpdateController securityResponseSwitchSpecifier](v14, "securityResponseSwitchSpecifier");
  objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);

  v10 = -[SUSUISoftwareUpdateAutomaticUpdateController securityResponseSwitchSpecifier](v14, "securityResponseSwitchSpecifier");
  -[PSSpecifier setIdentifier:](v10, "setIdentifier:", CFSTR("AUTOMATIC_INSTALL_SYSTEM_DATA_FILES_SWITCH_SPECIFIER"));

  v11 = -[SUSUISoftwareUpdateAutomaticUpdateController manager](v14, "manager");
  v12 = -[SUManagerClient shouldDisableAutoInstallRSRToggle](v11, "shouldDisableAutoInstallRSRToggle");

  if (v12)
  {
    v3 = -[SUSUISoftwareUpdateAutomaticUpdateController securityResponseSwitchSpecifier](v14, "securityResponseSwitchSpecifier");
    objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);

  }
  return -[SUSUISoftwareUpdateAutomaticUpdateController securityResponseSwitchSpecifier](v14, "securityResponseSwitchSpecifier");
}

- (id)automaticUpdateStatus
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](self, "updateController");
  v4 = (id)objc_msgSend(v3, "automaticUpdateStatus");

  return v4;
}

- (id)automaticDownloadEnabled
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](self, "updateController");
  v4 = (id)objc_msgSend(v3, "automaticDownloadStatus");

  return v4;
}

- (id)automaticDownloadStatus
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](self, "updateController");
  v4 = (id)objc_msgSend(v3, "automaticDownloadStatus");

  return v4;
}

- (id)previousUserSpecifiedAutomaticUpdateStatus
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](self, "updateController");
  v4 = (id)objc_msgSend(v3, "previousUserSpecifiedAutomaticUpdateStatus");

  return v4;
}

- (id)securityResponseStatus
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](self, "updateController");
  v4 = (id)objc_msgSend(v3, "securityResponseStatus");

  return v4;
}

- (id)previousUserSpecifiedSecurityResponseStatus
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](self, "updateController");
  v4 = (id)objc_msgSend(v3, "previousUserSpecifiedSecurityResponseStatus");

  return v4;
}

- (void)setNonArmedAutomaticallyInstallToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  id v4;
  id v5;
  id *v6;
  id v7;
  PSSpecifier *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v4 = objc_alloc(MEMORY[0x24BEAEC00]);
  v14 = (id)objc_msgSend(v4, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  v12 = *MEMORY[0x24BEAEE10];
  if ((objc_msgSend(location[0], "BOOLValue") & 1) == 1)
    v10 = *MEMORY[0x24BEAEE50];
  else
    v10 = *MEMORY[0x24BEAEE48];
  objc_msgSend(v14, "setEventPayloadEntry:stringValue:", v12, v10);
  -[SUManagerClient submitSUAnalyticsEvent:](v17->_manager, "submitSUAnalyticsEvent:", v14);
  if ((objc_msgSend(location[0], "BOOLValue") & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BEAEC00]);
    v13 = (id)objc_msgSend(v5, "initWithEventName:", *MEMORY[0x24BEAEE08]);
    objc_msgSend(v13, "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], *MEMORY[0x24BEAEE20]);
    -[SUManagerClient submitSUAnalyticsEvent:](v17->_manager, "submitSUAnalyticsEvent:", v13);
    v9 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v17, "updateController");
    v7 = location[0];
    v8 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadUpdatesSwitchSpecifier](v17, "automaticallyDownloadUpdatesSwitchSpecifier");
    objc_msgSend(v9, "setAutomaticDownloadFromUI:forSpecifier:", v7);

    -[SUManagerClient autoScanAndDownloadIfAvailable:](v17->_manager, "autoScanAndDownloadIfAvailable:");
    -[SUSUISoftwareUpdateAutomaticUpdateController setSecurityResponseToggleState:toggleCellEnabled:userSpecified:specifier:](v17, "setSecurityResponseToggleState:toggleCellEnabled:userSpecified:specifier:", location[0], location[0], 1, v15);
    objc_storeStrong(&v13, 0);
  }
  -[SUSUISoftwareUpdateAutomaticUpdateController setAutomaticallyInstallUpdatesToggledWithValue:forSpecifier:](v17, "setAutomaticallyInstallUpdatesToggledWithValue:forSpecifier:", location[0], v15, &v15);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setArmedAutomaticallyInstallToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(_QWORD *, void *);
  void *v25;
  SUSUISoftwareUpdateAutomaticUpdateController *v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(id *, void *);
  void *v32;
  SUSUISoftwareUpdateAutomaticUpdateController *v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  SUSUISoftwareUpdateAutomaticUpdateController *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  int v45;
  id v46;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v48;

  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v46 = 0;
  objc_storeStrong(&v46, a4);
  if ((objc_msgSend(location[0], "BOOLValue") & 1) == 1)
  {
    v19 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v48, "updateController");
    objc_msgSend(v19, "setAutomaticUpdatesFromUI:forSpecifier:", location[0], v46);

    v45 = 1;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BEBD3B0];
    v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_TITLE"));
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_DESCRIPTION"), &stru_24E0011F0, CFSTR("Software Update"));
    v44 = (id)objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v7);

    v9 = (void *)MEMORY[0x24BEBD3A8];
    v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_AUTOUPDATE_OFF"), &stru_24E0011F0, CFSTR("Software Update"));
    v15 = MEMORY[0x24BDAC760];
    v35 = MEMORY[0x24BDAC760];
    v36 = -1073741824;
    v37 = 0;
    v38 = __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke;
    v39 = &unk_24DFFE800;
    v40 = v48;
    v41 = location[0];
    v42 = v46;
    v43 = (id)objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, &v35);

    v12 = (void *)MEMORY[0x24BEBD3A8];
    v14 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_AUTOINSTALL_OFF"), &stru_24E0011F0, CFSTR("Software Update"));
    v28 = v15;
    v29 = -1073741824;
    v30 = 0;
    v31 = __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_2;
    v32 = &unk_24DFF77E8;
    v33 = v48;
    v34 = (id)objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, &v28);

    v16 = (void *)MEMORY[0x24BEBD3A8];
    v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_CANCEL"), &stru_24E0011F0, CFSTR("Software Update"));
    v21 = v15;
    v22 = -1073741824;
    v23 = 0;
    v24 = __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_3;
    v25 = &unk_24DFF77E8;
    v26 = v48;
    v27 = (id)objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, &v21);

    objc_msgSend(v44, "addAction:", v34);
    objc_msgSend(v44, "addAction:", v43);
    objc_msgSend(v44, "addAction:", v27);
    -[SUSUISoftwareUpdateAutomaticUpdateController presentViewController:animated:completion:](v48, "presentViewController:animated:completion:", v44, 1);
    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v26, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong((id *)&v40, 0);
    objc_storeStrong(&v44, 0);
    v45 = 0;
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
}

void __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v5;
  id v6[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6[1] = (id)a1;
  v2 = objc_alloc(MEMORY[0x24BEAEC00]);
  v6[0] = (id)objc_msgSend(v2, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  objc_msgSend(v6[0], "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], *MEMORY[0x24BEAEE58]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "submitSUAnalyticsEvent:", v6[0]);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "updateController");
  objc_msgSend(v3, "setAutomaticUpdatesFromUI:forSpecifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "updateController");
  objc_msgSend(v5, "unscheduleTargetedUpdateAutomaticInstallation");

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

void __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_2(id *a1, void *a2)
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v2 = objc_alloc(MEMORY[0x24BEAEC00]);
  v7[0] = (id)objc_msgSend(v2, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  objc_msgSend(v7[0], "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], *MEMORY[0x24BEAEE38]);
  objc_msgSend(*((id *)a1[4] + 175), "submitSUAnalyticsEvent:", v7[0]);
  v3 = (id)objc_msgSend(a1[4], "updateController");
  objc_msgSend(v3, "unscheduleTargetedUpdateAutomaticInstallation");

  v5 = a1[4];
  v6 = (id)objc_msgSend(v5, "automaticallyInstallSwitchSpecifier");
  objc_msgSend(v5, "reloadSpecifier:");

  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

void __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_3(_QWORD *a1, void *a2)
{
  id v2;
  void *v4;
  id v5;
  id v6[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6[1] = a1;
  v2 = objc_alloc(MEMORY[0x24BEAEC00]);
  v6[0] = (id)objc_msgSend(v2, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  objc_msgSend(v6[0], "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], *MEMORY[0x24BEAEE40]);
  objc_msgSend(*(id *)(a1[4] + 1400), "submitSUAnalyticsEvent:", v6[0]);
  v4 = (void *)a1[4];
  v5 = (id)objc_msgSend(v4, "automaticallyInstallSwitchSpecifier");
  objc_msgSend(v4, "reloadSpecifier:");

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticallyInstallUpdatesToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  id v9;
  id v10;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = objc_alloc(MEMORY[0x24BEAEC00]);
  v9 = (id)objc_msgSend(v4, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  v8 = *MEMORY[0x24BEAEE10];
  if ((objc_msgSend(location[0], "BOOLValue") & 1) == 1)
    v6 = *MEMORY[0x24BEAEE50];
  else
    v6 = *MEMORY[0x24BEAEE48];
  objc_msgSend(v9, "setEventPayloadEntry:stringValue:", v8, v6);
  -[SUManagerClient submitSUAnalyticsEvent:](v12->_manager, "submitSUAnalyticsEvent:", v9);
  v5 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v12, "updateController");
  objc_msgSend(v5, "setAutomaticUpdatesFromUI:forSpecifier:", location[0], v10);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticallyDownloadUpdatesToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  id v4;
  id v5;
  id *v6;
  id v7;
  uint64_t v8;
  id v10;
  uint64_t v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v10 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v18, "updateController");
  objc_msgSend(v10, "setAutomaticDownloadFromUI:forSpecifier:", location[0], v16);

  v4 = objc_alloc(MEMORY[0x24BEAEC00]);
  v15 = (id)objc_msgSend(v4, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  v11 = *MEMORY[0x24BEAEE10];
  if ((objc_msgSend(location[0], "BOOLValue") & 1) == 1)
    v8 = *MEMORY[0x24BEAEE20];
  else
    v8 = *MEMORY[0x24BEAEE18];
  objc_msgSend(v15, "setEventPayloadEntry:stringValue:", v11, v8);
  -[SUManagerClient submitSUAnalyticsEvent:](v18->_manager, "submitSUAnalyticsEvent:", v15);
  if ((objc_msgSend(location[0], "BOOLValue") & 1) != 0)
  {
    -[SUManagerClient autoScanAndDownloadIfAvailable:](v18->_manager, "autoScanAndDownloadIfAvailable:", 0);
  }
  else
  {
    v7 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v18, "updateController");
    objc_msgSend(v7, "unscheduleTargetedUpdateAutomaticInstallation");

  }
  v12 = 0;
  if ((objc_msgSend(location[0], "BOOLValue") & 1) != 0)
  {
    v13 = -[SUSUISoftwareUpdateAutomaticUpdateController previousUserSpecifiedAutomaticUpdateStatus](v18, "previousUserSpecifiedAutomaticUpdateStatus");
    v12 = 1;
    v5 = v13;
  }
  else
  {
    v5 = MEMORY[0x24BDBD1C0];
  }
  v14 = v5;
  if ((v12 & 1) != 0)

  -[SUSUISoftwareUpdateAutomaticUpdateController setSecurityResponseToggleState:toggleCellEnabled:userSpecified:specifier:](v18, "setSecurityResponseToggleState:toggleCellEnabled:userSpecified:specifier:", v14, location[0], 0, v16, &v14);
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticallyInstallSecurityResponsesAndSystemDataToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  id v10;
  id v11;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = objc_alloc(MEMORY[0x24BEAEC00]);
  v10 = (id)objc_msgSend(v4, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  v9 = *MEMORY[0x24BEAEE10];
  if ((objc_msgSend(location[0], "BOOLValue") & 1) == 1)
    v7 = *MEMORY[0x24BEAEE30];
  else
    v7 = *MEMORY[0x24BEAEE28];
  objc_msgSend(v10, "setEventPayloadEntry:stringValue:", v9, v7);
  -[SUManagerClient submitSUAnalyticsEvent:](v13->_manager, "submitSUAnalyticsEvent:", v10);
  v5 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v13, "updateController");
  objc_msgSend(v5, "setAutomaticInstallSystemDataFilesFromUI:forSpecifier:", location[0], v11);

  v6 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v13, "updateController");
  objc_msgSend(v6, "setSecurityResponseFromUI:forSpecifier:", location[0], v11);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setSecurityResponseToggleState:(id)a3 toggleCellEnabled:(id)a4 userSpecified:(BOOL)a5 specifier:(id)a6
{
  id v9;
  SUSUISoftwareUpdateAutomaticUpdateController *v10;
  PSSpecifier *v11;
  SUSUISoftwareUpdateAutomaticUpdateController *v12;
  PSSpecifier *v13;
  id v14;
  BOOL v15;
  id v16;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = a5;
  v14 = 0;
  objc_storeStrong(&v14, a6);
  v9 = -[SUSUISoftwareUpdateAutomaticUpdateController updateController](v18, "updateController");
  objc_msgSend(v9, "setAutomaticUpdatesFromUI:userSpecified:forSpecifier:", location[0], v15, v14);

  v10 = v18;
  v11 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyDownloadUpdatesSwitchSpecifier](v18, "automaticallyDownloadUpdatesSwitchSpecifier");
  -[SUSUISoftwareUpdateAutomaticUpdateController reloadSpecifier:animated:](v10, "reloadSpecifier:animated:");

  v12 = v18;
  v13 = -[SUSUISoftwareUpdateAutomaticUpdateController automaticallyInstallSwitchSpecifier](v18, "automaticallyInstallSwitchSpecifier");
  -[SUSUISoftwareUpdateAutomaticUpdateController reloadSpecifier:animated:](v12, "reloadSpecifier:animated:");

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11);
  void *v12;
  SUSUISoftwareUpdateAutomaticUpdateController *v13;
  id v14;
  id v15;
  id location[2];
  SUSUISoftwareUpdateAutomaticUpdateController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  queue = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __88__SUSUISoftwareUpdateAutomaticUpdateController_preferences_didChangePreference_toValue___block_invoke;
  v12 = &unk_24DFF7B58;
  v13 = v17;
  dispatch_async(queue, &v8);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

uint64_t __88__SUSUISoftwareUpdateAutomaticUpdateController_preferences_didChangePreference_toValue___block_invoke(NSObject *a1)
{
  os_log_t oslog[3];
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController preferences:didChangePreference:toValue:]_block_invoke");
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: SUPreferences have been changed. Reloading the screen.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  return -[objc_class reloadSpecifiers](a1[4].isa, "reloadSpecifiers");
}

- (id)updateController
{
  return (id)-[SUSUISoftwareUpdateAutomaticUpdateController parentController](self, "parentController", a2, self);
}

- (PSSpecifier)automaticallyInstallSwitchSpecifier
{
  return self->_automaticallyInstallSwitchSpecifier;
}

- (void)setAutomaticallyInstallSwitchSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallyInstallSwitchSpecifier, a3);
}

- (PSSpecifier)automaticallyDownloadUpdatesSwitchSpecifier
{
  return self->_automaticallyDownloadUpdatesSwitchSpecifier;
}

- (void)setAutomaticallyDownloadUpdatesSwitchSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallyDownloadUpdatesSwitchSpecifier, a3);
}

- (PSSpecifier)securityResponseSwitchSpecifier
{
  return self->_securityResponseSwitchSpecifier;
}

- (void)setSecurityResponseSwitchSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_securityResponseSwitchSpecifier, a3);
}

- (SUManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_securityResponseSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticallyDownloadUpdatesSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticallyInstallSwitchSpecifier, 0);
}

@end
