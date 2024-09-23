@implementation SUSUISoftwareUpdateSelfServicesController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  SUSUISoftwareUpdateSelfServicesController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)SUSUISoftwareUpdateSelfServicesController;
  -[SUSUISoftwareUpdateSelfServicesController viewDidLoad](&v5, sel_viewDidLoad);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SELF_SERVICES_TITLE"), &stru_24E0011F0, CFSTR("Software Update"));
  v2 = (id)-[SUSUISoftwareUpdateSelfServicesController navigationItem](v7, "navigationItem");
  objc_msgSend(v2, "setTitle:", v3);

}

- (id)specifiers
{
  id v2;
  void **v3;
  void *v4;
  id v6;
  PSSpecifier *v7;
  id v8;
  PSSpecifier *v9;
  id v10;
  PSSpecifier *v11;
  int *v12;
  id v13[2];
  SUSUISoftwareUpdateSelfServicesController *v14;
  id v15;

  v14 = self;
  v13[1] = (id)a2;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
  {
    v15 = *(id *)((char *)&v14->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  }
  else
  {
    -[SUSUISoftwareUpdateSelfServicesController setupGroupSpecifier](v14, "setupGroupSpecifier");
    -[SUSUISoftwareUpdateSelfServicesController setupBatteryStatusSpecifier](v14, "setupBatteryStatusSpecifier");
    -[SUSUISoftwareUpdateSelfServicesController setupStorageStatusSpecifier](v14, "setupStorageStatusSpecifier");
    -[SUSUISoftwareUpdateSelfServicesController updateFooter](v14, "updateFooter");
    v13[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v6 = v13[0];
    v7 = -[SUSUISoftwareUpdateSelfServicesController groupSpecifier](v14, "groupSpecifier");
    objc_msgSend(v6, "addObject:");

    v8 = v13[0];
    v9 = -[SUSUISoftwareUpdateSelfServicesController batteryStatusSpecifier](v14, "batteryStatusSpecifier");
    objc_msgSend(v8, "addObject:");

    v10 = v13[0];
    v11 = -[SUSUISoftwareUpdateSelfServicesController storageStatusSpecifier](v14, "storageStatusSpecifier");
    objc_msgSend(v10, "addObject:");

    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v13[0]);
    v12 = (int *)MEMORY[0x24BE756E0];
    v3 = (void **)((char *)&v14->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    v4 = *v3;
    *v3 = v2;

    v15 = *(id *)((char *)&v14->super.super.super.super.super.isa + *v12);
    objc_storeStrong(v13, 0);
  }
  return v15;
}

- (void)setupGroupSpecifier
{
  PSSpecifier *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  PSSpecifier *v8;
  _BOOL4 v9;
  SEL v10;
  SUSUISoftwareUpdateSelfServicesController *v11;

  v11 = self;
  v10 = a2;
  v2 = -[SUSUISoftwareUpdateSelfServicesController groupSpecifier](self, "groupSpecifier");
  v9 = v2 != 0;

  if (!v9)
  {
    v4 = (id)MEMORY[0x24BE75590];
    v3 = MEMORY[0x24BDD1488];
    v7 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SELF_SERVICES_GROUP_TITLE"), &stru_24E0011F0, CFSTR("Software Update"));
    v5 = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    -[SUSUISoftwareUpdateSelfServicesController setGroupSpecifier:](v11, "setGroupSpecifier:");

    v8 = -[SUSUISoftwareUpdateSelfServicesController groupSpecifier](v11, "groupSpecifier");
    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", CFSTR("SELF_SERVICES_GROUP"), *MEMORY[0x24BE75AC0]);

  }
}

- (void)setupStorageStatusSpecifier
{
  PSSpecifier *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  PSSpecifier *v8;
  _BOOL4 v9;
  SEL v10;
  SUSUISoftwareUpdateSelfServicesController *v11;

  v11 = self;
  v10 = a2;
  v2 = -[SUSUISoftwareUpdateSelfServicesController storageStatusSpecifier](self, "storageStatusSpecifier");
  v9 = v2 != 0;

  if (!v9)
  {
    v4 = (id)MEMORY[0x24BE75590];
    v3 = MEMORY[0x24BDD1488];
    v7 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SELF_SERVICES_STORAGE_TITLE"), &stru_24E0011F0, CFSTR("Software Update"));
    v5 = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    -[SUSUISoftwareUpdateSelfServicesController setStorageStatusSpecifier:](v11, "setStorageStatusSpecifier:");

    v8 = -[SUSUISoftwareUpdateSelfServicesController storageStatusSpecifier](v11, "storageStatusSpecifier");
    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", CFSTR("SELF_SERVICES_STORAGE_ID"), *MEMORY[0x24BE75AC0]);

  }
}

- (void)setupBatteryStatusSpecifier
{
  PSSpecifier *v2;
  float v3;
  id v4;
  PSSpecifier *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  id v22;
  unsigned int v23;
  uint64_t v24;
  id v25[2];
  SUSUISoftwareUpdateSelfServicesController *v26;

  v26 = self;
  v25[1] = (id)a2;
  v2 = -[SUSUISoftwareUpdateSelfServicesController batteryStatusSpecifier](self, "batteryStatusSpecifier");
  v9 = v2 != 0;

  if (!v9)
  {
    v25[0] = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    objc_msgSend(v25[0], "setBatteryMonitoringEnabled:", 1);
    v24 = objc_msgSend(v25[0], "batteryState");
    objc_msgSend(v25[0], "batteryLevel");
    v23 = 100 * (int)v3;
    v20 = 0;
    v18 = 0;
    v16 = 0;
    v14 = 0;
    v12 = 0;
    v10 = 0;
    if (v24 == 2 || v24 == 3)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v21 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v20 = 1;
      v19 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SELF_SERVICES_BATTERY_TITLE"), &stru_24E0011F0, CFSTR("Software Update"));
      v18 = 1;
      v17 = (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: Charging, %d%%"), v19, v23);
      v16 = 1;
      v8 = v17;
    }
    else
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v15 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = 1;
      v13 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SELF_SERVICES_BATTERY_TITLE"), &stru_24E0011F0, CFSTR("Software Update"));
      v12 = 1;
      v11 = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %d%%"), v13, v23);
      v10 = 1;
      v8 = v11;
    }
    v22 = v8;
    if ((v10 & 1) != 0)

    if ((v12 & 1) != 0)
    if ((v14 & 1) != 0)

    if ((v16 & 1) != 0)
    if ((v18 & 1) != 0)

    if ((v20 & 1) != 0)
    v4 = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, 0, 0, 0, 0, 13, 0);
    -[SUSUISoftwareUpdateSelfServicesController setBatteryStatusSpecifier:](v26, "setBatteryStatusSpecifier:");

    v5 = -[SUSUISoftwareUpdateSelfServicesController batteryStatusSpecifier](v26, "batteryStatusSpecifier");
    -[PSSpecifier setProperty:forKey:](v5, "setProperty:forKey:", CFSTR("SELF_SERVICES_BATTERY_ID"), *MEMORY[0x24BE75AC0]);

    objc_storeStrong(&v22, 0);
    objc_storeStrong(v25, 0);
  }
}

