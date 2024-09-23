@implementation STUsageSummaryTableViewCellProvider

+ (id)usageSummaryTableViewCellForUserDSID:(id)a3
{
  id v3;
  STUsageSummaryTableViewCellProvider *v4;
  void *v5;

  v3 = a3;
  v4 = -[STUsageSummaryTableViewCellProvider initWithUserDSID:]([STUsageSummaryTableViewCellProvider alloc], "initWithUserDSID:", v3);

  -[STUsageSummaryTableViewCellProvider usageSummaryTableViewCellForUser](v4, "usageSummaryTableViewCellForUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (STUsageSummaryTableViewCellProvider)initWithUserDSID:(id)a3
{
  id v5;
  STUsageSummaryTableViewCellProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  STRootViewModelCoordinator *v10;
  STRootViewModelCoordinator *rootCoordinator;
  uint64_t v12;
  _TtC20ScreenTimeSettingsUI34STUsageDetailsSelectionObservation *usageDetailsSelectionObservation;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STUsageSummaryTableViewCellProvider;
  v6 = -[STUsageSummaryTableViewCellProvider init](&v18, sel_init);
  objc_storeStrong((id *)&v6->_userDSID, a3);
  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceIdentifierForChildUserDSID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "usageReportTypeForChildUserDSID:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:]([STRootViewModelCoordinator alloc], "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", v5, v8, v9, 0);
  rootCoordinator = v6->_rootCoordinator;
  v6->_rootCoordinator = v10;

  objc_initWeak(&location, v6);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__STUsageSummaryTableViewCellProvider_initWithUserDSID___block_invoke;
  v15[3] = &unk_24DB87320;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "observeDeviceIdentifierChangesForChildUserDSID:onChange:", v5, v15);
  v12 = objc_claimAutoreleasedReturnValue();
  usageDetailsSelectionObservation = v6->_usageDetailsSelectionObservation;
  v6->_usageDetailsSelectionObservation = (_TtC20ScreenTimeSettingsUI34STUsageDetailsSelectionObservation *)v12;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __56__STUsageSummaryTableViewCellProvider_initWithUserDSID___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_deviceIdentifierDidChangeTo:", v3);

}

- (void)_deviceIdentifierDidChangeTo:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[STUsageSummaryTableViewCellProvider legacyUsageCell](self, "legacyUsageCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke;
    v6[3] = &unk_24DB86588;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

void __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "usageCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedDeviceIdentifier:", v2);

  objc_msgSend(*(id *)(a1 + 32), "usageCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2;
  v5[3] = &unk_24DB866E0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "loadViewModelWithCompletionHandler:", v5);

}

void __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE845E0], "usage");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "legacyUsageCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "usageCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:", v12);

  }
}

- (BOOL)shouldShowUsageSummaryForUser
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[STUsageSummaryTableViewCellProvider rootCoordinator](self, "rootCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasWatchOSDevicesOnly") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[STUsageSummaryTableViewCellProvider rootCoordinator](self, "rootCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isScreenTimeEnabled");

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[STUsageSummaryTableViewCellProvider shouldShowUsageSummaryForUser].cold.1(v5);
  return v5;
}

- (id)usageSummaryTableViewCellForUser
{
  STOverallUsageSummaryCell *v3;

  v3 = -[STOverallUsageSummaryCell initWithStyle:reuseIdentifier:specifier:]([STOverallUsageSummaryCell alloc], "initWithStyle:reuseIdentifier:specifier:", 1, CFSTR("STLegacyOverallUsageSummaryCell"), 0);
  -[STUsageSummaryTableViewCellProvider setLegacyUsageCell:](self, "setLegacyUsageCell:", v3);

  -[STUsageSummaryTableViewCellProvider refresh](self, "refresh");
  _os_feature_enabled_impl();
  return -[STUsageSummaryTableViewCellProvider legacyUsageCell](self, "legacyUsageCell");
}

- (void)refresh
{
  void *v3;
  _QWORD block[5];

  -[STUsageSummaryTableViewCellProvider legacyUsageCell](self, "legacyUsageCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke;
    block[3] = &unk_24DB86440;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "usageCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2;
  v3[3] = &unk_24DB866E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "loadViewModelWithCompletionHandler:", v3);

}

void __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "usageCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "refreshUsageData");

    objc_msgSend(*(id *)(a1 + 32), "legacyUsageCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "usageCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:", v13);

  }
}

- (STUsageDetailsViewModelCoordinator)usageCoordinator
{
  void *v2;
  void *v3;

  -[STUsageSummaryTableViewCellProvider rootCoordinator](self, "rootCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "usageDetailsCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STUsageDetailsViewModelCoordinator *)v3;
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (STOverallUsageSummaryCell)legacyUsageCell
{
  return self->_legacyUsageCell;
}

- (void)setLegacyUsageCell:(id)a3
{
  objc_storeStrong((id *)&self->_legacyUsageCell, a3);
}

- (STRootViewModelCoordinator)rootCoordinator
{
  return self->_rootCoordinator;
}

- (void)setRootCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_rootCoordinator, a3);
}

- (_TtC20ScreenTimeSettingsUI34STUsageDetailsSelectionObservation)usageDetailsSelectionObservation
{
  return self->_usageDetailsSelectionObservation;
}

- (void)setUsageDetailsSelectionObservation:(id)a3
{
  objc_storeStrong((id *)&self->_usageDetailsSelectionObservation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageDetailsSelectionObservation, 0);
  objc_storeStrong((id *)&self->_rootCoordinator, 0);
  objc_storeStrong((id *)&self->_legacyUsageCell, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
}

void __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, a2, a3, "On device identifier change, error loading view model : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)shouldShowUsageSummaryForUser
{
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("No");
  if ((a1 & 1) != 0)
    v1 = CFSTR("Yes");
  v2 = 138412290;
  v3 = v1;
  _os_log_debug_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Should show usage summary cell: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "Error loading for STOverallUsageSummaryCell: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
