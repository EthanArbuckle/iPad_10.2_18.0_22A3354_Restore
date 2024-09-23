@implementation PSUICloudDriveCellularSwitchSpecifier

- (PSUICloudDriveCellularSwitchSpecifier)initWithAppleAccountStore:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PSUICloudDriveCellularSwitchSpecifier *v9;
  objc_super v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CLOUD_DRIVE_CELLULAR"), &stru_24D5028C8, CFSTR("Cellular"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PSUICloudDriveCellularSwitchSpecifier;
  v9 = -[PSAppDataUsagePolicySwitchSpecifier initWithBundleID:displayName:statisticsCache:](&v11, sel_initWithBundleID_displayName_statisticsCache_, CFSTR("com.apple.preferences.settings.cellular.per-app_usage.cache.clouddrive"), v7, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_accountStore, a3);

  return v9;
}

- (BOOL)shouldShowCloudDrive
{
  void *v2;
  char v3;

  -[PSUICloudDriveCellularSwitchSpecifier appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabledForDataclass:", *MEMORY[0x24BDB4668]);

  return v3;
}

- (id)cloudDriveGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CDSCellular"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);

  return v2;
}

- (id)appleAccount
{
  return (id)-[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
}

- (id)cellularUsagePolicy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE85688], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "isGlobalDataModificationRestricted") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICloudDriveCellularSwitchSpecifier setProperty:forKey:](self, "setProperty:forKey:", v5, *MEMORY[0x24BE75A18]);

  -[PSUICloudDriveCellularSwitchSpecifier appleAccount](self, "appleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "aa_useCellularForDataclass:", *MEMORY[0x24BDB4668]))
  {
    -[PSUICloudDriveCellularSwitchSpecifier appleAccount](self, "appleAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "aa_useCellularForDataclass:", *MEMORY[0x24BDB45D0]);

  }
  else
  {
    v8 = 0;
  }

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  ACAccountStore *accountStore;
  int v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  char v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICloudDriveCellularSwitchSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[PSUICloudDriveCellularSwitchSpecifier setCellularUsagePolicy:]";
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s setting: %@", buf, 0x16u);
  }

  -[PSUICloudDriveCellularSwitchSpecifier appleAccount](self, "appleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "BOOLValue");
  objc_msgSend(v6, "aa_setUseCellular:forDataclass:", v7, *MEMORY[0x24BDB4668]);
  v8 = objc_msgSend(v4, "BOOLValue");
  objc_msgSend(v6, "aa_setUseCellular:forDataclass:", v8, *MEMORY[0x24BDB45D0]);
  accountStore = self->_accountStore;
  v16 = 0;
  v10 = -[ACAccountStore saveVerifiedAccount:error:](accountStore, "saveVerifiedAccount:error:", v6, &v16);
  v11 = v16;
  -[PSUICloudDriveCellularSwitchSpecifier getLogger](self, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[PSUICloudDriveCellularSwitchSpecifier setCellularUsagePolicy:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s set succeeded: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[PSUICloudDriveCellularSwitchSpecifier setCellularUsagePolicy:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s set failed: %@", buf, 0x16u);
    }

    objc_msgSend(v6, "reload");
    -[PSAppCellularUsageSpecifier delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[PSAppCellularUsageSpecifier delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject didFailToSetPolicyForSpecifier:](v12, "didFailToSetPolicyForSpecifier:", self);
    }
    else
    {
      -[PSUICloudDriveCellularSwitchSpecifier getLogger](self, "getLogger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2161C6000, v12, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", buf, 2u);
      }
    }
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CloudDriveCellularSwitch"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