- (void)updateFooter
{
  objc_class *v2;
  NSString *v3;
  PSSpecifier *v4;
  PSSpecifier *v5;
  id v6[2];
  SUSUISoftwareUpdateSelfServicesController *v7;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = &stru_24E0011F0;
  v4 = -[SUSUISoftwareUpdateSelfServicesController groupSpecifier](v7, "groupSpecifier");
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  -[PSSpecifier setProperty:forKey:](v4, "setProperty:forKey:");

  v5 = -[SUSUISoftwareUpdateSelfServicesController groupSpecifier](v7, "groupSpecifier");
  -[PSSpecifier setProperty:forKey:](v5, "setProperty:forKey:", v6[0], *MEMORY[0x24BE75A58]);

  objc_storeStrong(v6, 0);
}

- (id)updateController
{
  return (id)-[SUSUISoftwareUpdateSelfServicesController parentController](self, "parentController", a2, self);
}

- (PSSpecifier)batteryStatusSpecifier
{
  return self->_batteryStatusSpecifier;
}

- (void)setBatteryStatusSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_batteryStatusSpecifier, a3);
}

- (PSSpecifier)storageStatusSpecifier
{
  return self->_storageStatusSpecifier;
}

- (void)setStorageStatusSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_storageStatusSpecifier, a3);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_storageStatusSpecifier, 0);
  objc_storeStrong((id *)&self->_batteryStatusSpecifier, 0);
}

@end
