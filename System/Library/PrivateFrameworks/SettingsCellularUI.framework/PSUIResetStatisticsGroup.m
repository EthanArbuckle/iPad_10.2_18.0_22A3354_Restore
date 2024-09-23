@implementation PSUIResetStatisticsGroup

- (PSUIResetStatisticsGroup)initWithDataCache:(id)a3 callHistoryManager:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PSUIResetStatisticsGroup *v12;
  PSUIResetStatisticsGroup *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSUIResetStatisticsGroup;
  v12 = -[PSUIResetStatisticsGroup init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataCache, a3);
    objc_storeStrong((id *)&v13->_callHistoryManager, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    -[PSUIResetStatisticsGroup createSpecifiers](v13, "createSpecifiers");
    -[PSUIResetStatisticsGroup _updateFooterText](v13, "_updateFooterText");
  }

  return v13;
}

- (void)createSpecifiers
{
  PSSpecifier *v3;
  PSSpecifier *groupSpecifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;
  PSSpecifier *enableStatisticsSpecifier;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  PSConfirmationSpecifier *v16;
  PSConfirmationSpecifier *resetButtonSpecifier;
  PSConfirmationSpecifier *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CELLULAR_USAGE_STATISTICS"));
  v3 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  groupSpecifier = self->_groupSpecifier;
  self->_groupSpecifier = v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CELLULAR_USAGE_STATISTICS"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setName:](self->_groupSpecifier, "setName:", v6);

  v7 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ENABLE_CELLULAR_STATISTICS"), &stru_24D5028C8, CFSTR("Cellular"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setStatsEnabled_specifier_, sel_statsEnabled_, 0, 6, 0);
  v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  enableStatisticsSpecifier = self->_enableStatisticsSpecifier;
  self->_enableStatisticsSpecifier = v10;

  v12 = MEMORY[0x24BDBD1C8];
  -[PSSpecifier setProperty:forKey:](self->_enableStatisticsSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v13 = (void *)MEMORY[0x24BE754D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Reset Statistics"), &stru_24D5028C8, CFSTR("Cellular"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, 0);
  v16 = (PSConfirmationSpecifier *)objc_claimAutoreleasedReturnValue();
  resetButtonSpecifier = self->_resetButtonSpecifier;
  self->_resetButtonSpecifier = v16;

  -[PSConfirmationSpecifier setConfirmationAction:](self->_resetButtonSpecifier, "setConfirmationAction:", sel_clearStatsPressed_);
  v18 = self->_resetButtonSpecifier;
  -[PSUIResetStatisticsGroup _createResetConfirmationAlertDict](self, "_createResetConfirmationAlertDict");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSConfirmationSpecifier setupWithDictionary:](v18, "setupWithDictionary:", v19);

  -[PSConfirmationSpecifier setProperty:forKey:](self->_resetButtonSpecifier, "setProperty:forKey:", v12, *MEMORY[0x24BE75978]);
}

- (id)_createResetConfirmationAlertDict
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RESET_STATISTICS_CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x24BE75970]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RESET_STATISTICS_OK"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, *MEMORY[0x24BE75980]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RESET_STATISTICS_MSG"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, *MEMORY[0x24BE75988]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RESET_STATISTICS_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, *MEMORY[0x24BE75990]);

  return v2;
}

- (id)specifiers
{
  __int128 v3;
  PSConfirmationSpecifier *resetButtonSpecifier;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)&self->_groupSpecifier;
  resetButtonSpecifier = self->_resetButtonSpecifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lastUpdateDate
{
  return -[PSUICoreTelephonyDataCache copyStartDateOfCellularDataUsageRecords](self->_dataCache, "copyStartDateOfCellularDataUsageRecords");
}

- (void)_updateFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ENABLE_STATISTICS_EXPLANATION"), &stru_24D5028C8, CFSTR("Cellular"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIResetStatisticsGroup _lastUpdateDate](self, "_lastUpdateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v5, 2, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LAST"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", v8, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LAST"), &stru_24D5028C8, CFSTR("Cellular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NEVER"), &stru_24D5028C8, CFSTR("Cellular"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", v7, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }

  -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", v10, *MEMORY[0x24BE75A68]);
}

- (void)setStatsEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  PSUICoreTelephonyDataCache *dataCache;
  _QWORD v10[4];
  id v11;
  char v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  location = 0;
  objc_initWeak(&location, self);
  dataCache = self->_dataCache;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__PSUIResetStatisticsGroup_setStatsEnabled_specifier___block_invoke;
  v10[3] = &unk_24D501CC0;
  objc_copyWeak(&v11, &location);
  v12 = v8;
  -[PSUICoreTelephonyDataCache setCellularUsageStatisticsEnabled:completion:](dataCache, "setCellularUsageStatisticsEnabled:completion:", v8, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __54__PSUIResetStatisticsGroup_setStatsEnabled_specifier___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t v9[16];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyStatisticsSetting");

    if (!*(_BYTE *)(a1 + 40))
    {
      v6 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Successfully disabled cellular usage statistics, resetting statistics", v9, 2u);
      }

      v8 = objc_loadWeakRetained(v2);
      objc_msgSend(v8, "clearStats");

    }
  }
}

- (id)statsEnabled:(id)a3
{
  _BOOL8 v3;

  v3 = -[PSUICoreTelephonyDataCache isCellularUsageStatisticsEnabled](self->_dataCache, "isCellularUsageStatisticsEnabled", a3);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
}

- (void)clearStatsPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PSUIResetStatisticsGroup getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Reset Statistics button pressed", v6, 2u);
  }

  -[PSUIResetStatisticsGroup clearStats](self, "clearStats");
  -[PSUIResetStatisticsGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didResetStatistics");

}

- (void)clearStats
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[PSUIResetStatisticsGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Reset Statistics button pressed, clearing voice usage", buf, 2u);
  }

  -[PSUIResetStatisticsGroup callHistoryManager](self, "callHistoryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callTimersReset");

  -[PSUIResetStatisticsGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Clearing data usage", v8, 2u);
  }

  -[PSUICoreTelephonyDataCache eraseCellularDataUsageRecords](self->_dataCache, "eraseCellularDataUsageRecords");
  v6 = WiFiManagerClientCreate();
  if (v6)
  {
    v7 = (const void *)v6;
    WiFiManagerClientSetProperty();
    CFRelease(v7);
  }
  -[PSUIResetStatisticsGroup _updateFooterText](self, "_updateFooterText");
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("ResetStatisticsGroup"));
}

- (PSUIResetStatisticsGroupDelegate)delegate
{
  return (PSUIResetStatisticsGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_dataCache, a3);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (PSSpecifier)enableStatisticsSpecifier
{
  return self->_enableStatisticsSpecifier;
}

- (void)setEnableStatisticsSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_enableStatisticsSpecifier, a3);
}

- (PSConfirmationSpecifier)resetButtonSpecifier
{
  return self->_resetButtonSpecifier;
}

- (void)setResetButtonSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_resetButtonSpecifier, a3);
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_callHistoryManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_resetButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_enableStatisticsSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
