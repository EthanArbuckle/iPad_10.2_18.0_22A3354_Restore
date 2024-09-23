@implementation CTUIWirelessUsageAndAppPolicyController

- (CTUIWirelessUsageAndAppPolicyController)init
{
  CTUIWirelessUsageAndAppPolicyController *v2;
  CTUIWirelessUsageAndAppPolicyController *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  CoreTelephonyClient *coreTelephonyClient;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PSSpecifier *groupSpecifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CTUIWirelessUsageAndAppPolicyController;
  v2 = -[CTUIWirelessUsageAndAppPolicyController init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CTUIWirelessUsageAndAppPolicyController getLogger](v2, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController starting (init)", v20, 2u);
    }

    v5 = objc_alloc(MEMORY[0x24BDC2810]);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("wireless_usage_and_app_policy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithQueue:", v6);
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = (CoreTelephonyClient *)v7;

    -[CoreTelephonyClient setDelegate:](v3->_coreTelephonyClient, "setDelegate:", v3);
    v9 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("USE_WIRELESS_DATA"), &stru_24D5028C8, CFSTR("Cellular"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupSpecifierWithName:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    groupSpecifier = v3->_groupSpecifier;
    v3->_groupSpecifier = (PSSpecifier *)v12;

    v3->_shouldCalculateUsage = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v3, sel__handleNewCarrierNotification_, CFSTR("PSNewCarrierNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__handleCellularPlanChangedNotification_, CFSTR("PSUICellularPlanChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v3, sel__handleWirelessDataUsageChangedNotification_, *MEMORY[0x24BE856D8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v3, sel_managedConfigurationSettingsDidChange, *MEMORY[0x24BE63740], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v3, sel_managedConfigurationProfileListDidChange, *MEMORY[0x24BE63B78], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CTUIWirelessUsageAndAppPolicyController;
  -[CTUIWirelessUsageAndAppPolicyController dealloc](&v4, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  PSUIAppDataUsageGroup *v5;
  PSUIAppDataUsageGroup *appDataUsageGroup;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (!self->_appDataUsageGroup)
    {
      v5 = -[PSUIAppDataUsageGroup initWithListController:groupSpecifier:]([PSUIAppDataUsageGroup alloc], "initWithListController:groupSpecifier:", self, self->_groupSpecifier);
      appDataUsageGroup = self->_appDataUsageGroup;
      self->_appDataUsageGroup = v5;

    }
    if (self->_shouldCalculateUsage)
    {
      -[PSUIAppDataUsageGroup calculateUsage](self->_appDataUsageGroup, "calculateUsage");
      self->_shouldCalculateUsage = 0;
    }
    v15[0] = self->_groupSpecifier;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTUIWirelessUsageAndAppPolicyController appDataUsageGroup](self, "appDataUsageGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
    v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v10;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  v12 = (void *)MEMORY[0x24BE856B8];
  v13 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v12, "logSpecifiers:origin:", v13, CFSTR("[CTUIWirelessUsageAndAppPolicyController specifiers] end"));

  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (void)_handleNewCarrierNotification:(id)a3
{
  self->_shouldCalculateUsage = 1;
  -[CTUIWirelessUsageAndAppPolicyController reloadSpecifiers](self, "reloadSpecifiers", a3);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  int v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)*MEMORY[0x24BDC2D10], "isEqualToString:", a4);
  -[CTUIWirelessUsageAndAppPolicyController getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CTUIWirelessUsageAndAppPolicyController simStatusDidChange:status:]";
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s with simReady %d", (uint8_t *)&v7, 0x12u);
  }

  if (v5)
  {
    self->_shouldCalculateUsage = 1;
    -[CTUIWirelessUsageAndAppPolicyController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (void)_handleCellularPlanChangedNotification:(id)a3
{
  _QWORD block[5];

  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__CTUIWirelessUsageAndAppPolicyController__handleCellularPlanChangedNotification___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __82__CTUIWirelessUsageAndAppPolicyController__handleCellularPlanChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)_handleWirelessDataUsageChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  -[CTUIWirelessUsageAndAppPolicyController getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController received wirelessDataUsageChanged notification", buf, 2u);
  }

  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__CTUIWirelessUsageAndAppPolicyController__handleWirelessDataUsageChangedNotification___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __87__CTUIWirelessUsageAndAppPolicyController__handleWirelessDataUsageChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)managedConfigurationSettingsDidChange
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  -[CTUIWirelessUsageAndAppPolicyController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController received managedConfigurationSettingsDidChange notification", buf, 2u);
  }

  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__CTUIWirelessUsageAndAppPolicyController_managedConfigurationSettingsDidChange__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __80__CTUIWirelessUsageAndAppPolicyController_managedConfigurationSettingsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)managedConfigurationProfileListDidChange
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  -[CTUIWirelessUsageAndAppPolicyController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController received managedConfigurationProfileListDidChange notification", buf, 2u);
  }

  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CTUIWirelessUsageAndAppPolicyController_managedConfigurationProfileListDidChange__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __83__CTUIWirelessUsageAndAppPolicyController_managedConfigurationProfileListDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)selectSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTUIWirelessUsageAndAppPolicyController;
  -[CTUIWirelessUsageAndAppPolicyController selectSpecifier:](&v7, sel_selectSpecifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setParentSpecifier:", v4);

  return v5;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("WirelessUsageAndAppPolicyController"));
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (PSUIAppDataUsageGroup)appDataUsageGroup
{
  return self->_appDataUsageGroup;
}

- (void)setAppDataUsageGroup:(id)a3
{
  objc_storeStrong((id *)&self->_appDataUsageGroup, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (BOOL)shouldCalculateUsage
{
  return self->_shouldCalculateUsage;
}

- (void)setShouldCalculateUsage:(BOOL)a3
{
  self->_shouldCalculateUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_appDataUsageGroup, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end
