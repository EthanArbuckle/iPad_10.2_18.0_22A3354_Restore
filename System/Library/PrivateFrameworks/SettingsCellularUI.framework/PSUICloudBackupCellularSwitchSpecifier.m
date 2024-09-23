@implementation PSUICloudBackupCellularSwitchSpecifier

- (PSUICloudBackupCellularSwitchSpecifier)initWithAppleAccountStore:(id)a3 backupManagerWrapper:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PSUICloudBackupCellularSwitchSpecifier *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CLOUD_BACKUP_CELLULAR"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)PSUICloudBackupCellularSwitchSpecifier;
  v12 = -[PSAppDataUsagePolicySwitchSpecifier initWithBundleID:displayName:statisticsCache:](&v14, sel_initWithBundleID_displayName_statisticsCache_, CFSTR("com.apple.preferences.settings.cellular.per-app_usage.cache.cloudBackup"), v10, v11);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountStore, a3);
    objc_storeStrong((id *)&v12->_backupManagerWrapper, a4);
  }

  return v12;
}

- (BOOL)shouldShowCloudBackupCarrier
{
  PSUIMBManagerWrapper *backupManagerWrapper;
  void *v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  backupManagerWrapper = self->_backupManagerWrapper;
  -[PSUICloudBackupCellularSwitchSpecifier appleAccount](self, "appleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = -[PSUIMBManagerWrapper backupOnCellularSupportWithAccount:error:](backupManagerWrapper, "backupOnCellularSupportWithAccount:error:", v4, &v9);
  v6 = v9;

  if (v6)
  {
    -[PSUICloudBackupCellularSwitchSpecifier getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch BackupOnCellularSupport: %@", buf, 0xCu);
    }

    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = ((v5 >> 1) & 1);
  }

  return (char)v7;
}

- (id)cloudBackupGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BackupOnCellular"));
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
  PSUIMBManagerWrapper *backupManagerWrapper;
  uint64_t v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  backupManagerWrapper = self->_backupManagerWrapper;
  v10 = 0;
  v4 = -[PSUIMBManagerWrapper isBackupOnCellularEnabledWithError:](backupManagerWrapper, "isBackupOnCellularEnabledWithError:", &v10);
  v5 = v10;
  -[PSUICloudBackupCellularSwitchSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch BackupOnCellularEnabled: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v12) = v4;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Cellular usage for BackupOnCellularEnabled: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v4;
  NSObject *v5;
  PSUIMBManagerWrapper *backupManagerWrapper;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICloudBackupCellularSwitchSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting BackupOnCellularEnabled: %@", buf, 0xCu);
  }

  backupManagerWrapper = self->_backupManagerWrapper;
  v13 = 0;
  v7 = -[PSUIMBManagerWrapper setBackupOnCellularEnabled:error:](backupManagerWrapper, "setBackupOnCellularEnabled:error:", objc_msgSend(v4, "BOOLValue"), &v13);
  v8 = v13;
  -[PSUICloudBackupCellularSwitchSpecifier getLogger](self, "getLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "setBackupOnCellularEnabled succeeded: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v8;
      _os_log_error_impl(&dword_2161C6000, v10, OS_LOG_TYPE_ERROR, "setBackupOnCellularEnabled failed: %@: %@", buf, 0x16u);
    }

    -[PSAppCellularUsageSpecifier delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[PSAppCellularUsageSpecifier delegate](self, "delegate");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject didFailToSetPolicyForSpecifier:](v10, "didFailToSetPolicyForSpecifier:", self);
    }
    else
    {
      -[PSUICloudBackupCellularSwitchSpecifier getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2161C6000, v10, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", buf, 2u);
      }
    }
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CloudBackupSwitch"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManagerWrapper, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
